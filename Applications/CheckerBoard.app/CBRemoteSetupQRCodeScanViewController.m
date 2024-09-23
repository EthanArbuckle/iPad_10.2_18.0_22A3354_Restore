@implementation CBRemoteSetupQRCodeScanViewController

- (CBRemoteSetupQRCodeScanViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 remoteSetupManager:(id)a6 captureSession:(id)a7
{
  id v13;
  id v14;
  CBRemoteSetupQRCodeScanViewController *v15;
  CBRemoteSetupQRCodeScanViewController *v16;
  objc_super v18;

  v13 = a6;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)CBRemoteSetupQRCodeScanViewController;
  v15 = -[CBRemoteSetupQRCodeScanViewController initWithTitle:detailText:icon:](&v18, "initWithTitle:detailText:icon:", a3, a4, a5);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_remoteSetupManager, a6);
    objc_storeStrong((id *)&v16->_captureSession, a7);
  }

  return v16;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CBRemoteSetupQRCodeScanViewController;
  -[CBRemoteSetupQRCodeScanViewController viewDidLoad](&v3, "viewDidLoad");
  -[CBRemoteSetupQRCodeScanViewController setupView](self, "setupView");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CBRemoteSetupQRCodeScanViewController;
  -[CBRemoteSetupQRCodeScanViewController viewDidAppear:](&v14, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController capturePreviewLayer](self, "capturePreviewLayer"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBRemoteSetupQRCodeScanViewController;
  -[CBRemoteSetupQRCodeScanViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController remoteSetupManager](self, "remoteSetupManager"));
  v5 = objc_msgSend(v4, "setupState");

  if (v5 == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController remoteSetupManager](self, "remoteSetupManager"));
    objc_msgSend(v6, "restartRemoteSetupBroadcast");

  }
}

- (void)setupView
{
  void *v3;
  void *v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
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
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  id location;
  _QWORD v66[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController headerView](self, "headerView"));
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setTitleHyphenationFactor:", v5);

  v6 = objc_alloc_init((Class)UIView);
  -[CBRemoteSetupQRCodeScanViewController setContainerView:](self, "setContainerView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10001F84C;
  v63[3] = &unk_100075C60;
  objc_copyWeak(&v64, &location);
  -[CBRemoteSetupQRCodeScanViewController addContentSubView:heightConstraintForLayout:](self, "addContentSubView:heightConstraintForLayout:", v8, v63);

  v9 = objc_alloc((Class)UIView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  objc_msgSend(v10, "frame");
  v11 = objc_msgSend(v9, "initWithFrame:");
  -[CBRemoteSetupQRCodeScanViewController setPreviewView:](self, "setPreviewView:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  objc_msgSend(v13, "addSubview:", v14);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v66[0] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v66[1] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v66[2] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController view](self, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 0.0));
  v66[3] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "centerXAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerXAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v66[4] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerYAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v66[5] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v16));
  v66[6] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController containerView](self, "containerView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "heightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v21));
  v66[7] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController view](self, "view"));
  objc_msgSend(v24, "setNeedsLayout");

  v25 = objc_alloc((Class)AVCaptureVideoPreviewLayer);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController captureSession](self, "captureSession"));
  v27 = objc_msgSend(v25, "initWithSession:", v26);

  objc_msgSend(v27, "setVideoGravity:", kCAGravityResizeAspectFill);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  objc_msgSend(v28, "frame");
  objc_msgSend(v27, "setFrame:");

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupQRCodeScanViewController previewView](self, "previewView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
  objc_msgSend(v30, "addSublayer:", v27);

  -[CBRemoteSetupQRCodeScanViewController setCapturePreviewLayer:](self, "setCapturePreviewLayer:", v27);
  objc_destroyWeak(&v64);
  objc_destroyWeak(&location);
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_captureSession, a3);
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (AVCaptureVideoPreviewLayer)capturePreviewLayer
{
  return self->_capturePreviewLayer;
}

- (void)setCapturePreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_capturePreviewLayer, a3);
}

- (CBRemoteSetupManager)remoteSetupManager
{
  return self->_remoteSetupManager;
}

- (void)setRemoteSetupManager:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSetupManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSetupManager, 0);
  objc_storeStrong((id *)&self->_capturePreviewLayer, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end
