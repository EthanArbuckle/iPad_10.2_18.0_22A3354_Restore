@implementation HUProgrammableSwitchEventOptionItem

- (HUProgrammableSwitchEventOptionItem)initWithCharacteristic:(id)a3 triggerValue:(id)a4 valueSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HUProgrammableSwitchEventOptionItem *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUProgrammableSwitchEventOptionItem.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic"));

    if (v10)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUProgrammableSwitchEventOptionItem.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueSource"));

  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUProgrammableSwitchEventOptionItem.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerValue"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HUProgrammableSwitchEventOptionItem;
  v13 = -[HUCharacteristicEventOptionItem initWithCharacteristics:triggerValue:](&v18, sel_initWithCharacteristics_triggerValue_, v12, v10);

  if (v13)
    objc_storeStrong((id *)&v13->_valueSource, a5);

  return v13;
}

- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 triggerValue:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCharacteristic_triggerValue_valueSource_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUProgrammableSwitchEventOptionItem.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUProgrammableSwitchEventOptionItem initWithCharacteristics:triggerValue:]",
    v7);

  return 0;
}

- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 triggerValueRange:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCharacteristic_triggerValue_valueSource_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUProgrammableSwitchEventOptionItem.m"), 47, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUProgrammableSwitchEventOptionItem initWithCharacteristics:triggerValueRange:]",
    v7);

  return 0;
}

- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 thresholdValueRange:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCharacteristic_triggerValue_valueSource_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUProgrammableSwitchEventOptionItem.m"), 52, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUProgrammableSwitchEventOptionItem initWithCharacteristics:thresholdValueRange:]",
    v7);

  return 0;
}

- (HMCharacteristic)characteristic
{
  void *v2;
  void *v3;

  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCharacteristic *)v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
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
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  void *v54;
  HUProgrammableSwitchEventOptionItem *v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  HUProgrammableSwitchEventOptionItem *v79;
  void *v80;
  id v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  unsigned int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[5];
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  BOOL v107;
  char v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  id v114;
  id v115;
  HUProgrammableSwitchEventOptionItem *v116;
  id v117;
  id v118;
  _QWORD v119[2];
  _QWORD v120[3];
  _QWORD v121[3];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    NSLog(CFSTR("Must have characteristics"));
  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HUCharacteristicEventOptionItem triggerValue](self, "triggerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CBA4D0];
    -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v11, v8);
    v12 = objc_claimAutoreleasedReturnValue();

    v88 = (void *)v12;
    if (v12)
      v13 = v12;
    else
      v13 = MEMORY[0x1E0C9AAB0];
    v14 = (_QWORD *)MEMORY[0x1E0D30D70];
    if (v12)
      v14 = (_QWORD *)MEMORY[0x1E0D30D18];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *v14);
    -[HUProgrammableSwitchEventOptionItem characteristic](self, "characteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      NSLog(CFSTR("No programmable switch characteristic! "));
    objc_msgSend(v15, "hf_home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v8);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "hf_remoteAccessState");
    v19 = v17 != 0;
    if (v18 != 1)
      v19 = 1;
    v83 = v19;
    if (v18 == 1)
      v20 = 1;
    else
      v20 = objc_msgSend(v16, "hf_currentUserIsAdministrator") ^ 1;
    v85 = v20;
    v24 = MEMORY[0x1E0C809B0];
    v89 = v9;
    v90 = v4;
    v86 = (void *)v17;
    v87 = v16;
    v92 = v8;
    if (v17)
    {
      v25 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v9, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setWithArray:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31950]), "initWithHome:trigger:", v16, v17);
      objc_msgSend(v28, "updateWithOptions:", v4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v24;
      v113[1] = 3221225472;
      v113[2] = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke;
      v113[3] = &unk_1E6F5A978;
      v114 = v27;
      v115 = v9;
      v116 = self;
      v117 = v15;
      v118 = v8;
      v30 = v27;
      objc_msgSend(v29, "flatMap:", v113);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "futureWithResult:", v32);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v15, "service");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hf_labelNamespaceCharacteristic");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v93 = v15;
    objc_msgSend(v15, "service");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "hf_labelIndexCharacteristic");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)objc_opt_new();
    objc_msgSend(v34, "service");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "na_safeAddObject:", v38);

    objc_msgSend(v36, "service");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "na_safeAddObject:", v39);

    objc_msgSend(v34, "service");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "accessory");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "hf_programmableSwitchNamespaceServices");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "allObjects");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v43;
    v45 = (void *)MEMORY[0x1E0C9AA60];
    if (v43)
      v45 = (void *)v43;
    v46 = v45;

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v47 = v46;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v110 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(v37, "addObject:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i));
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
      }
      while (v49);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8928], *MEMORY[0x1E0CB8920], 0);
    v52 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)v52;
    if (objc_msgSend(v37, "count"))
    {
      -[HUProgrammableSwitchEventOptionItem valueSource](self, "valueSource");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "readValuesForCharacteristicTypes:inServices:", v52, v37);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = MEMORY[0x1E0C809B0];
      v101[1] = 3221225472;
      v101[2] = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_3;
      v101[3] = &unk_1E6F5A9C8;
      v102 = v47;
      v103 = v34;
      v104 = v36;
      v105 = v93;
      v106 = v92;
      v107 = v83;
      v108 = v85;
      objc_msgSend(v54, "flatMap:", v101);
      v55 = self;
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = v102;
      v58 = v36;
      v59 = 0x1E0D51000;
    }
    else
    {
      v79 = self;
      v80 = v36;
      objc_msgSend(v36, "value");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v57)
      {
        v60 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v93, "service");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "numberWithUnsignedInteger:", objc_msgSend(v61, "hf_fallbackProgrammableSwitchIndex"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v62 = (void *)MEMORY[0x1E0C99E08];
      v120[0] = CFSTR("sectionNamespace");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D31A28]);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v121[0] = v63;
      v121[1] = v57;
      v120[1] = CFSTR("sectionElementIndex");
      v120[2] = CFSTR("sectionIndex");
      v121[2] = &unk_1E7041530;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 3);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "dictionaryWithDictionary:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v93, "hf_eventTriggersForTriggerValue:", v92);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "na_safeSetObject:forKey:", v66, CFSTR("associateadTriggersKey"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v83);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKey:", v67, CFSTR("itemIsEditable"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v85);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKey:", v68, *MEMORY[0x1E0D30E88]);

      v59 = 0x1E0D51000uLL;
      v69 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v65);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "futureWithResult:", v70);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = v80;
      v55 = v79;
    }

    v71 = *(void **)(v59 + 2496);
    v119[0] = v91;
    v119[1] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "combineAllFutures:", v84);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_49;
    v94[3] = &unk_1E6F5A9F0;
    v94[4] = v55;
    v95 = v93;
    v96 = v92;
    v97 = v58;
    v98 = v34;
    v99 = v86;
    v100 = v47;
    v81 = v47;
    v73 = v86;
    v74 = v34;
    v75 = v58;
    v76 = v92;
    v77 = v93;
    objc_msgSend(v72, "flatMap:", v94);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v90;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

