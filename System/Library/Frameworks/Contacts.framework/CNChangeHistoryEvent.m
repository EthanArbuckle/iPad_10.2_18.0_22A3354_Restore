@implementation CNChangeHistoryEvent

- (id)description
{
  CNChangeHistoryEvent *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryEvent)initWithCoder:(id)a3
{
  id v4;
  CNChangeHistoryEvent *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CNChangeHistoryEvent *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)acceptEventVisitor:(id)visitor
{
  id v4;
  CNChangeHistoryEvent *v5;
  id v6;

  v4 = visitor;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (NSArray)contactIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[CNChangeHistoryEvent comparisonResultBetweenClasses:](self, "comparisonResultBetweenClasses:", v4);
  if (!v5)
    v5 = -[CNChangeHistoryEvent comparisonResultWithinSameClass:](self, "comparisonResultWithinSameClass:", v4);

  return v5;
}

- (int64_t)comparisonResultBetweenClasses:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "instanceSortOrder");
  v5 = (void *)objc_opt_class();

  v6 = objc_msgSend(v5, "instanceSortOrder");
  if (v4 < v6)
    return -1;
  else
    return v4 > v6;
}

+ (unint64_t)instanceSortOrder
{
  id v2;
  id v3;

  v2 = a1;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  return 0;
}

@end
