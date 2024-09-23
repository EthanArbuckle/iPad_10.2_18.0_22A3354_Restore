@implementation HKLineEnumerator

- (HKLineEnumerator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (BOOL)enumerateUTF8LinesWithError:(id *)a3 dataProvider:(id)a4 lineHandler:(id)a5
{
  void (**v6)(id, id *);
  id v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;

  v34 = a3;
  v6 = (void (**)(id, id *))a4;
  v35 = a5;
  v36 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v8 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 1;
  v54 = 0;
  v55 = (id *)&v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__9;
  v58 = __Block_byref_object_dispose__9;
  v59 = 0;
  do
  {
    if (v61[3] != 1)
    {
      v11 = v8;
      goto LABEL_38;
    }
    v9 = (void *)MEMORY[0x19AEC7968]();
    v10 = v55;
    v53 = v55[5];
    v6[2](v6, &v53);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10 + 5, v53);

    if (v11 && objc_msgSend(v11, "length"))
    {
      if (objc_msgSend(v7, "length"))
        objc_msgSend(v7, "appendData:", v11);
      if (objc_msgSend(v7, "length", v34))
        v12 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
      else
        v12 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
      v14 = v12;
      if (objc_msgSend(v7, "length"))
        v15 = objc_msgSend(v7, "length");
      else
        v15 = objc_msgSend(v11, "length");
      v16 = v15;
      v17 = -1;
      v18 = v15;
      do
      {
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v14, v18, 4);
        v20 = (void *)v19;
        v21 = ++v17;
        --v18;
        if (v19)
          v22 = 1;
        else
          v22 = v21 >= 3;
      }
      while (!v22);
      if (v19)
      {
        if (v17)
          objc_msgSend(v7, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(v7, "length"), v14 + v16 - v17, v17);
        else
          objc_msgSend(v7, "setLength:", 0);
        objc_msgSend(v36, "appendString:", v20);
        v47 = 0;
        v48 = &v47;
        v49 = 0x3010000000;
        v50 = &unk_19A47752F;
        v51 = 0;
        v52 = 0;
        v25 = objc_msgSend(v36, "length");
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __73__HKLineEnumerator_enumerateUTF8LinesWithError_dataProvider_lineHandler___block_invoke;
        v41[3] = &unk_1E37EB088;
        v26 = v36;
        v42 = v26;
        v44 = &v60;
        v43 = v35;
        v45 = &v54;
        v46 = &v47;
        objc_msgSend(v26, "enumerateSubstringsInRange:options:usingBlock:", 0, v25, 0, v41);
        if (v61[3] == 1)
        {
          if (v48[5])
            objc_msgSend(v26, "deleteCharactersInRange:", v48[4]);
          v13 = 0;
        }
        else
        {
          v13 = 3;
        }

        _Block_object_dispose(&v47, 8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Unable to create valid utf-8 string from data"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v55[5];
        v55[5] = (id)v23;

        v61[3] = 0;
        v13 = 3;
      }

    }
    else
    {
      v61[3] = v11 != 0;
      v13 = 3;
    }
    objc_autoreleasePoolPop(v9);
    v8 = v11;
  }
  while (!v13);
  if (v61[3] == 1)
  {
    v27 = objc_msgSend(v36, "length");
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __73__HKLineEnumerator_enumerateUTF8LinesWithError_dataProvider_lineHandler___block_invoke_2;
    v37[3] = &unk_1E37EB0B0;
    v39 = &v60;
    v38 = v35;
    v40 = &v54;
    objc_msgSend(v36, "enumerateSubstringsInRange:options:usingBlock:", 0, v27, 0, v37);
    v28 = v55[5];
    v29 = v28;
    if (v28)
    {
      if (v34)
        *v34 = objc_retainAutorelease(v28);
      else
        _HKLogDroppedError(v28);
    }

    v32 = v61[3];
    goto LABEL_45;
  }
LABEL_38:
  v30 = v55[5];
  v31 = v30;
  if (v30)
  {
    if (v34)
      *v34 = objc_retainAutorelease(v30);
    else
      _HKLogDroppedError(v30);
  }

  v32 = v61[3];
LABEL_45:

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return v32 != 0;
}

void __73__HKLineEnumerator_enumerateUTF8LinesWithError_dataProvider_lineHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, NSUInteger a5, NSUInteger a6, BOOL *a7)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  NSRange v16;

  v11 = a2;
  if (a5 + a6 >= objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    *a7 = 1;
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v13 + 40);
    v14 = (*(uint64_t (**)(void))(v12 + 16))();
    objc_storeStrong((id *)(v13 + 40), obj);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v14;
    *a7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 1;
    v16.location = a5;
    v16.length = a6;
    *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = NSUnionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 32), v16);
  }

}

void __73__HKLineEnumerator_enumerateUTF8LinesWithError_dataProvider_lineHandler___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id obj;

  v9 = a1[4];
  v10 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v10 + 40);
  v11 = (*(uint64_t (**)(void))(v9 + 16))();
  objc_storeStrong((id *)(v10 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v11;
  *a7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 1;
}

@end
