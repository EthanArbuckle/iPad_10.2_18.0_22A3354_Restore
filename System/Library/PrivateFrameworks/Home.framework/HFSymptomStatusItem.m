@implementation HFSymptomStatusItem

BOOL __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a2;
  objc_msgSend(v4, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "mediaProfile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[HFMediaHelper isContainedWithinMediaSystem:](HFMediaHelper, "isContainedWithinMediaSystem:", v2);

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1[4], "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "room");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "room");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "isEqual:", a1))
    {
      v6 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  objc_msgSend(v4, "symptomsHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "symptoms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
    v6 = 1;

  if (v7)
    goto LABEL_10;
LABEL_11:

  return !v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HFMutableItemUpdateOutcome *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  HFImageIconDescriptor *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[5];
  _QWORD v50[6];

  v4 = (void *)MEMORY[0x1E0C99E60];
  -[HFStatusItem home](self, "home", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaSystems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke;
  v50[3] = &unk_1EA72CE40;
  v50[4] = self;
  objc_msgSend(v7, "na_filter:", v50);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  -[HFStatusItem home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v8;
  v49[1] = 3221225472;
  v49[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2;
  v49[3] = &unk_1EA727840;
  v49[4] = self;
  objc_msgSend(v13, "na_filter:", v49);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v47[0] = v8;
  v47[1] = 3221225472;
  v47[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2_5;
  v47[3] = &unk_1EA72A2D8;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v48 = v15;
  objc_msgSend(v14, "na_each:", v47);
  v45[0] = v8;
  v45[1] = 3221225472;
  v45[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_3;
  v45[3] = &unk_1EA735E70;
  v16 = v15;
  v46 = v16;
  v40 = v9;
  objc_msgSend(v9, "na_each:", v45);
  objc_msgSend(MEMORY[0x1E0CBA8E8], "hf_symptomArraySortComparator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v8;
  v43[1] = 3221225472;
  v43[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_5;
  v43[3] = &unk_1EA735E98;
  v20 = v17;
  v44 = v20;
  objc_msgSend(v19, "sortedArrayUsingComparator:", v43);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hf_symptomsSortedByPriority");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc_init(HFMutableItemUpdateOutcome);
  v26 = (void *)MEMORY[0x1E0C99E60];
  v27 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v28, CFSTR("dependentHomeKitClasses"));

  v29 = objc_msgSend(v24, "type");
  if (v29 == 12
    || v29 == 15
    || v29 == 1000
    || (objc_msgSend(v24, "hf_shortDescription"), (v30 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  }
  else
  {
    v38 = (void *)v30;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "unionSet:", v14);
    objc_msgSend(v31, "unionSet:", v40);
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v31, CFSTR("representedHomeKitObjects"));
    v41[0] = v8;
    v41[1] = 3221225472;
    v41[2] = __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_6;
    v41[3] = &unk_1EA72E198;
    v39 = v24;
    v42 = v39;
    objc_msgSend(v31, "na_filter:", v41);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v32, CFSTR("statusRepresentedHomeKitObjects"));

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 24.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("exclamationmark.circle.fill"), v37);
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v33, CFSTR("icon"));

    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v38, CFSTR("title"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", &unk_1EA7CC478, CFSTR("statusItemCategory"));
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeySymptoms"), CFSTR("HFStatusSortKeySymptoms"), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v34, CFSTR("sortKey"));

    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", &unk_1EA7CC490, CFSTR("priority"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v39, CFSTR("symptom"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v25);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

uint64_t __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _DWORD v15[2];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_121);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "symptoms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count") != 0;

  }
  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "symptoms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = 67109378;
    v15[1] = v6;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Media system has symptoms handler: %d, with symptoms: %@", (uint8_t *)v15, 0x12u);

  }
  objc_msgSend(*(id *)(a1 + 32), "room");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v3, "hf_parentRoom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "room");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    v6 = v13 & v6;
  }

  return v6;
}

BOOL __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "symptomsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_2_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v7, "mediaProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "symptomsHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
}

void __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_7_7);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v7, "symptomsHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v6);

}

BOOL __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "symptomsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(a2, "hf_symptomsSortedByPriority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_symptomsSortedByPriority");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (*(uint64_t (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

  return v11;
}

uint64_t __51__HFSymptomStatusItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "symptomsHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
  }
  else
  {
    objc_opt_class();
    v8 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (!v10)
    {
      v8 = 0;
      v12 = 0;
      goto LABEL_12;
    }
    v7 = v10;
  }
  objc_msgSend(v7, "symptoms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 32));

LABEL_12:
  return v12;
}

- (HMSymptom)symptom
{
  return self->_symptom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptom, 0);
}

@end
