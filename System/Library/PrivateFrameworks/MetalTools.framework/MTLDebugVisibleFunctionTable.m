@implementation MTLDebugVisibleFunctionTable

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugVisibleFunctionTable;
  -[MTLToolsResource dealloc](&v3, sel_dealloc);
}

- (MTLDebugVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 parent:(id)a4 descriptor:(id)a5 stage:(unint64_t)a6
{
  MTLDebugVisibleFunctionTable *v8;
  MTLDebugVisibleFunctionTable *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLDebugVisibleFunctionTable;
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

- (MTLDebugVisibleFunctionTable)initWithVisibleFunctionTable:(id)a3 parent:(id)a4 descriptor:(id)a5 pipelineState:(id)a6 stage:(unint64_t)a7
{
  MTLDebugVisibleFunctionTable *v10;
  MTLDebugVisibleFunctionTable *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTLDebugVisibleFunctionTable;
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

- (MTLDebugVisibleFunctionTable)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLDebugVisibleFunctionTable *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLDebugVisibleFunctionTable;
  result = -[MTLToolsResource initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
  if (result)
  {
    atomic_store(0, (unsigned int *)&result->_purgeableStateToken);
    result->_purgeableStateHasBeenSet = 0;
    result->_stage = 0;
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
      || -[MTLDebugVisibleFunctionTable setPurgeableState:](self, "setPurgeableState:", 1) == 2;
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t stage;
  char isKindOfClass;
  MTLToolsObject *pipelineState;
  unint64_t v10;
  const __CFString *v11;
  unint64_t functionCount;
  const __CFString *v13;

  if (self->_functionCount <= a4)
  {
    v10 = a4;
    functionCount = self->_functionCount;
    MTLReportFailure();
  }
  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device", v10, functionCount), "baseObject"), "supportsFunctionPointers") & 1) != 0)
  {
    if (!a3)
      goto LABEL_16;
  }
  else
  {
    MTLReportFailure();
    if (!a3)
      goto LABEL_16;
  }
  if (self->_pipelineState)
  {
    stage = self->_stage;
    if (stage && stage != objc_msgSend(a3, "stage"))
    {
      v11 = MTLDebugStageToString(objc_msgSend(a3, "stage"));
      v13 = MTLDebugStageToString(self->_stage);
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
      goto LABEL_15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      pipelineState = self->_pipelineState;
LABEL_15:
      -[MTLToolsObject validateHandleForSetFunction:](pipelineState, "validateHandleForSetFunction:", a3, v11, v13);
    }
  }
LABEL_16:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v11, v13), "setFunction:atIndex:", objc_msgSend(a3, "baseObject"), a4);
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
  }
  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device", v9, functionCount), "baseObject"), "supportsFunctionPointers") & 1) != 0)
  {
    if (!length)
      return;
  }
  else
  {
    MTLReportFailure();
    if (!length)
      return;
  }
  do
  {
    v8 = (uint64_t)*a3++;
    -[MTLDebugVisibleFunctionTable setFunction:atIndex:](self, "setFunction:atIndex:", v8, location++);
    --length;
  }
  while (length);
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
  v8.super_class = (Class)MTLDebugVisibleFunctionTable;
  v6 = -[MTLToolsObject description](&v8, sel_description);
  v9[0] = v4;
  v9[1] = CFSTR("functionCount =");
  v9[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_functionCount);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLDebugVisibleFunctionTable formattedDescription:](self, "formattedDescription:", 0);
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
