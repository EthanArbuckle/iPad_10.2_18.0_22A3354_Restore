@implementation ZL39getRegisterAudioUnits

void *___ZL39getRegisterAudioUnits_InternalSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)AudioDSPLibraryCore(char **)::frameworkLibrary;
  v8 = AudioDSPLibraryCore(char **)::frameworkLibrary;
  if (!AudioDSPLibraryCore(char **)::frameworkLibrary)
  {
    v9 = xmmword_25083C4A8;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    AudioDSPLibraryCore(char **)::frameworkLibrary = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    v4 = (void *)abort_report_np();
    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "RegisterAudioUnits_Internal");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getRegisterAudioUnits_InternalSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
