@implementation RPPipViewController

- (RPPipViewController)initWithOrientation:(int64_t)a3 position:(int64_t)a4
{
  RPPipViewController *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  RPPipViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)RPPipViewController;
  v6 = -[RPPipViewController init](&v8, sel_init);
  if (v6)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[RPPipViewController initWithOrientation:position:]";
      v11 = 1024;
      v12 = 87;
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    -[RPPipViewController setInitialOrientation:](v6, "setInitialOrientation:", a3);
    -[RPPipViewController setPreviousOrientation:](v6, "setPreviousOrientation:", a3);
    v6->_cameraPosition = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  RPPipViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPPipViewController dealloc]";
    v6 = 1024;
    v7 = 98;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  -[RPPipViewController removeSystemPrefferedCameraObserver](self, "removeSystemPrefferedCameraObserver");
  v3.receiver = self;
  v3.super_class = (Class)RPPipViewController;
  -[RPPipViewController dealloc](&v3, sel_dealloc);
}

- (id)cameraWithPosition:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB2460], "devicesWithMediaType:", *MEMORY[0x24BDB1D50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v22 = "-[RPPipViewController cameraWithPosition:]";
      v23 = 1024;
      v24 = 118;
      v25 = 1024;
      v26 = objc_msgSend(v4, "count");
      v5 = MEMORY[0x24BDACB70];
      v6 = " [INFO] %{public}s:%d looking for camera in %d capture devices";
      v7 = 24;
LABEL_8:
      _os_log_impl(&dword_214135000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v22 = "-[RPPipViewController cameraWithPosition:]";
    v23 = 1024;
    v24 = 120;
    v5 = MEMORY[0x24BDACB70];
    v6 = " [INFO] %{public}s:%d no capture devices found";
    v7 = 18;
    goto LABEL_8;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "position", (_QWORD)v16) == a3)
        {
          if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v22 = "-[RPPipViewController cameraWithPosition:]";
            v23 = 1024;
            v24 = 131;
            v25 = 1024;
            v26 = a3;
            _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera found with position %d", buf, 0x18u);
          }
          v14 = v13;

          goto LABEL_25;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[RPPipViewController cameraWithPosition:].cold.1();
  v14 = 0;
LABEL_25:

  return v14;
}

- (void)configurePipSessionWithCameraPosition:(int64_t)a3
{
  void *v5;
  AVCaptureDeviceInput *v6;
  id v7;
  AVCaptureDeviceInput *videoInput;
  BOOL v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPPipViewController configurePipSessionWithCameraPosition:]";
    v13 = 1024;
    v14 = 141;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  -[AVCaptureSession beginConfiguration](self->_pipSession, "beginConfiguration");
  if (self->_videoInput)
    -[AVCaptureSession removeInput:](self->_pipSession, "removeInput:");
  -[RPPipViewController cameraWithPosition:](self, "cameraWithPosition:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = (AVCaptureDeviceInput *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2470]), "initWithDevice:error:", v5, &v10);
  v7 = v10;
  videoInput = self->_videoInput;
  self->_videoInput = v6;

  if (self->_videoInput)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    -[AVCaptureSession addInput:](self->_pipSession, "addInput:");
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RPPipViewController configurePipSessionWithCameraPosition:].cold.1(v7);
  }
  -[AVCaptureSession commitConfiguration](self->_pipSession, "commitConfiguration");

}

- (void)setCameraPosition:(int64_t)a3
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPPipViewController setCameraPosition:]";
    v7 = 1024;
    v8 = 167;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  if (self->_pipSession && self->_cameraPosition != a3)
    -[RPPipViewController configurePipSessionWithCameraPosition:](self, "configurePipSessionWithCameraPosition:", a3);
  self->_cameraPosition = a3;
}

- (void)setUpPipSession
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d video input error %@", v1, v2, v3, v4, 2u);
}

