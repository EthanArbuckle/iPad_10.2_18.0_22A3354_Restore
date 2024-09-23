@implementation CFXLiveCaptureViewController

- (CFXLiveCaptureViewController)initWithCoder:(id)a3
{
  CFXLiveCaptureViewController *v3;
  CFXLiveCaptureViewController *v4;
  uint64_t v5;
  OS_dispatch_queue *renderQ;
  uint64_t v7;
  OS_dispatch_queue *recordingQ;
  uint64_t v9;
  OS_dispatch_queue *renderImageQ;
  uint64_t v11;
  CFXEffectComposition *composition;
  uint64_t v13;
  NSMutableArray *renderFrameCompletionBlocks;
  CFTimeInterval v15;
  __int128 v16;
  CMTime v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CFXLiveCaptureViewController;
  v3 = -[CFXLiveCaptureViewController initWithCoder:](&v19, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_useLocalCameraViewfinder = 1;
    JFXCreateDispatchQueue(v3, CFSTR("rendererQ"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    renderQ = v4->_renderQ;
    v4->_renderQ = (OS_dispatch_queue *)v5;

    JFXCreateDispatchQueue(v4, CFSTR("recordingQ"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    recordingQ = v4->_recordingQ;
    v4->_recordingQ = (OS_dispatch_queue *)v7;

    JFXCreateDispatchQueue(v4, CFSTR("renderImageQ"), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    renderImageQ = v4->_renderImageQ;
    v4->_renderImageQ = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    composition = v4->_composition;
    v4->_composition = (CFXEffectComposition *)v11;

    v13 = objc_opt_new();
    renderFrameCompletionBlocks = v4->_renderFrameCompletionBlocks;
    v4->_renderFrameCompletionBlocks = (NSMutableArray *)v13;

    v15 = CACurrentMediaTime();
    CMTimeMakeWithSeconds(&v18, v15, 1000000000);
    v16 = *(_OWORD *)&v18.value;
    v4->_currentRenderPresentationTime_renderImageQ.epoch = v18.epoch;
    *(_OWORD *)&v4->_currentRenderPresentationTime_renderImageQ.value = v16;
  }
  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXLiveCaptureViewController;
  -[CFXLiveCaptureViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CFXLiveCaptureViewController CFX_installGestures](self, "CFX_installGestures");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXLiveCaptureViewController;
  -[CFXLiveCaptureViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CFXLiveCaptureViewController debugControlsView](self, "debugControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[CFXLiveCaptureViewController setDebugControlsView:](self, "setDebugControlsView:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXLiveCaptureViewController;
  -[CFXLiveCaptureViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (!isStreamingMode(-[CFXLiveCaptureViewController captureMode](self, "captureMode")))
    -[CFXLiveCaptureViewController stopRenderingCameraFrames](self, "stopRenderingCameraFrames");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CFXLiveCaptureViewController;
  -[CFXLiveCaptureViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (BOOL)livePlayerIsSaturated
{
  CFXLiveCaptureViewController *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__CFXLiveCaptureViewController_livePlayerIsSaturated__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __53__CFXLiveCaptureViewController_livePlayerIsSaturated__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "livePlayerIsSaturated");

}

- (void)willDropCameraFrame
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CFXLiveCaptureViewController_willDropCameraFrame__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __51__CFXLiveCaptureViewController_willDropCameraFrame__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "willDropCameraFrame");

}

- (void)setUseLocalCameraViewfinder:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;

  if (self->_useLocalCameraViewfinder != a3)
  {
    v5 = !a3;
    -[CFXLiveCaptureViewController renderImageView](self, "renderImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

    self->_useLocalCameraViewfinder = a3;
  }
}

- (UIView)uncroppedCameraViewfinderPlaceholderView
{
  void *v3;

  -[CFXLiveCaptureViewController CFX_createUncroppedCameraPlaceholderViewIfNecessary](self, "CFX_createUncroppedCameraPlaceholderViewIfNecessary");
  -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
  else
    -[CFXLiveCaptureViewController renderImageView](self, "renderImageView");
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)CFX_createUncroppedCameraPlaceholderViewIfNecessary
{
  int64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  double v27;
  id v28;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "userInterfaceIdiom"))
  {
    v3 = -[CFXLiveCaptureViewController captureMode](self, "captureMode");

    if (v3 == 1)
      return;
    -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      -[CFXLiveCaptureViewController setUncroppedRenderImagePlaceHolderView:](self, "setUncroppedRenderImagePlaceHolderView:", v5);

      -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUserInteractionEnabled:", 0);

      -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);

      -[CFXLiveCaptureViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertSubview:atIndex:", v9, 0);

    }
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "renderSize");
    v12 = v11;
    v14 = v13;

    -[CFXLiveCaptureViewController renderImageView](self, "renderImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    if (v12 != *MEMORY[0x24BDBF148] || v14 != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      v17 = CGRectFillRectToAspectInRect(v17, v19, v21, v23, 0.0, 0.0, v12, v14);
      v19 = v25;
      v21 = v26;
      v23 = v27;
    }
    -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", v17, v19, v21, v23);
  }

}

- (void)startButtonTouchUpInside:(id)a3
{
  id v3;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startCameraSession:", &__block_literal_global_5);

}

- (void)stopButtonTouchUpInside:(id)a3
{
  id v3;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopCameraSession:", 0);

}

- (void)toggleDebugControlsView:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[CFXLiveCaptureViewController debugControlsView](self, "debugControlsView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  -[CFXLiveCaptureViewController debugControlsView](self, "debugControlsView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5 ^ 1u);

}

- (JTImage)renderedImage
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[CFXLiveCaptureViewController renderImageQ](self, "renderImageQ");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__CFXLiveCaptureViewController_renderedImage__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (JTImage *)v4;
}

