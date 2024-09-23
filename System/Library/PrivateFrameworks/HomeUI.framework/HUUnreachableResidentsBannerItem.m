@implementation HUUnreachableResidentsBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  char v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  HUUnreachableResidentsBannerItem *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[HUBannerItem home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "residentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_filter:", &__block_literal_global_236);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasOptedToHH2");

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "count");
    v16 = objc_msgSend(v9, "count");
    v17 = CFSTR("NO");
    *(_DWORD *)buf = 138413570;
    v48 = self;
    v49 = 2112;
    if (v12)
      v17 = CFSTR("YES");
    v50 = v14;
    v51 = 2048;
    v52 = v15;
    v53 = 2048;
    v54 = v16;
    v55 = 2112;
    v56 = v9;
    v57 = 2112;
    v58 = v17;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Total residents: %lu - Reachable (%lu): %@ - hasOptedToHH2: %@", buf, 0x3Eu);

  }
  if (!objc_msgSend(v8, "count") || (!objc_msgSend(v9, "count") ? (v18 = v12) : (v18 = 0), (v18 & 1) == 0))
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = self;
      v49 = 2112;
      v50 = v20;
      v21 = "%@:%@ Setting banner shouldShow to NO";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_20;
  }
  if ((v6 & 1) != 0)
  {
LABEL_20:
    v22 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "count")
    && !objc_msgSend(v9, "count")
    && -[HUUnreachableResidentsBannerItem _hasPotentialResidentsConfiguring](self, "_hasPotentialResidentsConfiguring"))
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = self;
      v49 = 2112;
      v50 = v20;
      v21 = "%@:%@: Hiding banner since there are HomePods or Apple TVs in the home that are still configuring.";
LABEL_18:
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v22 = 1;
LABEL_21:
  v45 = v9;
  v46 = v8;
  if (-[HUBannerItem forceShowBanner](self, "forceShowBanner"))
  {
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = self;
      v49 = 2112;
      v50 = v24;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ Forcing banner shouldShow to YES", buf, 0x16u);

    }
    v22 = 1;
  }
  v44 = v22;
  v25 = (void *)objc_opt_new();
  _HULocalizedStringWithDefaultValue(CFSTR("HUUnreachableResidents_Title"), CFSTR("HUUnreachableResidents_Title"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.UnreachableResident"), *MEMORY[0x1E0D30BA0]);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("HUUnreachableResidents_Title"), *MEMORY[0x1E0D30D20]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUUnreachableResidents_Details"), CFSTR("HUUnreachableResidents_Details"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D30BF8]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUUnreachableResidents_Control_Description"), CFSTR("HUUnreachableResidents_Control_Description"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D30BC0]);

  v29 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "configurationWithHierarchicalColor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "configurationByApplyingConfiguration:", v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31880]), "initWithSystemImageName:configuration:", CFSTR("homekit"), v33);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSymbolIconConfiguration:", v34);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D30C60]);
  v36 = (void *)MEMORY[0x1E0C99E60];
  -[HUBannerItem home](self, "home");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "residentDevices");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "na_setWithSafeObject:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0D30B80]);

  -[HUBannerItem home](self, "home");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = objc_msgSend(v40, "supportsResidentSelection");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v37 | v44 ^ 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D30D70]);

  objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E70417E8, CFSTR("bannerItemCategory"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v25);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

uint64_t __64__HUUnreachableResidentsBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isReachable");
}

- (BOOL)_hasPotentialResidentsConfiguring
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  HUUnreachableResidentsBannerItem *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HUBannerItem home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUBannerItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_filter:", &__block_literal_global_24_3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke_2;
  v16[3] = &unk_1E6F4E5D8;
  v17 = v5;
  v9 = v5;
  objc_msgSend(v8, "na_filter:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138413058;
      v19 = self;
      v20 = 2112;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Found %lu potential residents that are not in the residents list - possible configuring state: %@ ", buf, 0x2Au);

    }
  }

  return v11 != 0;
}

uint64_t __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isHomePod") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "hf_isAppleTV");

  return v3;
}

uint64_t __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke_3;
  v8[3] = &unk_1E6F54958;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

BOOL __69__HUUnreachableResidentsBannerItem__hasPotentialResidentsConfiguring__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "hf_linkedAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

@end
