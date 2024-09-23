@implementation _NUBlockRule

- (_NUBlockRule)initWithPredicate:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  _NUBlockRule *v8;
  uint64_t v9;
  id predicate;
  uint64_t v11;
  id action;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_NUBlockRule;
  v8 = -[_NUBlockRule init](&v14, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x1A85C1564](v6);
    predicate = v8->_predicate;
    v8->_predicate = (id)v9;

    v11 = MEMORY[0x1A85C1564](v7);
    action = v8->_action;
    v8->_action = (id)v11;

  }
  return v8;
}

- (BOOL)evaluatePredicateWithSystem:(id)a3
{
  uint64_t (**predicate)(id, id);

  predicate = (uint64_t (**)(id, id))self->_predicate;
  if (predicate)
    LOBYTE(predicate) = predicate[2](predicate, a3);
  return (char)predicate;
}

- (void)performActionWithSystem:(id)a3
{
  void (**action)(id, id);

  action = (void (**)(id, id))self->_action;
  if (action)
    action[2](action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_predicate, 0);
}

@end
