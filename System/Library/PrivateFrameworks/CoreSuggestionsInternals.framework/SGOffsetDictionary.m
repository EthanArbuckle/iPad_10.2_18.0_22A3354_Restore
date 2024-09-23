@implementation SGOffsetDictionary

- (SGOffsetDictionary)initWithFilehandle:(id)a3 sizeFactor:(unint64_t)a4 keyLength:(int)a5 singleByteOffset:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  SGOffsetDictionary *v11;
  id v12;
  unsigned int v13;
  $540B417C6688EA6D30870DDF6F7BDD26 *v14;
  $540B417C6688EA6D30870DDF6F7BDD26 *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  char v20;
  char *var2;
  id v22;
  uint64_t v23;
  $540B417C6688EA6D30870DDF6F7BDD26 *v24;
  $540B417C6688EA6D30870DDF6F7BDD26 *v25;
  char *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  SEL v36;
  objc_super v37;

  v6 = a6;
  v10 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SGOffsetDictionary;
  v11 = -[SGOffsetDictionary init](&v37, sel_init);
  if (v11)
  {
    v36 = a2;
    objc_msgSend(v10, "seekToFileOffset:", 0);
    v12 = objc_retainAutorelease(v10);
    v13 = bswap32(*(unsigned __int16 *)objc_msgSend(v12, "dataOfLength:", 2)) >> 16;
    v11->_count = v13;
    v14 = ($540B417C6688EA6D30870DDF6F7BDD26 *)malloc_type_malloc(16 * v13, 0x10000408B6DE1C6uLL);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v34);
    }
    v15 = v14;
    if (v11->_count)
    {
      v16 = 0;
      v17 = 0;
      do
      {
        v18 = objc_retainAutorelease(v12);
        v19 = objc_msgSend(v18, "dataOfLength:", 3);
        v20 = *(_BYTE *)(v19 + 2);
        *(_WORD *)v15[v16].var2 = *(_WORD *)v19;
        var2 = v15[v16].var2;
        v15[v16].var2[2] = v20;
        v22 = objc_retainAutorelease(v18);
        if (v6)
          v23 = *(unsigned __int8 *)objc_msgSend(v22, "dataOfLength:", 1);
        else
          v23 = bswap32(*(unsigned __int16 *)objc_msgSend(v22, "dataOfLength:", 2)) >> 16;
        v24 = &v15[v16];
        v24->var0 = v11->_totalPayloadSize;
        v24->var1 = v23;
        v11->_totalPayloadSize += v23 * a4;
        if (v16 * 16)
        {
          v25 = &v15[(v17 - 1)];
          v27 = *(unsigned __int16 *)v25->var2;
          v26 = v25->var2;
          v28 = bswap32(v27) >> 16;
          v29 = bswap32(*(unsigned __int16 *)var2);
          if (v28 == HIWORD(v29))
          {
            v30 = v26[2] - v15[v16].var2[2];
          }
          else if (v28 < HIWORD(v29))
          {
            v30 = -1;
          }
          else
          {
            v30 = 1;
          }
          if ((v30 & 0x80000000) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objCStringForCarrierKey((uint64_t)v15[v16 - 1].var2);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objCStringForCarrierKey((uint64_t)var2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v36, v11, CFSTR("SGFlightData.m"), 96, CFSTR("Expected keys to be unique and in ascending order. That constraint was violated by this sequence of keys:\n%d: %@\n%d: %@"), v17 - 1, v31, v17, v32);

          }
        }
        ++v17;
        ++v16;
      }
      while (v17 < v11->_count);
    }
    v11->_carrierEntries = v15;
    v11->_payloadOffset = objc_msgSend(v12, "offsetInFile");
    v11->_sizeFactor = a4;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_carrierEntries);
  v3.receiver = self;
  v3.super_class = (Class)SGOffsetDictionary;
  -[SGOffsetDictionary dealloc](&v3, sel_dealloc);
}

