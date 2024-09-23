@implementation GDCFBurstTrie

- (GDCFBurstTrie)initWithPath:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  GDCFBurstTrie *v9;
  uint64_t v10;
  GDCFBurstTrie *v11;
  void *v13;
  const char *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, CFSTR("GDCFBurstTrie.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v15.receiver = self;
  v15.super_class = (Class)GDCFBurstTrie;
  v9 = -[GDCFBurstTrie init](&v15, sel_init);
  if (v9 && (v10 = CFBurstTrieCreateFromFile(), (v9->_trie = (_CFBurstTrie *)v10) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_1C0771000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not open trie: %@", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_trie)
    CFBurstTrieRelease();
  v3.receiver = self;
  v3.super_class = (Class)GDCFBurstTrie;
  -[GDCFBurstTrie dealloc](&v3, sel_dealloc);
}

- (unsigned)payloadForString:(id)a3
{
  __CFString *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  char __s[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v7 = objc_msgSend_length(v3, v4, v5, v6);
  if (CFStringGetCStringPtr(v3, 0x600u))
    goto LABEL_2;
  if (v7 <= 0xFF)
  {
    v34 = 0;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    *(_OWORD *)__s = 0u;
    v11 = 0u;
    if (objc_msgSend_getCString_maxLength_encoding_(v3, v8, (uint64_t)__s, 385, 4))
    {
      strlen(__s);
LABEL_2:
      CFBurstTrieContainsUTF8String();
      goto LABEL_3;
    }
  }
  if (v3)
    CFBurstTrieContains();
LABEL_3:

  return 0;
}

- (unsigned)payloadForString:(id)a3 range:(_NSRange)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_substringWithRange_(a3, a2, a4.location, a4.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend_payloadForString_(self, v6, (uint64_t)v5, v7);

  return self;
}

- (unsigned)payloadForUTF8String:(const char *)a3 length:(unint64_t)a4
{
  if (!a3)
    return 0;
  if (CFBurstTrieContainsUTF8String())
    return 0;
  return 0;
}

- (void)runBlockWithTrie:(id)a3
{
  (*((void (**)(id, _CFBurstTrie *))a3 + 2))(a3, self->_trie);
}

@end
