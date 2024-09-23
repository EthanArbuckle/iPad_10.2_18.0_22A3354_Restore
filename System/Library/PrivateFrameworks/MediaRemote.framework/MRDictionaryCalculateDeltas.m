@implementation MRDictionaryCalculateDeltas

void __MRDictionaryCalculateDeltas_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v7);

}

void __MRDictionaryCalculateDeltas_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25[2];

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = 0;
        v25[0] = 0;
        v23 = 0;
        MRDictionaryCalculateDeltas(v6, v8, v25, &v24, &v23);
        v9 = v25[0];
        v10 = v24;
        v11 = v23;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count") + objc_msgSend(v9, "count") + objc_msgSend(v11, "count"));
        v13 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __MRDictionaryCalculateDeltas_block_invoke_2;
        v21[3] = &unk_1E30CA498;
        v14 = v12;
        v22 = v14;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v21);
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __MRDictionaryCalculateDeltas_block_invoke_3;
        v19[3] = &unk_1E30CA498;
        v15 = v14;
        v20 = v15;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v19);
        v17[0] = v13;
        v17[1] = 3221225472;
        v17[2] = __MRDictionaryCalculateDeltas_block_invoke_4;
        v17[3] = &unk_1E30CA498;
        v18 = v15;
        v16 = v15;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v16, v5);

      }
      else
      {
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0B8]), "initWithFirst:second:", v6, v8);
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v9, v5);
      }

    }
  }
  else
  {
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v6, v5);
  }

}

void __MRDictionaryCalculateDeltas_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0D4D0B8];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithFirst:second:", v10, v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

void __MRDictionaryCalculateDeltas_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0D4D0B8];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithFirst:second:", v6, v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

uint64_t __MRDictionaryCalculateDeltas_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

@end
