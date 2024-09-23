@implementation ATXApp2VecMapping

- (ATXApp2VecMapping)initWithPath:(id)a3
{
  id v5;
  ATXApp2VecMapping *v6;
  uint64_t v7;
  id v8;
  NSData *data;
  NSData *v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ATXApp2VecMapping *v16;
  void *v18;
  id v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXApp2VecMapping.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v20.receiver = self;
  v20.super_class = (Class)ATXApp2VecMapping;
  v6 = -[ATXApp2VecMapping init](&v20, sel_init);
  if (v6)
  {
    v19 = 0;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 1, &v19);
    v8 = v19;
    data = v6->_data;
    v6->_data = (NSData *)v7;

    v10 = v6->_data;
    if (!v10)
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ATXApp2VecMapping initWithPath:].cold.1();
      goto LABEL_18;
    }
    if (-[NSData length](v10, "length") <= 0xF)
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        v16 = 0;
        goto LABEL_19;
      }
LABEL_7:
      -[ATXApp2VecMapping initWithPath:].cold.2();
      goto LABEL_18;
    }
    v6->_hdr = *(header_s *)-[NSData bytes](v6->_data, "bytes");
    v12 = -[NSData bytes](v6->_data, "bytes");
    v13 = v12 + 16 + 2 * v6->_hdr.length * v6->_hdr.nvectors;
    v6->_matrix = (const unsigned __int16 *)(v12 + 16);
    v6->_endOfMatrix = (const unsigned __int16 *)v13;
    v14 = -[NSData bytes](v6->_data, "bytes");
    if (v13 >= v14 + -[NSData length](v6->_data, "length"))
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      goto LABEL_7;
    }
    v15 = CFBurstTrieCreateFromMapBytes();
    v6->_idxForBundleId = (_CFBurstTrie *)v15;
    if (!v15)
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ATXApp2VecMapping initWithPath:].cold.3();
      goto LABEL_18;
    }

  }
  v16 = v6;
LABEL_19:

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_idxForBundleId)
  {
    CFBurstTrieRelease();
    self->_idxForBundleId = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXApp2VecMapping;
  -[ATXApp2VecMapping dealloc](&v3, sel_dealloc);
}

- (unint64_t)vectorLength
{
  return self->_hdr.length;
}

- (unint64_t)appCount
{
  return self->_hdr.nvectors;
}

- (BOOL)getVectorForBundleId:(id)a3 into:(float *)a4
{
  id v7;
  void *v8;
  uint64_t length;
  const unsigned __int16 *v10;
  NSObject *v11;
  float base;
  float incr;
  unsigned int v14;
  BOOL v15;
  void *v16;

  v7 = a3;
  v8 = v7;
  if (a4)
  {
    if (v7)
      goto LABEL_3;
LABEL_12:
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ATXApp2VecMapping getVectorForBundleId:into:].cold.1(v11);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXApp2VecMapping.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buffer"));

  if (!v8)
    goto LABEL_12;
LABEL_3:
  objc_msgSend(v8, "length");
  if (!CFBurstTrieContains())
  {
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  length = self->_hdr.length;
  v10 = &self->_matrix[-(int)length];
  if (&v10[length] > self->_endOfMatrix)
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXApp2VecMapping getVectorForBundleId:into:].cold.2(v11);
LABEL_14:

    goto LABEL_15;
  }
  if ((_DWORD)length)
  {
    base = self->_hdr.fixinfo.base;
    incr = self->_hdr.fixinfo.incr;
    do
    {
      v14 = *v10++;
      *a4++ = base + (float)((float)v14 * incr);
      --length;
    }
    while (length);
  }
  v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)getVectorForBundleIdWithGenreBackup:(id)a3 into:(float *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (-[ATXApp2VecMapping getVectorForBundleId:into:](self, "getVectorForBundleId:into:", v6, a4))
  {
    v7 = 1;
  }
  else
  {
    +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "genreIdForBundleId:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[ATXApp2VecMapping getVectorForBundleId:into:](self, "getVectorForBundleId:into:", v11, a4);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1C9A3B000, v1, OS_LOG_TYPE_ERROR, "Could not read app2vec mapping %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Truncated app2vec mapping: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithPath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Could not open app2vec trie: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getVectorForBundleId:(os_log_t)log into:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "getVectorForBundleId: called with nil bundle identifier.", v1, 2u);
}

- (void)getVectorForBundleId:(os_log_t)log into:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Invalid app2vec mapping", v1, 2u);
}

@end
