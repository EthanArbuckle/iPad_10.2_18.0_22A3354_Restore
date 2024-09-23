@implementation MOPassthroughSubjectConduit

- (void)requestDemand:(unint64_t)a3
{
  NSObject *obj;

  obj = self->_lock;
  objc_sync_enter(obj);
  self->_demand = MOAddDemand(self->_demand, a3);
  objc_sync_exit(obj);

}

- (MOPassthroughSubjectConduit)initWithDownstream:(id)a3 parent:(id)a4
{
  id v5;
  id v6;
  MOPassthroughSubjectConduit *v7;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  NSObject *lock;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MOPassthroughSubjectConduit;
  v5 = a4;
  v6 = a3;
  v7 = -[MOPassthroughSubjectConduit init](&v13, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v13.receiver, v13.super_class);
  v8 = objc_claimAutoreleasedReturnValue();
  identifier = v7->_identifier;
  v7->_identifier = (NSUUID *)v8;

  objc_storeWeak((id *)&v7->_downstream, v6);
  objc_storeWeak((id *)&v7->_parent, v5);

  v7->_demand = 0;
  v7->_active = 1;
  v10 = objc_opt_new();
  lock = v7->_lock;
  v7->_lock = v10;

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)dealloc
{
  objc_super v3;

  -[MOPassthroughSubjectConduit cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MOPassthroughSubjectConduit;
  -[MOPassthroughSubjectConduit dealloc](&v3, sel_dealloc);
}

- (BOOL)hasDemand
{
  NSObject *v3;
  BOOL v4;

  v3 = self->_lock;
  objc_sync_enter(v3);
  v4 = self->_active && self->_demand != 0;
  objc_sync_exit(v3);

  return v4;
}

- (unint64_t)currentDemand
{
  NSObject *v3;
  unint64_t demand;

  v3 = self->_lock;
  objc_sync_enter(v3);
  demand = self->_demand;
  objc_sync_exit(v3);

  return demand;
}

- (void)offerInput:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = self->_lock;
  objc_sync_enter(v4);
  if (!self->_active || !self->_demand)
  {
    WeakRetained = 0;
LABEL_7:
    objc_sync_exit(v4);

    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
  self->_demand = MOSubtractDemand(self->_demand, 1uLL);
  objc_sync_exit(v4);

  v6 = objc_msgSend(WeakRetained, "receiveInput:", v8);
  if (v6)
  {
    v7 = v6;
    v4 = self->_lock;
    objc_sync_enter(v4);
    if (self->_active)
      self->_demand = MOAddDemand(self->_demand, v7);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)finishWithCompletion:(id)a3
{
  NSObject *v4;
  NSObject *WeakRetained;
  id v6;

  v6 = a3;
  v4 = self->_lock;
  objc_sync_enter(v4);
  if (self->_active)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    objc_sync_exit(v4);

    -[MOPassthroughSubjectConduit cancel](self, "cancel");
    -[NSObject receiveCompletion:](WeakRetained, "receiveCompletion:", v6);
    v4 = WeakRetained;
  }
  else
  {
    objc_sync_exit(v4);
  }

}

- (void)cancel
{
  NSObject *WeakRetained;
  NSObject *v4;
  NSObject *obj;

  obj = self->_lock;
  objc_sync_enter(obj);
  if (self->_active)
  {
    self->_active = 0;
    self->_demand = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    objc_storeWeak((id *)&self->_parent, 0);
    objc_storeWeak((id *)&self->_downstream, 0);
    objc_sync_exit(obj);

    -[NSObject disassociate:](WeakRetained, "disassociate:", self->_identifier);
    v4 = WeakRetained;
  }
  else
  {
    objc_sync_exit(obj);
    v4 = obj;
  }

}

- (MOSubscriber)downstream
{
  return (MOSubscriber *)objc_loadWeakRetained((id *)&self->_downstream);
}

- (MOPassthroughSubject)parent
{
  return (MOPassthroughSubject *)objc_loadWeakRetained((id *)&self->_parent);
}

- (unint64_t)demand
{
  return self->_demand;
}

- (BOOL)active
{
  return self->_active;
}

- (NSObject)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_downstream);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
