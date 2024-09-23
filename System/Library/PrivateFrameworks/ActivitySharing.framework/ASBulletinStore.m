@implementation ASBulletinStore

- (void)loadBulletins
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *bulletins;
  void *v8;
  NSArray *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ActivitySharing"));
  objc_msgSend(v3, "valueForKey:", CFSTR("bulletins"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hk_map:", &__block_literal_global_8);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    bulletins = self->_bulletins;
    self->_bulletins = v6;
  }
  else
  {
    bulletins = self->_bulletins;
    self->_bulletins = (NSArray *)MEMORY[0x24BDBD1A8];
  }

  ASLoggingInitialize();
  v8 = (void *)ASLogNotifications;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_bulletins;
    v10 = v8;
    v11 = 134217984;
    v12 = -[NSArray count](v9, "count");
    _os_log_impl(&dword_21381F000, v10, OS_LOG_TYPE_DEFAULT, "Loaded %lu pending bulletins", (uint8_t *)&v11, 0xCu);

  }
}

ASCodableBulletin *__32__ASBulletinStore_loadBulletins__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ASCodableBulletin *v3;

  v2 = a2;
  v3 = -[ASCodableBulletin initWithData:]([ASCodableBulletin alloc], "initWithData:", v2);

  return v3;
}

- (void)addBulletins:(id)a3
{
  NSArray *v4;
  NSArray *bulletins;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[NSArray arrayByAddingObjectsFromArray:](self->_bulletins, "arrayByAddingObjectsFromArray:", v6);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    bulletins = self->_bulletins;
    self->_bulletins = v4;

    -[ASBulletinStore _persistBulletins](self, "_persistBulletins");
  }

}

- (void)removeAllBulletins
{
  NSObject *v3;
  NSArray *bulletins;
  uint8_t v5[16];

  ASLoggingInitialize();
  v3 = ASLogNotifications;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21381F000, v3, OS_LOG_TYPE_DEFAULT, "Removing all pending bulletins", v5, 2u);
  }
  bulletins = self->_bulletins;
  self->_bulletins = (NSArray *)MEMORY[0x24BDBD1A8];

  -[ASBulletinStore _persistBulletins](self, "_persistBulletins");
}

- (void)removeBulletinsMatchingCriteria:(id)a3
{
  unsigned int (**v4)(id, void *);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  ASBulletinStore *v18;
  id *location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, void *))a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v18 = self;
  location = (id *)&self->_bulletins;
  v5 = self->_bulletins;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v4[2](v4, v12))
        {
          ASLoggingInitialize();
          v13 = (void *)ASLogNotifications;
          if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
          {
            v14 = v13;
            v15 = objc_msgSend(v12, "type");
            objc_msgSend(v12, "title");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v25 = v15;
            v26 = 2112;
            v27 = v16;
            _os_log_impl(&dword_21381F000, v14, OS_LOG_TYPE_DEFAULT, "Removing matching pending bulletin: %lu/%@", buf, 0x16u);

          }
          v8 = 1;
        }
        else
        {
          objc_msgSend(v10, "arrayByAddingObject:", v12);
          v17 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v17;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  objc_storeStrong(location, v10);
  if ((v8 & 1) != 0)
    -[ASBulletinStore _persistBulletins](v18, "_persistBulletins");

}

- (void)removeBulletinsOlderThanInterval:(double)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ASLoggingInitialize();
  v5 = ASLogNotifications;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = (uint64_t)a3;
    _os_log_impl(&dword_21381F000, v5, OS_LOG_TYPE_DEFAULT, "Removing pending bulletins older than %ld seconds", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__ASBulletinStore_removeBulletinsOlderThanInterval___block_invoke;
  v9[3] = &__block_descriptor_48_e27_B16__0__ASCodableBulletin_8l;
  v9[4] = v8;
  *(double *)&v9[5] = a3;
  -[ASBulletinStore removeBulletinsMatchingCriteria:](self, "removeBulletinsMatchingCriteria:", v9);
}

BOOL __52__ASBulletinStore_removeBulletinsOlderThanInterval___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;

  v3 = *(double *)(a1 + 32);
  objc_msgSend(a2, "timestamp");
  return v3 - v4 > *(double *)(a1 + 40);
}

- (void)_persistBulletins
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *bulletins;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[NSArray hk_map:](self->_bulletins, "hk_map:", &__block_literal_global_10_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ActivitySharing"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("bulletins"));
  objc_msgSend(v4, "synchronize");
  ASLoggingInitialize();
  v5 = (void *)ASLogNotifications;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    bulletins = self->_bulletins;
    v7 = v5;
    v8 = 134217984;
    v9 = -[NSArray count](bulletins, "count");
    _os_log_impl(&dword_21381F000, v7, OS_LOG_TYPE_DEFAULT, "Persisted %lu pending bulletins", (uint8_t *)&v8, 0xCu);

  }
}

uint64_t __36__ASBulletinStore__persistBulletins__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

- (NSArray)bulletins
{
  return self->_bulletins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletins, 0);
}

@end
