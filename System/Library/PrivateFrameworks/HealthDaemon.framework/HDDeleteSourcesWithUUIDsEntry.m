@implementation HDDeleteSourcesWithUUIDsEntry

uint64_t __59___HDDeleteSourcesWithUUIDsEntry_applyEntries_withProfile___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "sourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_deleteSourcesWithUUIDs:localSourceEntityCacheKey:syncIdentity:deleteSamples:transaction:error:", a1[5], a1[6], 0, 1, v6, a3);

  return v8;
}

@end
