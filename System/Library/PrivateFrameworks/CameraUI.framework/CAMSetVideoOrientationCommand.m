@implementation CAMSetVideoOrientationCommand

- (CAMSetVideoOrientationCommand)initWithCaptureOrientation:(int64_t)a3
{
  CAMSetVideoOrientationCommand *v4;
  CAMSetVideoOrientationCommand *v5;
  CAMSetVideoOrientationCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMSetVideoOrientationCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__captureOrientation = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMSetVideoOrientationCommand)initWithCoder:(id)a3
{
  id v4;
  CAMSetVideoOrientationCommand *v5;
  CAMSetVideoOrientationCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMSetVideoOrientationCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__captureOrientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMSetVideoOrientationCommandCaptureOrientation"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMSetVideoOrientationCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMSetVideoOrientationCommand _captureOrientation](self, "_captureOrientation", v5.receiver, v5.super_class), CFSTR("CAMSetVideoOrientationCommandCaptureOrientation"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMSetVideoOrientationCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMSetVideoOrientationCommand _captureOrientation](self, "_captureOrientation");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[CAMSetVideoOrientationCommand _captureOrientation](self, "_captureOrientation");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v10, "currentMovieFileOutput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentStillImageOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      v7 = v6;
    objc_msgSend(v7, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVideoOrientation:", -[CAMSetVideoOrientationCommand _videoOrientationForCaptureOrientation:](self, "_videoOrientationForCaptureOrientation:", v5));

  }
}

- (int64_t)_videoOrientationForCaptureOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 1;
  else
    return a3;
}

- (int64_t)_captureOrientation
{
  return self->__captureOrientation;
}

@end
