@implementation CAMNonDestructiveCropAspectRatioCommand

- (CAMNonDestructiveCropAspectRatioCommand)initWithAspectRatioCrop:(int64_t)a3
{
  CAMNonDestructiveCropAspectRatioCommand *v4;
  CAMNonDestructiveCropAspectRatioCommand *v5;
  CAMNonDestructiveCropAspectRatioCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMNonDestructiveCropAspectRatioCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__aspectRatioCrop = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMNonDestructiveCropAspectRatioCommand)initWithSubcommands:(id)a3
{
  return -[CAMNonDestructiveCropAspectRatioCommand initWithAspectRatioCrop:](self, "initWithAspectRatioCrop:", 0);
}

- (CAMNonDestructiveCropAspectRatioCommand)initWithCoder:(id)a3
{
  return -[CAMNonDestructiveCropAspectRatioCommand initWithAspectRatioCrop:](self, "initWithAspectRatioCrop:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("CAMNonDestructiveCropAspectRatioKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMNonDestructiveCropAspectRatioCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMNonDestructiveCropAspectRatioCommand _aspectRatioCrop](self, "_aspectRatioCrop", v5.receiver, v5.super_class), CFSTR("CAMNonDestructiveCropAspectRatioKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMNonDestructiveCropAspectRatioCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[3] = -[CAMNonDestructiveCropAspectRatioCommand _aspectRatioCrop](self, "_aspectRatioCrop");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  int v5;
  int64_t v6;
  uint64_t v7;
  NSObject *v8;

  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNonDestructiveCropEnabled");
  v6 = -[CAMNonDestructiveCropAspectRatioCommand _aspectRatioCrop](self, "_aspectRatioCrop");
  if (v5)
  {
    if ((unint64_t)(v6 - 1) > 2)
      v7 = 0;
    else
      v7 = qword_1DB9A7A98[v6 - 1];
    objc_msgSend(v4, "setNonDestructiveCropAspectRatio:", v7);
  }
  else if (v6)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMNonDestructiveCropAspectRatioCommand executeWithContext:].cold.1(self, (uint64_t)v4, v8);

  }
}

- (int64_t)_aspectRatioCrop
{
  return self->__aspectRatioCrop;
}

- (void)executeWithContext:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  unint64_t v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "_aspectRatioCrop");
  if (v5 > 3)
    v6 = 0;
  else
    v6 = off_1EA32E498[v5];
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "Trying to set aspect ratio crop of %{public}@ on non-enabled device: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end
