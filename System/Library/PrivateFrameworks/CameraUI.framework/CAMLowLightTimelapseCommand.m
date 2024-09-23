@implementation CAMLowLightTimelapseCommand

- (CAMLowLightTimelapseCommand)initWithTimelapseLowLightCompensationEnabled:(BOOL)a3
{
  CAMLowLightTimelapseCommand *v4;
  CAMLowLightTimelapseCommand *v5;
  CAMLowLightTimelapseCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMLowLightTimelapseCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
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
  void *v4;
  CMTime v5;
  CMTime time2;
  CMTime time1;
  CMTime v8;
  CMTime v9;

  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v9, 0, sizeof(v9));
  CMTimeMake(&v9, 1, 15);
  if (-[CAMLowLightTimelapseCommand _isEnabled](self, "_isEnabled"))
  {
    memset(&v8, 0, sizeof(v8));
    if (v4)
      objc_msgSend(v4, "activeVideoMaxFrameDuration");
    time1 = v8;
    time2 = v9;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      v5 = v9;
      objc_msgSend(v4, "setActiveVideoMaxFrameDuration:", &v5);
    }
  }

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMLowLightTimelapseCommand)initWithCoder:(id)a3
{
  id v4;
  CAMLowLightTimelapseCommand *v5;
  CAMLowLightTimelapseCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMLowLightTimelapseCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMLowLightTimelapseCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightTimelapseCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMLowLightTimelapseCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMLowLightTimelapseCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMLowLightTimelapseCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMLowLightTimelapseCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
