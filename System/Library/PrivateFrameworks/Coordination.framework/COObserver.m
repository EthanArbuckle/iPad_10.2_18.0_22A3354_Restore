@implementation COObserver

- (id)initForName:(id)a3 onObservable:(id)a4 handler:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  COObserver *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  id handler;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)COObserver;
  v14 = -[COObserver init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_storeStrong((id *)&v14->_observable, a4);
    v17 = objc_msgSend(v12, "copy");
    handler = v14->_handler;
    v14->_handler = (id)v17;

    objc_storeStrong((id *)&v14->_queue, a6);
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[COObserver observable](self, "observable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)COObserver;
  -[COObserver dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COObserver name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)notify:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[COObserver queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __21__COObserver_notify___block_invoke;
  v7[3] = &unk_24CD3F470;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __21__COObserver_notify___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "handler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (NSString)name
{
  return self->_name;
}

- (COObservable)observable
{
  return self->_observable;
}

- (id)handler
{
  return self->_handler;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
