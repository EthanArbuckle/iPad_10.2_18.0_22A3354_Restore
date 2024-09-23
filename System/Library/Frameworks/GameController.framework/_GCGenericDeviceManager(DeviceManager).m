@implementation _GCGenericDeviceManager(DeviceManager)

- (_GCFusedLogicalDevice)makeDeviceWithConfiguration:()DeviceManager dependencies:
{
  id v7;
  id v8;
  _GCDefaultLogicalDevice *v9;
  void *v10;
  _GCFusedLogicalDevice *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count") != 1)
  {
    if (objc_msgSend(v8, "count") != 2)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCGenericDeviceManager+DeviceManager.m"), 49, CFSTR("Bad configuration: %@"), v7);

      v11 = 0;
      goto LABEL_21;
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v15)
    {
      v16 = v15;
      v36 = v8;
      obj = v14;
      v34 = a2;
      v35 = a1;
      v38 = v7;
      v17 = 0;
      v18 = 0;
      v19 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "deviceDependencies");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v22, "isEqual:", v24);

          v26 = v21;
          if (v25)
            v27 = v17;
          else
            v27 = v18;
          if (v25)
            v17 = v26;
          else
            v18 = v26;

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v16);
      v28 = obj;

      v7 = v38;
      a1 = v35;
      v8 = v36;
      a2 = v34;
      if (v17)
      {
        if (v18)
        {
LABEL_19:
          v11 = -[_GCFusedLogicalDevice initWithPrimaryPhysicalDevice:secondaryPhysicalDevice:configuration:manager:]([_GCFusedLogicalDevice alloc], "initWithPrimaryPhysicalDevice:secondaryPhysicalDevice:configuration:manager:", v17, v18, v7, a1);
          objc_msgSend(v17, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_GCDefaultLogicalDevice setDelegate:](v11, "setDelegate:", v29);

          goto LABEL_21;
        }
LABEL_24:
        unk_254DEC4F8(&off_254DEC660, "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCGenericDeviceManager+DeviceManager.m"), 41, CFSTR("Dependencies did not contain secondary device. %@"), v28);

        goto LABEL_19;
      }
    }
    else
    {

      v18 = 0;
      v28 = v14;
    }
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCGenericDeviceManager+DeviceManager.m"), 40, CFSTR("Dependencies did not contain primary device. %@"), v28);

    v17 = 0;
    if (v18)
      goto LABEL_19;
    goto LABEL_24;
  }
  v9 = [_GCDefaultLogicalDevice alloc];
  objc_msgSend(v8, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:](v9, "initWithPhysicalDevice:configuration:manager:", v10, v7, a1);

  objc_msgSend(v8, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDefaultLogicalDevice setDelegate:](v11, "setDelegate:", v13);

LABEL_21:
  return v11;
}

@end
