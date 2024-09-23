@implementation AXDeviceHasJindo

uint64_t __AXDeviceHasJindo_block_invoke()
{
  uint64_t (*v0)(void);
  uint64_t result;
  _Unwind_Exception *v2;
  _Unwind_Exception *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (uint64_t (*)(void))getSBUIIsSystemApertureEnabledSymbolLoc_ptr;
  v8 = getSBUIIsSystemApertureEnabledSymbolLoc_ptr;
  if (!getSBUIIsSystemApertureEnabledSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke;
    v4[3] = &unk_1E28C1CB0;
    v4[4] = &v5;
    __getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke((uint64_t)v4);
    v0 = (uint64_t (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    soft_AXSettingsLocalizedStringForKey_cold_1();
    v3 = v2;
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  result = v0();
  AXDeviceHasJindo_HasJindo = result;
  return result;
}

@end
