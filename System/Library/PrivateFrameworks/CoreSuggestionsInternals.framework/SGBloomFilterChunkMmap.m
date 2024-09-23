@implementation SGBloomFilterChunkMmap

- (SGBloomFilterChunkMmap)initWithPath:(id)a3
{
  id v6;
  SGBloomFilterChunkMmap *v7;
  SGBloomFilterChunkMmap *v8;
  int v9;
  int v10;
  char *v11;
  SGBloomFilterChunkMmap *v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  int v17;
  int v18;
  objc_super v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGBloomFilterChunkMmap;
  v7 = -[SGBloomFilterChunkMmap init](&v19, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  objc_storeStrong((id *)&v7->_path, a3);
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR(".bf2-head")) & 1) != 0
    || objc_msgSend(v6, "hasSuffix:", CFSTR(".bf2-tail")))
  {
    v9 = 7;
LABEL_5:
    v8->_mask = v9;
    goto LABEL_6;
  }
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR(".bf-head")) & 1) != 0
    || objc_msgSend(v6, "hasSuffix:", CFSTR(".bf-tail")))
  {
    v9 = 3;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGBloomFilter.m"), 314, CFSTR("Invalid file extension for Bloom filter chunk: %@"), v6);

LABEL_6:
  v10 = open_dprotected_np(-[NSString UTF8String](v8->_path, "UTF8String"), 514, 3, 0, 384);
  v8->_fd = v10;
  if (v10 == -1)
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = *__error();
      *(_DWORD *)buf = 67109120;
      v21 = v17;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "Could not open Bloom filter file. errno = %i", buf, 8u);
    }

    v12 = 0;
  }
  else
  {
    ftruncate(v10, 49204);
    v11 = (char *)mmap(0, 0xC034uLL, 3, 1, v8->_fd, 0);
    v8->_countPtr = (unsigned int *)v11;
    if (v11 != (char *)-1)
    {
      v8->_buf = v11 + 4;
LABEL_9:
      v12 = v8;
      goto LABEL_19;
    }
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = *__error();
      *(_DWORD *)buf = 67109120;
      v21 = v18;
      _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "Could not mmap Bloom filter file. errno = %i", buf, 8u);
    }

    close(v8->_fd);
    v12 = 0;
    v8->_fd = -1;
  }
LABEL_19:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[SGBloomFilterChunkMmap close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)SGBloomFilterChunkMmap;
  -[SGBloomFilterChunkMmap dealloc](&v3, sel_dealloc);
}

- (void)close
{
  if ((self->_fd & 0x80000000) == 0)
  {
    msync(self->_countPtr, 0xC034uLL, 1);
    munmap(self->_countPtr, 0xC034uLL);
    self->_countPtr = 0;
    close(self->_fd);
    self->_fd = -1;
  }
}

- (unsigned)count
{
  return *self->_countPtr;
}

- (NSString)path
{
  return self->_path;
}

- (void)add:(id)a3
{
  if (doInsert((uint64_t)self->_buf, a3.var1.var0, self->_mask))
    ++*self->_countPtr;
}

- (BOOL)exists:(id)a3
{
  unsigned int mask;
  char *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  char v8;

  mask = self->_mask;
  v4 = &self->_buf[6150 * (a3.var0 & 7)];
  if (((v4[(unint64_t)(a3.var1.var0 % 0x1806) >> 3] >> ((a3.var1.var0 % 0x1806) & mask)) & 1) == 0)
    return 0;
  v5 = 2 * a3.var1.var0;
  v6 = -1;
  while (v6 != 8)
  {
    v7 = v4[(unint64_t)(v5 % 0x1806) >> 3];
    v8 = (v5 % 0x1806) & mask;
    v5 += a3.var1.var0;
    ++v6;
    if (((v7 >> v8) & 1) == 0)
      return v6 > 8;
  }
  v6 = 9;
  return v6 > 8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
