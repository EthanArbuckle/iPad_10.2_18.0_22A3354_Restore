@implementation GVEdge

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GVEdge;
  -[GVEdge dealloc](&v3, sel_dealloc);
}

- (GVEdge)init
{
  GVEdge *v2;
  GVEdge *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GVEdge;
  v2 = -[GVEdge init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->reversed = 0;
    v2->from = 0;
    v2->to = 0;
    v2->dummies = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v3;
}

- (GVEdge)initWithFromNode:(id)a3 to:(id)a4
{
  GVEdge *v6;
  GVEdge *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GVEdge;
  v6 = -[GVEdge init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->from = (GVNode *)a3;
    v6->to = (GVNode *)a4;
    v6->reversed = 0;
    v6->dummies = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v7;
}

- (id)description
{
  const __CFString *v2;

  if (self->reversed)
    v2 = CFSTR(" (r)");
  else
    v2 = &stru_1E98C6508;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p [%p -> %p%@]"), self, self->from, self->to, v2);
}

- (GVNode)from
{
  return self->from;
}

- (GVNode)to
{
  return self->to;
}

- (NSMutableArray)dummies
{
  return self->dummies;
}

- (void)setDummies:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)reversed
{
  return self->reversed;
}

- (void)setReversed:(BOOL)a3
{
  self->reversed = a3;
}

@end