- (void)startPipSession
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPPipViewController startPipSession]";
    v6 = 1024;
    v7 = 217;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  -[RPPipViewController pipSession](self, "pipSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRunning");

}

- (void)stopPipSession
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPPipViewController stopPipSession]";
    v6 = 1024;
    v7 = 223;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  -[RPPipViewController removeSystemPrefferedCameraObserver](self, "removeSystemPrefferedCameraObserver");
  -[RPPipViewController pipSession](self, "pipSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopRunning");

}

- (void)loadView
{
  RPPipView *v3;
  RPPipView *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPPipViewController loadView]";
    v9 = 1024;
    v10 = 230;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  v3 = [RPPipView alloc];
  v4 = -[RPPipView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[RPPipViewController setView:](self, "setView:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPPipViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[RPPipViewController _updateViewGeometry](self, "_updateViewGeometry");
  -[RPPipViewController setUpPipSession](self, "setUpPipSession");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPPipViewController viewWillAppear:]";
    v11 = 1024;
    v12 = 262;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v8.receiver = self;
  v8.super_class = (Class)RPPipViewController;
  -[RPPipViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  -[RPPipViewController startPipSession](self, "startPipSession");
  -[RPPipViewController _pipView](self, "_pipView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVideoOrientation:", -[RPPipViewController _captureVideoOrientationForUIDeviceOrientation:](self, "_captureVideoOrientationForUIDeviceOrientation:", self->_initialOrientation));

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPPipViewController viewDidAppear:]";
    v13 = 1024;
    v14 = 271;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v10.receiver = self;
  v10.super_class = (Class)RPPipViewController;
  -[RPPipViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
  -[RPPipViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInterfaceAutorotationDisabled");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__deviceOrientationDidChange, *MEMORY[0x24BDF76D8], 0);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginGeneratingDeviceOrientationNotifications");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPPipViewController viewDidDisappear:]";
    v13 = 1024;
    v14 = 281;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v10.receiver = self;
  v10.super_class = (Class)RPPipViewController;
  -[RPPipViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
  -[RPPipViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInterfaceAutorotationDisabled");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endGeneratingDeviceOrientationNotifications");

  }
  -[RPPipViewController stopPipSession](self, "stopPipSession");
}

