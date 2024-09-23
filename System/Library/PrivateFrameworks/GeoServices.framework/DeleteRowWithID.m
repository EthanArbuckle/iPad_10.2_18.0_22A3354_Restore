@implementation DeleteRowWithID

uint64_t __DeleteRowWithID_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = a1[6];
  v3 = (void *)a1[4];
  v4 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "bindInt64Parameter:toValue:inStatement:error:", "@rowid", v2, a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

@end
