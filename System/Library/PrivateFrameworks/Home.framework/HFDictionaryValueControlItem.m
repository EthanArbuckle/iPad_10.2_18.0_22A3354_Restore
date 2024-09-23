@implementation HFDictionaryValueControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFDictionaryValueControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_characteristicType_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDictionaryValueControlItem.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDictionaryValueControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFDictionaryValueControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 displayResults:(id)a5
{
  id v8;
  NSString *v9;
  objc_class *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  HFControlItemCharacteristicOptions *v17;
  void *v18;
  HFControlItemCharacteristicOptions *v19;
  HFDictionaryValueControlItem *v20;
  NSString *characteristicType;
  NSString *v22;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = (objc_class *)MEMORY[0x1E0C99E20];
  v11 = a5;
  v12 = objc_alloc_init(v10);
  objc_msgSend(v12, "addObject:", v9);
  v13 = *MEMORY[0x1E0CB8A68];
  v29[0] = *MEMORY[0x1E0CB8A60];
  v29[1] = v13;
  v29[2] = *MEMORY[0x1E0CB8A50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v14);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __86__HFDictionaryValueControlItem_initWithValueSource_characteristicType_displayResults___block_invoke;
  v25[3] = &unk_1EA726EA8;
  v26 = v8;
  v15 = v8;
  objc_msgSend(v12, "na_filter:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [HFControlItemCharacteristicOptions alloc];
  v27 = &unk_1EA7CC3B8;
  v28 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v17, "initWithCharacteristicTypesByUsage:", v18);

  v24.receiver = self;
  v24.super_class = (Class)HFDictionaryValueControlItem;
  v20 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v24, sel_initWithValueSource_characteristicOptions_displayResults_, v15, v19, v11);

  characteristicType = v20->_characteristicType;
  v20->_characteristicType = v9;
  v22 = v9;

  return v20;
}

BOOL __86__HFDictionaryValueControlItem_initWithValueSource_characteristicType_displayResults___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "allCharacteristicsForCharacteristicType:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFControlItem valueSource](self, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDictionaryValueControlItem characteristicType](self, "characteristicType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem displayResults](self, "displayResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithValueSource:characteristicType:displayResults:", v5, v6, v7);

  return v8;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  HFDictionaryValueControlItem *v7;
  void *v8;
  void *v9;
  HFDictionaryValueControlItem *v10;

  v6 = a4;
  if (-[HFDictionaryValueControlItem canCopyWithCharacteristicOptions:](self, "canCopyWithCharacteristicOptions:", a3))
  {
    v7 = [HFDictionaryValueControlItem alloc];
    -[HFDictionaryValueControlItem characteristicType](self, "characteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFControlItem displayResults](self, "displayResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HFDictionaryValueControlItem initWithValueSource:characteristicType:displayResults:](v7, "initWithValueSource:characteristicType:displayResults:", v6, v8, v9);

    -[HFItem copyLatestResultsFromItem:](v10, "copyLatestResultsFromItem:", self);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)valueForCharacteristicValues:(id)a3
{
  return a3;
}

- (id)characteristicValuesForValue:(id)a3
{
  return a3;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString **v18;
  __CFString *v19;
  uint64_t v20;
  HFCAPackageIconDescriptor *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HFPrimaryStateIconDescriptor *v25;
  HFPrimaryStateIconDescriptor *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)HFDictionaryValueControlItem;
  -[HFControlItem resultsForBatchReadResponse:](&v41, sel_resultsForBatchReadResponse_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v39 = 0;
  v40 = 0;
  v38 = 0;
  -[HFDictionaryValueControlItem getStatus:mainTextColor:supplementaryDescription:withBatchReadResponse:](self, "getStatus:mainTextColor:supplementaryDescription:withBatchReadResponse:", &v40, &v39, &v38, v4);
  v7 = v40;
  v8 = v39;
  v9 = v38;
  if (v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("controlStatus"));
  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("controlDescriptionMainTextColor"));
  v36 = v8;
  if (v9)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("supplementaryControlDescription"));
  v34 = v9;
  objc_opt_class();
  -[HFControlItem valueSource](self, "valueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allServices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "hf_iconDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCharacteristicValueDisplayMetadata displayMetadataForService:characteristicReadResponse:](HFCharacteristicValueDisplayMetadata, "displayMetadataForService:characteristicReadResponse:", v14, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v37 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_msgSend(v16, "primaryState", v9, v8, v7);
    v18 = &HFCAPackageStateOn;
    if (v17 != 2)
      v18 = &HFCAPackageStateOff;
    v19 = *v18;
    +[HFServiceIconFactory iconModifiersForService:](HFServiceIconFactory, "iconModifiersForService:", v14);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = [HFCAPackageIconDescriptor alloc];
    objc_msgSend(v15, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:modifiers:](v21, "initWithPackageIdentifier:state:modifiers:", v22, v19, v20);

    v15 = (void *)v20;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "iconDescriptorForPrimaryState:", objc_msgSend(v16, "primaryState", v9, v8, v7));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v19 = 0;
      v27 = 0x1E0CBA000;
      goto LABEL_21;
    }
    v25 = v24;
    v19 = (__CFString *)v25;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = [HFPrimaryStateIconDescriptor alloc];
    objc_msgSend(v15, "identifier", v9, v8, v37);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = -[HFPrimaryStateIconDescriptor initWithIdentifier:primaryState:](v26, "initWithIdentifier:primaryState:", v19, objc_msgSend(v16, "primaryState"));
