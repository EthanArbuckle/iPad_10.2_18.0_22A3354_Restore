@implementation CAMPrepareStillImageCaptureCommand

- (CAMPrepareStillImageCaptureCommand)initWithSystemTime:(unint64_t)a3
{
  CAMPrepareStillImageCaptureCommand *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPrepareStillImageCaptureCommand;
  result = -[CAMCaptureCommand init](&v5, sel_init);
  if (result)
    result->__systemTimeOfCapture = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPrepareStillImageCaptureCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMPrepareStillImageCaptureCommand _systemTimeOfCapture](self, "_systemTimeOfCapture");
  return v4;
}

- (unint64_t)_systemTimeOfCapture
{
  return self->__systemTimeOfCapture;
}

- (void)executeWithContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInitiatedCaptureRequestAtTime:", -[CAMPrepareStillImageCaptureCommand _systemTimeOfCapture](self, "_systemTimeOfCapture"));

}

- (CAMPrepareStillImageCaptureCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPrepareStillImageCaptureCommand *v5;
  CAMPrepareStillImageCaptureCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPrepareStillImageCaptureCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__systemTimeOfCapture = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("CAMPrepareStillImageCaptureCommandSystemTime"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[CAMPrepareStillImageCaptureCommand _systemTimeOfCapture](self, "_systemTimeOfCapture"), CFSTR("CAMPrepareStillImageCaptureCommandSystemTime"));

}

@end
