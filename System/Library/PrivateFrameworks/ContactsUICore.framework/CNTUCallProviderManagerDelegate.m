@implementation CNTUCallProviderManagerDelegate

- (CNTUCallProviderManagerDelegate)initWithBlock:(id)a3
{
  id v4;
  CNTUCallProviderManagerDelegate *v5;
  uint64_t v6;
  id block;
  CNTUCallProviderManagerDelegate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTUCallProviderManagerDelegate;
  v5 = -[CNTUCallProviderManagerDelegate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[CNTUCallProviderManagerDelegate block](self, "block");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
