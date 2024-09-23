@implementation OVMarisaTrie

- (OVMarisaTrie)initWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  OVMarisaTrie *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  OVMarisaTrie *v13;
  NSObject *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)OVMarisaTrie;
    v8 = -[OVMarisaTrie init](&v17, sel_init);
    if (v8)
    {
      objc_msgSend(v4, "path");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      marisa::Trie::mmap((marisa::Trie *)&v8->trie, (const char *)objc_msgSend(v9, "UTF8String"));

      CDMOSLoggerForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = marisa::Trie::num_keys((marisa::Trie *)&v8->trie);
        *(_DWORD *)buf = 136315650;
        v19 = "-[OVMarisaTrie initWithURL:]";
        v20 = 2112;
        v21 = v11;
        v22 = 2048;
        v23 = v12;
        _os_log_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_INFO, "%s OVMarisaTrie %@ loaded {count: %lu}", buf, 0x20u);

      }
    }
    self = v8;
    v13 = self;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[OVMarisaTrie initWithURL:]";
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to locate marisa trie {path: %@}", buf, 0x16u);

    }
    v13 = 0;
  }

  return v13;
}

- (OVMarisaTrie)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OVMarisaTrie;
  return -[OVMarisaTrie init](&v3, sel_init);
}

- (int64_t)count
{
  return marisa::Trie::size((marisa::Trie *)&self->trie);
}

- (void)addKey:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDBCEC8]);
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:", v9);

  v13 = -1;
  objc_msgSend(v10, "appendBytes:length:", &v13, 1);
  if (v7 && objc_msgSend(v7, "length"))
    objc_msgSend(v10, "appendData:", v7);
  v11 = objc_retainAutorelease(v10);
  v12 = (const char *)objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");
  marisa::Keyset::push_back((marisa::Keyset *)&self->keyset, v12, 1.0);

}

- (void)addRow:(id)a3
{
  id v4;
  const char *p_p;
  void *__p;
  char v7;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v4, "UTF8String"));
  if (v7 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  marisa::Keyset::push_back((marisa::Keyset *)&self->keyset, p_p, 1.0);
  if (v7 < 0)
    operator delete(__p);

}

- (void)writeToURL:(id)a3
{
  Trie *p_trie;
  id v5;
  id v6;

  v6 = a3;
  p_trie = &self->trie;
  marisa::Trie::build((marisa::Trie *)&self->trie, (marisa::Keyset *)&self->keyset);
  objc_msgSend(v6, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  marisa::Trie::save((marisa::Trie *)p_trie, (const char *)objc_msgSend(v5, "UTF8String"));

}

- (void)buildKeyset
{
  marisa::Trie::build((marisa::Trie *)&self->trie, (marisa::Keyset *)&self->keyset);
}

- (void)enumerateAllEntriesWithBlock:(id)a3
{
  void (**v4)(id, void *, void *, _QWORD);
  unint64_t v5;
  Trie *p_trie;
  __int128 v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  void *p_p;
  void *v16;
  void *v17;
  __int128 v18;
  _BYTE v19[24];
  char *__s;
  unsigned int v21;
  unsigned int v22;
  void *__p;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  marisa::Agent::Agent((marisa::Agent *)v19);
  v5 = 0;
  p_trie = &self->trie;
  *(_QWORD *)&v7 = 136315394;
  v18 = v7;
  while (v5 < marisa::Trie::size((marisa::Trie *)p_trie))
  {
    marisa::Agent::set_query((marisa::Agent *)v19);
    marisa::Trie::reverse_lookup((marisa::Trie *)p_trie, (marisa::Agent *)v19);
    v8 = __s;
    v9 = v21;
    v10 = v22;
    v11 = strchr(__s, -1);
    v13 = (void *)MEMORY[0x220744410](v11, v12);
    v14 = v11 - v8;
    std::string::basic_string[abi:ne180100](&__p, v8, v11 - v8);
    if (v24 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_p, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8[v14 + 1], ~v14 + v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v16, v17, v10);

    if (v24 < 0)
      operator delete(__p);
    objc_autoreleasePoolPop(v13);
    ++v5;
  }
  marisa::Agent::~Agent((marisa::Agent *)v19);

}

- (void)enumerateAllRowsWithBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  unint64_t v5;
  Trie *p_trie;
  __int128 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  void *p_p;
  void *v14;
  __int128 v15;
  _BYTE v16[24];
  void *v17;
  unsigned int v18;
  unsigned int v19;
  void *__p;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  marisa::Agent::Agent((marisa::Agent *)v16);
  v5 = 0;
  p_trie = &self->trie;
  *(_QWORD *)&v7 = 136315394;
  v15 = v7;
  while (v5 < marisa::Trie::size((marisa::Trie *)p_trie))
  {
    marisa::Agent::set_query((marisa::Agent *)v16);
    v8 = marisa::Trie::reverse_lookup((marisa::Trie *)p_trie, (marisa::Agent *)v16);
    v9 = v17;
    v11 = v18;
    v10 = v19;
    v12 = (void *)MEMORY[0x220744410](v8);
    std::string::basic_string[abi:ne180100](&__p, v9, v11);
    if (v21 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_p, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v14, v10);

    if (v21 < 0)
      operator delete(__p);
    objc_autoreleasePoolPop(v12);
    ++v5;
  }
  marisa::Agent::~Agent((marisa::Agent *)v16);

}

