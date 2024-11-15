@implementation CAMStopPanoramaCommand

- (CAMStopPanoramaCommand)initWithInterrupted:(BOOL)a3
{
  CAMStopPanoramaCommand *v4;
  CAMStopPanoramaCommand *v5;
  CAMStopPanoramaCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMStopPanoramaCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__interrupted = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMStopPanoramaCommand)initWithCoder:(id)a3
{
  id v4;
  CAMStopPanoramaCommand *v5;
  CAMStopPanoramaCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMStopPanoramaCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__interrupted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMStopPanoramaCommandInterrupted"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStopPanoramaCommand _interrupted](self, "_interrupted"), CFSTR("CAMStopPanoramaCommandInterrupted"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMStopPanoramaCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMStopPanoramaCommand _interrupted](self, "_interrupted");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "stopPanoramaCaptureInterrupted:", -[CAMStopPanoramaCommand _interrupted](self, "_interrupted"));

}

- (BOOL)_interrupted
{
  return self->__interrupted;
}

@end
