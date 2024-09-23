@implementation RPAngelCameraPipViewController

- (RPAngelCameraPipViewController)init
{
  RPAngelCameraPipViewController *v2;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  RPAngelCameraPipViewController *v10;

  v4.receiver = self;
  v4.super_class = (Class)RPAngelCameraPipViewController;
  v2 = -[RPAngelCameraPipViewController init](&v4, "init");
  if (v2)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v6 = "-[RPAngelCameraPipViewController init]";
      v7 = 1024;
      v8 = 32;
      v9 = 2048;
      v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v2->_isRunning = 0;
    -[RPAngelCameraPipViewController setupPreview](v2, "setupPreview");
  }
  return v2;
}

- (id)cameraWithPosition:(int64_t)a3
{
  void *v4;
  const char *v5;
  uint32_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice devicesWithMediaType:](AVCaptureDevice, "devicesWithMediaType:", AVMediaTypeVideo));
  if (v4)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v21 = "-[RPAngelCameraPipViewController cameraWithPosition:]";
      v22 = 1024;
      v23 = 43;
      v24 = 1024;
      v25 = objc_msgSend(v4, "count");
      v5 = " [INFO] %{public}s:%d looking for camera in %d capture devices";
      v6 = 24;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
    }
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPAngelCameraPipViewController cameraWithPosition:]";
    v22 = 1024;
    v23 = 45;
    v5 = " [INFO] %{public}s:%d no capture devices found";
    v6 = 18;
    goto LABEL_8;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "position", (_QWORD)v16) == (id)a3)
        {
          if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID"));
            *(_DWORD *)buf = 136446978;
            v21 = "-[RPAngelCameraPipViewController cameraWithPosition:]";
            v22 = 1024;
            v23 = 51;
            v24 = 1024;
            v25 = a3;
            v26 = 2112;
            v27 = v14;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera found with position %d UID %@", buf, 0x22u);

          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID"));

          goto LABEL_25;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100024F00();
  v13 = 0;
LABEL_25:

  return v13;
}

- (void)setupPreview
{
  CALayer *v3;
  CALayer *previewLayer;
  AVConferencePreview *v5;
  AVConferencePreview *preview;
  AVConferencePreview *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446466;
    v16 = "-[RPAngelCameraPipViewController setupPreview]";
    v17 = 1024;
    v18 = 60;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v15, 0x12u);
  }
  v3 = (CALayer *)objc_alloc_init((Class)CALayer);
  previewLayer = self->_previewLayer;
  self->_previewLayer = v3;

  v5 = (AVConferencePreview *)objc_claimAutoreleasedReturnValue(+[AVConferencePreview AVConferencePreviewSingleton](AVConferencePreview, "AVConferencePreviewSingleton"));
  preview = self->_preview;
  self->_preview = v5;

  -[AVConferencePreview setDelegate:](self->_preview, "setDelegate:", self);
  v7 = self->_preview;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController cameraWithPosition:](self, "cameraWithPosition:", 2));
  -[AVConferencePreview setLocalCameraWithUID:](v7, "setLocalCameraWithUID:", v8);

  -[AVConferencePreview setLocalVideoLayer:front:](self->_preview, "setLocalVideoLayer:front:", self->_previewLayer, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "setMasksToBounds:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v12, "addSublayer:", self->_previewLayer);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AVConferencePreview localVideoAttributes](self->_preview, "localVideoAttributes"));
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446722;
    v16 = "-[RPAngelCameraPipViewController setupPreview]";
    v17 = 1024;
    v18 = 70;
    v19 = 2112;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d localVideoAttributes %@", (uint8_t *)&v15, 0x1Cu);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AVConferencePreview localScreenAttributesForVideoAttributes:](self->_preview, "localScreenAttributesForVideoAttributes:", v13));

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446722;
    v16 = "-[RPAngelCameraPipViewController setupPreview]";
    v17 = 1024;
    v18 = 72;
    v19 = 2112;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d localScreenAttributes %@", (uint8_t *)&v15, 0x1Cu);
  }
  -[RPAngelCameraPipViewController layoutPreviewLayer](self, "layoutPreviewLayer");

}

