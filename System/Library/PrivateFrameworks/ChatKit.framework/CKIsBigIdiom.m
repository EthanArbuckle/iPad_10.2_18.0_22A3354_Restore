@implementation CKIsBigIdiom

void __CKIsBigIdiom_block_invoke()
{
  void *v0;
  double v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "_referenceBounds");
    CKIsBigIdiom_sBig = v1 >= 1366.0;

  }
  else
  {
    CKIsBigIdiom_sBig = 0;
  }

}

@end
