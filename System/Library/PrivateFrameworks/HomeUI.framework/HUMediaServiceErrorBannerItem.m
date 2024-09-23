@implementation HUMediaServiceErrorBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  HUMediaServiceErrorBannerItem *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D519C0];
    v7 = objc_alloc(MEMORY[0x1E0D314B8]);
    v25 = *MEMORY[0x1E0D30D70];
    v26[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "initWithResults:", v8);
    objc_msgSend(v6, "futureWithResult:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBannerItem home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaServicesForHome:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_233);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || -[HUBannerItem forceShowBanner](self, "forceShowBanner"))
    {
      v14 = (void *)MEMORY[0x1E0D519C0];
      v15 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_2;
      v23[3] = &unk_1E6F4C660;
      v16 = v13;
      v24 = v16;
      objc_msgSend(v14, "futureWithBlock:", v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_4;
      v20[3] = &unk_1E6F5C550;
      v9 = v16;
      v21 = v9;
      v22 = self;
      objc_msgSend(v17, "flatMap:", v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUMediaServiceErrorBannerItem;
  v4 = -[HUBannerItem copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "copyLatestResultsFromItem:", self);
  return v4;
}

uint64_t __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authFatalError");
}

void __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(*(id *)(a1 + 32), "iconImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_fetchImageFromURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_3;
  v9[3] = &unk_1E6F54DA0;
  v10 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

}

uint64_t __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

id __61__HUMediaServiceErrorBannerItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUMediaServiceError_Title_FormatString"), CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30D18]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.MediaServiceError.ReconnectAccount"), *MEMORY[0x1E0D30BA0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("HUMediaServiceError"), *MEMORY[0x1E0D30D20]);
  HULocalizedStringWithFormat(CFSTR("HUMediaServiceError_Details_FormatString"), CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30BF8]);
  HULocalizedStringWithFormat(CFSTR("HUMediaServiceError_Button_FormatString"), CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D30BC0]);
  if (v3)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30C70]);
  }
  else
  {
    v27 = objc_alloc(MEMORY[0x1E0D31558]);
    v28 = *MEMORY[0x1E0D30850];
    v37[0] = *MEMORY[0x1E0D30858];
    v37[1] = v28;
    v29 = *MEMORY[0x1E0D307B8];
    v38[0] = *MEMORY[0x1E0D307C0];
    v38[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v27, "initWithImageIdentifiersKeyedBySize:", v30);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D30C60]);

  }
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("HFResultMediaServiceBundleIdentifierKey"));

  LODWORD(v32) = objc_msgSend(*(id *)(a1 + 32), "authFatalError");
  v33 = objc_msgSend(*(id *)(a1 + 40), "forceShowBanner");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v33 | v32) ^ 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D30D70]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E7041770, CFSTR("bannerItemCategory"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

@end
