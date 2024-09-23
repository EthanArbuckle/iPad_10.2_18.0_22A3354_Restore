@implementation _GCDevicePhysicalInputComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCDevicePhysicalInputComponentDescription)initWithIdentifier:(id)a3 elements:(id)a4 bindings:(id)a5
{
  id v7;
  id v8;
  id v9;
  _GCDevicePhysicalInputComponentDescription *v10;
  uint64_t v11;
  NSObject *identifier;
  uint64_t v13;
  NSArray *elementDescriptions;
  uint64_t v15;
  NSArray *bindingDescriptions;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputComponentDescription;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_GCDevicePhysicalInputComponentDescription init](&v18, sel_init);
  v11 = objc_msgSend(v9, "copyWithZone:", 0, v18.receiver, v18.super_class);

  identifier = v10->_identifier;
  v10->_identifier = v11;

  v13 = objc_msgSend(v8, "copy");
  elementDescriptions = v10->_elementDescriptions;
  v10->_elementDescriptions = (NSArray *)v13;

  v15 = objc_msgSend(v7, "copy");
  bindingDescriptions = v10->_bindingDescriptions;
  v10->_bindingDescriptions = (NSArray *)v15;

  return v10;
}

- (_GCDevicePhysicalInputComponentDescription)init
{
  -[_GCDevicePhysicalInputComponentDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_GCDevicePhysicalInputComponentDescription)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _GCDevicePhysicalInputComponentDescription *v12;

  v4 = initWithCoder__onceToken_1;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithCoder__onceToken_1, &__block_literal_global_47);
  GCIPCObjectIdentifier_Classes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("elements"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", initWithCoder__BindingClasses_1, CFSTR("bindings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_GCDevicePhysicalInputComponentDescription initWithIdentifier:elements:bindings:](self, "initWithIdentifier:elements:bindings:", v7, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elementDescriptions, CFSTR("elements"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bindingDescriptions, CFSTR("bindings"));

}

- (id)materializeWithContext:(id)a3
{
  id v4;
  GCPhysicalInputProfile *materializedInputProfile;
  GCPhysicalInputProfile *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  GCPhysicalInputProfile *v16;
  GCPhysicalInputProfile *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  materializedInputProfile = self->_materializedInputProfile;
  if (!materializedInputProfile)
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
      || (-[_GCDevicePhysicalInputComponentDescription createWithContext:](self, "createWithContext:", v4),
          v16 = (GCPhysicalInputProfile *)objc_claimAutoreleasedReturnValue(),
          v17 = self->_materializedInputProfile,
          self->_materializedInputProfile = v16,
          v17,
          !self->_materializedInputProfile))
    {

      v6 = 0;
      goto LABEL_15;
    }
    -[_GCDevicePhysicalInputComponentDescription _applyBinding:toComponent:](self, "_applyBinding:toComponent:", v7);

    materializedInputProfile = self->_materializedInputProfile;
  }
  v6 = materializedInputProfile;
LABEL_15:

  return v6;
}

- (id)createWithContext:(id)a3
{
  GCPhysicalInputProfile *v4;
  void *v5;
  GCPhysicalInputProfile *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = [GCPhysicalInputProfile alloc];
  -[_GCDevicePhysicalInputComponentDescription identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCPhysicalInputProfile initWithIdentifier:](v4, "initWithIdentifier:", v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_elementDescriptions;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = -[GCPhysicalInputProfile _buttonWithDescription:](v6, "_buttonWithDescription:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = -[GCPhysicalInputProfile _directionPadWithDescription:](v6, "_directionPadWithDescription:", v12, (_QWORD)v16);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
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
  -[_GCDevicePhysicalInputComponentDescription identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCPhysicalInputProfile.m"), 1522, &stru_24D2B85A8);

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
    -[_GCDevicePhysicalInputComponentDescription _applyBinding:toComponent:](self, "_applyBinding:toComponent:", v12, v7);

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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_254DC5590))
  {
    -[GCPhysicalInputProfile setGamepadEventSource:](self->_materializedInputProfile, "setGamepadEventSource:", 0);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v13, "conformsToProtocol:", &unk_254DC71D0))
            -[GCPhysicalInputProfile setGamepadEventSource:](self->_materializedInputProfile, "setGamepadEventSource:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

  }
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_254DD7538))
  {
    -[GCPhysicalInputProfile setKeyboardEventSource:](self->_materializedInputProfile, "setKeyboardEventSource:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          if (objc_msgSend(v19, "conformsToProtocol:", &unk_254DC0678, (_QWORD)v20))
            -[GCPhysicalInputProfile setKeyboardEventSource:](self->_materializedInputProfile, "setKeyboardEventSource:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }

  }
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSArray)elementDescriptions
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_materializedInputProfile, 0);
  objc_storeStrong((id *)&self->_bindingDescriptions, 0);
  objc_storeStrong((id *)&self->_elementDescriptions, 0);
}

@end
