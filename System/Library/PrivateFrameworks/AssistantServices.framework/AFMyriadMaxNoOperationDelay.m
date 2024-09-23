@implementation AFMyriadMaxNoOperationDelay

void __AFMyriadMaxNoOperationDelay_block_invoke()
{
  uint64_t v0;
  id v1;

  AFMyriadMaxNoOperationDelay_noopDelay = 0x3F747AE147AE147BLL;
  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "myriadMaxNoOperationDelay");
  AFMyriadMaxNoOperationDelay_noopDelay = v0;

}

@end
