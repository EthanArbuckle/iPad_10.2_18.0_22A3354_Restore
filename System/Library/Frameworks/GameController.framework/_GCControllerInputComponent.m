@implementation _GCControllerInputComponent

- (_GCControllerInputComponent)initWithIdentifier:(id)a3 templateFacadeParameters:(id)a4 templateElementParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _GCDevicePhysicalInput *v14;
  void *v15;
  _GCDevicePhysicalInput *v16;
  _GCDevicePhysicalInput *v17;
  void *v18;
  _GCDevicePhysicalInput *v19;
  void *v20;
  _GCControllerInputComponent *v21;
  uint64_t v22;
  NSArray *templateElementParameters;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewClass")), "initWithParameters:", v9);

  objc_msgSend(v8, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [_GCDevicePhysicalInput alloc];
  +[NSSet set](&off_254DEBEC0, "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_GCDevicePhysicalInput initWithFacade:elements:attributes:](v14, "initWithFacade:elements:attributes:", v11, v13, v15);

  v17 = [_GCDevicePhysicalInput alloc];
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("unmapped"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_GCDevicePhysicalInput initWithFacade:elements:attributes:](v17, "initWithFacade:elements:attributes:", v11, v13, v18);

  v26[0] = v16;
  v26[1] = v19;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v26, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)_GCControllerInputComponent;
  v21 = -[_GCDevicePhysicalInputComponent initWithIdentifier:physicalInputs:](&v25, sel_initWithIdentifier_physicalInputs_, v10, v20);

  v22 = objc_msgSend(v8, "copy");
  templateElementParameters = v21->_templateElementParameters;
  v21->_templateElementParameters = (NSArray *)v22;

  return v21;
}

- (void)setController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_GCDevicePhysicalInputComponent setDevice:](self, "setDevice:", v4);
  objc_msgSend(v4, "handlerQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[_GCDevicePhysicalInputComponent setDispatchQueue:](self, "setDispatchQueue:", v5);
}

- (void)handleGamepadEvent:(id)a3
{
  _GCGamepadEventImpl *v4;
  _GCGamepadEventImpl *v5;
  _GCControllerInputComponent *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (_GCGamepadEventImpl *)a3;
  if (-[NSArray count](self->_eventRemappingActions, "count"))
  {
    v5 = -[_GCGamepadEventImpl initWithGamepadEvent:]([_GCGamepadEventImpl alloc], "initWithGamepadEvent:", v4);
    v6 = self;
    objc_sync_enter(v6);
    v7 = self->_eventRemappingActions;
    objc_sync_exit(v6);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++) + 16))();
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  else
  {
    v5 = v4;
  }
  v13.receiver = self;
  v13.super_class = (Class)_GCControllerInputComponent;
  -[_GCDevicePhysicalInputComponent handleGamepadEvent:](&v13, sel_handleGamepadEvent_, v5);

}

- (void)setSettingsProfile:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  char isKindOfClass;
  _BYTE *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  _GCControllerInputComponent *v12;
  id v13;

  v4 = a3;
  -[_GCDevicePhysicalInputComponent defaultPhysicalInput]((id *)&self->super.super.isa, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v4 && (isKindOfClass & 1) != 0)
  {
    -[_GCDevicePhysicalInputComponent defaultPhysicalInputGroup]((id *)&self->super.super.isa);
    v8 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputGroup queue](v8);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke;
    block[3] = &unk_24D2B3D70;
    v11 = v4;
    v12 = self;
    v13 = v6;
    dispatch_async(v9, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRemappingActions, 0);
  objc_storeStrong((id *)&self->_appliedSettingsProfile, 0);
  objc_storeStrong((id *)&self->_templateElementParameters, 0);
}

@end
