@implementation CGColorSpaceGetSRGB

void __CGColorSpaceGetSRGB_block_invoke()
{
  unsigned __int8 v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  {
    getkColorSyncSRGBProfileSymbolLoc(void)::ptr = 0;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v1 = (uint64_t *)getkColorSyncSRGBProfileSymbolLoc(void)::ptr;
  v17 = (void *)getkColorSyncSRGBProfileSymbolLoc(void)::ptr;
  if (!getkColorSyncSRGBProfileSymbolLoc(void)::ptr)
  {
    v2 = (void *)ColorSyncLibrary();
    v1 = (uint64_t *)dlsym(v2, "kColorSyncSRGBProfile");
    v15[3] = (uint64_t)v1;
    getkColorSyncSRGBProfileSymbolLoc(void)::ptr = (uint64_t)v1;
  }
  _Block_object_dispose(&v14, 8);
  if (!v1)
    __CGColorSpaceGetSRGB_block_invoke_cold_1();
  v3 = *v1;
  {
    getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = 0;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v5 = getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr;
  v17 = getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr;
  if (!getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr)
  {
    v6 = (void *)ColorSyncLibrary();
    v5 = dlsym(v6, "ColorSyncProfileCreateWithName");
    v15[3] = (uint64_t)v5;
    getColorSyncProfileCreateWithNameSymbolLoc(void)::ptr = v5;
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
    __CGColorSpaceGetSRGB_block_invoke_cold_1();
  v7 = ((uint64_t (*)(uint64_t))v5)(v3);
  if (v7)
  {
    v8 = (const void *)v7;
    {
      getColorSyncProfileCopyDataSymbolLoc(void)::ptr = 0;
    }
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v10 = getColorSyncProfileCopyDataSymbolLoc(void)::ptr;
    v17 = getColorSyncProfileCopyDataSymbolLoc(void)::ptr;
    if (!getColorSyncProfileCopyDataSymbolLoc(void)::ptr)
    {
      v11 = (void *)ColorSyncLibrary();
      v10 = dlsym(v11, "ColorSyncProfileCopyData");
      v15[3] = (uint64_t)v10;
      getColorSyncProfileCopyDataSymbolLoc(void)::ptr = v10;
    }
    _Block_object_dispose(&v14, 8);
    if (!v10)
      __CGColorSpaceGetSRGB_block_invoke_cold_1();
    v12 = ((uint64_t (*)(const void *, _QWORD))v10)(v8, 0);
    if (v12)
    {
      v13 = (const void *)v12;
      CGColorSpaceGetSRGB::sSpace = MEMORY[0x2426A1E58](v12);
      CFRelease(v13);
    }
    CFRelease(v8);
  }
}

void __CGColorSpaceGetSRGB_block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1(v0);
}

@end