void __45__CFXLiveCaptureViewController_renderedImage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "renderedImage_renderImageQ");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderPresentationTime
{
  NSObject *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3810000000;
  v11 = &unk_226ACDFC7;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  -[CFXLiveCaptureViewController renderImageQ](self, "renderImageQ");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CFXLiveCaptureViewController_currentRenderPresentationTime__block_invoke;
  block[3] = &unk_24EE57A80;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(v5, block);

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v9 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

double __61__CFXLiveCaptureViewController_currentRenderPresentationTime__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double result;
  __int128 v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "currentRenderPresentationTime_renderImageQ");
  }
  else
  {
    v5 = 0uLL;
    v6 = 0;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v5;
  *(_OWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 48) = v6;
  return result;
}

- (void)renderer:(id)a3 didPrepareToRenderFrameAtPresentationTime:(id *)a4
{
  NSObject *v6;
  _QWORD v7[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[CFXLiveCaptureViewController renderImageQ](self, "renderImageQ", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__CFXLiveCaptureViewController_renderer_didPrepareToRenderFrameAtPresentationTime___block_invoke;
  v7[3] = &unk_24EE57FD8;
  v7[4] = self;
  v8 = *a4;
  dispatch_sync(v6, v7);

}

uint64_t __83__CFXLiveCaptureViewController_renderer_didPrepareToRenderFrameAtPresentationTime___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;

  v2 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRenderPresentationTime_renderImageQ:", &v2);
}

- (void)renderer:(id)a3 didRenderFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  JTImage *v10;
  JTImage *v11;
  JTImage *v12;
  NSObject *v13;
  JTImage *v14;
  JTImage *v15;
  _QWORD v16[4];
  JTImage *v17;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[5];
  JTImage *v21;
  __int128 v22;
  uint64_t v23;
  _QWORD block[5];
  JTImage *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id location[2];

  v6 = a3;
  v7 = a4;
  -[CFXLiveCaptureViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "liveCaptureViewController:didRenderFrame:", self, v7);

  objc_initWeak(location, self);
  v9 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke;
  v28[3] = &unk_24EE58000;
  objc_copyWeak(&v29, location);
  v10 = (JTImage *)MEMORY[0x2276A1F6C](v28);
  v26 = 0uLL;
  v27 = 0;
  if (v7)
    objc_msgSend(v7, "timestamp");
  if (-[CFXLiveCaptureViewController useLocalCameraViewfinder](self, "useLocalCameraViewfinder"))
  {
    objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", objc_msgSend(v7, "pixelBuffer"));
    v11 = (JTImage *)objc_claimAutoreleasedReturnValue();
    v12 = -[JTImage initWithPVImage:]([JTImage alloc], "initWithPVImage:", v11);
    -[CFXLiveCaptureViewController renderImageQ](self, "renderImageQ");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_2;
    block[3] = &unk_24EE57AA8;
    block[4] = self;
    v25 = v12;
    v14 = v12;
    dispatch_sync(v13, block);

    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_3;
    v20[3] = &unk_24EE58028;
    v20[4] = self;
    v21 = v10;
    v22 = v26;
    v23 = v27;
    v15 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v20);

  }
  else
  {
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_4;
    v16[3] = &unk_24EE58050;
    v17 = v10;
    v18 = v26;
    v19 = v27;
    v11 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v16);
    v14 = v17;
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(location);

}

void __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "CFX_executeRenderCallbacksQueuedBeforeTime:", &v4);

}