- (void)startPipSession
{
  AVConferencePreview *preview;
  const char *v4;
  AVConferencePreview *v5;
  AVConferencePreview *v6;
  uint64_t v7;
  PGPictureInPictureProxy *v8;
  PGPictureInPictureProxy *pegasusProxy;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVConferencePreview *v18;
  __int16 v19;
  uint64_t v20;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    preview = self->_preview;
    *(_DWORD *)buf = 136446722;
    v14 = "-[RPAngelCameraPipViewController startPipSession]";
    v15 = 1024;
    v16 = 77;
    v17 = 2048;
    v18 = preview;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  if ((+[PGPictureInPictureProxy isPictureInPictureSupported](PGPictureInPictureProxy, "isPictureInPictureSupported") & 1) != 0)
  {
    if (self->_isRunning)
    {
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v14 = "-[RPAngelCameraPipViewController startPipSession]";
        v15 = 1024;
        v16 = 107;
        v4 = " [INFO] %{public}s:%d pip already running";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, buf, 0x12u);
      }
    }
    else
    {
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        -[RPAngelCameraPipViewController preferredContentSize](self, "preferredContentSize");
        v6 = v5;
        -[RPAngelCameraPipViewController preferredContentSize](self, "preferredContentSize");
        *(_DWORD *)buf = 136446978;
        v14 = "-[RPAngelCameraPipViewController startPipSession]";
        v15 = 1024;
        v16 = 82;
        v17 = 2048;
        v18 = v6;
        v19 = 2048;
        v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferred content size: w:%lf x h:%lf", buf, 0x26u);
      }
      v8 = (PGPictureInPictureProxy *)objc_msgSend(objc_alloc((Class)PGPictureInPictureProxy), "initWithControlsStyle:viewController:", 0, self);
      pegasusProxy = self->_pegasusProxy;
      self->_pegasusProxy = v8;

      -[PGPictureInPictureProxy setDelegate:](self->_pegasusProxy, "setDelegate:", self);
      if ((-[AVConferencePreview isPreviewRunning](self->_preview, "isPreviewRunning") & 1) == 0)
      {
        if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v14 = "-[RPAngelCameraPipViewController startPipSession]";
          v15 = 1024;
          v16 = 89;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d not running, can start", buf, 0x12u);
        }
        -[AVConferencePreview startPreview](self->_preview, "startPreview");
        if (-[PGPictureInPictureProxy isPictureInPicturePossible](self->_pegasusProxy, "isPictureInPicturePossible"))
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000062C0;
          block[3] = &unk_100034D10;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        else
        {
          -[PGPictureInPictureProxy addObserver:forKeyPath:options:context:](self->_pegasusProxy, "addObserver:forKeyPath:options:context:", self, CFSTR("pictureInPicturePossible"), 0, 0);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v10, "addObserver:selector:name:object:", self, "updateViewGeometry", UIDeviceOrientationDidChangeNotification, 0);

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        objc_msgSend(v11, "beginGeneratingDeviceOrientationNotifications");

        self->_isRunning = 1;
      }
    }
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[RPAngelCameraPipViewController startPipSession]";
    v15 = 1024;
    v16 = 79;
    v4 = " [INFO] %{public}s:%d pip not supported on device";
    goto LABEL_12;
  }
}

- (void)stopPipSession
{
  PGPictureInPictureProxy *pegasusProxy;
  PGPictureInPictureProxy *v4;
  CALayer *previewLayer;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[RPAngelCameraPipViewController stopPipSession]";
    v10 = 1024;
    v11 = 112;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  pegasusProxy = self->_pegasusProxy;
  if (pegasusProxy)
  {
    -[PGPictureInPictureProxy stopPictureInPictureAndRestoreUserInterface:](pegasusProxy, "stopPictureInPictureAndRestoreUserInterface:", 0);
    -[PGPictureInPictureProxy removeObserver:forKeyPath:](self->_pegasusProxy, "removeObserver:forKeyPath:", self, CFSTR("pictureInPicturePossible"));
    -[PGPictureInPictureProxy setDelegate:](self->_pegasusProxy, "setDelegate:", 0);
    v4 = self->_pegasusProxy;
    self->_pegasusProxy = 0;

  }
  -[AVConferencePreview stopPreview](self->_preview, "stopPreview");
  -[AVConferencePreview setDelegate:](self->_preview, "setDelegate:", 0);
  previewLayer = self->_previewLayer;
  self->_previewLayer = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, UIDeviceOrientationDidChangeNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  objc_msgSend(v7, "endGeneratingDeviceOrientationNotifications");

  self->_isRunning = 0;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPAngelCameraPipViewController loadView]";
    v8 = 1024;
    v9 = 135;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RPAngelCameraPipViewController setView:](self, "setView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[RPAngelCameraPipViewController updateViewGeometry](self, "updateViewGeometry");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;

  v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v7 = "-[RPAngelCameraPipViewController viewDidDisappear:]";
    v8 = 1024;
    v9 = 142;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5.receiver = self;
  v5.super_class = (Class)RPAngelCameraPipViewController;
  -[RPAngelCameraPipViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  -[RPAngelCameraPipViewController stopPipSession](self, "stopPipSession");
}

- (void)viewDidLayoutSubviews
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelCameraPipViewController viewDidLayoutSubviews]";
    v5 = 1024;
    v6 = 148;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d viewDidLayoutSubviews", (uint8_t *)&v3, 0x12u);
  }
  -[RPAngelCameraPipViewController layoutPreviewLayer](self, "layoutPreviewLayer");
}

