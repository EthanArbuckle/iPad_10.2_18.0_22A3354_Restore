@implementation CAMWhiteBalanceCommand

- (CAMWhiteBalanceCommand)initWithMatchExposureMode
{
  CAMWhiteBalanceCommand *v2;
  CAMWhiteBalanceCommand *v3;
  CAMWhiteBalanceCommand *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMWhiteBalanceCommand;
  v2 = -[CAMCaptureCommand init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->__matchExposureMode = 1;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMWhiteBalanceCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[4] = -[CAMWhiteBalanceCommand _whiteBalanceMode](self, "_whiteBalanceMode");
  *((_BYTE *)v4 + 24) = -[CAMWhiteBalanceCommand _matchExposureMode](self, "_matchExposureMode");
  return v4;
}

- (int64_t)_whiteBalanceMode
{
  return self->__whiteBalanceMode;
}

- (BOOL)_matchExposureMode
{
  return self->__matchExposureMode;
}

- (CAMWhiteBalanceCommand)initWithWhiteBalanceMode:(int64_t)a3
{
  CAMWhiteBalanceCommand *v4;
  CAMWhiteBalanceCommand *v5;
  CAMWhiteBalanceCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMWhiteBalanceCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__whiteBalanceMode = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CAMCaptureConversions captureWhiteBalanceModeForWhiteBalanceMode:](CAMCaptureConversions, "captureWhiteBalanceModeForWhiteBalanceMode:", 2);
  if (-[CAMWhiteBalanceCommand _matchExposureMode](self, "_matchExposureMode"))
  {
    v6 = objc_msgSend(v4, "exposureMode");
    if (v6 < 4)
      v5 = qword_1DB9A77A8[v6];
  }
  else
  {
    v5 = +[CAMCaptureConversions captureWhiteBalanceModeForWhiteBalanceMode:](CAMCaptureConversions, "captureWhiteBalanceModeForWhiteBalanceMode:", -[CAMWhiteBalanceCommand _whiteBalanceMode](self, "_whiteBalanceMode"));
  }
  if ((objc_msgSend(v4, "isWhiteBalanceModeSupported:", v5) & 1) != 0)
  {
    v7 = v5;
LABEL_7:
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CAMWhiteBalanceCommand executeWithContext:].cold.1(self, v7, v8);

    objc_msgSend(v4, "setWhiteBalanceMode:", v7);
  }
  else
  {
    while (1)
    {
      v7 = 2 * (v5 != 1);
      v9 = os_log_create("com.apple.camera", "Camera");
      v10 = v9;
      if (v7 == v5)
        break;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[CAMWhiteBalanceCommand _descriptionForWhiteBalanceMode:](self, "_descriptionForWhiteBalanceMode:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMWhiteBalanceCommand _descriptionForWhiteBalanceMode:](self, "_descriptionForWhiteBalanceMode:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v15 = v11;
        v16 = 2114;
        v17 = v12;
        v18 = 2114;
        v19 = v4;
        _os_log_debug_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEBUG, "Falling back to %{public}@ because %{public}@ isn't supported by %{public}@", buf, 0x20u);

      }
      v5 = v7;
      if ((objc_msgSend(v4, "isWhiteBalanceModeSupported:", v7) & 1) != 0)
        goto LABEL_7;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMWhiteBalanceCommand _descriptionForWhiteBalanceMode:](self, "_descriptionForWhiteBalanceMode:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v13;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Failed to set white balance mode %{public}@, as it is not supported by %{public}@", buf, 0x16u);

    }
  }

}

- (CAMWhiteBalanceCommand)initWithCoder:(id)a3
{
  id v4;
  CAMWhiteBalanceCommand *v5;
  CAMWhiteBalanceCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMWhiteBalanceCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->__whiteBalanceMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMWhiteBalanceCommandWhiteBalance"));
    v5->__matchExposureMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMWhiteBalanceCommandMatchExposureMode"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMWhiteBalanceCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMWhiteBalanceCommand _whiteBalanceMode](self, "_whiteBalanceMode", v5.receiver, v5.super_class), CFSTR("CAMWhiteBalanceCommandWhiteBalance"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMWhiteBalanceCommand _matchExposureMode](self, "_matchExposureMode"), CFSTR("CAMWhiteBalanceCommandMatchExposureMode"));

}

- (id)_descriptionForWhiteBalanceMode:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1EA32DCE8[a3];
}

- (void)executeWithContext:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_descriptionForWhiteBalanceMode:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1DB760000, a3, OS_LOG_TYPE_DEBUG, "Applying white balance mode %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