uint64_t __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRenderedImage_renderImageQ:", *(_QWORD *)(a1 + 40));
}

void __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void (*v5)(uint64_t, __int128 *, uint64_t);
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "renderedImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "renderImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setJtImage:", v2);

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void (**)(uint64_t, __int128 *, uint64_t))(v4 + 16);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  v5(v4, &v7, v6);

}

uint64_t __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, __int128 *);
  __int128 v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t (**)(uint64_t, __int128 *))(v1 + 16);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  return v2(v1, &v4);
}

- (void)renderVideoFrame:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  CFXFrame *v8;
  NSObject *v9;
  CFXFrame *v10;
  _QWORD v11[5];
  CFXFrame *v12;
  _QWORD block[5];
  id v14;

  v4 = a3;
  -[CFXLiveCaptureViewController recordingQ](self, "recordingQ");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CFXLiveCaptureViewController_renderVideoFrame___block_invoke;
  block[3] = &unk_24EE57AA8;
  block[4] = self;
  v14 = v4;
  v7 = v4;
  dispatch_async(v5, block);

  v8 = -[CFXFrame initWithFrameSet:]([CFXFrame alloc], "initWithFrameSet:", v7);
  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __49__CFXLiveCaptureViewController_renderVideoFrame___block_invoke_2;
  v11[3] = &unk_24EE57AA8;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

}

void __49__CFXLiveCaptureViewController_renderVideoFrame___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isCapturingVideo_recordingQ"))
  {
    objc_msgSend(*(id *)(a1 + 32), "videoWriter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeCameraFrameSet:", *(_QWORD *)(a1 + 40));

  }
}

void __49__CFXLiveCaptureViewController_renderVideoFrame___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderFrame:effectComposition:", v2, v3);

}

- (void)processAudioSample:(opaqueCMSampleBuffer *)a3
{
  NSObject *v5;
  _QWORD v6[6];

  CFRetain(a3);
  -[CFXLiveCaptureViewController recordingQ](self, "recordingQ");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__CFXLiveCaptureViewController_processAudioSample___block_invoke;
  v6[3] = &unk_24EE58078;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __51__CFXLiveCaptureViewController_processAudioSample___block_invoke(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isCapturingVideo_recordingQ"))
  {
    objc_msgSend(*(id *)(a1 + 32), "videoWriter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeAudioBuffer:", *(_QWORD *)(a1 + 40));

  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

+ (id)instantiate
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6E00], "storyboardWithName:bundle:", CFSTR("CFXLiveCapture"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instantiateViewControllerWithIdentifier:", CFSTR("CFXLiveCaptureViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIColor)animojiBackgroundColor
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__CFXLiveCaptureViewController_animojiBackgroundColor__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (UIColor *)v4;
}

void __54__CFXLiveCaptureViewController_animojiBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animojiBackgroundColor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setAnimojiBackgroundColor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CFXLiveCaptureViewController_setAnimojiBackgroundColor___block_invoke;
  block[3] = &unk_24EE57AA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __58__CFXLiveCaptureViewController_setAnimojiBackgroundColor___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnimojiBackgroundColor:", v1);

}

- (void)setTrackingLossDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_trackingLossDelegate, a3);
}

- (void)executeAfterNextFrameIsRendered:(id)a3
{
  id v4;
  void *v5;
  CFXNextRenderedFrameCallback *v6;
  CFXNextRenderedFrameCallback *v7;
  void *v8;
  CMTime v9;
  CMTime lhs;
  CMTime v11;
  CMTime v12;
  CMTime v13;

  memset(&v13, 0, sizeof(v13));
  v4 = a3;
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v13, 1, objc_msgSend(v5, "frameRate"));

  memset(&v12, 0, sizeof(v12));
  -[CFXLiveCaptureViewController currentRenderPresentationTime](self, "currentRenderPresentationTime");
  memset(&v11, 0, sizeof(v11));
  lhs = v12;
  v9 = v13;
  CMTimeAdd(&v11, &lhs, &v9);
  v6 = [CFXNextRenderedFrameCallback alloc];
  lhs = v11;
  v7 = -[CFXNextRenderedFrameCallback initWithBlock:sendAfterRenderTime:](v6, "initWithBlock:sendAfterRenderTime:", v4, &lhs);

  -[CFXLiveCaptureViewController renderFrameCompletionBlocks](self, "renderFrameCompletionBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

- (void)startRenderingCameraFrames
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXLiveCaptureViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CFXLiveCaptureViewController_startRenderingCameraFrames__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__CFXLiveCaptureViewController_startRenderingCameraFrames__block_invoke(uint64_t a1)
{
  CFXRenderer *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = -[CFXRenderer initWithDelegate:captureMode:]([CFXRenderer alloc], "initWithDelegate:captureMode:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "captureMode"));
  objc_msgSend(*(id *)(a1 + 32), "setRenderer_renderQ:", v2);

  objc_msgSend(*(id *)(a1 + 32), "trackingLossDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrackingLossDelegate:", v3);

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v7, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fpsCalc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v15);

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addVideoRenderDelegate:", *(_QWORD *)(a1 + 32));

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAudioRenderDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)stopRenderingCameraFrames
{
  -[CFXLiveCaptureViewController stopRenderingCameraFrames:](self, "stopRenderingCameraFrames:", 0);
}

- (void)stopRenderingCameraFrames:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__CFXLiveCaptureViewController_stopRenderingCameraFrames___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__CFXLiveCaptureViewController_stopRenderingCameraFrames___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeVideoRenderDelegate:async:", *(_QWORD *)(a1 + 32), 0);

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAudioRenderDelegate:async:", *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(*(id *)(a1 + 32), "setRenderer_renderQ:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pauseRenderingCameraFrames
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CFXLiveCaptureViewController_pauseRenderingCameraFrames__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__CFXLiveCaptureViewController_pauseRenderingCameraFrames__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pause");

}

