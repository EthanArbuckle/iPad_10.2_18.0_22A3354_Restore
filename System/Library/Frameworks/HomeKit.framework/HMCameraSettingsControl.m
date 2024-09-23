@implementation HMCameraSettingsControl

- (HMCameraSettingsControl)initWithSettingsControl:(id)a3
{
  id v5;
  HMCameraSettingsControl *v6;
  HMCameraSettingsControl *v7;
  HMCameraSettingsControl *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMCameraSettingsControl;
    v6 = -[HMCameraControl init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_settingsControl, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HMCharacteristic)nightVision
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nightVision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)currentHorizontalTilt
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentHorizontalTilt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)targetHorizontalTilt
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetHorizontalTilt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)currentVerticalTilt
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentVerticalTilt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)targetVerticalTilt
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetVerticalTilt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)opticalZoom
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opticalZoom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)digitalZoom
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "digitalZoom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)imageRotation
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageRotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (HMCharacteristic)imageMirroring
{
  void *v2;
  void *v3;

  -[HMCameraSettingsControl settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageMirroring");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (_HMCameraSettingsControl)settingsControl
{
  return self->_settingsControl;
}

- (void)setSettingsControl:(id)a3
{
  objc_storeStrong((id *)&self->_settingsControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsControl, 0);
}

@end
