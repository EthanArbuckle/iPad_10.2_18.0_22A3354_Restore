@implementation INSpecialCaseDisplayableBundleIdentifier

void ___INSpecialCaseDisplayableBundleIdentifier_block_invoke_19(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInstalled");

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void ___INSpecialCaseDisplayableBundleIdentifier_block_invoke()
{
  objc_class *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("com.apple.InCallService");
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("com.apple.mobilephone");
  v19[1] = CFSTR("com.apple.facetime");
  v20[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v4;
  v18[0] = CFSTR("com.apple.mobilephone");
  v18[1] = CFSTR("com.apple.facetime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  v17 = CFSTR("com.apple.facetime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  v22[1] = CFSTR("com.apple.MobileSMS");
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  v16 = &unk_1E23F9738;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)_INSpecialCaseDisplayableBundleIdentifier_overrides;
  _INSpecialCaseDisplayableBundleIdentifier_overrides = v13;

}

@end