- (void)resumeRenderingCameraFrames
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CFXLiveCaptureViewController_resumeRenderingCameraFrames__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __59__CFXLiveCaptureViewController_resumeRenderingCameraFrames__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resume");

}

- (void)flushRenderer
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXLiveCaptureViewController renderQ](self, "renderQ");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CFXLiveCaptureViewController_flushRenderer__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __45__CFXLiveCaptureViewController_flushRenderer__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flush");

}

- (void)removeAllEffectsOfType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CFXLiveCaptureViewController *v16;
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke;
  v18[3] = &unk_24EE580C8;
  v9 = v7;
  v19 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x2276A1F6C](v18);
  -[CFXLiveCaptureViewController composition](self, "composition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasEffectOfType:", v6);

  if ((v12 & 1) != 0)
  {
    -[CFXLiveCaptureViewController composition](self, "composition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke_2;
    v14[3] = &unk_24EE580F0;
    v15 = v6;
    v16 = self;
    v17 = v10;
    objc_msgSend(v13, "removeAllEffectsOfType:completion:", v15, v14);

  }
  else
  {
    v10[2](v10);
  }

}

void __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

void __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Animoji"));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "renderQ");
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke_3;
    v6[3] = &unk_24EE580A0;
    v5 = *(void **)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 40);
    v7 = v5;
    dispatch_async(v4, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animojiRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeAllEffects:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke;
  v12[3] = &unk_24EE580C8;
  v13 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x2276A1F6C](v12);
  -[CFXLiveCaptureViewController composition](self, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke_2;
  v10[3] = &unk_24EE580A0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "removeAllEffects:", v10);

}

void __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

void __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

  objc_msgSend(*(id *)(a1 + 32), "renderQ");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke_3;
  v5[3] = &unk_24EE580A0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

uint64_t __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animojiRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetMetadataValidation");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)isCapturing
{
  CFXLiveCaptureViewController *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CFXLiveCaptureViewController recordingQ](self, "recordingQ");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__CFXLiveCaptureViewController_isCapturing__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __43__CFXLiveCaptureViewController_isCapturing__block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCapturingVideo_recordingQ") & 1) != 0)
    result = 1;
  else
    result = objc_msgSend(*(id *)(a1 + 32), "isCapturingPhoto_recordingQ");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)startVideoRecordingWithFlashMode:(int64_t)a3
{
  void *v4;

  -[CFXLiveCaptureViewController thermalPolicyManager](self, "thermalPolicyManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecordingPolicy:", 1);

  -[CFXLiveCaptureViewController CFX_setupVideoWriterWithAudio:completion:](self, "CFX_setupVideoWriterWithAudio:completion:", 1, 0);
  -[CFXLiveCaptureViewController CFX_setAnimationEnabledForOverlays:](self, "CFX_setAnimationEnabledForOverlays:", 1);
}

- (void)stopVideoRecording:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[CFXLiveCaptureViewController CFX_setAnimationEnabledForOverlays:](self, "CFX_setAnimationEnabledForOverlays:", 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__CFXLiveCaptureViewController_stopVideoRecording___block_invoke;
  v6[3] = &unk_24EE58118;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CFXLiveCaptureViewController CFX_tearDownVideoWriter:](self, "CFX_tearDownVideoWriter:", v6);

}

void __51__CFXLiveCaptureViewController_stopVideoRecording___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "thermalPolicyManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecordingPolicy:", 0);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)cancelVideoRecording
{
  -[CFXLiveCaptureViewController stopVideoRecording:](self, "stopVideoRecording:", 0);
}

