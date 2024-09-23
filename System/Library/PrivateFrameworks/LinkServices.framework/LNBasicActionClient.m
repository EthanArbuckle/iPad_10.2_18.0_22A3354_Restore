@implementation LNBasicActionClient

+ (id)executeActionWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD, id);
  id v8;
  id v9;
  LNMetadataProvider *v10;
  void *v11;
  id v12;
  id v13;
  LNBasicActionDelegate *v14;
  void *v15;
  void *v16;
  void *v17;
  LNActionExecutorOptions *v18;
  void *v19;
  id v21;
  id v22;

  v7 = (void (**)(id, _QWORD, id))a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(LNMetadataProvider);
  v22 = 0;
  -[LNMetadataProvider actionForBundleIdentifier:andActionIdentifier:error:](v10, "actionForBundleIdentifier:andActionIdentifier:error:", v9, v8, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v22;
  if (v12)
  {
    v13 = v12;
    v7[2](v7, 0, v12);
    v14 = 0;
  }
  else
  {
    +[LNConnectionPolicy policyWithActionMetadata:](LNConnectionPolicy, "policyWithActionMetadata:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithParameters:", MEMORY[0x1E0C9AA60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v15, "connectionWithError:", &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    if (v13)
    {
      v7[2](v7, 0, v13);
      v14 = 0;
    }
    else
    {
      v18 = objc_alloc_init(LNActionExecutorOptions);
      v14 = -[LNBasicActionDelegate initWithCompletion:]([LNBasicActionDelegate alloc], "initWithCompletion:", v7);
      objc_msgSend(v17, "executorForAction:options:delegate:", v16, v18, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "perform");

    }
  }

  return v14;
}

@end
