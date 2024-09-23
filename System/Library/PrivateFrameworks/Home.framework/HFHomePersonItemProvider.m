@implementation HFHomePersonItemProvider

- (HFHomePersonItemProvider)initWithHome:(id)a3
{
  id v4;
  void *v5;
  HFHomePersonItemProvider *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "personManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HFHomePersonItemProvider;
  v6 = -[HFPersonItemProvider initWithHome:personManager:](&v8, sel_initWithHome_personManager_, v4, v5);

  return v6;
}

- (HFHomePersonItemProvider)initWithHome:(id)a3 personManager:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPersonItemProvider.m"), 129, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFHomePersonItemProvider initWithHome:personManager:]",
    v7);

  return 0;
}

@end
