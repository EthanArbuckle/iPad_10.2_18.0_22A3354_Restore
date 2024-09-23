@implementation LNSpeechUaapXPCClient

- (void)registerUaapApp:(id)a3 forLocale:(id)a4 withAssetFiles:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v13 = (void *)getCSSpeechUaapXPCClientClass_softClass;
  v20 = getCSSpeechUaapXPCClientClass_softClass;
  if (!getCSSpeechUaapXPCClientClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getCSSpeechUaapXPCClientClass_block_invoke;
    v16[3] = &unk_1E45DDB30;
    v16[4] = &v17;
    __getCSSpeechUaapXPCClientClass_block_invoke((uint64_t)v16);
    v13 = (void *)v18[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v17, 8);
  v15 = objc_alloc_init(v14);
  objc_msgSend(v15, "registerUaapApp:forLocale:withAssetFiles:completion:", v9, v10, v11, v12);

}

@end
