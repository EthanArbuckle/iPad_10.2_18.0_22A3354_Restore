@implementation LNBinaryHeap

- (LNBinaryHeap)initWithCapacity:(unint64_t)a3 comparator:(id)a4 admissionPolicy:(id)a5
{
  id v9;
  id v10;
  LNBinaryHeap *v11;
  uint64_t v12;
  id comparator;
  uint64_t v14;
  id policy;
  id v16;
  LNBinaryHeap *v17;
  void *v19;
  CFBinaryHeapCompareContext compareContext;
  CFBinaryHeapCallBacks callBacks;
  objc_super v22;

  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBinaryHeap.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("comparator"));

  }
  v22.receiver = self;
  v22.super_class = (Class)LNBinaryHeap;
  v11 = -[LNBinaryHeap init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    comparator = v11->_comparator;
    v11->_comparator = (id)v12;

    v14 = objc_msgSend(v10, "copy");
    policy = v11->_policy;
    v11->_policy = (id)v14;

    v11->_capacity = a3;
    *(_OWORD *)&callBacks.version = xmmword_1E45DD190;
    *(_OWORD *)&callBacks.release = *(_OWORD *)&off_1E45DD1A0;
    callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))LNPriorityQueueCompare;
    v16 = v11->_comparator;
    compareContext.version = 0;
    compareContext.info = v16;
    compareContext.retain = (const void *(__cdecl *)(const void *))LNPriorityQueueRetain;
    compareContext.release = LNPriorityQueueRelease;
    compareContext.copyDescription = (CFStringRef (__cdecl *)(const void *))LNPriorityQueueCopyDescription;
    v11->_binaryHeap = CFBinaryHeapCreate(0, a3, &callBacks, &compareContext);
    v17 = v11;
  }

  return v11;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  CFBinaryHeapApplyFunction(self->_binaryHeap, (CFBinaryHeapApplierFunction)LNPriorityQueueApply, a3);
}

- (id)popObject
{
  void *v3;

  if (-[LNBinaryHeap count](self, "count"))
  {
    CFBinaryHeapGetMinimum(self->_binaryHeap);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CFBinaryHeapRemoveMinimumValue(self->_binaryHeap);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)count
{
  return CFBinaryHeapGetCount(self->_binaryHeap);
}

- (id)peek
{
  void *v3;

  v3 = -[LNBinaryHeap count](self, "count");
  if (v3)
  {
    CFBinaryHeapGetMinimum(self->_binaryHeap);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)insertObject:(id)a3
{
  id v4;
  uint64_t (**policy)(id, void *, id);
  void *v6;
  int v7;
  id v8;
  BOOL v9;

  v4 = a3;
  if (-[LNBinaryHeap count](self, "count") >= self->_capacity)
  {
    policy = (uint64_t (**)(id, void *, id))self->_policy;
    if (!policy
      || (-[LNBinaryHeap peek](self, "peek"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = policy[2](policy, v6, v4),
          v6,
          !v7))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = -[LNBinaryHeap popObject](self, "popObject");
  }
  CFBinaryHeapAddValue(self->_binaryHeap, v4);
  v9 = 1;
LABEL_7:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_binaryHeap);
  v3.receiver = self;
  v3.super_class = (Class)LNBinaryHeap;
  -[LNBinaryHeap dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_policy, 0);
  objc_storeStrong(&self->_comparator, 0);
}

@end
