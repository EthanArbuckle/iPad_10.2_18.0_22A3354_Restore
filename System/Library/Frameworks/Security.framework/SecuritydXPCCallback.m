@implementation SecuritydXPCCallback

- (SecuritydXPCCallback)initWithCallback:(id)a3
{
  id v4;
  SecuritydXPCCallback *v5;
  void *v6;
  id callback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecuritydXPCCallback;
  v5 = -[SecuritydXPCCallback init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    callback = v5->_callback;
    v5->_callback = v6;

  }
  return v5;
}

- (void)callCallback:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void (**v7)(id, _BOOL8, id);

  v4 = a3;
  v6 = a4;
  -[SecuritydXPCCallback callback](self, "callback");
  v7 = (void (**)(id, _BOOL8, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v4, v6);

}

- (id)callback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
