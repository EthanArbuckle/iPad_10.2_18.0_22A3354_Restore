@implementation KMMapper

void __63__KMMapper_INVocabularyItem__fieldTypeNumberForIntentSlotName___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  _QWORD v21[19];
  _QWORD v22[21];

  v22[19] = *MEMORY[0x24BDAC8D0];
  v21[0] = *MEMORY[0x24BDD9A80];
  KVFieldTypeToNumber();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = *MEMORY[0x24BDD9A78];
  KVFieldTypeToNumber();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = *MEMORY[0x24BDD9AC8];
  KVFieldTypeToNumber();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = *MEMORY[0x24BDD9AB8];
  KVFieldTypeToNumber();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = *MEMORY[0x24BDD9A50];
  KVFieldTypeToNumber();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = *MEMORY[0x24BDD9A70];
  KVFieldTypeToNumber();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = *MEMORY[0x24BDD9A68];
  KVFieldTypeToNumber();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = *MEMORY[0x24BDD9AB0];
  KVFieldTypeToNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  v21[8] = *MEMORY[0x24BDD9AA8];
  KVFieldTypeToNumber();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v12;
  v21[9] = *MEMORY[0x24BDD9AA0];
  KVFieldTypeToNumber();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v0;
  v21[10] = *MEMORY[0x24BDD9A98];
  KVFieldTypeToNumber();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v1;
  v21[11] = *MEMORY[0x24BDD9AD0];
  KVFieldTypeToNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v2;
  v21[12] = *MEMORY[0x24BDD9A90];
  KVFieldTypeToNumber();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v3;
  v21[13] = *MEMORY[0x24BDD9A60];
  KVFieldTypeToNumber();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v4;
  v21[14] = *MEMORY[0x24BDD9A58];
  KVFieldTypeToNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v5;
  v21[15] = *MEMORY[0x24BDD9AD8];
  KVFieldTypeToNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v6;
  v21[16] = *MEMORY[0x24BDD9AE0];
  KVFieldTypeToNumber();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[16] = v7;
  v21[17] = *MEMORY[0x24BDD9AC0];
  KVFieldTypeToNumber();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[17] = v8;
  v21[18] = *MEMORY[0x24BDD9A88];
  KVFieldTypeToNumber();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[18] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 19);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_fieldTypeNumberForIntentSlotName__intentSlotToFieldTypeMap;
  _fieldTypeNumberForIntentSlotName__intentSlotToFieldTypeMap = v10;

}

void __73__KMMapper_LSApplicationRecord_addAlternativeNamesFor_forLanguage_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id obj;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("INAlternativeAppName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "length"))
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v8 = objc_alloc(MEMORY[0x24BDD1488]);
        objc_msgSend(*(id *)(a1 + 32), "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "initWithURL:", v9);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

      }
      objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:table:bundle:languageCode:", v7, CFSTR("InfoPlist"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v14, "length"))
      {
        v15 = v7;

        v14 = v15;
      }
      v16 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v17 + 40);
      objc_msgSend(v16, "addFieldWithType:value:error:", 104, v14, &obj);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v17 + 40), obj);

      if (!v18)
        *a4 = 1;

    }
  }

}

@end