- (void)layoutPreviewLayer
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AVConferencePreview localVideoAttributes](self->_preview, "localVideoAttributes"));
  if (objc_msgSend(v8, "camera") == 3)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 136446466;
      v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
      v42 = 1024;
      v43 = 158;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera invalid", (uint8_t *)&v40, 0x12u);
    }
    objc_msgSend(v8, "setRatio:", 1080.0, 1920.0);
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ratio");
    v10 = v9;
    objc_msgSend(v8, "ratio");
    v40 = 136446978;
    v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
    v42 = 1024;
    v43 = 163;
    v44 = 2048;
    v45 = v10;
    v46 = 2048;
    v47 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d localVideoAttributes: %lf x %lf", (uint8_t *)&v40, 0x26u);
  }
  objc_msgSend(v8, "ratio");
  v13 = v5 / v12;
  objc_msgSend(v8, "ratio");
  v15 = v7 / v14;
  objc_msgSend(v8, "ratio");
  if (v13 <= v15)
  {
    v20 = v17 * v15;
    v21 = v7;
    -[CALayer setFrame:](self->_previewLayer, "setFrame:", (v5 - v20) * 0.5, 0.0, v20, v21);
  }
  else
  {
    v19 = v18 * v13;
    v16 = v5;
    -[CALayer setFrame:](self->_previewLayer, "setFrame:", 0.0, (v7 - v19) * 0.5, v16);
  }
  if (__RPLogLevel <= 1u)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController view](self, "view"));
      objc_msgSend(v22, "frame");
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController view](self, "view"));
      objc_msgSend(v25, "frame");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController view](self, "view"));
      objc_msgSend(v28, "frame");
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RPAngelCameraPipViewController view](self, "view"));
      objc_msgSend(v31, "frame");
      v40 = 136447490;
      v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
      v42 = 1024;
      v43 = 179;
      v44 = 2048;
      v45 = v24;
      v46 = 2048;
      v47 = v27;
      v48 = 2048;
      v49 = v30;
      v50 = 2048;
      v51 = v32;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d view frame - origin:%lf, %lf size:%lf x %lf", (uint8_t *)&v40, 0x3Au);

    }
    if (__RPLogLevel <= 1u)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v40 = 136446978;
        v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
        v42 = 1024;
        v43 = 180;
        v44 = 2048;
        v45 = v13;
        v46 = 2048;
        v47 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d width factor: %f height factor:%f", (uint8_t *)&v40, 0x26u);
      }
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        -[CALayer frame](self->_previewLayer, "frame");
        v34 = v33;
        -[CALayer frame](self->_previewLayer, "frame");
        v36 = v35;
        -[CALayer frame](self->_previewLayer, "frame");
        v38 = v37;
        -[CALayer frame](self->_previewLayer, "frame");
        v40 = 136447490;
        v41 = "-[RPAngelCameraPipViewController layoutPreviewLayer]";
        v42 = 1024;
        v43 = 181;
        v44 = 2048;
        v45 = v34;
        v46 = 2048;
        v47 = v36;
        v48 = 2048;
        v49 = v38;
        v50 = 2048;
        v51 = v39;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preview layer frame - origin:%lf, %lf size:%lf x %lf", (uint8_t *)&v40, 0x3Au);
      }
    }
  }

}

- (void)updateViewGeometry
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[RPAngelCameraPipViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5 * 0.2, v5 * 0.2);
  -[PGPictureInPictureProxy preferredContentSizeDidChangeForViewController](self->_pegasusProxy, "preferredContentSizeDidChangeForViewController");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD block[5];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("pictureInPicturePossible"))
    && -[PGPictureInPictureProxy isPictureInPicturePossible](self->_pegasusProxy, "isPictureInPicturePossible"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006E70;
    block[3] = &unk_100034D10;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_msgSend(v10, "removeObserver:forKeyPath:", self, CFSTR("pictureInPicturePossible"));
  }

}

- (void)didStartPreview
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPAngelCameraPipViewController didStartPreview]";
    v4 = 1024;
    v5 = 212;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
}

- (void)didPausePreview
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPAngelCameraPipViewController didPausePreview]";
    v4 = 1024;
    v5 = 216;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
}

- (void)didStopPreview
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446466;
    v3 = "-[RPAngelCameraPipViewController didStopPreview]";
    v4 = 1024;
    v5 = 220;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
}

- (void)cameraDidBecomeAvailableForUniqueID:(id)a3
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPAngelCameraPipViewController cameraDidBecomeAvailableForUniqueID:]";
    v6 = 1024;
    v7 = 224;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }

}

- (void)cameraDidBecomeInterruptedForForUniqueID:(id)a3 reason:(int64_t)a4
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPAngelCameraPipViewController cameraDidBecomeInterruptedForForUniqueID:reason:]";
    v7 = 1024;
    v8 = 228;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }

}

- (void)didChangeLocalVideoAttributes:(id)a3
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;

  v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446722;
    v5 = "-[RPAngelCameraPipViewController didChangeLocalVideoAttributes:]";
    v6 = 1024;
    v7 = 232;
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@", (uint8_t *)&v4, 0x1Cu);
  }

}

- (void)didChangeLocalScreenAttributes:(id)a3
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;

  v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446722;
    v5 = "-[RPAngelCameraPipViewController didChangeLocalScreenAttributes:]";
    v6 = 1024;
    v7 = 236;
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %@", (uint8_t *)&v4, 0x1Cu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusProxy, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
}

@end
