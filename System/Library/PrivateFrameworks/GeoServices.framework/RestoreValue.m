@implementation RestoreValue

uint64_t __RestoreValue_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id obj;
  id v52;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v52 = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@timestamp", v5, a2, &v52);
  objc_storeStrong((id *)(v6 + 40), v52);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(unsigned int *)(a1 + 104);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindIntParameter:toValue:inStatement:error:", "@type", v9, a2, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v50 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindTextParameter:toValue:inStatement:error:", "@appid", v13, a2, &v50);
  objc_storeStrong((id *)(v14 + 40), v50);
  if (!v15)
    return 0;
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v49 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v16, "bindTextParameter:toValue:inStatement:error:", "@identifier", v17, a2, &v49);
  objc_storeStrong((id *)(v18 + 40), v49);
  if (!v19)
    return 0;
  v20 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 56);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v48 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v20, "bindTextParameter:toValue:inStatement:error:", "@url", v21, a2, &v48);
  objc_storeStrong((id *)(v22 + 40), v48);
  if (!v23)
    return 0;
  v24 = *(void **)(a1 + 32);
  v25 = *(_QWORD *)(a1 + 96);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v47 = *(id *)(v26 + 40);
  v27 = objc_msgSend(v24, "bindInt64Parameter:toValue:inStatement:error:", "@size", v25, a2, &v47);
  objc_storeStrong((id *)(v26 + 40), v47);
  if (!v27)
    return 0;
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    externalFileBaseURL(*(void **)(a1 + 32));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "URLByAppendingPathComponent:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
      goto LABEL_10;
    v32 = *(void **)(a1 + 32);
    v33 = *(_QWORD *)(a1 + 64);
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v46 = *(id *)(v34 + 40);
    v35 = objc_msgSend(v32, "moveExternalResourceAtURL:toURL:error:", v33, v31, &v46);
    objc_storeStrong((id *)(v34 + 40), v46);

    if (!v35)
      goto LABEL_10;
  }
  else
  {
    v29 = 0;
  }
  v37 = *(void **)(a1 + 32);
  v38 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v45 = *(id *)(v38 + 40);
  v39 = objc_msgSend(v37, "bindTextParameter:toValue:inStatement:error:", "@data", v29, a2, &v45);
  objc_storeStrong((id *)(v38 + 40), v45);
  if (v39)
  {
    v40 = *(void **)(a1 + 32);
    v41 = *(_QWORD *)(a1 + 72);
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v44 = *(id *)(v42 + 40);
    v36 = objc_msgSend(v40, "bindTextParameter:toValue:inStatement:error:", "@errorMessage", v41, a2, &v44);
    objc_storeStrong((id *)(v42 + 40), v44);
    goto LABEL_14;
  }
LABEL_10:
  v36 = 0;
LABEL_14:

  return v36;
}

@end
