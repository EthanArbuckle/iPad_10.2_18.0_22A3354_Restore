@implementation HFContainedObjectDifference

+ (id)containedObjectDifferenceWithKey:(id)a3 comparisonResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "differences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "na_any:", &__block_literal_global_89);

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:priority:", v6, 2);
    objc_msgSend(v10, "setContainedObjectResult:", v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL __81__HFContainedObjectDifference_containedObjectDifferenceWithKey_comparisonResult___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "priority") != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFContainedObjectDifference;
  v4 = -[HFDifference copyWithZone:](&v11, sel_copyWithZone_, a3);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HFContainedObjectDifference containedObjectResult](self, "containedObjectResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "setContainedObjectResult:", v9);

  return v7;
}

- (id)descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFContainedObjectDifference;
  -[HFDifference descriptionBuilder](&v7, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFContainedObjectDifference containedObjectResult](self, "containedObjectResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("result"));

  return v3;
}

- (HFComparisonResult)containedObjectResult
{
  return self->_containedObjectResult;
}

- (void)setContainedObjectResult:(id)a3
{
  objc_storeStrong((id *)&self->_containedObjectResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containedObjectResult, 0);
}

@end
