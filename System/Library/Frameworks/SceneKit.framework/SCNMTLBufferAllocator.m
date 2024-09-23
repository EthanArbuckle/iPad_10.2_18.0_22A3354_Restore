@implementation SCNMTLBufferAllocator

- (id)newSubBufferWithBytes:(const void *)a3 length:(unint64_t)a4 renderContext:(id)a5
{
  uint64_t *p_elementSize;
  NSObject *v10;
  id v11;
  void *v12;

  p_elementSize = (uint64_t *)&self->_elementSize;
  if (self->_elementSize < a4)
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[SCNMTLBufferAllocator newSubBufferWithBytes:length:renderContext:].cold.1(a4, p_elementSize, v10);
  }
  v11 = -[SCNMTLBufferAllocator _newSubBuffer](self, "_newSubBuffer");
  v12 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", a3, a4, 1);
  objc_msgSend(*(id *)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)a5), "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v12, 0, objc_msgSend(v11, "buffer"), objc_msgSend(v11, "offset"), a4);

  return v11;
}

- (id)_newSubBuffer
{
  os_unfair_lock_s *p_allocatorLock;
  NSMutableArray *pages;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  SCNFixedSizePage *v9;
  void *v10;
  SCNFixedSizePage *currentAllocatorPage;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_allocatorLock = &self->_allocatorLock;
  os_unfair_lock_lock(&self->_allocatorLock);
  if (!-[SCNFixedSizePage hasFreeElementsLeft](self->_currentAllocatorPage, "hasFreeElementsLeft"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    pages = self->_pages;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pages, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(pages);
          v9 = *(SCNFixedSizePage **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (-[SCNFixedSizePage hasFreeElementsLeft](v9, "hasFreeElementsLeft"))
          {
            self->_currentAllocatorPage = v9;
            currentAllocatorPage = v9;
            goto LABEL_13;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pages, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", self->_bufferSize, 32);
    self->_currentAllocatorPage = -[SCNFixedSizePage initWithBuffer:elementSize:]([SCNFixedSizePage alloc], "initWithBuffer:elementSize:", v10, self->_elementSize);

    -[NSMutableArray addObject:](self->_pages, "addObject:", self->_currentAllocatorPage);
  }
  currentAllocatorPage = self->_currentAllocatorPage;
LABEL_13:
  v12 = -[SCNFixedSizePage newSubBufferForAllocator:](currentAllocatorPage, "newSubBufferForAllocator:", self);
  os_unfair_lock_unlock(p_allocatorLock);
  return v12;
}

- (SCNMTLBufferAllocator)initWithDevice:(id)a3 fixedSizeElement:(unint64_t)a4 buffersize:(unint64_t)a5 name:(id)a6
{
  SCNMTLBufferAllocator *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCNMTLBufferAllocator;
  v10 = -[SCNMTLBufferAllocator init](&v15, sel_init);
  v10->_device = (MTLDevice *)a3;
  v11 = objc_msgSend(a6, "copy");
  v12 = (a4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = a5 / a4;
  if (a4 > a5)
    v13 = 100;
  v10->_elementSize = v12;
  v10->_name = (NSString *)v11;
  v10->_bufferSize = v13 * v12;
  v10->_pages = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  v10->_allocatorLock._os_unfair_lock_opaque = 0;
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLBufferAllocator;
  -[SCNMTLBufferAllocator dealloc](&v3, sel_dealloc);
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

- (void)newSubBufferWithBytes:(int)a1 length:(uint64_t *)a2 renderContext:(os_log_t)log .cold.1(int a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315650;
  v5 = "length <= _elementSize";
  v6 = 1024;
  v7 = a1;
  v8 = 1024;
  v9 = v3;
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. subBuffer size overflow %d > %d", (uint8_t *)&v4, 0x18u);
  OUTLINED_FUNCTION_1();
}

@end
