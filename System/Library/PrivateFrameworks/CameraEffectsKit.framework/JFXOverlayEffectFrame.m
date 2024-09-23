@implementation JFXOverlayEffectFrame

+ (id)frameWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v13;
  double height;
  double width;
  id v17;
  id v18;
  void *v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;

  v9 = a9;
  v10 = a8;
  v11 = a7;
  v13 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v18 = objc_alloc((Class)a1);
  v21 = *a6;
  v19 = (void *)objc_msgSend(v18, "initWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v17, v13, &v21, v11, v10, v9, width, height);

  return v19;
}

- (JFXOverlayEffectFrame)initWithEffect:(id)a3 relativeToSize:(CGSize)a4 origin:(int)a5 time:(id *)a6 forcePosterFrame:(BOOL)a7 includeDropShadow:(BOOL)a8 includeTextFrames:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v13;
  double height;
  double width;
  id v17;
  JFXOverlayEffectFrame *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const CGPath *v24;
  CGPathRef path;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v27;
  objc_super v28;

  v9 = a9;
  v10 = a8;
  v11 = a7;
  v13 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v28.receiver = self;
  v28.super_class = (Class)JFXOverlayEffectFrame;
  v27 = *a6;
  v18 = -[JFXTextEffectFrame initWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](&v28, sel_initWithEffect_relativeToSize_origin_time_forcePosterFrame_includeDropShadow_includeTextFrames_, v17, v13, &v27, v11, v10, v9, width, height);
  if (v18)
  {
    objc_msgSend(v17, "renderEffect");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trackingProps");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v17, "trackingProps");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18->_trackingType = objc_msgSend(v21, "currentTrackingType");

    }
    else
    {
      v18->_trackingType = 0;
    }

    +[JFXOverlayEffectTransforms transformsWithEffect:](JFXOverlayEffectTransforms, "transformsWithEffect:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffectFrame setTransforms:](v18, "setTransforms:", v22);

    v27 = *a6;
    objc_msgSend(v17, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v27, v11, 1, 1, v13, 0.0, 0.0, width, height);
    -[JFXOverlayEffectFrame setOverlayCenter:](v18, "setOverlayCenter:");
    objc_msgSend(v17, "hitAreaScale");
    v27 = *a6;
    objc_msgSend(v19, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v27, v11, 0, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffectFrame setHitAreaPoints:](v18, "setHitAreaPoints:", v23);

    path = 0;
    v27 = *a6;
    v24 = (const CGPath *)objc_msgSend(v17, "newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:", &v27, v11, v13, 1, &path, 0.0, 0.0, width, height, 44.0 / width, 44.0 / height);
    -[JFXTextEffectFrame setHitAreaPath:](v18, "setHitAreaPath:", v24);
    -[JFXTextEffectFrame setExpandedHitAreaPath:](v18, "setExpandedHitAreaPath:", path);
    CGPathRelease(v24);
    CGPathRelease(path);

  }
  return v18;
}

- (BOOL)isTrackedButTrackingUnavailable
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[JFXOverlayEffectFrame trackingType](self, "trackingType"))
    return 0;
  -[JFXTextEffectFrame transforms](self, "transforms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceTrackingTransform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)JFXOverlayEffectFrame;
  -[JFXTextEffectFrame description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[JFXOverlayEffectFrame trackingType](self, "trackingType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\ntrackingType: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)trackingType
{
  return self->_trackingType;
}

- (void)setTrackingType:(int64_t)a3
{
  self->_trackingType = a3;
}

- (CGPoint)overlayCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_overlayCenter.x;
  y = self->_overlayCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOverlayCenter:(CGPoint)a3
{
  self->_overlayCenter = a3;
}

@end
