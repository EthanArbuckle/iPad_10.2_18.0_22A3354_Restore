@implementation HFStatusItem

uint64_t __71__HFStatusItem__filteredServicesOfTypes_containingCharacteristicTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  objc_msgSend(v3, "associatedServiceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "serviceType");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = *(void **)(a1 + 32);
  if (v8 && !objc_msgSend(v8, "containsObject:", v7))
    goto LABEL_14;
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__HFStatusItem__filteredServicesOfTypes_containingCharacteristicTypes___block_invoke_2;
    v19[3] = &unk_1EA726EA8;
    v20 = v3;
    v10 = objc_msgSend(v9, "na_any:", v19);

    if (!v10)
    {
LABEL_14:
      v14 = 0;
      goto LABEL_15;
    }
  }
  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(v3, "hf_supportsHomeStatus") & 1) == 0)
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v3, "serviceType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v16, "containsObject:", v17);

    if (!(_DWORD)v14)
      goto LABEL_15;
    objc_msgSend(v3, "hf_prettyDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempting to explicitly use a service in home status that claims not to support status! This is likely a bug due to not updating the denylist in +[HFStatusItemProvider hasStatusItemForServiceType:]. Service: %@"), v18);
    v14 = 0;
LABEL_19:

    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "_criticalServiceTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if ((v13 & 1) == 0
    && objc_msgSend(v3, "hf_hasSetVisibleInHomeStatus")
    && (objc_msgSend(v3, "hf_isVisibleInHomeStatus") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "room");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18 != 0;
    goto LABEL_19;
  }
  v14 = 1;
LABEL_15:

  return v14;
}

+ (id)_criticalServiceTypes
{
  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_19_12);
  return (id)qword_1ED378A68;
}

