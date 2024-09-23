@implementation SGRadarSuggestion

+ (id)tapToRadarImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tapToRadarImage_image;
  if (!tapToRadarImage_image)
  {
    +[SGUIIconSupport spotlightIconImageWithBundleIdentifier:](SGUIIconSupport, "spotlightIconImageWithBundleIdentifier:", CFSTR("com.apple.TapToRadar"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tapToRadarImage_image;
    tapToRadarImage_image = v3;

    v2 = (void *)tapToRadarImage_image;
  }
  return v2;
}

- (id)suggestionPrimaryAction
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[SGRadarSuggestionBase primaryActionTitle](self, "primaryActionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke;
  v6[3] = &unk_1E62D6C90;
  v6[4] = self;
  +[SGSuggestionAction actionWithTitle:handler:](SGSuggestionAction, "actionWithTitle:handler:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_dismissViewController:(id)a3 andSignalCompletionWithResult:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[SGRadarSuggestionBase suggestionDelegate](self, "suggestionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewController:", v6);

  -[SGRadarSuggestionBase suggestionDelegate](self, "suggestionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestion:actionFinished:", self, v4);

}

- (id)suggestionImage
{
  return (id)objc_msgSend((id)objc_opt_class(), "tapToRadarImage");
}

- (id)suggestionCategoryImage
{
  return (id)objc_msgSend((id)objc_opt_class(), "tapToRadarImage");
}

- (id)_writeEMLtoDiskForMessageWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getSGMailClientUtilClass_softClass;
  v18 = getSGMailClientUtilClass_softClass;
  if (!getSGMailClientUtilClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getSGMailClientUtilClass_block_invoke;
    v14[3] = &unk_1E62D7128;
    v14[4] = &v15;
    __getSGMailClientUtilClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataForMessageWithIdentifier:error:", v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("eml"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "writeToFile:atomically:", v12, 1) & 1) == 0)
  {

LABEL_6:
    v12 = 0;
  }

  return v12;
}

void __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Found in Apps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("Structured Events"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("580699"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Title"), CFSTR("[TTR] Extraction Exception"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), CFSTR("** The original email will be attached to this radar. Please make sure you are OK sharing this email. **"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("phone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("DeleteOnAttach"), CFSTR("1"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Would you like to attach the EML file to the radar?"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3448];
  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke_2;
  v28[3] = &unk_1E62D6AC8;
  v28[4] = *(_QWORD *)(a1 + 32);
  v15 = v11;
  v29 = v15;
  v16 = v24;
  v30 = v16;
  objc_msgSend(v13, "actionWithTitle:style:handler:", CFSTR("Yes, attach the EML file"), 0, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke_3;
  v25[3] = &unk_1E62D6BA8;
  v26 = v16;
  v27 = v15;
  v19 = v15;
  v20 = v16;
  objc_msgSend(v18, "actionWithTitle:style:handler:", CFSTR("No, don't attach"), 2, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v21);

  objc_msgSend(v12, "setModalPresentationStyle:", 7);
  objc_msgSend(*(id *)(a1 + 32), "suggestionDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentViewController:", v12);

}

void __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_writeEMLtoDiskForMessageWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Attachments"), v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 48), "setQueryItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:configuration:completionHandler:", v5, 0, 0);

}

void __44__SGRadarSuggestion_suggestionPrimaryAction__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setQueryItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:configuration:completionHandler:", v2, 0, 0);

}

@end
