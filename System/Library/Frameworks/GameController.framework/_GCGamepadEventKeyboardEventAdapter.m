@implementation _GCGamepadEventKeyboardEventAdapter

- (_GCGamepadEventKeyboardEventAdapter)initWithConfiguration:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  _GCGamepadEventKeyboardEventAdapter *v9;
  _GCGamepadEventKeyboardEventAdapter *v10;
  uint64_t v11;
  id observation;
  uint64_t v13;
  NSArray *observers;
  _QWORD v16[5];
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GCGamepadEventKeyboardEventAdapter;
  v9 = -[_GCGamepadEventKeyboardEventAdapter init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68___GCGamepadEventKeyboardEventAdapter_initWithConfiguration_source___block_invoke;
    v16[3] = &__block_descriptor_40_e28_v16__0____GCKeyboardEvent__8lu32l8;
    v16[4] = v10;
    objc_msgSend(v8, "observeKeyboardEvents:", v16);
    v11 = objc_claimAutoreleasedReturnValue();
    observation = v10->_observation;
    v10->_observation = (id)v11;

    v13 = objc_opt_new();
    observers = v10->_observers;
    v10->_observers = (NSArray *)v13;

  }
  return v10;
}

- (_GCGamepadEventKeyboardEventAdapter)init
{
  -[_GCGamepadEventKeyboardEventAdapter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  id observation;
  objc_super v4;

  observation = self->_observation;
  self->_observation = 0;

  v4.receiver = self;
  v4.super_class = (Class)_GCGamepadEventKeyboardEventAdapter;
  -[_GCGamepadEventKeyboardEventAdapter dealloc](&v4, sel_dealloc);
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
  -[_GCGamepadEventKeyboardEventAdapter observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCGamepadEventKeyboardEventAdapter observers](self, "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCGamepadEventKeyboardEventAdapter setObservers:](self, "setObservers:", v9);
      -[_GCGamepadEventKeyboardEventAdapter observers](self, "observers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60___GCGamepadEventKeyboardEventAdapter_observeGamepadEvents___block_invoke;
  v18[3] = &unk_24D2B2AD0;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = -[_GCObservation initWithCleanupHandler:](v14, "initWithCleanupHandler:", v18);

  return v16;
}

- (NSArray)observers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong(&self->_observation, 0);
}

@end
