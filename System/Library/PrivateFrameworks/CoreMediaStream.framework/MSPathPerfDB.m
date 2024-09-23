@implementation MSPathPerfDB

void __MSPathPerfDB_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  MSPathPerfDir();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("perf.sqlite"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MSPathPerfDB_path;
  MSPathPerfDB_path = v0;

}

@end
