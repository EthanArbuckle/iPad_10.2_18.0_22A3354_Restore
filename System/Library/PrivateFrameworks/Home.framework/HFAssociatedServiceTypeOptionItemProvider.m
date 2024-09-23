@implementation HFAssociatedServiceTypeOptionItemProvider

- (HFAssociatedServiceTypeOptionItemProvider)initWithItems:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceType_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAssociatedServiceTypeOptionItemProvider.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAssociatedServiceTypeOptionItemProvider initWithItems:]",
    v6);

  return 0;
}

- (HFAssociatedServiceTypeOptionItemProvider)initWithServiceType:(id)a3 home:(id)a4
{
  return -[HFAssociatedServiceTypeOptionItemProvider initWithService:serviceType:home:](self, "initWithService:serviceType:home:", 0, a3, a4);
}

- (HFAssociatedServiceTypeOptionItemProvider)initWithService:(id)a3 serviceType:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HFAssociatedServiceTypeOptionItemProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend((id)objc_opt_class(), "_allItemsForService:serviceType:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HFAssociatedServiceTypeOptionItemProvider;
  v13 = -[HFStaticItemProvider initWithItems:](&v15, sel_initWithItems_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a5);
    objc_storeStrong((id *)&v13->_serviceType, a4);
    objc_storeStrong((id *)&v13->_service, a3);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFAssociatedServiceTypeOptionItemProvider service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAssociatedServiceTypeOptionItemProvider serviceType](self, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAssociatedServiceTypeOptionItemProvider home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithService:serviceType:home:", v5, v6, v7);

  return v8;
}

+ (id)_allItemsForService:(id)a3 serviceType:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  +[HFAssociatedServiceTypeFactory associatedServiceTypesSetFor:](HFAssociatedServiceTypeFactory, "associatedServiceTypesSetFor:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __77__HFAssociatedServiceTypeOptionItemProvider__allItemsForService_serviceType___block_invoke;
  v17 = &unk_1EA738F70;
  v19 = a1;
  v8 = v6;
  v18 = v8;
  objc_msgSend(v7, "na_map:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set", v14, v15, v16, v17);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

uint64_t __77__HFAssociatedServiceTypeOptionItemProvider__allItemsForService_serviceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_itemForService:associatedServiceType:", *(_QWORD *)(a1 + 32), a2);
}

+ (id)_itemForService:(id)a3 associatedServiceType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  HFAssociatedServiceTypeOptionItem *v11;
  HFAssociatedServiceTypeOptionItem *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_userFriendlyLocalizedCapitalizedDescription:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceSubtype");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconFactory defaultIconDescriptorForServiceType:serviceSubtype:](HFServiceIconFactory, "defaultIconDescriptorForServiceType:serviceSubtype:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    NSLog(CFSTR("Missing title or icon for service type: %@"), v6);
    v12 = 0;
  }
  else
  {
    v11 = [HFAssociatedServiceTypeOptionItem alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__HFAssociatedServiceTypeOptionItemProvider__itemForService_associatedServiceType___block_invoke;
    v14[3] = &unk_1EA738F98;
    v15 = v7;
    v16 = v9;
    v17 = v6;
    v18 = v5;
    v12 = -[HFStaticItem initWithResultsBlock:](v11, "initWithResultsBlock:", v14);

  }
  return v12;
}

id __83__HFAssociatedServiceTypeOptionItemProvider__itemForService_associatedServiceType___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)(a1 + 32);
  v13[0] = CFSTR("title");
  v13[1] = CFSTR("icon");
  v14 = v2;
  v13[2] = CFSTR("associatedServiceType");
  v15 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("dependentHomeKitObjects"));

    objc_msgSend(*(id *)(a1 + 56), "associatedServiceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 56);
    if (v6)
      objc_msgSend(v7, "associatedServiceType");
    else
      objc_msgSend(v7, "serviceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 48));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("selected"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMHome)home
{
  return self->_home;
}

- (HMService)service
{
  return self->_service;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