- (void)capturePhotoWithFlashMode:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[5];

  v6 = a4;
  -[CFXLiveCaptureViewController recordingQ](self, "recordingQ");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v7, block);

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_2;
  v11[3] = &unk_24EE58208;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "capturePhotoWithFlash:completion:", a3, v11);

}

uint64_t __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsCapturingPhoto_recordingQ:", 1);
}

void __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD block[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[5];
  id v36;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_3;
  v35[3] = &unk_24EE58168;
  v11 = *(id *)(a1 + 40);
  v35[4] = *(_QWORD *)(a1 + 32);
  v36 = v11;
  v12 = MEMORY[0x2276A1F6C](v35);
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (v9)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v12 + 16))(v12, 0, 0, v9);
  }
  else
  {
    objc_msgSend(v8, "metadataDict");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PVFrameSetMetadataARMetadataKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "composition");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "jtEffectsForType:", 7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "count"))
      {
        v29 = 0;
        v30 = &v29;
        v31 = 0x3032000000;
        v32 = __Block_byref_object_copy__3;
        v33 = __Block_byref_object_dispose__3;
        v34 = 0;
        objc_msgSend(*(id *)(a1 + 32), "renderQ");
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_6;
        block[3] = &unk_24EE58190;
        v19 = *(_QWORD *)(a1 + 32);
        v28 = &v29;
        block[4] = v19;
        v20 = v15;
        v27 = v20;
        dispatch_sync(v18, block);

        objc_msgSend(v20, "setAnimojiPhysicsBlendShapes:", v30[5]);
        _Block_object_dispose(&v29, 8);

      }
      v21 = *(void **)(a1 + 32);
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_7;
      v22[3] = &unk_24EE581E0;
      v22[4] = v21;
      v23 = v8;
      v25 = v13;
      v24 = v7;
      objc_msgSend(v21, "CFX_setupVideoWriterWithAudio:completion:", 0, v22);

    }
    else
    {
      ((void (**)(_QWORD, id, _QWORD, _QWORD))v13)[2](v13, v7, 0, 0);
    }

  }
}

void __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_4;
  block[3] = &unk_24EE58140;
  v11 = *(id *)(a1 + 40);
  v19 = v7;
  v20 = v8;
  v12 = *(_QWORD *)(a1 + 32);
  v21 = v9;
  v22 = v12;
  v23 = v11;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(*(id *)(a1 + 32), "recordingQ");
  v16 = objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_5;
  v17[3] = &unk_24EE57B60;
  v17[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v16, v17);

}

uint64_t __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "stopRenderingCameraFrames");
}

uint64_t __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsCapturingPhoto_recordingQ:", 0);
}

void __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animojiRenderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "arFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preRecordedBlendShapesForFrame:captureOrientation:interfaceOrientation:backgroundColor:", v3, 4, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setIsCapturingVideo_recordingQ:", 0);
  objc_msgSend(*(id *)(a1 + 32), "videoWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeCameraFrameSet:", *(_QWORD *)(a1 + 40));

  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_8;
  v4[3] = &unk_24EE581B8;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "CFX_tearDownVideoWriter:", v4);

}

uint64_t __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a3, 0);
}

- (void)CFX_setupVideoWriterWithAudio:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  BOOL v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;

  v6 = a4;
  v7 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__3;
  v33[4] = __Block_byref_object_dispose__3;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__3;
  v31[4] = __Block_byref_object_dispose__3;
  v32 = 0;
  dispatch_group_enter(v7);
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke;
  v27[3] = &unk_24EE58230;
  v29 = v33;
  v30 = v31;
  v10 = v7;
  v28 = v10;
  objc_msgSend(v8, "videoAndAudioOutputSettings:", v27);

  dispatch_group_enter(v10);
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke_2;
  v25[3] = &unk_24EE57B60;
  v12 = v10;
  v26 = v12;
  objc_msgSend(v11, "enableRecordingMovieMode:completion:", 1, v25);

  v24 = 0;
  +[JFXMediaURLManager videoRecordingFolderURL:](JFXMediaURLManager, "videoRecordingFolderURL:", &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v24;
  -[CFXLiveCaptureViewController recordingQ](self, "recordingQ");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke_3;
  block[3] = &unk_24EE58258;
  block[4] = self;
  v19 = v13;
  v23 = a3;
  v21 = v33;
  v22 = v31;
  v20 = v6;
  v16 = v6;
  v17 = v13;
  dispatch_group_notify(v12, v15, block);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

}

