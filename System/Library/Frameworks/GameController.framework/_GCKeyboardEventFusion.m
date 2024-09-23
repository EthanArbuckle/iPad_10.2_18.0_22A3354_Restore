@implementation _GCKeyboardEventFusion

- (_GCKeyboardEventFusion)initWithSources:(id)a3
{
  id v4;
  _GCKeyboardEventFusion *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *observations;
  uint64_t v13;
  NSArray *observers;
  _QWORD v16[5];
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_GCKeyboardEventFusion;
  v5 = -[_GCKeyboardEventFusion init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", objc_msgSend(v4, "count"));
    if (objc_msgSend(v4, "count"))
    {
      v7 = 0;
      v8 = MEMORY[0x24BDAC760];
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v8;
        v16[1] = 3221225472;
        v16[2] = __42___GCKeyboardEventFusion_initWithSources___block_invoke;
        v16[3] = &__block_descriptor_40_e28_v16__0____GCKeyboardEvent__8lu32l8;
        v16[4] = v5;
        objc_msgSend(v9, "observeKeyboardEvents:", v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "addObject:", v10);
        ++v7;
      }
      while (v7 < objc_msgSend(v4, "count"));
    }
    v11 = objc_msgSend(v6, "copy");
    observations = v5->_observations;
    v5->_observations = (NSArray *)v11;

    v13 = objc_opt_new();
    observers = v5->_observers;
    v5->_observers = (NSArray *)v13;

  }
  return v5;
}

- (_GCKeyboardEventFusion)init
{
  -[_GCKeyboardEventFusion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  NSArray *observations;
  objc_super v4;

  observations = self->_observations;
  self->_observations = 0;

  v4.receiver = self;
  v4.super_class = (Class)_GCKeyboardEventFusion;
  -[_GCKeyboardEventFusion dealloc](&v4, sel_dealloc);
}

- (id)observeKeyboardEvents:(id)a3
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
  -[_GCKeyboardEventFusion observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCKeyboardEventFusion observers](self, "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCKeyboardEventFusion setObservers:](self, "setObservers:", v9);
      -[_GCKeyboardEventFusion observers](self, "observers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __48___GCKeyboardEventFusion_observeKeyboardEvents___block_invoke;
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
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observations, 0);
}

@end
