@implementation SCNFixedSizePage

- (id)newSubBufferForAllocator:(id)a3
{
  SCNMTLBufferAllocatorSubBuffer *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = -[SCNMTLBufferAllocatorSubBuffer initWithPage:allocator:]([SCNMTLBufferAllocatorSubBuffer alloc], "initWithPage:allocator:", self, a3);
  -[SCNMTLBuffer setBuffer:](v4, "setBuffer:", self->_buffer);
  -[SCNMTLBuffer setOffset:](v4, "setOffset:", -[SCNFixedSizePage _allocateElement](self, "_allocateElement"));
  if (-[SCNMTLBuffer offset](v4, "offset") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SCNFixedSizePage newSubBufferForAllocator:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  return v4;
}

- (unint64_t)_allocateElement
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!-[NSMutableIndexSet count](self->_freeIndices, "count"))
  {
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[SCNFixedSizePage _allocateElement].cold.2(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSMutableIndexSet count](self->_freeIndices, "count"))
  {
    v12 = -[NSMutableIndexSet firstIndex](self->_freeIndices, "firstIndex");
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[SCNFixedSizePage _allocateElement].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    -[NSMutableIndexSet removeIndex:](self->_freeIndices, "removeIndex:", v12);
    return self->_elementSize * v12;
  }
  return v11;
}

- (BOOL)hasFreeElementsLeft
{
  return -[NSMutableIndexSet count](self->_freeIndices, "count") != 0;
}

- (SCNFixedSizePage)initWithBuffer:(id)a3 elementSize:(unint64_t)a4
{
  SCNFixedSizePage *v6;
  unint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNFixedSizePage;
  v6 = -[SCNFixedSizePage init](&v10, sel_init);
  v7 = objc_msgSend(a3, "length") / a4;
  v6->_buffer = (MTLBuffer *)a3;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, v7);
  v6->_elementSize = a4;
  v6->_freeIndices = (NSMutableIndexSet *)v8;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNFixedSizePage;
  -[SCNFixedSizePage dealloc](&v3, sel_dealloc);
}

- (BOOL)isFull
{
  return -[NSMutableIndexSet count](self->_freeIndices, "count") == 0;
}

- (void)deallocateElementAtOffset:(unint64_t)a3
{
  unint64_t elementSize;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  elementSize = self->_elementSize;
  v5 = a3 / elementSize;
  if (a3 % elementSize)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[SCNFixedSizePage deallocateElementAtOffset:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  -[NSMutableIndexSet addIndex:](self->_freeIndices, "addIndex:", v5);
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)_allocateElement
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Internal consistency error – no free index", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deallocateElementAtOffset:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. offset should be exactly equal to size", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)newSubBufferForAllocator:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. should have some index free", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
