@implementation RWIProtocolDOMStorageDomainEventDispatcher(IKJSDependency)

- (void)safe_domStorageItemsClearedWithStorageId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("domStorageItemsClearedWithStorageId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_domStorageItemUpdatedWithStorageId:()IKJSDependency key:oldValue:newValue:
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v15 = a4;
  v14 = a5;
  v13 = a6;
  v17[0] = &v16;
  v17[1] = &v15;
  v17[2] = &v14;
  v17[3] = &v13;
  v10 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("domStorageItemUpdatedWithStorageId:key:oldValue:newValue:"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "retainArguments");
  objc_msgSend(v12, "invokeWithTarget:", a1);

}

- (void)safe_domStorageItemRemovedWithStorageId:()IKJSDependency key:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v9 = a4;
  v11[0] = &v10;
  v11[1] = &v9;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("domStorageItemRemovedWithStorageId:key:"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "retainArguments");
  objc_msgSend(v8, "invokeWithTarget:", a1);

}

- (void)safe_domStorageItemAddedWithStorageId:()IKJSDependency key:newValue:
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v12 = a4;
  v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("domStorageItemAddedWithStorageId:key:newValue:"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "retainArguments");
  objc_msgSend(v10, "invokeWithTarget:", a1);

}

@end
