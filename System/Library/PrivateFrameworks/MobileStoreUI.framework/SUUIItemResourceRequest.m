@implementation SUUIItemResourceRequest

- (void)finishWithResource:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "loadedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidItemIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "itemRequest:didFinishWithItems:invalidItemIdentifiers:", self, v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "loadedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "itemRequest:didFinishWithItems:", self, v7);

  }
}

- (id)newLoadOperation
{
  return -[SUUILoadItemResourceOperation initWithResourceRequest:]([SUUILoadItemResourceOperation alloc], "initWithResourceRequest:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIItemResourceRequest;
  v4 = -[SUUIResourceRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setImageProfile:", self->_imageProfile);
  objc_msgSend(v4, "setItemIdentifiers:", self->_itemIdentifiers);
  objc_msgSend(v4, "setKeyProfile:", self->_keyProfile);
  return v4;
}

- (SUUIItemRequestDelegate)delegate
{
  return (SUUIItemRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)imageProfile
{
  return self->_imageProfile;
}

- (void)setImageProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)keyProfile
{
  return self->_keyProfile;
}

- (void)setKeyProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
