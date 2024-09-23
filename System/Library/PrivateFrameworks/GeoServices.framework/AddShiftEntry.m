@implementation AddShiftEntry

uint64_t __AddShiftEntry_block_invoke(double *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  double v8;
  void *v9;
  uint64_t v10;
  int v11;
  double v12;
  void *v13;
  uint64_t v14;
  int v15;
  double v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id obj;

  v4 = *((_QWORD *)a1 + 6);
  v5 = (void *)*((_QWORD *)a1 + 4);
  v6 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "bindInt64Parameter:toValue:inStatement:error:", "@time", v4, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = a1[7];
  v9 = (void *)*((_QWORD *)a1 + 4);
  v10 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
  v28 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "bindRealParameter:toValue:inStatement:error:", "@lat", a2, &v28, v8);
  objc_storeStrong((id *)(v10 + 40), v28);
  if (!v11)
    return 0;
  v12 = a1[8];
  v13 = (void *)*((_QWORD *)a1 + 4);
  v14 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
  v27 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v13, "bindRealParameter:toValue:inStatement:error:", "@lng", a2, &v27, v12);
  objc_storeStrong((id *)(v14 + 40), v27);
  if (!v15)
    return 0;
  v16 = a1[9];
  v17 = (void *)*((_QWORD *)a1 + 4);
  v18 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
  v26 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v17, "bindRealParameter:toValue:inStatement:error:", "@rad", a2, &v26, v16);
  objc_storeStrong((id *)(v18 + 40), v26);
  if (!v19)
    return 0;
  v20 = *((_QWORD *)a1 + 10);
  v21 = (void *)*((_QWORD *)a1 + 4);
  v22 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
  v25 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v21, "bindInt64Parameter:toValue:inStatement:error:", "@data_pk", v20, a2, &v25);
  objc_storeStrong((id *)(v22 + 40), v25);
  return v23;
}

@end
