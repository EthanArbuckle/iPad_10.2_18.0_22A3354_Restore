@implementation BroadwayCardView

- (BroadwayCardView)initWithCoder:(id)a3
{
  BroadwayCardView *v3;
  void *v4;
  uint64_t v5;
  NSHashTable *animationObservers;
  SCNView *v7;
  SCNView *sceneView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSBundle *v25;
  void *v26;
  MTLLibrary *v27;
  id v28;
  MTLLibrary *library;
  void *v30;
  void *v31;
  MTLTexture *v32;
  MTLTexture *blackTexture;
  MTLTexture *v34;
  uint64_t v35;
  SCNMaterialProperty *videoMaterialProperty;
  _QWORD v38[3];
  int64x2_t v39;
  uint64_t v40;
  int v41;
  id v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)BroadwayCardView;
  v3 = -[BroadwayCardView initWithCoder:](&v43, "initWithCoder:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[BroadwayCardView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    animationObservers = v3->_animationObservers;
    v3->_animationObservers = (NSHashTable *)v5;

    v7 = (SCNView *)objc_msgSend(objc_alloc((Class)SCNView), "initWithFrame:options:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    sceneView = v3->_sceneView;
    v3->_sceneView = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SCNView setBackgroundColor:](v3->_sceneView, "setBackgroundColor:", v9);

    -[SCNView setAntialiasingMode:](v3->_sceneView, "setAntialiasingMode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView layer](v3->_sceneView, "layer"));
    objc_msgSend(v10, "setMinificationFilter:", kCAFilterTrilinear);

    -[SCNView setLoops:](v3->_sceneView, "setLoops:", 0);
    -[SCNView setRendersContinuously:](v3->_sceneView, "setRendersContinuously:", 1);
    -[SCNView setPreferredFramesPerSecond:](v3->_sceneView, "setPreferredFramesPerSecond:", 60);
    -[SCNView setDelegate:](v3->_sceneView, "setDelegate:", v3);
    -[BroadwayCardView addSubview:](v3, "addSubview:", v3->_sceneView);
    -[SCNView setTranslatesAutoresizingMaskIntoConstraints:](v3->_sceneView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView topAnchor](v3->_sceneView, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BroadwayCardView topAnchor](v3, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    objc_msgSend(v13, "setActive:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView bottomAnchor](v3->_sceneView, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BroadwayCardView bottomAnchor](v3, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    objc_msgSend(v16, "setActive:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView leadingAnchor](v3->_sceneView, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BroadwayCardView leadingAnchor](v3, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    objc_msgSend(v19, "setActive:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView trailingAnchor](v3->_sceneView, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BroadwayCardView trailingAnchor](v3, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    objc_msgSend(v22, "setActive:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView device](v3->_sceneView, "device"));
    v25 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3, v24));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v42 = 0;
    v27 = (MTLLibrary *)objc_msgSend(v23, "newDefaultLibraryWithBundle:error:", v26, &v42);
    v28 = v42;
    library = v3->_library;
    v3->_library = v27;

    if (!v3->_library
      && v28
      && dword_1001A8338 <= 90
      && (dword_1001A8338 != -1 || _LogCategory_Initialize(&dword_1001A8338, 90)))
    {
      LogPrintF(&dword_1001A8338, "-[BroadwayCardView initWithCoder:]", 90, "%s failed to load Metal library (%@)", "-[BroadwayCardView initWithCoder:]", v28);
    }
    v41 = 0x1000000;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, 1, 1, 0));
    objc_msgSend(v30, "setUsage:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView device](v3->_sceneView, "device"));
    v32 = (MTLTexture *)objc_msgSend(v31, "newTextureWithDescriptor:", v30);
    blackTexture = v3->_blackTexture;
    v3->_blackTexture = v32;

    v34 = v3->_blackTexture;
    memset(v38, 0, sizeof(v38));
    v39 = vdupq_n_s64(1uLL);
    v40 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](v34, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v38, 0, &v41, 4);
    v35 = objc_claimAutoreleasedReturnValue(+[SCNMaterialProperty materialPropertyWithContents:](SCNMaterialProperty, "materialPropertyWithContents:", v3->_blackTexture));
    videoMaterialProperty = v3->_videoMaterialProperty;
    v3->_videoMaterialProperty = (SCNMaterialProperty *)v35;

  }
  return v3;
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  -[SCNView setDelegate:](self->_sceneView, "setDelegate:", 0);
  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  v4.receiver = self;
  v4.super_class = (Class)BroadwayCardView;
  -[BroadwayCardView dealloc](&v4, "dealloc");
}

