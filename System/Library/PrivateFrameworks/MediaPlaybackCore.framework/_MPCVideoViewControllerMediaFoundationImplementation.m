@implementation _MPCVideoViewControllerMediaFoundationImplementation

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  void *v6;
  NSString *v7;
  const char *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  SEL name;
  SEL v13;
  objc_super v15;

  v5 = &unk_254AB7160;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 0, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 0).name)
  {

  }
  else
  {
    name = protocol_getMethodDescription((Protocol *)v5, a3, 0, 0).name;

    if (!name)
      goto LABEL_15;
  }
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("playerViewController"), CFSTR("videoOutput"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  v8 = NSSelectorFromString(v7);
  v9 = &unk_254AEC150;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v9, v8, 1, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v9, v8, 0, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v9, v8, 1, 0).name)
  {

  }
  else
  {
    v13 = protocol_getMethodDescription((Protocol *)v9, v8, 0, 0).name;

    if (!v13)
    {

      goto LABEL_15;
    }
  }

  if (!v8)
  {
LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
    v11 = -[_MPCVideoViewControllerMediaFoundationImplementation respondsToSelector:](&v15, sel_respondsToSelector_, a3);
    return v11 & 1;
  }
  -[_MPCVideoViewControllerMediaFoundationImplementation videoOutputDelegate](self, "videoOutputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  return v11 & 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
  -[_MPCVideoViewControllerMediaFoundationImplementation viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCVideoViewControllerMediaFoundationImplementation view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (_MPCVideoViewControllerMediaFoundationImplementation)initWithPlaybackEngine:(id)a3
{
  id v4;
  _MPCVideoViewControllerMediaFoundationImplementation *v5;
  _MPCVideoViewControllerMediaFoundationImplementation *v6;
  uint64_t v7;
  _MPCVideoViewControllerMediaFoundationImplementation *v8;
  NSObject *v9;
  id v10;
  _QWORD handler[4];
  id v13;
  id location;
  _QWORD v15[5];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
  v5 = -[_MPCVideoViewControllerMediaFoundationImplementation init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    objc_msgSend(v4, "addEngineObserver:", v6);
    -[_MPCVideoViewControllerMediaFoundationImplementation _updateViewControllerHierarchyForPlaybackEngine:](v6, "_updateViewControllerHierarchyForPlaybackEngine:", v4);
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke;
    v15[3] = &unk_24CAB7248;
    v8 = v6;
    v15[4] = v8;
    v8->_stateHandle = __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke((uint64_t)v15);
    if (MSVDeviceOSIsInternalInstall())
    {
      objc_initWeak(&location, v8);
      v9 = MEMORY[0x24BDAC9B8];
      v10 = MEMORY[0x24BDAC9B8];
      handler[0] = v7;
      handler[1] = 3221225472;
      handler[2] = __79___MPCVideoViewControllerMediaFoundationImplementation_initWithPlaybackEngine___block_invoke_3;
      handler[3] = &unk_24CAB76D8;
      objc_copyWeak(&v13, &location);
      notify_register_dispatch("com.apple.mediaplaybackcore.videodebug", &v8->_videoDebugToken, v9, handler);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
  return v6;
}

- (void)_updateViewControllerHierarchyForPlaybackEngine:(id)a3
{
  AVPlayerViewController *v4;
  AVPlayerViewController **p_internalController;
  AVPlayerViewController *internalController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "player");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playerViewController");
  v4 = (AVPlayerViewController *)objc_claimAutoreleasedReturnValue();
  p_internalController = &self->_internalController;
  internalController = self->_internalController;
  if (internalController != v4)
  {
    -[_MPCVideoViewControllerMediaFoundationImplementation _transferPropertiesFromOldPlayerController:toNewPlayerController:](self, "_transferPropertiesFromOldPlayerController:toNewPlayerController:", internalController, v4);
    -[AVPlayerViewController willMoveToParentViewController:](*p_internalController, "willMoveToParentViewController:", 0);
    -[AVPlayerViewController view](*p_internalController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCVideoViewControllerMediaFoundationImplementation view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      -[AVPlayerViewController view](*p_internalController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

    }
    -[AVPlayerViewController removeFromParentViewController](*p_internalController, "removeFromParentViewController");
    -[_MPCVideoViewControllerMediaFoundationImplementation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("internalController"));
    objc_storeStrong((id *)&self->_internalController, v4);
    -[AVPlayerViewController setDelegate:](*p_internalController, "setDelegate:", self);
    -[_MPCVideoViewControllerMediaFoundationImplementation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("internalController"));
    if (*p_internalController)
    {
      -[_MPCVideoViewControllerMediaFoundationImplementation addChildViewController:](self, "addChildViewController:");
      -[_MPCVideoViewControllerMediaFoundationImplementation view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController view](*p_internalController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v12);

      -[AVPlayerViewController didMoveToParentViewController:](*p_internalController, "didMoveToParentViewController:", self);
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  MEMORY[0x212BD20AC](self->_stateHandle, a2);
  notify_cancel(self->_videoDebugToken);
  v3.receiver = self;
  v3.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
  -[_MPCVideoViewControllerMediaFoundationImplementation dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p internalViewController=%@>"), objc_opt_class(), self, self->_internalController);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  NSString *v8;
  const char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  SEL name;
  SEL v15;
  objc_super v16;
  _BYTE buf[12];
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (const char *)objc_msgSend(v4, "selector");
  v6 = &unk_254AB7160;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v6, v5, 1, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v6, v5, 0, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v6, v5, 1, 0).name)
  {

  }
  else
  {
    name = protocol_getMethodDescription((Protocol *)v6, v5, 0, 0).name;

    if (!name)
    {
      v16.receiver = self;
      v16.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
      -[_MPCVideoViewControllerMediaFoundationImplementation forwardInvocation:](&v16, sel_forwardInvocation_, v4);
      goto LABEL_15;
    }
  }
  NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("playerViewController"), CFSTR("videoOutput"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  v9 = NSSelectorFromString(v8);
  v10 = &unk_254AEC150;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v10, v9, 1, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v10, v9, 0, 1).name
    || (unint64_t)protocol_getMethodDescription((Protocol *)v10, v9, 1, 0).name)
  {

  }
  else
  {
    v15 = protocol_getMethodDescription((Protocol *)v10, v9, 0, 0).name;

    if (!v15)
      v9 = 0;
  }

  -[_MPCVideoViewControllerMediaFoundationImplementation videoOutputDelegate](self, "videoOutputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    v18 = 2114;
    v19 = v13;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ forwarding AV invocation %{public}@ to delegate %{public}@", buf, 0x20u);

  }
  if (v9 && v11)
  {
    objc_msgSend(v4, "setSelector:", v9);
    *(_QWORD *)buf = self;
    objc_msgSend(v4, "setArgument:atIndex:", buf, 2);
    objc_msgSend(v4, "invokeWithTarget:", v11);
  }

LABEL_15:
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
  -[_MPCVideoViewControllerMediaFoundationImplementation viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[_MPCVideoViewControllerMediaFoundationImplementation view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AVPlayerViewController view](self->_internalController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_super v5;

  if (self->_internalController)
  {
    -[AVPlayerViewController presentViewController:animated:completion:](self->_internalController, "presentViewController:animated:completion:", a3, a4, a5);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_MPCVideoViewControllerMediaFoundationImplementation;
    -[_MPCVideoViewControllerMediaFoundationImplementation presentViewController:animated:completion:](&v5, sel_presentViewController_animated_completion_, a3, a4, a5);
  }
}

- (BOOL)showsPlaybackControls
{
  return -[AVPlayerViewController showsPlaybackControls](self->_internalController, "showsPlaybackControls");
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  -[AVPlayerViewController setShowsPlaybackControls:](self->_internalController, "setShowsPlaybackControls:", a3);
}

- (CGSize)presentationSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[AVPlayerViewController player](self->_internalController, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSString)videoGravity
{
  return -[AVPlayerViewController videoGravity](self->_internalController, "videoGravity");
}

- (void)setVideoGravity:(id)a3
{
  -[AVPlayerViewController setVideoGravity:](self->_internalController, "setVideoGravity:", a3);
}

- (CGRect)videoBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVPlayerViewController videoBounds](self->_internalController, "videoBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isReadyForDisplay
{
  if (-[AVPlayerViewController isReadyForDisplay](self->_internalController, "isReadyForDisplay"))
    return 1;
  else
    return -[AVPlayerViewController isPictureInPictureActive](self->_internalController, "isPictureInPictureActive");
}

- (BOOL)isPictureInPictureActive
{
  return -[AVPlayerViewController isPictureInPictureActive](self->_internalController, "isPictureInPictureActive");
}

- (void)showFullScreenPresentationFromView:(id)a3 completion:(id)a4
{
  AVPlayerViewController *internalController;

  internalController = self->_internalController;
  if (internalController)
    -[AVPlayerViewController showFullScreenPresentationFromView:completion:](internalController, "showFullScreenPresentationFromView:completion:", a3, a4);
  else
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)enterFullScreenWithCompletion:(id)a3
{
  AVPlayerViewController *internalController;

  internalController = self->_internalController;
  if (internalController)
    -[AVPlayerViewController enterFullScreenWithCompletion:](internalController, "enterFullScreenWithCompletion:", a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)exitFullScreenWithCompletion:(id)a3
{
  AVPlayerViewController *internalController;

  internalController = self->_internalController;
  if (internalController)
    -[AVPlayerViewController exitFullScreenWithCompletion:](internalController, "exitFullScreenWithCompletion:", a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)stopPictureInPicture
{
  -[AVPlayerViewController stopPictureInPicture](self->_internalController, "stopPictureInPicture");
}

- (BOOL)allowsVideoFrameAnalysis
{
  return -[AVPlayerViewController allowsVideoFrameAnalysis](self->_internalController, "allowsVideoFrameAnalysis");
}

- (void)setAllowsVideoFrameAnalysis:(BOOL)a3
{
  -[AVPlayerViewController setAllowsVideoFrameAnalysis:](self->_internalController, "setAllowsVideoFrameAnalysis:", a3);
}

- (BOOL)allowsPictureInPicturePlayback
{
  return -[AVPlayerViewController allowsPictureInPicturePlayback](self->_internalController, "allowsPictureInPicturePlayback");
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  -[AVPlayerViewController setAllowsPictureInPicturePlayback:](self->_internalController, "setAllowsPictureInPicturePlayback:", a3);
}

- (id)_stateDictionary
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  _BOOL4 v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[6];
  _QWORD v58[8];
  CGSize v59;
  CGRect v60;

  v58[6] = *MEMORY[0x24BDAC8D0];
  -[_MPCVideoViewControllerMediaFoundationImplementation playbackEngine](self, "playbackEngine");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[_MPCVideoViewControllerMediaFoundationImplementation parentViewController](self, "parentViewController");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v49 = v4;
  -[__CFString player](v3, "player");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v48;
  v57[1] = CFSTR("videoOutputDelegate");
  -[_MPCVideoViewControllerMediaFoundationImplementation videoOutputDelegate](self, "videoOutputDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v5;
  v47 = v3;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("@");
  if (v3)
    v7 = v3;
  else
    v7 = CFSTR("@");
  v58[1] = v6;
  v58[2] = v7;
  v57[2] = CFSTR("playbackEngine");
  v57[3] = CFSTR("video");
  v55[0] = CFSTR("isReadyForDisplay");
  v8 = -[_MPCVideoViewControllerMediaFoundationImplementation isReadyForDisplay](self, "isReadyForDisplay");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v56[0] = v9;
  v55[1] = CFSTR("presentationSize");
  -[_MPCVideoViewControllerMediaFoundationImplementation presentationSize](self, "presentationSize");
  NSStringFromCGSize(v59);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v45;
  v55[2] = CFSTR("videoBounds");
  -[_MPCVideoViewControllerMediaFoundationImplementation videoBounds](self, "videoBounds");
  NSStringFromCGRect(v60);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v44;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v43;
  v57[4] = CFSTR("view");
  v53[0] = CFSTR("_obj");
  -[_MPCVideoViewControllerMediaFoundationImplementation view](self, "view");
  v10 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v10;
  if (v10)
    v11 = (const __CFString *)v10;
  else
    v11 = CFSTR("@");
  v54[0] = v11;
  v53[1] = CFSTR("internalViewController.view");
  -[_MPCVideoViewControllerMediaFoundationImplementation internalController](self, "internalController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v12 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v12;
  if (v12)
    v13 = (const __CFString *)v12;
  else
    v13 = CFSTR("@");
  v54[1] = v13;
  v53[2] = CFSTR("parentViewController.view.recursiveDescription");
  -[__CFString view](v4, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "valueForKey:", CFSTR("recursiveDescription"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "componentsSeparatedByString:", CFSTR("\n"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("@");
  v54[2] = v16;
  v53[3] = CFSTR("view.superview");
  -[_MPCVideoViewControllerMediaFoundationImplementation view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "superview");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("@");
  v54[3] = v19;
  v53[4] = CFSTR("view.superview.recursiveDescription");
  -[_MPCVideoViewControllerMediaFoundationImplementation view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKey:", CFSTR("recursiveDescription"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("\n"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("@");
  v54[4] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v25;
  v57[5] = CFSTR("viewController");
  v51[0] = CFSTR("playbackEngine.implementation.playerViewController");
  objc_msgSend(v50, "playerViewController");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = (const __CFString *)v26;
  else
    v28 = CFSTR("@");
  v52[0] = v28;
  v51[1] = CFSTR("internalViewController");
  -[_MPCVideoViewControllerMediaFoundationImplementation internalController](self, "internalController");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (const __CFString *)v29;
  else
    v31 = CFSTR("@");
  v51[2] = CFSTR("parentViewController");
  v32 = v49;
  if (!v49)
    v32 = CFSTR("@");
  v52[1] = v31;
  v52[2] = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (void)_transferPropertiesFromOldPlayerController:(id)a3 toNewPlayerController:(id)a4
{
  id v5;

  if (a3)
  {
    if (a4)
    {
      v5 = a4;
      objc_msgSend(v5, "setAllowsVideoFrameAnalysis:", objc_msgSend(a3, "allowsVideoFrameAnalysis"));

    }
  }
}

- (BOOL)_isBinCompatApp
{
  void *v2;
  BOOL v3;

  -[_MPCVideoViewControllerMediaFoundationImplementation traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (MPCVideoOutputDelegate)videoOutputDelegate
{
  return (MPCVideoOutputDelegate *)objc_loadWeakRetained((id *)&self->_videoOutputDelegate);
}

- (void)setVideoOutputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_videoOutputDelegate, a3);
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (AVPlayerViewController)internalController
{
  return self->_internalController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalController, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_destroyWeak((id *)&self->_videoOutputDelegate);
}

+ (id)keyPathsForValuesAffectingShowsPlaybackControls
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("internalController.showsPlaybackControls"));
}

+ (id)keyPathsForValuesAffectingPresentationSize
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("internalController.player.currentItem.presentationSize"));
}

+ (id)keyPathsForValuesAffectingVideoGravity
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("internalController.videoGravity"));
}

+ (id)keyPathsForValuesAffectingVideoBounds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("internalController.videoBounds"));
}

+ (id)keyPathsForValuesAffectingIsReadyForDisplay
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("internalController.isReadyForDisplay"), CFSTR("internalController.isPictureInPictureActive"), 0);
}

+ (id)keyPathsForValuesAffectingIsPictureInPictureActive
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("internalController.isPictureInPictureActive"));
}

+ (id)keyPathsForValuesAffectingAllowsPictureInPicturePlayback
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("internalController.allowsPictureInPicturePlayback"), 0);
}

@end
