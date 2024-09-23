@implementation DOCMainScreenSize

void ___DOCMainScreenSize_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  _DOCMainScreenSize__DOCMainScreenSize_0 = v0;
  _DOCMainScreenSize__DOCMainScreenSize_1 = v1;

}

@end
