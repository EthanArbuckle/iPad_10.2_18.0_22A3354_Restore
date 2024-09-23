@implementation DOCFrameworkBundle

void __DOCFrameworkBundle_block_invoke()
{
  Class v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = NSClassFromString(CFSTR("UIDocumentBrowserViewController"));
  if (v0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", v0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)DOCFrameworkBundle_DOCBundle;
    DOCFrameworkBundle_DOCBundle = v1;
  }
  else
  {
    v3 = (void *)DOCFrameworkBundle_DOCBundle;
    DOCFrameworkBundle_DOCBundle = 0;

    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSBundle * _Nonnull DOCFrameworkBundle(void)_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("DOCUtilities.m"), 59, CFSTR("Fatal error: Could not determine NSBundle for DocumentManager framework"));

    v2 = v5;
  }

}

@end
