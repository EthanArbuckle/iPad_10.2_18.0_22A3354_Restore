@implementation CDMMarisaTrie

- (CDMMarisaTrie)initWithFilePath:(id)a3 versionNumber:(id)a4
{
  id v6;
  id v7;
  CDMMarisaTrie *v8;
  uint64_t v9;
  NSString *filePath;
  uint64_t v11;
  NSNumber *versionNumber;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CDMMarisaTrie;
  v8 = -[CDMMarisaTrie init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    filePath = v8->_filePath;
    v8->_filePath = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    versionNumber = v8->_versionNumber;
    v8->_versionNumber = (NSNumber *)v11;

    if (-[CDMMarisaTrie _loadTrie](v8, "_loadTrie"))
    {
      v13 = (void *)objc_msgSend(CFSTR("~~_ver_~~"), "copy");
      -[CDMMarisaTrie _readCachedNumberValueForKey:](v8, "_readCachedNumberValueForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!-[NSNumber isEqualToNumber:](v8->_versionNumber, "isEqualToNumber:", v14))
      {
        CDMOSLoggerForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[CDMMarisaTrie initWithFilePath:versionNumber:]";
          _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s WARNING : Version mismatch", buf, 0xCu);
        }

        marisa::Trie::clear((marisa::Trie *)&v8->_readOnlyTrie);
      }

    }
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  marisa::Trie::clear((marisa::Trie *)&self->_readOnlyTrie);
  v3.receiver = self;
  v3.super_class = (Class)CDMMarisaTrie;
  -[CDMMarisaTrie dealloc](&v3, sel_dealloc);
}

- (BOOL)isValid
{
  return marisa::Trie::empty((marisa::Trie *)&self->_readOnlyTrie) ^ 1;
}

- (NSNumber)hashValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(CFSTR("~~_hash_~~"), "copy");
  -[CDMMarisaTrie _readCachedNumberValueForKey:](self, "_readCachedNumberValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (BOOL)createFromEntries:(id)a3
{
  return -[CDMMarisaTrie createFromEntries:withHashValue:](self, "createFromEntries:withHashValue:", a3, &unk_24DCCCB30);
}

- (BOOL)createFromEntries:(id)a3 withHashValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26[3];
  uint64_t v27[3];
  uint64_t v28[7];
  _BYTE v29[24];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  marisa::Keyset::Keyset((marisa::Keyset *)v26);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        marisa::Keyset::push_back((marisa::Keyset *)v26, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11++)), "UTF8String"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = (void *)objc_msgSend(CFSTR("~~_ver_~~%@"), "copy");
  objc_msgSend(v12, "stringWithFormat:", v13, self->_versionNumber);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (void *)objc_msgSend(CFSTR("~~_hash_~~%@"), "copy");
  objc_msgSend(v15, "stringWithFormat:", v16, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_retainAutorelease(v14);
  marisa::Keyset::push_back((marisa::Keyset *)v26, (const char *)objc_msgSend(v18, "UTF8String"));
  v19 = objc_retainAutorelease(v17);
  marisa::Keyset::push_back((marisa::Keyset *)v26, (const char *)objc_msgSend(v19, "UTF8String"));
  marisa::Trie::Trie((marisa::Trie *)v29);
  marisa::Trie::build((marisa::Trie *)v29, (marisa::Keyset *)v26);
  marisa::Trie::save((marisa::Trie *)v29, -[NSString UTF8String](self->_filePath, "UTF8String"));
  marisa::Trie::clear((marisa::Trie *)v29);
  MEMORY[0x220743D98](v29);
  v20 = -[CDMMarisaTrie _loadTrie](self, "_loadTrie");

  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array(v28);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(v27);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(v26);

  return v20;
}

- (BOOL)hasEntry:(id)a3
{
  id v4;
  id v5;
  _BYTE v7[48];

  v4 = a3;
  marisa::Agent::Agent((marisa::Agent *)v7);
  v5 = objc_retainAutorelease(v4);
  marisa::Agent::set_query((marisa::Agent *)v7, (const char *)objc_msgSend(v5, "UTF8String"));
  LOBYTE(self) = marisa::Trie::lookup((marisa::Trie *)&self->_readOnlyTrie, (marisa::Agent *)v7);
  marisa::Agent::~Agent((marisa::Agent *)v7);

  return (char)self;
}

- (BOOL)hasPrefix:(id)a3
{
  id v4;
  id v5;
  _BYTE v7[48];

  v4 = a3;
  marisa::Agent::Agent((marisa::Agent *)v7);
  v5 = objc_retainAutorelease(v4);
  marisa::Agent::set_query((marisa::Agent *)v7, (const char *)objc_msgSend(v5, "UTF8String"));
  LOBYTE(self) = marisa::Trie::predictive_search((marisa::Trie *)&self->_readOnlyTrie, (marisa::Agent *)v7);
  marisa::Agent::~Agent((marisa::Agent *)v7);

  return (char)self;
}

- (id)traversePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  Trie *p_readOnlyTrie;
  id v8;
  void *v9;
  _QWORD v11[4];
  unsigned int v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  marisa::Agent::Agent((marisa::Agent *)v11);
  v6 = objc_retainAutorelease(v4);
  marisa::Agent::set_query((marisa::Agent *)v11, (const char *)objc_msgSend(v6, "UTF8String"));
  p_readOnlyTrie = &self->_readOnlyTrie;
  while (marisa::Trie::predictive_search((marisa::Trie *)p_readOnlyTrie, (marisa::Agent *)v11))
  {
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    v9 = (void *)objc_msgSend(v8, "initWithBytes:length:encoding:", v11[3], v12, 4);
    objc_msgSend(v5, "addObject:", v9);

  }
  marisa::Agent::~Agent((marisa::Agent *)v11);

  return v5;
}

- (BOOL)_loadTrie
{
  Trie *p_readOnlyTrie;
  void *v4;
  int v5;

  p_readOnlyTrie = &self->_readOnlyTrie;
  marisa::Trie::clear((marisa::Trie *)&self->_readOnlyTrie);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", self->_filePath);

  if (v5)
    marisa::Trie::mmap((marisa::Trie *)p_readOnlyTrie, -[NSString UTF8String](self->_filePath, "UTF8String"));
  return marisa::Trie::empty((marisa::Trie *)p_readOnlyTrie) ^ 1;
}

- (id)_readCachedNumberValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CDMMarisaTrie traversePrefix:](self, "traversePrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v4, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v8, "UTF8String"), 0, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "-[CDMMarisaTrie _readCachedNumberValueForKey:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s WARNING: Failed to find entry for key: %@", (uint8_t *)&v12, 0x16u);
    }

    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionNumber, 0);
  MEMORY[0x220743D98](&self->_readOnlyTrie);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (id).cxx_construct
{
  marisa::Trie::Trie((marisa::Trie *)&self->_readOnlyTrie);
  return self;
}

@end
