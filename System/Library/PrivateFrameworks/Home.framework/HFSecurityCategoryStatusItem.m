@implementation HFSecurityCategoryStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HFSecurityCategoryStatusItem *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFSecurityCategoryStatusItem;
  -[HFAccessoryCategoryStatusItem _subclass_updateWithOptions:](&v12, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HFSecurityCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1EA726DC0;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup securityAccessoryTypeGroup](HFAccessoryTypeGroup, "securityAccessoryTypeGroup");
}

id __60__HFSecurityCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  HFImageIconDescriptor *v8;
  void *v9;
  HFImageIconDescriptor *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  void *v112;
  _QWORD v113[5];
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hidden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    goto LABEL_8;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryTypeGroupNameSecurity"), CFSTR("HFAccessoryTypeGroupNameSecurity"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Home.Status.Category.Security"), CFSTR("HFResultDisplayAccessibilityIDKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("lock.fill"), CFSTR("iconNames"));
  v8 = [HFImageIconDescriptor alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconNames"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFImageIconDescriptor initWithSystemImageNamed:](v8, "initWithSystemImageNamed:", v9);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("icon"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "BOOLValue"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (!v13)
      goto LABEL_8;
    v121 = 0;
    v122 = &v121;
    v123 = 0x3032000000;
    v124 = __Block_byref_object_copy__0;
    v125 = __Block_byref_object_dispose__0;
    v126 = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "statusItemClasses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __60__HFSecurityCategoryStatusItem__subclass_updateWithOptions___block_invoke_18;
    v113[3] = &unk_1EA726D98;
    v113[4] = *(_QWORD *)(a1 + 40);
    v120 = &v121;
    v21 = v14;
    v114 = v21;
    v22 = v15;
    v115 = v22;
    v23 = v16;
    v116 = v23;
    v111 = v17;
    v117 = v111;
    v110 = v18;
    v118 = v110;
    v24 = v19;
    v119 = v24;
    objc_msgSend(v20, "na_each:", v113);

    objc_msgSend(*(id *)(a1 + 40), "_statusItemOfClass:", objc_opt_class());
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_aggregatablePositionStatusItemClasses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v25, "containsObject:", objc_opt_class());

    if ((_DWORD)v20)
    {
      if (objc_msgSend(v21, "count"))
      {
        v26 = objc_msgSend(v21, "count");
        HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Obstructed"), CFSTR("%lu"), v27, v28, v29, v30, v31, v32, v26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("description"));
      }
      else if (objc_msgSend(v22, "count"))
      {
        v52 = objc_msgSend(v22, "count");
        HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Open"), CFSTR("%lu"), v53, v54, v55, v56, v57, v58, v52);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("description"));
      }
      else if (objc_msgSend(v23, "count"))
      {
        v66 = objc_msgSend(v23, "count");
        HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Opening"), CFSTR("%lu"), v67, v68, v69, v70, v71, v72, v66);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("description"));
      }
      else if (objc_msgSend(v111, "count"))
      {
        v80 = objc_msgSend(v111, "count");
        HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Closing"), CFSTR("%lu"), v81, v82, v83, v84, v85, v86, v80);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("description"));
      }
      else
      {
        if (!objc_msgSend(v24, "count"))
        {
LABEL_36:
          objc_msgSend(*(id *)(a1 + 40), "applyInflectionToDescriptions:", v4);
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          _Block_object_dispose(&v121, 8);
          goto LABEL_9;
        }
        v94 = objc_msgSend(v24, "count");
        HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Unknown"), CFSTR("%lu"), v95, v96, v97, v98, v99, v100, v94);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("description"));
      }
LABEL_35:

      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v112, "latestResults");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("state"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isEqual:", &unk_1EA7CB698);

      if ((v51 & 1) != 0)
      {
        _HFLocalizedStringWithDefaultValue(CFSTR("HFSecurityCategoryStatusDescription_NoAlerts"), CFSTR("HFSecurityCategoryStatusDescription_NoAlerts"), 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("description"));
        goto LABEL_35;
      }
      objc_msgSend(v112, "latestResults");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("shortDescription"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("description"));
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend((id)v122[5], "latestResults");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("obstructedServices"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v122[5], "latestResults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("openServices"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v122[5], "latestResults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("openingServices"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v122[5], "latestResults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("closingServices"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "count"))
    {
      v41 = objc_msgSend(v33, "count");
      HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Jammed"), CFSTR("%lu"), v42, v43, v44, v45, v46, v47, v41);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("description"));
    }
    else if (objc_msgSend(v38, "count"))
    {
      v59 = objc_msgSend(v38, "count");
      HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Unlocked"), CFSTR("%lu"), v60, v61, v62, v63, v64, v65, v59);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("description"));
    }
    else if (objc_msgSend(v109, "count"))
    {
      v73 = objc_msgSend(v109, "count");
      HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Unlocking"), CFSTR("%lu"), v74, v75, v76, v77, v78, v79, v73);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("description"));
    }
    else if (objc_msgSend(v108, "count"))
    {
      v87 = objc_msgSend(v108, "count");
      HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Locking"), CFSTR("%lu"), v88, v89, v90, v91, v92, v93, v87);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("description"));
    }
    else
    {
      if (!objc_msgSend(v24, "count"))
      {
LABEL_33:

        goto LABEL_34;
      }
      v101 = objc_msgSend(v24, "count");
      HFLocalizedStringWithFormat(CFSTR("HFSecurityCategoryStatusTitle_Unknown"), CFSTR("%lu"), v102, v103, v104, v105, v106, v107, v101);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("description"));
    }

    goto LABEL_33;
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v34;
}

+ (id)_aggregatablePositionStatusItemClasses
{
  if (qword_1ED378BE8 != -1)
    dispatch_once(&qword_1ED378BE8, &__block_literal_global_46);
  return (id)qword_1ED378BF0;
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_209 != -1)
    dispatch_once(&_MergedGlobals_209, &__block_literal_global_2_0);
  return (id)qword_1ED378BE0;
}

void __49__HFSecurityCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378BE0;
  qword_1ED378BE0 = v0;

}

void __70__HFSecurityCategoryStatusItem__aggregatablePositionStatusItemClasses__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378BF0;
  qword_1ED378BF0 = v2;

}

void __60__HFSecurityCategoryStatusItem__subclass_updateWithOptions___block_invoke_18(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_statusItemOfClass:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    objc_msgSend(v4, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", &unk_1EA7CB680);

    if (v7)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), obj);
  }
  objc_msgSend((id)objc_opt_class(), "_aggregatablePositionStatusItemClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", a2);

  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(obj, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("obstructedServices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v12);

    v13 = *(void **)(a1 + 48);
    objc_msgSend(obj, "latestResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("openServices"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionSet:", v15);

    v16 = *(void **)(a1 + 56);
    objc_msgSend(obj, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("openingServices"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unionSet:", v18);

    v19 = *(void **)(a1 + 64);
    objc_msgSend(obj, "latestResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("closingServices"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unionSet:", v21);

    v22 = *(void **)(a1 + 72);
    objc_msgSend(obj, "latestResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("closedServices"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unionSet:", v24);

  }
  v25 = *(void **)(a1 + 80);
  objc_msgSend(obj, "latestResults");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("unknownServices"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "unionSet:", v27);

}

@end