- (id)standardResultsForBatchReadResponse:(id)a3 serviceTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  HFCAPackageIconDescriptor *v27;
  __CFString **v28;
  __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  HFStatusItem *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;

  v6 = a3;
  v7 = a4;
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = -1;
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__22;
  v75 = __Block_byref_object_dispose__22;
  v76 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__22;
  v69 = __Block_byref_object_dispose__22;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__22;
  v63 = __Block_byref_object_dispose__22;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__22;
  v57 = __Block_byref_object_dispose__22;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  if (-[HFStatusItem isInvalidationPending](self, "isInvalidationPending"))
  {
    -[HFItem latestResults](self, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("priority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (int)objc_msgSend(v9, "intValue");
      v11 = v78;
    }
    else
    {
      v11 = v78;
      v10 = v78[3];
    }
    v11[3] = v10;

  }
  objc_msgSend(v6, "allServices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __65__HFStatusItem_standardResultsForBatchReadResponse_serviceTypes___block_invoke;
  v39[3] = &unk_1EA73C1E8;
  v37 = v6;
  v40 = v37;
  v41 = self;
  v42 = &v49;
  v43 = &v81;
  v44 = &v65;
  v45 = &v59;
  v46 = &v53;
  v47 = &v77;
  v48 = &v71;
  objc_msgSend(v12, "na_each:", v39);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (*((_BYTE *)v50 + 24)
    || (!v82[3] || v78[3] < 0)
    && (objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden")), *((_BYTE *)v50 + 24)))
  {
    objc_msgSend(v37, "allServices");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!-[HFStatusItem canRepresentAbnormalAndNormalHomeKitObjectsTogether](self, "canRepresentAbnormalAndNormalHomeKitObjectsTogether"))
  {
    if (objc_msgSend((id)v60[5], "count") || objc_msgSend((id)v54[5], "count"))
    {
      objc_msgSend((id)v60[5], "setByAddingObjectsFromSet:", v54[5]);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[HFStatusItem isInvalidationPending](self, "isInvalidationPending"))
      {
        -[HFItem latestResults](self, "latestResults");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      v15 = (id)v66[5];
    }
LABEL_8:
    v16 = v15;
    goto LABEL_9;
  }
  objc_msgSend((id)v66[5], "setByAddingObjectsFromSet:", v60[5]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setByAddingObjectsFromSet:", v54[5]);
  v26 = objc_claimAutoreleasedReturnValue();
LABEL_23:
  v16 = (void *)v26;

LABEL_9:
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("representedHomeKitObjects"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA7CD060, CFSTR("statusItemCategory"));
  if (objc_msgSend(v16, "count"))
  {
    -[HFStatusItem defaultTitleForRepresentedHomeKitObjects:](self, "defaultTitleForRepresentedHomeKitObjects:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("title"));

  }
  if ((objc_msgSend((id)v60[5], "isEqualToSet:", v54[5]) & 1) != 0)
  {
    v18 = &unk_1EA7CD078;
LABEL_13:
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("transitioningState"));
    goto LABEL_15;
  }
  if (!objc_msgSend((id)v60[5], "count") && objc_msgSend((id)v54[5], "count"))
  {
    v18 = &unk_1EA7CD090;
    goto LABEL_13;
  }
LABEL_15:
  -[HFStatusItem iconDescriptorForRepresentedHomeKitObjects:](self, "iconDescriptorForRepresentedHomeKitObjects:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v7;
    objc_msgSend(v19, "packageIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("transitioningState"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("transitioningState"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue");

    }
    else
    {
      v24 = v82[3];
    }

    v27 = [HFCAPackageIconDescriptor alloc];
    v28 = &HFCAPackageStateOn;
    if (v24 != 2)
      v28 = &HFCAPackageStateOff;
    v29 = *v28;
    v30 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:](v27, "initWithPackageIdentifier:state:", v21, v29);

    v19 = (void *)v30;
    v7 = v20;
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("icon"));
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __65__HFStatusItem_standardResultsForBatchReadResponse_serviceTypes___block_invoke_58;
  v38[3] = &unk_1EA726AB8;
  v38[4] = self;
  objc_msgSend(v7, "na_flatMap:", v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromSet:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v82[3]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v78[3]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("priority"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v72[5], CFSTR("sortKey"));
  objc_msgSend(v37, "allCharacteristics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v35, CFSTR("dependentHomeKitObjects"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, CFSTR("dependentServiceTypes"));
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  return v14;
}

- (BOOL)isInvalidationPending
{
  _BOOL4 v3;

  v3 = -[HFStatusItem supportsInvalidation](self, "supportsInvalidation");
  if (v3)
    LOBYTE(v3) = -[HFStatusItem needsInvalidation](self, "needsInvalidation");
  return v3;
}

- (BOOL)supportsInvalidation
{
  return 0;
}

- (BOOL)needsInvalidation
{
  return self->_needsInvalidation;
}

- (BOOL)canRepresentAbnormalAndNormalHomeKitObjectsTogether
{
  return 0;
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  HFStatusItem *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__HFStatusItem_iconDescriptorForRepresentedHomeKitObjects___block_invoke;
    v12[3] = &unk_1EA73C178;
    v6 = v5;
    v13 = v6;
    objc_msgSend(v4, "na_map:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
    }
    else
    {
      objc_msgSend(v6, "na_map:", &__block_literal_global_44_5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        HFLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v15 = self;
          v16 = 2112;
          v17 = v9;
          v18 = 2112;
          v19 = v6;
          v20 = 2112;
          v21 = v8;
          _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "%@ Invalid number of icon descriptors: %@ for service types: %@. Defaulting to %@.", buf, 0x2Au);
        }

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return 0;
}

uint64_t __75__HFStatusItem_characteristicTypesForServiceType_includingAssociatedTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", a2);
}

void __65__HFStatusItem_standardResultsForBatchReadResponse_serviceTypes___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a2;
  v3 = objc_msgSend(v22, "hf_isChildService");
  v4 = v22;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "batchResponseForService:includeChildServices:", v22, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "_shouldForceVisibleForService:", v22))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (!v5)
      goto LABEL_32;
    +[HFCharacteristicValueDisplayMetadata displayMetadataForService:characteristicReadResponse:](HFCharacteristicValueDisplayMetadata, "displayMetadataForService:characteristicReadResponse:", v22, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_31:

LABEL_32:
      v4 = v22;
      goto LABEL_33;
    }
    if (!objc_msgSend(v6, "primaryState"))
      goto LABEL_22;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v8 == 1)
    {
      if (objc_msgSend(v6, "primaryState") == 2)
      {
LABEL_12:
        v9 = 2;
LABEL_17:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9;
        if (objc_msgSend(v6, "primaryState") == 1)
        {
          v11 = *(_QWORD *)(a1 + 64);
        }
        else
        {
          if (objc_msgSend(v6, "primaryState") != 2)
            goto LABEL_22;
          v11 = *(_QWORD *)(a1 + 72);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(v11 + 8) + 40), "addObject:", v22);
LABEL_22:
        if (objc_msgSend(v6, "transitioningPrimaryState"))
        {
          v12 = objc_msgSend(v6, "transitioningPrimaryState");
          if (v12 != objc_msgSend(v6, "primaryState"))
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v22);
        }
        v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        v14 = objc_msgSend(v6, "priority");
        if (v13 <= v14)
          v15 = v14;
        else
          v15 = v13;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v15;
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
        if (!v16
          || (objc_msgSend(v6, "sortKey"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v16, "localizedStandardCompare:", v17),
              v17,
              v18 == 1))
        {
          objc_msgSend(v6, "sortKey");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

        }
        goto LABEL_31;
      }
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    if (v8 == 2)
    {
      if (objc_msgSend(v6, "primaryState") == 1)
        goto LABEL_12;
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    v10 = objc_msgSend(v6, "primaryState");
    if (v8 <= v10)
      v9 = v10;
    else
      v9 = v8;
    goto LABEL_17;
  }
