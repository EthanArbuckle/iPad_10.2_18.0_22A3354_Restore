@implementation CAMPanoramaEncodingCommand

- (CAMPanoramaEncodingCommand)initWithPhotoEncodingBehavior:(int64_t)a3
{
  CAMPanoramaEncodingCommand *v4;
  CAMPanoramaEncodingCommand *v5;
  CAMPanoramaEncodingCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPanoramaEncodingCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__photoEncodingBehavior = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMPanoramaEncodingCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPanoramaEncodingCommand *v5;
  CAMPanoramaEncodingCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPanoramaEncodingCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__photoEncodingBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMPanoramaEncodingCommandPhotoEncodingBehavior"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPanoramaEncodingCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMPanoramaEncodingCommand _photoEncodingBehavior](self, "_photoEncodingBehavior", v5.receiver, v5.super_class), CFSTR("CAMPanoramaEncodingCommandPhotoEncodingBehavior"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPanoramaEncodingCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMPanoramaEncodingCommand _photoEncodingBehavior](self, "_photoEncodingBehavior");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  int64_t v5;
  id v6;

  v4 = a3;
  v5 = -[CAMPanoramaEncodingCommand _photoEncodingBehavior](self, "_photoEncodingBehavior");
  objc_msgSend(v4, "currentPanoramaOutput");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "changeToEncodingBehavior:", v5);
}

- (int64_t)_photoEncodingBehavior
{
  return self->__photoEncodingBehavior;
}

@end
