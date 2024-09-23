@implementation HFItemProviderUtilities

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasNonStandardTileUI");
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v10);

  }
  LOBYTE(v11) = *(_BYTE *)(a1 + 56);
  if ((_BYTE)v11)
    v11 = objc_msgSend(v3, "hf_showsAsServiceInControlCentre") ^ 1;
  v12 = 0;
  if (((v4 ^ 1 | v7) & 1) == 0 && (v11 & 1) == 0)
  {
    if ((objc_msgSend(v3, "hf_isInGroup") & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v14) ^ 1;

    }
  }

  return v12;
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showAsAccessoryTile");
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_7_10);

  if (*(_BYTE *)(a1 + 56))
    v6 = objc_msgSend(v3, "hf_showsAsAccessoryInControlCentre") ^ 1;
  else
    v6 = 0;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v3, "hf_visibleServices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_6;
    v14[3] = &unk_1EA7283A0;
    v15 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v11, "na_any:", v14);

    v10 = 0;
    if (v7 && (v12 & 1) == 0)
    {
      if (((objc_msgSend(v3, "hf_areAllServicesInGroups") | v6 | v5) & 1) != 0)
        v10 = 0;
      else
        v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    v9 = v15;
  }

  return v10;
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke(uint64_t a1, void *a2)
{
  if (*(_QWORD *)(a1 + 32) == 2)
    return objc_msgSend(a2, "hf_shouldBeOnForContextType:", 0);
  else
    return *(unsigned __int8 *)(a1 + 40) == objc_msgSend(a2, "hf_effectiveShowInHomeDashboard");
}

uint64_t __63__HFItemProviderUtilities_favoriteActionSetsForHome_withLimit___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isAnonymous") & 1) != 0
    || (objc_msgSend(v2, "actions"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        !v4))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v2, "hf_effectiveShowInHomeDashboard");
  }

  return v5;
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (id)_servicesForHome:(id)a3 canShowInControlCentre:(BOOL)a4 withLimit:(unint64_t)a5 includes:(unint64_t)a6 ignoreUUIDs:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v48;
  id v49;
  void *v50;
  unint64_t v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  BOOL v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  BOOL v73;
  _QWORD aBlock[5];
  BOOL v75;

  v11 = a7;
  if (a5)
  {
    v12 = a3;
    objc_msgSend(v12, "hf_reorderableServicesList");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    v13 = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke;
    aBlock[3] = &__block_descriptor_41_e75_B16__0___HFFavoritable__HFIncludedContextProtocol__HFShowInHomeDashboard__8l;
    aBlock[4] = a6;
    v75 = a6 == 0;
    v14 = _Block_copy(aBlock);
    v51 = a5;
    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v12, "hf_allVisibleServices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v13;
    v69[1] = 3221225472;
    v69[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_3;
    v69[3] = &unk_1EA739CD8;
    v17 = v14;
    v71 = v17;
    v52 = v11;
    v18 = v11;
    v73 = a4;
    v70 = v18;
    v72 = &__block_literal_global_3_11;
    objc_msgSend(v16, "na_filter:", v69);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithSet:", v19);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v12, "hf_visibleAccessories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v13;
    v22 = v13;
    v64[1] = 3221225472;
    v64[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_4;
    v64[3] = &unk_1EA739D20;
    v68 = a4;
    v23 = v17;
    v66 = v23;
    v24 = v18;
    v65 = v24;
    v67 = &__block_literal_global_3_11;
    objc_msgSend(v21, "na_filter:", v64);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v12, "serviceGroups");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v22;
    v61[1] = 3221225472;
    v61[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_7;
    v61[3] = &unk_1EA739D48;
    v29 = v24;
    v62 = v29;
    v30 = v23;
    v63 = v30;
    objc_msgSend(v28, "na_filter:", v61);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_opt_new();
    objc_msgSend(v12, "hf_mediaAccessories");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v22;
    v57[1] = 3221225472;
    v57[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_9;
    v57[3] = &unk_1EA739D70;
    v35 = v30;
    v60 = v35;
    v36 = v29;
    v58 = v36;
    v37 = v33;
    v59 = v37;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v57);

    v38 = (void *)objc_opt_new();
    objc_msgSend(v12, "mediaSystems");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_10;
    v53[3] = &unk_1EA739D98;
    v49 = v35;
    v56 = v49;
    v54 = v36;
    v40 = v38;
    v55 = v40;
    objc_msgSend(v39, "enumerateObjectsUsingBlock:", v53);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "unionSet:", v26);
    objc_msgSend(v41, "unionSet:", v48);
    objc_msgSend(v41, "unionSet:", v32);
    objc_msgSend(v41, "unionSet:", v37);
    objc_msgSend(v41, "unionSet:", v40);
    objc_msgSend(v41, "allObjects");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");

    objc_msgSend(v50, "sortedHomeKitObjectComparator");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "sortUsingComparator:", v44);

    v45 = (void *)objc_msgSend(v43, "copy");
    if (objc_msgSend(v45, "count") > v51)
    {
      objc_msgSend(v45, "subarrayWithRange:", 0, v51);
      v46 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v46;
    }

    v11 = v52;
  }
  else
  {
    v45 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v45;
}

