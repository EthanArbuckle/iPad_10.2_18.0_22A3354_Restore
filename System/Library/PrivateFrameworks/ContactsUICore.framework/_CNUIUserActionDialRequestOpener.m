@implementation _CNUIUserActionDialRequestOpener

- (_CNUIUserActionDialRequestOpener)init
{
  void *v3;
  _CNUIUserActionDialRequestOpener *v4;

  -[objc_class sharedInstance](getTUCallCenterClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_CNUIUserActionDialRequestOpener initWithCallCenter:](self, "initWithCallCenter:", v3);

  return v4;
}

- (_CNUIUserActionDialRequestOpener)initWithCallCenter:(id)a3
{
  id v5;
  _CNUIUserActionDialRequestOpener *v6;
  _CNUIUserActionDialRequestOpener *v7;
  _CNUIUserActionDialRequestOpener *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNUIUserActionDialRequestOpener;
  v6 = -[_CNUIUserActionDialRequestOpener init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callCenter, a3);
    v8 = v7;
  }

  return v7;
}

- (id)openDialRequest:(id)a3 withScheduler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  getTUDialRequestClass();
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D13B20]);
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke;
    v20[3] = &unk_1EA6031D0;
    v20[4] = self;
    v13 = v10;
    v21 = v13;
    v22 = v11;
    v14 = v11;
    objc_msgSend(v7, "performBlock:", v20);
    objc_msgSend(v14, "future");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_2;
    v18[3] = &unk_1EA6031F8;
    v18[4] = self;
    v19 = v13;
    objc_msgSend(v15, "recover:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addFailureBlock:", &__block_literal_global_2);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "errorForUnableToCastDialRequest:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithError:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)errorForUnableToCastDialRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D13A08];
  v4 = a3;
  objc_msgSend(v3, "descriptionBuilderWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendName:object:", CFSTR("handle"), v6);

  objc_msgSend(v4, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "appendName:object:", CFSTR("contactIdentifier"), v8);

  v10 = objc_msgSend(v4, "isVideo");
  v11 = (id)objc_msgSend(v5, "appendName:BOOLValue:", CFSTR("video"), v10);
  v16 = CFSTR("dial request");
  objc_msgSend(v5, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsUIErrorDomain"), 206, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)errorForUnableToOpenDialRequest:(id)a3 withUnderlyingError:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D13A08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "descriptionBuilderWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendName:object:", CFSTR("handle"), v9);

  objc_msgSend(v7, "contactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v8, "appendName:object:", CFSTR("contactIdentifier"), v11);

  v13 = (id)objc_msgSend(v8, "appendName:BOOLValue:", CFSTR("video"), objc_msgSend(v7, "isVideo"));
  objc_msgSend(v7, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v8, "appendName:object:", CFSTR("provider.identifier"), v15);

  objc_msgSend(v7, "provider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v8, "appendName:object:", CFSTR("provider.localizedName"), v18);

  objc_msgSend(v7, "provider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v8, "appendName:object:", CFSTR("provider.bundleIdentifier"), v21);

  v27[0] = CFSTR("dial request");
  objc_msgSend(v8, "build");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = *MEMORY[0x1E0CB3388];
  v28[0] = v23;
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsUIErrorDomain"), 207, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end
