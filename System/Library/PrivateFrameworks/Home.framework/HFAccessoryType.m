@implementation HFAccessoryType

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

+ (id)serviceTypeWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "associatedServiceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v4, "serviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "serviceSubtype");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceType:subtype:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  return v8;
}

+ (id)serviceType:(id)a3 subtype:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9988]))
  {

    v8 = v6;
    v7 = 0;
  }
  else
  {
    v9 = v6;
    v8 = v9;
    if (v7)
    {
      objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("-%@"), v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
  }
  +[HFAccessoryType _cache]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __39__HFAccessoryType_serviceType_subtype___block_invoke;
    v16[3] = &unk_1EA7296D0;
    v17 = v6;
    v18 = v7;
    v20 = a1;
    v19 = v8;
    __39__HFAccessoryType_serviceType_subtype___block_invoke(v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

+ (id)_cache
{
  objc_opt_self();
  if (qword_1ED3787E8 != -1)
    dispatch_once(&qword_1ED3787E8, &__block_literal_global_26);
  return (id)_MergedGlobals_29;
}

void __34__HFAccessoryType_mediaSystemType__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = -[HFAccessoryType _init]([HFMediaSystemAccessoryType alloc], "_init");
  v1 = (void *)qword_1ED3787F8;
  qword_1ED3787F8 = (uint64_t)v0;

}

HFServiceAccessoryType *__39__HFAccessoryType_serviceType_subtype___block_invoke(_QWORD *a1)
{
  HFServiceAccessoryType *v2;
  void *v3;

  v2 = -[HFServiceAccessoryType initWithServiceType:subtype:]([HFServiceAccessoryType alloc], "initWithServiceType:subtype:", a1[4], a1[5]);
  +[HFAccessoryType _cache]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);

  return v2;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HFAccessoryType;
  return -[HFAccessoryType init](&v3, sel_init);
}

+ (id)categoryType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_opt_self();
  if (qword_1ED378800 != -1)
    dispatch_once(&qword_1ED378800, &__block_literal_global_39);
  v5 = (id)qword_1ED378808;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "serviceType:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HFAccessoryType _cache]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v7 = v9;
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __32__HFAccessoryType_categoryType___block_invoke;
      v12[3] = &unk_1EA7296A8;
      v13 = v4;
      v14 = a1;
      __32__HFAccessoryType_categoryType___block_invoke((uint64_t)v12);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

HFCategoryAccessoryType *__32__HFAccessoryType_categoryType___block_invoke(uint64_t a1)
{
  HFCategoryAccessoryType *v2;
  void *v3;

  v2 = -[HFCategoryAccessoryType initWithCategoryType:]([HFCategoryAccessoryType alloc], "initWithCategoryType:", *(_QWORD *)(a1 + 32));
  +[HFAccessoryType _cache]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 32));

  return v2;
}

+ (id)mediaSystemType
{
  if (qword_1ED3787F0 != -1)
    dispatch_once(&qword_1ED3787F0, &__block_literal_global_31);
  return (id)qword_1ED3787F8;
}

+ (id)serviceType:(id)a3
{
  return (id)objc_msgSend(a1, "serviceType:subtype:", a3, 0);
}

uint64_t __25__HFAccessoryType__cache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_MergedGlobals_29;
  _MergedGlobals_29 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_29, "setName:", CFSTR("HFAccessoryType-cache"));
}

