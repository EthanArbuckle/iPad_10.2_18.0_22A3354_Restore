@implementation AMSSimulatedCrash

+ (void)throwSimulatedCrashWithFormat:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void (*v7)(uint64_t, uint64_t, id);
  _Unwind_Exception *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v3, &v14);
    v5 = getpid();
    v6 = v4;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v7 = (void (*)(uint64_t, uint64_t, id))_MergedGlobals_141;
    v13 = _MergedGlobals_141;
    if (!_MergedGlobals_141)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getSimulateCrashSymbolLoc_block_invoke;
      v9[3] = &unk_1E253DDB8;
      v9[4] = &v10;
      __getSimulateCrashSymbolLoc_block_invoke((uint64_t)v9);
      v7 = (void (*)(uint64_t, uint64_t, id))v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v7)
    {
      dlerror();
      v8 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v8);
    }
    v7(v5, 195939070, v6);

  }
}

@end
