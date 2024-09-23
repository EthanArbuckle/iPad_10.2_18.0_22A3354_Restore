@implementation CRKNotificationObservation

- (void)dealloc
{
  objc_super v3;

  -[CRKNotificationObservation endObserving](self, "endObserving");
  v3.receiver = self;
  v3.super_class = (Class)CRKNotificationObservation;
  -[CRKNotificationObservation dealloc](&v3, sel_dealloc);
}

- (CRKNotificationObservation)initWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRKNotificationObservation *v15;
  CRKNotificationObservation *v16;
  uint64_t v17;
  NSString *notificationName;
  uint64_t v19;
  id notificationHandler;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRKNotificationObservation;
  v15 = -[CRKNotificationObservation init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationCenter, a3);
    v17 = objc_msgSend(v12, "copy");
    notificationName = v16->_notificationName;
    v16->_notificationName = (NSString *)v17;

    objc_storeStrong((id *)&v16->_object, a5);
    v19 = MEMORY[0x219A226E8](v14);
    notificationHandler = v16->_notificationHandler;
    v16->_notificationHandler = (id)v19;

  }
  return v16;
}

+ (id)observationWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNotificationCenter:notificationName:object:notificationHandler:", v13, v12, v11, v10);

  objc_msgSend(v14, "beginObserving");
  return v14;
}

- (void)invalidate
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __40__CRKNotificationObservation_invalidate__block_invoke;
  v2[3] = &unk_24D9C7A60;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__CRKNotificationObservation_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "notificationHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v3;
    if (v2)
    {
      objc_msgSend(v3, "endObserving");
      objc_msgSend(v3, "setNotificationHandler:", 0);
      objc_msgSend(v3, "setObject:", 0);
      WeakRetained = v3;
    }
  }

}

- (void)beginObserving
{
  void *v3;
  void *v4;
  id v5;

  -[CRKNotificationObservation notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKNotificationObservation notificationName](self, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKNotificationObservation object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_notificationDidFire_, v3, v4);

}

- (void)endObserving
{
  void *v3;
  void *v4;
  id v5;

  -[CRKNotificationObservation notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKNotificationObservation notificationName](self, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKNotificationObservation object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v3, v4);

}

- (void)notificationDidFire:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CRKNotificationObservation_notificationDidFire___block_invoke;
  block[3] = &unk_24D9C7DC8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__CRKNotificationObservation_notificationDidFire___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "notificationHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v3)
    {
      objc_msgSend(v5, "notificationHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, *(_QWORD *)(a1 + 32));

      WeakRetained = v5;
    }
  }

}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (id)notificationHandler
{
  return self->_notificationHandler;
}

- (void)setNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
