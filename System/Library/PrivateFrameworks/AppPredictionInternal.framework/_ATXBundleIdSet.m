@implementation _ATXBundleIdSet

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_25 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_25, &__block_literal_global_138);
  return (id)sharedInstance__pasExprOnceResult_31;
}

- (_ATXBundleIdSet)init
{
  _ATXBundleIdSet *v2;
  void *v3;
  uint64_t v4;
  NSObject *trie;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ATXBundleIdSet;
  v2 = -[_ATXBundleIdSet init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", CFSTR("_ATXBundleIdSet"), CFSTR("trie"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", v3);
      trie = v2->_trie;
      v2->_trie = (_PASCFBurstTrie *)v4;
    }
    else
    {
      __atxlog_handle_default();
      trie = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(trie, OS_LOG_TYPE_ERROR))
        -[_ATXBundleIdSet init].cold.1(trie);
    }

  }
  return v2;
}

- (BOOL)containsBundleId:(id)a3
{
  return a3 && -[_PASCFBurstTrie payloadForString:](self->_trie, "payloadForString:") != 0;
}

- (id)trie
{
  return self->_trie;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trie, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Could not locate bundle id set", v1, 2u);
}

@end
