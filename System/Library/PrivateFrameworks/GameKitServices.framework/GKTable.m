@implementation GKTable

- (GKTable)init
{
  return -[GKTable initWithSize:](self, "initWithSize:", 20);
}

- (GKTable)initWithSize:(unint64_t)a3
{
  GKTable *v4;
  size_t v5;
  _gktableitem *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v10;
  pthread_mutexattr_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)GKTable;
  v4 = -[GKTable init](&v10, sel_init);
  if (v4)
  {
    if (a3)
      v5 = a3;
    else
      v5 = 20;
    v4->_count = 0;
    v4->_size = v5;
    v6 = (_gktableitem *)malloc_type_calloc(v5, 0x20uLL, 0x10800406DC01D99uLL);
    v4->_items = v6;
    if (v6)
    {
      v11.__sig = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)v11.__opaque = 0xAAAAAAAAAAAAAAAALL;
      pthread_mutexattr_init(&v11);
      pthread_mutexattr_settype(&v11, 2);
      pthread_mutex_init(&v4->_lock, &v11);
      pthread_mutexattr_destroy(&v11);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKTable initWithSize:].cold.1(v7, v8);
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[GKTable removeAllObjects](self, "removeAllObjects");
  free(self->_items);
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)GKTable;
  -[GKTable dealloc](&v3, sel_dealloc);
}

- (id)objectForKey:(unsigned int)a3
{
  unint64_t count;
  uint64_t v6;
  id v7;
  double v8;
  _gktableitem *v9;

  -[GKTable lock](self, "lock");
  count = self->_count;
  if (count)
  {
    v6 = 0;
    while (self->_items[v6].var0 != a3)
    {
      ++v6;
      if (!--count)
        goto LABEL_5;
    }
    v8 = micro();
    v9 = &self->_items[v6];
    v9->var3 = v8;
    v7 = v9->var1;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }
  -[GKTable unlock](self, "unlock");
  return v7;
}

- (id)allObjects
{
  void *v3;
  unint64_t v4;
  uint64_t v5;

  -[GKTable lock](self, "lock");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_count);
  if (v3 && self->_count)
  {
    v4 = 0;
    v5 = 8;
    do
    {
      objc_msgSend(v3, "addObject:", *(_QWORD *)((char *)&self->_items->var0 + v5));
      ++v4;
      v5 += 32;
    }
    while (v4 < self->_count);
  }
  -[GKTable unlock](self, "unlock");
  return v3;
}

