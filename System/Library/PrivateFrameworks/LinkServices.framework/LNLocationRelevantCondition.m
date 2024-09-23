@implementation LNLocationRelevantCondition

- (CLRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

- (LNLocationRelevantCondition)initWithRegion:(id)a3
{
  id v6;
  id *v7;
  LNLocationRelevantCondition *v8;
  LNLocationRelevantCondition *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNRelevantContext.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNLocationRelevantCondition;
  v7 = -[LNRelevantCondition _init](&v12, sel__init);
  v8 = (LNLocationRelevantCondition *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

@end
