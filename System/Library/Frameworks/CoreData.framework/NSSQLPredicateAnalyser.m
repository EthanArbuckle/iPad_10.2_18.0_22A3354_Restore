@implementation NSSQLPredicateAnalyser

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, "expressionType");
  if (v5 == 3)
    goto LABEL_5;
  if (v5 != 4)
  {
    if ((unint64_t)(v5 - 5) >= 3)
    {
      if (v5 != 13)
        return;
      v6 = 40;
    }
    else
    {
      v6 = 32;
    }
    goto LABEL_10;
  }
  if (sel_valueForKey_ == (char *)objc_msgSend(a3, "selector")
    || sel_valueForKeyPath_ == (char *)objc_msgSend(a3, "selector"))
  {
LABEL_5:
    v6 = 16;
LABEL_10:
    objc_msgSend(*(id *)((char *)&self->super.isa + v6), "addObject:", a3);
  }
}

- (void)visitPredicate:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "comparisonPredicateModifier") == 1)
    -[NSMutableArray addObject:](self->_allModifierPredicates, "addObject:", a3);
}

- (NSSQLPredicateAnalyser)init
{
  NSSQLPredicateAnalyser *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSSQLPredicateAnalyser;
  v2 = -[NSSQLPredicateAnalyser init](&v4, sel_init);
  if (v2)
  {
    v2->_keys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_allModifierPredicates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_setExpressions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_subqueries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_compoundPredicate = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_keys = 0;
  self->_allModifierPredicates = 0;

  self->_setExpressions = 0;
  self->_subqueries = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLPredicateAnalyser;
  -[NSSQLPredicateAnalyser dealloc](&v3, sel_dealloc);
}

@end
