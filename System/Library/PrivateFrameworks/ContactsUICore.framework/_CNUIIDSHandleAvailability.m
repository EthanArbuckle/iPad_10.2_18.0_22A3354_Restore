@implementation _CNUIIDSHandleAvailability

- (BOOL)isAvailable
{
  return self->_available;
}

- (CNUIIDSHandle)handle
{
  return self->_handle;
}

- (_CNUIIDSHandleAvailability)initWithHandle:(id)a3 available:(BOOL)a4
{
  id v7;
  _CNUIIDSHandleAvailability *v8;
  _CNUIIDSHandleAvailability *v9;
  _CNUIIDSHandleAvailability *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNUIIDSHandleAvailability;
  v8 = -[_CNUIIDSHandleAvailability init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_available = a4;
    v10 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNUIIDSHandleAvailability handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cnui_IDSIDRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("handle"), v5);

  v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("available"), -[_CNUIIDSHandleAvailability isAvailable](self, "isAvailable"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

@end
