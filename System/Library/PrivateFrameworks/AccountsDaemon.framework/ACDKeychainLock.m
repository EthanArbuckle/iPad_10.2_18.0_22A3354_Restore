@implementation ACDKeychainLock

- (void)lockPerformForService:(id)a3 username:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_containerLock;
  id v12;
  id v13;
  _QWORD *v14;
  os_unfair_lock_s *v15;
  void (**v16)(_QWORD);
  _QWORD v17[2];
  id (*v18)(_QWORD *);
  void *v19;
  id v20;
  id v21;
  ACDKeychainLock *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_containerLock = &self->_containerLock;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v18 = __56__ACDKeychainLock_lockPerformForService_username_block___block_invoke;
  v19 = &unk_24C7E2370;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = self;
  v14 = v17;
  os_unfair_lock_lock(&self->_containerLock);
  v18(v14);
  v15 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_containerLock);

  v16 = (void (**)(_QWORD))v10;
  os_unfair_lock_lock(v15 + 2);
  v16[2](v16);
  os_unfair_lock_unlock(v15 + 2);

}

id __56__ACDKeychainLock_lockPerformForService_username_block___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[6] + 16), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1[6] + 16), "setObject:forKeyedSubscript:", v3, v2);
  }

  return v3;
}

- (ACDKeychainLock)init
{
  ACDKeychainLock *v2;
  ACDKeychainLock *v3;
  uint64_t v4;
  NSMutableDictionary *locksByServiceUsername;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACDKeychainLock;
  v2 = -[ACDKeychainLock init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_containerLock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    locksByServiceUsername = v3->_locksByServiceUsername;
    v3->_locksByServiceUsername = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locksByServiceUsername, 0);
}

@end
