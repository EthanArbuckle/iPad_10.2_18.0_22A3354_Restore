@implementation HFEventBuilderItemProviderEventGroup

- (HFEventBuilderItemProviderEventGroup)initWithEventBuilders:(id)a3
{
  id v5;
  HFEventBuilderItemProviderEventGroup *v6;
  HFEventBuilderItemProviderEventGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFEventBuilderItemProviderEventGroup;
  v6 = -[HFEventBuilderItemProviderEventGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_eventBuilders, a3);

  return v7;
}

+ (id)eventGroupWithBuilders:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventBuilders:", v4);

  return v5;
}

- (NSString)comparisonKey
{
  return self->_comparisonKey;
}

- (void)setComparisonKey:(id)a3
{
  objc_storeStrong((id *)&self->_comparisonKey, a3);
}

- (NSSet)eventBuilders
{
  return self->_eventBuilders;
}

- (void)setEventBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_eventBuilders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBuilders, 0);
  objc_storeStrong((id *)&self->_comparisonKey, 0);
}

@end
