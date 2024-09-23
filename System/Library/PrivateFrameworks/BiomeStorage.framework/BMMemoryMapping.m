@implementation BMMemoryMapping

- (unsigned)atomicWriteEightBytes:(unint64_t)a3 toOffset:(unint64_t)a4 expected:(unint64_t *)a5
{
  int v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;

  if (-[BMMemoryMapping canAtomicallyAccessOffset:](self, "canAtomicallyAccessOffset:", a4))
  {
    if (self)
    {
      v9 = -[BMMemoryMapping isWritable](self, "isWritable");
      if (v9)
      {
        v9 = -[BMMemoryMapping isValidReadFromOffset:withLength:](self, "isValidReadFromOffset:withLength:", a4, 8);
        if (v9)
        {
          v10 = (unint64_t *)(-[BMMemoryMapping start](self, "start") + a4);
          v11 = *a5;
          while (1)
          {
            v12 = __ldaxr(v10);
            if (v12 != v11)
              break;
            if (!__stlxr(a3, v10))
            {
              LOBYTE(v9) = 1;
              return v9;
            }
          }
          __clrex();
          *a5 = v12;
          LOBYTE(v9) = 2;
        }
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 3;
  }
  return v9;
}

- (BOOL)isWritable
{
  return (LOBYTE(self->_protection) >> 1) & 1;
}

- (BOOL)isValidReadFromOffset:(unint64_t)a3 withLength:(unint64_t)a4
{
  BMMemoryMapping *v4;

  if (self)
  {
    v4 = self;
    LOBYTE(self) = self->_mappedAddress
                && -[BMMemoryMapping size](self, "size") > a3
                && -[BMMemoryMapping size](v4, "size") - a3 >= a4;
  }
  return (char)self;
}

- (void)start
{
  return self->_start;
}

- (unint64_t)size
{
  return self->_size;
}

- (BOOL)mapWithFileHandle:(id)a3 fileSize:(unint64_t)a4
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSObject *v9;
  unint64_t size;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  off_t v15;
  size_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  unint64_t v27;
  unint64_t v28;
  int64_t offset;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v37;
  unint64_t v38;
  __int16 v39;
  _BYTE v40[28];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[BMMemoryMapping offset](self, "offset");
  if ((v7 & 0x8000000000000000) != 0)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BMMemoryMapping mapWithFileHandle:fileSize:].cold.1((uint64_t)self, v6);
    goto LABEL_21;
  }
  v8 = v7;
  if (v7 > a4)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      size = self->_size;
      v11 = (void *)MEMORY[0x1E0D01D10];
      objc_msgSend(v6, "attributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "privacyPathname:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 134218754;
      v38 = size;
      v39 = 2048;
      *(_QWORD *)v40 = a4;
      *(_WORD *)&v40[8] = 2048;
      *(_QWORD *)&v40[10] = v8;
      *(_WORD *)&v40[18] = 2114;
      *(_QWORD *)&v40[20] = v14;
      _os_log_fault_impl(&dword_1A95BD000, v9, OS_LOG_TYPE_FAULT, "Offset too large, frame size:%zu fileSize:%zu offset:%lld file:%{public}@", (uint8_t *)&v37, 0x2Au);

LABEL_20:
    }