- (void)setObject:(id)a3 forKey:(unsigned int)a4
{
  unint64_t count;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _gktableitem *items;
  id v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  GKTable *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[GKTable lock](self, "lock");
  count = self->_count;
  if (!count)
  {
    LODWORD(v10) = 0;
LABEL_7:
    if (count == self->_size)
    {
      v11 = count + 20;
      items = (_gktableitem *)malloc_type_realloc(self->_items, 32 * (count + 20), 0x10800406DC01D99uLL);
      if (!items)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v22 = *__error();
            v23 = 136316674;
            v24 = v20;
            v25 = 2080;
            v26 = "-[GKTable setObject:forKey:]";
            v27 = 1024;
            v28 = 482;
            v29 = 2048;
            v30 = self;
            v31 = 2112;
            v32 = a3;
            v33 = 1024;
            v34 = a4;
            v35 = 1024;
            LODWORD(v36) = v22;
            _os_log_error_impl(&dword_215C5C000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d GKTable[%p] setObject:[%@]forKey:[%d] realloc error %d", (uint8_t *)&v23, 0x3Cu);
          }
        }
        goto LABEL_20;
      }
      self->_items = items;
      self->_size = v11;
      count = self->_count;
    }
    else
    {
      items = self->_items;
    }
    items[count].var0 = a4;
    *(int64x2_t *)&self->_items[self->_count].var2 = vdupq_lane_s64(COERCE__INT64(micro()), 0);
    v13 = a3;
    v14 = self->_count;
    self->_items[v14].var1 = v13;
    self->_count = v14 + 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136316674;
        v24 = v15;
        v25 = 2080;
        v26 = "-[GKTable setObject:forKey:]";
        v27 = 1024;
        v28 = 493;
        v29 = 2048;
        v30 = self;
        v31 = 2112;
        v32 = a3;
        v33 = 1024;
        v34 = a4;
        v35 = 1024;
        LODWORD(v36) = v10;
        _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKTable[%p] setObject:[%@] forKey:[%d] @%d", (uint8_t *)&v23, 0x3Cu);
      }
    }
    goto LABEL_20;
  }
  v8 = 0;
  v9 = 8;
  while (*(_DWORD *)((char *)self->_items + v9 - 8) != a4)
  {
    ++v8;
    v9 += 32;
    if (count == v8)
    {
      v10 = self->_count;
      goto LABEL_7;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)((char *)&self->_items->var0 + v9);
      v23 = 136316930;
      v24 = v17;
      v25 = 2080;
      v26 = "-[GKTable setObject:forKey:]";
      v27 = 1024;
      v28 = 466;
      v29 = 2048;
      v30 = self;
      v31 = 2112;
      v32 = a3;
      v33 = 1024;
      v34 = a4;
      v35 = 2112;
      v36 = v19;
      v37 = 1024;
      v38 = v8;
      _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKTable[%p] setObject:[%@] forKey:[%d] replacing [%@] @%d", (uint8_t *)&v23, 0x46u);
    }
  }
  if (objc_msgSend(*(id *)((char *)&self->_items->var0 + v9), "conformsToProtocol:", &unk_254E019C0))
    objc_msgSend(*(id *)((char *)&self->_items->var0 + v9), "cleanupForGKTable:", self);

  *(int64x2_t *)((char *)&self->_items->var1 + v9) = vdupq_lane_s64(COERCE__INT64(micro()), 0);
  *(_QWORD *)((char *)&self->_items->var0 + v9) = a3;
LABEL_20:
  -[GKTable unlock](self, "unlock");
}

- (void)touchObject:(id)a3
{
  uint64_t v5;
  unint64_t v6;

  -[GKTable lock](self, "lock");
  if (self->_count)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (objc_msgSend(self->_items[v5].var1, "isEqual:", a3))
        *(int64x2_t *)&self->_items[v5].var2 = vdupq_lane_s64(COERCE__INT64(micro()), 0);
      ++v6;
      ++v5;
    }
    while (v6 < self->_count);
  }
  -[GKTable unlock](self, "unlock");
}

- (void)touchObjectForKey:(unsigned int)a3
{
  unint64_t count;
  uint64_t v6;
  unint64_t v7;
  _gktableitem *items;
  uint64_t v9;

  -[GKTable lock](self, "lock");
  count = self->_count;
  if (count)
  {
    v6 = 0;
    v7 = 0;
    items = self->_items;
    do
    {
      if (items[v6].var0 == a3)
      {
        *(double *)&v9 = micro();
        items = self->_items;
        count = self->_count;
        *(int64x2_t *)&items[v6].var2 = vdupq_lane_s64(v9, 0);
      }
      ++v7;
      ++v6;
    }
    while (v7 < count);
  }
  -[GKTable unlock](self, "unlock");
}

