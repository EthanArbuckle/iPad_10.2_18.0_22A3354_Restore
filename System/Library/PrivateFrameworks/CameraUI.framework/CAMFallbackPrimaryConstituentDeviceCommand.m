@implementation CAMFallbackPrimaryConstituentDeviceCommand

- (CAMFallbackPrimaryConstituentDeviceCommand)initWithFallbackPrimaryConstituentDeviceSelection:(int64_t)a3
{
  CAMFallbackPrimaryConstituentDeviceCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMFallbackPrimaryConstituentDeviceCommand;
  result = -[CAMCaptureCommand initWithSubcommands:](&v5, sel_initWithSubcommands_, 0);
  if (result)
    result->__deviceSelection = a3;
  return result;
}

- (CAMFallbackPrimaryConstituentDeviceCommand)initWithSubcommands:(id)a3
{
  return -[CAMFallbackPrimaryConstituentDeviceCommand initWithFallbackPrimaryConstituentDeviceSelection:](self, "initWithFallbackPrimaryConstituentDeviceSelection:", 1);
}

- (CAMFallbackPrimaryConstituentDeviceCommand)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMFallbackPrimaryConstituentDeviceCommand;
  -[CAMCaptureCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSCoding not implemented"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMFallbackPrimaryConstituentDeviceCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMFallbackPrimaryConstituentDeviceCommand _deviceSelection](self, "_deviceSelection");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = -[CAMFallbackPrimaryConstituentDeviceCommand _deviceSelection](self, "_deviceSelection");
  objc_msgSend(v4, "currentVideoDevice");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == 2)
  {
    objc_msgSend(v10, "supportedFallbackPrimaryConstituentDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "mutableCopy");

    v9 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_55);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "removeObjectAtIndex:", v9);
  }
  else if (v5 == 1)
  {
    objc_msgSend(v10, "supportedFallbackPrimaryConstituentDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    if (v5)
      goto LABEL_10;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  }
  if (v6)
  {
    objc_msgSend(v10, "setFallbackPrimaryConstituentDevices:", v6);

  }
LABEL_10:

}

BOOL __65__CAMFallbackPrimaryConstituentDeviceCommand_executeWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "deviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == (void *)*MEMORY[0x1E0C89F98];

  return v3;
}

- (int64_t)_deviceSelection
{
  return self->__deviceSelection;
}

@end
