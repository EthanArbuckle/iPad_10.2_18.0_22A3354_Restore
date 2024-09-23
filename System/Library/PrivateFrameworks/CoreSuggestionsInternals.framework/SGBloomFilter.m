@implementation SGBloomFilter

- (SGBloomFilter)initWithHead:(id)a3 tail:(id)a4
{
  id v7;
  id v8;
  SGBloomFilter *v9;
  SGBloomFilter *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SGBloomFilter;
  v9 = -[SGBloomFilter init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_head, a3);
    objc_storeStrong((id *)&v10->_tail, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.suggestions.SGBloomFilter", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

  }
  return v10;
}

- (SGBloomFilter)initWithInMemoryStorage
{
  void *v3;
  void *v4;
  SGBloomFilter *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[SGBloomFilter initWithHead:tail:](self, "initWithHead:tail:", v3, v4);

  return v5;
}

- (SGBloomFilter)initWithInMemoryStorageSparse
{
  void *v3;
  void *v4;
  SGBloomFilter *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[SGBloomFilter initWithHead:tail:](self, "initWithHead:tail:", v3, v4);

  return v5;
}

- (SGBloomFilter)initWithDirectory:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SGBloomFilter *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  NSObject *v27;
  id v28;
  id v29;
  int v30;
  NSObject *v31;
  SGBloomFilter *v32;
  SGBloomFilterChunkMmap *v33;
  void *v34;
  SGBloomFilterChunkMmap *v35;
  SGBloomFilterChunkMmap *v36;
  void *v37;
  SGBloomFilterChunkMmap *v38;
  NSObject *v39;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGBloomFilter.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dirPath"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGBloomFilter.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  if (initWithDirectory_name__onceToken != -1)
    dispatch_once(&initWithDirectory_name__onceToken, &__block_literal_global_10411);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v7, v9);
  pthread_mutex_lock(&initWithDirectory_name__lock);
  objc_msgSend((id)initWithDirectory_name__instances, "objectForKey:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (SGBloomFilter *)v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v7, &v57);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v57;

    if (v15)
    {
      v52 = v13;
      v50 = v16;
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v15);
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".bf-head"));
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".bf-tail"));
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".bf2-head"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".bf2-tail"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)v18;
      v54 = v20;
      if (-[NSObject containsObject:](v17, "containsObject:", v18))
        v22 = (void *)v18;
      else
        v22 = v20;
      v47 = v22;
      if (-[NSObject containsObject:](v17, "containsObject:", v19))
        v23 = (void *)v19;
      else
        v23 = v21;
      v24 = v23;
      v53 = (void *)v19;
      v48 = v21;
      if (-[NSObject containsObject:](v17, "containsObject:", v19)
        && -[NSObject containsObject:](v17, "containsObject:", v21))
      {
        v55 = v21;

        objc_msgSend(v7, "stringByAppendingPathComponent:", v19);
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v26 = unlink((const char *)objc_msgSend(v25, "UTF8String"));

        if (v26)
        {
          sgLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "stringByAppendingPathComponent:", v53);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = *__error();
            *(_DWORD *)buf = 138412546;
            v59 = v41;
            v60 = 1024;
            LODWORD(v61) = v42;
            _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "Could not unlink %@ while rotating: errno=%i", buf, 0x12u);

          }
        }
      }
      else
      {
        v55 = v24;
      }
      v51 = v15;
      v49 = v17;
      if (-[NSObject containsObject:](v17, "containsObject:", v56)
        && -[NSObject containsObject:](v17, "containsObject:", v20))
      {
        v28 = v20;

        objc_msgSend(v7, "stringByAppendingPathComponent:", v56);
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30 = unlink((const char *)objc_msgSend(v29, "UTF8String"));

        if (v30)
        {
          sgLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "stringByAppendingPathComponent:", v56);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = *__error();
            *(_DWORD *)buf = 138412546;
            v59 = v43;
            v60 = 1024;
            LODWORD(v61) = v44;
            _os_log_error_impl(&dword_1C3607000, v31, OS_LOG_TYPE_ERROR, "Could not unlink %@ while rotating: errno=%i", buf, 0x12u);

          }
          v32 = self;

        }
        else
        {
          v32 = self;
        }
      }
      else
      {
        v32 = self;
        v28 = v47;
      }
      v33 = [SGBloomFilterChunkMmap alloc];
      objc_msgSend(v7, "stringByAppendingPathComponent:", v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SGBloomFilterChunkMmap initWithPath:](v33, "initWithPath:", v34);
      v36 = [SGBloomFilterChunkMmap alloc];
      objc_msgSend(v7, "stringByAppendingPathComponent:", v55);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[SGBloomFilterChunkMmap initWithPath:](v36, "initWithPath:", v37);
      v12 = -[SGBloomFilter initWithHead:tail:](v32, "initWithHead:tail:", v35, v38);

      if (objc_msgSend(v28, "isEqualToString:", v56))
        -[SGBloomFilter _rotate](v12, "_rotate");
      objc_msgSend((id)initWithDirectory_name__instances, "setObject:forKey:", v12, v10);

      self = v12;
      v15 = v51;
      v13 = v52;
      v39 = v49;
      v16 = v50;
    }
    else
    {
      sgLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v59 = v7;
        v60 = 2112;
        v61 = v16;
        _os_log_error_impl(&dword_1C3607000, v39, OS_LOG_TYPE_ERROR, "Error listing contents of directory %@: %@", buf, 0x16u);
      }
      v12 = 0;
    }

    objc_autoreleasePoolPop(v13);
  }
  pthread_mutex_unlock(&initWithDirectory_name__lock);

  return v12;
}

