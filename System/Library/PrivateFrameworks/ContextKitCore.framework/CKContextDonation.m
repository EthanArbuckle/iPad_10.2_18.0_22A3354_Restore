@implementation CKContextDonation

- (CKContextDonation)initWithDonorBundleIdentifier:(id)a3
{
  id v5;
  CKContextDonation *v6;
  NSMutableArray *v7;
  NSMutableArray *items;
  CKContextDonation *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKContextDonation;
  v6 = -[CKContextDonation init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    items = v6->_items;
    v6->_items = v7;

    objc_storeStrong((id *)&v6->_donorBundleIdentifier, a3);
    v9 = v6;
  }

  return v6;
}

- (CKContextDonation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CKContextDonation *v10;
  uint64_t v11;
  CKContextUserActivity *associatedUserActivity;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("donations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_remoteProcesses = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteProcesses"));
  v10 = -[CKContextDonation initWithDonations:donorBundleIdentifier:](self, "initWithDonations:donorBundleIdentifier:", v8, v9);
  if (v10)
  {
    v10->_nonce = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("nonce"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
    v11 = objc_claimAutoreleasedReturnValue();
    associatedUserActivity = v10->_associatedUserActivity;
    v10->_associatedUserActivity = (CKContextUserActivity *)v11;

  }
  return v10;
}

- (CKContextDonation)initWithDonations:(id)a3 donorBundleIdentifier:(id)a4
{
  id v6;
  CKContextDonation *v7;
  CKContextDonation *v8;

  v6 = a3;
  v7 = -[CKContextDonation initWithDonorBundleIdentifier:](self, "initWithDonorBundleIdentifier:", a4);
  v8 = v7;
  if (v7)
    -[NSMutableArray addObjectsFromArray:](v7->_items, "addObjectsFromArray:", v6);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_items;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", self->_items, CFSTR("donations"));
  objc_sync_exit(v4);

  objc_msgSend(v5, "encodeObject:forKey:", self->_donorBundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_remoteProcesses, CFSTR("remoteProcesses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedUserActivity, CFSTR("userActivity"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addItem:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSMutableArray *v6;

  v4 = a3;
  v5 = atomic_load((unsigned __int8 *)&self->_donated);
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CKContextDonation addItem:].cold.1();
  }
  else
  {
    v6 = self->_items;
    objc_sync_enter(v6);
    -[NSMutableArray addObject:](self->_items, "addObject:", v4);
    objc_sync_exit(v6);

  }
}

- (id)description
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->_items;
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Donation with bundle ID: %@, number of items: %i"), self->_donorBundleIdentifier, -[NSMutableArray count](self->_items, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (id)concatenatedRequestsText
{
  return -[CKContextDonation _concatenatedRequestTextUsingDebugText:](self, "_concatenatedRequestTextUsingDebugText:", 0);
}

- (id)concatenatedRequestsDebugText
{
  return -[CKContextDonation _concatenatedRequestTextUsingDebugText:](self, "_concatenatedRequestTextUsingDebugText:", 1);
}

- (id)_concatenatedRequestTextUsingDebugText:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = self->_items;
  objc_sync_enter(v5);
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_items;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          if (v3)
            objc_msgSend(v11, "debugText");
          else
            objc_msgSend(v11, "text", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length", (_QWORD)v15))
            objc_msgSend(v6, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_sync_exit(v5);

  return v13;
}

- (void)donate
{
  BOOL *p_donated;
  unsigned __int8 v4;
  NSMutableArray *v5;
  uint64_t v6;
  unint64_t remoteProcesses;
  NSString *donorBundleIdentifier;
  _QWORD activity_block[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_donated = &self->_donated;
  do
    v4 = __ldaxr((unsigned __int8 *)p_donated);
  while (__stlxr(1u, (unsigned __int8 *)p_donated));
  if ((v4 & 1) == 0)
  {
    v5 = self->_items;
    objc_sync_enter(v5);
    v6 = -[NSMutableArray count](self->_items, "count");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      remoteProcesses = self->_remoteProcesses;
      donorBundleIdentifier = self->_donorBundleIdentifier;
      *(_DWORD *)buf = 134218498;
      v11 = v6;
      v12 = 2048;
      v13 = remoteProcesses;
      v14 = 2112;
      v15 = donorBundleIdentifier;
      _os_log_impl(&dword_208492000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Donating %lu items/%lu remotes from %@", buf, 0x20u);
    }
    if (v6 || self->_remoteProcesses)
    {
      activity_block[0] = MEMORY[0x24BDAC760];
      activity_block[1] = 3221225472;
      activity_block[2] = __27__CKContextDonation_donate__block_invoke;
      activity_block[3] = &unk_24C0A50A0;
      activity_block[4] = self;
      _os_activity_initiate(&dword_208492000, "CKContextDonation donate", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
    objc_sync_exit(v5);

  }
}

void __27__CKContextDonation_donate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[CKContextDonation establishServiceConnection](CKContextDonation, "establishServiceConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "donate:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "invalidate");
}

void __27__CKContextDonation_donate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __27__CKContextDonation_donate__block_invoke_2_cold_1(a2);
}

+ (id)establishServiceConnection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.siri.context.service"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25453E308);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_donate_, 0, 0);

  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(v2, "resume");

  return v2;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (CKContextUserActivity)associatedUserActivity
{
  return self->_associatedUserActivity;
}

- (void)setAssociatedUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_associatedUserActivity, a3);
}

- (unint64_t)remoteProcesses
{
  return self->_remoteProcesses;
}

- (void)setRemoteProcesses:(unint64_t)a3
{
  self->_remoteProcesses = a3;
}

- (unint64_t)nonce
{
  return self->_nonce;
}

- (void)setNonce:(unint64_t)a3
{
  self->_nonce = a3;
}

- (NSString)donorBundleIdentifier
{
  return self->_donorBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donorBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedUserActivity, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)addItem:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_208492000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Attempted to add CKContextDonationItem after donation", v0, 2u);
}

void __27__CKContextDonation_donate__block_invoke_2_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_208492000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "XPC Error in donateWithReply: %@", (uint8_t *)&v1, 0xCu);
}

@end
