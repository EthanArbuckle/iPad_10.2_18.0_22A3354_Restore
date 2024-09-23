@implementation AVLayoutViewRowHead

- (AVLayoutItemAttributes)firstAttributesInPriorityOrder
{
  return (AVLayoutItemAttributes *)objc_loadWeakRetained((id *)&self->_firstAttributesInPriorityOrder);
}

- (AVLayoutItemAttributes)firstAttributesInLayoutOrder
{
  return self->_firstAttributesInLayoutOrder;
}

- (AVLayoutViewRowHead)initWithFirstAttributesInLayoutOrder:(id)a3 firstAttributesInPriorityOrder:(id)a4
{
  id v7;
  id v8;
  AVLayoutViewRowHead *v9;
  AVLayoutViewRowHead *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVLayoutViewRowHead;
  v9 = -[AVLayoutViewRowHead init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstAttributesInLayoutOrder, a3);
    objc_storeWeak((id *)&v10->_firstAttributesInPriorityOrder, v8);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_firstAttributesInPriorityOrder);
  objc_storeStrong((id *)&self->_firstAttributesInLayoutOrder, 0);
}

@end
