@implementation HFAnalytics(HUAdditions)

+ (void)logAndSendTileInteractionEventOfType:()HUAdditions withPresentationContext:presentationCoordinator:
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _BYTE *v76;
  _BYTE buf[24];
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v72 = a4;
  v71 = a5;
  switch(a3)
  {
    case 3:
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v71, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "item");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: User long-pressed item: %@", buf, 0x16u);

      }
      goto LABEL_12;
    case 2:
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v71, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "item");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: User double-tapped item: %@", buf, 0x16u);

      }
      goto LABEL_12;
    case 1:
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v71, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "item");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: User tapped item: %@", buf, 0x16u);

      }
LABEL_12:

      goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Invalid interaction type: %@"), v14);

LABEL_14:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30318]);

  objc_msgSend(v72, "item");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30328]);
  objc_msgSend(v72, "sourceViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "topViewController");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v18;
    v22 = v21;

    v18 = v22;
  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D30358]);
  objc_opt_class();
  v23 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v70 = v24;

  objc_opt_class();
  v25 = v23;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v68 = v26;

  if (v70)
  {
    objc_msgSend(v70, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "typeDescriptionForAnalytics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D302E8]);

  }
  else
  {
    if (!v68)
      goto LABEL_30;
    objc_msgSend(v68, "contextTypeDescriptionForAnalytics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D302E8]);
  }

LABEL_30:
  objc_msgSend(v72, "tappedArea");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D30390]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v71, "isEditing"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D30320]);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v78 = __Block_byref_object_copy__20;
  v79 = __Block_byref_object_dispose__20;
  objc_msgSend(v17, "latestResults");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E10]);
  v80 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v32 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v33 = v32;
  else
    v33 = 0;
  v69 = v33;

  if (v69)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allHomesFuture");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __113__HFAnalytics_HUAdditions__logAndSendTileInteractionEventOfType_withPresentationContext_presentationCoordinator___block_invoke;
    v73[3] = &unk_1E6F57A68;
    v76 = buf;
    v74 = v32;
    v75 = v15;
    v36 = (id)objc_msgSend(v35, "addCompletionBlock:", v73);

    v37 = v74;
  }
  else
  {
    objc_opt_class();
    v38 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
    v37 = v39;

    if (v37)
    {
      objc_opt_class();
      objc_msgSend(v37, "accessoryRepresentableObject");
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
      v42 = v41;

      v43 = (void *)MEMORY[0x1E0CBA1A8];
      objc_msgSend(v42, "hf_categoryOrPrimaryServiceType");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "hf_getUserFriendlyDescriptionKey:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v45, "length"))
      {
        v46 = (void *)MEMORY[0x1E0CB3940];
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("%@-%@"), v48, v45);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v49;

      }
    }
    objc_opt_class();
    v51 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v52 = v51;
    else
      v52 = 0;
    v67 = v52;

    if (v67)
    {
      v53 = (void *)MEMORY[0x1E0CBA7E0];
      objc_msgSend(v67, "serviceGroup");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "services");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "firstObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "serviceType");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "hf_getUserFriendlyDescriptionKey:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v58, "length"))
      {
        v59 = (void *)MEMORY[0x1E0CB3940];
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "stringWithFormat:", CFSTR("%@-%@"), v61, v58);
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v62;

      }
    }
    objc_msgSend(v15, "na_safeSetObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), *MEMORY[0x1E0D30330]);
    objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 13, v15);
    objc_msgSend(v72, "tappedArea");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "isEqual:", CFSTR("HUTileCellTappableAreaStateToggleButton"));

    if (v65)
    {
      +[HUTipsManager_Swift sharedManager](HUTipsManager_Swift, "sharedManager");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "toggleDidInteract");

    }
  }

  _Block_object_dispose(buf, 8);
}

+ (void)sendSwitchCellToggleEventForItem:()HUAdditions isOn:title:fromSourceViewController:
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v9 = a6;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_safeSetObject:forKey:", v12, *MEMORY[0x1E0D30328]);

  v14 = v9;
  objc_opt_class();
  v15 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = v15;
  if (v17)
  {
    objc_msgSend(v17, "topViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "na_safeSetObject:forKey:", v18, *MEMORY[0x1E0D30358]);
  objc_opt_class();
  v28 = v15;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v28;
  else
    v19 = 0;
  v20 = v19;

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topic");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topicNameLocalizationKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@-%@"), v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v13, "na_safeSetObject:forKey:", v26, *MEMORY[0x1E0D30360]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_safeSetObject:forKey:", v27, *MEMORY[0x1E0D30370]);

  objc_msgSend(v13, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0D30378]);
  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 40, v13);

}

+ (void)sendBannerInteractionforItem:()HUAdditions tappedBannerItemOverrideClassName:hiddenBannerEvents:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v33 = *MEMORY[0x1E0D30328];
  objc_msgSend(v11, "na_safeSetObject:forKey:", v8);
  v34 = a1;
  v36 = v8;
  v29 = v9;
  objc_msgSend(a1, "_overrideBannerItemClassName:withOverrideClassName:", v8, v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0D30330];
  objc_msgSend(v11, "na_safeSetObject:forKey:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0D30308];
  objc_msgSend(v11, "na_safeSetObject:forKey:", v12);

  v13 = (void *)MEMORY[0x1E0D31170];
  v28 = v11;
  v14 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v13, "sendEvent:withData:", 41, v14);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v15 = v10;
  objc_msgSend(v10, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v38;
    v19 = *MEMORY[0x1E0D30380];
    v20 = *MEMORY[0x1E0D30388];
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v21);
        v23 = (void *)objc_opt_new();
        objc_msgSend(v23, "na_safeSetObject:forKey:", v22, v33);
        objc_msgSend(v34, "_overrideBannerItemClassName:withOverrideClassName:", v22, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "na_safeSetObject:forKey:", v24, v32);
        objc_msgSend(v23, "na_safeSetObject:forKey:", v36, v19);
        objc_msgSend(v23, "na_safeSetObject:forKey:", v35, v20);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "na_safeSetObject:forKey:", v25, v31);

        v26 = (void *)MEMORY[0x1E0D31170];
        v27 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(v26, "sendEvent:withData:", 42, v27);

        ++v21;
      }
      while (v17 != v21);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v17);
  }

}

+ (void)sendGeneralButtonTapEventWithButtonTitle:()HUAdditions sourceViewController:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E0D30328]);

  objc_msgSend(v9, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0D30358]);
  v7 = (void *)MEMORY[0x1E0D31170];
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "sendEvent:withData:", 43, v8);

}

+ (id)_overrideBannerItemClassName:()HUAdditions withOverrideClassName:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D20]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v9 = v6;
  }
  else if (objc_msgSend(v8, "length"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v12, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
