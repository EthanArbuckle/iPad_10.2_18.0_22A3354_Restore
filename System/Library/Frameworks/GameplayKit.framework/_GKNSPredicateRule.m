@implementation _GKNSPredicateRule

- (_GKNSPredicateRule)initWithPredicate:(id)a3 fact:(id)a4 grade:(float)a5 asserting:(BOOL)a6
{
  id v11;
  _GKNSPredicateRule *v12;
  _GKNSPredicateRule *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_GKNSPredicateRule;
  v12 = -[GKNSPredicateRule initWithPredicate:](&v15, sel_initWithPredicate_, a3);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fact, a4);
    v13->_grade = a5;
    v13->_asserting = a6;
  }

  return v13;
}

- (void)performActionWithSystem:(id)a3
{
  double v3;
  NSObject *fact;

  fact = self->_fact;
  *(float *)&v3 = self->_grade;
  if (self->_asserting)
    objc_msgSend(a3, "assertFact:grade:", fact, v3);
  else
    objc_msgSend(a3, "retractFact:grade:", fact, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fact, 0);
}

@end
