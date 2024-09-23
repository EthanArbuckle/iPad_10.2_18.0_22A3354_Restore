@implementation ATXActionCriteriaPredicateChecker

- (ATXActionCriteriaPredicateChecker)initWithObject:(id)a3
{
  id v4;
  ATXActionCriteriaPredicateChecker *v5;
  uint64_t v6;
  NSSet *propertyNames;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActionCriteriaPredicateChecker;
  v5 = -[ATXActionCriteriaPredicateChecker init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "propertyWhitelist");
    v6 = objc_claimAutoreleasedReturnValue();
    propertyNames = v5->_propertyNames;
    v5->_propertyNames = (NSSet *)v6;

  }
  return v5;
}

- (BOOL)isValid:(id)a3
{
  self->_ok = 1;
  objc_msgSend(a3, "acceptVisitor:flags:", self, 1);
  return self->_ok;
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v4;
  NSSet *propertyNames;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "expressionType");
  if (v4 <= 14)
  {
    if (v4 != 2)
    {
      if (v4 != 3)
        goto LABEL_9;
      propertyNames = self->_propertyNames;
      objc_msgSend(v7, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(propertyNames) = -[NSSet containsObject:](propertyNames, "containsObject:", v6);

      if ((propertyNames & 1) != 0)
        goto LABEL_9;
    }
LABEL_8:
    self->_ok = 0;
    goto LABEL_9;
  }
  if (v4 == 15 || v4 == 19)
    goto LABEL_8;
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNames, 0);
}

@end
