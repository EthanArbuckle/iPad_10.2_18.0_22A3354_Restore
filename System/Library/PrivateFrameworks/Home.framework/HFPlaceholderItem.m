@implementation HFPlaceholderItem

- (HFPlaceholderItem)initWithHomeKitObject:(id)a3
{
  id v5;
  HFPlaceholderItem *v6;
  HFPlaceholderItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFPlaceholderItem;
  v6 = -[HFPlaceholderItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_homeKitObject, a3);

  return v7;
}

- (HFPlaceholderItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPlaceholderItem.m"), 23, CFSTR("Use -initWithHomeKitObject:"));

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFMutableItemUpdateOutcome *v3;
  void *v4;

  v3 = objc_alloc_init(HFMutableItemUpdateOutcome);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitObject, 0);
}

@end
