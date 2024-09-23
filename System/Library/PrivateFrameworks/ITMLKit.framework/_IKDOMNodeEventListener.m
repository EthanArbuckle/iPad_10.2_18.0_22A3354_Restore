@implementation _IKDOMNodeEventListener

- (_IKDOMNodeEventListener)initWithListener:(id)a3 forNode:(id)a4
{
  id v6;
  id v7;
  _IKDOMNodeEventListener *v8;
  _IKDOMNodeEventListener *v9;
  uint64_t v10;
  JSManagedValue *managedValue;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_IKDOMNodeEventListener;
  v8 = -[_IKDOMNodeEventListener init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_enabled = 1;
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    managedValue = v9->_managedValue;
    v9->_managedValue = (JSManagedValue *)v10;

    objc_msgSend(v6, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "virtualMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addManagedReference:withOwner:", v9->_managedValue, v7);

  }
  return v9;
}

- (id)value
{
  void *v2;
  void *v3;

  -[_IKDOMNodeEventListener managedValue](self, "managedValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (JSManagedValue)managedValue
{
  return self->_managedValue;
}

- (void)setManagedValue:(id)a3
{
  objc_storeStrong((id *)&self->_managedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedValue, 0);
}

@end
