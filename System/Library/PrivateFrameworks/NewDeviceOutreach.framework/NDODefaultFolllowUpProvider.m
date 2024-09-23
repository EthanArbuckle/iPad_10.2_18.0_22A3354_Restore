@implementation NDODefaultFolllowUpProvider

- (BOOL)postFollowUpItem:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BE1B3A8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithClientIdentifier:", CFSTR("com.apple.NewDeviceOutreach"));
  LOBYTE(a4) = objc_msgSend(v7, "postFollowUpItem:error:", v6, a4);

  return (char)a4;
}

- (BOOL)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BE1B3A8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithClientIdentifier:", CFSTR("com.apple.NewDeviceOutreach"));
  LOBYTE(a4) = objc_msgSend(v7, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v6, a4);

  return (char)a4;
}

- (id)pendingFollowUpItems:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.NewDeviceOutreach"));
  objc_msgSend(v4, "pendingFollowUpItems:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
