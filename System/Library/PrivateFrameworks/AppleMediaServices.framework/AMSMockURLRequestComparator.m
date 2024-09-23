@implementation AMSMockURLRequestComparator

- (AMSMockURLRequestComparator)initWithCriteriaBlock:(id)a3
{
  id v4;
  AMSMockURLRequestComparator *v5;
  void *v6;
  id criteriaBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMockURLRequestComparator;
  v5 = -[AMSMockURLRequestComparator init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    criteriaBlock = v5->_criteriaBlock;
    v5->_criteriaBlock = v6;

  }
  return v5;
}

- (BOOL)shouldOverrideURLRequest:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  char v6;

  v4 = a3;
  -[AMSMockURLRequestComparator criteriaBlock](self, "criteriaBlock");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v4);

  return v6;
}

- (id)criteriaBlock
{
  return self->_criteriaBlock;
}

- (void)setCriteriaBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_criteriaBlock, 0);
}

@end
