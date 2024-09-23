@implementation AXMOutputAction

- (id)_initWithHandle:(id)a3
{
  id v4;
  AXMOutputAction *v5;
  AXMOutputActionHandle *v6;
  AXMOutputActionHandle *handle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMOutputAction;
  v5 = -[AXMOutputAction init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (AXMOutputActionHandle *)v4;
    else
      v6 = objc_alloc_init(AXMOutputActionHandle);
    handle = v5->_handle;
    v5->_handle = v6;

  }
  return v5;
}

- (AXMOutputActionHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