- (void)setVideoURL:(id)a3 sceneURL:(id)a4
{
  id v6;
  AVPlayer *v7;
  AVPlayer *videoPlayer;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  CMTime time;
  SCNSceneSourceLoadingOption v22;
  SCNSceneSourceAnimationImportPolicy v23;

  v6 = a4;
  v7 = (AVPlayer *)objc_claimAutoreleasedReturnValue(-[BroadwayCardView playerForMovieAtURL:pointsSize:nominalFrameRate:](self, "playerForMovieAtURL:pointsSize:nominalFrameRate:", a3, &self->_videoSizePoints, &self->_videoFrameRate));
  videoPlayer = self->_videoPlayer;
  self->_videoPlayer = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_videoPlayer, "currentItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asset"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "duration");
  else
    memset(&time, 0, sizeof(time));
  self->_videoDuration = CMTimeGetSeconds(&time);

  self->_videoFrameCount = (unint64_t)(self->_videoDuration * self->_videoFrameRate);
  -[BroadwayCardView configureVideo](self, "configureVideo");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.0);
  v22 = SCNSceneSourceAnimationImportPolicyKey;
  v23 = SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v20 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SCNScene sceneWithURL:options:error:](SCNScene, "sceneWithURL:options:error:", v6, v12, &v20));
  v14 = v20;

  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "background"));
    objc_msgSend(v15, "setContents:", 0);

    objc_msgSend(v13, "setAttribute:forKey:", &off_100183760, SCNSceneEndTimeAttributeKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_videoDuration));
    objc_msgSend(v13, "setAttribute:forKey:", v16, SCNSceneEndTimeAttributeKey);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rootNode"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000EBA84;
    v19[3] = &unk_10017D5C0;
    v19[4] = self;
    objc_msgSend(v17, "enumerateChildNodesUsingBlock:", v19);

    -[SCNView setScene:](self->_sceneView, "setScene:", v13);
    -[BroadwayCardView configureVideoGeometry](self, "configureVideoGeometry");
    +[SCNTransaction commit](SCNTransaction, "commit");
  }
  else if (dword_1001A8338 <= 90
         && (dword_1001A8338 != -1 || _LogCategory_Initialize(&dword_1001A8338, 90)))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    LogPrintF(&dword_1001A8338, "-[BroadwayCardView setVideoURL:sceneURL:]", 90, "%s failed to load SceneKit scene from %@ (%@)", "-[BroadwayCardView setVideoURL:sceneURL:]", v18, v14);

  }
}

- (void)setModelContents:(id)a3
{
  objc_storeStrong((id *)&self->_modelContents, a3);
  -[BroadwayCardView configureModelGeometry](self, "configureModelGeometry");
}