LABEL_33:

}

- (BOOL)_shouldForceVisibleForService:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[HFStatusItem room](self, "room");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = (void *)v5, v7 = objc_msgSend(v4, "hf_isSensorService"), v6, (v7 & 1) != 0)
    || (objc_msgSend(v4, "serviceType"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0CB9AA8]),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 1;
  }
  else if (objc_msgSend(v4, "hf_isSensorService"))
  {
    objc_msgSend(v4, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hf_isHomePod"))
    {
      objc_msgSend(v4, "serviceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CB9A40]) & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend(v4, "serviceType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0CB9AF8]);

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_filteredServicesOfTypes:(id)a3 containingCharacteristicTypes:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  HFStatusItem *v23;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_standardServiceTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isSubsetOfSet:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFStatusItem.m"), 279, CFSTR("Asked to filter services to include unsupported types: %@"), v7);

    }
  }
  -[HFStatusItem room](self, "room");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[HFStatusItem room](self, "room");
  else
    -[HFStatusItem home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hf_allVisibleServices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__HFStatusItem__filteredServicesOfTypes_containingCharacteristicTypes___block_invoke;
  v20[3] = &unk_1EA73C1C0;
  v21 = v7;
  v22 = v8;
  v23 = self;
  v16 = v8;
  v17 = v7;
  objc_msgSend(v15, "na_filter:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

+ (id)characteristicTypesForServiceType:(id)a3 includingAssociatedTypes:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
  {
    objc_msgSend(a1, "_associatedServiceTypeToServiceTypeMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "na_flatMap:", &__block_literal_global_33_3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setByAddingObjectsFromSet:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = v8;
    }

  }
  else
  {
    v13 = v7;
  }

  return v13;
}

+ (id)_associatedServiceTypeToServiceTypeMap
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED378A80 != -1)
    dispatch_once(&qword_1ED378A80, block);
  return (id)qword_1ED378A88;
}

BOOL __71__HFStatusItem__filteredServicesOfTypes_containingCharacteristicTypes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "hf_characteristicOfType:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (HFStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFStatusItem *v12;
  HFStatusItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFStatusItem;
  v12 = -[HFStatusItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_room, a4);
    objc_storeStrong((id *)&v13->_home, a3);
    objc_storeStrong((id *)&v13->_valueSource, a5);
  }

  return v13;
}

