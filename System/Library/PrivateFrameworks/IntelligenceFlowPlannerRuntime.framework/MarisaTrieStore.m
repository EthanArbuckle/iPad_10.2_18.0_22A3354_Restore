@implementation MarisaTrieStore

- (MarisaTrieStore)initWithURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  MarisaTrieStore *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  MarisaTrieStore *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_fileExistsAtPath_(v7, v11, (uint64_t)v10);

  if ((v12 & 1) != 0)
  {
    v35.receiver = self;
    v35.super_class = (Class)MarisaTrieStore;
    v17 = -[MarisaTrieStore init](&v35, sel_init);
    if (v17)
    {
      objc_msgSend_path(v4, v15, v16);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = (const char *)objc_msgSend_UTF8String(v18, v19, v20);
      marisa::Trie::mmap((marisa::Trie *)&v17->trie, v21);

      objc_msgSend_logContext(MarisaTrieStore, v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_lastPathComponent(v4, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = marisa::Trie::num_keys((marisa::Trie *)&v17->trie);
        *(_DWORD *)buf = 138412546;
        v37 = v27;
        v38 = 2048;
        v39 = v28;
        _os_log_impl(&dword_23F35A000, v24, OS_LOG_TYPE_INFO, "MarisaTrieStore %@ loaded {count: %lu}", buf, 0x16u);

      }
    }
    self = v17;
    v29 = self;
  }
  else
  {
    objc_msgSend_logContext(MarisaTrieStore, v13, v14);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_path(v4, v31, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v34;
      _os_log_error_impl(&dword_23F35A000, v30, OS_LOG_TYPE_ERROR, "Unable to locate marisa trie {path: %@}", buf, 0xCu);

    }
    v29 = 0;
  }

  return v29;
}

- (MarisaTrieStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MarisaTrieStore;
  return -[MarisaTrieStore init](&v3, sel_init);
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
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDBCEC8]);
  objc_msgSend_dataUsingEncoding_(v6, v9, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithData_(v8, v11, (uint64_t)v10);

  v23 = -1;
  objc_msgSend_appendBytes_length_(v12, v13, (uint64_t)&v23, 1);
  if (v7 && objc_msgSend_length(v7, v14, v15))
    objc_msgSend_appendData_(v12, v16, (uint64_t)v7);
  v17 = objc_retainAutorelease(v12);
  v20 = (const char *)objc_msgSend_bytes(v17, v18, v19);
  objc_msgSend_length(v17, v21, v22);
  marisa::Keyset::push_back((marisa::Keyset *)&self->keyset, v20, 1.0);

}

- (void)addRow:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  size_t v8;
  size_t v9;
  void **p_dst;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void **__dst;
  size_t v15;
  int64_t v16;

  __dst = 0;
  v15 = 0;
  v16 = 0;
  v4 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend_UTF8String(v4, v5, v6);
  v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8)
    sub_23F616940();
  v9 = v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    p_dst = (void **)operator new(v11 + 1);
    v15 = v9;
    v16 = v12 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v16) = v8;
  p_dst = (void **)&__dst;
  if (v8)
LABEL_8:
    memmove(p_dst, v7, v9);
  *((_BYTE *)p_dst + v9) = 0;
  if (v16 >= 0)
    v13 = (const char *)&__dst;
  else
    v13 = (const char *)__dst;
  marisa::Keyset::push_back((marisa::Keyset *)&self->keyset, v13, 1.0);
  if (SHIBYTE(v16) < 0)
    operator delete(__dst);

}

- (void)buildKeyset
{
  marisa::Trie::build((marisa::Trie *)&self->trie, &self->keyset);
}

