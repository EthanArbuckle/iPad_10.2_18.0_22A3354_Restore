@implementation CAMColorSpaceCommand

- (CAMColorSpaceCommand)initWithColorSpace:(int64_t)a3
{
  CAMColorSpaceCommand *v4;
  CAMColorSpaceCommand *v5;
  CAMColorSpaceCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMColorSpaceCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__colorSpace = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = -[CAMColorSpaceCommand _colorSpace](self, "_colorSpace");
  objc_msgSend(v4, "currentCaptureSession");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = +[CAMCaptureConversions AVCaptureColorSpaceForColorSpace:hasValidConversion:](CAMCaptureConversions, "AVCaptureColorSpaceForColorSpace:hasValidConversion:", v5, 0);
  v9 = v8;
  v10 = 1;
  switch(v5)
  {
    case 0:
      v10 = 0;
      goto LABEL_3;
    case 1:
      goto LABEL_4;
    case 2:
    case 3:
LABEL_3:
      v5 = v8;
LABEL_4:
      objc_msgSend(v14, "setAutomaticallyConfiguresCaptureDeviceForWideColor:", v10);
      v9 = v5;
      break;
    default:
      break;
  }
  if (objc_msgSend(v6, "activeColorSpace", v10) != v9)
  {
    objc_msgSend(v7, "supportedColorSpaces");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

    if (v13)
    {
      objc_msgSend(v14, "setAutomaticallyConfiguresCaptureDeviceForWideColor:", 0);
      objc_msgSend(v6, "setActiveColorSpace:", v9);
    }

  }
}

- (int64_t)_colorSpace
{
  return self->__colorSpace;
}

- (CAMColorSpaceCommand)initWithCoder:(id)a3
{
  id v4;
  CAMColorSpaceCommand *v5;
  CAMColorSpaceCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMColorSpaceCommand;
  v5 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  if (v5)
  {
    v5->__colorSpace = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMColorSpaceCommandColorSpace"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMColorSpaceCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMColorSpaceCommand _colorSpace](self, "_colorSpace", v5.receiver, v5.super_class), CFSTR("CAMColorSpaceCommandColorSpace"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMColorSpaceCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMColorSpaceCommand _colorSpace](self, "_colorSpace");
  return v4;
}

@end