- (void)_rotateIfNecessary
{
  if (-[SGBloomFilterChunk count](self->_head, "count") >> 3 >= 0xC35)
    -[SGBloomFilter _rotate](self, "_rotate");
}

- (void)_rotate
{
  NSObject *v3;
  _UNKNOWN **v4;
  char isKindOfClass;
  SGBloomFilterChunk *head;
  SGBloomFilterChunk *v7;
  SGBloomFilterChunk *v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  SGBloomFilterChunk *v13;
  void *v14;
  void *v15;
  void *v16;
  SGBloomFilterChunk *v17;
  int v18;
  id v19;
  const std::__fs::filesystem::path *v20;
  id v21;
  const std::__fs::filesystem::path *v22;
  std::error_code *v23;
  int v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  SGBloomFilterChunk *v28;
  SGBloomFilterChunk *v29;
  SGBloomFilterChunk *v30;
  SGBloomFilterChunk *tail;
  int v32;
  int v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "Rotating bloom filters", buf, 2u);
  }

  v4 = &off_1E7DA5000;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  head = self->_head;
  if ((isKindOfClass & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tail, head);
    objc_opt_class();
    v17 = (SGBloomFilterChunk *)objc_opt_new();
    v7 = self->_head;
    self->_head = v17;
    goto LABEL_21;
  }
  v7 = head;
  v8 = self->_tail;
  -[SGBloomFilterChunk path](v7, "path");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SGBloomFilterChunk path](v8, "path");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hasSuffix:", CFSTR(".bf-head"));
  if (v11)
  {
    v12 = v10;
    v13 = v8;
    v14 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(".bf2-head"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
  }
  else
  {
    if (!objc_msgSend(v10, "hasSuffix:", CFSTR(".bf-tail")))
    {
      v18 = 0;
      v34 = v9;
      v12 = v10;
      goto LABEL_11;
    }
    v13 = v8;
    v14 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(".bf2-tail"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    v34 = v9;
  }
  v18 = v11 ^ 1;

  objc_autoreleasePoolPop(v14);
  v8 = v13;
  v4 = &off_1E7DA5000;
LABEL_11:
  -[SGBloomFilterChunk close](v7, "close");
  -[SGBloomFilterChunk close](v8, "close");
  v19 = objc_retainAutorelease(v9);
  v20 = (const std::__fs::filesystem::path *)objc_msgSend(v19, "UTF8String");
  v21 = objc_retainAutorelease(v12);
  v22 = (const std::__fs::filesystem::path *)objc_msgSend(v21, "UTF8String");
  rename(v20, v22, v23);
  if (v24)
  {
    sgLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v32 = *__error();
      *(_DWORD *)buf = 138412802;
      v36 = v34;
      v37 = 2112;
      v38 = v21;
      v39 = 1024;
      v40 = v32;
      _os_log_error_impl(&dword_1C3607000, v25, OS_LOG_TYPE_ERROR, "Could not move %@ to %@: errno=%i", buf, 0x1Cu);
    }

  }
  if (v18)
  {
    v26 = objc_retainAutorelease(v10);
    if (unlink((const char *)objc_msgSend(v26, "UTF8String")))
    {
      sgLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v33 = *__error();
        *(_DWORD *)buf = 138412546;
        v36 = v26;
        v37 = 1024;
        LODWORD(v38) = v33;
        _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "Could not unlink %@: errno=%i", buf, 0x12u);
      }

    }
  }
  v28 = (SGBloomFilterChunk *)objc_msgSend(objc_alloc((Class)v4[302]), "initWithPath:", v34);
  v29 = self->_head;
  self->_head = v28;

  v30 = (SGBloomFilterChunk *)objc_msgSend(objc_alloc((Class)v4[302]), "initWithPath:", v21);
  tail = self->_tail;
  self->_tail = v30;

LABEL_21:
}

- (void)forceRotate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SGBloomFilter_forceRotate__block_invoke;
  block[3] = &unk_1E7DB56F0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)add:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__SGBloomFilter_add___block_invoke;
  block[3] = &unk_1E7DB6A30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)addAsync:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__SGBloomFilter_addAsync___block_invoke;
  v7[3] = &unk_1E7DB6A30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)exists:(id)a3
{
  uint64_t v4;
  NSObject *queue;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = 0;
  SGMurmurhashString(a3, 12345, &v8);
  v4 = v8;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __24__SGBloomFilter_exists___block_invoke;
  v7[3] = &unk_1E7DB5BC8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = v4;
  dispatch_sync(queue, v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (id)counts
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10350;
  v10 = __Block_byref_object_dispose__10351;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__SGBloomFilter_counts__block_invoke;
  v5[3] = &unk_1E7DB78A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

void __23__SGBloomFilter_counts__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0D81638]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithFirst:second:", v7, v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __24__SGBloomFilter_exists___block_invoke(_QWORD *a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1[4] + 8), "exists:", a1[6]) & 1) != 0)
    result = 1;
  else
    result = objc_msgSend(*(id *)(a1[4] + 16), "exists:", a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t __26__SGBloomFilter_addAsync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_rotateIfNecessary");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = 0;
  v5[1] = 0;
  SGMurmurhashString(v2, 12345, v5);
  return objc_msgSend(v3, "add:", v5[0]);
}

uint64_t __21__SGBloomFilter_add___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_rotateIfNecessary");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = 0;
  v5[1] = 0;
  SGMurmurhashString(v2, 12345, v5);
  return objc_msgSend(v3, "add:", v5[0]);
}

uint64_t __28__SGBloomFilter_forceRotate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rotate");
}

void __40__SGBloomFilter_initWithDirectory_name___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 1);
  v1 = (void *)initWithDirectory_name__instances;
  initWithDirectory_name__instances = v0;

}

@end