LABEL_19:
    v23 = (uint64_t)v25;
LABEL_20:
    v27 = 0x1E0CBA000uLL;

    v15 = (void *)v23;
LABEL_21:

    goto LABEL_22;
  }
  v27 = 0x1E0CBA000;
LABEL_22:
  objc_msgSend(v6, "na_safeSetObject:forKey:", v15, CFSTR("controlIcon"), v34);
  objc_msgSend(*(id *)(v27 + 2016), "hf_sensorServiceTypes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem valueSource](self, "valueSource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "primaryServiceDescriptor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "serviceType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v28, "containsObject:", v31);

  if (v32)
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("readValueOnly"));

  return v6;
}

- (void)getStatus:(id *)a3 mainTextColor:(id *)a4 supplementaryDescription:(id *)a5 withBatchReadResponse:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (**v71)(_QWORD);
  id v72;
  id obj;
  void *v75;
  void *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD aBlock[10];
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  _QWORD v101[11];
  _QWORD v102[11];
  _QWORD v103[6];
  _QWORD v104[3];
  _QWORD v105[3];
  _BYTE v106[128];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[2];
  uint64_t v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v72 = a6;
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__13;
  v99 = __Block_byref_object_dispose__13;
  v100 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__13;
  v93 = __Block_byref_object_dispose__13;
  v94 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__13;
  v87 = __Block_byref_object_dispose__13;
  v88 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__HFDictionaryValueControlItem_getStatus_mainTextColor_supplementaryDescription_withBatchReadResponse___block_invoke;
  aBlock[3] = &unk_1EA7352A8;
  aBlock[4] = &v95;
  aBlock[5] = &v89;
  aBlock[8] = a4;
  aBlock[9] = a5;
  aBlock[6] = &v83;
  aBlock[7] = a3;
  v71 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[HFControlItem characteristicValuesByTypeForBatchReadResponse:](self, "characteristicValuesByTypeForBatchReadResponse:", v72);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB8A68];
  v109[0] = *MEMORY[0x1E0CB8A60];
  v9 = v109[0];
  v109[1] = v10;
  v110 = *MEMORY[0x1E0CB8A50];
  v11 = v110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v9;
  v107[1] = v10;
  v108[0] = &unk_1EA7CC3D0;
  v108[1] = &unk_1EA7CC3D0;
  v107[2] = v11;
  v108[2] = &unk_1EA7CC3D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 3);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v106, 16);
  v69 = v10;
  v70 = v9;
  v68 = v11;
  if (v13)
  {
    v75 = 0;
    v14 = *(_QWORD *)v79;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v79 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v15);
      objc_msgSend(v76, "objectForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = v17;
      v19 = (objc_opt_isKindOfClass() & 1) != 0 ? v18 : 0;
      v20 = v19;

      objc_msgSend(v77, "objectForKey:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v22 = v21;
      v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
      v24 = v23;

      v25 = !v20 || v24 == 0;
      if (v25 || !objc_msgSend(v20, "isEqualToNumber:", v24))
      {
        v27 = 1;
      }
      else
      {
        v26 = v16;

        v27 = 0;
        v75 = v26;
      }

      if (!v27)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v106, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v75 = 0;
  }

  -[HFControlItem valueSource](self, "valueSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "primaryServiceDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "serviceType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (uint64_t *)MEMORY[0x1E0CB8930];
  v32 = (_QWORD *)MEMORY[0x1E0CB8958];
  v33 = (uint64_t *)MEMORY[0x1E0CB8988];
  if (v75)
  {
    v104[0] = v70;
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicStateGroupedTitleStatusLowBattery"), CFSTR("HFCharacteristicStateGroupedTitleStatusLowBattery"), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v34;
    v104[1] = v69;
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicStateGroupedTitleStatusTampered"), CFSTR("HFCharacteristicStateGroupedTitleStatusTampered"), 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v35;
    v104[2] = v68;
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicStateGroupedTitleStatusFault"), CFSTR("HFCharacteristicStateGroupedTitleStatusFault"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v105[2] = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "objectForKey:", v75);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v96[5];
    v96[5] = v38;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (id)v90[5];
    v90[5] = v40;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_sensorCharacteristicTypeForServiceType:", v30);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "objectForKey:", v75);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v43 = v37;
    else
      v43 = 0;
    v41 = v43;

    if (v41)
    {
      -[HFControlItem valueSource](self, "valueSource");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "metadataForCharacteristicType:", v75);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = *MEMORY[0x1E0CB87D8];
      v103[0] = *MEMORY[0x1E0CB8A38];
      v103[1] = v46;
      v47 = *v31;
      v103[2] = *MEMORY[0x1E0CB87F0];
      v103[3] = v47;
      v48 = *v33;
      v103[4] = *v32;
      v103[5] = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 6);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "containsObject:", v75);

      if (v50)
        objc_msgSend(MEMORY[0x1E0CB3658], "hf_controlDescriptionFormatterForCharacteristicType:withMetadata:options:form:", v75, v45, 0, 1);
      else
        objc_msgSend(MEMORY[0x1E0CB3658], "hf_valueFormatterForCharacteristicType:withMetadata:options:", v75, v45, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringForObjectValue:", v41);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v96[5];
      v96[5] = v52;

    }
    objc_msgSend((id)objc_opt_class(), "defaultMainTextColorForCharacteristicType:", v75);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v90[5];
    v90[5] = v54;

  }
  v56 = *MEMORY[0x1E0CB8820];
  v101[0] = *MEMORY[0x1E0CB87B0];
  v101[1] = v56;
  v102[0] = CFSTR("AirQuality");
  v102[1] = CFSTR("ContactSensor");
  v57 = *MEMORY[0x1E0CB8890];
  v101[2] = *MEMORY[0x1E0CB8860];
  v101[3] = v57;
  v102[2] = CFSTR("LightSensor");
  v102[3] = CFSTR("TemperatureSensor");
  v58 = *MEMORY[0x1E0CB87D8];
  v101[4] = *MEMORY[0x1E0CB8A38];
  v101[5] = v58;
  v102[4] = CFSTR("SmokeSensor");
  v102[5] = CFSTR("CarbonDioxideSensor");
  v59 = *v31;
  v101[6] = *MEMORY[0x1E0CB87F0];
  v101[7] = v59;
  v102[6] = CFSTR("CarbonMonoxideSensor");
  v102[7] = CFSTR("LeakSensor");
  v60 = *v33;
  v101[8] = *v32;
  v101[9] = v60;
  v102[8] = CFSTR("MotionSensor");
  v102[9] = CFSTR("OccupancySensor");
  v101[10] = *MEMORY[0x1E0CB8880];
  v102[10] = CFSTR("HumiditySensor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 11);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_sensorCharacteristicTypeForServiceType:", v30);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v61, "objectForKey:", v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "stringWithFormat:", CFSTR("HFServiceType%@"), v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  _HFLocalizedStringWithDefaultValue(v65, v65, 1);
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v84[5];
  v84[5] = v66;

  if (v71)
    v71[2](v71);

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v95, 8);
}

_QWORD *__103__HFDictionaryValueControlItem_getStatus_mainTextColor_supplementaryDescription_withBatchReadResponse___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (result[7])
  {
    result = objc_retainAutorelease(*(id *)(*(_QWORD *)(result[4] + 8) + 40));
    *(_QWORD *)v1[7] = result;
  }
  if (v1[8])
  {
    result = objc_retainAutorelease(*(id *)(*(_QWORD *)(v1[5] + 8) + 40));
    *(_QWORD *)v1[8] = result;
  }
  if (v1[9])
  {
    result = objc_retainAutorelease(*(id *)(*(_QWORD *)(v1[6] + 8) + 40));
    *(_QWORD *)v1[9] = result;
  }
  return result;
}

+ (id)defaultMainTextColorForCharacteristicType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0CB87B0];
  v3 = (void *)MEMORY[0x1E0CEA478];
  v4 = a3;
  objc_msgSend(v3, "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E0CB8860];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
