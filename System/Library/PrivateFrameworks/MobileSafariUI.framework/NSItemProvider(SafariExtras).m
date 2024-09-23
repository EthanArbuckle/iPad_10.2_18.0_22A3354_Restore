@implementation NSItemProvider(SafariExtras)

+ (id)safari_timeoutQueue
{
  if (safari_timeoutQueue_onceToken != -1)
    dispatch_once(&safari_timeoutQueue_onceToken, &__block_literal_global_43);
  return (id)safari_timeoutQueue_queue;
}

+ (id)safari_itemProviderForTabDocument:()SafariExtras
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

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v5 = (void *)MEMORY[0x1E0CA5920];
  objc_msgSend(v3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "browserController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sf_windowCreationActivityWithTabUUID:tabGroupUUID:browserControllerUUID:", v6, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerObject:visibility:", v9, 0);
  if (objc_msgSend(v3, "hasQuickLookContent"))
  {
    objc_msgSend(v3, "quickLookDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_registerFileRepresentationForQuickLookDocument:", v10);

  }
  objc_msgSend(v3, "urlForSharing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObject:visibility:", v11, 0);

  return v4;
}

+ (id)safari_itemProviderForTab:()SafariExtras browserController:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (objc_class *)MEMORY[0x1E0CB36C8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v9 = (void *)MEMORY[0x1E0CA5920];
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v7, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);
  objc_msgSend(v6, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_sf_windowCreationActivityWithTabUUID:tabGroupUUID:browserControllerUUID:", v12, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "registerObject:visibility:", v14, 0);
  objc_msgSend(v7, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "registerObject:visibility:", v15, 0);
  return v8;
}

- (void)safari_registerLinkMetadata:()SafariExtras
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = *MEMORY[0x1E0CC1108];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke;
  v7[3] = &unk_1E9CF6EC8;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v5, 0, v7);

}

@end