id __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a2;
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "minusSet:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_2;
  v21 = &unk_1E6F5A950;
  v22 = v10;
  v23 = v9;
  v11 = v9;
  v12 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v18);
  objc_msgSend((id)objc_opt_class(), "_buildOutTriggerEditorOptionsForCharacteristic:triggerValue:latestResults:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v12, v18, v19, v20, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v13);
  v14 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

id __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
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
  void *v28;
  _QWORD v30[4];
  id v31;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = *(void **)(a1 + 32);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_4;
  v30[3] = &unk_1E6F5A9A0;
  v6 = v3;
  v31 = v6;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v7, "count"))
      NSLog(CFSTR("unable to find namespace index w/ multiple switch service?  Defaulting to zero."));
    v9 = 0;
  }
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *MEMORY[0x1E0CB8928];
    objc_msgSend(v10, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseForCharacteristicType:inService:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueWithExpectedClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 || (objc_msgSend(*(id *)(a1 + 40), "value"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v14, "integerValue");
      if ((HMCharacteristicValueLabelNamespaceValidate() & 1) != 0)
        goto LABEL_12;
    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0D31A28]);
  v15 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)v15;
LABEL_12:
  v16 = *MEMORY[0x1E0CB8920];
  objc_msgSend(*(id *)(a1 + 48), "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseForCharacteristicType:inService:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueWithExpectedClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(*(id *)(a1 + 48), "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 56), "service");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "hf_fallbackProgrammableSwitchIndex"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v22, CFSTR("sectionIndex"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", v14, CFSTR("sectionNamespace"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v19, CFSTR("sectionElementIndex"));
  objc_msgSend(*(id *)(a1 + 56), "hf_eventTriggersForTriggerValue:", *(_QWORD *)(a1 + 64));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v23, CFSTR("associateadTriggersKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("itemIsEditable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 73));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, *MEMORY[0x1E0D30E88]);

  v26 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "futureWithResult:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

