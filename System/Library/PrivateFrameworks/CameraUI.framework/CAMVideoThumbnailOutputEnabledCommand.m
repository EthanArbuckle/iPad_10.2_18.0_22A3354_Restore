@implementation CAMVideoThumbnailOutputEnabledCommand

- (CAMVideoThumbnailOutputEnabledCommand)initWithVideoThumbnailOutputEnabled:(BOOL)a3
{
  CAMVideoThumbnailOutputEnabledCommand *v4;
  CAMVideoThumbnailOutputEnabledCommand *v5;
  CAMVideoThumbnailOutputEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoThumbnailOutputEnabledCommand;
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
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  char v8;

  v4 = a3;
  LOBYTE(self) = -[CAMVideoThumbnailOutputEnabledCommand _isEnabled](self, "_isEnabled");
  objc_msgSend(v4, "currentVideoThumbnailOutput");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CAMVideoThumbnailOutputEnabledCommand_executeWithContext___block_invoke;
  v7[3] = &__block_descriptor_33_e36_v32__0__AVCaptureConnection_8Q16_B24l;
  v8 = (char)self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

void __60__CAMVideoThumbnailOutputEnabledCommand_executeWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  BOOL v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    v4 = objc_msgSend(v3, "isEnabled");
    v5 = *(unsigned __int8 *)(a1 + 32);
    v6 = v5 == v4;
    v3 = v7;
    if (!v6)
    {
      objc_msgSend(v7, "setEnabled:", v5 != 0);
      v3 = v7;
    }
  }

}

- (CAMVideoThumbnailOutputEnabledCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoThumbnailOutputEnabledCommand *v5;
  CAMVideoThumbnailOutputEnabledCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoThumbnailOutputEnabledCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMVideoThumbnailOutputEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoThumbnailOutputEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoThumbnailOutputEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMVideoThumbnailOutputEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoThumbnailOutputEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoThumbnailOutputEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

@end
