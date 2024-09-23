@implementation LNDateRelevantCondition

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (LNDateRelevantCondition)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8;
  id v9;
  id *v10;
  LNDateRelevantCondition *v11;
  LNDateRelevantCondition *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNRelevantContext.m"), 523, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

  }
  v15.receiver = self;
  v15.super_class = (Class)LNDateRelevantCondition;
  v10 = -[LNRelevantCondition _init](&v15, sel__init);
  v11 = (LNDateRelevantCondition *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    objc_storeStrong((id *)&v11->_endDate, a4);
    v12 = v11;
  }

  return v11;
}

@end
