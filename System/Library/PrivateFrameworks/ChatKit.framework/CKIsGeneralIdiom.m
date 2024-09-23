@implementation CKIsGeneralIdiom

void __CKIsGeneralIdiom_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  v0 = _UIUserInterfaceSizeClassForWidth();
  objc_msgSend(v4, "_referenceBounds");
  v1 = _UIUserInterfaceSizeClassForWidth();
  v3 = v0 == 2 || v1 == 2;
  CKIsGeneralIdiom_sGeneralIdiom = v3;

}

@end
