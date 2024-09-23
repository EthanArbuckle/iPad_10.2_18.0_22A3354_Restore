@implementation CKVRegisterPostOSInstallMigrationActivity

void __CKVRegisterPostOSInstallMigrationActivity_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v3 = a3;
  +[CKVDispatcher sharedInstance](CKVDispatcher, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runMigration:", v3);

}

@end
