@implementation GCHapticCapabilities

- (GCHapticCapabilities)initWithIdentifier:(id)a3 hapticEnginesInfo:(id)a4 hapticCapabilityGraph:(id)a5
{
  id v8;
  id v9;
  id v10;
  GCHapticCapabilities *v11;
  uint64_t v12;
  NSObject *identifier;
  uint64_t v14;
  NSArray *hapticEngines;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GCHapticCapabilities;
  v11 = -[GCHapticCapabilities init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copyWithZone:", 0);
    identifier = v11->_identifier;
    v11->_identifier = v12;

    +[NSArray array](NSArray_0, "array");
    v14 = objc_claimAutoreleasedReturnValue();
    hapticEngines = v11->_hapticEngines;
    v11->_hapticEngines = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_hapticEnginesInfo, a4);
    objc_storeStrong((id *)&v11->_capabilityGraph, a5);
  }

  return v11;
}

- (GCHapticCapabilities)init
{
  void *v3;
  GCHapticCapabilities *v4;

  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GCHapticCapabilities initWithIdentifier:hapticEnginesInfo:hapticCapabilityGraph:](self, "initWithIdentifier:hapticEnginesInfo:hapticCapabilityGraph:", v3, 0, 0);

  return v4;
}

- (void)initializeHapticEngines
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_215181000, log, OS_LOG_TYPE_ERROR, "Unable to create CHHapticEngine!", buf, 2u);
}

- (void)removeHapticEngines
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *hapticEngines;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_initialized)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_hapticEngines;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "stopWithCompletionHandler:", &__block_literal_global_6, (_QWORD)v10);
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    v8 = (NSArray *)objc_opt_new();
    hapticEngines = self->_hapticEngines;
    self->_hapticEngines = v8;

    self->_initialized = 0;
  }
}

- (void)setController:(id)a3
{
  GCController **p_controller;
  id v5;

  p_controller = &self->_controller;
  v5 = a3;
  objc_storeWeak((id *)p_controller, v5);
  -[GCDeviceHaptics setController:](self->_deviceHaptics, "setController:", v5);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (GCHapticCapabilityGraph)capabilityGraph
{
  return (GCHapticCapabilityGraph *)objc_getProperty(self, a2, 40, 1);
}

- (GCDeviceHaptics)deviceHaptics
{
  return (GCDeviceHaptics *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)hapticEngines
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHapticEngines:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticEngines, 0);
  objc_storeStrong((id *)&self->_deviceHaptics, 0);
  objc_storeStrong((id *)&self->_capabilityGraph, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_hapticEnginesInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHapticCapabilities)initWithCoder:(id)a3
{
  id v4;
  GCHapticCapabilities *v5;
  void *v6;
  uint64_t v7;
  NSObject *identifier;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *hapticEnginesInfo;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GCHapticCapabilityGraph *v18;
  GCHapticCapabilityGraph *capabilityGraph;
  GCDeviceHaptics *v20;
  GCDeviceHaptics *deviceHaptics;
  uint64_t v22;
  NSArray *hapticEngines;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GCHapticCapabilities;
  v5 = -[GCHapticCapabilities init](&v25, sel_init);
  if (v5)
  {
    GCIPCObjectIdentifier_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v7;

    v9 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("hapticEnginesInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    hapticEnginesInfo = v5->_hapticEnginesInfo;
    v5->_hapticEnginesInfo = (NSArray *)v11;

    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("capabilityGraphDict"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[GCHapticCapabilityGraph initWithJSONDictionaryRepresentation:]([GCHapticCapabilityGraph alloc], "initWithJSONDictionaryRepresentation:", v17);
    capabilityGraph = v5->_capabilityGraph;
    v5->_capabilityGraph = v18;

    v20 = -[GCDeviceHaptics initWithCapabilityGraph:]([GCDeviceHaptics alloc], "initWithCapabilityGraph:", v5->_capabilityGraph);
    deviceHaptics = v5->_deviceHaptics;
    v5->_deviceHaptics = v20;

    +[NSArray array](NSArray_0, "array");
    v22 = objc_claimAutoreleasedReturnValue();
    hapticEngines = v5->_hapticEngines;
    v5->_hapticEngines = (NSArray *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GCHapticCapabilityGraph *capabilityGraph;
  id v5;
  void *v6;
  id v7;

  capabilityGraph = self->_capabilityGraph;
  v5 = a3;
  -[GCHapticCapabilityGraph jsonDictionaryRepresentation](capabilityGraph, "jsonDictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("capabilityGraphDict"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_hapticEnginesInfo, CFSTR("hapticEnginesInfo"));
  -[GCHapticCapabilities identifier](self, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("identifier"));

}

@end
