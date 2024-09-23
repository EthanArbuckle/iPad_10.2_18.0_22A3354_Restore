@implementation CBHistogramBuilder

- (void)pushNumberWeighted:(double)a3 withWeight:(double)a4
{
  double v4;
  double v5;
  void *v6;
  NSMutableArray *bins;
  void *context;
  void *v9;
  unint64_t i;
  unint64_t v11;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  v11 = -[NSMutableArray count](self->_bins, "count");
  for (i = 0; i < v11; ++i)
  {
    if (i + 1 != v11)
    {
      objc_msgSend(-[NSArray objectAtIndex:](self->_edges, "objectAtIndex:", i), "doubleValue");
      if (a3 >= v4)
        continue;
    }
    v9 = (void *)-[NSMutableArray objectAtIndex:](self->_bins, "objectAtIndex:", i);
    bins = self->_bins;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "doubleValue");
    -[NSMutableArray setObject:atIndexedSubscript:](bins, "setObject:atIndexedSubscript:", objc_msgSend(v6, "numberWithDouble:", v5 + a4), i);
    break;
  }
  objc_autoreleasePoolPop(context);
}

- (CBHistogramBuilder)initWithEdges:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  void *context;
  unint64_t i;
  unint64_t v8;
  objc_super v9;
  NSArray *v10;
  SEL v11;
  CBHistogramBuilder *v12;

  v12 = self;
  v11 = a2;
  v10 = (NSArray *)a3;
  v9.receiver = self;
  v9.super_class = (Class)CBHistogramBuilder;
  v12 = -[CBHistogramBuilder init](&v9, sel_init);
  if (v12)
  {
    context = (void *)MEMORY[0x1B5E4A8B0]();
    v3 = v10;
    v12->_edges = v10;
    v8 = -[NSArray count](v10, "count") + 1;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    v12->_bins = (NSMutableArray *)v4;
    for (i = 0; i < v8; ++i)
      -[NSMutableArray insertObject:atIndex:](v12->_bins, "insertObject:atIndex:", &unk_1E6916520, i);
    objc_autoreleasePoolPop(context);
  }
  return v12;
}

- (void)pushNumber:(double)a3
{
  -[CBHistogramBuilder pushNumberWeighted:withWeight:](self, "pushNumberWeighted:withWeight:", a3, 1.0);
}

- (void)enumerateBinsUsingBlock:(id)a3
{
  NSMutableArray *bins;
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(_QWORD *, uint64_t, unint64_t);
  void *v9;
  CBHistogramBuilder *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  SEL v15;
  CBHistogramBuilder *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v13 = 0;
  v13 = -[NSMutableArray count](v16->_bins, "count");
  bins = v16->_bins;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __46__CBHistogramBuilder_enumerateBinsUsingBlock___block_invoke;
  v9 = &unk_1E68E9D88;
  v10 = v16;
  v12 = v13;
  v11 = v14;
  -[NSMutableArray enumerateObjectsUsingBlock:](bins, "enumerateObjectsUsingBlock:", &v5);
  objc_autoreleasePoolPop(context);
}

uint64_t __46__CBHistogramBuilder_enumerateBinsUsingBlock___block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    if (a3 >= a1[6] - 1)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(">=%d"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a1[6] - 2), "intValue"));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d-%d"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a3 - 1), "intValue"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", a3), "intValue")- 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0-%d"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 16), "objectAtIndexedSubscript:", 0), "intValue")- 1);
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)reset
{
  void *context;
  unint64_t i;
  unint64_t v4;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4 = -[NSMutableArray count](self->_bins, "count");
  -[NSMutableArray removeAllObjects](self->_bins, "removeAllObjects");
  for (i = 0; i < v4; ++i)
    -[NSMutableArray insertObject:atIndex:](self->_bins, "insertObject:atIndex:", &unk_1E6916520, i);
  objc_autoreleasePoolPop(context);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBHistogramBuilder *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBHistogramBuilder;
  -[CBHistogramBuilder dealloc](&v2, sel_dealloc);
}

- (NSMutableArray)bins
{
  return self->_bins;
}

- (NSArray)edges
{
  return self->_edges;
}

@end
