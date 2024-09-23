@implementation GKList

- (GKList)init
{
  return -[GKList initWithSize:](self, "initWithSize:", 20);
}

- (GKList)initWithSize:(unint64_t)a3
{
  GKList *v4;
  size_t v5;
  unsigned int *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v10;
  pthread_mutexattr_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)GKList;
  v4 = -[GKList init](&v10, sel_init);
  if (v4)
  {
    if (a3)
      v5 = a3;
    else
      v5 = 20;
    v4->_count = 0;
    v4->_size = v5;
    v6 = (unsigned int *)malloc_type_calloc(v5, 4uLL, 0x100004052888210uLL);
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
          -[GKList initWithSize:].cold.1(v7, v8);
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_items);
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)GKList;
  -[GKList dealloc](&v3, sel_dealloc);
}

- (BOOL)hasID:(unsigned int)a3
{
  unint64_t count;
  unsigned int *items;
  BOOL v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;

  -[GKList lock](self, "lock");
  count = self->_count;
  if (count)
  {
    items = self->_items;
    if (*items == a3)
    {
      v7 = 1;
    }
    else
    {
      v8 = 1;
      do
      {
        v9 = v8;
        if (count == v8)
          break;
        v10 = items[v8++];
      }
      while (v10 != a3);
      v7 = v9 < count;
    }
  }
  else
  {
    v7 = 0;
  }
  -[GKList unlock](self, "unlock");
  return v7;
}

- (void)addID:(unsigned int)a3
{
  unint64_t count;
  unsigned int *items;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  GKList *v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[GKList lock](self, "lock");
  count = self->_count;
  if (count)
  {
    items = self->_items;
    v7 = self->_count;
    do
    {
      v8 = *items++;
      if (v8 == a3)
        goto LABEL_10;
    }
    while (--v7);
  }
  if (count != self->_size)
  {
    v10 = self->_items;
    goto LABEL_9;
  }
  v9 = count + 20;
  v10 = (unsigned int *)malloc_type_realloc(self->_items, 4 * (count + 20), 0x100004052888210uLL);
  if (v10)
  {
    self->_items = v10;
    self->_size = v9;
    count = self->_count;
LABEL_9:
    self->_count = count + 1;
    v10[count] = a3;
LABEL_10:
    -[GKList unlock](self, "unlock");
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      v13 = *__error();
      v14 = 136316418;
      v15 = v11;
      v16 = 2080;
      v17 = "-[GKList addID:]";
      v18 = 1024;
      v19 = 281;
      v20 = 2048;
      v21 = self;
      v22 = 1024;
      v23 = a3;
      v24 = 1024;
      v25 = v13;
      _os_log_error_impl(&dword_215C5C000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d GKList[%p] addID:[%d] realloc error %d", (uint8_t *)&v14, 0x32u);
    }
  }
  -[GKList unlock](self, "unlock");
}

- (void)copyItemsInto:(id)a3
{
  unint64_t v5;

  -[GKList lock](self, "lock");
  if (self->_count)
  {
    v5 = 0;
    do
      objc_msgSend(a3, "addID:", self->_items[v5++]);
    while (v5 < self->_count);
  }
  -[GKList unlock](self, "unlock");
}

- (void)addIDsFromList:(id)a3
{
  objc_msgSend(a3, "copyItemsInto:", self);
}

- (void)removeID:(unsigned int)a3
{
  unint64_t count;
  unint64_t v6;
  unsigned int *items;

  -[GKList lock](self, "lock");
  count = self->_count;
  if (count)
  {
    v6 = 0;
    items = self->_items;
    do
    {
      if (items[v6] == a3)
      {
        self->_count = --count;
        if (v6 < count)
          items[v6] = items[count];
      }
      ++v6;
    }
    while (v6 < count);
  }
  -[GKList unlock](self, "unlock");
}

- (void)removeAllIDs
{
  -[GKList lock](self, "lock");
  self->_count = 0;
  -[GKList unlock](self, "unlock");
}

- (id)allMatchingObjectsFromTable:(id)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_count);
  if (v5 && self->_count)
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(a3, "objectForKey:", self->_items[v6]);
      if (v7)
        objc_msgSend(v5, "addObject:", v7);
      ++v6;
    }
    while (v6 < self->_count);
  }
  return v5;
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
  OUTLINED_FUNCTION_11(&dword_215C5C000, v0, v1, " [%s] %s:%d GKList[%p] lock error: %d", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_11(&dword_215C5C000, v0, v1, " [%s] %s:%d GKList[%p] unlock error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_20();
}

- (void)print
{
  FILE **v3;
  unint64_t v4;

  -[GKList lock](self, "lock");
  v3 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "GKList[%p] (%lu/%lu): {\n", self, self->_count, self->_size);
  if (self->_count)
  {
    v4 = 0;
    do
      fprintf(*v3, "\t%d\n", self->_items[v4++]);
    while (v4 < self->_count);
  }
  fwrite("}\n", 2uLL, 1uLL, *v3);
  -[GKList unlock](self, "unlock");
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
  v7 = 234;
  v8 = v3;
  v9 = v4;
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, a2, v5, " [%s] %s:%d GKList init malloc error %d", v6);
  OUTLINED_FUNCTION_2();
}

@end