- (void)writeToURL:(id)a3
{
  Trie *p_trie;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v11 = a3;
  p_trie = &self->trie;
  marisa::Trie::build((marisa::Trie *)&self->trie, &self->keyset);
  objc_msgSend_path(v11, v5, v6);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);
  marisa::Trie::save((marisa::Trie *)p_trie, v10);

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
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  char *__s[2];
  __int128 v22;
  void *__p[2];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  *(_OWORD *)__s = 0u;
  v22 = 0u;
  v20 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v20);
  v5 = 0;
  p_trie = &self->trie;
  *(_QWORD *)&v7 = 138543362;
  v19 = v7;
  while (v5 < marisa::Trie::size((marisa::Trie *)p_trie))
  {
    marisa::Agent::set_query((marisa::Agent *)&v20);
    marisa::Trie::reverse_lookup((marisa::Trie *)p_trie, (marisa::Agent *)&v20);
    v8 = __s[1];
    v9 = v22;
    v10 = DWORD1(v22);
    v11 = strchr(__s[1], -1);
    v13 = (void *)MEMORY[0x242670588](v11, v12);
    v14 = v11 - v8;
    __p[0] = 0;
    __p[1] = 0;
    v24 = 0;
    sub_23F61689C(__p, v8, v11 - v8);
    if (v24 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v15, (uint64_t)__p, v19);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v15, (uint64_t)__p[0], v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v17, (uint64_t)&v8[v14 + 1], ~v14 + v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v16, v18, v10);

    if (SHIBYTE(v24) < 0)
      operator delete(__p[0]);
    objc_autoreleasePoolPop(v13);
    ++v5;
  }
  marisa::Agent::~Agent((marisa::Agent *)&v20);

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
  const char *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *__p[2];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v16);
  v5 = 0;
  p_trie = &self->trie;
  *(_QWORD *)&v7 = 138543362;
  v15 = v7;
  while (v5 < marisa::Trie::size((marisa::Trie *)p_trie))
  {
    marisa::Agent::set_query((marisa::Agent *)&v16);
    v8 = marisa::Trie::reverse_lookup((marisa::Trie *)p_trie, (marisa::Agent *)&v16);
    v9 = (void *)*((_QWORD *)&v17 + 1);
    v11 = v18;
    v10 = DWORD1(v18);
    v12 = (void *)MEMORY[0x242670588](v8);
    __p[0] = 0;
    __p[1] = 0;
    v20 = 0;
    sub_23F61689C(__p, v9, v11);
    if (v20 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v13, (uint64_t)__p, v15);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v13, (uint64_t)__p[0], v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v14, v10);

    if (SHIBYTE(v20) < 0)
      operator delete(__p[0]);
    objc_autoreleasePoolPop(v12);
    ++v5;
  }
  marisa::Agent::~Agent((marisa::Agent *)&v16);

}

- (BOOL)lookupRow:(id)a3 outIdx:(int64_t *)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  char v11;
  char v12;
  _OWORD v14[2];
  __int128 v15;

  v6 = a3;
  v15 = 0u;
  memset(v14, 0, sizeof(v14));
  marisa::Agent::Agent((marisa::Agent *)v14);
  v7 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);
  marisa::Agent::set_query((marisa::Agent *)v14, v10);
  v11 = marisa::Trie::lookup((marisa::Trie *)&self->trie, (marisa::Agent *)v14);
  v12 = v11 ^ 1;
  if (!a4)
    v12 = 1;
  if ((v12 & 1) == 0)
    *a4 = DWORD1(v15);
  marisa::Agent::~Agent((marisa::Agent *)v14);

  return v11;
}

- (void)lookupKey:(id)a3 resultBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  Trie *p_trie;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v32 = v6;
  marisa::Agent::Agent((marisa::Agent *)&v33);
  objc_msgSend_dataUsingEncoding_(v6, v8, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_mutableCopy(v9, v10, v11);

  if (v12)
  {
    v15 = objc_msgSend_length(v12, v13, v14);
    *(_WORD *)buf = 255;
    objc_msgSend_appendBytes_length_(v12, v16, (uint64_t)buf, 2);
    v17 = objc_retainAutorelease(v12);
    v20 = (const char *)objc_msgSend_bytes(v17, v18, v19);
    marisa::Agent::set_query((marisa::Agent *)&v33, v20);
    p_trie = &self->trie;
    while (marisa::Trie::predictive_search((marisa::Trie *)p_trie, (marisa::Agent *)&v33))
    {
      v22 = *((_QWORD *)&v34 + 1);
      v24 = v35;
      v23 = DWORD1(v35);
      v25 = (void *)MEMORY[0x242670588]();
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v26, v22 + v15 + 1, ~v15 + v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v27, v23);

      objc_autoreleasePoolPop(v25);
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x242670588]();
    objc_msgSend_logContext(MarisaTrieStore, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v6;
      _os_log_error_impl(&dword_23F35A000, v31, OS_LOG_TYPE_ERROR, "Unable to convert NSString to UTF8 NSData. String is:%@", buf, 0xCu);
    }

    v7[2](v7, 0, 0);
    objc_autoreleasePoolPop(v28);
  }

  marisa::Agent::~Agent((marisa::Agent *)&v33);
}

