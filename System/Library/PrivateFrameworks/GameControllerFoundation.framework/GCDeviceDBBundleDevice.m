@implementation GCDeviceDBBundleDevice

void __59___GCDeviceDBBundleDevice_initWithBundle_dictionary_error___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
{
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id obj;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = objc_opt_class();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    v28 = 0;
    GCHIDDeviceAttributesPredicateFromMatchingDictionary(v11, &v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v28;
    v14 = v13;
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
    }
    else
    {
      v31[0] = *MEMORY[0x1E0CB2D68];
      v31[1] = 0x1EA4D51E8;
      v32[0] = v13;
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v22;
      +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v30, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v23;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      *a4 = 1;
    }

  }
  else
  {
    v34[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedFailureReason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = 0x1EA4D51E8;
    v35[0] = v15;
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v16;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v17;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    *a4 = 1;
  }

}

void __59___GCDeviceDBBundleDevice_initWithBundle_dictionary_error___block_invoke_2(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
{
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = objc_opt_class();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  }
  else
  {
    v21[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedFailureReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = 0x1EA4D51E8;
    v22[0] = v12;
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    *a4 = 1;
  }

}

@end
