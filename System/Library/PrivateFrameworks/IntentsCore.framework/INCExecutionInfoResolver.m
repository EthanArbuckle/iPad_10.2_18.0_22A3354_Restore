@implementation INCExecutionInfoResolver

- (id)resolveIntentExecutionInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INCExecutionInfoResolver;
  -[INExecutionInfoResolver resolveIntentExecutionInfo:](&v4, sel_resolveIntentExecutionInfo_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)resolveUserActivityExecutionInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INCExecutionInfoResolver;
  -[INExecutionInfoResolver resolveUserActivityExecutionInfo:](&v4, sel_resolveUserActivityExecutionInfo_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
