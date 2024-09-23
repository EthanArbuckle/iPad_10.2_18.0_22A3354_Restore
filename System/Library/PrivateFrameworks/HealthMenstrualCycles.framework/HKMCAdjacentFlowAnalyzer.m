@implementation HKMCAdjacentFlowAnalyzer

- (HKMCAdjacentFlowAnalyzer)initWithFlowDayIndex:(int64_t)a3
{
  HKMCAdjacentFlowAnalyzer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMCAdjacentFlowAnalyzer;
  result = -[HKMCAdjacentFlowAnalyzer init](&v5, sel_init);
  if (result)
  {
    result->_flowDayIndex = a3;
    result->_futureFlowDay = a3;
    result->_pastFlowDay = a3;
  }
  return result;
}

- (void)addNextAscendingDay:(id)a3 shouldStop:(BOOL *)a4
{
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "dayIndex") <= self->_futureFlowDay)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMCAdjacentFlowAnalyzer.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[adjacentDay dayIndex] > _futureFlowDay"));

  }
  if (self->_unsuitableForRange)
    goto LABEL_4;
  if ((objc_msgSend(v8, "isFetched") & 1) == 0)
  {
LABEL_9:
    *a4 = 1;
    self->_unsuitableForRange = 1;
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "hasFlow"))
  {
    if (!objc_msgSend(v8, "hasConfirmedNoFlow"))
    {
      *a4 = 0;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  self->_futureFlowDay = objc_msgSend(v8, "dayIndex");
LABEL_4:
  *a4 = 1;
LABEL_10:

}

- (void)addNextDescendingDay:(id)a3 shouldStop:(BOOL *)a4
{
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "dayIndex") >= self->_pastFlowDay)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMCAdjacentFlowAnalyzer.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[adjacentDay dayIndex] < _pastFlowDay"));

  }
  if (self->_unsuitableForRange)
    goto LABEL_4;
  if ((objc_msgSend(v8, "isFetched") & 1) == 0)
  {
LABEL_9:
    *a4 = 1;
    self->_unsuitableForRange = 1;
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "hasFlow"))
  {
    if (!objc_msgSend(v8, "hasConfirmedNoFlow"))
    {
      *a4 = 0;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  self->_pastFlowDay = objc_msgSend(v8, "dayIndex");
LABEL_4:
  *a4 = 1;
LABEL_10:

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)flowDayIndexRange
{
  int64_t flowDayIndex;
  int64_t v3;
  int64_t v4;
  int64_t pastFlowDay;
  int64_t futureFlowDay;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int64_t v10;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  if (self->_unsuitableForRange)
  {
    flowDayIndex = self->_flowDayIndex;
    v3 = 1;
  }
  else
  {
    v4 = self->_flowDayIndex;
    futureFlowDay = self->_futureFlowDay;
    pastFlowDay = self->_pastFlowDay;
    v7 = futureFlowDay - v4;
    if (futureFlowDay <= v4)
      v7 = 1;
    v8 = 1;
    v9 = futureFlowDay <= v4;
    if (futureFlowDay <= v4)
      v10 = pastFlowDay + 1;
    else
      v10 = self->_flowDayIndex;
    if (v9)
      v8 = v4 - pastFlowDay;
    if (v4 > pastFlowDay)
      flowDayIndex = v10;
    else
      flowDayIndex = self->_flowDayIndex;
    if (v4 > pastFlowDay)
      v3 = v8;
    else
      v3 = v7;
  }
  result.var1 = v3;
  result.var0 = flowDayIndex;
  return result;
}

- (int64_t)flowDayIndex
{
  return self->_flowDayIndex;
}

- (BOOL)isUnsuitableForRange
{
  return self->_unsuitableForRange;
}

@end
