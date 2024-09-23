@implementation MTLDebugIntersectionFunctionTable

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugIntersectionFunctionTable;
  -[MTLToolsIntersectionFunctionTable dealloc](&v3, sel_dealloc);
}

- (MTLDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 parent:(id)a4 descriptor:(id)a5 stage:(unint64_t)a6
{
  MTLDebugIntersectionFunctionTable *v8;
  MTLDebugIntersectionFunctionTable *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLDebugIntersectionFunctionTable;
  v8 = -[MTLToolsResource initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3, a4);
  v9 = v8;
  if (v8)
  {
    atomic_store(0, (unsigned int *)&v8->_purgeableStateToken);
    v8->_purgeableStateHasBeenSet = 0;
    v8->_functionCount = objc_msgSend(a5, "functionCount");
    v9->_stage = a6;
  }
  return v9;
}

- (MTLDebugIntersectionFunctionTable)initWithIntersectionFunctionTable:(id)a3 parent:(id)a4 descriptor:(id)a5 pipelineState:(id)a6 stage:(unint64_t)a7
{
  MTLDebugIntersectionFunctionTable *v10;
  MTLDebugIntersectionFunctionTable *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTLDebugIntersectionFunctionTable;
  v10 = -[MTLToolsResource initWithBaseObject:parent:](&v13, sel_initWithBaseObject_parent_, a3, a4);
  v11 = v10;
  if (v10)
  {
    atomic_store(0, (unsigned int *)&v10->_purgeableStateToken);
    v10->_purgeableStateHasBeenSet = 0;
    v10->_functionCount = objc_msgSend(a5, "functionCount");
    v11->_pipelineState = (MTLToolsObject *)a6;
    v11->_stage = a7;
  }
  return v11;
}

- (MTLDebugIntersectionFunctionTable)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLDebugIntersectionFunctionTable *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLDebugIntersectionFunctionTable;
  result = -[MTLToolsResource initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
  if (result)
  {
    atomic_store(0, (unsigned int *)&result->_purgeableStateToken);
    result->_purgeableStateHasBeenSet = 0;
  }
  return result;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap"))
    MTLReportFailure();
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->_purgeableStateToken))
        MTLReportFailure();
    }
    self->_purgeableStateHasBeenSet = 1;
  }
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
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
      || -[MTLDebugIntersectionFunctionTable setPurgeableState:](self, "setPurgeableState:", 1) == 2;
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t stage;
  char isKindOfClass;
  MTLToolsObject *pipelineState;
  unint64_t v10;
  unint64_t functionCount;

  if (self->_functionCount <= a4)
  {
    v10 = a4;
    functionCount = self->_functionCount;
    MTLReportFailure();
    if (!a3)
      goto LABEL_14;
  }
  else if (!a3)
  {
    goto LABEL_14;
  }
  if (self->_pipelineState)
  {
    stage = self->_stage;
    if (stage && stage != objc_msgSend(a3, "stage"))
    {
      v10 = (unint64_t)MTLDebugStageToString(objc_msgSend(a3, "stage"));
      functionCount = (unint64_t)MTLDebugStageToString(self->_stage);
      MTLReportFailure();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        MTLReportFailure();
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    pipelineState = self->_pipelineState;
    if ((isKindOfClass & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      pipelineState = self->_pipelineState;
LABEL_13:
      -[MTLToolsObject validateHandleForSetFunction:](pipelineState, "validateHandleForSetFunction:", a3, v10, functionCount);
    }
  }
LABEL_14:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v10, functionCount), "setFunction:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  NSUInteger v9;
  unint64_t functionCount;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_functionCount)
  {
    v9 = a4.location + a4.length;
    functionCount = self->_functionCount;
    MTLReportFailure();
    if (!length)
      return;
  }
  else if (!a4.length)
  {
    return;
  }
  do
  {
    v8 = (uint64_t)*a3++;
    -[MTLDebugIntersectionFunctionTable setFunction:atIndex:](self, "setFunction:atIndex:", v8, location++, v9, functionCount);
    --length;
  }
  while (length);
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v7;
  unint64_t functionCount;

  if (self->_functionCount <= a4)
  {
    v7 = a4;
    functionCount = self->_functionCount;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v7, functionCount), "setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:", a3, a4);
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  unint64_t functionCount;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_functionCount)
  {
    v8 = a4.location + a4.length;
    functionCount = self->_functionCount;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v8, functionCount), "setOpaqueTriangleIntersectionFunctionWithSignature:withRange:", a3, location, length);
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v7;
  unint64_t functionCount;

  if (self->_functionCount <= a4)
  {
    v7 = a4;
    functionCount = self->_functionCount;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v7, functionCount), "setOpaqueCurveIntersectionFunctionWithSignature:atIndex:", a3, a4);
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  unint64_t functionCount;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_functionCount)
  {
    v8 = a4.location + a4.length;
    functionCount = self->_functionCount;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v8, functionCount), "setOpaqueCurveIntersectionFunctionWithSignature:withRange:", a3, location, length);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugIntersectionFunctionTable;
  v6 = -[MTLToolsObject description](&v8, sel_description);
  v9[0] = v4;
  v9[1] = CFSTR("functionCount =");
  v9[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_functionCount);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLDebugIntersectionFunctionTable formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)functionCount
{
  return self->_functionCount;
}

- (unint64_t)stage
{
  return self->_stage;
}

@end
