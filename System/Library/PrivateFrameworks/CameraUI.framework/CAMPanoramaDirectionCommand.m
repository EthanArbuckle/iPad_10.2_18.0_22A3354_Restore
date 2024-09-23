@implementation CAMPanoramaDirectionCommand

- (CAMPanoramaDirectionCommand)initWithDirection:(int64_t)a3
{
  CAMPanoramaDirectionCommand *v4;
  CAMPanoramaDirectionCommand *v5;
  CAMPanoramaDirectionCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPanoramaDirectionCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__direction = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMPanoramaDirectionCommand)initWithCoder:(id)a3
{
  id v4;
  CAMPanoramaDirectionCommand *v5;
  CAMPanoramaDirectionCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMPanoramaDirectionCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__direction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMPanoramaDirectionCommandDirection"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPanoramaDirectionCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMPanoramaDirectionCommand _direction](self, "_direction", v5.receiver, v5.super_class), CFSTR("CAMPanoramaDirectionCommandDirection"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPanoramaDirectionCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMPanoramaDirectionCommand _direction](self, "_direction");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  int64_t v5;
  id v6;

  v4 = a3;
  v5 = -[CAMPanoramaDirectionCommand _direction](self, "_direction");
  objc_msgSend(v4, "currentPanoramaOutput");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "changeToDirection:", v5);
}

- (int64_t)_direction
{
  return self->__direction;
}

@end
