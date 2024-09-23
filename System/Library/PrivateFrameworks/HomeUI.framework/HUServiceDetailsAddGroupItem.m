@implementation HUServiceDetailsAddGroupItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  unint64_t v48;
  void *v49;
  int v50;
  void *v51;
  NSObject *v52;
  const __CFString *v53;
  void *v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  const __CFString *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  int v93;
  __int16 v94;
  int v95;
  uint64_t v96;
  _QWORD v97[3];

  v97[1] = *MEMORY[0x1E0C80C00];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsGroupAddButton"), CFSTR("HUServiceDetailsGroupAddButton"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsGroupFooter"), CFSTR("HUServiceDetailsGroupFooter"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsGroupTitle"), CFSTR("HUServiceDetailsGroupTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsAbstractItem home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E48]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_roomWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsAbstractItem home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v12, "hf_currentUserIsAdministrator");

  if (!(_DWORD)v8 || !v11)
  {
    v34 = (void *)MEMORY[0x1E0D519C0];
    v35 = (void *)MEMORY[0x1E0D314B8];
    v96 = *MEMORY[0x1E0D30D70];
    v97[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, &v96, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "outcomeWithResults:", v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "futureWithResult:", v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v78 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  v79 = v4;
  v77 = v19;
  if (v22)
  {
    objc_msgSend(v22, "accessory");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hf_visibleServices");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "na_any:", &__block_literal_global_131);

    v26 = v25 & ~objc_msgSend(v23, "hf_canShowAsIndividualServices");
  }
  else
  {
    if (!v16 || -[HUServiceDetailsAbstractItem isAccessory](self, "isAccessory"))
    {
      v26 = 0;
      if ((_os_feature_enabled_impl() & 1) == 0 && v19)
      {
        objc_msgSend(v19, "mediaProfileContainer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(MEMORY[0x1E0D31530], "isHomePod:", v40) & 1) != 0
          || objc_msgSend(MEMORY[0x1E0D31530], "isHomePodMediaSystem:", v40))
        {
          if (objc_msgSend(v40, "hf_supportsStereoPairing"))
          {
            objc_msgSend(v19, "accessories");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v41, "mutableCopy");

            -[HUServiceDetailsAbstractItem home](self, "home");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "na_safeAddObject:", v43);

            objc_msgSend(v13, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D30B80]);
            -[HUServiceDetailsAbstractItem home](self, "home");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "hf_accessoriesMatchingCategoryType:", *MEMORY[0x1E0CB7A58]);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v80[2] = __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke_3;
            v80[3] = &unk_1E6F4E5D8;
            v74 = v40;
            v46 = v40;
            v81 = v46;
            objc_msgSend(v45, "na_filter:", v80);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v75 = v47;
            v48 = objc_msgSend(v47, "count");
            objc_msgSend(v46, "settings");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "isControllable");
            v73 = v42;
            if (v50)
              v50 = objc_msgSend(v46, "hf_isReachable");
            v51 = v79;
            if (v48 > 1)
              v26 = v50;
            else
              v26 = 0;

            HFLogForCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v53 = CFSTR("NOT ");
              if (v26)
                v53 = &stru_1E6F60E80;
              v72 = v53;
              v71 = objc_msgSend(v75, "count");
              objc_msgSend(v46, "settings");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "isControllable");
              v56 = objc_msgSend(v46, "hf_isReachable");
              *(_DWORD *)buf = 138413570;
              v85 = v46;
              v86 = 2112;
              v87 = v72;
              v88 = 2048;
              v89 = v71;
              v90 = 2112;
              v91 = v75;
              v92 = 1024;
              v93 = v55;
              v94 = 1024;
              v95 = v56;
              _os_log_impl(&dword_1B8E1E000, v52, OS_LOG_TYPE_DEFAULT, "%@ does %@support showing 'Create Stereo Pair' button --> %lu unpairedHomePodsInHome: %@, isControllable: %{BOOL}d, hf_isReachable: %{BOOL}d", buf, 0x36u);

              v51 = v79;
            }

            _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsMediaSystemAddButton"), CFSTR("HUServiceDetailsMediaSystemAddButton"), 1);
            v57 = objc_claimAutoreleasedReturnValue();

            _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsMediaSystemFooter"), CFSTR("HUServiceDetailsMediaSystemFooter"), 1);
            v58 = objc_claimAutoreleasedReturnValue();

            v6 = 0;
            v79 = (void *)v57;
            v40 = v74;
          }
          else
          {
            v26 = 0;
            v58 = (uint64_t)v78;
          }
          HFLogForCategory();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v40;
            _os_log_impl(&dword_1B8E1E000, v70, OS_LOG_TYPE_DEFAULT, "%@ does NOT support showing 'Create Stereo Pair' button --> hf_supportsStereoPairing: NO", buf, 0xCu);
          }
          v78 = (void *)v58;

        }
        else
        {
          v26 = 0;
        }

      }
      goto LABEL_15;
    }
    objc_msgSend(v16, "service");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0D30B80]);

    v61 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v59, "hf_effectiveServiceType");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setWithObject:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0D30B88]);

    v64 = objc_msgSend(v59, "hf_supportsGroups");
    -[HUServiceDetailsAbstractItem home](self, "home");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "hf_serviceGroupsForService:", v59);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "count"))
      v67 = 0;
    else
      v67 = v64;
    v76 = v67;

    -[HUServiceDetailsAbstractItem home](self, "home");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "hf_allServices");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke_2;
    v82[3] = &unk_1E6F4EE58;
    v83 = v59;
    v23 = v59;
    v26 = v76 & objc_msgSend(v69, "na_any:", v82);

  }
LABEL_15:
  objc_msgSend(v16, "service");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "accessory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hf_isMultiServiceAccessory");

  objc_msgSend(v16, "service");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "accessory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "hf_showAsIndividualServices");

  if (v26 && ((v29 ^ 1 | v32) & 1) != 0)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v79, *MEMORY[0x1E0D30D18]);
    v5 = v78;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v78, CFSTR("HUServiceDetailsAddGroupSectionFooterResultKey"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.%@"), v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D30BA0]);

    objc_msgSend(v13, "na_safeSetObject:forKey:", v6, CFSTR("HUServiceDetailsAddGroupSectionHeaderResultKey"));
  }
  else
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    v5 = v78;
  }
  v37 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "futureWithResult:", v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v79;
LABEL_21:

  return v36;
}

uint64_t __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsGroups");
}

uint64_t __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_canGroupWithService:", *(_QWORD *)(a1 + 32));
}

BOOL __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v3 = a2;
  objc_msgSend(v3, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_supportsStereoPairing");

  if (v5
    && (v6 = objc_msgSend(v3, "supportedStereoPairVersions"),
        objc_msgSend(*(id *)(a1 + 32), "hf_backingAccessory"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "supportedStereoPairVersions") & v6,
        v7,
        v8))
  {
    objc_msgSend(v3, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_mediaSystemForAccessory:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