id __59__HFStatusItem_iconDescriptorForRepresentedHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "associatedServiceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v4, "serviceType");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    objc_msgSend(v4, "hf_iconDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[HFServiceIconFactory iconDescriptorForAccessory:](HFServiceIconFactory, "iconDescriptorForAccessory:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)filteredServicesOfTypes:(id)a3
{
  return -[HFStatusItem _filteredServicesOfTypes:containingCharacteristicTypes:](self, "_filteredServicesOfTypes:containingCharacteristicTypes:", a3, 0);
}

void __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v8, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v4);
}

- (id)displayNameForHomeKitObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_4:
    objc_msgSend(v4, "hf_serviceNameComponents");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(CFSTR("%@ Unhandled HomeKit object: %@"), self, v4);
      v5 = 0;
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v5 = v4;
  objc_msgSend(v5, "hf_linkedAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_serviceNameComponents");
  v10 = objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v5, "hf_displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  v5 = (id)v10;
LABEL_5:
  -[HFStatusItem room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "serviceName");
  else
    objc_msgSend(v5, "composedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v7;
}

- (id)filteredServices
{
  return -[HFStatusItem _filteredServicesOfTypes:containingCharacteristicTypes:](self, "_filteredServicesOfTypes:containingCharacteristicTypes:", 0, 0);
}

void __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_5;
  v7[3] = &unk_1EA73C0C8;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_each:", v7);

}

void __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_3;
  v3[3] = &__block_descriptor_40_e26___NSMutableDictionary_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED378A88;
  qword_1ED378A88 = v1;

}

id __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_serviceTypeToAssociatedServiceTypesMap");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__HFStatusItem__associatedServiceTypeToServiceTypeMap__block_invoke_4;
  v5[3] = &unk_1EA73C0F0;
  v3 = v2;
  v6 = v3;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

+ (id)_serviceTypeToAssociatedServiceTypesMap
{
  if (qword_1ED378A70 != -1)
    dispatch_once(&qword_1ED378A70, &__block_literal_global_22_9);
  return (id)qword_1ED378A78;
}

void __37__HFStatusItem__criticalServiceTypes__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_alarmSensorServiceTypes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0CB9AA8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378A68;
  qword_1ED378A68 = v0;

}

void __55__HFStatusItem__serviceTypeToAssociatedServiceTypesMap__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0CB99F0];
  v0 = *MEMORY[0x1E0CB9A28];
  v11[0] = *MEMORY[0x1E0CB9A00];
  v11[1] = v0;
  v1 = *MEMORY[0x1E0CB9B30];
  v11[2] = *MEMORY[0x1E0CB9B28];
  v11[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0CB9AA0];
  v4 = *MEMORY[0x1E0CB9A70];
  v10[0] = *MEMORY[0x1E0CB9A10];
  v3 = v10[0];
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = *MEMORY[0x1E0CB9AD8];
  v9[0] = v3;
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ED378A78;
  qword_1ED378A78 = v7;

}

- (HFStatusItem)initWithHome:(id)a3 room:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HFStatusItem *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "hf_characteristicValueManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFStatusItem initWithHome:room:valueSource:](self, "initWithHome:room:valueSource:", v7, v6, v8);

  return v9;
}

- (HFStatusItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_room_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFStatusItem.m"), 58, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFStatusItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFStatusItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithHome:room:valueSource:", v5, v6, v7);

  -[HFStatusItem invalidationDate](self, "invalidationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInvalidationDate:", v9);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

id __59__HFStatusItem_iconDescriptorForRepresentedHomeKitObjects___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HFServiceIconFactory defaultIconDescriptorForServiceType:serviceSubtype:](HFServiceIconFactory, "defaultIconDescriptorForServiceType:serviceSubtype:", a2, 0);
}

- (double)invalidationTimeout
{
  return 8.0;
}

