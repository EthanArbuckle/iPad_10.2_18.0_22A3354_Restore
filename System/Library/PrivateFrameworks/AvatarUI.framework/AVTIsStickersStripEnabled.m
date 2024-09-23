@implementation AVTIsStickersStripEnabled

void __AVTIsStickersStripEnabled_block_invoke()
{
  uint64_t (*CKIsStickersStripEnabledSymbolLoc)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (!ChatKitLibraryCore_frameworkLibrary)
    ChatKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (ChatKitLibraryCore_frameworkLibrary && getCKIsStickersStripEnabledSymbolLoc())
  {
    CKIsStickersStripEnabledSymbolLoc = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))getCKIsStickersStripEnabledSymbolLoc();
    if (!CKIsStickersStripEnabledSymbolLoc)
      __AVTIsStickersStripEnabled_block_invoke_cold_1();
    AVTIsStickersStripEnabled_isStickersStripEnabled = CKIsStickersStripEnabledSymbolLoc(CKIsStickersStripEnabledSymbolLoc, v1, v2, v3);
  }
}

uint64_t __AVTIsStickersStripEnabled_block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[AVTStickerRecentsSwiftProvider fetchDefaultMemojiIfNeeded].cold.1(v0);
}

@end