- ($540B417C6688EA6D30870DDF6F7BDD26)carrierEntryForKey:(const char *)a3
{
  $540B417C6688EA6D30870DDF6F7BDD26 *result;
  BOOL v6;
  $540B417C6688EA6D30870DDF6F7BDD26 *carrierEntries;
  size_t count;
  _QWORD __compar[5];

  if (strnlen(a3, 3uLL) <= 1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("KeyTooShort"), CFSTR("The key was too short."));
  result = self->_mruCarrierEntry;
  if (!result
    || (*(unsigned __int16 *)result->var2 == *(unsigned __int16 *)a3
      ? (v6 = result->var2[2] == *((unsigned __int8 *)a3 + 2))
      : (v6 = 0),
        !v6))
  {
    carrierEntries = self->_carrierEntries;
    count = self->_count;
    __compar[0] = MEMORY[0x1E0C809B0];
    __compar[1] = 3221225472;
    __compar[2] = __41__SGOffsetDictionary_carrierEntryForKey___block_invoke;
    __compar[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
    __compar[4] = a3;
    return ($540B417C6688EA6D30870DDF6F7BDD26 *)bsearch_b(a3, carrierEntries, count, 0x10uLL, __compar);
  }
  return result;
}

- (unint64_t)payloadLengthForKey:(const char *)a3
{
  SGOffsetDictionary *v4;
  unint64_t result;

  v4 = objc_retainAutorelease(self);
  result = -[SGOffsetDictionary carrierEntryForKey:](v4, "carrierEntryForKey:", a3);
  if (result)
    return v4->_sizeFactor * *(unsigned __int16 *)(result + 8);
  return result;
}

- (unint64_t)seekLocationForKey:(const char *)a3
{
  SGOffsetDictionary *v4;
  unint64_t result;

  v4 = objc_retainAutorelease(self);
  result = -[SGOffsetDictionary carrierEntryForKey:](v4, "carrierEntryForKey:", a3);
  if (result)
    return *(_QWORD *)result + v4->_payloadOffset;
  return result;
}

- (int)payloadCountForKey:(const char *)a3
{
  $540B417C6688EA6D30870DDF6F7BDD26 *v3;

  v3 = -[SGOffsetDictionary carrierEntryForKey:](objc_retainAutorelease(self), "carrierEntryForKey:", a3);
  if (v3)
    LODWORD(v3) = v3->var1;
  return (int)v3;
}

- (id)stringValueForKey:(const char *)a3 fromFile:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  SGOffsetDictionary *v9;
  unsigned __int16 *v10;

  v6 = a4;
  v7 = -[SGOffsetDictionary seekLocationForKey:](self, "seekLocationForKey:", a3);
  if (v7)
  {
    v8 = v7;
    v9 = objc_retainAutorelease(self);
    v10 = -[SGOffsetDictionary carrierEntryForKey:](v9, "carrierEntryForKey:", a3);
    if (v10)
    {
      objc_msgSend(v6, "seekToFileOffset:", v8);
      readUtf8String(v6, v9->_sizeFactor * v10[4]);
      v10 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)fullMappingFromFile:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  $540B417C6688EA6D30870DDF6F7BDD26 v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_count);
  if (self->_count)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v11 = ($540B417C6688EA6D30870DDF6F7BDD26)0;
      v11 = self->_carrierEntries[v6];
      objCStringForCarrierKey((uint64_t)v11.var2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "seekToFileOffset:", v11.var0 + self->_payloadOffset);
      readUtf8String(v4, self->_sizeFactor * v11.var1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

      ++v7;
      ++v6;
    }
    while (v7 < self->_count);
  }

  return v5;
}

uint64_t __41__SGOffsetDictionary_carrierEntryForKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int16 *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = *(unsigned __int16 **)(a1 + 32);
  v4 = bswap32(*v3) >> 16;
  v5 = bswap32(*(unsigned __int16 *)(a3 + 10));
  if (v4 == HIWORD(v5))
    return *((unsigned __int8 *)v3 + 2) - *(unsigned __int8 *)(a3 + 12);
  if (v4 < HIWORD(v5))
    return 0xFFFFFFFFLL;
  return 1;
}

@end