id __65__HFStatusItem_standardResultsForBatchReadResponse_serviceTypes___block_invoke_58(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "_associatedServiceTypeToServiceTypeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itemUpdateFromLatestResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFStatusItemUpdate *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[HFItem latestResults](self, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("icon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem statusItemUpdate](self, "statusItemUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFStatusItem statusItemUpdate](self, "statusItemUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v4);

    -[HFStatusItem statusItemUpdate](self, "statusItemUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSecondaryText:", v5);

    -[HFStatusItem statusItemUpdate](self, "statusItemUpdate");
    v10 = (HFStatusItemUpdate *)objc_claimAutoreleasedReturnValue();
    -[HFStatusItemUpdate setIconDescriptor:](v10, "setIconDescriptor:", v6);
  }
  else
  {
    v10 = -[HFStatusItemUpdate initWithTitle:secondaryText:iconDescriptor:]([HFStatusItemUpdate alloc], "initWithTitle:secondaryText:iconDescriptor:", v4, v5, v6);
    -[HFStatusItem setStatusItemUpdate:](self, "setStatusItemUpdate:", v10);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("statusCurrentValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem statusItemUpdate](self, "statusItemUpdate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentValue:", v11);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("statusPossibleValues"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem statusItemUpdate](self, "statusItemUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPossibleValues:", v13);

  -[HFStatusItem statusItemUpdate](self, "statusItemUpdate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isTransitioning
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  -[HFItem latestResults](self, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[HFItem latestResults](self, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transitioningState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8)
    v9 = v5 == v8;
  else
    v9 = 1;
  return !v9;
}

- (BOOL)canScheduleInvalidation
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  if (-[HFStatusItem supportsInvalidation](self, "supportsInvalidation"))
  {
    -[HFItem latestResults](self, "latestResults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "integerValue") == 1)
      v5 = !-[HFStatusItem isTransitioning](self, "isTransitioning");
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setNeedsInvalidation:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (!-[HFStatusItem supportsInvalidation](self, "supportsInvalidation"))
    NSLog(CFSTR("Asked to update needsInvalidation for unsupported item."));
  if (-[HFStatusItem supportsInvalidation](self, "supportsInvalidation"))
  {
    if (self->_needsInvalidation != v3)
    {
      self->_needsInvalidation = v3;
      -[HFStatusItem _updateInvalidationDate](self, "_updateInvalidationDate");
    }
  }
}

- (void)scheduleInvalidation
{
  if (!-[HFStatusItem supportsInvalidation](self, "supportsInvalidation"))
    NSLog(CFSTR("Asked to schedule invalidation for unsupported item."));
  -[HFStatusItem _updateInvalidationDate](self, "_updateInvalidationDate");
}

- (void)_updateInvalidationDate
{
  void *v3;
  id v4;

  if (-[HFStatusItem needsInvalidation](self, "needsInvalidation")
    && -[HFStatusItem canScheduleInvalidation](self, "canScheduleInvalidation"))
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    -[HFStatusItem invalidationTimeout](self, "invalidationTimeout");
    objc_msgSend(v3, "dateWithTimeIntervalSinceNow:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[HFStatusItem setInvalidationDate:](self, "setInvalidationDate:", v4);

  }
  else if (!-[HFStatusItem needsInvalidation](self, "needsInvalidation"))
  {
    -[HFStatusItem setInvalidationDate:](self, "setInvalidationDate:", 0);
  }
}

- (id)shortTitleForFormat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), &stru_1EA741FF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasSuffix:", v6))
  {
    if (objc_msgSend(v3, "isEqual:", v6))
      v7 = 0;
    else
      v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (NSDate)invalidationDate
{
  return self->_invalidationDate;
}

- (void)setInvalidationDate:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationDate, a3);
}

- (HFStatusItemUpdate)statusItemUpdate
{
  return self->_statusItemUpdate;
}

- (void)setStatusItemUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_statusItemUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItemUpdate, 0);
  objc_storeStrong((id *)&self->_invalidationDate, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_room, 0);
}

@end
