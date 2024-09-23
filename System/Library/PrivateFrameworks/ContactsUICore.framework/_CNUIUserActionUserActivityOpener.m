@implementation _CNUIUserActionUserActivityOpener

- (_CNUIUserActionUserActivityOpener)init
{
  CNLSApplicationWorkspace *v3;
  _CNUIUserActionUserActivityOpener *v4;

  v3 = objc_alloc_init(CNLSApplicationWorkspace);
  v4 = -[_CNUIUserActionUserActivityOpener initWithApplicationWorkspace:](self, "initWithApplicationWorkspace:", v3);

  return v4;
}

- (_CNUIUserActionUserActivityOpener)initWithApplicationWorkspace:(id)a3
{
  id v5;
  _CNUIUserActionUserActivityOpener *v6;
  _CNUIUserActionUserActivityOpener *v7;
  _CNUIUserActionUserActivityOpener *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNUIUserActionUserActivityOpener;
  v6 = -[_CNUIUserActionUserActivityOpener init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_applicationWorkspace, a3);
    v8 = v7;
  }

  return v7;
}

- (id)openUserActivity:(id)a3 usingBundleIdentifier:(id)a4 withScheduler:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t, void *);
  void *v24;
  _CNUIUserActionUserActivityOpener *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _CNUIUserActionUserActivityOpener *v29;
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0D13B20];
  v11 = a5;
  v12 = objc_alloc_init(v10);
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke;
  v27[3] = &unk_1EA604770;
  v14 = v8;
  v28 = v14;
  v29 = self;
  v30 = v9;
  v31 = v12;
  v15 = v12;
  v16 = v9;
  objc_msgSend(v11, "performBlock:", v27);

  objc_msgSend(v15, "future");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13;
  v22 = 3221225472;
  v23 = __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke_2;
  v24 = &unk_1EA6031F8;
  v25 = self;
  v26 = v14;
  v18 = v14;
  objc_msgSend(v17, "recover:", &v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addFailureBlock:", &__block_literal_global_58, v21, v22, v23, v24, v25);
  return v19;
}

+ (id)errorForUnableToOpenUserActivity:(id)a3 withUnderlyingError:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D13A08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "descriptionBuilderWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendName:object:", CFSTR("activityType"), v9);

  objc_msgSend(v7, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v8, "appendName:object:", CFSTR("title"), v11);

  objc_msgSend(v7, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v8, "appendName:object:", CFSTR("userInfo"), v13);
  v19[0] = CFSTR("user activity");
  objc_msgSend(v8, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = *MEMORY[0x1E0CB3388];
  v20[0] = v15;
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsUIErrorDomain"), 202, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
}

@end
