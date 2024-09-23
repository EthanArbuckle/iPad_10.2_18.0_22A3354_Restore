@implementation SharedURLSession

void ___SharedURLSession_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", CFSTR("CDPSecureBackupURLSession"));
  objc_msgSend(v3, "set_appleIDContext:", v0);

  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_SharedURLSession_sharedURLSession;
  _SharedURLSession_sharedURLSession = v1;

}

@end
