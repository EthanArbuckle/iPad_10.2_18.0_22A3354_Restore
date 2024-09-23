@implementation FCPruneHistoryRecordsForUpload

uint64_t __FCPruneHistoryRecordsForUpload_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("lastVisited"));
}

uint64_t __FCPruneHistoryRecordsForUpload_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("offensive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
