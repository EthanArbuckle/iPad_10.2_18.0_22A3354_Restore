@implementation HUListenerHelper

+ (id)listenerHelperWithListener:(id)a3 andDelegate:(id)a4
{
  id v5;
  id v6;
  HUListenerHelper *v7;

  v5 = a3;
  v6 = a4;
  objc_getAssociatedObject(v5, &HUListenerHelperKey);
  v7 = (HUListenerHelper *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[HUListenerHelper initWithListener:andDelegate:]([HUListenerHelper alloc], "initWithListener:andDelegate:", v5, v6);
    objc_setAssociatedObject(v5, &HUListenerHelperKey, v7, (void *)1);
  }

  return v7;
}

- (HUListenerHelper)initWithListener:(id)a3 andDelegate:(id)a4
{
  HUListenerHelper *v6;
  id v7;
  id v8;
  objc_super v10;
  id v11;
  id location;

  objc_initWeak(&location, a3);
  objc_initWeak(&v11, a4);
  v10.receiver = self;
  v10.super_class = (Class)HUListenerHelper;
  v6 = -[HUListenerHelper init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_loadWeakRetained(&location);
    v6->_listenerAddress = v7;

    v8 = objc_loadWeakRetained(&v11);
    objc_storeWeak((id *)&v6->_delegate, v8);

  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "removeListener:", self->_listenerAddress);

  v4.receiver = self;
  v4.super_class = (Class)HUListenerHelper;
  -[HUListenerHelper dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
