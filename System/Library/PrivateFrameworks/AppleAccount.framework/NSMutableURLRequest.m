@implementation NSMutableURLRequest

void __73__NSMutableURLRequest_AppleAccount__aa_addMultiUserDeviceHeaderIfEnabled__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)MKBUserTypeDeviceMode();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isEqualToString:", *MEMORY[0x1E0D4E5A8]))
    aa_addMultiUserDeviceHeaderIfEnabled_isMultiUserDevice = 1;

}

@end