- (void)_updateViewGeometry
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
  void *v13;
  int64_t initialOrientation;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  BOOL v29;
  void *v30;
  int64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "orientation"))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    initialOrientation = objc_msgSend(v13, "orientation");

  }
  else
  {
    initialOrientation = self->_initialOrientation;
  }

  v15 = initialOrientation - 5;
  v16 = initialOrientation - 1;
  if (v9 >= v11)
    v17 = v11;
  else
    v17 = v9;
  if (v9 >= v11)
    v18 = v9;
  else
    v18 = v11;
  if (v16 > 1)
  {
    v18 = v11;
    v17 = v9;
  }
  if (v9 <= v11)
    v19 = v11;
  else
    v19 = v9;
  if (v9 <= v11)
    v20 = v9;
  else
    v20 = v11;
  if (v15 >= 0xFFFFFFFFFFFFFFFELL)
    v21 = v20;
  else
    v21 = v18;
  if (v15 >= 0xFFFFFFFFFFFFFFFELL)
    v22 = v19;
  else
    v22 = v17;
  v44 = v22 * 0.2;
  v23 = v21 * (v22 * 0.2 / v22);
  -[RPPipViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  if (v25 == 0.0)
  {
    -[RPPipViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27;

    v29 = v28 == 0.0;
    v23 = v21 * (v22 * 0.2 / v22);
    if (v29)
    {
      -[RPPipViewController view](self, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFrame:", v5 + v22 * 0.03, v7 + v21 * 0.03, v44, v21 * (v22 * 0.2 / v22));
LABEL_40:

      goto LABEL_41;
    }
  }
  else
  {

  }
  if ((unint64_t)(-[RPPipViewController previousOrientation](self, "previousOrientation") - 3) <= 1 && v16 < 2
    || (v31 = -[RPPipViewController previousOrientation](self, "previousOrientation"), v15 >= 0xFFFFFFFFFFFFFFFELL)
    && (unint64_t)(v31 - 3) >= 0xFFFFFFFFFFFFFFFELL
    || (-[RPPipViewController previousOrientation](self, "previousOrientation") == 5
     || -[RPPipViewController previousOrientation](self, "previousOrientation") == 6)
    && ((-[RPPipViewController previousOrientationWidth](self, "previousOrientationWidth"),
         v33 = v32,
         -[RPPipViewController previousOrientationHeight](self, "previousOrientationHeight"),
         v15 >= 0xFFFFFFFFFFFFFFFELL)
     && v33 < v34
     || (-[RPPipViewController previousOrientationWidth](self, "previousOrientationWidth"),
         v36 = v35,
         -[RPPipViewController previousOrientationHeight](self, "previousOrientationHeight"),
         v36 > v37)
     && v16 <= 1))
  {
    -[RPPipViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v39 = v38;
    -[RPPipViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v42 = v41;
    -[RPPipViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFrame:", v39, v42, v44, v23);

    goto LABEL_40;
  }
LABEL_41:
  -[RPPipViewController setPreviousOrientation:](self, "setPreviousOrientation:", initialOrientation);
  -[RPPipViewController setPreviousOrientationWidth:](self, "setPreviousOrientationWidth:", v9);
  -[RPPipViewController setPreviousOrientationHeight:](self, "setPreviousOrientationHeight:", v11);
}

- (void)_deviceOrientationDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__RPPipViewController__deviceOrientationDidChange__block_invoke;
  v7[3] = &unk_24D15D648;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v7, 0.3);
  -[RPPipViewController _pipView](self, "_pipView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVideoOrientation:", -[RPPipViewController _captureVideoOrientationForUIDeviceOrientation:](self, "_captureVideoOrientationForUIDeviceOrientation:", objc_msgSend(v6, "orientation")));

}

uint64_t __50__RPPipViewController__deviceOrientationDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateViewGeometry");
}

- (int64_t)_captureVideoOrientationForUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 1;
  else
    return a3;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (AVCaptureSession)pipSession
{
  return self->_pipSession;
}

- (void)setPipSession:(id)a3
{
  objc_storeStrong((id *)&self->_pipSession, a3);
}

- (AVCaptureDevice)videoDevice
{
  return self->_videoDevice;
}

- (void)setVideoDevice:(id)a3
{
  objc_storeStrong((id *)&self->_videoDevice, a3);
}

- (AVCaptureDeviceInput)videoInput
{
  return self->_videoInput;
}

- (void)setVideoInput:(id)a3
{
  objc_storeStrong((id *)&self->_videoInput, a3);
}

- (int64_t)initialOrientation
{
  return self->_initialOrientation;
}

- (void)setInitialOrientation:(int64_t)a3
{
  self->_initialOrientation = a3;
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_previousOrientation = a3;
}

- (double)previousOrientationWidth
{
  return self->_previousOrientationWidth;
}

- (void)setPreviousOrientationWidth:(double)a3
{
  self->_previousOrientationWidth = a3;
}

- (double)previousOrientationHeight
{
  return self->_previousOrientationHeight;
}

- (void)setPreviousOrientationHeight:(double)a3
{
  self->_previousOrientationHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong((id *)&self->_videoDevice, 0);
  objc_storeStrong((id *)&self->_pipSession, 0);
}

- (void)cameraWithPosition:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Camera not found", v1, v2, v3, v4, 2u);
}

- (void)configurePipSessionWithCameraPosition:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v2, " [ERROR] %{public}s:%d Error creating capture device input: %@", v3, v4, v5, v6, 2u);

}

@end
