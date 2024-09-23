@implementation AMSDeviceState

+ (int)ams_deviceUnlockedSinceBoot
{
  uint64_t (*v2)(void);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (uint64_t (*)(void))_MergedGlobals_99;
  v9 = _MergedGlobals_99;
  if (!_MergedGlobals_99)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v5[3] = &unk_1E253DDB8;
    v5[4] = &v6;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2();
}

@end
