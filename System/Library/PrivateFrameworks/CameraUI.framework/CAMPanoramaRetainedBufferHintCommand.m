@implementation CAMPanoramaRetainedBufferHintCommand

- (CAMPanoramaRetainedBufferHintCommand)initWithPanoramaRetainedBufferHintEnabled:(BOOL)a3
{
  CAMPanoramaRetainedBufferHintCommand *v4;
  CAMPanoramaRetainedBufferHintCommand *v5;
  CAMPanoramaRetainedBufferHintCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPanoramaRetainedBufferHintCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = -[CAMPanoramaRetainedBufferHintCommand _isEnabled](self, "_isEnabled");
  objc_msgSend(v10, "currentPanoramaOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isVideoRetainedBufferCountHintSupported"))
  {
    objc_msgSend(v10, "currentPanoramaConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
      v9 = objc_msgSend(v7, "ringBufferSize");
    else
      v9 = 0;
    objc_msgSend(v6, "setVideoRetainedBufferCountHint:", v9);

  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMPanoramaRetainedBufferHintCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPanoramaRetainedBufferHintCommand *v5;
  CAMPanoramaRetainedBufferHintCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPanoramaRetainedBufferHintCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMPanoramaRetainedBufferHintCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPanoramaRetainedBufferHintCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMPanoramaRetainedBufferHintCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMPanoramaRetainedBufferHintCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPanoramaRetainedBufferHintCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMPanoramaRetainedBufferHintCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
