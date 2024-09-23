@implementation CAMPhotoQualityPrioritizationConfigurationCommand

- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithPhotoQualityPrioritization:(int64_t)a3
{
  CAMPhotoQualityPrioritizationConfigurationCommand *v4;
  CAMPhotoQualityPrioritizationConfigurationCommand *v5;
  CAMPhotoQualityPrioritizationConfigurationCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPhotoQualityPrioritizationConfigurationCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__photoQualityPrioritization = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithSubcommands:(id)a3
{
  return -[CAMPhotoQualityPrioritizationConfigurationCommand initWithPhotoQualityPrioritization:](self, "initWithPhotoQualityPrioritization:", 1);
}

- (CAMPhotoQualityPrioritizationConfigurationCommand)initWithCoder:(id)a3
{
  return -[CAMPhotoQualityPrioritizationConfigurationCommand initWithPhotoQualityPrioritization:](self, "initWithPhotoQualityPrioritization:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("CAMPhotoQualityPrioritizationConfigurationKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPhotoQualityPrioritizationConfigurationCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMPhotoQualityPrioritizationConfigurationCommand _photoQualityPrioritization](self, "_photoQualityPrioritization", v5.receiver, v5.super_class), CFSTR("CAMPhotoQualityPrioritizationConfigurationKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPhotoQualityPrioritizationConfigurationCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMPhotoQualityPrioritizationConfigurationCommand _photoQualityPrioritization](self, "_photoQualityPrioritization");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxPhotoQualityPrioritization:", +[CAMCaptureConversions AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:](CAMCaptureConversions, "AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:", -[CAMPhotoQualityPrioritizationConfigurationCommand _photoQualityPrioritization](self, "_photoQualityPrioritization")));

}

- (int64_t)_photoQualityPrioritization
{
  return self->__photoQualityPrioritization;
}

@end
