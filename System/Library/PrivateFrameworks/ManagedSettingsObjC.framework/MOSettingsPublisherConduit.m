@implementation MOSettingsPublisherConduit

- (void)receiveSubscription:(id)a3
{
  NSObject *v5;
  id v6;
  MOSubscription *upstream;
  id WeakRetained;
  id v9;

  v9 = a3;
  v5 = self->_lock;
  objc_sync_enter(v5);
  if (self->_active
    && (v6 = objc_loadWeakRetained((id *)&self->_downstream)) != 0
    && (upstream = self->_upstream, v6, !upstream))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    objc_storeStrong((id *)&self->_upstream, a3);
    objc_sync_exit(v5);

    objc_msgSend(WeakRetained, "receiveSubscription:", self);
  }
  else
  {
    objc_sync_exit(v5);

    objc_msgSend(v9, "cancel");
  }

}

- (void)requestDemand:(unint64_t)a3
{
  NSObject *v5;
  unint64_t demand;
  void *v7;
  MOSubscription *v8;

  v5 = self->_lock;
  objc_sync_enter(v5);
  if (self->_active)
  {
    demand = self->_demand;
    v8 = self->_upstream;
    self->_demand = MOAddDemand(self->_demand, a3);
    objc_sync_exit(v5);

    if (!demand)
      (*((void (**)(void))self->_startBlock + 2))();
    -[MOSubscription requestDemand:](v8, "requestDemand:", a3);
    v7 = v8;
  }
  else
  {
    objc_sync_exit(v5);
    v7 = v5;
  }

}

- (MOSettingsPublisherConduit)initWithDownstream:(id)a3 interestedGroups:(id)a4 startBlock:(id)a5 stopBlock:(id)a6
{
  NSSet *v10;
  id v11;
  id v12;
  id v13;
  MOSettingsPublisherConduit *v14;
  uint64_t v15;
  NSUUID *identifier;
  NSSet *interestedGroups;
  NSSet *v18;
  uint64_t v19;
  id startBlock;
  uint64_t v21;
  id stopBlock;
  uint64_t v23;
  NSObject *lock;
  objc_super v26;

  v10 = (NSSet *)a4;
  v26.receiver = self;
  v26.super_class = (Class)MOSettingsPublisherConduit;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = -[MOSubscriber initSubscriber](&v26, sel_initSubscriber);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v26.receiver, v26.super_class);
  v15 = objc_claimAutoreleasedReturnValue();
  identifier = v14->_identifier;
  v14->_identifier = (NSUUID *)v15;

  objc_storeWeak((id *)&v14->_downstream, v13);
  interestedGroups = v14->_interestedGroups;
  v14->_interestedGroups = v10;
  v18 = v10;

  v19 = MEMORY[0x1B5E3442C](v12);
  startBlock = v14->_startBlock;
  v14->_startBlock = (id)v19;

  v21 = MEMORY[0x1B5E3442C](v11);
  stopBlock = v14->_stopBlock;
  v14->_stopBlock = (id)v21;

  v14->_demand = 0;
  v14->_active = 1;
  v23 = objc_opt_new();
  lock = v14->_lock;
  v14->_lock = v23;

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[MOSettingsPublisherConduit cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MOSettingsPublisherConduit;
  -[MOSettingsPublisherConduit dealloc](&v3, sel_dealloc);
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

- (unint64_t)receiveInput:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  unint64_t demand;
  BOOL v9;
  id WeakRetained;
  unint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = self->_lock;
  objc_sync_enter(v6);
  if (self->_active
    && (v7 = objc_loadWeakRetained((id *)&self->_downstream)) != 0
    && (v18 = v5, demand = self->_demand, v7, v9 = demand == 0, v5 = v18, !v9))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    objc_msgSend(v18, "intersectSet:", self->_interestedGroups);
    if (objc_msgSend(v18, "count"))
    {
      v11 = MOSubtractDemand(self->_demand, 1uLL);
      self->_demand = v11;
      v12 = v11 == 0;
    }
    else
    {
      v12 = 0;
    }
    objc_sync_exit(v6);

    if (objc_msgSend(v18, "count"))
    {
      v15 = v12;
      v16 = (void *)objc_msgSend(v18, "copy");
      v13 = objc_msgSend(WeakRetained, "receiveInput:", v16);

      if (v13)
      {
        v17 = self->_lock;
        objc_sync_enter(v17);
        if (self->_active)
        {
          self->_demand = MOAddDemand(self->_demand, v13);
          objc_sync_exit(v17);

LABEL_18:
          v5 = v18;
          goto LABEL_7;
        }
        objc_sync_exit(v17);

      }
      else if (v15)
      {
        (*((void (**)(void))self->_stopBlock + 2))();
      }
      v13 = 0;
      goto LABEL_18;
    }
    v13 = MODemandMax(1);
    v5 = v18;
  }
  else
  {
    objc_sync_exit(v6);

    WeakRetained = 0;
    v13 = 0;
  }
LABEL_7:

  return v13;
}

- (void)receiveCompletion:(id)a3
{
  NSObject *v4;
  id v5;
  NSObject *WeakRetained;
  id v7;

  v7 = a3;
  v4 = self->_lock;
  objc_sync_enter(v4);
  if (self->_active && (v5 = objc_loadWeakRetained((id *)&self->_downstream), v5, v5))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    objc_sync_exit(v4);

    -[MOSettingsPublisherConduit cancel](self, "cancel");
    -[NSObject receiveCompletion:](WeakRetained, "receiveCompletion:", v7);
    v4 = WeakRetained;
  }
  else
  {
    objc_sync_exit(v4);
  }

}

- (void)cancel
{
  NSObject *v3;
  unint64_t demand;
  MOSubscription *upstream;
  void *v6;
  MOSubscription *v7;

  v3 = self->_lock;
  objc_sync_enter(v3);
  if (self->_active)
  {
    demand = self->_demand;
    v7 = self->_upstream;
    self->_active = 0;
    self->_demand = 0;
    objc_storeWeak((id *)&self->_downstream, 0);
    upstream = self->_upstream;
    self->_upstream = 0;

    objc_sync_exit(v3);
    if (demand)
      (*((void (**)(void))self->_stopBlock + 2))();
    -[MOSubscription cancel](v7, "cancel");
    v6 = v7;
  }
  else
  {
    objc_sync_exit(v3);
    v6 = v3;
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (MOSubscriber)downstream
{
  return (MOSubscriber *)objc_loadWeakRetained((id *)&self->_downstream);
}

- (MOSubscription)upstream
{
  return self->_upstream;
}

- (NSSet)interestedGroups
{
  return self->_interestedGroups;
}

- (id)startBlock
{
  return self->_startBlock;
}

- (id)stopBlock
{
  return self->_stopBlock;
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
  objc_storeStrong(&self->_stopBlock, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong((id *)&self->_interestedGroups, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_destroyWeak((id *)&self->_downstream);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
