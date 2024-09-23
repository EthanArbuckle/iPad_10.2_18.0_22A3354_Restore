@implementation ClearExpireForKey

uint64_t __ClearExpireForKey_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v3 = (void *)a1[4];
  v2 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "bindTextParameter:toValue:inStatement:error:", "@key_path", v2, a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

@end
