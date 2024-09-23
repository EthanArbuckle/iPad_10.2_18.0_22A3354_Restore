@implementation AXDeviceGetType

uint64_t __AXDeviceGetType_block_invoke()
{
  uint64_t (*v0)(const __CFString *, uint64_t);
  uint64_t result;
  int v2;
  _Unwind_Exception *v3;
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v0 = (uint64_t (*)(const __CFString *, uint64_t))getMGGetSInt32AnswerSymbolLoc_ptr_0;
  v9 = getMGGetSInt32AnswerSymbolLoc_ptr_0;
  if (!getMGGetSInt32AnswerSymbolLoc_ptr_0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMGGetSInt32AnswerSymbolLoc_block_invoke;
    v5[3] = &unk_1E28C1CB0;
    v5[4] = &v6;
    __getMGGetSInt32AnswerSymbolLoc_block_invoke((uint64_t)v5);
    v0 = (uint64_t (*)(const __CFString *, uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v0)
  {
    soft_AXSettingsLocalizedStringForKey_cold_1();
    v4 = v3;
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  result = v0(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL);
  v2 = result - 1;
  if ((result - 1) <= 0xA && ((0x46Fu >> v2) & 1) != 0)
    AXDeviceGetType__AXDeviceType = qword_18EC6BA28[v2];
  return result;
}

@end
