@implementation CUIKSingleDayTimelineLayoutPartition

- (double)topBoundaryTime
{
  return self->_topBoundaryTime;
}

- (void)setTopBoundaryTime:(double)a3
{
  self->_topBoundaryTime = a3;
}

- (double)totalWidth
{
  double v3;
  double v4;
  double v5;
  double result;

  -[CUIKSingleDayTimelineLayoutPartition endBoundary](self, "endBoundary");
  v4 = v3;
  -[CUIKSingleDayTimelineLayoutPartition initialStartBoundary](self, "initialStartBoundary");
  result = v4 - v5;
  if (result < 0.0)
    return -result;
  return result;
}

- (double)freeSpaceStartBoundary
{
  double v3;
  double v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[CUIKSingleDayTimelineLayoutPartition initialStartBoundary](self, "initialStartBoundary");
  v4 = v3;
  v5 = -[NSMutableArray count](self->_stackOfOccurrences, "count");
  if (v5)
  {
    v6 = v5;
    -[NSMutableArray objectAtIndex:](self->_stackOfOccurrences, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();
    v9 = v7;
    if ((v8 & 1) == 0)
      v9 = (void *)objc_opt_class();
    objc_msgSend(v9, "barToBarHorizontalDistanceIncludingBarWidth");
    v11 = v10;
    v12 = v10 * (double)v6;
    -[CUIKSingleDayTimelineLayoutPartition endBoundary](self, "endBoundary");
    if (v4 >= v13)
      v14 = -(v11 * (double)v6);
    else
      v14 = v12;
    v4 = v4 + v14;

  }
  return v4;
}

- (double)initialStartBoundary
{
  return self->_initialStartBoundary;
}

- (double)freeSpaceWidth
{
  double v3;
  double v4;
  double v5;
  double result;

  -[CUIKSingleDayTimelineLayoutPartition endBoundary](self, "endBoundary");
  v4 = v3;
  -[CUIKSingleDayTimelineLayoutPartition freeSpaceStartBoundary](self, "freeSpaceStartBoundary");
  result = v4 - v5;
  if (result < 0.0)
    return -result;
  return result;
}

- (double)endBoundary
{
  return self->_endBoundary;
}

- (void)setEndBoundary:(double)a3
{
  self->_endBoundary = a3;
}

- (id)peekOccurrence
{
  return (id)-[NSMutableArray lastObject](self->_stackOfOccurrences, "lastObject");
}

- (void)pushOccurrence:(id)a3
{
  -[NSMutableArray addObject:](self->_stackOfOccurrences, "addObject:", a3);
}

- (void)popOccurrence
{
  -[NSMutableArray removeLastObject](self->_stackOfOccurrences, "removeLastObject");
}

- (void)setInitialStartBoundary:(double)a3
{
  self->_initialStartBoundary = a3;
}

- (CUIKSingleDayTimelineLayoutPartition)init
{
  CUIKSingleDayTimelineLayoutPartition *v2;
  NSMutableArray *v3;
  NSMutableArray *stackOfOccurrences;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIKSingleDayTimelineLayoutPartition;
  v2 = -[CUIKSingleDayTimelineLayoutPartition init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stackOfOccurrences = v2->_stackOfOccurrences;
    v2->_stackOfOccurrences = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackOfOccurrences, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIKSingleDayTimelineLayoutPartition;
  -[CUIKSingleDayTimelineLayoutPartition description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_topBoundaryTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableArray count](self->_stackOfOccurrences, "count");
  -[CUIKSingleDayTimelineLayoutPartition peekOccurrence](self, "peekOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ topBoundary: [%@], initialStartBoundary: [%f], endBoundary: [%f], number of stacked occurrences: [%lu], top occurrence on stack: [%@]"), v3, v4, *(_QWORD *)&self->_initialStartBoundary, *(_QWORD *)&self->_endBoundary, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)stackedOccurrences
{
  return (NSArray *)self->_stackOfOccurrences;
}

@end
