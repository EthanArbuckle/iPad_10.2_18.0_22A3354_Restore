@implementation MFInternalSettingsCache

- (BOOL)UIDebuggingEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MFInternalSettingsCache_UIDebuggingEnabled__block_invoke;
  block[3] = &unk_1E9A02D88;
  block[4] = self;
  if (UIDebuggingEnabled_onceToken != -1)
    dispatch_once(&UIDebuggingEnabled_onceToken, block);
  return self->_UIDebuggingEnabled;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_4);
  return (id)sharedCache_sharedCache;
}

void __45__MFInternalSettingsCache_UIDebuggingEnabled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_msgSend(v2, "BOOLForKey:", CFSTR("UIDebuggingEnabled"));

}

void __38__MFInternalSettingsCache_sharedCache__block_invoke()
{
  MFInternalSettingsCache *v0;
  void *v1;

  v0 = objc_alloc_init(MFInternalSettingsCache);
  v1 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = (uint64_t)v0;

}

- (BOOL)tiltedTabSkyViewEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MFInternalSettingsCache_tiltedTabSkyViewEnabled__block_invoke;
  block[3] = &unk_1E9A02D88;
  block[4] = self;
  if (tiltedTabSkyViewEnabled_onceToken != -1)
    dispatch_once(&tiltedTabSkyViewEnabled_onceToken, block);
  return self->_tiltedTabSkyViewEnabled;
}

void __50__MFInternalSettingsCache_tiltedTabSkyViewEnabled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v2, "BOOLForKey:", CFSTR("TiltedTabViewSkyViewEnabled"));

}

- (void)setTiltedTabSkyViewEnabled:(BOOL)a3
{
  self->_tiltedTabSkyViewEnabled = a3;
}

- (void)setUIDebuggingEnabled:(BOOL)a3
{
  self->_UIDebuggingEnabled = a3;
}

@end
