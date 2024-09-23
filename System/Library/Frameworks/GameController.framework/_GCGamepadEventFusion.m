@implementation _GCGamepadEventFusion

- (_GCGamepadEventFusion)initWithConfiguration:(id)a3 sources:(id)a4
{
  id v8;
  id v9;
  _GCGamepadEventFusion *v10;
  _GCGamepadEventFusion *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *lastEvent;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *observations;
  uint64_t v23;
  NSArray *observers;
  void *v26;
  _QWORD v27[6];
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)_GCGamepadEventFusion;
  v10 = -[_GCGamepadEventFusion init](&v28, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a3);
    v11->_lastEvent = (id *)malloc_type_calloc(objc_msgSend(v9, "count"), 8uLL, 0x80040B8603338uLL);
    v12 = objc_msgSend(v8, "sourceCount");
    if (v12 != objc_msgSend(v9, "count"))
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("_GCGamepadEventFusion.m"), 242, CFSTR("Sources count does not match the configuration"));

    }
    v13 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", objc_msgSend(v9, "count"));
    if (objc_msgSend(v9, "count"))
    {
      v14 = 0;
      v15 = MEMORY[0x24BDAC760];
      do
      {
        v16 = objc_opt_new();
        lastEvent = v11->_lastEvent;
        v18 = lastEvent[v14];
        lastEvent[v14] = (id)v16;

        objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v15;
        v27[1] = 3221225472;
        v27[2] = __55___GCGamepadEventFusion_initWithConfiguration_sources___block_invoke;
        v27[3] = &__block_descriptor_48_e27_v16__0____GCGamepadEvent__8lu32l8;
        v27[4] = v11;
        v27[5] = v14;
        objc_msgSend(v19, "observeGamepadEvents:", v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "addObject:", v20);
        ++v14;
      }
      while (v14 < objc_msgSend(v9, "count"));
    }
    v21 = objc_msgSend(v13, "copy");
    observations = v11->_observations;
    v11->_observations = (NSArray *)v21;

    v23 = objc_opt_new();
    observers = v11->_observers;
    v11->_observers = (NSArray *)v23;

  }
  return v11;
}

- (_GCGamepadEventFusion)init
{
  -[_GCGamepadEventFusion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  NSArray *observations;
  unint64_t v4;
  id *lastEvent;
  id v6;
  objc_super v7;

  observations = self->_observations;
  self->_observations = 0;

  if (-[_GCGamepadEventFusionConfig sourceCount](self->_config, "sourceCount"))
  {
    v4 = 0;
    do
    {
      lastEvent = self->_lastEvent;
      v6 = lastEvent[v4];
      lastEvent[v4] = 0;

      ++v4;
    }
    while (v4 < -[_GCGamepadEventFusionConfig sourceCount](self->_config, "sourceCount"));
  }
  free(self->_lastEvent);
  v7.receiver = self;
  v7.super_class = (Class)_GCGamepadEventFusion;
  -[_GCGamepadEventFusion dealloc](&v7, sel_dealloc);
}

- (id)observeGamepadEvents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _GCObservation *v14;
  id v15;
  _GCObservation *v16;
  _QWORD v18[5];
  id v19;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[_GCGamepadEventFusion observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCGamepadEventFusion observers](self, "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCGamepadEventFusion setObservers:](self, "setObservers:", v9);
      -[_GCGamepadEventFusion observers](self, "observers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __46___GCGamepadEventFusion_observeGamepadEvents___block_invoke;
  v18[3] = &unk_24D2B2AD0;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = -[_GCObservation initWithCleanupHandler:](v14, "initWithCleanupHandler:", v18);

  return v16;
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
  objc_storeStrong((id *)&self->_observations, a3);
}

- (NSArray)observers
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