void __50__HFAccessoryType__accessoryCategoryToServiceType__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[23];
  _QWORD v32[24];

  v32[23] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB9A30];
  v1 = *MEMORY[0x1E0CB79F0];
  v31[0] = *MEMORY[0x1E0CB79E8];
  v31[1] = v1;
  v2 = *MEMORY[0x1E0CB9A38];
  v32[0] = v0;
  v32[1] = v2;
  v3 = *MEMORY[0x1E0CB7A00];
  v31[2] = *MEMORY[0x1E0CB79F8];
  v31[3] = v3;
  v32[2] = v0;
  v32[3] = v2;
  v4 = *MEMORY[0x1E0CB99A8];
  v5 = *MEMORY[0x1E0CB7A30];
  v31[4] = *MEMORY[0x1E0CB7A10];
  v31[5] = v5;
  v6 = *MEMORY[0x1E0CB9A00];
  v32[4] = v4;
  v32[5] = v6;
  v7 = *MEMORY[0x1E0CB9A80];
  v8 = *MEMORY[0x1E0CB7A40];
  v31[6] = *MEMORY[0x1E0CB7A38];
  v31[7] = v8;
  v9 = *MEMORY[0x1E0CB9A10];
  v32[6] = v7;
  v32[7] = v9;
  v10 = *MEMORY[0x1E0CB9A18];
  v11 = *MEMORY[0x1E0CB7A68];
  v31[8] = *MEMORY[0x1E0CB7A48];
  v31[9] = v11;
  v12 = *MEMORY[0x1E0CB9A70];
  v32[8] = v10;
  v32[9] = v12;
  v13 = *MEMORY[0x1E0CB9AA0];
  v14 = *MEMORY[0x1E0CB7A80];
  v31[10] = *MEMORY[0x1E0CB7A78];
  v31[11] = v14;
  v15 = *MEMORY[0x1E0CB9AD0];
  v32[10] = v13;
  v32[11] = v15;
  v16 = *MEMORY[0x1E0CB9AA8];
  v17 = *MEMORY[0x1E0CB7AA0];
  v31[12] = *MEMORY[0x1E0CB7A90];
  v31[13] = v17;
  v18 = *MEMORY[0x1E0CB9B08];
  v32[12] = v16;
  v32[13] = v18;
  v19 = *MEMORY[0x1E0CB9AC0];
  v20 = *MEMORY[0x1E0CB7AB0];
  v31[14] = *MEMORY[0x1E0CB7AA8];
  v31[15] = v20;
  v21 = *MEMORY[0x1E0CB9A50];
  v32[14] = v19;
  v32[15] = v21;
  v22 = *MEMORY[0x1E0CB9AD8];
  v23 = *MEMORY[0x1E0CB7AC8];
  v31[16] = *MEMORY[0x1E0CB7AB8];
  v31[17] = v23;
  v24 = *MEMORY[0x1E0CB9AF0];
  v32[16] = v22;
  v32[17] = v24;
  v25 = *MEMORY[0x1E0CB7AE0];
  v31[18] = *MEMORY[0x1E0CB7AD8];
  v31[19] = v25;
  v32[18] = v24;
  v32[19] = v24;
  v26 = *MEMORY[0x1E0CB9B00];
  v27 = *MEMORY[0x1E0CB7B00];
  v31[20] = *MEMORY[0x1E0CB7AE8];
  v31[21] = v27;
  v28 = *MEMORY[0x1E0CB9B28];
  v32[20] = v26;
  v32[21] = v28;
  v31[22] = *MEMORY[0x1E0CB7B08];
  v32[22] = *MEMORY[0x1E0CB9B30];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 23);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)qword_1ED378808;
  qword_1ED378808 = v29;

}

+ (id)categoryTypeWithCategory:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "categoryType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)matterDeviceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("matterDeviceType-%i"), objc_msgSend(v4, "intValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryType _cache]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__HFAccessoryType_matterDeviceType___block_invoke;
    v11[3] = &unk_1EA7296F8;
    v12 = v4;
    v14 = a1;
    v13 = v5;
    __36__HFAccessoryType_matterDeviceType___block_invoke((uint64_t)v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

HFMatterDeviceAccessoryType *__36__HFAccessoryType_matterDeviceType___block_invoke(uint64_t a1)
{
  HFMatterDeviceAccessoryType *v2;
  void *v3;

  v2 = -[HFMatterDeviceAccessoryType initWithDeviceType:]([HFMatterDeviceAccessoryType alloc], "initWithDeviceType:", *(_QWORD *)(a1 + 32));
  +[HFAccessoryType _cache]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));

  return v2;
}

+ (NAIdentity)na_identity
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAccessoryType.m"), 166, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAccessoryType na_identity]", objc_opt_class());

  return 0;
}

- (id)filterAccessoryRepresentableObjects:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HFAccessoryType_Filtering__filterAccessoryRepresentableObjects___block_invoke;
  v4[3] = &unk_1EA72B188;
  v4[4] = self;
  objc_msgSend(a3, "na_filter:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __66__HFAccessoryType_Filtering__filterAccessoryRepresentableObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_accessoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
