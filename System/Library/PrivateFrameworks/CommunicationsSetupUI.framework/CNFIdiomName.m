@implementation CNFIdiomName

void __CNFIdiomName_block_invoke()
{
  void *v0;
  uint64_t v1;
  BOOL v2;
  const __CFString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  v2 = v1 == 1 || v1 == 6;
  v3 = CFSTR("_iphone");
  if (v2)
    v3 = CFSTR("_ipad");
  v4 = (void *)CNFIdiomName_sIdiomName;
  CNFIdiomName_sIdiomName = (uint64_t)v3;

}

@end
