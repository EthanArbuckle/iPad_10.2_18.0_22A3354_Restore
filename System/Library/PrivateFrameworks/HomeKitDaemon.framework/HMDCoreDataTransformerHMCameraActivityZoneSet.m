@implementation HMDCoreDataTransformerHMCameraActivityZoneSet

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__50612;
  v21 = __Block_byref_object_dispose__50613;
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __70__HMDCoreDataTransformerHMCameraActivityZoneSet_OPACKFromValue_error___block_invoke;
  v14 = &unk_24E77C8F8;
  v16 = &v17;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);
  v8 = (void *)v18[5];
  if (v8)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v9 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__50612;
    v22 = __Block_byref_object_dispose__50613;
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__HMDCoreDataTransformerHMCameraActivityZoneSet_valueFromOPACK_error___block_invoke;
    v15[3] = &unk_24E77C920;
    v17 = &v18;
    v9 = v8;
    v16 = v9;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
    v10 = (void *)v19[5];
    if (v10)
    {
      v11 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v10);
    }
    else
    {
      v11 = (void *)objc_msgSend(v9, "copy");
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (a4)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected NSArray value to create NSSet<HMCameraActivityZone>: %@"), v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hmfErrorWithCode:reason:", 3, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
  }

  return v11;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

void __70__HMDCoreDataTransformerHMCameraActivityZoneSet_valueFromOPACK_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  +[HMDCoreDataTransformerHMCameraActivityZone valueFromOPACK:error:](HMDCoreDataTransformerHMCameraActivityZone, "valueFromOPACK:error:", v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create HMCameraActivityZone: %@"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmfErrorWithCode:reason:", 15, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    *a4 = 1;
  }

}

void __70__HMDCoreDataTransformerHMCameraActivityZoneSet_OPACKFromValue_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  +[HMDCoreDataTransformerHMCameraActivityZone OPACKFromValue:error:](HMDCoreDataTransformerHMCameraActivityZone, "OPACKFromValue:error:", v5, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to opack HMCameraActivityZone: %@"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmfErrorWithCode:reason:", 15, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a3 = 1;
  }

}

@end
