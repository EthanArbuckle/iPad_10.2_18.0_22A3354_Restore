@implementation FCCKPrivateDatabaseVersionMapping

+ (FCCKPrivateDatabaseVersionMapping)mappingWithBaseValues:(id)a3 V2Changes:(id)a4 V3Changes:(id)a5 V4Changes:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  FCCKPrivateDatabaseVersionMapping *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[FCCKPrivateDatabaseVersionMapping initWithBaseValues:V2Changes:V3Changes:V4Changes:]([FCCKPrivateDatabaseVersionMapping alloc], "initWithBaseValues:V2Changes:V3Changes:V4Changes:", v12, v11, v10, v9);

  return v13;
}

- (FCCKPrivateDatabaseVersionMapping)initWithBaseValues:(id)a3 V2Changes:(id)a4 V3Changes:(id)a5 V4Changes:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCCKPrivateDatabaseVersionMapping *v15;
  FCCKPrivateDatabaseVersionMapping *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  NSDictionary *forwardMapToV2;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  NSDictionary *forwardMapToV3;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  NSDictionary *forwardMapToV4;
  void *v38;
  void *v39;
  uint64_t v40;
  NSDictionary *reverseMap;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD aBlock[4];
  id v64;
  objc_super v65;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v65.receiver = self;
  v65.super_class = (Class)FCCKPrivateDatabaseVersionMapping;
  v15 = -[FCCKPrivateDatabaseVersionMapping init](&v65, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_baseValues, a3);
    objc_storeStrong((id *)&v16->_V2Changes, a4);
    objc_storeStrong((id *)&v16->_V3Changes, a5);
    objc_storeStrong((id *)&v16->_V4Changes, a6);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke;
    aBlock[3] = &unk_1E46430E0;
    v64 = v17;
    v44 = v17;
    v43 = _Block_copy(aBlock);
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v43);
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v43);
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v43);
    v19 = (void *)MEMORY[0x1E0C99E08];
    v60[0] = v18;
    v60[1] = 3221225472;
    v60[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_6;
    v60[3] = &unk_1E463B8D0;
    v20 = v11;
    v61 = v20;
    v21 = v12;
    v62 = v21;
    objc_msgSend(v19, "fc_dictionary:", v60);
    v22 = objc_claimAutoreleasedReturnValue();
    forwardMapToV2 = v16->_forwardMapToV2;
    v16->_forwardMapToV2 = (NSDictionary *)v22;

    v24 = (void *)MEMORY[0x1E0C99E08];
    v56[0] = v18;
    v56[1] = 3221225472;
    v56[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_3;
    v56[3] = &unk_1E4640090;
    v25 = v20;
    v57 = v25;
    v26 = v21;
    v58 = v26;
    v27 = v13;
    v59 = v27;
    objc_msgSend(v24, "fc_dictionary:", v56);
    v28 = objc_claimAutoreleasedReturnValue();
    forwardMapToV3 = v16->_forwardMapToV3;
    v16->_forwardMapToV3 = (NSDictionary *)v28;

    v45 = v12;
    v30 = v11;
    v31 = (void *)MEMORY[0x1E0C99E08];
    v51[0] = v18;
    v51[1] = 3221225472;
    v51[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_5;
    v51[3] = &unk_1E463AAA0;
    v32 = v25;
    v52 = v32;
    v33 = v26;
    v53 = v33;
    v34 = v27;
    v54 = v34;
    v35 = v14;
    v55 = v35;
    objc_msgSend(v31, "fc_dictionary:", v51);
    v36 = objc_claimAutoreleasedReturnValue();
    forwardMapToV4 = v16->_forwardMapToV4;
    v16->_forwardMapToV4 = (NSDictionary *)v36;

    v38 = (void *)MEMORY[0x1E0C99E08];
    v46[0] = v18;
    v46[1] = 3221225472;
    v46[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_7;
    v46[3] = &unk_1E463AAA0;
    v47 = v35;
    v48 = v34;
    v49 = v33;
    v50 = v32;
    v39 = v38;
    v11 = v30;
    v12 = v45;
    objc_msgSend(v39, "fc_dictionary:", v46);
    v40 = objc_claimAutoreleasedReturnValue();
    reverseMap = v16->_reverseMap;
    v16->_reverseMap = (NSDictionary *)v40;

  }
  return v16;
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("versioned changes should be keyed by base value"));
    v3 = 136315906;
    v4 = "-[FCCKPrivateDatabaseVersionMapping initWithBaseValues:V2Changes:V3Changes:V4Changes:]_block_invoke";
    v5 = 2080;
    v6 = "FCCKPrivateDatabaseVersionMapping.m";
    v7 = 1024;
    v8 = 55;
    v9 = 2114;
    v10 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);

  }
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_2;
  v6[3] = &unk_1E463D0B8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));

}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a2);
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_4;
  v6[3] = &unk_1E463D0B8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(v5, "addEntriesFromDictionary:", a1[5]);
  objc_msgSend(v5, "addEntriesFromDictionary:", a1[6]);

}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a2);
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_6;
  v6[3] = &unk_1E463D0B8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(v5, "addEntriesFromDictionary:", a1[5]);
  objc_msgSend(v5, "addEntriesFromDictionary:", a1[6]);
  objc_msgSend(v5, "addEntriesFromDictionary:", a1[7]);

}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a2);
}

void __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_7(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_8;
  v19[3] = &unk_1E46430E0;
  v6 = v3;
  v20 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v19);
  v7 = (void *)a1[5];
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_9;
  v17[3] = &unk_1E46430E0;
  v8 = v6;
  v18 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v17);
  v9 = (void *)a1[6];
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_10;
  v15[3] = &unk_1E46430E0;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
  v11 = (void *)a1[7];
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_11;
  v13[3] = &unk_1E463D0B8;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

