@implementation CacheDeletePurgeSpace

void __CacheDeletePurgeSpace_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "longLongValue"));

}

@end
