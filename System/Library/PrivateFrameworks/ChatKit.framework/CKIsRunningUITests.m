@implementation CKIsRunningUITests

void __CKIsRunningUITests_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("CKUITestEnvironment"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CKIsRunningUITests_isRunningUITests = objc_msgSend(v1, "BOOLValue");

}

@end
