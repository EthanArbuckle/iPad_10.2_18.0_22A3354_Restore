@implementation CNUIUserActionExtensionURLOpener

- (CNUIUserActionExtensionURLOpener)initWithExtensionContext:(id)a3
{
  id v5;
  CNUIUserActionExtensionURLOpener *v6;
  CNUIUserActionExtensionURLOpener *v7;
  CNUIUserActionExtensionURLOpener *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIUserActionExtensionURLOpener;
  v6 = -[CNUIUserActionExtensionURLOpener init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionContext, a3);
    v8 = v7;
  }

  return v7;
}

- (id)openURL:(id)a3 withScheduler:(id)a4
{
  return -[CNUIUserActionExtensionURLOpener openURL:isSensitive:withScheduler:](self, "openURL:isSensitive:withScheduler:", a3, 0, a4);
}

- (id)openURL:(id)a3 isSensitive:(BOOL)a4 withScheduler:(id)a5
{
  return -[CNUIUserActionExtensionURLOpener openURL:isSensitive:connectionEndpoint:withScheduler:](self, "openURL:isSensitive:connectionEndpoint:withScheduler:", a3, a4, 0, a5);
}

- (id)openURL:(id)a3 isSensitive:(BOOL)a4 connectionEndpoint:(id)a5 withScheduler:(id)a6
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  CNUIUserActionExtensionURLOpener *v19;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0D13B20];
  v10 = a6;
  v11 = objc_alloc_init(v9);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__CNUIUserActionExtensionURLOpener_openURL_isSensitive_connectionEndpoint_withScheduler___block_invoke;
  v16[3] = &unk_1EA6031D0;
  v17 = v8;
  v18 = v11;
  v19 = self;
  v12 = v11;
  v13 = v8;
  objc_msgSend(v10, "performBlock:", v16);

  objc_msgSend(v12, "future");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __89__CNUIUserActionExtensionURLOpener_openURL_isSensitive_connectionEndpoint_withScheduler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    objc_msgSend(a1[6], "extensionContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__CNUIUserActionExtensionURLOpener_openURL_isSensitive_connectionEndpoint_withScheduler___block_invoke_2;
    v7[3] = &unk_1EA6049B8;
    v3 = a1[4];
    v8 = a1[5];
    v9 = a1[4];
    objc_msgSend(v2, "openURL:completionHandler:", v3, v7);

    v4 = v8;
  }
  else
  {
    v10 = CFSTR("url");
    v11[0] = CFSTR("(nil)");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsUIErrorDomain"), 201, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v6);

  }
}

void __89__CNUIUserActionExtensionURLOpener_openURL_isSensitive_connectionEndpoint_withScheduler___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  }
  else
  {
    v7 = CFSTR("url");
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsUIErrorDomain"), 201, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v6);

  }
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

@end
