@implementation CBHistogramBuilder2D

- (CBHistogramBuilder2D)initWithFirstDim:(id)a3 andSecondDim:(id)a4
{
  NSArray *v4;
  uint64_t v5;
  CBHistogramBuilder *v6;
  NSMutableArray *histograms;
  id v9;
  int i;
  objc_super v11;
  id v12;
  id v13;
  SEL v14;
  CBHistogramBuilder2D *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CBHistogramBuilder2D;
  v15 = -[CBHistogramBuilder2D init](&v11, sel_init);
  if (!v15)
    return v15;
  if (v13 && v12)
  {
    v4 = (NSArray *)v13;
    v15->_firstDimEdges = v4;
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v5 = objc_msgSend(v9, "initWithCapacity:", -[NSArray count](v15->_firstDimEdges, "count") + 1);
    v15->_histograms = (NSMutableArray *)v5;
    for (i = 0; i < -[NSArray count](v15->_firstDimEdges, "count", histograms) + 1; ++i)
    {
      histograms = v15->_histograms;
      v6 = [CBHistogramBuilder alloc];
      -[NSMutableArray insertObject:atIndex:](histograms, "insertObject:atIndex:", -[CBHistogramBuilder initWithEdges:](v6, "initWithEdges:", v12), i);
    }
    return v15;
  }
  return 0;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBHistogramBuilder2D *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBHistogramBuilder2D;
  -[CBHistogramBuilder2D dealloc](&v2, sel_dealloc);
}

- (void)pushNumberWeighted:(double)a3 withWeight:(double)a4 forFirstDimValue:(float)a5
{
  double v5;
  int i;

  for (i = 0; i < (unint64_t)-[NSMutableArray count](self->_histograms, "count"); ++i)
  {
    if (i + 1 != -[NSMutableArray count](self->_histograms, "count"))
    {
      objc_msgSend(-[NSArray objectAtIndex:](self->_firstDimEdges, "objectAtIndex:", i), "doubleValue");
      if (a5 >= v5)
        continue;
    }
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_histograms, "objectAtIndex:", i), "pushNumberWeighted:withWeight:", a3, a4);
    return;
  }
}

- (void)enumerateBinsUsingBlock:(id)a3
{
  NSMutableArray *histograms;
  void *context;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(_QWORD *, void *, unint64_t, uint64_t);
  void *v9;
  CBHistogramBuilder2D *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  SEL v15;
  CBHistogramBuilder2D *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v13 = 0;
  v13 = -[NSMutableArray count](v16->_histograms, "count");
  histograms = v16->_histograms;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __48__CBHistogramBuilder2D_enumerateBinsUsingBlock___block_invoke;
  v9 = &unk_1E68E9DD8;
  v10 = v16;
  v12 = v13;
  v11 = v14;
  -[NSMutableArray enumerateObjectsUsingBlock:](histograms, "enumerateObjectsUsingBlock:", &v5);
  objc_autoreleasePoolPop(context);
}

uint64_t __48__CBHistogramBuilder2D_enumerateBinsUsingBlock___block_invoke(_QWORD *a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD *v19;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = a1;
  v14 = 0;
  if (a3)
  {
    if (v17 >= a1[6] - 1)
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(">=%d"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", a1[6] - 2), "intValue"));
    else
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d-%d"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", v17 - 1), "intValue"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", v17), "intValue")- 1);
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0-%d"), objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", 0), "intValue")- 1);
  }
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __48__CBHistogramBuilder2D_enumerateBinsUsingBlock___block_invoke_2;
  v10 = &unk_1E68E9DB0;
  v12 = a1[5];
  v13 = v17;
  v11 = v14;
  return objc_msgSend(v18, "enumerateBinsUsingBlock:", &v6);
}

uint64_t __48__CBHistogramBuilder2D_enumerateBinsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)reset
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_histograms, "enumerateObjectsUsingBlock:", &__block_literal_global, a2, self);
}

uint64_t __29__CBHistogramBuilder2D_reset__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

@end
