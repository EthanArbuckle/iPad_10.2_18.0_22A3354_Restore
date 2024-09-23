@implementation HUHomeStatusDetailsItemAndPriorityTuple

- (HUHomeStatusDetailsItemAndPriorityTuple)initWithItem:(id)a3 priority:(int64_t)a4
{
  id v6;
  HUHomeStatusDetailsItemAndPriorityTuple *v7;
  HUHomeStatusDetailsItemAndPriorityTuple *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUHomeStatusDetailsItemAndPriorityTuple;
  v7 = -[HUHomeStatusDetailsItemAndPriorityTuple init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_item, v6);
    v8->_priority = a4;
  }

  return v8;
}

- (HFItem)item
{
  return (HFItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
}

@end