void __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke_3(uint64_t a1)
{
  JFXVideoWriter *v2;
  uint64_t v3;
  JFXVideoWriter *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE buf[32];
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v2 = [JFXVideoWriter alloc];
  if (*(_BYTE *)(a1 + 72))
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  else
    v3 = 0;
  v4 = -[JFXVideoWriter initWithFolderURL:videoOutputSettings:audioOutputSettings:audioFormatHint:](v2, "initWithFolderURL:videoOutputSettings:audioOutputSettings:audioFormatHint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3, 0);
  objc_msgSend(*(id *)(a1 + 32), "setVideoWriter:", v4);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "jfx_hasDepthCapableCamera"))
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "depthEnabled");

    if (!v7)
      goto LABEL_8;
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "depthDimensions");
    objc_msgSend(*(id *)(a1 + 32), "videoWriter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDepthDimensions:", v9);

    objc_msgSend(*(id *)(a1 + 32), "videoWriter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStoreDepthDataAsVideoTrack:", 1);
  }

LABEL_8:
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "cameraPosition");
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXRotationTransforms transformFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:](JFXRotationTransforms, "transformFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", v12, objc_msgSend(v13, "captureVideoOrientation"), +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation"));

  objc_msgSend(*(id *)(a1 + 32), "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jtEffectsForType:", 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = CFSTR("JFXAnimojiEffectDataRepresentationKey");
    objc_msgSend(v16, "dataRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v17;
    v38[1] = CFSTR("JFXAnimojiEffectAvatarVersionNumberKey");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v16, "avatarVersionNumber"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v32;
    objc_msgSend(*(id *)(a1 + 32), "videoWriter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAnimojiMetadata:", v20);

  }
  objc_msgSend(*(id *)(a1 + 32), "videoWriter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  *(_OWORD *)buf = v33;
  *(_OWORD *)&buf[16] = v34;
  v37 = v35;
  v24 = objc_msgSend(v23, "startWriterWithVideoTransform:error:", buf, &v31);
  v25 = v31;

  if (!v24 || v25)
  {
    JFXLog_writer();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (*(_BYTE *)(a1 + 72))
        v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      else
        v30 = 0;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v30;
      _os_log_debug_impl(&dword_2269A9000, v26, OS_LOG_TYPE_DEBUG, "error starting video writer: %@\n\tvideo settings: %@\n\taudio settings: %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setVideoWriter:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "videoWriter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIsCapturingVideo_recordingQ:", v27 != 0);

  v28 = *(_QWORD *)(a1 + 48);
  if (v28)
    (*(void (**)(void))(v28 + 16))();

}

- (void)CFX_tearDownVideoWriter:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CFXLiveCaptureViewController recordingQ](self, "recordingQ");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "videoWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setVideoWriter:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsCapturingVideo_recordingQ:", 0);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke_2;
  v3[3] = &unk_24EE582A8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "finishWritingWithCompletionHandler:", v3);

}

void __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke_3;
  v11[3] = &unk_24EE58280;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "enableRecordingMovieMode:completion:", 0, v11);

}

uint64_t __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)CFX_installGestures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_CFX_livePreviewTapped_);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setNumberOfTapsRequired:", 1);
  -[CFXLiveCaptureViewController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v12);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel_CFX_livePreviewPanned_);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setMinimumNumberOfTouches:", 1);
  -[CFXLiveCaptureViewController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C60]), "initWithTarget:action:", self, sel_CFX_livePreviewPinched_);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setScale:", 1.0);
  -[CFXLiveCaptureViewController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D18]), "initWithTarget:action:", self, sel_CFX_livePreviewRotated_);
  objc_msgSend(v8, "setDelegate:", self);
  -[CFXLiveCaptureViewController containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addGestureRecognizer:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_CFX_livePreviewDoubleTapped_);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setNumberOfTapsRequired:", 2);
  -[CFXLiveCaptureViewController containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", v10);

}

- (CGPoint)locationInCaptureViewForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v4 = a3;
  -[CFXLiveCaptureViewController CFX_createUncroppedCameraPlaceholderViewIfNecessary](self, "CFX_createUncroppedCameraPlaceholderViewIfNecessary");
  -[CFXLiveCaptureViewController renderImageView](self, "renderImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CFXLiveCaptureViewController uncroppedRenderImagePlaceHolderView](self, "uncroppedRenderImagePlaceHolderView");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(v4, "locationInView:", v5);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v5, "bounds");
  v13 = v12;
  v15 = v14;
  +[JFXMediaSettings renderSize](JFXMediaSettings, "renderSize");
  v18 = CGPointConvertToNormalizedCoordinateSpace(2uLL, 0, v9, v11, v13, v15, v16, v17);
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumHitTestArea
{
  double v2;
  double v3;
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  +[JFXMediaSettings renderSize](JFXMediaSettings, "renderSize");
  v3 = 44.0 / v2;
  v5 = 44.0 / v4;
  result.var1 = v5;
  result.var0 = v3;
  return result;
}

- (void)CFX_livePreviewTapped:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[CFXLiveCaptureViewController locationInCaptureViewForGestureRecognizer:](self, "locationInCaptureViewForGestureRecognizer:", a3);
  v5 = v4;
  v7 = v6;
  -[CFXLiveCaptureViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "liveCaptureViewController:livePreviewTappedAtNormalizedPoint:", self, v5, v7);

}

