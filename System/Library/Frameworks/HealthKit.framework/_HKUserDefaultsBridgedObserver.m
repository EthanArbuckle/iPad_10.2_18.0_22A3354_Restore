@implementation _HKUserDefaultsBridgedObserver

- (_HKUserDefaultsBridgedObserver)initWithHandle:(id)a3
{
  id v5;
  _HKUserDefaultsBridgedObserver *v6;
  _HKUserDefaultsBridgedObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKUserDefaultsBridgedObserver;
  v6 = -[_HKUserDefaultsBridgedObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handle, a3);

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v13 = 0;
    }
  }
  if (!-[HKObserverBridgeHandle notifyObserversOfChangeForKey:newValue:](self->_handle, "notifyObserversOfChangeForKey:newValue:", v10, v13))
  {
    v14.receiver = self;
    v14.super_class = (Class)_HKUserDefaultsBridgedObserver;
    -[_HKUserDefaultsBridgedObserver observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
