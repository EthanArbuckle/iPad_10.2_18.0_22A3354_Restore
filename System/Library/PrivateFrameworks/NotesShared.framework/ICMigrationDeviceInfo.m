@implementation ICMigrationDeviceInfo

- (ICMigrationDeviceInfo)init
{
  -[ICMigrationDeviceInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICMigrationDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5
{
  id v9;
  ICMigrationDeviceInfo *v10;
  ICMigrationDeviceInfo *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMigrationDeviceInfo;
  v10 = -[ICMigrationDeviceInfo init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_upgradable = a4;
    v11->_upgraded = a5;
  }

  return v11;
}

- (ICMigrationDeviceInfo)initWithName:(id)a3
{
  return -[ICMigrationDeviceInfo initWithName:upgradable:upgraded:](self, "initWithName:upgradable:upgraded:", a3, 1, 0);
}

- (BOOL)shouldBeHidden
{
  return 0;
}

+ (void)logDeviceList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "loggableDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

}

- (id)attributedStringWithAttributes:(id)a3 asteriskColor:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[ICMigrationDeviceInfo name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v6);

  if (!-[ICMigrationDeviceInfo upgradable](self, "upgradable"))
  {
    v11 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1140]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" *"), v11);
    objc_msgSend(v10, "appendAttributedString:", v12);

  }
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)upgraded
{
  return self->_upgraded;
}

- (BOOL)upgradedToIOS13
{
  return self->_upgradedToIOS13;
}

- (BOOL)upgradedToIOS14EorMacOS11E
{
  return self->_upgradedToIOS14EorMacOS11E;
}

- (BOOL)upgradable
{
  return self->_upgradable;
}

- (BOOL)upgradableToIOS13
{
  return self->_upgradableToIOS13;
}

- (BOOL)upgradableToIOS14orMacOS11
{
  return self->_upgradableToIOS14orMacOS11;
}

- (BOOL)isOSXDevice
{
  return self->_isOSXDevice;
}

- (BOOL)isIOSDevice
{
  return self->_isIOSDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
