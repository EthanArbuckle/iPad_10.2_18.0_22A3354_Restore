@implementation HUSymptomStatusBannerItem

id __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v3 = a2;
  v4 = *MEMORY[0x1E0D30D70];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E78]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (unint64_t)objc_msgSend(v10, "count") > 1;
    objc_msgSend(*(id *)(a1 + 32), "_sortedObjectDisplayNamesForHomeKitObjects:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__12;
    v39 = __Block_byref_object_dispose__12;
    v40 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__12;
    v33 = __Block_byref_object_dispose__12;
    if (objc_msgSend(v12, "count") == 1)
      objc_msgSend(v12, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_userFriendlyLocalizedCapitalizedDescription:", *MEMORY[0x1E0CB7A58]);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke_2;
    v21[3] = &unk_1E6F53D28;
    v13 = v9;
    v14 = *(_QWORD *)(a1 + 32);
    v22 = v13;
    v23 = v14;
    v15 = v10;
    v24 = v15;
    v26 = &v35;
    v28 = v11;
    v16 = v8;
    v25 = v16;
    v27 = &v29;
    __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D30BF8];
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30BF8]);

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v30[5], *MEMORY[0x1E0D30D18]);
    if (objc_msgSend((id)v36[5], "length"))
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v36[5], *MEMORY[0x1E0D30D20]);
    objc_msgSend(v16, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v4);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E7040EE8, CFSTR("bannerItemCategory"));
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);

  }
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUSymptomStatusBannerItem;
  -[HUStatusBannerItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6F52070;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__HUSymptomStatusBannerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;

  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  v3 = 0;
  switch(v2)
  {
    case 1:
    case 20:
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = CFSTR("HUBannerSymptom_NeediCloudCredential_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.NeediCloudCrentialFix"), *MEMORY[0x1E0D30BA0]);
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v14, v14, 1);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = CFSTR("HUBannerSymptom_Description_NeediCloudCredential");
      goto LABEL_27;
    case 2:
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = CFSTR("HUBannerSymptom_NeediTunesCredential_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.NeediTunesCredential"), *MEMORY[0x1E0D30BA0]);
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v23, v23, 1);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = CFSTR("HUBannerSymptom_Description_NeediTunesCredential");
      goto LABEL_27;
    case 3:
      goto LABEL_8;
    case 4:
    case 5:
    case 14:
      if (*(_BYTE *)(a1 + 80))
        v4 = CFSTR("HUBannerSymptom_NoNetwork_Title_Multiple");
      else
        v4 = CFSTR("HUBannerSymptom_NoNetwork_Title");
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v4);
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.NoNetwork.NeedWiFiFix"), *MEMORY[0x1E0D30BA0]);
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v5, v5, 1);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = CFSTR("HUBannerSymptom_Description_NoNetwork");
      goto LABEL_36;
    case 6:
    case 15:
      return v3;
    case 7:
      if (*(_BYTE *)(a1 + 80))
        v27 = CFSTR("HUBannerSymptom_NeedsService_Title_Multiple");
      else
        v27 = CFSTR("HUBannerSymptom_NeedsService_Title");
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v27);
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.NeedsService"), *MEMORY[0x1E0D30BA0]);
      v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v28, v28, 1);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;

      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = CFSTR("HUBannerSymptom_Description_NeedsService");
      goto LABEL_27;
    case 8:
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = CFSTR("HUBannerSymptom_StereoVersionMismatch_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.StereoVersionMismatch.HomePodSoftwareUpdateRequired"), *MEMORY[0x1E0D30BA0]);
      v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v34, v34, 1);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = v35;

      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = CFSTR("HUBannerSymptom_Description_StereoVersionMismatch");
      goto LABEL_27;
    case 9:
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = CFSTR("HUBannerSymptom_StereoNotFound_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.StereoNotFound.HomePodConnectionProblem"), *MEMORY[0x1E0D30BA0]);
      v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v40, v40, 1);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v43 = *(void **)(v42 + 40);
      *(_QWORD *)(v42 + 40) = v41;

      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = CFSTR("HUBannerSymptom_Description_StereoNotFound");
      goto LABEL_27;
    case 10:
      if (*(_BYTE *)(a1 + 80))
        v44 = CFSTR("HUBannerSymptom_NoNetwork_Title_Multiple");
      else
        v44 = CFSTR("HUBannerSymptom_NoNetwork_Title");
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v44);
      v45 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v45, v45, 1);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v48 = *(void **)(v47 + 40);
      *(_QWORD *)(v47 + 40) = v46;

      if (objc_msgSend(MEMORY[0x1E0D319D0], "useWLANInsteadOfWiFi"))
        v20 = CFSTR("HUBannerSymptom_Description_WLAN");
      else
        v20 = CFSTR("HUBannerSymptom_Description_WiFi");
      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      goto LABEL_27;
    case 11:
      objc_msgSend(MEMORY[0x1E0D319D0], "networkSSID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
        goto LABEL_38;
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v51 = *(void **)(v50 + 40);
      *(_QWORD *)(v50 + 40) = CFSTR("HUBannerSymptom_NetworkMismatch_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.NetworkMismatch"), *MEMORY[0x1E0D30BA0]);
      v52 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v52, v52, 1);
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v55 = *(void **)(v54 + 40);
      *(_QWORD *)(v54 + 40) = v53;

      v9 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = CFSTR("HUBannerSymptom_Description_NetworkMismatch");
      goto LABEL_36;
    case 12:
      v56 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v57 = *(void **)(v56 + 40);
      *(_QWORD *)(v56 + 40) = CFSTR("HUBannerSymptom_TargetControl_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.TargetControl.AppleTVRequired"), *MEMORY[0x1E0D30BA0]);
      v58 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v58, v58, 1);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v61 = *(void **)(v60 + 40);
      *(_QWORD *)(v60 + 40) = v59;

      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = CFSTR("HUBannerSymptom_Description_TargetControl");
      goto LABEL_27;
    case 13:
      v62 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v63 = *(void **)(v62 + 40);
      *(_QWORD *)(v62 + 40) = CFSTR("HUBannerSymptom_VPNProfileExpired_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.VPNProfileExpired"), *MEMORY[0x1E0D30BA0]);
      v64 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v64, v64, 1);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v67 = *(void **)(v66 + 40);
      *(_QWORD *)(v66 + 40) = v65;

      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = CFSTR("HUBannerSymptom_Description_VPNProfileExpired");
      goto LABEL_27;
    case 16:
      v68 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v69 = *(void **)(v68 + 40);
      *(_QWORD *)(v68 + 40) = CFSTR("HUBannerSymptom_ProfileExpired_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.NeedNetworkProfileFix"), *MEMORY[0x1E0D30BA0]);
      v70 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v70, v70, 1);
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v73 = *(void **)(v72 + 40);
      *(_QWORD *)(v72 + 40) = v71;

      v9 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = CFSTR("HUBannerSymptom_Description_ProfileExpired");
      goto LABEL_36;
    case 17:
      v74 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v75 = *(void **)(v74 + 40);
      *(_QWORD *)(v74 + 40) = CFSTR("HUBannerSymptom_ProfileInstall_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.NeedNetworkProfileInstall"), *MEMORY[0x1E0D30BA0]);
      v76 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v76, v76, 1);
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v79 = *(void **)(v78 + 40);
      *(_QWORD *)(v78 + 40) = v77;

      v9 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = CFSTR("HUBannerSymptom_Description_ProfileInstall");
      goto LABEL_36;
    case 18:
      v80 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v81 = *(void **)(v80 + 40);
      *(_QWORD *)(v80 + 40) = CFSTR("HUBannerSymptom_NetworkNotShareable_Title");

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.NetworkNotShareable"), *MEMORY[0x1E0D30BA0]);
      v82 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      _HULocalizedStringWithDefaultValue(v82, v82, 1);
      v83 = objc_claimAutoreleasedReturnValue();
      v84 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v85 = *(void **)(v84 + 40);
      *(_QWORD *)(v84 + 40) = v83;

      v9 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = CFSTR("HUBannerSymptom_Description_NetworkNotShareable");
      goto LABEL_36;
    case 19:
      objc_msgSend(MEMORY[0x1E0D319D0], "networkSSID");
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if (v86)
      {
        v87 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v88 = *(void **)(v87 + 40);
        *(_QWORD *)(v87 + 40) = CFSTR("HUBannerSymptom_CaptiveLeaseRenewal_Title");

        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Home.Banners.Symptoms.CaptiveLeaseRenewal"), *MEMORY[0x1E0D30BA0]);
        v89 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        _HULocalizedStringWithDefaultValue(v89, v89, 1);
        v90 = objc_claimAutoreleasedReturnValue();
        v91 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v92 = *(void **)(v91 + 40);
        *(_QWORD *)(v91 + 40) = v90;

        if (objc_msgSend(MEMORY[0x1E0D319D0], "useWLANInsteadOfWiFi"))
          v11 = CFSTR("HUBannerSymptom_Description_CaptiveLeaseRenewal_WLAN");
        else
          v11 = CFSTR("HUBannerSymptom_Description_CaptiveLeaseRenewal_WiFi");
        v9 = *(void **)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
LABEL_36:
        objc_msgSend(v9, "_descriptionForLocalizedStringKey:representedHomeKitObjects:options:", v11, v10, 2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_38:
        v3 = 0;
      }
      return v3;
    default:
      if (v2 == 999)
      {
LABEL_8:
        v18 = *(void **)(a1 + 40);
        v19 = *(_QWORD *)(a1 + 48);
        v20 = CFSTR("HUBannerSymptom_Description_General");
LABEL_27:
        objc_msgSend(v18, "_descriptionForLocalizedStringKey:representedHomeKitObjects:", v20, v19);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v3;
  }
}

@end
