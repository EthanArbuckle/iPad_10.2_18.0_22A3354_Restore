@implementation MTLDebugIndirectCommandBuffer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugIndirectCommandBuffer;
  -[MTLToolsResource dealloc](&v3, sel_dealloc);
}

- (NSMutableArray)optimizedRangeList
{
  return self->_optimizedRangeList;
}

- (MTLIndirectCommandBufferDescriptor)descriptor
{
  return self->_desc;
}

- (MTLDebugIndirectCommandBuffer)initWithIndirectCommandBuffer:(id)a3 device:(id)a4 descriptor:(id)a5 maxCommandCount:(unint64_t)a6 options:(unint64_t)a7
{
  MTLDebugIndirectCommandBuffer *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTLDebugIndirectCommandBuffer;
  v11 = -[MTLToolsResource initWithBaseObject:parent:](&v15, sel_initWithBaseObject_parent_, a3, a4);
  if (v11)
  {
    v12 = (NSMutableArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11->_optimizedRangeList = v12;
    v13 = v12;
    v11->_desc = (MTLIndirectCommandBufferDescriptor *)objc_msgSend(a5, "copy");
    v11->_maxCommandCount = a6;
    v11->_iCB = (MTLIndirectCommandBuffer *)a3;
    v11->super.super._options = a7;
    atomic_store(0, (unsigned int *)&v11->_purgeableStateToken);
    v11->_purgeableStateHasBeenSet = 0;
    v11->_isRender = (-[MTLIndirectCommandBufferDescriptor commandTypes](v11->_desc, "commandTypes") & 0x18F) != 0;
  }
  return v11;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  MTLDebugIndirectRenderCommand *v8;
  MTLIndirectCommandType v10;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode") == 2)
    _MTLMessageContextPush_();
  if (!self->_isRender)
  {
    v10 = -[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v10), "size") <= a3)
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "size");
    _MTLMessageContextPush_();
  }
  v5 = _MTLMessageContextEnd();
  v6 = (void *)MEMORY[0x22E309364](v5);
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectRenderCommandAtIndex:", a3);
  if (v7)
    v8 = -[MTLDebugIndirectRenderCommand initWithBaseObject:descriptor:indexCount:indirectCommandBuffer:]([MTLDebugIndirectRenderCommand alloc], "initWithBaseObject:descriptor:indexCount:indirectCommandBuffer:", v7, self->_desc, a3, self);
  else
    v8 = 0;
  objc_autoreleasePoolPop(v6);
  return v8;
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  MTLDebugIndirectComputeCommand *v8;
  MTLIndirectCommandType v10;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode") == 2)
    _MTLMessageContextPush_();
  if (self->_isRender)
  {
    v10 = -[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v10), "size") <= a3)
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "size");
    _MTLMessageContextPush_();
  }
  v5 = _MTLMessageContextEnd();
  v6 = (void *)MEMORY[0x22E309364](v5);
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectComputeCommandAtIndex:", a3);
  if (v7)
    v8 = -[MTLDebugIndirectComputeCommand initWithBaseObject:descriptor:indexCount:indirectCommandBuffer:]([MTLDebugIndirectComputeCommand alloc], "initWithBaseObject:descriptor:indexCount:indirectCommandBuffer:", v7, self->_desc, a3, self);
  else
    v8 = 0;
  objc_autoreleasePoolPop(v6);
  return v8;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap"))
    _MTLMessageContextPush_();
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->_purgeableStateToken))
        _MTLMessageContextPush_();
    }
    self->_purgeableStateHasBeenSet = 1;
  }
  _MTLMessageContextEnd();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (void)resetWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSRange v6;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  objc_super v11;
  NSRange v12;
  NSRange v13;

  length = a3.length;
  location = a3.location;
  v13.length = -[MTLToolsIndirectCommandBuffer size](self, "size");
  v12.location = location;
  v12.length = length;
  v13.location = 0;
  v6 = NSIntersectionRange(v12, v13);
  if (v6.location != location || v6.length != length)
  {
    v9 = length;
    v10 = -[MTLToolsIndirectCommandBuffer size](self, "size");
    v8 = location;
    MTLReportFailure();
  }
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugIndirectCommandBuffer;
  -[MTLToolsIndirectCommandBuffer resetWithRange:](&v11, sel_resetWithRange_, location, length, v8, v9, v10);
}

- (void)lockPurgeableState
{
  atomic<int> *p_purgeableStateToken;
  unsigned int v3;

  p_purgeableStateToken = &self->_purgeableStateToken;
  do
    v3 = __ldaxr((unsigned int *)p_purgeableStateToken);
  while (__stlxr(v3 + 1, (unsigned int *)p_purgeableStateToken));
}

- (void)unlockPurgeableState
{
  atomic<int> *p_purgeableStateToken;
  unsigned int v3;

  p_purgeableStateToken = &self->_purgeableStateToken;
  do
    v3 = __ldaxr((unsigned int *)p_purgeableStateToken);
  while (__stlxr(v3 - 1, (unsigned int *)p_purgeableStateToken));
}

- (BOOL)purgeableStateValidForRendering
{
  return !self->_purgeableStateHasBeenSet
      || -[MTLDebugIndirectCommandBuffer setPurgeableState:](self, "setPurgeableState:", 1) == 2;
}

@end
