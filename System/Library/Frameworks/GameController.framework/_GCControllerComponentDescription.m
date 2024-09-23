@implementation _GCControllerComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCControllerComponentDescription)initWithComponent:(id)a3 bindings:(id)a4
{
  id v7;
  id v8;
  _GCControllerComponentDescription *v9;
  _GCControllerComponentDescription *v10;
  uint64_t v11;
  NSArray *bindingDescriptions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCControllerComponentDescription;
  v9 = -[_GCControllerComponentDescription init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_component, a3);
    v11 = objc_msgSend(v8, "copy");
    bindingDescriptions = v10->_bindingDescriptions;
    v10->_bindingDescriptions = (NSArray *)v11;

  }
  return v10;
}

- (_GCControllerComponentDescription)initWithComponent:(id)a3
{
  return -[_GCControllerComponentDescription initWithComponent:bindings:](self, "initWithComponent:bindings:", a3, 0);
}

- (_GCControllerComponentDescription)init
{
  -[_GCControllerComponentDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_GCControllerComponentDescription)initWithCoder:(id)a3
{
  id v4;
  _GCControllerComponentDescription *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  GCControllerComponent *component;
  uint64_t v10;
  NSArray *bindingDescriptions;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GCControllerComponentDescription;
  v5 = -[_GCControllerComponentDescription init](&v13, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_15);
    GCControllerComponent_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("component"));
    v8 = objc_claimAutoreleasedReturnValue();
    component = v5->_component;
    v5->_component = (GCControllerComponent *)v8;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__BindingClasses, CFSTR("bindings"));
    v10 = objc_claimAutoreleasedReturnValue();
    bindingDescriptions = v5->_bindingDescriptions;
    v5->_bindingDescriptions = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *bindingDescriptions;
  id v5;

  bindingDescriptions = self->_bindingDescriptions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bindingDescriptions, CFSTR("bindings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_component, CFSTR("component"));

}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCControllerComponentDescription identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '%@'>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)redactedDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCControllerComponentDescription identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '#%llx'>"), v4, objc_msgSend(v5, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCControllerComponentDescription identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerComponent debugDescription](self->_component, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray debugDescription](self->_bindingDescriptions, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p '%@'> {\n\tcomponent: %@\n\tbindings: %@\n}"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSObject)identifier
{
  return -[GCControllerComponent identifier](self->_component, "identifier");
}

- (id)materializeWithContext:(id)a3
{
  id v4;
  GCControllerComponent *materializedComponent;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  GCControllerComponent *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  materializedComponent = self->_materializedComponent;
  if (!materializedComponent)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", -[NSArray count](self->_bindingDescriptions, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_bindingDescriptions;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "materializeWithContext:", v4, (_QWORD)v17);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
          break;
        v13 = (void *)v12;
        objc_msgSend(v6, "addObject:", v12);

        if (v9 == ++v11)
        {
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

    v14 = objc_msgSend(v6, "count");
    if (v14 != -[NSArray count](self->_bindingDescriptions, "count"))
    {

      v15 = 0;
      goto LABEL_13;
    }
    -[_GCControllerComponentDescription _applyBinding:toComponent:](self, "_applyBinding:toComponent:", v6, self->_component);
    objc_storeStrong((id *)&self->_materializedComponent, self->_component);

    materializedComponent = self->_materializedComponent;
  }
  v15 = materializedComponent;
LABEL_13:

  return v15;
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
  -[_GCControllerComponentDescription identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerComponent.m"), 145, &stru_24D2B85A8);

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
    -[_GCControllerComponentDescription _applyBinding:toComponent:](self, "_applyBinding:toComponent:", v12, v7);

  return v20 == v21;
}

- (void)_applyBinding:(id)a3 toComponent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_254DEB1D8))
  {
    -[GCControllerComponent setHIDEventSource:](self->_component, "setHIDEventSource:", 0);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v13, "conformsToProtocol:", &unk_254DC0B48))
            -[GCControllerComponent setHIDEventSource:](self->_component, "setHIDEventSource:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      }
      while (v10);
    }

  }
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_254DC5590))
  {
    -[GCControllerComponent setGamepadEventSource:](self->_component, "setGamepadEventSource:", 0);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          if (objc_msgSend(v19, "conformsToProtocol:", &unk_254DC71D0))
            -[GCControllerComponent setGamepadEventSource:](self->_component, "setGamepadEventSource:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      }
      while (v16);
    }

  }
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_254DD7538))
  {
    -[GCControllerComponent setKeyboardEventSource:](self->_component, "setKeyboardEventSource:", 0);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = v6;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
          if (objc_msgSend(v25, "conformsToProtocol:", &unk_254DC0678))
            -[GCControllerComponent setKeyboardEventSource:](self->_component, "setKeyboardEventSource:", v25);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      }
      while (v22);
    }

  }
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_254DCBFF8))
  {
    -[GCControllerComponent setMotionEventSource:](self->_component, "setMotionEventSource:", 0);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = v6;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v33;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * m);
          if (objc_msgSend(v31, "conformsToProtocol:", &unk_254DD39F0, (_QWORD)v32))
            -[GCControllerComponent setMotionEventSource:](self->_component, "setMotionEventSource:", v31);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
      }
      while (v28);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedComponent, 0);
  objc_storeStrong((id *)&self->_bindingDescriptions, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
