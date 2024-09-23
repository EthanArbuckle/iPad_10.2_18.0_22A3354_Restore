@implementation ARParentImageSensorSettings

- (ARParentImageSensorSettings)init
{
  ARParentImageSensorSettings *v2;
  uint64_t v3;
  NSArray *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARParentImageSensorSettings;
  v2 = -[ARParentImageSensorSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    settings = v2->_settings;
    v2->_settings = (NSArray *)v3;

  }
  return v2;
}

- (NSArray)settings
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_settings, 1);
}

- (void)setSettings:(id)a3
{
  objc_class *v4;
  id v5;
  NSArray *v6;
  NSArray *settings;

  v4 = (objc_class *)MEMORY[0x1E0C99D20];
  v5 = a3;
  v6 = (NSArray *)objc_msgSend([v4 alloc], "initWithArray:copyItems:", v5, 1);

  settings = self->_settings;
  self->_settings = v6;

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 v12;

  v6 = a3;
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = v6;
    -[ARParentImageSensorSettings settings](self, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[ARParentImageSensorSettings settings](self, "settings"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "settings"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v11 = -[ARParentImageSensorSettings allowCameraInMultipleForegroundAppLayout](self, "allowCameraInMultipleForegroundAppLayout");
      if (v11 == objc_msgSend(v7, "allowCameraInMultipleForegroundAppLayout"))
      {
        v12 = -[ARParentImageSensorSettings audioCaptureEnabled](self, "audioCaptureEnabled");
        v10 = v12 ^ objc_msgSend(v7, "audioCaptureEnabled") ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
      if (v8 == v9)
        goto LABEL_11;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  LOBYTE(v10) = 0;
LABEL_12:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSettings:", self->_settings);
  v4[8] = self->_audioCaptureEnabled;
  v4[9] = self->_allowCameraInMultipleForegroundAppLayout;
  return v4;
}

- (BOOL)audioCaptureEnabled
{
  return self->_audioCaptureEnabled;
}

- (void)setAudioCaptureEnabled:(BOOL)a3
{
  self->_audioCaptureEnabled = a3;
}

- (BOOL)allowCameraInMultipleForegroundAppLayout
{
  return self->_allowCameraInMultipleForegroundAppLayout;
}

- (void)setAllowCameraInMultipleForegroundAppLayout:(BOOL)a3
{
  self->_allowCameraInMultipleForegroundAppLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