uint64_t __86__FCCKPrivateDatabaseVersionMapping_initWithBaseValues_V2Changes_V3Changes_V4Changes___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a2);
}

- (id)mapValue:(id)a3 toVersion:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[FCCKPrivateDatabaseVersionMapping reverseMap](self, "reverseMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    v10 = v9;
    switch(a4)
    {
      case 0:
        self = (FCCKPrivateDatabaseVersionMapping *)v9;
        break;
      case 1:
        -[FCCKPrivateDatabaseVersionMapping forwardMapToV2](self, "forwardMapToV2");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 2:
        -[FCCKPrivateDatabaseVersionMapping forwardMapToV3](self, "forwardMapToV3");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 3:
        -[FCCKPrivateDatabaseVersionMapping forwardMapToV4](self, "forwardMapToV4");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        v12 = v11;
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = (void *)v13;
        else
          v15 = v6;
        self = v15;

        break;
      default:
        break;
    }

  }
  else
  {
    self = (FCCKPrivateDatabaseVersionMapping *)v6;
  }

  return self;
}

- (id)allValuesForVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[FCCKPrivateDatabaseVersionMapping baseValues](self, "baseValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__FCCKPrivateDatabaseVersionMapping_allValuesForVersion___block_invoke;
  v8[3] = &unk_1E46442B0;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __57__FCCKPrivateDatabaseVersionMapping_allValuesForVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mapValue:toVersion:", a2, *(_QWORD *)(a1 + 40));
}

- (id)allValuesModifiedFromVersion:(int64_t)a3 toVersion:(int64_t)a4
{
  void *v7;
  void *v8;
  _QWORD v10[7];

  -[FCCKPrivateDatabaseVersionMapping baseValues](self, "baseValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__FCCKPrivateDatabaseVersionMapping_allValuesModifiedFromVersion_toVersion___block_invoke;
  v10[3] = &unk_1E46484F0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  objc_msgSend(v7, "fc_setByTransformingWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __76__FCCKPrivateDatabaseVersionMapping_allValuesModifiedFromVersion_toVersion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "mapValue:toVersion:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mapValue:toVersion:", v5, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    v8 = 0;
  else
    v8 = v6;

  return v8;
}

- (BOOL)containsValuePassingTest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[FCCKPrivateDatabaseVersionMapping baseValues](self, "baseValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fc_containsObjectPassingTest:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[FCCKPrivateDatabaseVersionMapping V2Changes](self, "V2Changes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "fc_containsObjectPassingTest:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[FCCKPrivateDatabaseVersionMapping V3Changes](self, "V3Changes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "fc_containsObjectPassingTest:", v4) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        -[FCCKPrivateDatabaseVersionMapping V4Changes](self, "V4Changes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v12, "fc_containsObjectPassingTest:", v4);

      }
    }

  }
  return v6;
}

- (id)mappingByTransformingValuesWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  FCCKPrivateDatabaseVersionMapping *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v4 = a3;
  -[FCCKPrivateDatabaseVersionMapping baseValues](self, "baseValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_setByTransformingWithBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)MEMORY[0x1E0C99D80];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke;
  v28[3] = &unk_1E46432D0;
  v28[4] = self;
  v9 = v4;
  v29 = v9;
  objc_msgSend(v8, "fc_dictionary:", v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99D80];
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_3;
  v26[3] = &unk_1E46432D0;
  v26[4] = self;
  v12 = v9;
  v27 = v12;
  objc_msgSend(v11, "fc_dictionary:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99D80];
  v20 = v7;
  v21 = 3221225472;
  v22 = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_5;
  v23 = &unk_1E46432D0;
  v24 = self;
  v25 = v12;
  v15 = v12;
  objc_msgSend(v14, "fc_dictionary:", &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects", v20, v21, v22, v23, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:V2Changes:V3Changes:V4Changes:](FCCKPrivateDatabaseVersionMapping, "mappingWithBaseValues:V2Changes:V3Changes:V4Changes:", v17, v10, v13, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "V2Changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_2;
  v6[3] = &unk_1E4648030;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "V3Changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_4;
  v6[3] = &unk_1E4648030;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "V4Changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_6;
  v6[3] = &unk_1E4648030;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __74__FCCKPrivateDatabaseVersionMapping_mappingByTransformingValuesWithBlock___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
}

- (NSArray)baseValues
{
  return self->_baseValues;
}

- (NSDictionary)V2Changes
{
  return self->_V2Changes;
}

- (NSDictionary)V3Changes
{
  return self->_V3Changes;
}

- (NSDictionary)V4Changes
{
  return self->_V4Changes;
}

- (NSDictionary)forwardMapToV2
{
  return self->_forwardMapToV2;
}

- (NSDictionary)forwardMapToV3
{
  return self->_forwardMapToV3;
}

- (NSDictionary)forwardMapToV4
{
  return self->_forwardMapToV4;
}

- (NSDictionary)reverseMap
{
  return self->_reverseMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseMap, 0);
  objc_storeStrong((id *)&self->_forwardMapToV4, 0);
  objc_storeStrong((id *)&self->_forwardMapToV3, 0);
  objc_storeStrong((id *)&self->_forwardMapToV2, 0);
  objc_storeStrong((id *)&self->_V4Changes, 0);
  objc_storeStrong((id *)&self->_V3Changes, 0);
  objc_storeStrong((id *)&self->_V2Changes, 0);
  objc_storeStrong((id *)&self->_baseValues, 0);
}

@end
