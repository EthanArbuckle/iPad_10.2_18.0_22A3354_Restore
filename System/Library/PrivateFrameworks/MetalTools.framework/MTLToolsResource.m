@implementation MTLToolsResource

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (unint64_t)cpuCacheMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "cpuCacheMode");
}

- (unint64_t)storageMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode");
}

- (unint64_t)hazardTrackingMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "hazardTrackingMode");
}

- (unint64_t)resourceOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceOptions");
}

- (unint64_t)unfilteredResourceOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "unfilteredResourceOptions");
}

- (BOOL)isAliasable
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isAliasable");
}

- (void)makeAliasable
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "makeAliasable");
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (unint64_t)heapOffset
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapOffset");
}

- (BOOL)isPurgeable
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isPurgeable");
}

- (int)responsibleProcess
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "responsibleProcess");
}

- (void)setResponsibleProcess:(int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setResponsibleProcess:", *(_QWORD *)&a3);
}

- (unint64_t)protectionOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "protectionOptions");
}

- (unint64_t)allocationID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allocationID");
}

- (MTLToolsResource)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLToolsResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLToolsResource;
  v5 = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_heap = (MTLToolsHeap *)(id)objc_msgSend(a4, "heap");
  }
  return v5;
}

- (MTLToolsResource)initWithBaseObject:(id)a3 parent:(id)a4 heap:(id)a5
{
  MTLToolsResource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLToolsResource;
  v6 = -[MTLToolsObject initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  if (v6)
    v6->_heap = (MTLToolsHeap *)a5;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MTLToolsHeap notifyResourceReleasing:](self->_heap, "notifyResourceReleasing:", self);

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsResource;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (BOOL)doesAliasResource:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "doesAliasResource:", objc_msgSend(a3, "baseObject"));
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  char *v6;
  const void **v7;
  _QWORD *v8;
  unint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = (char *)v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v7 = a3;
    v8 = (_QWORD *)((char *)v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    v9 = a4;
    do
    {
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "doesAliasAllResources:count:", v6, a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  char *v6;
  const void **v7;
  _QWORD *v8;
  unint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = (char *)v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v7 = a3;
    v8 = (_QWORD *)((char *)v12 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    v9 = a4;
    do
    {
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "doesAliasAnyResources:count:", v6, a4);
}

- (MTLHeap)heap
{
  return (MTLHeap *)self->_heap;
}

- (BOOL)isComplete
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isComplete");
}

- (void)waitUntilComplete
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilComplete");
}

- (void)validateCPUReadable
{
  uint64_t v2;

  v2 = self->_options >> 4;
  if (v2 == 2 || v2 == 3)
    MTLReportFailure();
}

- (void)validateCPUWriteable
{
  uint64_t v2;

  v2 = self->_options >> 4;
  if (v2 == 2 || v2 == 3)
    MTLReportFailure();
}

- (unint64_t)allocatedSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allocatedSize");
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setOwnerWithIdentity:", *(_QWORD *)&a3);
}

- (unint64_t)options
{
  return self->_options;
}

@end
