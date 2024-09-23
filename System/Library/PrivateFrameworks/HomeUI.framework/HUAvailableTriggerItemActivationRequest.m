@implementation HUAvailableTriggerItemActivationRequest

- (HUAvailableTriggerItemActivationRequest)initWithItem:(id)a3 active:(BOOL)a4
{
  id v6;
  HUAvailableTriggerItemActivationRequest *v7;
  HUAvailableTriggerItemActivationRequest *v8;
  NAFuture *v9;
  NAFuture *completionFuture;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUAvailableTriggerItemActivationRequest;
  v7 = -[HUAvailableTriggerItemActivationRequest init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_item, v6);
    v8->_active = a4;
    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    completionFuture = v8->_completionFuture;
    v8->_completionFuture = v9;

  }
  return v8;
}

- (BOOL)isSameAsRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableTriggerItemActivationRequest item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = objc_msgSend(v4, "active");
    v8 = v7 ^ -[HUAvailableTriggerItemActivationRequest active](self, "active") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (HUAvailableTriggerItem)item
{
  return (HUAvailableTriggerItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (NAFuture)completionFuture
{
  return self->_completionFuture;
}

- (void)setCompletionFuture:(id)a3
{
  objc_storeStrong((id *)&self->_completionFuture, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionFuture, 0);
  objc_destroyWeak((id *)&self->_item);
}

@end
