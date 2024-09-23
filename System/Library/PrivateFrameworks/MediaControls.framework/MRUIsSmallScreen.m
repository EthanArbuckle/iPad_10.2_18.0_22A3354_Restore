@implementation MRUIsSmallScreen

void __MRUIsSmallScreen_block_invoke()
{
  BOOL v0;
  id v1;
  CGRect v2;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceIdiom"))
  {
    v0 = 0;
  }
  else
  {
    CCUIReferenceScreenBounds();
    v0 = CGRectGetHeight(v2) <= 736.0;
  }
  MRUIsSmallScreen___isSmallScreen = v0;

}

@end
