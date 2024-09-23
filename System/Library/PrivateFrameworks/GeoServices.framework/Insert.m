@implementation Insert

uint64_t __Insert_block_invoke(double *a1, uint64_t a2)
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
  double v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;
  id v23;
  id obj;

  v4 = (void *)*((_QWORD *)a1 + 4);
  v5 = *((_QWORD *)a1 + 8);
  v6 = *(_QWORD *)(*((_QWORD *)a1 + 7) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@hash", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = (void *)*((_QWORD *)a1 + 4);
  v9 = *((_QWORD *)a1 + 5);
  v10 = *(_QWORD *)(*((_QWORD *)a1 + 7) + 8);
  v23 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindBlobParameter:toValue:inStatement:error:", "@key", v9, a2, &v23);
  objc_storeStrong((id *)(v10 + 40), v23);
  if (!v11)
    return 0;
  v12 = (void *)*((_QWORD *)a1 + 4);
  v13 = *((_QWORD *)a1 + 6);
  v14 = *(_QWORD *)(*((_QWORD *)a1 + 7) + 8);
  v22 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindBlobParameter:toValue:inStatement:error:", "@value", v13, a2, &v22);
  objc_storeStrong((id *)(v14 + 40), v22);
  if (!v15)
    return 0;
  v16 = (void *)*((_QWORD *)a1 + 4);
  v17 = a1[9];
  v18 = *(_QWORD *)(*((_QWORD *)a1 + 7) + 8);
  v21 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v16, "bindRealParameter:toValue:inStatement:error:", "@refresh_timestamp", a2, &v21, v17);
  objc_storeStrong((id *)(v18 + 40), v21);
  return v19;
}

@end
