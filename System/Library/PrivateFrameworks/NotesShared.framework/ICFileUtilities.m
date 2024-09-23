@implementation ICFileUtilities

+ (id)coordinateDeleteItemAt:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3600];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "coordinateDeleteItemAt:coordinator:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)coordinateDeleteItemAt:(id)a3 coordinator:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[6];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__ICFileUtilities_coordinateDeleteItemAt_coordinator___block_invoke;
  v11[3] = &unk_1E76C84E0;
  v11[4] = &v13;
  v11[5] = &v17;
  objc_msgSend(v6, "coordinateWritingItemAtURL:options:error:byAccessor:", v5, 1, &v12, v11);
  v7 = v12;
  v8 = v12;
  if (!*((_BYTE *)v14 + 24))
    objc_storeStrong(v18 + 5, v7);
  v9 = v18[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __54__ICFileUtilities_coordinateDeleteItemAt_coordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "removeItemAtURL:error:", v4, &v8);

  v6 = v8;
  v7 = v8;

  if (v7 && objc_msgSend(v7, "code") != 4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

}

+ (id)coordinateMoveItemAt:(id)a3 to:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0CB3600];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(a1, "coordinateMoveItemAt:to:coordinator:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)coordinateMoveItemAt:(id)a3 to:(id)a4 coordinator:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v26 = 0;
  v27 = (id *)&v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__ICFileUtilities_coordinateMoveItemAt_to_coordinator___block_invoke;
    v17[3] = &unk_1E76C8508;
    v19 = &v22;
    v18 = v10;
    v20 = &v26;
    objc_msgSend(v9, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v7, 2, v8, 8, &v21, v17);
    v13 = v21;
    v14 = v21;
    if (!*((_BYTE *)v23 + 24))
      objc_storeStrong(v27 + 5, v13);
    v15 = v27[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], 4, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v15;
}

void __55__ICFileUtilities_coordinateMoveItemAt_to_coordinator___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v7 = (void *)a1[4];
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v7 & 1) == 0)
  {
    v9 = (void *)a1[4];
    v13 = 0;
    objc_msgSend(v9, "moveItemAtURL:toURL:error:", v5, v6, &v13);
    v10 = v13;
    v11 = v13;
    v12 = v11;
    if (v11 && objc_msgSend(v11, "code") != 4)
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v10);

  }
}

@end
