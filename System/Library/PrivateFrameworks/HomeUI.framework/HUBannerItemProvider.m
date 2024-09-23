@implementation HUBannerItemProvider

+ (id)bannerItemComparator
{
  return &__block_literal_global_74_0;
}

- (HUMultiUserTokenFixBannerItem)multiUserTokenFixBannerItem
{
  return self->_multiUserTokenFixBannerItem;
}

- (HUSetupBannerItem)setupBannerItem
{
  return self->_setupBannerItem;
}

- (HUBannerItemProvider)initWithHome:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  HUBannerItemProvider *v19;
  id *p_isa;
  HUBannerItemProvider *v21;
  HUBannerItemProvider *v24;
  void *v25;
  void *v26;
  id obj;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self;
  objc_msgSend((id)objc_opt_class(), "_bannerItemClasses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v6)
  {
    v8 = 0;
    v25 = 0;
    v26 = 0;
    v9 = 0;
    goto LABEL_21;
  }
  v7 = v6;
  v8 = 0;
  v25 = 0;
  v26 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v30;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(obj);
      v12 = *(objc_class **)(*((_QWORD *)&v29 + 1) + 8 * v11);
      v13 = (void *)objc_msgSend([v12 alloc], "initWithHome:", v4);
      objc_msgSend(v5, "addObject:", v13);
      if ((-[objc_class isEqual:](v12, "isEqual:", objc_opt_class()) & 1) != 0)
      {
        v14 = v8;
        v8 = v13;
        goto LABEL_10;
      }
      if ((-[objc_class isEqual:](v12, "isEqual:", objc_opt_class()) & 1) != 0)
      {
        v14 = v26;
        v26 = v13;
LABEL_10:
        v15 = v9;
LABEL_11:
        v16 = v13;

        v9 = v15;
        goto LABEL_12;
      }
      if ((-[objc_class isEqual:](v12, "isEqual:", objc_opt_class()) & 1) != 0)
      {
        v14 = v25;
        v15 = v9;
        v25 = v13;
        goto LABEL_11;
      }
      v17 = -[objc_class isEqual:](v12, "isEqual:", objc_opt_class());
      v14 = v9;
      v15 = v13;
      if (v17)
        goto LABEL_11;
LABEL_12:

      ++v11;
    }
    while (v7 != v11);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v7 = v18;
  }
  while (v18);
LABEL_21:

  v28.receiver = v24;
  v28.super_class = (Class)HUBannerItemProvider;
  v19 = -[HFStaticItemProvider initWithItems:](&v28, sel_initWithItems_, v5);
  p_isa = (id *)&v19->super.super.super.isa;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_home, a3);
    objc_storeStrong(p_isa + 5, v8);
    objc_storeStrong(p_isa + 6, v26);
    objc_storeStrong(p_isa + 7, v9);
    objc_storeStrong(p_isa + 8, v25);
  }
  v21 = p_isa;

  return v21;
}

+ (id)_bannerItemClasses
{
  if (_MergedGlobals_5_0 != -1)
    dispatch_once(&_MergedGlobals_5_0, &__block_literal_global_51);
  return (id)qword_1ED580588;
}

void __42__HUBannerItemProvider__bannerItemClasses__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580588;
  qword_1ED580588 = v0;

}

+ (id)sortOrderForBannerItemCategory:(unint64_t)a3
{
  uint64_t *v3;
  dispatch_once_t *v5;
  void *v6;

  switch(a3)
  {
    case 2uLL:
      if (qword_1ED5805B0 == -1)
      {
        v3 = &qword_1ED5805B8;
        goto LABEL_10;
      }
      v5 = &qword_1ED5805B0;
      v6 = &__block_literal_global_72_0;
LABEL_15:
      dispatch_once(v5, v6);
      v3 = v5 + 1;
      goto LABEL_10;
    case 1uLL:
      if (qword_1ED5805A0 == -1)
      {
        v3 = &qword_1ED5805A8;
        goto LABEL_10;
      }
      v5 = &qword_1ED5805A0;
      v6 = &__block_literal_global_66_0;
      goto LABEL_15;
    case 0uLL:
      if (qword_1ED580590 == -1)
      {
        v3 = &qword_1ED580598;
LABEL_10:
        a1 = (id)*v3;
        return a1;
      }
      v5 = &qword_1ED580590;
      v6 = &__block_literal_global_61;
      goto LABEL_15;
  }
  return a1;
}

void __55__HUBannerItemProvider_sortOrderForBannerItemCategory___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580598;
  qword_1ED580598 = v0;

}

void __55__HUBannerItemProvider_sortOrderForBannerItemCategory___block_invoke_4()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED5805A8;
  qword_1ED5805A8 = v0;

}

void __55__HUBannerItemProvider_sortOrderForBannerItemCategory___block_invoke_6()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED5805B8;
  qword_1ED5805B8 = v0;

}

uint64_t __44__HUBannerItemProvider_bannerItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  id v38;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bannerItemCategory"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_1E7040660;
  v10 = v9;

  objc_msgSend(v5, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bannerItemCategory"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &unk_1E7040660;
  v15 = v14;

  v16 = objc_msgSend(v10, "compare:", v15);
  if (!v16)
  {
    +[HUBannerItemProvider sortOrderForBannerItemCategory:](HUBannerItemProvider, "sortOrderForBannerItemCategory:", objc_msgSend(v10, "integerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_opt_class()));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_opt_class()));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v18, "compare:", v19);
    if (!v16)
    {
      objc_msgSend(v4, "latestResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x1E0D30CA0];
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CA0]);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = &unk_1E7040678;
      if (v22)
        v24 = (void *)v22;
      v38 = v24;

      objc_msgSend(v5, "latestResults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v21);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      v28 = &unk_1E7040678;
      if (v26)
        v28 = (void *)v26;
      v29 = v28;

      v30 = v38;
      if (objc_msgSend(v38, "isEqualToNumber:", v29))
      {
        objc_msgSend(v4, "latestResults");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *MEMORY[0x1E0D30E70];
        objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E70]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "latestResults");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v32);
        v36 = v29;
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v38;
        v16 = objc_msgSend(v37, "localizedStandardCompare:", v34);

        v29 = v36;
      }
      else
      {
        v16 = objc_msgSend(v29, "compare:", v38);
      }

    }
  }

  return v16;
}

- (HUBannerItemProvider)initWithItems:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUBannerItemProvider.m"), 175, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUBannerItemProvider initWithItems:]",
    v6);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUBannerItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HUCameraUpgradeOfferBannerItem)cameraUpgradeOfferBannerItem
{
  return self->_cameraUpgradeOfferBannerItem;
}

- (HUHomeHubMigrationBannerItem)homeHubMigrationBannerItem
{
  return self->_homeHubMigrationBannerItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeHubMigrationBannerItem, 0);
  objc_storeStrong((id *)&self->_setupBannerItem, 0);
  objc_storeStrong((id *)&self->_multiUserTokenFixBannerItem, 0);
  objc_storeStrong((id *)&self->_cameraUpgradeOfferBannerItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
