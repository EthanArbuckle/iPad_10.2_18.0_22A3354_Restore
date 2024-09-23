@implementation CCUISensorEntityIconCache

id __57__CCUISensorEntityIconCache_preheatImageForSensorEntity___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "imageForEntity:", *(_QWORD *)(a1 + 40));
}

- (id)imageForEntity:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  double v11;
  double v12;
  int v13;
  void *v14;
  double v15;
  double v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D80458], "settingsIconCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isGenericLocationSystemServiceEntity") & 1) != 0
    || objc_msgSend(v4, "isSetupApp"))
  {
    v6 = (_QWORD *)MEMORY[0x1E0D80658];
LABEL_4:
    objc_msgSend(v5, "imageForKey:", *v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isSiriAndDictationEntity"))
  {
    v6 = (_QWORD *)MEMORY[0x1E0D806B8];
    goto LABEL_4;
  }
  if (objc_msgSend(v4, "isWalletSpecialEntity"))
  {
    v10 = (void *)*MEMORY[0x1E0D14750];
    objc_msgSend((id)objc_opt_class(), "iconSize");
    CCUIIconImageForApplicationIdentifier(v10, v11, v12);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isKeyboardCameraEntity"))
  {
    -[CCUISensorEntityIconCache _keyboardSettingsIcon](self, "_keyboardSettingsIcon");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v13 = objc_msgSend(v4, "isContinuityCaptureExtension");
  objc_msgSend(v4, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[CCUISensorEntityIconCache continuityCaptureIconForExtensionIdentifier:](self, "continuityCaptureIconForExtensionIdentifier:", v14);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "iconSize");
    CCUIIconImageForApplicationIdentifier(v14, v15, v16);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

- (void)preheatImageForSensorEntity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CCUISensorEntityIconCache_preheatImageForSensorEntity___block_invoke;
  v7[3] = &unk_1E8CFC540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8);
  return (id)sharedInstance_sharedInstance;
}

+ (CGSize)iconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 20.0;
  v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __43__CCUISensorEntityIconCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CCUISensorEntityIconCache _init]([CCUISensorEntityIconCache alloc], "_init");
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  CCUISensorEntityIconCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUISensorEntityIconCache;
  v2 = -[CCUISensorEntityIconCache init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ControlCenter.sensorEntityIconCache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)_imageInBundle:(id)a3 named:(id)a4 needsTreatment:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    if (v5)
    {
      v12 = objc_retainAutorelease(v10);
      v13 = objc_msgSend(v12, "CGImage");
      objc_msgSend((id)objc_opt_class(), "iconSize");
      CCUIIconImageForUntreatedImage(v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v16 = *MEMORY[0x1E0D14698];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D14698], OS_LOG_TYPE_FAULT))
      -[CCUISensorEntityIconCache _imageInBundle:named:needsTreatment:].cold.1((uint64_t)v8, (uint64_t)v7, v16);
    v11 = 0;
  }

  return v11;
}

- (id)continuityCaptureIconForExtensionIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = (objc_class *)MEMORY[0x1E0CA5848];
  v5 = a3;
  v10 = 0;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:error:", v5, &v10);

  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorEntityIconCache _imageInBundle:named:needsTreatment:](self, "_imageInBundle:named:needsTreatment:", v7, CFSTR("AppIcon"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_keyboardSettingsIcon
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/PreferenceBundles/AccessibilitySettings.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorEntityIconCache _imageInBundle:named:needsTreatment:](self, "_imageInBundle:named:needsTreatment:", v3, CFSTR("Keyboards"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_imageInBundle:(uint64_t)a1 named:(uint64_t)a2 needsTreatment:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1CFB7D000, log, OS_LOG_TYPE_FAULT, "could not lookup image %@ in bundle %@", (uint8_t *)&v3, 0x16u);
}

@end
