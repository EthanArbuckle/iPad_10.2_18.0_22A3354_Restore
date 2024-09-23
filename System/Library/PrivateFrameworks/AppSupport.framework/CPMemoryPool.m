@implementation CPMemoryPool

- (CPMemoryPool)initWithLabel:(const char *)a3 slotLength:(unint64_t)a4
{
  CPMemoryPool *v6;
  CPMemoryPool *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CPMemoryPool;
  v6 = -[CPMemoryPool init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    pthread_mutex_init(&v6->_lock, 0);
    v7->_files = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3)
      v8 = a3;
    else
      v8 = "memorypool";
    v7->_label = strdup(v8);
    v7->_slotLength = a4;
  }
  return v7;
}

- (id)nextSlotWithBytes:(const void *)a3 length:(unint64_t)a4
{
  _opaque_pthread_mutex_t *p_lock;
  NSMutableArray *files;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  CPMemoryPoolFile *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  files = self->_files;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](files, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(files);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "nextSlotWithBytes:length:", a3, a4);
        if (v13)
        {
          v15 = (id)v13;
          goto LABEL_14;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](files, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = -[CPMemoryPoolFile initWithLabel:slotCount:slotLength:]([CPMemoryPoolFile alloc], "initWithLabel:slotCount:slotLength:", self->_label, 128, self->_slotLength);
  if (v14)
  {
    -[NSMutableArray addObject:](self->_files, "addObject:", v14);
    v15 = -[CPMemoryPoolFile nextSlotWithBytes:length:](v14, "nextSlotWithBytes:length:", a3, a4);
  }
  else
  {
    v15 = 0;
  }

LABEL_14:
  pthread_mutex_unlock(p_lock);
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);

  free(self->_label);
  v3.receiver = self;
  v3.super_class = (Class)CPMemoryPool;
  -[CPMemoryPool dealloc](&v3, sel_dealloc);
}

- (unint64_t)slotLength
{
  return self->_slotLength;
}

@end
