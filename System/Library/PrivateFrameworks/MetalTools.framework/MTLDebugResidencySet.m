@implementation MTLDebugResidencySet

- (MTLDebugResidencySet)initWithResidencySet:(id)a3 device:(id)a4
{
  MTLDebugResidencySet *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
  if (result)
    atomic_store(0, &result->_accessStatus.__a_.__a_value);
  return result;
}

- (void)validateHeap:(id)a3
{
  if (a3)
  {
    if (objc_msgSend(a3, "type") == 2)
      MTLReportFailure();
  }
}

- (void)validateResource:(id)a3
{
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(a3, "isSparse"))
      MTLReportFailure();
  }
}

- (void)validateAllocation:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MTLDebugResidencySet validateResource:](self, "validateResource:", a3);
  else
    -[MTLDebugResidencySet validateHeap:](self, "validateHeap:", a3);
}

- (unint64_t)allocatedSize
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  unint64_t result;
  unsigned int v6;
  objc_super v7;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 + 1, &p_accessStatus->__a_.__a_value));
  if ((v4 & 0x80000000) != 0)
    MTLReportFailure();
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet allocatedSize](&v7, sel_allocatedSize);
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 - 1, &p_accessStatus->__a_.__a_value));
  return result;
}

- (void)endResidency
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  unsigned int v5;
  objc_super v6;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v4)
    MTLReportFailure();
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet endResidency](&v6, sel_endResidency);
  do
    v5 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v5 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (void)commit
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  unsigned int v5;
  objc_super v6;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v4)
    MTLReportFailure();
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet commit](&v6, sel_commit);
  do
    v5 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v5 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (void)requestResidency
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  unsigned int v5;
  objc_super v6;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v4)
    MTLReportFailure();
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet requestResidency](&v6, sel_requestResidency);
  do
    v5 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v5 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (void)addAllocations:(const void *)a3 count:(unint64_t)a4
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  objc_super v12;

  p_accessStatus = &self->_accessStatus;
  do
    v8 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v8 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v8)
    MTLReportFailure();
  if (a4)
  {
    v9 = 0;
    do
    {
      if (!a3[v9])
      {
        v11 = v9;
        MTLReportFailure();
      }
      -[MTLDebugResidencySet validateAllocation:](self, "validateAllocation:", v11);
      ++v9;
    }
    while (a4 != v9);
  }
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet addAllocations:count:](&v12, sel_addAllocations_count_, a3, a4);
  do
    v10 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v10 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  objc_super v12;

  p_accessStatus = &self->_accessStatus;
  do
    v8 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v8 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v8)
    MTLReportFailure();
  if (a4)
  {
    v9 = 0;
    do
    {
      if (!a3[v9])
      {
        v11 = v9;
        MTLReportFailure();
      }
      ++v9;
    }
    while (a4 != v9);
  }
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet removeAllocations:count:](&v12, sel_removeAllocations_count_, a3, a4, v11);
  do
    v10 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v10 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (void)addAllocation:(id)a3
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v6;
  unsigned int v7;
  objc_super v8;

  p_accessStatus = &self->_accessStatus;
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v6)
    MTLReportFailure();
  if (!a3)
    MTLReportFailure();
  -[MTLDebugResidencySet validateAllocation:](self, "validateAllocation:", a3);
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet addAllocation:](&v8, sel_addAllocation_, a3);
  do
    v7 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v7 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (void)removeAllocation:(id)a3
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v6;
  unsigned int v7;
  objc_super v8;

  p_accessStatus = &self->_accessStatus;
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v6)
    MTLReportFailure();
  if (!a3)
    MTLReportFailure();
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet removeAllocation:](&v8, sel_removeAllocation_, a3);
  do
    v7 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v7 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (void)removeAllAllocations
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  unsigned int v5;
  objc_super v6;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v4)
    MTLReportFailure();
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet removeAllAllocations](&v6, sel_removeAllAllocations);
  do
    v5 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v5 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (unint64_t)allocationCount
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  unint64_t result;
  unsigned int v6;
  objc_super v7;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 + 1, &p_accessStatus->__a_.__a_value));
  if ((v4 & 0x80000000) != 0)
    MTLReportFailure();
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet allocationCount](&v7, sel_allocationCount);
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 - 1, &p_accessStatus->__a_.__a_value));
  return result;
}

