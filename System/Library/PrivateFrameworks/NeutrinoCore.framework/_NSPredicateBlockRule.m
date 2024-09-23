@implementation _NSPredicateBlockRule

- (_NSPredicateBlockRule)initWithPredicate:(id)a3 action:(id)a4
{
  id v6;
  _NSPredicateBlockRule *v7;
  uint64_t v8;
  id action;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_NSPredicateBlockRule;
  v7 = -[NSPredicateRule initWithPredicate:](&v11, sel_initWithPredicate_, a3);
  if (v7)
  {
    v8 = MEMORY[0x1A85C1564](v6);
    action = v7->_action;
    v7->_action = (id)v8;

  }
  return v7;
}

- (void)performActionWithSystem:(id)a3
{
  void (**action)(id, id);

  action = (void (**)(id, id))self->_action;
  if (action)
    action[2](action, a3);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSPredicateRule predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A85C1564](self->_action);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IF %@ THEN %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
}

@end