- (void)setPaused:(BOOL)a3
{
  double v3;

  self->_paused = a3;
  LODWORD(v3) = 1.0;
  if (a3)
    *(float *)&v3 = 0.0;
  -[AVPlayer setRate:](self->_videoPlayer, "setRate:", v3);
}

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AVPlayerItemVideoOutput *videoOutput;
  unsigned int v12;
  float v13;
  double v14;
  const char *v15;
  AVPlayerItemVideoOutput *v16;
  __CVBuffer *v17;
  __CVBuffer *v18;
  size_t Height;
  id Texture;
  void *v21;
  CMTime time;
  CMTime v23[2];

  v6 = a3;
  v7 = v6;
  if (!self->_textureCache)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
    CVMetalTextureCacheCreate(0, 0, v8, 0, &self->_textureCache);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_videoPlayer, "currentItem"));
  v10 = v9;
  memset(&v23[1], 0, sizeof(CMTime));
  if (v9)
    objc_msgSend(v9, "currentTime");
  videoOutput = self->_videoOutput;
  v23[0] = v23[1];
  v12 = -[AVPlayerItemVideoOutput hasNewPixelBufferForItemTime:](videoOutput, "hasNewPixelBufferForItemTime:", v23);
  if (dword_1001A8338 <= 10 && (dword_1001A8338 != -1 || _LogCategory_Initialize(&dword_1001A8338, 10)))
  {
    v13 = a4;
    v14 = v13;
    v15 = "no";
    if (v12)
      v15 = "yes";
    LogPrintF(&dword_1001A8338, "-[BroadwayCardView renderer:updateAtTime:]", 10, "%s time:%f, hasNewPixelBuffer:%s", "-[BroadwayCardView renderer:updateAtTime:]", v14, v15);
  }
  if (v12)
  {
    v23[0] = kCMTimeInvalid;
    v16 = self->_videoOutput;
    time = v23[1];
    v17 = -[AVPlayerItemVideoOutput copyPixelBufferForItemTime:itemTimeForDisplay:](v16, "copyPixelBufferForItemTime:itemTimeForDisplay:", &time, v23);
    if (v17)
    {
      v18 = v17;
      self->_textureWidth = CVPixelBufferGetWidth(v17);
      Height = CVPixelBufferGetHeight(v18);
      self->_textureHeight = Height;
      if (!CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, self->_textureCache, v18, 0, MTLPixelFormatBGRA8Unorm_sRGB, self->_textureWidth, Height, 0, &self->_texture))
      {
        Texture = CVMetalTextureGetTexture(self->_texture);
        v21 = (void *)objc_claimAutoreleasedReturnValue(Texture);
        if (v21)
        {
          -[SCNMaterialProperty setContents:](self->_videoMaterialProperty, "setContents:", v21);
          time = v23[0];
          self->_videoCurrentFrame = (unint64_t)(CMTimeGetSeconds(&time) * self->_videoFrameRate);
          objc_msgSend(v7, "setSceneTime:");
        }

      }
      CFRelease(v18);
    }
  }

}

- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  SCNView *v7;
  id v8;
  SCNView *sceneView;
  SCNView *v10;
  SCNView *v11;
  void *v12;
  void *v13;
  __CVBuffer *texture;
  _QWORD v15[5];

  v7 = (SCNView *)a3;
  v8 = a4;
  sceneView = self->_sceneView;
  if (sceneView == v7)
    v10 = (SCNView *)objc_claimAutoreleasedReturnValue(-[SCNView renderer](v7, "renderer"));
  else
    v10 = v7;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCNView currentCommandBuffer](v10, "currentCommandBuffer"));
  v13 = v12;
  texture = self->_texture;
  if (texture)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000EBA74;
    v15[3] = &unk_10017D5E0;
    v15[4] = texture;
    objc_msgSend(v12, "addCompletedHandler:", v15);
    self->_texture = 0;
  }
  if (sceneView == v7)
    -[BroadwayCardView notifyObserversWithCommandBuffer:](self, "notifyObserversWithCommandBuffer:", v13);

}

- (void)addAnimationObserver:(id)a3
{
  -[NSHashTable addObject:](self->_animationObservers, "addObject:", a3);
}

- (void)removeAnimationObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_animationObservers, "removeObject:", a3);
}