LABEL_21:
    v21 = 0;
    goto LABEL_22;
  }
  v15 = NSRoundDownToMultipleOfPageSize(v7);
  self->_offsetSpace = v8 - v15;
  v16 = NSRoundUpToMultipleOfPageSize(self->_size + v8 - v15);
  if (!v16)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_21;
    v28 = self->_size;
    offset = self->_offset;
    v30 = (void *)MEMORY[0x1E0D01D10];
    objc_msgSend(v6, "attributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "privacyPathname:", v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 134218498;
    v38 = v28;
    v39 = 2048;
    *(_QWORD *)v40 = offset;
    *(_WORD *)&v40[8] = 2114;
    *(_QWORD *)&v40[10] = v14;
    _os_log_fault_impl(&dword_1A95BD000, v9, OS_LOG_TYPE_FAULT, "Attempt to map zero bytes, size:%zu offset:%lld file:%{public}@", (uint8_t *)&v37, 0x20u);

LABEL_19:
    goto LABEL_20;
  }
  v17 = v16;
  v18 = (char *)mmap(0, v16, self->_protection, 1, objc_msgSend(v6, "fd"), v15);
  if (v18 == (char *)-1)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_21;
    v33 = (void *)MEMORY[0x1E0D01D10];
    objc_msgSend(v6, "attributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "privacyPathname:", v34);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *__error();
    v37 = 138544130;
    v38 = (unint64_t)v14;
    v39 = 1026;
    *(_DWORD *)v40 = v35;
    *(_WORD *)&v40[4] = 2048;
    *(_QWORD *)&v40[6] = v17;
    *(_WORD *)&v40[14] = 2048;
    *(_QWORD *)&v40[16] = v15;
    _os_log_fault_impl(&dword_1A95BD000, v9, OS_LOG_TYPE_FAULT, "Unable to mmap storage file %{public}@ because %{public, darwin.errno}d, size:%zu, offset:%ld", (uint8_t *)&v37, 0x26u);

    goto LABEL_19;
  }
  v19 = v18;
  self->_mappedAddress = v18;
  self->_pageAlignedSize = v17;
  self->_start = &v18[self->_offsetSpace];
  atomic_store(0, &self->_currentWriteOffset);
  if (madvise(v18, v17, self->_advice) < 0)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BMMemoryMapping mapWithFileHandle:fileSize:].cold.2();

  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  v21 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v22 = (void *)MEMORY[0x1E0D01D10];
    objc_msgSend(v6, "attributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "privacyPathname:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = self->_size;
    v26 = self->_offset;
    v37 = 138544131;
    v38 = (unint64_t)v25;
    v39 = 2049;
    *(_QWORD *)v40 = v19;
    *(_WORD *)&v40[8] = 2048;
    *(_QWORD *)&v40[10] = v26;
    *(_WORD *)&v40[18] = 2048;
    *(_QWORD *)&v40[20] = v27;
    v21 = 1;
    _os_log_impl(&dword_1A95BD000, v9, OS_LOG_TYPE_INFO, "Successfully mapped file: %{public}@ address: 0x%{private}llx offset:%llu size:%llu", (uint8_t *)&v37, 0x2Au);

  }
LABEL_22:

  return v21;
}

- (int64_t)offset
{
  return self->_offset;
}

- (BMMemoryMapping)initWithSize:(unint64_t)a3 protection:(int)a4 advice:(int)a5 offset:(int64_t)a6
{
  BMMemoryMapping *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BMMemoryMapping;
  result = -[BMMemoryMapping init](&v11, sel_init);
  if (result)
  {
    result->_protection = a4;
    result->_advice = a5;
    result->_size = a3;
    result->_offset = a6;
    atomic_store(0, &result->_currentWriteOffset);
  }
  return result;
}

- (char)end
{
  return (char *)self->_start + self->_size;
}

- (BOOL)canAtomicallyAccessOffset:(unint64_t)a3
{
  return (a3 & 7) == 0;
}

- (void)writeBytes:(const void *)a3 toOffset:(unint64_t)a4 length:(unint64_t)a5
{
  _BOOL4 v9;

  if (self)
  {
    v9 = -[BMMemoryMapping isWritable](self, "isWritable");
    if (a3)
    {
      if (v9)
      {
        if (-[BMMemoryMapping isValidReadFromOffset:withLength:](self, "isValidReadFromOffset:withLength:", a4, a5))
          memcpy(-[BMMemoryMapping start](self, "start") + a4, a3, a5);
      }
    }
  }
}

