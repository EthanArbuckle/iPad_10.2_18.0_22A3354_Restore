@implementation CAMCTMCancelMomentCaptureCommand

- (CAMCTMCancelMomentCaptureCommand)initWithPersistenceUUID:(id)a3
{
  id v4;
  CAMCTMCancelMomentCaptureCommand *v5;
  uint64_t v6;
  NSString *persistenceUUID;
  CAMCTMCancelMomentCaptureCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMCancelMomentCaptureCommand;
  v5 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    persistenceUUID = v5->__persistenceUUID;
    v5->__persistenceUUID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (CAMCTMCancelMomentCaptureCommand)initWithCoder:(id)a3
{
  id v4;
  CAMCTMCancelMomentCaptureCommand *v5;
  uint64_t v6;
  NSString *persistenceUUID;
  CAMCTMCancelMomentCaptureCommand *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMCTMCancelMomentCaptureCommand;
  v5 = -[CAMCaptureCommand initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CAMCTMCancelCaptureCommandPersistenceUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    persistenceUUID = v5->__persistenceUUID;
    v5->__persistenceUUID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMCTMCancelMomentCaptureCommand _persistenceUUID](self, "_persistenceUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CAMCTMCancelCaptureCommandPersistenceUUID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMCTMCancelMomentCaptureCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMCTMCancelMomentCaptureCommand _persistenceUUID](self, "_persistenceUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMCTMCancelMomentCaptureCommand _persistenceUUID](self, "_persistenceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentStillImageOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(v4, "cachedMomentCaptureSettingsForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCachedMomentCaptureSettingsForIdentifier:", v7);

  if (v8)
  {
    objc_msgSend(v6, "cancelMomentCaptureWithUniqueID:", objc_msgSend(v8, "uniqueID"));
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v8, "uniqueID");
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "captureID:%lld Called cancelMomentCaptureWithUniqueID:", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAMCTMCancelMomentCaptureCommand executeWithContext:].cold.1((uint64_t)v7, v9);
  }

}

- (NSString)_persistenceUUID
{
  return self->__persistenceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__persistenceUUID, 0);
}

- (void)executeWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Failed to find cached initiation settings for persistenceUUID %{public}@ in CAMCTMCancelMomentCaptureCommand", (uint8_t *)&v2, 0xCu);
}

@end
