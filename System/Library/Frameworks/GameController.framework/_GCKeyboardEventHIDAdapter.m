@implementation _GCKeyboardEventHIDAdapter

- (_GCKeyboardEventHIDAdapter)initWithSource:(id)a3 service:(id)a4
{
  id v7;
  id v8;
  _GCKeyboardEventHIDAdapter *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *observers;
  uint64_t v15;
  id HIDEventObservation;
  _QWORD v18[6];
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_GCKeyboardEventHIDAdapter;
  v9 = -[_GCKeyboardEventHIDAdapter init](&v19, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "registryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __53___GCKeyboardEventHIDAdapter_initWithSource_service___block_invoke;
    v18[3] = &__block_descriptor_48_e23_v16__0____IOHIDEvent__8lu40l8;
    v18[4] = v11;
    v18[5] = v9;
    v12 = (void *)MEMORY[0x2199DEBB0](v18);
    v13 = objc_opt_new();
    observers = v9->_observers;
    v9->_observers = (NSArray *)v13;

    objc_storeStrong((id *)&v9->_HIDEventSource, a3);
    objc_msgSend(v7, "observeHIDEvents:forService:", v12, v8);
    v15 = objc_claimAutoreleasedReturnValue();
    HIDEventObservation = v9->_HIDEventObservation;
    v9->_HIDEventObservation = (id)v15;

  }
  return v9;
}

- (_GCKeyboardEventHIDAdapter)init
{
  -[_GCKeyboardEventHIDAdapter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  id HIDEventObservation;
  _GCHIDEventSource *HIDEventSource;
  objc_super v5;

  HIDEventObservation = self->_HIDEventObservation;
  self->_HIDEventObservation = 0;

  HIDEventSource = self->_HIDEventSource;
  self->_HIDEventSource = 0;

  v5.receiver = self;
  v5.super_class = (Class)_GCKeyboardEventHIDAdapter;
  -[_GCKeyboardEventHIDAdapter dealloc](&v5, sel_dealloc);
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
  -[_GCKeyboardEventHIDAdapter observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x2199DEBB0](v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    do
    {
      -[_GCKeyboardEventHIDAdapter observers](self, "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = (void *)MEMORY[0x2199DEBB0](v4);
      objc_msgSend(v9, "addObject:", v10);

      -[_GCKeyboardEventHIDAdapter setObservers:](self, "setObservers:", v9);
      -[_GCKeyboardEventHIDAdapter observers](self, "observers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199DEBB0](v4);
      v13 = objc_msgSend(v11, "containsObject:", v12);

    }
    while (!v13);
  }
  v14 = [_GCObservation alloc];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52___GCKeyboardEventHIDAdapter_observeKeyboardEvents___block_invoke;
  v18[3] = &unk_24D2B2AD0;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = -[_GCObservation initWithCleanupHandler:](v14, "initWithCleanupHandler:", v18);

  return v16;
}

- (_GCHIDEventSource)HIDEventSource
{
  return self->_HIDEventSource;
}

- (void)setHIDEventSource:(id)a3
{
  objc_storeStrong((id *)&self->_HIDEventSource, a3);
}

- (id)HIDEventObservation
{
  return self->_HIDEventObservation;
}

- (void)setHIDEventObservation:(id)a3
{
  objc_storeStrong(&self->_HIDEventObservation, a3);
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
  objc_storeStrong(&self->_HIDEventObservation, 0);
  objc_storeStrong((id *)&self->_HIDEventSource, 0);
}

@end
