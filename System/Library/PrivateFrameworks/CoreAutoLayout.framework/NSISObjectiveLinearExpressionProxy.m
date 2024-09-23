@implementation NSISObjectiveLinearExpressionProxy

- (NSISObjectiveLinearExpressionProxy)initWithEngine:(id)a3
{
  NSISObjectiveLinearExpressionProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSISObjectiveLinearExpressionProxy;
  v4 = -[NSISObjectiveLinearExpressionProxy init](&v6, sel_init);
  if (v4)
    v4->_expression = (NSISObjectiveLinearExpression *)-[NSISObjectiveLinearExpression initWithEngine:]([NSISObjectiveLinearExpression alloc], (uint64_t)a3);
  return v4;
}

- (void)addVar:(id)a3 priority:(double)a4 times:(double)a5
{
  -[NSISObjectiveLinearExpression addVar:priority:times:]((uint64_t)self->_expression, a3.var0, a4, a5);
}

- (void)removeVar:(id)a3
{
  -[NSISObjectiveLinearExpression removeVar:]((uint64_t)self->_expression, a3.var0);
}

- (void)replaceVar:(id)a3 withExpression:(id *)a4 processVarNewToReceiver:(id)a5 processVarDroppedFromReceiver:(id)a6
{
  -[NSISObjectiveLinearExpression replaceVar:withExpression:processVarNewToReceiver:processVarDroppedFromReceiver:]((uint64_t)self->_expression, a3.var0, &a4->var0, (uint64_t)a5, (uint64_t)a6);
}

- (BOOL)restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:(id *)a3
{
  return -[NSISObjectiveLinearExpression restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:]((uint64_t)self->_expression, a3);
}

- (unint64_t)variableCount
{
  return -[NSISObjectiveLinearExpression variableCount]((uint64_t)self->_expression);
}

@end
