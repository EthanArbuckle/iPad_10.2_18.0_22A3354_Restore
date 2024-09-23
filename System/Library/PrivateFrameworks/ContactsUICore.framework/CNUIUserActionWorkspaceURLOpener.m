@implementation CNUIUserActionWorkspaceURLOpener

- (CNUIUserActionWorkspaceURLOpener)init
{
  void *v3;
  CNUIUserActionWorkspaceURLOpener *v4;

  -[objc_class defaultWorkspace](NSClassFromString(CFSTR("LSApplicationWorkspace")), "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUIUserActionWorkspaceURLOpener initWithWorkspace:](self, "initWithWorkspace:", v3);

  return v4;
}

- (CNUIUserActionWorkspaceURLOpener)initWithWorkspace:(id)a3
{
  id v5;
  CNUIUserActionWorkspaceURLOpener *v6;
  CNUIUserActionWorkspaceURLOpener *v7;
  CNUIUserActionWorkspaceURLOpener *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIUserActionWorkspaceURLOpener;
  v6 = -[CNUIUserActionWorkspaceURLOpener init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workspace, a3);
    v8 = v7;
  }

  return v7;
}

- (id)openURL:(id)a3 withScheduler:(id)a4
{
  return -[CNUIUserActionWorkspaceURLOpener openURL:isSensitive:connectionEndpoint:withScheduler:](self, "openURL:isSensitive:connectionEndpoint:withScheduler:", a3, 0, 0, a4);
}

- (id)openURL:(id)a3 isSensitive:(BOOL)a4 withScheduler:(id)a5
{
  return -[CNUIUserActionWorkspaceURLOpener openURL:isSensitive:connectionEndpoint:withScheduler:](self, "openURL:isSensitive:connectionEndpoint:withScheduler:", a3, a4, 0, a5);
}

- (id)openURL:(id)a3 isSensitive:(BOOL)a4 connectionEndpoint:(id)a5 withScheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  if (v10)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_withScheduler___block_invoke;
    v18[3] = &unk_1EA604E28;
    v18[4] = self;
    v19 = v11;
    v22 = a4;
    v20 = v10;
    v14 = v13;
    v21 = v14;
    objc_msgSend(v12, "performBlock:", v18);
    objc_msgSend(v14, "future");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "urlCouldNotBeOpenedErrorWithURL:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithError:", v16);

    objc_msgSend(v13, "future");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

void __89__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_withScheduler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend((id)objc_opt_class(), "openConfigurationWithEndpoint:isSensitive:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_withScheduler___block_invoke_2;
  v5[3] = &unk_1EA604E00;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "openURL:configuration:completionHandler:", v4, v2, v5);

}

uint64_t __89__CNUIUserActionWorkspaceURLOpener_openURL_isSensitive_connectionEndpoint_withScheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  else
    return objc_msgSend(v2, "finishWithError:");
}

+ (id)urlCouldNotBeOpenedErrorWithURL:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "absoluteString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("(nil)");
  }
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = CFSTR("url");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CNContactsUIErrorDomain"), 201, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)openConfigurationWithEndpoint:(id)a3 isSensitive:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  id v7;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0CA5938];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setTargetConnectionEndpoint:", v6);

  objc_msgSend(v7, "setSensitive:", v4);
  return v7;
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
}

@end