- (void)notifyObserversWithCommandBuffer:(id)a3
{
  id v4;
  id v5;
  char v6;
  double v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  BroadwayCardView *v13;
  char v14;

  v4 = a3;
  v5 = -[NSHashTable copy](self->_animationObservers, "copy");
  if (!self->_didUpdateForFirstCommandBuffer)
  {
    self->_didUpdateForFirstCommandBuffer = 1;
    self->_firstFrameTimestamp = CACurrentMediaTime();
  }
  if (self->_didNotifyFirstFrameRendered || !self->_videoCurrentFrame)
  {
    v6 = 0;
  }
  else
  {
    v6 = 1;
    self->_didNotifyFirstFrameRendered = 1;
    if (dword_1001A8338 <= 50
      && (dword_1001A8338 != -1 || _LogCategory_Initialize(&dword_1001A8338, 50)))
    {
      LogPrintF(&dword_1001A8338, "-[BroadwayCardView notifyObserversWithCommandBuffer:]", 50, "%s first frame rendered", "-[BroadwayCardView notifyObserversWithCommandBuffer:]");
    }
  }
  if (self->_videoCurrentFrame >= 0x31)
  {
    -[SCNMaterial transparency](self->_modelMaterial, "transparency");
    if (v7 == 0.0)
      -[SCNMaterial setTransparency:](self->_modelMaterial, "setTransparency:", 1.0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EB7B0;
  block[3] = &unk_10017DED8;
  v14 = v6;
  v8 = v5;
  v12 = v8;
  v13 = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (!self->_didNotifyLastFrameRendered && self->_videoCurrentFrame == self->_videoFrameCount - 1)
  {
    if (dword_1001A8338 <= 50
      && (dword_1001A8338 != -1 || _LogCategory_Initialize(&dword_1001A8338, 50)))
    {
      LogPrintF(&dword_1001A8338, "-[BroadwayCardView notifyObserversWithCommandBuffer:]", 50, "%s last frame rendered", "-[BroadwayCardView notifyObserversWithCommandBuffer:]");
    }
    self->_didNotifyLastFrameRendered = 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000EB924;
    v9[3] = &unk_10017D608;
    v10 = v8;
    objc_msgSend(v4, "addCompletedHandler:", v9);

  }
}

- (void)configureVideo
{
  void *v3;
  AVPlayerItemVideoOutput *v4;
  AVPlayerItemVideoOutput *videoOutput;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  v7[0] = kCVPixelBufferMetalCompatibilityKey;
  v7[1] = kCVPixelBufferPixelFormatTypeKey;
  v8[0] = &__kCFBooleanTrue;
  v8[1] = &off_100183778;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  v4 = (AVPlayerItemVideoOutput *)objc_msgSend(objc_alloc((Class)AVPlayerItemVideoOutput), "initWithPixelBufferAttributes:", v3);
  videoOutput = self->_videoOutput;
  self->_videoOutput = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_videoPlayer, "currentItem"));
  objc_msgSend(v6, "addOutput:", self->_videoOutput);

}

- (void)configureVideoGeometry
{
  void *v3;
  SCNMaterial *v4;
  SCNGeometry *v5;
  void *v6;
  void *v7;
  SCNGeometry *videoGeometry;
  SCNGeometry *v9;
  SCNMaterial *videoMaterial;
  SCNMaterial *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCNProgram program](SCNProgram, "program"));
  objc_msgSend(v3, "setLibrary:", self->_library);
  objc_msgSend(v3, "setVertexFunctionName:", CFSTR("broadway_video_vert"));
  objc_msgSend(v3, "setFragmentFunctionName:", CFSTR("broadway_video_frag"));
  objc_msgSend(v3, "setOpaque:", 0);
  v4 = (SCNMaterial *)objc_claimAutoreleasedReturnValue(+[SCNMaterial material](SCNMaterial, "material"));
  -[SCNMaterial setValue:forKey:](v4, "setValue:forKey:", self->_videoMaterialProperty, CFSTR("videoTexture"));
  -[SCNMaterial setProgram:](v4, "setProgram:", v3);
  -[SCNMaterial setBlendMode:](v4, "setBlendMode:", 0);
  -[SCNMaterial setReadsFromDepthBuffer:](v4, "setReadsFromDepthBuffer:", 0);
  -[SCNMaterial setWritesToDepthBuffer:](v4, "setWritesToDepthBuffer:", 0);
  v5 = (SCNGeometry *)objc_claimAutoreleasedReturnValue(+[SCNPlane planeWithWidth:height:](SCNPlane, "planeWithWidth:height:", 1.0, 1.0));
  v11 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  -[SCNGeometry setMaterials:](v5, "setMaterials:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", v5));
  objc_msgSend(v7, "setName:", CFSTR("Video mapping"));
  objc_msgSend(v7, "setRenderingOrder:", -1);
  -[SCNNode addChildNode:](self->_cameraNode, "addChildNode:", v7);
  videoGeometry = self->_videoGeometry;
  self->_videoGeometry = v5;
  v9 = v5;

  videoMaterial = self->_videoMaterial;
  self->_videoMaterial = v4;

}