- (void)lookupPrefix:(id)a3 resultBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  Trie *p_trie;
  char *v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  _QWORD *v17;
  const char *v18;
  void *v19;
  void *v20;
  __int128 __dst;
  uint64_t v22;
  void *__p[2];
  uint64_t v24;
  __int128 v25;
  char *__s[2];
  __int128 v27;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  *(_OWORD *)__s = 0u;
  v27 = 0u;
  v25 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v25);
  v8 = objc_retainAutorelease(v6);
  v11 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
  marisa::Agent::set_query((marisa::Agent *)&v25, v11);
  p_trie = &self->trie;
  while (marisa::Trie::predictive_search((marisa::Trie *)p_trie, (marisa::Agent *)&v25))
  {
    v13 = __s[1];
    v15 = v27;
    v14 = DWORD1(v27);
    v16 = strchr(__s[1], 255);
    __p[0] = 0;
    __p[1] = 0;
    v24 = 0;
    if (v16)
      v17 = sub_23F61689C(&__dst, v13, v16 - v13);
    else
      v17 = sub_23F61689C(&__dst, v13, v15);
    if (SHIBYTE(v24) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = __dst;
    v24 = v22;
    v19 = (void *)MEMORY[0x242670588](v17);
    if (v24 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v18, (uint64_t)__p);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v18, (uint64_t)__p[0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v20, v14);

    objc_autoreleasePoolPop(v19);
    if (SHIBYTE(v24) < 0)
      operator delete(__p[0]);
  }
  marisa::Agent::~Agent((marisa::Agent *)&v25);

}

- (id)reverseLookup:(int)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_reverseLookupRow_, *(_QWORD *)&a3);
}

- (id)reverseLookupRow:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v10);
  marisa::Agent::set_query((marisa::Agent *)&v10);
  marisa::Trie::reverse_lookup((marisa::Trie *)&self->trie, (marisa::Agent *)&v10);
  v4 = *((_QWORD *)&v11 + 1);
  v5 = v12;
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8 = (void *)objc_msgSend_initWithBytes_length_encoding_(v6, v7, v4, v5, 4);
  marisa::Agent::~Agent((marisa::Agent *)&v10);
  return v8;
}

- (BOOL)reverseLookupKey:(int)a3 dataLength:(unint64_t)a4 resultBlock:(id)a5
{
  void (**v7)(id, void *, void *);
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v7 = (void (**)(id, void *, void *))a5;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v17);
  marisa::Agent::set_query((marisa::Agent *)&v17);
  marisa::Trie::reverse_lookup((marisa::Trie *)&self->trie, (marisa::Agent *)&v17);
  v8 = *((_QWORD *)&v18 + 1);
  v9 = v19;
  v10 = objc_alloc(MEMORY[0x24BDD17C8]);
  v12 = (void *)objc_msgSend_initWithBytes_length_encoding_(v10, v11, v8, v9 + ~a4, 4);
  v13 = objc_alloc(MEMORY[0x24BDBCE50]);
  v15 = (void *)objc_msgSend_initWithBytes_length_(v13, v14, v8 + v9 - a4, a4);
  v7[2](v7, v12, v15);

  marisa::Agent::~Agent((marisa::Agent *)&v17);
  return 1;
}

- (void).cxx_destruct
{
  _QWORD *array;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  array = self->keyset.key_blocks_.array_;
  if (array)
  {
    v6 = *(array - 1);
    v5 = (char *)(array - 1);
    v4 = v6;
    if (v6)
    {
      v7 = 8 * v4;
      do
      {
        v8 = *(_QWORD *)&v5[v7];
        if (v8)
          MEMORY[0x24267042C](v8, 0x1050C80717B85FCLL);
        v7 -= 8;
      }
      while (v7);
    }
    MEMORY[0x24267042C](v5 - 8, 0x20C8093837F09);
  }
  sub_23F616810((uint64_t *)&self->keyset.extra_blocks_);
  sub_23F616810((uint64_t *)&self->keyset);
  JUMPOUT(0x242670378);
}

- (id).cxx_construct
{
  marisa::Trie::Trie((marisa::Trie *)&self->trie);
  marisa::Keyset::Keyset((marisa::Keyset *)&self->keyset);
  return self;
}

+ (id)logContext
{
  if (qword_256EA0760 != -1)
    dispatch_once(&qword_256EA0760, &unk_250FE12F8);
  return (id)qword_256EA0758;
}

@end
