@implementation CAMOverlayClientMonitor

- (void)beginMonitoringScene:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[CAMOverlayClientMonitor setDelegate:](self, "setDelegate:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_FBSScene"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cameraOverlaySceneClientMonitor"));
  -[CAMOverlayClientMonitor setUnderlyingMonitor:](self, "setUnderlyingMonitor:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientMonitor underlyingMonitor](self, "underlyingMonitor"));
  objc_msgSend(v9, "addObserver:", self);

}

- (void)endMonitoring
{
  void *v3;

  -[CAMOverlayClientMonitor setDelegate:](self, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientMonitor underlyingMonitor](self, "underlyingMonitor"));
  objc_msgSend(v3, "removeObserver:", self);

  -[CAMOverlayClientMonitor setUnderlyingMonitor:](self, "setUnderlyingMonitor:", 0);
}

- (void)clientMonitor:(id)a3 requestingSceneUpdatedWithInfo:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "overlayRequestingProcessAuditToken", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientMonitor delegate](self, "delegate"));
  objc_msgSend(v5, "clientMonitor:didUpdateWithAuditToken:", self, v6);

}

- (SBSUICameraOverlaySceneClientMonitor)underlyingMonitor
{
  return self->_underlyingMonitor;
}

- (void)setUnderlyingMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingMonitor, a3);
}

- (CAMOverlayClientMonitorDelegate)delegate
{
  return (CAMOverlayClientMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_underlyingMonitor, 0);
}

@end
