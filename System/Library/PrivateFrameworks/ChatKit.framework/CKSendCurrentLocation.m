@implementation CKSendCurrentLocation

void __CKSendCurrentLocation_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=LOCATION"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

@end