- (void)configureModelGeometry
{
  SCNMaterial *v3;
  SCNMaterial *modelMaterial;
  NSObject *modelContents;
  void *v6;
  void *v7;
  SCNMaterial *v8;

  v3 = (SCNMaterial *)objc_claimAutoreleasedReturnValue(+[SCNMaterial material](SCNMaterial, "material"));
  modelMaterial = self->_modelMaterial;
  self->_modelMaterial = v3;

  -[SCNMaterial setLightingModelName:](self->_modelMaterial, "setLightingModelName:", SCNLightingModelConstant);
  modelContents = self->_modelContents;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCNMaterial diffuse](self->_modelMaterial, "diffuse"));
  objc_msgSend(v6, "setContents:", modelContents);

  -[SCNMaterial setTransparency:](self->_modelMaterial, "setTransparency:", 0.0);
  v8 = self->_modelMaterial;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  -[SCNGeometry setMaterials:](self->_modelGeometry, "setMaterials:", v7);

}

- (id)playerForMovieAtURL:(id)a3 pointsSize:(CGSize *)a4 nominalFrameRate:(float *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  double v25;
  CGFloat v26;
  int v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", a3, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayer playerWithPlayerItem:](AVPlayer, "playerWithPlayerItem:", v8));
  objc_msgSend(v9, "setAllowsExternalPlayback:", 0);
  objc_msgSend(v9, "_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tracksWithMediaType:", AVMediaTypeVideo));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v20);
        if (a4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v20), "naturalSize", (_QWORD)v29);
          v23 = v22 / v12;
          v24 = objc_msgSend(v21, "naturalSize");
          a4->width = UISizeRoundToScale(v24, v23, v25 / v12, v12);
          a4->height = v26;
        }
        if (a5)
        {
          objc_msgSend(v21, "nominalFrameRate");
          *(_DWORD *)a5 = v27;
        }
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v18);
  }

  return v9;
}

- (id)materialPropertyWithContents:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCNMaterialProperty materialPropertyWithContents:](SCNMaterialProperty, "materialPropertyWithContents:", a3));
  objc_msgSend(v3, "setMipFilter:", 2);
  objc_msgSend(v3, "setMinificationFilter:", 2);
  objc_msgSend(v3, "setMagnificationFilter:", 2);
  return v3;
}

- (CGSize)videoSizePoints
{
  double width;
  double height;
  CGSize result;

  width = self->_videoSizePoints.width;
  height = self->_videoSizePoints.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blackTexture, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_videoMaterialProperty, 0);
  objc_storeStrong((id *)&self->_videoMaterial, 0);
  objc_storeStrong((id *)&self->_videoGeometry, 0);
  objc_storeStrong((id *)&self->_modelMaterial, 0);
  objc_storeStrong((id *)&self->_modelGeometry, 0);
  objc_storeStrong((id *)&self->_modelNode, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);
  objc_storeStrong((id *)&self->_modelContents, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_animationObservers, 0);
}

@end