- (BOOL)containsAllocation:(id)a3
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v6;
  BOOL result;
  unsigned int v8;
  objc_super v9;

  p_accessStatus = &self->_accessStatus;
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 + 1, &p_accessStatus->__a_.__a_value));
  if ((v6 & 0x80000000) != 0)
    MTLReportFailure();
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet containsAllocation:](&v9, sel_containsAllocation_, a3);
  do
    v8 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v8 - 1, &p_accessStatus->__a_.__a_value));
  return result;
}

- (id)allAllocations
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  id result;
  unsigned int v6;
  objc_super v7;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 + 1, &p_accessStatus->__a_.__a_value));
  if ((v4 & 0x80000000) != 0)
    MTLReportFailure();
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet allAllocations](&v7, sel_allAllocations);
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 - 1, &p_accessStatus->__a_.__a_value));
  return result;
}

- (id)allCommittedAllocations
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  id result;
  unsigned int v6;
  objc_super v7;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 + 1, &p_accessStatus->__a_.__a_value));
  if ((v4 & 0x80000000) != 0)
    MTLReportFailure();
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet allCommittedAllocations](&v7, sel_allCommittedAllocations);
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 - 1, &p_accessStatus->__a_.__a_value));
  return result;
}

- (unint64_t)generationForAllocation:(id)a3
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v6;
  unint64_t result;
  unsigned int v8;
  objc_super v9;

  p_accessStatus = &self->_accessStatus;
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 + 1, &p_accessStatus->__a_.__a_value));
  if ((v6 & 0x80000000) != 0)
    MTLReportFailure();
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet generationForAllocation:](&v9, sel_generationForAllocation_, a3);
  do
    v8 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v8 - 1, &p_accessStatus->__a_.__a_value));
  return result;
}

- (unint64_t)currentGeneration
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  unint64_t result;
  unsigned int v6;
  objc_super v7;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 + 1, &p_accessStatus->__a_.__a_value));
  if ((v4 & 0x80000000) != 0)
    MTLReportFailure();
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet currentGeneration](&v7, sel_currentGeneration);
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 - 1, &p_accessStatus->__a_.__a_value));
  return result;
}

- (void)setCurrentGeneration:(unint64_t)a3
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v6;
  unsigned int v7;
  objc_super v8;

  p_accessStatus = &self->_accessStatus;
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v6)
    MTLReportFailure();
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet setCurrentGeneration:](&v8, sel_setCurrentGeneration_, a3);
  do
    v7 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v7 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (unint64_t)expiredGeneration
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v4;
  unint64_t result;
  unsigned int v6;
  objc_super v7;

  p_accessStatus = &self->_accessStatus;
  do
    v4 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v4 + 1, &p_accessStatus->__a_.__a_value));
  if ((v4 & 0x80000000) != 0)
    MTLReportFailure();
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugResidencySet;
  result = -[MTLToolsResidencySet expiredGeneration](&v7, sel_expiredGeneration);
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 - 1, &p_accessStatus->__a_.__a_value));
  return result;
}

- (void)setExpiredGeneration:(unint64_t)a3
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v6;
  unsigned int v7;
  objc_super v8;

  p_accessStatus = &self->_accessStatus;
  do
    v6 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v6 | 0x80000000, &p_accessStatus->__a_.__a_value));
  if (v6)
    MTLReportFailure();
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugResidencySet;
  -[MTLToolsResidencySet setExpiredGeneration:](&v8, sel_setExpiredGeneration_, a3);
  do
    v7 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v7 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

- (void)setWriteBit
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v3;

  p_accessStatus = &self->_accessStatus;
  do
    v3 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v3 | 0x80000000, &p_accessStatus->__a_.__a_value));
}

- (void)clearWriteBit
{
  atomic<unsigned int> *p_accessStatus;
  unsigned int v3;

  p_accessStatus = &self->_accessStatus;
  do
    v3 = __ldaxr(&p_accessStatus->__a_.__a_value);
  while (__stlxr(v3 & 0x7FFFFFFF, &p_accessStatus->__a_.__a_value));
}

@end
