@implementation AXDeviceRemoteScreenUIAssetObjcWrapper

+ (id)watchView
{
  uint64_t (*v2)(void);
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _Unwind_Exception *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_ptr;
  v15 = getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_ptr;
  if (!getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_ptr)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_block_invoke;
    v11[3] = &unk_24E36D4C8;
    v11[4] = &v12;
    __getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_block_invoke((uint64_t)v11);
    v2 = (uint64_t (*)(void))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v2)
  {
    v10 = (_Unwind_Exception *)+[AXDeviceRemoteScreenUIAssetObjcWrapper watchView].cold.1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v10);
  }
  v3 = v2();
  v4 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("AXAppleWatchRemoteChrome-sting");
  else
    v6 = CFSTR("AXAppleWatchRemoteChrome");
  objc_msgSend(v4, "imageNamed:inBundle:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v7);
  return v8;
}

+ (uint64_t)watchView
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getAXUIBannerPresenterClass_block_invoke_cold_1(v0);
}

@end
