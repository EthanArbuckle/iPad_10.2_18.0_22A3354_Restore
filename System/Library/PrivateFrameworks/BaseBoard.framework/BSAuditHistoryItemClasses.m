@implementation BSAuditHistoryItemClasses

void __BSAuditHistoryItemClasses_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)_MergedGlobals_33;
  _MergedGlobals_33 = v2;

}

@end
