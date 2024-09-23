@implementation AXResourceLoader

+ (id)loadImageWithIdentifier:(id)a3 orPath:(id)a4 principalClass:(Class *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v9),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXResourceLoader"), CFSTR("Bundle was nil. Tried ID:%@ and Path:%@"), v9, v10);
      v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v13 = v14;
      if (!a5)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  AXLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_18EBEC000, v12, OS_LOG_TYPE_INFO, "Loading resource: %@", buf, 0xCu);
  }

  if ((objc_msgSend(v11, "isLoaded") & 1) == 0)
  {
    v16 = 0;
    objc_msgSend(v11, "loadAndReturnError:", &v16);
    v14 = v16;
    goto LABEL_11;
  }
  v13 = 0;
  if (a5)
LABEL_12:
    *a5 = (Class)objc_msgSend(v11, "principalClass");
LABEL_13:
  if (a6)
    *a6 = objc_retainAutorelease(v13);

  return v11;
}

+ (id)loadResource:(unint64_t)a3 principalClass:(Class *)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  objc_msgSend(a1, "_path:bundleID:forRescource:", &v13, &v12, a3);
  v8 = (unint64_t)v13;
  v9 = (unint64_t)v12;
  v10 = 0;
  if (v8 | v9)
  {
    objc_msgSend(a1, "loadImageWithIdentifier:orPath:principalClass:error:", v9, v8, a4, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (void)_path:(id *)a3 bundleID:(id *)a4 forRescource:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  switch(a5)
  {
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v12 = (void *)getCLFSystemShellSwitcherClass_softClass;
      v20 = getCLFSystemShellSwitcherClass_softClass;
      if (!getCLFSystemShellSwitcherClass_softClass)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __getCLFSystemShellSwitcherClass_block_invoke;
        v16[3] = &unk_1E28C1CB0;
        v16[4] = &v17;
        __getCLFSystemShellSwitcherClass_block_invoke((uint64_t)v16);
        v12 = (void *)v18[3];
      }
      v13 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v17, 8);
      objc_msgSend(v13, "sharedSystemShellSwitcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isClarityBoardEnabled");

      if ((v15 & 1) == 0)
      {
        AXAccessibilityPrivateFrameworksDirectory();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("AXSpringBoardServerInstance.framework"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        goto LABEL_11;
      }
LABEL_8:
      v10 = 0;
      v11 = 0;
      goto LABEL_12;
    case 3uLL:
      v7 = (void *)MEMORY[0x1E0CB3940];
      AXAccessibilityBundlesDirectory();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      v21[1] = CFSTR("QuickSpeak.bundle");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pathWithComponents:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v11 = CFSTR("com.apple.QuickSpeak");
LABEL_11:

LABEL_12:
      if (!a3)
        goto LABEL_14;
      goto LABEL_13;
  }
  v11 = 0;
  v10 = 0;
  *a3 = 0;
  *a4 = 0;
LABEL_13:
  v10 = objc_retainAutorelease(v10);
  *a3 = v10;
LABEL_14:
  if (a4)
    *a4 = v11;

}

@end
