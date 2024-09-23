@implementation MDMAccessibilityManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance__sharedInstance;
}

void __41__MDMAccessibilityManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = v0;

}

- (BOOL)boldTextEnabled
{
  return _AXSEnhanceTextLegibilityEnabled() != 0;
}

- (void)setBoldTextEnabled:(BOOL)a3
{
  _AXSSetEnhanceTextLegibilityEnabled();
}

- (BOOL)increaseContrastEnabled
{
  return _AXDarkenSystemColors() != 0;
}

- (void)setIncreaseContrastEnabled:(BOOL)a3
{
  _AXSSetDarkenSystemColors();
}

- (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabled() != 0;
}

- (void)setReduceMotionEnabled:(BOOL)a3
{
  _AXSSetReduceMotionEnabled();
}

- (BOOL)reduceTransparencyEnabled
{
  return _AXSEnhanceBackgroundContrastEnabled() != 0;
}

- (void)setReduceTransparencyEnabled:(BOOL)a3
{
  _AXSSetEnhanceBackgroundContrastEnabled();
}

- (BOOL)touchAccommodationsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "touchAccommodationsEnabled");

  return v3;
}

- (void)setTouchAccommodationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTouchAccommodationsEnabled:", v3);

}

- (BOOL)voiceOverEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

- (void)setVoiceOverEnabled:(BOOL)a3
{
  _AXSVoiceOverTouchSetEnabled();
}

- (BOOL)zoomEnabled
{
  return _AXSZoomTouchEnabled() != 0;
}

- (void)setZoomEnabled:(BOOL)a3
{
  _AXSZoomTouchSetEnabled();
}

- (int64_t)textSize
{
  void *v2;
  id v3;
  int64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = -1;
  v2 = (void *)_AXSCopyPreferredContentSizeCategoryName();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__MDMAccessibilityManager_textSize__block_invoke;
  v6[3] = &unk_24EB67F80;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(&unk_24EB77A68, "enumerateObjectsUsingBlock:", v6);
  v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __35__MDMAccessibilityManager_textSize__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)setTextSize:(int64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[MDMAccessibilityManager isValidTextSize:](self, "isValidTextSize:"))
  {
    objc_msgSend(&unk_24EB77A68, "objectAtIndexedSubscript:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    _AXSSetPreferredContentSizeCategoryName();

  }
  else
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      v11 = 1024;
      v12 = a3;
      _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ text size is out of range (%d)", buf, 0x12u);

    }
  }
}

- (BOOL)isValidTextSize:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0 && objc_msgSend(&unk_24EB77A68, "count") >= (unint64_t)a3;
}

- (BOOL)grayscaleEnabled
{
  return self->_grayscaleEnabled;
}

- (void)setGrayscaleEnabled:(BOOL)a3
{
  self->_grayscaleEnabled = a3;
}

@end
