@implementation EMFDPEmojiUsageRecorder

- (EMFDPEmojiUsageRecorder)initWithEmoji:(id)a3
{
  return -[EMFDPEmojiUsageRecorder initWithEmoji:usageModeIdentifier:](self, "initWithEmoji:usageModeIdentifier:", a3, 0);
}

- (EMFDPEmojiUsageRecorder)initWithEmoji:(id)a3 usageModeIdentifier:(id)a4
{
  id v6;
  id v7;
  EMFDPEmojiUsageRecorder *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EMFDPEmojiUsageRecorder;
  v8 = -[EMFDPRecorder initWithEmoji:](&v18, sel_initWithEmoji_, v6);
  if (v8)
  {
    objc_msgSend(v6, "localeData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v6, "localeIdentifier");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_locale, v14);
    if (v7)
    {
      v15 = (void *)objc_msgSend(v7, "copy");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_defaultUsageModeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    objc_storeStrong((id *)&v8->_usageModeIdentifier, v15);

  }
  return v8;
}

- (id)recordingKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EMFDPEmojiUsageRecorder locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFDPEmojiUsageRecorder usageModeIdentifier](self, "usageModeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.keyboard.Emoji.%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)delegate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EMFDPEmojiUsageRecorder;
  -[EMFDPRecorder delegate](&v10, sel_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D1D328]);
    -[EMFDPEmojiUsageRecorder recordingKey](self, "recordingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithKey:", v5);

    v9.receiver = self;
    v9.super_class = (Class)EMFDPEmojiUsageRecorder;
    -[EMFDPRecorder setDelegate:](&v9, sel_setDelegate_, v6);

  }
  v8.receiver = self;
  v8.super_class = (Class)EMFDPEmojiUsageRecorder;
  -[EMFDPRecorder delegate](&v8, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)report
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[EMFDPRecorder emoji](self, "emoji");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  emf_logging_get_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[EMFDPEmojiUsageRecorder report].cold.2((uint64_t)v4, v6);

    -[EMFDPEmojiUsageRecorder delegate](self, "delegate");
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject record:](v6, "record:", v7);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[EMFDPEmojiUsageRecorder report].cold.1(self, v6);
    v8 = 0;
  }

  return v8;
}

+ (id)_defaultUsageModeIdentifier
{
  if (_defaultUsageModeIdentifier_onceToken != -1)
    dispatch_once(&_defaultUsageModeIdentifier_onceToken, &__block_literal_global_8);
  return (id)_defaultUsageModeIdentifier__kDefaultUsageModeIdentifier;
}

void __54__EMFDPEmojiUsageRecorder__defaultUsageModeIdentifier__block_invoke()
{
  void *v0;

  v0 = (void *)_defaultUsageModeIdentifier__kDefaultUsageModeIdentifier;
  _defaultUsageModeIdentifier__kDefaultUsageModeIdentifier = (uint64_t)CFSTR("Keyboard");

}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)usageModeIdentifier
{
  return self->_usageModeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageModeIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)report
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1B3DE1000, a2, OS_LOG_TYPE_DEBUG, "Donating emoji to dprivacyd: '%{public}@'", (uint8_t *)&v2, 0xCu);
}

@end
