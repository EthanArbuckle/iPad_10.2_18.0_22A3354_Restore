@implementation _NSPredicateRule

- (_NSPredicateRule)initWithPredicate:(id)a3 fact:(id)a4 grade:(double)a5 asserting:(BOOL)a6
{
  id v11;
  _NSPredicateRule *v12;
  _NSPredicateRule *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_NSPredicateRule;
  v12 = -[NSPredicateRule initWithPredicate:](&v15, sel_initWithPredicate_, a3);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fact, a4);
    v13->_grade = a5;
    v13->_asserting = a6;
  }

  return v13;
}

- (_NSPredicateRule)initWithCoder:(id)a3
{
  id v4;
  _NSPredicateRule *v5;
  double v6;
  uint64_t v7;
  NSString *fact;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_NSPredicateRule;
  v5 = -[NSPredicateRule initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_asserting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("asserting"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("grade"));
    v5->_grade = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fact"));
    v7 = objc_claimAutoreleasedReturnValue();
    fact = v5->_fact;
    v5->_fact = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NSPredicateRule;
  v4 = a3;
  -[NSPredicateRule encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_asserting, CFSTR("asserting"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("grade"), self->_grade);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fact, CFSTR("fact"));

}

- (void)performActionWithSystem:(id)a3
{
  NSString *fact;
  double grade;

  fact = self->_fact;
  grade = self->_grade;
  if (self->_asserting)
    objc_msgSend(a3, "assertFact:grade:", fact, grade);
  else
    objc_msgSend(a3, "retractFact:grade:", fact, grade);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSPredicateRule predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_asserting)
    v7 = CFSTR("assert");
  else
    v7 = CFSTR("retract");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IF %@ THEN %@(%@) by %.2f"), v5, v7, self->_fact, *(_QWORD *)&self->_grade);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fact, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
