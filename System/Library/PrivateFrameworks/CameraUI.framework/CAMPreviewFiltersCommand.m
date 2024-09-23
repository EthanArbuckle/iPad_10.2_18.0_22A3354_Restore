@implementation CAMPreviewFiltersCommand

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CAMSystemPressureMitigationCommand *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasFilteringEntitlement"))
  {
    -[CAMPreviewFiltersCommand filters](self, "filters");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (void *)v6;
    else
      v7 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v4, "currentVideoPreviewLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoPreviewFilters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[CAMEffectFilterManager areFilters:equalTo:](CAMEffectFilterManager, "areFilters:equalTo:", v7, v9);

    if (!v10)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "videoPreviewFilters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMEffectFilterManager namesFromFilters:](CAMEffectFilterManager, "namesFromFilters:", v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAMEffectFilterManager namesFromFilters:](CAMEffectFilterManager, "namesFromFilters:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        v20 = 2114;
        v21 = v15;
        _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "CAMPreviewFiltersCommand: changing video preview filters from [%{public}@] to [%{public}@]", buf, 0x16u);

      }
      objc_msgSend(v8, "setVideoPreviewFilters:", v7);
      v16 = objc_alloc_init(CAMSystemPressureMitigationCommand);
      -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v16);

    }
    objc_msgSend(v4, "updateControlEnablementForFilters:captureMode:", v7, -[CAMPreviewFiltersCommand _mode](self, "_mode"));

  }
}

- (NSArray)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

- (CAMPreviewFiltersCommand)initWithFilters:(id)a3 captureMode:(int64_t)a4
{
  id v7;
  CAMPreviewFiltersCommand *v8;
  CAMPreviewFiltersCommand *v9;
  CAMPreviewFiltersCommand *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMPreviewFiltersCommand;
  v8 = -[CAMCaptureCommand initWithSubcommands:](&v12, sel_initWithSubcommands_, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filters, a3);
    v9->__mode = a4;
    v10 = v9;
  }

  return v9;
}

- (CAMPreviewFiltersCommand)initWithSubcommands:(id)a3
{
  return -[CAMPreviewFiltersCommand initWithFilters:captureMode:](self, "initWithFilters:captureMode:", 0, 0);
}

- (CAMPreviewFiltersCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CAMPreviewFiltersCommand *v18;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMPreviewFiltersDataKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    if (v10)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CAMPreviewFiltersCommand initWithCoder:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    }
  }
  else
  {
    v9 = 0;
  }
  v18 = -[CAMPreviewFiltersCommand initWithFilters:captureMode:](self, "initWithFilters:captureMode:", v9, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMPreviewFiltersModeKey")));

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CAMPreviewFiltersCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  -[CAMPreviewFiltersCommand filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v7)
    {
      v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CAMPreviewFiltersCommand encodeWithCoder:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CAMPreviewFiltersDataKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMPreviewFiltersCommand _mode](self, "_mode"), CFSTR("CAMPreviewFiltersModeKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPreviewFiltersCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[CAMPreviewFiltersCommand filters](self, "filters");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  v4[4] = -[CAMPreviewFiltersCommand _mode](self, "_mode");
  return v4;
}

- (int64_t)_mode
{
  return self->__mode;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Failed to unarchive filters: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Failed to archive filters: %{public}@", a5, a6, a7, a8, 2u);
}

@end