- (void)CFX_livePreviewPanned:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[CFXLiveCaptureViewController locationInCaptureViewForGestureRecognizer:](self, "locationInCaptureViewForGestureRecognizer:", v4);
  v6 = v5;
  v8 = v7;
  -[CFXLiveCaptureViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:", self, v4, v6, v8);

}

- (void)CFX_livePreviewPinched:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[CFXLiveCaptureViewController locationInCaptureViewForGestureRecognizer:](self, "locationInCaptureViewForGestureRecognizer:", v4);
  v6 = v5;
  v8 = v7;
  -[CFXLiveCaptureViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:", self, v4, v6, v8);

}

- (void)CFX_livePreviewRotated:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[CFXLiveCaptureViewController locationInCaptureViewForGestureRecognizer:](self, "locationInCaptureViewForGestureRecognizer:", v4);
  v6 = v5;
  v8 = v7;
  -[CFXLiveCaptureViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:", self, v4, v6, v8);

}

- (void)CFX_livePreviewDoubleTapped:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[CFXLiveCaptureViewController locationInCaptureViewForGestureRecognizer:](self, "locationInCaptureViewForGestureRecognizer:", v4);
  v6 = v5;
  v8 = v7;
  -[CFXLiveCaptureViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "liveCaptureViewController:livePreviewDoubleTappedAtNormalizedCenterPoint:gesture:", self, v4, v6, v8);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  char v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();
  }
  v9 = isKindOfClass & v8;

  return v9 & 1;
}

- (void)CFX_setAnimationEnabledForOverlays:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  -[CFXLiveCaptureViewController composition](self, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jtEffectsForType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = MEMORY[0x24BDC0D88];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "enablePresentationState:", !v3);
        v22 = 0u;
        v23 = 0u;
        v21 = 0u;
        objc_msgSend(v12, "renderEffect");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "effectRange");
        }
        else
        {
          v22 = 0u;
          v23 = 0u;
          v21 = 0u;
        }

        if (v3)
        {
          v21 = CFXEffectPreviewStartAtNextRenderTime;
          v15 = 0;
        }
        else
        {
          v21 = *(_OWORD *)v10;
          v15 = *(_QWORD *)(v10 + 16);
        }
        *(_QWORD *)&v22 = v15;
        v18 = v21;
        v19 = v22;
        v20 = v23;
        objc_msgSend(v12, "renderEffect");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v18;
        v17[1] = v19;
        v17[2] = v20;
        objc_msgSend(v16, "setEffectRange:", v17);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

}

- (void)CFX_executeRenderCallbacksQueuedBeforeTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  v5 = (void *)objc_opt_new();
  -[CFXLiveCaptureViewController renderFrameCompletionBlocks](self, "renderFrameCompletionBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__CFXLiveCaptureViewController_CFX_executeRenderCallbacksQueuedBeforeTime___block_invoke;
  v9[3] = &unk_24EE582D0;
  v11 = *a3;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  -[CFXLiveCaptureViewController renderFrameCompletionBlocks](self, "renderFrameCompletionBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsInArray:", v8);

  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_82);
}

void __75__CFXLiveCaptureViewController_CFX_executeRenderCallbacksQueuedBeforeTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CMTime v5;
  CMTime time1;
  CMTime v7;

  v3 = a2;
  v4 = v3;
  memset(&v7, 0, sizeof(v7));
  if (v3)
    objc_msgSend(v3, "sendAfterRenderTime");
  time1 = *(CMTime *)(a1 + 40);
  v5 = v7;
  if (CMTimeCompare(&time1, &v5) >= 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __75__CFXLiveCaptureViewController_CFX_executeRenderCallbacksQueuedBeforeTime___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v2)(void);

  objc_msgSend(a2, "block");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (JFXAnimojiTrackingLossDelegate)trackingLossDelegate
{
  return (JFXAnimojiTrackingLossDelegate *)objc_loadWeakRetained((id *)&self->_trackingLossDelegate);
}

