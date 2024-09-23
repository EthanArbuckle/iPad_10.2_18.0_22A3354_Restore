@implementation GKCurrentTimestamp

uint64_t __GKCurrentTimestamp_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)GKCurrentTimestamp_sFormatter;
  GKCurrentTimestamp_sFormatter = (uint64_t)v0;

  return objc_msgSend((id)GKCurrentTimestamp_sFormatter, "setDateFormat:", CFSTR("MM/dd/yyyy HH:mm:ss.SSS"));
}

@end
