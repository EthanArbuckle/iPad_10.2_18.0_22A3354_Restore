@implementation CinematicFramingDirector

- (CinematicFramingDirector)initWithFramingSpaceManager:(id)a3
{
  id v5;
  CinematicFramingDirector *v6;
  CinematicFramingDirector *v7;
  CinematicTracker *v8;
  CinematicTracker *tracker;
  RectangleAnimator *v10;
  RectangleAnimator *rectangleAnimator;
  SceneFramingEngine *v12;
  SceneFramingEngine *sceneFramingEngine;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CinematicFramingDirector;
  v6 = -[CinematicFramingDirector init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_framingSpaceManager, a3);
    v8 = objc_alloc_init(CinematicTracker);
    tracker = v7->_tracker;
    v7->_tracker = v8;

    v10 = -[RectangleAnimator initWithFramingSpaceManager:]([RectangleAnimator alloc], "initWithFramingSpaceManager:", v5);
    rectangleAnimator = v7->_rectangleAnimator;
    v7->_rectangleAnimator = v10;

    v12 = -[SceneFramingEngine initWithFramingSpaceManager:]([SceneFramingEngine alloc], "initWithFramingSpaceManager:", v5);
    sceneFramingEngine = v7->_sceneFramingEngine;
    v7->_sceneFramingEngine = v12;

  }
  return v7;
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_options, a3);
  v5 = a3;
  -[CinematicTracker setOptions:](self->_tracker, "setOptions:", v5);
  -[RectangleAnimator setOptions:](self->_rectangleAnimator, "setOptions:", v5);
  -[SceneFramingEngine setOptions:](self->_sceneFramingEngine, "setOptions:", v5);

}

- (void)updateWithMetadata:(id)a3
{
  id v4;
  CinematicTracker *tracker;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  CGSize size;
  RectangleAnimator *rectangleAnimator;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _QWORD v16[3];
  _QWORD v17[3];
  CGRect v18;

  v4 = a3;
  tracker = self->_tracker;
  objc_msgSend(v4, "faceDetections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyDetections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "timestamp");
  else
    memset(v17, 0, sizeof(v17));
  -[CinematicTracker processFaceDetections:bodyDetections:atTime:inView:](tracker, "processFaceDetections:bodyDetections:atTime:inView:", v6, v7, v17, self->_targetViewport.origin.x, self->_targetViewport.origin.y, self->_targetViewport.size.width, self->_targetViewport.size.height);

  -[CinematicFramingDirector computeSceneFramingForMetadata:](self, "computeSceneFramingForMetadata:", v4);
  -[CinematicFramingDirector options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldDisableTransitions");

  if (v9)
  {
    size = self->_targetViewport.size;
    self->_currentViewport.origin = self->_targetViewport.origin;
    self->_currentViewport.size = size;
  }
  else
  {
    -[RectangleAnimator rectangle](self->_rectangleAnimator, "rectangle");
    CGRectIsNull(v18);
    rectangleAnimator = self->_rectangleAnimator;
    if (v4)
      objc_msgSend(v4, "timestamp");
    else
      memset(v16, 0, sizeof(v16));
    -[RectangleAnimator driveAnimationToTarget:atTime:](rectangleAnimator, "driveAnimationToTarget:atTime:", v16, self->_targetViewport.origin.x, self->_targetViewport.origin.y, self->_targetViewport.size.width, self->_targetViewport.size.height);
    self->_currentViewport.origin.x = v12;
    self->_currentViewport.origin.y = v13;
    self->_currentViewport.size.width = v14;
    self->_currentViewport.size.height = v15;
  }

}

- (void)resetCameraViewport:(CGRect)a3
{
  -[RectangleAnimator resetToRectangle:](self->_rectangleAnimator, "resetToRectangle:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SceneFramingEngine reset](self->_sceneFramingEngine, "reset");
}

- (void)reset
{
  RectangleAnimator *rectangleAnimator;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;

  -[SceneFramingEngine reset](self->_sceneFramingEngine, "reset");
  rectangleAnimator = self->_rectangleAnimator;
  -[SceneFramingEngine defaultViewport](self->_sceneFramingEngine, "defaultViewport");
  -[RectangleAnimator resetToRectangle:](rectangleAnimator, "resetToRectangle:");
  -[SceneFramingEngine defaultViewport](self->_sceneFramingEngine, "defaultViewport");
  self->_currentViewport.origin.x = v4;
  self->_currentViewport.origin.y = v5;
  self->_currentViewport.size.width = v6;
  self->_currentViewport.size.height = v7;
  -[SceneFramingEngine defaultViewport](self->_sceneFramingEngine, "defaultViewport");
  self->_targetViewport.origin.x = v8;
  self->_targetViewport.origin.y = v9;
  self->_targetViewport.size.width = v10;
  self->_targetViewport.size.height = v11;
}

- (int)framingStyle
{
  return -[SceneFramingEngine framingStyle](self->_sceneFramingEngine, "framingStyle");
}

- (void)setFramingStyle:(int)a3
{
  -[SceneFramingEngine setFramingStyle:](self->_sceneFramingEngine, "setFramingStyle:", *(_QWORD *)&a3);
}

- (CGRect)idealViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SceneFramingEngine idealViewport](self->_sceneFramingEngine, "idealViewport");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)slackViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SceneFramingEngine slackViewport](self->_sceneFramingEngine, "slackViewport");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)deadband
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SceneFramingEngine deadband](self->_sceneFramingEngine, "deadband");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)zoomLevel
{
  return self->_currentViewport.size.width;
}

