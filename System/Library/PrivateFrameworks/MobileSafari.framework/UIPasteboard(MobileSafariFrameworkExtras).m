@implementation UIPasteboard(MobileSafariFrameworkExtras)

+ (BOOL)safari_canCopyLinksForTabs:()MobileSafariFrameworkExtras
{
  return objc_msgSend(MEMORY[0x1E0DCCB58], "linkCountForTabs:") != 0;
}

- (void)safari_copyLinksForTabGroup:()MobileSafariFrameworkExtras
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "richTextForPasteboard");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plainTextForPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v5)
    objc_msgSend(a1, "_safari_copyRichText:withPlainTextFallback:", v6, v5);

}

- (void)safari_copyLinksForTabs:()MobileSafariFrameworkExtras
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3498];
  v5 = a3;
  objc_msgSend(v4, "safari_richListOfLinksForTabs:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "safari_listOfLinksForTabs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
    objc_msgSend(a1, "_safari_copyRichText:withPlainTextFallback:", v8, v6);

}

- (void)_safari_copyRichText:()MobileSafariFrameworkExtras withPlainTextFallback:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void (**)(_QWORD, _QWORD, _QWORD));
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__UIPasteboard_MobileSafariFrameworkExtras___safari_copyRichText_withPlainTextFallback___block_invoke;
  v20[3] = &unk_1E21E5B38;
  v21 = v6;
  v11 = v6;
  objc_msgSend(v8, "registerItemForTypeIdentifier:loadHandler:", v9, v20);

  objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  v16 = 3221225472;
  v17 = __88__UIPasteboard_MobileSafariFrameworkExtras___safari_copyRichText_withPlainTextFallback___block_invoke_5;
  v18 = &unk_1E21E5B38;
  v19 = v7;
  v13 = v7;
  objc_msgSend(v8, "registerItemForTypeIdentifier:loadHandler:", v12, &v15);

  v22[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1, v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setItemProviders:", v14);

}

@end
