@implementation HMDCoreDataTransformerHAPPairingIdentitySet

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__152589;
  v18 = __Block_byref_object_dispose__152590;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__HMDCoreDataTransformerHAPPairingIdentitySet_OPACKFromValue_error___block_invoke;
  v10[3] = &unk_24E789DA0;
  v12 = &v14;
  v13 = &v20;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);
  if (*((_BYTE *)v21 + 24))
  {
    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v15[5]);
  }
  else
  {
    v8 = (void *)objc_msgSend(v7, "copy");
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
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
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__152589;
    v22 = __Block_byref_object_dispose__152590;
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__HMDCoreDataTransformerHAPPairingIdentitySet_valueFromOPACK_error___block_invoke;
    v14[3] = &unk_24E789DC8;
    v16 = &v18;
    v17 = &v24;
    v9 = v8;
    v15 = v9;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
    if (*((_BYTE *)v25 + 24))
    {
      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease((id)v19[5]);
    }
    else
    {
      v10 = (void *)objc_msgSend(v9, "copy");
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected NSArray value to create NSSet<HAPPairingIdentity>: %@"), v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmfErrorWithCode:reason:", 3, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

void __68__HMDCoreDataTransformerHAPPairingIdentitySet_valueFromOPACK_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  +[HMDCoreDataTransformerHAPPairingIdentity valueFromOPACK:error:](HMDCoreDataTransformerHAPPairingIdentity, "valueFromOPACK:error:", a2, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __68__HMDCoreDataTransformerHAPPairingIdentitySet_OPACKFromValue_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  id obj;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v5 + 40);
  +[HMDCoreDataTransformerHAPPairingIdentity OPACKFromValue:error:](HMDCoreDataTransformerHAPPairingIdentity, "OPACKFromValue:error:", a2, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }

}

@end
