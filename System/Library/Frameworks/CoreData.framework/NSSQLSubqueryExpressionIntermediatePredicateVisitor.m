@implementation NSSQLSubqueryExpressionIntermediatePredicateVisitor

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLSubqueryExpressionIntermediatePredicateVisitor;
  -[NSSQLSubqueryExpressionIntermediatePredicateVisitor dealloc](&v3, sel_dealloc);
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "expressionType");
  if (v5 == 3
    || v5 == 4
    && (sel_valueForKey_ == (char *)objc_msgSend(a3, "selector")
     || sel_valueForKeyPath_ == (char *)objc_msgSend(a3, "selector")))
  {
    if (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self->_scope, a3))
      self->_foundKeypath = 1;
  }
}

- (BOOL)checkPredicate:(id)a3
{
  BOOL result;

  objc_msgSend(a3, "acceptVisitor:flags:", self, 1);
  result = !self->_foundKeypath;
  self->_foundKeypath = 0;
  return result;
}

@end