- (CFXLiveCaptureViewControllerDelegate)delegate
{
  return (CFXLiveCaptureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CFXEffectComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (BOOL)useLocalCameraViewfinder
{
  return self->_useLocalCameraViewfinder;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(int64_t)a3
{
  self->_captureMode = a3;
}

- (CFXThermalPolicyManager)thermalPolicyManager
{
  return self->_thermalPolicyManager;
}

- (void)setThermalPolicyManager:(id)a3
{
  objc_storeStrong((id *)&self->_thermalPolicyManager, a3);
}

- (JFXImageView)renderImageView
{
  return (JFXImageView *)objc_loadWeakRetained((id *)&self->_renderImageView);
}

- (void)setRenderImageView:(id)a3
{
  objc_storeWeak((id *)&self->_renderImageView, a3);
}

- (UIView)debugControlsView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_debugControlsView);
}

- (void)setDebugControlsView:(id)a3
{
  objc_storeWeak((id *)&self->_debugControlsView, a3);
}

- (UIView)uncroppedRenderImagePlaceHolderView
{
  return self->_uncroppedRenderImagePlaceHolderView;
}

- (void)setUncroppedRenderImagePlaceHolderView:(id)a3
{
  objc_storeStrong((id *)&self->_uncroppedRenderImagePlaceHolderView, a3);
}

- (OS_dispatch_queue)renderQ
{
  return self->_renderQ;
}

- (void)setRenderQ:(id)a3
{
  objc_storeStrong((id *)&self->_renderQ, a3);
}

- (CFXRenderer)renderer_renderQ
{
  return self->_renderer_renderQ;
}

- (void)setRenderer_renderQ:(id)a3
{
  objc_storeStrong((id *)&self->_renderer_renderQ, a3);
}

- (OS_dispatch_queue)recordingQ
{
  return self->_recordingQ;
}

- (void)setRecordingQ:(id)a3
{
  objc_storeStrong((id *)&self->_recordingQ, a3);
}

- (OS_dispatch_queue)renderImageQ
{
  return self->_renderImageQ;
}

- (void)setRenderImageQ:(id)a3
{
  objc_storeStrong((id *)&self->_renderImageQ, a3);
}

- (JTImage)renderedImage_renderImageQ
{
  return self->_renderedImage_renderImageQ;
}

- (void)setRenderedImage_renderImageQ:(id)a3
{
  objc_storeStrong((id *)&self->_renderedImage_renderImageQ, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderPresentationTime_renderImageQ
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1112);
  return self;
}

- (void)setCurrentRenderPresentationTime_renderImageQ:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_currentRenderPresentationTime_renderImageQ.value = *(_OWORD *)&a3->var0;
  self->_currentRenderPresentationTime_renderImageQ.epoch = var3;
}

- (BOOL)isCapturingVideo_recordingQ
{
  return self->_isCapturingVideo_recordingQ;
}

- (void)setIsCapturingVideo_recordingQ:(BOOL)a3
{
  self->_isCapturingVideo_recordingQ = a3;
}

- (BOOL)isCapturingPhoto_recordingQ
{
  return self->_isCapturingPhoto_recordingQ;
}

- (void)setIsCapturingPhoto_recordingQ:(BOOL)a3
{
  self->_isCapturingPhoto_recordingQ = a3;
}

- (JFXVideoWriter)videoWriter
{
  return self->_videoWriter;
}

- (void)setVideoWriter:(id)a3
{
  objc_storeStrong((id *)&self->_videoWriter, a3);
}

- (NSMutableArray)renderFrameCompletionBlocks
{
  return self->_renderFrameCompletionBlocks;
}

- (void)setRenderFrameCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_renderFrameCompletionBlocks, a3);
}

- (JFXOrientationMonitor)orientationMonitor
{
  return self->_orientationMonitor;
}

- (void)setOrientationMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_orientationMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationMonitor, 0);
  objc_storeStrong((id *)&self->_renderFrameCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_videoWriter, 0);
  objc_storeStrong((id *)&self->_renderedImage_renderImageQ, 0);
  objc_storeStrong((id *)&self->_renderImageQ, 0);
  objc_storeStrong((id *)&self->_recordingQ, 0);
  objc_storeStrong((id *)&self->_renderer_renderQ, 0);
  objc_storeStrong((id *)&self->_renderQ, 0);
  objc_storeStrong((id *)&self->_uncroppedRenderImagePlaceHolderView, 0);
  objc_destroyWeak((id *)&self->_debugControlsView);
  objc_destroyWeak((id *)&self->_renderImageView);
  objc_storeStrong((id *)&self->_thermalPolicyManager, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_trackingLossDelegate);
}

@end
