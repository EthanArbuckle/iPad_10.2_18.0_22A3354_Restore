@implementation SetDevicePosture

uint64_t __SetDevicePosture_block_invoke(_QWORD *a1, uint64_t a2)
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
  uint64_t v15;
  id v17;
  id v18;
  id obj;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindTextParameter:toValue:inStatement:error:", "@locale", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = (void *)a1[4];
  v9 = a1[6];
  v10 = *(_QWORD *)(a1[8] + 8);
  v18 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindTextParameter:toValue:inStatement:error:", "@country", v9, a2, &v18);
  objc_storeStrong((id *)(v10 + 40), v18);
  if (!v11)
    return 0;
  v12 = (void *)a1[4];
  v13 = a1[7];
  v14 = *(_QWORD *)(a1[8] + 8);
  v17 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindTextParameter:toValue:inStatement:error:", "@region", v13, a2, &v17);
  objc_storeStrong((id *)(v14 + 40), v17);
  return v15;
}

@end
