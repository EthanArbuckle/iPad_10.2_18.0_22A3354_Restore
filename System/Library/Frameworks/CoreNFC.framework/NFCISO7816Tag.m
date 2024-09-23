@implementation NFCISO7816Tag

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (NSString)initialSelectedAID
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[NFCTag selectedAID](self, "selectedAID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "NF_asHexString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24D451DF0;
  }

  return (NSString *)v4;
}

- (void)sendCommandAPDU:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_215BBD000, "NFCISO7816Tag sendCommandAPDU:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  os_activity_scope_leave(&v10);

  objc_msgSend(v7, "asData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NFCTag _sendAPDU:completionHandler:](self, "_sendAPDU:completionHandler:", v9, v6);
}

@end
