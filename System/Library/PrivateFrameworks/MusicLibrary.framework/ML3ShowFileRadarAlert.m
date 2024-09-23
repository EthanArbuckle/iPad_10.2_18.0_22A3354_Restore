@implementation ML3ShowFileRadarAlert

void __ML3ShowFileRadarAlert_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[11];

  v24[9] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "buttonIdentifier") == 1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v4, "setHost:", CFSTR("new"));
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("BundleID"), CFSTR("com.apple.music"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Title"), *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v5;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("638694"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v6;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Media Platform"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v7;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("Library"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v8;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[6] = v9;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ExtensionIdentifiers"), CFSTR("com.apple.MediaPlayer.DiagnosticExtension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[7] = v10;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("Sometimes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[8] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryItems:", v12);

    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v13 = (void *)getLSApplicationWorkspaceClass_softClass;
    v23 = getLSApplicationWorkspaceClass_softClass;
    if (!getLSApplicationWorkspaceClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getLSApplicationWorkspaceClass_block_invoke;
      v19[3] = &unk_1E5B64C48;
      v19[4] = &v20;
      __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v19);
      v13 = (void *)v21[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v20, 8);
    objc_msgSend(v14, "defaultWorkspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "openURL:withOptions:error:", v16, 0, 0);

  }
}

@end