uint64_t __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0CB8928];
  objc_msgSend(*(id *)(a1 + 32), "responseForCharacteristicType:inService:", *MEMORY[0x1E0CB8928], v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithExpectedClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "responseForCharacteristicType:inService:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v9, "compare:", v11);
  if (!v12)
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "compare:", v16);

  }
  return v12;
}

id __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addResultsFromOutcome:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9++), (_QWORD)v23);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_opt_class();
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_buildOutTriggerEditorOptionsForCharacteristic:triggerValue:latestResults:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addResultsFromDictionary:", v14);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_safeAddObject:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v15, "na_safeAddObject:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v15, "na_safeAddObject:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "characteristics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v17);

  objc_msgSend(v15, "addObjectsFromArray:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30B80]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D30B78]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D50]);
  v19 = (void *)MEMORY[0x1E0D519C0];
  v20 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v19, "futureWithResult:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_shortformTitleForLatestResults:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D30D18]);
}

+ (id)_longformTitleForCharacteristic:(id)a3 latestResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_shortformTitleForLatestResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_numberOfProgrammableSwitches");

  if (v11 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseStringWithLocale:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_sectionTitleForCharacteristic:latestResults:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUProgrammableSwitchEventOptionLongFormTitleFormatString"), CFSTR("%@%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lowercaseStringWithLocale:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)_sectionTitleForCharacteristic:(id)a3 latestResults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(a3, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_numberOfProgrammableSwitches");

  if (v8 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsItemManagerProgrammableSwitchDefaultSectionTitle"), CFSTR("HUServiceDetailsItemManagerProgrammableSwitchDefaultSectionTitle"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("sectionElementIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("sectionNamespace"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unsignedIntegerValue");
    objc_msgSend(v10, "unsignedIntegerValue");
    HFProgrammableSwitchLocalizableStringForAccessoryNamingSystemAndIndex();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)_triggerBuilderContextAwareTitleForCharacteristic:(id)a3 latestResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_shortformTitleForLatestResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_numberOfProgrammableSwitches");

  if (v11 == 1)
  {
    objc_msgSend(v8, "localizedCapitalizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_sectionTitleForCharacteristic:latestResults:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUProgrammableSwitchEventOptionLongFormTitleFormatString"), CFSTR("%@%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedCapitalizedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)_buildOutTriggerEditorOptionsForCharacteristic:(id)a3 triggerValue:(id)a4 latestResults:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  __CFString *v23;
  void *v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a1, "_sectionTitleForCharacteristic:latestResults:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "na_safeSetObject:forKey:", v11, CFSTR("sectionTitleKey"));
  objc_msgSend(v8, "hf_eventTriggersForTriggerValue:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v8, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v14, "removeObject:", v15);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setShowTriggerSummary:", 0);
  objc_msgSend(v16, "setShowActionSetsInstructions:", 0);
  objc_msgSend(v16, "setShowConditionTriggers:", 0);
  objc_msgSend(v16, "setShowTriggerEnableSwitch:", 0);
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryTestProgrammableButtonActionButtonTitle"), CFSTR("HUTriggerSummaryTestProgrammableButtonActionButtonTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTestActionsInstructionDescription:", v17);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryAddProgrammableButtonActionButtonTitle"), CFSTR("HUTriggerSummaryAddProgrammableButtonActionButtonTitle"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setServiceActionsInstructionDescription:", v18);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryDeleteProgrammableButtonActionTitle"), CFSTR("HUTriggerSummaryDeleteProgrammableButtonActionTitle"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDeleteInstructionDescription:", v19);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorInstructionsDescriptionStringForProgrammableSwitch"), CFSTR("HUTriggerActionEditorInstructionsDescriptionStringForProgrammableSwitch"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActionEditorInstructionsDescription:", v20);

  objc_msgSend(a1, "_triggerBuilderContextAwareTitleForCharacteristic:latestResults:", v8, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setTriggerContextAwareTitle:", v21);
  objc_msgSend(v16, "setUnsupportedTriggers:", v14);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryConfirmationAlertTitleMac"), CFSTR("HUTriggerSummaryConfirmationAlertTitleMac"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeleteConfirmationAlertTitle:", v22);

  }
  if (objc_msgSend(v14, "count"))
  {
    v23 = CFSTR("HUTriggerSummaryConfirmationOfDeletingMultipleTriggers");
LABEL_9:
    _HULocalizedStringWithDefaultValue(v23, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeleteConfirmationAlertMessage:", v24);

    goto LABEL_10;
  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    v23 = CFSTR("HUTriggerSummaryConfirmationAlertMessageMac");
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v12, "na_safeSetObject:forKey:", v16, CFSTR("triggerBuilderContext"));

  return v12;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
}

@end