- (BOOL)isValidReadFromOffsetV2:(unint64_t)a3 withLength:(unint64_t)a4 currentFrameCount:(unsigned int)a5
{
  unint64_t v7;
  BOOL v8;

  if (self)
  {
    if (self->_mappedAddress)
    {
      v7 = -[BMMemoryMapping size](self, "size") - 16 * a5;
      v8 = a3 + a4 + 24 <= v7;
      if (v7 <= a3)
        v8 = 0;
      LOBYTE(self) = (uint64_t)v7 >= 1 && v8;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (void)dealloc
{
  objc_super v3;

  -[BMMemoryMapping unmap](self, "unmap");
  v3.receiver = self;
  v3.super_class = (Class)BMMemoryMapping;
  -[BMMemoryMapping dealloc](&v3, sel_dealloc);
}

- (void)unmap
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  __error();
  OUTLINED_FUNCTION_4_1();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

- (void)sync
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67240192;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A95BD000, a1, OS_LOG_TYPE_ERROR, "Failed to msync because %{public, darwin.errno}d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_17();
}

- (unint64_t)currentWriteOffset
{
  return atomic_load(&self->_currentWriteOffset);
}

- (uint64_t)setPageAlignedSize:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 56) = a2;
  return result;
}

- (uint64_t)setMappedAddress:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 48) = a2;
  return result;
}

- (uint64_t)setStart:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 24) = a2;
  return result;
}

- (uint64_t)pageAlignedSize
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)mappedAddress
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)offsetSpace
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)isValidWriteToDestinationOffset:(uint64_t)a3 withLength:(uint64_t)a4 bytes:
{
  int v8;

  if (a1 && (v8 = objc_msgSend(a1, "isWritable"), a4) && v8)
    return objc_msgSend(a1, "isValidReadFromOffset:withLength:", a2, a3);
  else
    return 0;
}

- (id)dataAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 makeCopy:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  if (-[BMMemoryMapping isValidReadFromOffset:withLength:](self, "isValidReadFromOffset:withLength:"))
  {
    v9 = -[BMMemoryMapping start](self, "start") + a3;
    if (v5)
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, a4);
    else
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, a4, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218496;
      v13 = a3;
      v14 = 2048;
      v15 = a4;
      v16 = 2048;
      v17 = -[BMMemoryMapping size](self, "size");
      _os_log_error_impl(&dword_1A95BD000, v10, OS_LOG_TYPE_ERROR, "Cannot read data from offset: %lld with length: %lld. Size (%lld) too small", (uint8_t *)&v12, 0x20u);
    }

    return 0;
  }
}

- (unsigned)atomicReadAtOffset:(unint64_t)a3 value:(id *)a4
{
  unint64_t v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;

  if (-[BMMemoryMapping canAtomicallyAccessOffset:](self, "canAtomicallyAccessOffset:"))
  {
    if (-[BMMemoryMapping isValidReadFromOffset:withLength:](self, "isValidReadFromOffset:withLength:", a3, 8))
    {
      v7 = atomic_load((unint64_t *)(-[BMMemoryMapping start](self, "start") + a3));
      a4->var0 = v7;
      return 1;
    }
    else
    {
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[BMMemoryMapping atomicReadAtOffset:value:].cold.1();

      return 0;
    }
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMMemoryMapping atomicReadAtOffset:value:].cold.2(a3, v9, v10, v11, v12, v13, v14, v15);

    return 3;
  }
}

- (BOOL)atomicUpdateOffset:(unint64_t)a3 withValue:(id)a4 shouldReplace:(id)a5
{
  unsigned int (**v8)(id, _QWORD, unint64_t);
  int v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v8 = (unsigned int (**)(id, _QWORD, unint64_t))a5;
  if (!-[BMMemoryMapping canAtomicallyAccessOffset:](self, "canAtomicallyAccessOffset:", a3))
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMMemoryMapping atomicReadAtOffset:value:].cold.2(a3, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_15;
  }
  if (!self
    || !-[BMMemoryMapping isWritable](self, "isWritable")
    || !-[BMMemoryMapping isValidReadFromOffset:withLength:](self, "isValidReadFromOffset:withLength:", a3, 8))
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMMemoryMapping atomicUpdateOffset:withValue:shouldReplace:].cold.1();
LABEL_15:

LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v20 = 0;
  if (-[BMMemoryMapping atomicReadAtOffset:value:](self, "atomicReadAtOffset:value:", a3, &v20) != 1
    || !v8[2](v8, v20, a4.var0))
  {
    goto LABEL_16;
  }
  v19 = v20;
  do
  {
    v9 = -[BMMemoryMapping atomicWriteEightBytes:toOffset:expected:](self, "atomicWriteEightBytes:toOffset:expected:", a4.var0, a3, &v19);
    v10 = v9 == 1;
    if (v9 == 1)
      break;
    v20 = v19;
  }
  while ((((uint64_t (*)(unsigned int (**)(id, _QWORD, unint64_t)))v8[2])(v8) & 1) != 0);
LABEL_17:

  return v10;
}

- (void)updateToMaxOfCurrentWriteOffsetAnd:(unint64_t)a3
{
  unint64_t v3;
  uint64_t *p_size;
  NSObject *v6;
  unint64_t v7;
  unint64_t *p_currentWriteOffset;
  unint64_t v9;

  v3 = a3;
  p_size = (uint64_t *)&self->_size;
  if (self->_size < a3)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMMemoryMapping updateToMaxOfCurrentWriteOffsetAnd:].cold.1(p_size, v3, v6);

    v3 = *p_size;
  }
  v7 = -[BMMemoryMapping currentWriteOffset](self, "currentWriteOffset");
  if (v7 < v3)
  {
    p_currentWriteOffset = &self->_currentWriteOffset;
    do
    {
      while (1)
      {
        v9 = __ldaxr(p_currentWriteOffset);
        if (v9 != v7)
          break;
        if (!__stlxr(v3, p_currentWriteOffset))
          return;
      }
      __clrex();
      v7 = v9;
    }
    while (v9 < v3);
  }
}

- (unint64_t)freeSpace
{
  unint64_t size;

  size = self->_size;
  return size - -[BMMemoryMapping used](self, "used");
}

- (void)currentPosition
{
  char *v3;

  v3 = -[BMMemoryMapping start](self, "start");
  return &v3[-[BMMemoryMapping currentWriteOffset](self, "currentWriteOffset")];
}

- (uint64_t)setSize:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 32) = a2;
  return result;
}

- (uint64_t)setOffset:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 40) = a2;
  return result;
}

- (uint64_t)setOffsetSpace:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 64) = a2;
  return result;
}

- (void)mapWithFileHandle:(uint64_t)a1 fileSize:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  os_log_t v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privacyPathname:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  _os_log_fault_impl(v5, v6, v7, v8, v9, 0x20u);

}

- (void)mapWithFileHandle:fileSize:.cold.2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  __error();
  OUTLINED_FUNCTION_4_1();
  _os_log_fault_impl(v0, v1, v2, v3, v4, 8u);
  OUTLINED_FUNCTION_17();
}

- (void)atomicReadAtOffset:value:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, v0, v1, "Unable to read data at offset: %ld with length: %ld", v2);
  OUTLINED_FUNCTION_17();
}

- (void)atomicReadAtOffset:(uint64_t)a3 value:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1A95BD000, a2, a3, "Cannot atomically access bytes if offset isn't 8 byte aligned. Given offset: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_17();
}

- (void)atomicUpdateOffset:withValue:shouldReplace:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, v0, v1, "Unable to read/write data at offset: %ld with length: %ld", v2);
  OUTLINED_FUNCTION_17();
}

- (void)updateToMaxOfCurrentWriteOffsetAnd:(NSObject *)a3 .cold.1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, a3, (uint64_t)a3, "Attempted to move cursor beyond end of file, offset:%zu size:%zu. Setting to End of File instead", (uint8_t *)&v4);
  OUTLINED_FUNCTION_17();
}

@end
