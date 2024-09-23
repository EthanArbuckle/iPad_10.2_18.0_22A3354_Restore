@implementation MDCopyDecodedXattrFromData

uint64_t __MDCopyDecodedXattrFromData_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x24BDBCF20]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  MDCopyDecodedXattrFromData_sUserTagsUnarchiveValidClasses = result;
  return result;
}

@end
