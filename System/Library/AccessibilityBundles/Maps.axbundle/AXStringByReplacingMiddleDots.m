@implementation AXStringByReplacingMiddleDots

void __AXStringByReplacingMiddleDots_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("·"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXStringByReplacingMiddleDots_MiddleDotCharacterSet;
  AXStringByReplacingMiddleDots_MiddleDotCharacterSet = v0;

}

id __AXStringByReplacingMiddleDots_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD14A8];
  v3 = a2;
  objc_msgSend(v2, "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {

    v5 = 0;
  }
  return v5;
}

@end
