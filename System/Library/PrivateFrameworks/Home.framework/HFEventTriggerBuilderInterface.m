@implementation HFEventTriggerBuilderInterface

- (HFEventTriggerBuilderInterface)initWithTriggerBuilder:(id)a3
{
  id v4;
  HFEventTriggerBuilderInterface *v5;
  HFEventTriggerBuilderInterface *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFEventTriggerBuilderInterface;
  v5 = -[HFEventTriggerBuilderInterface init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_triggerBuilder, v4);

  return v6;
}

+ (id)interfaceWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTriggerBuilder:", v3);

  return v4;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return (HFEventTriggerBuilder *)objc_loadWeakRetained((id *)&self->_triggerBuilder);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_triggerBuilder);
}

@end
