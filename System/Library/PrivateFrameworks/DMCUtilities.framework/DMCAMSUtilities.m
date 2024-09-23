@implementation DMCAMSUtilities

+ (id)appstoredUserAgent
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v2 = (void *)getAMSProcessInfoClass_softClass;
  v17 = getAMSProcessInfoClass_softClass;
  if (!getAMSProcessInfoClass_softClass)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __getAMSProcessInfoClass_block_invoke;
    v12 = &unk_1E4D36B88;
    v13 = &v14;
    __getAMSProcessInfoClass_block_invoke((uint64_t)&v9);
    v2 = (void *)v15[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v14, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", CFSTR("com.apple.appstored"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v5 = (void *)getAMSUserAgentClass_softClass;
  v17 = getAMSUserAgentClass_softClass;
  if (!getAMSUserAgentClass_softClass)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __getAMSUserAgentClass_block_invoke;
    v12 = &unk_1E4D36B88;
    v13 = &v14;
    __getAMSUserAgentClass_block_invoke((uint64_t)&v9);
    v5 = (void *)v15[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v6, "userAgentForProcessInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
