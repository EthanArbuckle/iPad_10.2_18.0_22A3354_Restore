@implementation DOCNodeStartupManager

uint64_t __38__DOCNodeStartupManager_startIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

+ (DOCNodeStartupManager)shared
{
  if (shared_onceToken_1 != -1)
    dispatch_once(&shared_onceToken_1, &__block_literal_global_14);
  return (DOCNodeStartupManager *)(id)shared_shared;
}

void __31__DOCNodeStartupManager_shared__block_invoke()
{
  DOCNodeStartupManager *v0;
  void *v1;

  v0 = objc_alloc_init(DOCNodeStartupManager);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

- (void)startIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__DOCNodeStartupManager_startIfNeeded__block_invoke;
  block[3] = &unk_24C0FE168;
  block[4] = self;
  if (startIfNeeded_onceToken != -1)
    dispatch_once(&startIfNeeded_onceToken, block);
}

- (void)_start
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = os_log_create("com.apple.DocumentManager", "PointsOfInterest");
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    StartFINode();
    v7 = v5;
  }
  else
  {
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2090A2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Files-FINode.start", (const char *)&unk_2090D48C7, buf, 2u);
    }

    StartFINode();
    v6 = v5;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_2090A2000, v6, OS_SIGNPOST_INTERVAL_END, v3, "Files-FINode.start", (const char *)&unk_2090D48C7, v8, 2u);
    }
  }

}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

@end
