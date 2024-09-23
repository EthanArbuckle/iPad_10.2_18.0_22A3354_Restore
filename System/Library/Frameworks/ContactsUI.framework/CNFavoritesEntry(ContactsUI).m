@implementation CNFavoritesEntry(ContactsUI)

- (void)performActionWithContext:()ContactsUI completion:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13D80];
  objc_msgSend(a1, "contactProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionItemForContactProperty:actionType:bundleIdentifier:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C97310]);
    objc_msgSend(v13, "channelForFavoritesEntry:error:", a1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "channelIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setChannelIdentifier:", v15);

    objc_msgSend(v6, "setIsOriginatingFromFavorites:", 1);
    objc_msgSend(v12, "performActionWithContext:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v17 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __68__CNFavoritesEntry_ContactsUI__performActionWithContext_completion___block_invoke;
      v21[3] = &unk_1E204C2C0;
      v18 = v7;
      v22 = v18;
      objc_msgSend(v16, "addSuccessBlock:", v21);
      v19[0] = v17;
      v19[1] = 3221225472;
      v19[2] = __68__CNFavoritesEntry_ContactsUI__performActionWithContext_completion___block_invoke_2;
      v19[3] = &unk_1E204C2E8;
      v20 = v18;
      objc_msgSend(v16, "addFailureBlock:", v19);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D13C48], 204, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }

}

- (void)performActionWithCompletion:()ContactsUI
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0D13D70];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "performActionWithContext:completion:", v6, v5);

}

- (void)performActionWithExtensionContext:()ContactsUI completion:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0D13D70];
  v7 = a4;
  objc_msgSend(v6, "contextWithExtensionContext:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performActionWithContext:completion:", v8, v7);

}

@end