+ (id)_legacyFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return +[HFItemProviderUtilities _servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:](HFItemProviderUtilities, "_servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:", a3, 0, a4, 2, MEMORY[0x1E0C9AA60]);
}

+ (id)favoriteActionSetsForHome:(id)a3 withLimit:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (a4)
  {
    v5 = a3;
    objc_msgSend(v5, "hf_reorderableActionSetsList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "na_filter:", &__block_literal_global_167);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedHomeKitObjectComparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") > a4)
    {
      objc_msgSend(v10, "subarrayWithRange:", 0, a4);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v10;
}

+ (id)favoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return +[HFItemProviderUtilities _servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:](HFItemProviderUtilities, "_servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:", a3, 0, a4, 0, MEMORY[0x1E0C9AA60]);
}

+ (id)nonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return +[HFItemProviderUtilities _servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:](HFItemProviderUtilities, "_servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:", a3, 0, a4, 1, MEMORY[0x1E0C9AA60]);
}

+ (id)predictionsPaddingFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "predictionsPaddingFavoriteServicesForHome:withLimit:ignoreUUIDs:", a3, a4, MEMORY[0x1E0C9AA60]);
}

+ (id)predictionsPaddingNonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "predictionsPaddingNonFavoriteServicesForHome:withLimit:ignoreUUIDs:", a3, a4, MEMORY[0x1E0C9AA60]);
}

+ (id)predictionsPaddingFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4 ignoreUUIDs:(id)a5
{
  return +[HFItemProviderUtilities _servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:](HFItemProviderUtilities, "_servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:", a3, 1, a4, 0, a5);
}

+ (id)predictionsPaddingNonFavoriteServicesForHome:(id)a3 withLimit:(unint64_t)a4 ignoreUUIDs:(id)a5
{
  return +[HFItemProviderUtilities _servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:](HFItemProviderUtilities, "_servicesForHome:canShowInControlCentre:withLimit:includes:ignoreUUIDs:", a3, 1, a4, 1, a5);
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  v7 = 0;
  if (objc_msgSend(v3, "hf_isSupported") && (v6 & 1) == 0)
  {
    objc_msgSend(v3, "services");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_8;
    v10[3] = &unk_1EA72C140;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v8, "na_any:", v10);

  }
  return v7;
}

uint64_t __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a1;
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v5);

  LODWORD(v2) = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
  return v2 & (v3 ^ 1);
}

void __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    objc_msgSend(v7, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_mediaSystemForAccessory:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v7, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

      if ((v5 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    }
  }

}

void __98__HFItemProviderUtilities__servicesForHome_canShowInControlCentre_withLimit_includes_ignoreUUIDs___block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

    if ((v3 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

@end
