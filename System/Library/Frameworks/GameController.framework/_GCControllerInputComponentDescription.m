@implementation _GCControllerInputComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCControllerInputComponentDescription)initWithIdentifier:(id)a3 controllerInputs:(id)a4 bindings:(id)a5
{
  _GCControllerInputDescription *v8;
  id v9;
  id v10;
  _GCControllerInputComponentDescription *v11;
  uint64_t v12;
  NSObject *identifier;
  _GCControllerInputDescription *controllerInputDescriptions;
  _GCControllerInputDescription *v15;
  uint64_t v16;
  NSArray *bindingDescriptions;
  objc_super v19;

  v8 = (_GCControllerInputDescription *)a4;
  v19.receiver = self;
  v19.super_class = (Class)_GCControllerInputComponentDescription;
  v9 = a5;
  v10 = a3;
  v11 = -[_GCControllerInputComponentDescription init](&v19, sel_init);
  v12 = objc_msgSend(v10, "copyWithZone:", 0, v19.receiver, v19.super_class);

  identifier = v11->_identifier;
  v11->_identifier = v12;

  controllerInputDescriptions = v11->_controllerInputDescriptions;
  v11->_controllerInputDescriptions = v8;
  v15 = v8;

  v16 = objc_msgSend(v9, "copy");
  bindingDescriptions = v11->_bindingDescriptions;
  v11->_bindingDescriptions = (NSArray *)v16;

  return v11;
}

- (_GCControllerInputComponentDescription)init
{
  -[_GCControllerInputComponentDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_GCControllerInputComponentDescription)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _GCControllerInputComponentDescription *v11;

  v4 = initWithCoder__onceToken_0;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_169);
  GCIPCObjectIdentifier_Classes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("input"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", initWithCoder__BindingClasses_0, CFSTR("bindings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:](self, "initWithIdentifier:controllerInputs:bindings:", v7, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_controllerInputDescriptions, CFSTR("input"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bindingDescriptions, CFSTR("bindings"));

}

- (id)materializeWithContext:(id)a3
{
  id v4;
  _GCControllerInputComponent *materializedInputComponent;
  _GCControllerInputComponent *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _GCControllerInputComponent *v16;
  _GCControllerInputComponent *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  materializedInputComponent = self->_materializedInputComponent;
  if (!materializedInputComponent)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_bindingDescriptions;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "materializeWithContext:", v4, (_QWORD)v19);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          break;
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

        if (v10 == ++v12)
        {
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            goto LABEL_5;
          break;
        }
      }
    }

    v15 = objc_msgSend(v7, "count");
    if (v15 != -[NSArray count](self->_bindingDescriptions, "count")
      || (-[_GCControllerInputComponentDescription createWithContext:](self, "createWithContext:", v4),
          v16 = (_GCControllerInputComponent *)objc_claimAutoreleasedReturnValue(),
          v17 = self->_materializedInputComponent,
          self->_materializedInputComponent = v16,
          v17,
          !self->_materializedInputComponent))
    {

      v6 = 0;
      goto LABEL_15;
    }
    -[_GCControllerInputComponentDescription _applyBinding:toComponent:](self, "_applyBinding:toComponent:", v7);

    materializedInputComponent = self->_materializedInputComponent;
  }
  v6 = materializedInputComponent;
LABEL_15:

  return v6;
}

- (id)createWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _GCControllerInputComponent *v7;

  v4 = -[GCDevicePhysicalInputDescription makeFacadeParameters](self->_controllerInputDescriptions, "makeFacadeParameters", a3);
  -[_GCControllerInputDescription elements](self->_controllerInputDescriptions, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_179);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_GCControllerInputComponent initWithIdentifier:templateFacadeParameters:templateElementParameters:]([_GCControllerInputComponent alloc], "initWithIdentifier:templateFacadeParameters:templateElementParameters:", self->_identifier, v4, v6);
  return v7;
}

- (BOOL)update:(id)a3 withContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCControllerInputComponentDescription identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCControllerInputComponent.m"), 669, &stru_24D2B85A8);

  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = self->_bindingDescriptions;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
LABEL_5:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v16)
        objc_enumerationMutation(v13);
      objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "materializeWithContext:", v8, (_QWORD)v24);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
        break;
      v19 = (void *)v18;
      objc_msgSend(v12, "addObject:", v18);

      if (v15 == ++v17)
      {
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
          goto LABEL_5;
        break;
      }
    }
  }

  v20 = objc_msgSend(v12, "count");
  v21 = -[NSArray count](self->_bindingDescriptions, "count");
  if (v20 == v21)
    -[_GCControllerInputComponentDescription _applyBinding:toComponent:](self, "_applyBinding:toComponent:", v12, v7);

  return v20 == v21;
}

- (void)_applyBinding:(id)a3 toComponent:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_254DC5590))
  {
    objc_msgSend(v6, "setGamepadEventSource:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v12, "conformsToProtocol:", &unk_254DC71D0, (_QWORD)v13))
            objc_msgSend(v6, "setGamepadEventSource:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (_GCControllerInputDescription)controllerInputDescriptions
{
  return (_GCControllerInputDescription *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_materializedInputComponent, 0);
  objc_storeStrong((id *)&self->_bindingDescriptions, 0);
  objc_storeStrong((id *)&self->_controllerInputDescriptions, 0);
}

@end