- (void)removeObjectForKey:(unsigned int)a3
{
  __int128 v5;
  unint64_t count;
  uint64_t v7;
  unint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  id var1;
  _gktableitem *items;
  _gktableitem *v14;
  _gktableitem *v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  GKTable *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[GKTable lock](self, "lock");
  count = self->_count;
  if (count)
  {
    v7 = 0;
    v8 = 0;
    v9 = (os_log_t *)MEMORY[0x24BDFDC28];
    *(_QWORD *)&v5 = 136316674;
    v17 = v5;
    do
    {
      if (self->_items[v7].var0 == a3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            var1 = self->_items[v7].var1;
            *(_DWORD *)buf = v17;
            v19 = v10;
            v20 = 2080;
            v21 = "-[GKTable removeObjectForKey:]";
            v22 = 1024;
            v23 = 524;
            v24 = 2048;
            v25 = self;
            v26 = 2112;
            v27 = var1;
            v28 = 1024;
            v29 = a3;
            v30 = 1024;
            v31 = v8;
            _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKTable[%p] removeObject:[%@] forKey:[%d] @%d", buf, 0x3Cu);
          }
        }
        if (objc_msgSend(self->_items[v7].var1, "conformsToProtocol:", &unk_254E019C0, v17))
          objc_msgSend(self->_items[v7].var1, "cleanupForGKTable:", self);

        count = self->_count - 1;
        self->_count = count;
        if (v8 < count)
        {
          items = self->_items;
          v14 = &items[v7];
          v15 = &items[count];
          v16 = *(_OWORD *)&v15->var2;
          *(_OWORD *)&v14->var0 = *(_OWORD *)&v15->var0;
          *(_OWORD *)&v14->var2 = v16;
          count = self->_count;
        }
      }
      ++v8;
      ++v7;
    }
    while (v8 < count);
  }
  -[GKTable unlock](self, "unlock", v17);
}

- (void)removeAllObjects
{
  unint64_t v3;
  uint64_t v4;

  -[GKTable lock](self, "lock");
  if (self->_count)
  {
    v3 = 0;
    v4 = 8;
    do
    {
      if (objc_msgSend(*(id *)((char *)&self->_items->var0 + v4), "conformsToProtocol:", &unk_254E019C0))
        objc_msgSend(*(id *)((char *)&self->_items->var0 + v4), "cleanupForGKTable:", self);

      ++v3;
      v4 += 32;
    }
    while (v3 < self->_count);
  }
  self->_count = 0;
  -[GKTable unlock](self, "unlock");
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
  unint64_t v5;
  uint64_t v6;

  -[GKTable lock](self, "lock");
  if (self->_count)
  {
    v5 = 0;
    v6 = 8;
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)((char *)&self->_items->var0 + v6), "performSelector:", a3);
      ++v5;
      v6 += 32;
    }
    while (v5 < self->_count);
  }
  -[GKTable unlock](self, "unlock");
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
  unint64_t v7;
  uint64_t v8;

  -[GKTable lock](self, "lock");
  if (self->_count)
  {
    v7 = 0;
    v8 = 8;
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)((char *)&self->_items->var0 + v8), "performSelector:withObject:", a3, a4);
      ++v7;
      v8 += 32;
    }
    while (v7 < self->_count);
  }
  -[GKTable unlock](self, "unlock");
}

- (void)lock
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_215C5C000, v0, v1, " [%s] %s:%d GKTable[%p] lock error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_20();
}

- (void)unlock
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_215C5C000, v0, v1, " [%s] %s:%d GKTable[%p] unlock error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_20();
}

- (void)print
{
  id v3;
  double v4;
  FILE **v5;
  uint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v4 = micro();
  -[GKTable lock](self, "lock");
  v5 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "GKTable[%x] (%lu/%lu): {\n", (_DWORD)self, self->_count, self->_size);
  if (self->_count)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      fprintf(*v5, "\t%d => [%s] (Q:-%.3lf, U:-%.3lf)\n", self->_items[v6].var0, (const char *)objc_msgSend((id)objc_msgSend(self->_items[v6].var1, "description"), "UTF8String"), v4 - self->_items[v6].var3, v4 - self->_items[v6].var2);
      ++v7;
      ++v6;
    }
    while (v7 < self->_count);
  }
  fwrite("}\n", 2uLL, 1uLL, *v5);
  -[GKTable unlock](self, "unlock");
  objc_msgSend(v3, "drain");
}

- (unint64_t)count
{
  return self->_count;
}

- (void)initWithSize:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  __int16 v3;
  int v4;
  uint64_t v5;
  uint8_t v6[24];
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  __error();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  v7 = 412;
  v8 = v3;
  v9 = v4;
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, a2, v5, " [%s] %s:%d GKTable init malloc error %d", v6);
  OUTLINED_FUNCTION_2();
}

@end
