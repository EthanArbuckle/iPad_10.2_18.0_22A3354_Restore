@implementation CAFilter(CKFilterWithDictionary)

+ (id)ck_filterWithDictionary:()CKFilterWithDictionary
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD aBlock[4];
  id v53;

  v3 = a3;
  objc_msgSend(v3, "_stringForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke;
    aBlock[3] = &unk_1E2755310;
    v7 = v5;
    v53 = v7;
    v8 = _Block_copy(aBlock);
    v50[0] = v6;
    v50[1] = 3221225472;
    v50[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_2;
    v50[3] = &unk_1E2755338;
    v9 = v7;
    v51 = v9;
    v10 = _Block_copy(v50);
    v48[0] = v6;
    v48[1] = 3221225472;
    v48[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_3;
    v48[3] = &unk_1E2755310;
    v11 = v9;
    v49 = v11;
    v12 = _Block_copy(v48);
    v46[0] = v6;
    v46[1] = 3221225472;
    v46[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_4;
    v46[3] = &unk_1E2755310;
    v13 = v11;
    v47 = v13;
    v14 = _Block_copy(v46);
    v44[0] = v6;
    v44[1] = 3221225472;
    v44[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_5;
    v44[3] = &unk_1E2755310;
    v15 = v13;
    v45 = v15;
    v16 = _Block_copy(v44);
    v42[0] = v6;
    v42[1] = 3221225472;
    v42[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_7;
    v42[3] = &unk_1E2755310;
    v17 = v15;
    v43 = v17;
    v18 = _Block_copy(v42);
    v34[0] = v6;
    v34[1] = 3221225472;
    v34[2] = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_8;
    v34[3] = &unk_1E2755380;
    v28 = v8;
    v35 = v28;
    v19 = v12;
    v36 = v19;
    v20 = v14;
    v37 = v20;
    v21 = v16;
    v38 = v21;
    v39 = &__block_literal_global_343_0;
    v22 = v18;
    v40 = v22;
    v23 = v10;
    v41 = v23;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v34);
    v29 = v6;
    v30 = 3221225472;
    v31 = __60__CAFilter_CKFilterWithDictionary__ck_filterWithDictionary___block_invoke_9;
    v32 = &unk_1E27553A8;
    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2780]), "initWithType:", v4);
    v33 = v24;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", &v29);
    objc_msgSend(v3, "_stringForKey:", CFSTR("name"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend(v24, "setName:", v25, v28, v29, v30, v31, v32);
    v26 = v24;

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
