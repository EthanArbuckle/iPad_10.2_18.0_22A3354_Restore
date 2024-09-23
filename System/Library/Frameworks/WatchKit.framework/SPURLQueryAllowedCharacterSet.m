@implementation SPURLQueryAllowedCharacterSet

uint64_t __spUtils_SPURLQueryAllowedCharacterSet_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  v1 = (void *)spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet;
  spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet = (uint64_t)v0;

  v2 = (void *)spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  return objc_msgSend((id)spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet, "removeCharactersInString:", CFSTR("="));
}

@end
