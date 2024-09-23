@implementation ACUIIsSharedIPadMode

void __ACUIIsSharedIPadMode_block_invoke(void *a1)
{
  id location;
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = (id)MKBUserTypeDeviceMode();
  location = (id)objc_msgSend(v2[0], "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
  if ((objc_msgSend(location, "isEqualToString:", *MEMORY[0x1E0D4E5B0]) & 1) != 0)
    ACUIIsSharedIPadMode_isSharedIPadMode = 1;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v2, 0);
}

@end
