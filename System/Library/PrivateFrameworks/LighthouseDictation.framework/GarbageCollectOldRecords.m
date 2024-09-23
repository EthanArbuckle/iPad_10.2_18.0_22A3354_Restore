@implementation GarbageCollectOldRecords

uint64_t __GarbageCollectOldRecords_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("json")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("desdata"));

  return v3;
}

uint64_t __GarbageCollectOldRecords_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
