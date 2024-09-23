@implementation HKVerifiableHealthRecordsParser

- (id)parseDataSource:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  HDHRSignedClinicalDataHandler *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  NSObject *v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id v36;

  v7 = a3;
  v8 = objc_alloc_init(HDHRSignedClinicalDataHandler);
  v36 = 0;
  -[HDHRSignedClinicalDataHandler preprocessDataInSource:options:error:](v8, "preprocessDataInSource:options:error:", v7, 5, &v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v36;
  v11 = v10;
  if (v9)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__2;
    v34 = __Block_byref_object_dispose__2;
    v35 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__2;
    v28[4] = __Block_byref_object_dispose__2;
    v29 = 0;
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __65__HKVerifiableHealthRecordsParser_parseDataSource_options_error___block_invoke;
    v24 = &unk_24ECF5750;
    v26 = &v30;
    v27 = v28;
    v13 = v12;
    v25 = v13;
    -[HDHRSignedClinicalDataHandler processContextCollection:completion:](v8, "processContextCollection:completion:", v9, &v21);
    dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    v14 = (void *)v31[5];
    if (v14)
    {
      objc_msgSend(v14, "items", v21, v22, v23, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hk_map:", &__block_literal_global_2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE48A98]), "initWithOptions:localizedTypeDisplayNames:", a4, v16);
    }
    else
    {
      objc_msgSend(v11, "mappedError", v21, v22, v23, v24);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      if (v19)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v19);
        else
          _HKLogDroppedError();
      }

      v17 = 0;
    }

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    objc_msgSend(v10, "mappedError");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

void __65__HKVerifiableHealthRecordsParser_parseDataSource_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id __65__HKVerifiableHealthRecordsParser_parseDataSource_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mainRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordTypeDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
