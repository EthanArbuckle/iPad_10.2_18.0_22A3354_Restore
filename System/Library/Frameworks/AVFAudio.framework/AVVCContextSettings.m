@implementation AVVCContextSettings

- (AVVCContextSettings)initWithMode:(int64_t)a3 deviceUID:(id)a4
{
  id v6;
  AVVCContextSettings *v7;
  AVVCContextSettings *v8;
  uint64_t v9;
  NSString *activationDeviceUID;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVVCContextSettings;
  v7 = -[AVVCContextSettings init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_activationMode = a3;
    v9 = objc_msgSend(v6, "copy");
    activationDeviceUID = v8->_activationDeviceUID;
    v8->_activationDeviceUID = (NSString *)v9;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 16) = -[AVVCContextSettings activationMode](self, "activationMode");
  -[AVVCContextSettings activationDeviceUID](self, "activationDeviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v6;

  *(_BYTE *)(v4 + 8) = -[AVVCContextSettings announceCallsEnabled](self, "announceCallsEnabled");
  return (id)v4;
}

- (int64_t)activationMode
{
  return self->_activationMode;
}

- (void)setActivationMode:(int64_t)a3
{
  self->_activationMode = a3;
}

- (NSString)activationDeviceUID
{
  return self->_activationDeviceUID;
}

- (void)setActivationDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_activationDeviceUID, a3);
}

- (BOOL)announceCallsEnabled
{
  return self->_announceCallsEnabled;
}

- (void)setAnnounceCallsEnabled:(BOOL)a3
{
  self->_announceCallsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationDeviceUID, 0);
}

@end
