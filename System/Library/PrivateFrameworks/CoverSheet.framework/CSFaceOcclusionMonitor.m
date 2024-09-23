@implementation CSFaceOcclusionMonitor

- (BOOL)_handleBiometricEvent:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint8_t v7[16];
  uint8_t buf[16];

  if (a3 == 28)
  {
    SBLogDashBoard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEFAULT, "Bottom of face occluded", v7, 2u);
    }
    v5 = 1;
  }
  else
  {
    if (a3 != 21)
      return 0;
    SBLogDashBoard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = 2;
      _os_log_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEFAULT, "Face occluded", buf, 2u);
    }
    else
    {
      v5 = 2;
    }
  }

  self->_faceOcclusionsSinceScreenOn |= v5;
  return 1;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 25)
  {
    self->_faceOcclusionsSinceScreenOn = 0;
LABEL_6:
    v8 = objc_msgSend(v4, "isConsumable");
    goto LABEL_7;
  }
  if (v5 == 15)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CSFaceOcclusionMonitor _handleBiometricEvent:](self, "_handleBiometricEvent:", objc_msgSend(v6, "unsignedIntegerValue"));

    if (v7)
      goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (unint64_t)faceOcclusionsSinceScreenOn
{
  return self->_faceOcclusionsSinceScreenOn;
}

- (CSFaceOcclusionMonitorDelegate)delegate
{
  return (CSFaceOcclusionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
