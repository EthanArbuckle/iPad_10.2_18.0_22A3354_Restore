@implementation _HKCFGNonTerminalNode

+ (id)nodeWithChildren:(id)a3 rule:(id)a4 rangeOfString:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  length = a5.length;
  location = a5.location;
  v9 = a4;
  v10 = a3;
  v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithRangeOfString:", location, length);
  v12 = objc_msgSend(v10, "copy");

  v13 = (void *)v11[3];
  v11[3] = v12;

  v14 = (void *)v11[5];
  v11[5] = v9;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

- (id)evaluate
{
  id value;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;

  value = self->_value;
  if (!value)
  {
    -[_HKCFGReplacementRule nodeEvaluator](self->_rule, "nodeEvaluator");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSArray *))v4)[2](v4, self->_nodes);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_value;
    self->_value = v5;

    value = self->_value;
  }
  return value;
}

- (_HKCFGReplacementRule)rule
{
  return self->_rule;
}

@end