- (void)setZoomLevel:(float)a3
{
  self->_currentViewport.size.width = a3;
  self->_currentViewport.size.height = a3;
  -[RectangleAnimator resetToRectangle:](self->_rectangleAnimator, "resetToRectangle:", self->_currentViewport.origin.x, self->_currentViewport.origin.y, a3, a3);
}

- (void)computeSceneFramingForMetadata:(id)a3
{
  id v4;
  void *v5;
  FramingSpaceManager *framingSpaceManager;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CinematicFramingSessionOptions *options;
  id v16;
  FramingSpaceManager *v17;
  id v18;
  void *v19;
  unint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  float v24;
  float v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat y;
  CGFloat v33;
  CGFloat v34;
  double v35;
  float v36;
  double v37;
  float v38;
  int v39;
  int v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double MinX;
  double v46;
  double v47;
  float v48;
  double MinY;
  float v50;
  double MaxY;
  double v52;
  double v53;
  float v54;
  CGFloat v55;
  CGFloat MidX;
  float v57;
  float v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  SceneFramingEngine *sceneFramingEngine;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CinematicFramingSessionOptions *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  float v73;
  float rect;
  double rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat x;
  double v79;
  double v80;
  CGFloat height;
  CGFloat width;
  _QWORD v83[3];
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  _QWORD v88[8];
  __int128 v89;
  uint64_t v90;
  CGPoint v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  v4 = a3;
  -[CinematicTracker tracks](self->_tracker, "tracks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  framingSpaceManager = self->_framingSpaceManager;
  -[RectangleAnimator rectangle](self->_rectangleAnimator, "rectangle");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v4)
  {
    objc_msgSend(v4, "timestamp");
  }
  else
  {
    v84 = 0uLL;
    v85 = 0;
  }
  options = self->_options;
  v16 = v5;
  v17 = framingSpaceManager;
  v68 = options;
  if (objc_msgSend(v16, "count")
    && (v92.origin.x = v8, v92.origin.y = v10, v92.size.width = v12, v92.size.height = v14, !CGRectIsNull(v92)))
  {
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __filterTracksThatCanFitInView_block_invoke;
    v88[3] = &__block_descriptor_88_e11_q24__0_8_16l;
    v89 = v84;
    v90 = v85;
    *(CGFloat *)&v88[4] = v8;
    *(CGFloat *)&v88[5] = v10;
    *(CGFloat *)&v88[6] = v12;
    *(CGFloat *)&v88[7] = v14;
    objc_msgSend(v16, "sortedArrayUsingComparator:", v88);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
    if (objc_msgSend(v19, "count"))
    {
      v20 = 0;
      v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      rect_16 = *MEMORY[0x1E0C9D628];
      v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v23 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v24 = 0.9;
      v25 = 0.75;
      do
      {
        v79 = v21;
        v80 = v23;
        objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v84;
        v87 = v85;
        objc_msgSend(v26, "faceBoundingBoxForFramingAtTime:", &v86);
        v107.origin.x = v27;
        v107.origin.y = v28;
        v107.size.width = v29;
        v107.size.height = v30;
        v93.origin.x = rect_16;
        v93.origin.y = v21;
        v93.size.width = v22;
        v93.size.height = v23;
        rect_24 = v107.origin.y;
        x = v107.origin.x;
        height = v107.size.height;
        width = v107.size.width;
        v94 = CGRectUnion(v93, v107);
        v31 = v94.origin.x;
        y = v94.origin.y;
        v33 = v94.size.width;
        v34 = v94.size.height;
        v35 = v22;
        v36 = v24;
        if (!objc_msgSend(v26, "isTrackedByDirector"))
          v24 = v25;
        v95.origin.x = v31;
        v95.origin.y = y;
        v95.size.width = v33;
        v95.size.height = v34;
        v37 = CGRectGetWidth(v95);
        -[FramingSpaceManager maxAllowedViewportWidth](v17, "maxAllowedViewportWidth");
        if (v37 <= (float)(v24 * v38))
        {
          v70 = v34;
          v71 = v33;
          v72 = y;
          v69 = v31;
          v39 = objc_msgSend(v26, "isTrackedByDirector");
          v40 = objc_msgSend(v26, "isTrackedByDirector");
          -[FramingSpaceManager framingSpaceBounds](v17, "framingSpaceBounds");
          v41 = v96.origin.x;
          v42 = v96.origin.y;
          v43 = v96.size.width;
          v44 = v96.size.height;
          MinX = CGRectGetMinX(v96);
          v97.origin.x = v41;
          v97.origin.y = v42;
          v97.size.width = v43;
          v97.size.height = v44;
          v46 = CGRectGetWidth(v97);
          v47 = 0.100000001;
          if (v39)
            v47 = 0.0500000007;
          rect_8 = v47;
          v48 = MinX + v46 * v47;
          rect = v48;
          v98.origin.x = v41;
          v98.origin.y = v42;
          v98.size.width = v43;
          v98.size.height = v44;
          MinY = CGRectGetMinY(v98);
          v99.origin.x = x;
          v99.origin.y = rect_24;
          v99.size.height = height;
          v99.size.width = width;
          v50 = fmin(MinY, CGRectGetMinY(v99));
          v73 = v50;
          v100.origin.x = v41;
          v100.origin.y = v42;
          v100.size.width = v43;
          v100.size.height = v44;
          MaxY = CGRectGetMaxY(v100);
          v101.origin.x = v41;
          v101.origin.y = v42;
          v101.size.width = v43;
          v101.size.height = v44;
          v52 = CGRectGetHeight(v101);
          v53 = 0.0199999996;
          if (!v40)
            v53 = 0.0500000007;
          v54 = MaxY - v52 * v53 - v73;
          v102.origin.x = v41;
          v102.origin.y = v42;
          v102.size.width = v43;
          v102.size.height = v44;
          v55 = (rect_8 * -2.0 + 1.0) * CGRectGetWidth(v102);
          v103.origin.x = x;
          v103.origin.y = rect_24;
          v103.size.width = width;
          v103.size.height = height;
          MidX = CGRectGetMidX(v103);
          v104.origin.x = x;
          v104.origin.y = rect_24;
          v104.size.width = width;
          v104.size.height = height;
          v91.y = CGRectGetMidY(v104);
          v105.origin.x = rect;
          v105.origin.y = v73;
          v105.size.width = v55;
          v105.size.height = v54;
          v91.x = MidX;
          if (CGRectContainsPoint(v105, v91))
          {
            if (objc_msgSend(v26, "isTrackedByDirector"))
              -[CinematicFramingSessionOptions tinyHeadMinValue](v68, "tinyHeadMinValue");
            else
              -[CinematicFramingSessionOptions tinyHeadMaxValue](v68, "tinyHeadMaxValue");
            v58 = v57;
            v23 = v80;
            v21 = v72;
            v22 = v35;
            v86 = v84;
            v87 = v85;
            objc_msgSend(v26, "faceBoundingBoxForFramingAtTime:", &v86);
            if (CGRectGetWidth(v106) >= v58)
            {
              objc_msgSend(v26, "setIsTrackedByDirector:", 1);
              objc_msgSend(v18, "addObject:", v26);
              v23 = v70;
              v22 = v71;
              rect_16 = v69;
              v24 = 0.9;
              v25 = 0.75;
            }
            else
            {
              objc_msgSend(v26, "setIsTrackedByDirector:", 0);
              v24 = 0.9;
              v25 = 0.75;
              v21 = v79;
            }
          }
          else
          {
            objc_msgSend(v26, "setIsTrackedByDirector:", 0);
            v24 = 0.9;
            v25 = 0.75;
            v21 = v79;
            v23 = v80;
            v22 = v35;
          }
        }
        else
        {
          objc_msgSend(v26, "setIsTrackedByDirector:", 0);
          v24 = v36;
          v25 = 0.75;
          v22 = v35;
          v21 = v79;
          v23 = v80;
        }

        ++v20;
      }
      while (v20 < objc_msgSend(v19, "count"));
    }

  }
  else
  {
    v18 = v16;
  }

  v59 = objc_msgSend(v18, "count");
  -[CinematicFramingDirector options](self, "options");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v59 <= 1)
    objc_msgSend(v60, "singlePersonFramingParameters");
  else
    objc_msgSend(v60, "multiPersonFramingParameters");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  -[SceneFramingEngine setActiveFramingParameters:](self->_sceneFramingEngine, "setActiveFramingParameters:", v62);
  sceneFramingEngine = self->_sceneFramingEngine;
  if (v4)
    objc_msgSend(v4, "timestamp");
  else
    memset(v83, 0, sizeof(v83));
  -[SceneFramingEngine updateTargetViewportWithTracks:currentViewport:atTime:](sceneFramingEngine, "updateTargetViewportWithTracks:currentViewport:atTime:", v18, v83, self->_currentViewport.origin.x, self->_currentViewport.origin.y, self->_currentViewport.size.width, self->_currentViewport.size.height);
  -[SceneFramingEngine targetViewport](self->_sceneFramingEngine, "targetViewport");
  self->_targetViewport.origin.x = v64;
  self->_targetViewport.origin.y = v65;
  self->_targetViewport.size.width = v66;
  self->_targetViewport.size.height = v67;

}

- (CGRect)currentViewport
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentViewport.origin.x;
  y = self->_currentViewport.origin.y;
  width = self->_currentViewport.size.width;
  height = self->_currentViewport.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)targetViewport
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetViewport.origin.x;
  y = self->_targetViewport.origin.y;
  width = self->_targetViewport.size.width;
  height = self->_targetViewport.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneFramingEngine, 0);
  objc_storeStrong((id *)&self->_rectangleAnimator, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_framingSpaceManager, 0);
}

@end
