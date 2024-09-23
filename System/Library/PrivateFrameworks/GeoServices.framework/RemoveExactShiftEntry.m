@implementation RemoveExactShiftEntry

uint64_t __RemoveExactShiftEntry_block_invoke(double *a1, uint64_t a2)
{
  double v4;
  void *v5;
  uint64_t v6;
  int v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  id obj;

  v4 = a1[6];
  v5 = (void *)*((_QWORD *)a1 + 4);
  v6 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "bindRealParameter:toValue:inStatement:error:", "@lat", a2, &obj, v4);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = a1[7];
  v9 = (void *)*((_QWORD *)a1 + 4);
  v10 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
  v13 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "bindRealParameter:toValue:inStatement:error:", "@lng", a2, &v13, v8);
  objc_storeStrong((id *)(v10 + 40), v13);
  return v11;
}

@end