- (BOOL)lookupRow:(id)a3 outIdx:(int64_t *)a4
{
  id v6;
  id v7;
  char v8;
  char v9;
  _DWORD v11[12];

  v6 = a3;
  marisa::Agent::Agent((marisa::Agent *)v11);
  v7 = objc_retainAutorelease(v6);
  marisa::Agent::set_query((marisa::Agent *)v11, (const char *)objc_msgSend(v7, "UTF8String"));
  v8 = marisa::Trie::lookup((marisa::Trie *)&self->trie, (marisa::Agent *)v11);
  v9 = v8 ^ 1;
  if (!a4)
    v9 = 1;
  if ((v9 & 1) == 0)
    *a4 = v11[9];
  marisa::Agent::~Agent((marisa::Agent *)v11);

  return v8;
}

- (void)lookupKey:(id)a3 resultBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  Trie *p_trie;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _BYTE v20[24];
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v19 = v6;
  marisa::Agent::Agent((marisa::Agent *)v20);
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v9)
  {
    v10 = objc_msgSend(v9, "length");
    *(_WORD *)buf = 255;
    objc_msgSend(v9, "appendBytes:length:", buf, 2);
    marisa::Agent::set_query((marisa::Agent *)v20, (const char *)objc_msgSend(objc_retainAutorelease(v9), "bytes"));
    p_trie = &self->trie;
    while (marisa::Trie::predictive_search((marisa::Trie *)p_trie, (marisa::Agent *)v20))
    {
      v12 = v21;
      v14 = v22;
      v13 = v23;
      v15 = (void *)MEMORY[0x220744410]();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12 + v10 + 1, ~v10 + v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v16, v13);

      objc_autoreleasePoolPop(v15);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x220744410]();
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[OVMarisaTrie lookupKey:resultBlock:]";
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to convert NSString to UTF8 NSData. String is:%@", buf, 0x16u);
    }

    v7[2](v7, 0, 0);
    objc_autoreleasePoolPop(v17);
  }

  marisa::Agent::~Agent((marisa::Agent *)v20);
}

- (void)lookupPrefix:(id)a3 resultBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  Trie *p_trie;
  char *v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  _QWORD *v14;
  void *v15;
  void **v16;
  void *v17;
  __int128 __dst;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  _BYTE v22[24];
  char *__s;
  unsigned int v24;
  unsigned int v25;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  marisa::Agent::Agent((marisa::Agent *)v22);
  v8 = objc_retainAutorelease(v6);
  marisa::Agent::set_query((marisa::Agent *)v22, (const char *)objc_msgSend(v8, "UTF8String"));
  p_trie = &self->trie;
  while (marisa::Trie::predictive_search((marisa::Trie *)p_trie, (marisa::Agent *)v22))
  {
    v10 = __s;
    v12 = v24;
    v11 = v25;
    v13 = strchr(__s, 255);
    __p[0] = 0;
    __p[1] = 0;
    v21 = 0;
    if (v13)
      v14 = std::string::basic_string[abi:ne180100](&__dst, v10, v13 - v10);
    else
      v14 = std::string::basic_string[abi:ne180100](&__dst, v10, v12);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = __dst;
    v21 = v19;
    v15 = (void *)MEMORY[0x220744410](v14);
    if (v21 >= 0)
      v16 = __p;
    else
      v16 = (void **)__p[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17, v11);

    objc_autoreleasePoolPop(v15);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
  }
  marisa::Agent::~Agent((marisa::Agent *)v22);

}

- (id)reverseLookupRow:(int)a3
{
  void *v4;
  _QWORD v6[4];
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  marisa::Agent::Agent((marisa::Agent *)v6);
  marisa::Agent::set_query((marisa::Agent *)v6);
  marisa::Trie::reverse_lookup((marisa::Trie *)&self->trie, (marisa::Agent *)v6);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v6[3], v7, 4);
  marisa::Agent::~Agent((marisa::Agent *)v6);
  return v4;
}

- (BOOL)reverseLookupKey:(int)a3 dataLength:(unint64_t)a4 resultBlock:(id)a5
{
  void (**v7)(id, void *, void *);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BYTE v13[24];
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, void *, void *))a5;
  marisa::Agent::Agent((marisa::Agent *)v13);
  marisa::Agent::set_query((marisa::Agent *)v13);
  marisa::Trie::reverse_lookup((marisa::Trie *)&self->trie, (marisa::Agent *)v13);
  v8 = v14;
  v9 = v15;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v14, v15 + ~a4, 4);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v8 + v9 - a4, a4);
  v7[2](v7, v10, v11);

  marisa::Agent::~Agent((marisa::Agent *)v13);
  return 1;
}

- (void).cxx_destruct
{
  uint64_t *p_keyset;

  p_keyset = (uint64_t *)&self->keyset;
  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array((uint64_t *)&self->keyset.key_blocks_);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)&self->keyset.extra_blocks_);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(p_keyset);
  JUMPOUT(0x220743D98);
}

- (id).cxx_construct
{
  marisa::Trie::Trie((marisa::Trie *)&self->trie);
  marisa::Keyset::Keyset((marisa::Keyset *)&self->keyset);
  return self;
}

@end
