@implementation _GCDevicePhysicalInputComponent

- (id)_initWithIdentifier:(void *)a3 physicalInputGroup:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v10;
  objc_super v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithIdentifier_physicalInputGroup_, a1, CFSTR("_GCDevicePhysicalInputComponent.m"), 24, CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");

    }
    v11.receiver = a1;
    v11.super_class = (Class)_GCDevicePhysicalInputComponent;
    a1 = (id *)objc_msgSendSuper2(&v11, sel_init);
    v7 = objc_msgSend(v5, "copyWithZone:", 0);
    v8 = a1[3];
    a1[3] = (id)v7;

    objc_storeStrong(a1 + 1, a3);
    -[_GCDevicePhysicalInputGroup setDataSource:]((id *)a1[1], a1);
  }

  return a1;
}

- (_GCDevicePhysicalInputComponent)initWithIdentifier:(id)a3 physicalInputs:(id)a4
{
  id v6;
  id v7;
  _GCDevicePhysicalInputGroup *v8;
  _GCDevicePhysicalInputComponent *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_GCDevicePhysicalInputGroup initWithPhysicalInputs:]([_GCDevicePhysicalInputGroup alloc], "initWithPhysicalInputs:", v6);

  v9 = (_GCDevicePhysicalInputComponent *)-[_GCDevicePhysicalInputComponent _initWithIdentifier:physicalInputGroup:]((id *)&self->super.isa, v7, v8);
  return v9;
}

- (_GCDevicePhysicalInputComponent)initWithIdentifier:(id)a3 defaultPhysicalInput:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _GCDevicePhysicalInputComponent *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputComponent.m"), 39, CFSTR("Invalid parameter not satisfying: %s"), "physicalInput != nil");

  }
  v13[0] = v8;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_GCDevicePhysicalInputComponent initWithIdentifier:physicalInputs:](self, "initWithIdentifier:physicalInputs:", v7, v9);

  return v10;
}

- (_GCDevicePhysicalInputComponent)init
{
  -[_GCDevicePhysicalInputComponent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)defaultPhysicalInputGroup
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

- (id)defaultPhysicalInput
{
  if (a1)
  {
    -[_GCDevicePhysicalInputGroup defaultPhysicalInput](a1[1], a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setDevice:(id)a3
{
  -[_GCDevicePhysicalInputGroup setDevice:](self->_defaultPhysicalInputGroup, "setDevice:", a3);
}

- (void)setDispatchQueue:(id)a3
{
  -[_GCDevicePhysicalInputGroup setDeviceDispatchQueue:](self->_defaultPhysicalInputGroup, a3);
}

- (id)capture
{
  _GCDevicePhysicalInputComponent *v3;
  void *v4;
  void *v5;
  id *v6;

  v3 = [_GCDevicePhysicalInputComponent alloc];
  -[_GCDevicePhysicalInputComponent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputGroup capture]((uint64_t)self->_defaultPhysicalInputGroup);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_GCDevicePhysicalInputComponent _initWithIdentifier:physicalInputGroup:]((id *)&v3->super.isa, v4, v5);

  return v6;
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 24, 1);
}

- (id)device
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_gamepadEventObservation, 0);
  objc_storeStrong((id *)&self->_defaultPhysicalInputGroup, 0);
}

- (void)handleGamepadEvent:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[_GCDevicePhysicalInputGroup queue](self->_defaultPhysicalInputGroup);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62___GCDevicePhysicalInputComponent_PubSub__handleGamepadEvent___block_invoke;
    v6[3] = &unk_24D2B2B48;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)setGamepadEventSource:(id)a3
{
  id v4;
  id gamepadEventObservation;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = a3;
  if (!-[_GCDevicePhysicalInputGroup isSnapshot]((_BOOL8)self->_defaultPhysicalInputGroup))
  {
    gamepadEventObservation = self->_gamepadEventObservation;
    self->_gamepadEventObservation = 0;

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65___GCDevicePhysicalInputComponent_PubSub__setGamepadEventSource___block_invoke;
    v8[3] = &__block_descriptor_40_e27_v16__0____GCGamepadEvent__8lu32l8;
    v8[4] = self;
    objc_msgSend(v4, "observeGamepadEvents:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_gamepadEventObservation;
    self->_gamepadEventObservation = v6;

  }
}

@end
