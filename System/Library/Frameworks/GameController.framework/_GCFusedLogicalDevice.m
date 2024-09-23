@implementation _GCFusedLogicalDevice

- (_GCFusedLogicalDevice)initWithPrimaryPhysicalDevice:(id)a3 secondaryPhysicalDevice:(id)a4 configuration:(id)a5 manager:(id)a6
{
  _GCPhysicalDevice *v10;
  _GCFusedLogicalDevice *v11;
  _GCPhysicalDevice *secondaryDevice;
  objc_super v14;

  v10 = (_GCPhysicalDevice *)a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCFusedLogicalDevice;
  v11 = -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:](&v14, sel_initWithPhysicalDevice_configuration_manager_, a3, a5, a6);
  secondaryDevice = v11->_secondaryDevice;
  v11->_secondaryDevice = v10;

  return v11;
}

- (_GCFusedLogicalDevice)init
{
  -[_GCFusedLogicalDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)underlyingDevices
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_GCFusedLogicalDevice;
  -[_GCDefaultLogicalDevice underlyingDevices](&v8, sel_underlyingDevices);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_secondaryDevice)
  {
    objc_msgSend(v3, "setByAddingObject:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (id)_makeControllerGamepadEventSource
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  _GCGamepadEventFusionDescription *v21;
  void *v22;
  void *v23;
  void *v24;
  _GCGamepadEventFusionConfig *v25;
  uint64_t k;
  _GCGamepadEventFusionDescription *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_254DCA028))
        {
          v11 = v10;

          v7 = (unint64_t)v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[_GCFusedLogicalDevice secondaryDevice](self, "secondaryDevice", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (objc_msgSend(v19, "conformsToProtocol:", &unk_254DCA028))
        {
          v20 = v19;

          v16 = (unint64_t)v20;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  if (!(v7 | v16))
  {
    v21 = 0;
    goto LABEL_35;
  }
  if (v7 && !v16)
  {
    v22 = (void *)v7;
LABEL_31:
    objc_msgSend(v22, "gamepadEventSource");
    v21 = (_GCGamepadEventFusionDescription *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if (!v7 && v16)
  {
    v22 = (void *)v16;
    goto LABEL_31;
  }
  objc_msgSend((id)v7, "gamepadEventSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "gamepadEventSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_GCGamepadEventFusionConfig initWithSourceCount:]([_GCGamepadEventFusionConfig alloc], "initWithSourceCount:", 2);
  for (k = 0; k != 47; ++k)
  {
    -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v25, "setPassRule:forElement:forSourceAtIndex:", 2, k, 0);
    -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v25, "setPassRule:forElement:forSourceAtIndex:", 2, k, 1);
  }
  v27 = [_GCGamepadEventFusionDescription alloc];
  v38[0] = v23;
  v38[1] = v24;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v38, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_GCGamepadEventFusionDescription initWithConfiguration:sources:](v27, "initWithConfiguration:sources:", v25, v28);

LABEL_35:
  return v21;
}

- (_GCPhysicalDevice)secondaryDevice
{
  return self->_secondaryDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryDevice, 0);
}

@end
