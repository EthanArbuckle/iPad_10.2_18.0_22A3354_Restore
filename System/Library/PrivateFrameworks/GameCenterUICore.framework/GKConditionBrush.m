@implementation GKConditionBrush

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKConditionBrush;
  v4 = -[GKBrush copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[GKConditionBrush predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  -[GKConditionBrush yesBrush](self, "yesBrush");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setYesBrush:", v6);

  -[GKConditionBrush noBrush](self, "noBrush");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNoBrush:", v7);

  return v4;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  int v12;
  int *v13;
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a5;
  -[GKConditionBrush predicate](self, "predicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "evaluateWithObject:", v14);

  v13 = &OBJC_IVAR___GKConditionBrush__noBrush;
  if (v12)
    v13 = &OBJC_IVAR___GKConditionBrush__yesBrush;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v13), "drawInRect:withContext:input:", a4, v14, x, y, width, height);

}

- (CGSize)sizeForInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a3;
  -[GKConditionBrush predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "evaluateWithObject:", v4);

  v7 = &OBJC_IVAR___GKConditionBrush__noBrush;
  if (v6)
    v7 = &OBJC_IVAR___GKConditionBrush__yesBrush;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *v7), "sizeForInput:", v4);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (GKBrush)yesBrush
{
  return self->_yesBrush;
}

- (void)setYesBrush:(id)a3
{
  objc_storeStrong((id *)&self->_yesBrush, a3);
}

- (GKBrush)noBrush
{
  return self->_noBrush;
}

- (void)setNoBrush:(id)a3
{
  objc_storeStrong((id *)&self->_noBrush, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noBrush, 0);
  objc_storeStrong((id *)&self->_yesBrush, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
