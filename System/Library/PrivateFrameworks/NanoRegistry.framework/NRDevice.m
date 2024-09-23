@implementation NRDevice

- (BOOL)supportsCapability:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  -[NRDevice valueForProperty:](self, "valueForProperty:", CFSTR("capabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "hasUUID:", v4);
  else
    v6 = objc_msgSend(v5, "containsObject:", v4);
  v7 = v6;

  return v7;
}

- (id)valueForProperty:(id)a3
{
  id v4;
  void *v5;
  NRRegistry *registry;
  id *v7;
  os_unfair_lock_s *p_lock;
  _QWORD *v9;
  NRDevice *v10;
  id v11;
  _QWORD v13[2];
  void (*v14)(_QWORD *);
  void *v15;
  NRDevice *v16;
  _QWORD v17[2];
  _QWORD v18[5];
  _QWORD v19[2];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = v4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  v25 = 0;
  registry = self->_registry;
  if (registry)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __29__NRDevice_valueForProperty___block_invoke;
    v18[3] = &unk_1E4496EE0;
    v18[4] = self;
    v19[0] = v4;
    v19[1] = &v20;
    -[NRRegistry deasyncGrabRegistryWithReadBlock:](registry, "deasyncGrabRegistryWithReadBlock:", v18);
    v7 = (id *)v19;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v14 = __29__NRDevice_valueForProperty___block_invoke_2;
    v15 = &unk_1E4496F08;
    v17[1] = &v20;
    v16 = self;
    v17[0] = v4;
    p_lock = &self->_lock;
    v9 = v13;
    v10 = self;
    os_unfair_lock_lock_with_options();
    v14(v9);
    v7 = (id *)v17;

    os_unfair_lock_unlock(p_lock);
  }

  v11 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __29__NRDevice_valueForProperty___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NRDevice *v9;
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  v9 = self;
  v10 = v7;
  v11 = v6;
  os_unfair_lock_lock_with_options();
  -[NRDevice _setValue:forProperty:](v9, "_setValue:forProperty:", v11, v10);
  os_unfair_lock_unlock(p_lock);

  return 1;
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  NSMutableDictionary *properties;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NRRegistry *registry;
  id v11;

  v11 = a3;
  v6 = a4;
  properties = self->_properties;
  if (!properties)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_properties;
    self->_properties = v8;

    registry = self->_registry;
    self->_registry = 0;

    properties = self->_properties;
  }
  if (v11)
    -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", v11, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v6);

}

void __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "secureProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRDevice _fireChangeNotificationsForDiff:secureProperties:notify:](v2, v3, v4, *(unsigned __int8 *)(a1 + 56));

  -[NRDevice _updateSelfRetain](*(_QWORD *)(a1 + 32));
}

- (void)_updateSelfRetain
{
  id v2;
  void *v3;

  if (a1)
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "count");
    if (v2)
      v2 = (id)a1;
    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v2;

  }
}

- (void)_fireChangeNotificationsForDiff:(void *)a3 secureProperties:(int)a4 notify:
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  if (a1)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
LABEL_48:

      goto LABEL_49;
    }
    objc_msgSend(v6, "diff");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (a4 && v8)
    {
      v10 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke;
      v61[3] = &unk_1E4496F30;
      v61[4] = a1;
      +[NRMutableDevice parseDiff:forPropertyChange:withBlock:](NRMutableDevice, "parseDiff:forPropertyChange:withBlock:", v8, CFSTR("isActive"), v61);
      v60[0] = v10;
      v60[1] = 3221225472;
      v60[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_2;
      v60[3] = &unk_1E4496F30;
      v60[4] = a1;
      +[NRMutableDevice parseDiff:forPropertyChange:withBlock:](NRMutableDevice, "parseDiff:forPropertyChange:withBlock:", v9, CFSTR("bluetoothPaired"), v60);
      v59[0] = v10;
      v59[1] = 3221225472;
      v59[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_3;
      v59[3] = &unk_1E4496F30;
      v59[4] = a1;
      +[NRMutableDevice parseDiff:forPropertyChange:withBlock:](NRMutableDevice, "parseDiff:forPropertyChange:withBlock:", v9, CFSTR("isActive"), v59);
      v58[0] = v10;
      v58[1] = 3221225472;
      v58[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_4;
      v58[3] = &unk_1E4496F30;
      v58[4] = a1;
      +[NRMutableDevice parseDiff:forPropertyChange:withBlock:](NRMutableDevice, "parseDiff:forPropertyChange:withBlock:", v9, CFSTR("remoteUnpairingStarted"), v58);
      v57[0] = v10;
      v57[1] = 3221225472;
      v57[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_5;
      v57[3] = &unk_1E4496F30;
      v57[4] = a1;
      +[NRMutableDevice parseDiff:forPropertyChange:withBlock:](NRMutableDevice, "parseDiff:forPropertyChange:withBlock:", v9, CFSTR("isPaired"), v57);
      v56[0] = v10;
      v56[1] = 3221225472;
      v56[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_6;
      v56[3] = &unk_1E4496F30;
      v56[4] = a1;
      +[NRMutableDevice parseDiff:forPropertyChange:withBlock:](NRMutableDevice, "parseDiff:forPropertyChange:withBlock:", v9, CFSTR("isSetup"), v56);
      v55[0] = v10;
      v55[1] = 3221225472;
      v55[2] = __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_7;
      v55[3] = &unk_1E4496F30;
      v55[4] = a1;
      +[NRMutableDevice parseDiff:forPropertyChange:withBlock:](NRMutableDevice, "parseDiff:forPropertyChange:withBlock:", v9, CFSTR("compatibilityState"), v55);
    }
    if (objc_msgSend(v7, "changeType") == 2)
    {
      v11 = v9;
      if (a4)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("isActive"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", MEMORY[0x1E0C9AAB0]);

        if (v13)
        {
          -[NRDevice postNotification:withUserInfo:](a1, CFSTR("NRPairedDeviceRegistryDeviceDidBecomeInactive"));
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("isPaired"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", MEMORY[0x1E0C9AAB0]);

          if (v15)
            -[NRDevice postNotification:withUserInfo:](a1, CFSTR("NRPairedDeviceRegistryDeviceDidUnpairNotification"));
        }
      }
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v16 = *(id *)(a1 + 40);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v48 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (a4)
              -[NRDevice _queueFirePropertyObserversForProperty:fromValue:](a1, v21, v22);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        }
        while (v18);
      }

      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
      if (!a4)
        goto LABEL_47;
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("isActive"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      if (v24)
        -[NRDevice postNotification:withUserInfo:](a1, CFSTR("NRPairedDeviceRegistryDeviceDidBecomeInactive"));
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("isPaired"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "BOOLValue"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("bluetoothPaired"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "BOOLValue");

        if (!v40)
        {
LABEL_47:

          goto LABEL_48;
        }
      }
      -[NRDevice postNotification:withUserInfo:](a1, CFSTR("NRPairedDeviceRegistryDeviceDidUnpairNotification"));
      goto LABEL_47;
    }
    v41 = v9;
    v42 = v7;
    objc_msgSend(v7, "diff");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (!v27)
      goto LABEL_44;
    v28 = v27;
    v29 = *(_QWORD *)v52;
    v44 = v26;
    v45 = a1;
LABEL_27:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v30);
      objc_msgSend(v26, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "changeType") == 2)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v31);
          if (a4)
            -[NRDevice _queueFirePropertyObserversForProperty:fromValue:](a1, v31, v33);
        }
        goto LABEL_42;
      }
      objc_msgSend(v32, "diff");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "value");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v43, "objectForKeyedSubscript:", v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (v35)
        goto LABEL_38;
LABEL_41:

      a1 = v45;
LABEL_42:

      if (v28 == ++v30)
      {
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (!v28)
        {
LABEL_44:

          v11 = v41;
          v7 = v42;
          goto LABEL_47;
        }
        goto LABEL_27;
      }
    }
    v35 = v34;
LABEL_38:
    v36 = v28;
    v37 = v29;
    objc_msgSend(*(id *)(v45 + 40), "objectForKeyedSubscript:", v31);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v45 + 40), "setObject:forKeyedSubscript:", v35, v31);
    if (a4)
      -[NRDevice _queueFirePropertyObserversForProperty:fromValue:](v45, v31, v38);

    v29 = v37;
    v28 = v36;
    v26 = v44;
    goto LABEL_41;
  }
LABEL_49:

}

- (NRDevice)initWithQueue:(id)a3
{
  void *v4;
  void *v5;
  NRDevice *v6;

  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NRDevice initWithRegistry:diff:pairingID:notify:](self, "initWithRegistry:diff:pairingID:notify:", v4, 0, v5, 0);

  return v6;
}

- (NRDevice)initWithRegistry:(id)a3 diff:(id)a4 pairingID:(id)a5 notify:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  NRDevice *v14;
  NRDevice *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *observers;
  uint64_t v18;
  NSPointerArray *promiscuousObservers;
  NSMutableDictionary *v20;
  NSMutableDictionary *changeBlocks;
  NSMutableArray *v22;
  NSMutableArray *promiscuousChangeBlocks;
  uint64_t v24;
  NSMutableDictionary *oldPropertiesForChangeNotifications;
  uint64_t v26;
  NRDevice *v27;
  id v28;
  NRDevice *v29;
  id v30;
  id v31;
  NSMutableDictionary *properties;
  uint64_t v33;
  _QWORD v35[4];
  NRDevice *v36;
  _QWORD v37[4];
  NRDevice *v38;
  _QWORD v39[4];
  NRDevice *v40;
  id v41;
  id v42;
  BOOL v43;
  objc_super v44;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v44.receiver = self;
  v44.super_class = (Class)NRDevice;
  v14 = -[NRDevice init](&v44, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_registry, a3);
    objc_storeStrong((id *)&v15->_pairingID, a5);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observers = v15->_observers;
    v15->_observers = v16;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v18 = objc_claimAutoreleasedReturnValue();
    promiscuousObservers = v15->_promiscuousObservers;
    v15->_promiscuousObservers = (NSPointerArray *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    changeBlocks = v15->_changeBlocks;
    v15->_changeBlocks = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    promiscuousChangeBlocks = v15->_promiscuousChangeBlocks;
    v15->_promiscuousChangeBlocks = v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    oldPropertiesForChangeNotifications = v15->_oldPropertiesForChangeNotifications;
    v15->_oldPropertiesForChangeNotifications = (NSMutableDictionary *)v24;

    objc_storeStrong((id *)&v15->_me, v15);
    if (v11)
    {
      v26 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke;
      v39[3] = &unk_1E4496E68;
      v27 = v15;
      v40 = v27;
      v41 = v12;
      v28 = v11;
      v42 = v28;
      v43 = a6;
      objc_msgSend(v28, "grabRegistryWithReadBlock:", v39);
      v37[0] = v26;
      v37[1] = 3221225472;
      v37[2] = __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke_2;
      v37[3] = &unk_1E4496E90;
      v29 = v27;
      v38 = v29;
      v30 = (id)objc_msgSend(v28, "addDiffObserverWithWriteBlock:", v37);
      v35[0] = v26;
      v35[1] = 3221225472;
      v35[2] = __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke_3;
      v35[3] = &unk_1E4496EB8;
      v36 = v29;
      v31 = (id)objc_msgSend(v28, "addSecurePropertiesObserverWithReadBlock:", v35);

      properties = (NSMutableDictionary *)v40;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v33 = objc_claimAutoreleasedReturnValue();
      properties = v15->_properties;
      v15->_properties = (NSMutableDictionary *)v33;
    }

  }
  return v15;
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary removeAllObjects](self->_changeBlocks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_promiscuousChangeBlocks, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)NRDevice;
  -[NRDevice dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiscuousChangeBlocks, 0);
  objc_storeStrong((id *)&self->_changeBlocks, 0);
  objc_storeStrong((id *)&self->_promiscuousObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_oldPropertiesForChangeNotifications, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_me, 0);
}

- (BOOL)canMigrate
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  _BOOL4 v12;
  __CFString *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("119C9267-C24D-4FC3-8FE9-2D394943F2E6"));
  v4 = -[NRDevice supportsCapability:](self, "supportsCapability:", v3);

  if (v4)
  {
    -[NRDevice valueForProperty:](self, "valueForProperty:", CFSTR("migrationKeyRevision"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "integerValue"))
    {
      -[NRDevice valueForProperty:](self, "valueForProperty:", CFSTR("isPaired"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && objc_msgSend(v7, "BOOLValue"))
      {
        -[NRDevice valueForProperty:](self, "valueForProperty:", CFSTR("MDMManagementState"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedIntegerValue");
        if (v9)
          v11 = v10 == 0;
        else
          v11 = 1;
        v12 = v11;
        if (v11)
        {
          v13 = &stru_1E4499C68;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Managed by MDM (%lu)"), v10);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v12 = 0;
        v13 = CFSTR("Device not paired");
      }

    }
    else
    {
      v12 = 0;
      v13 = CFSTR("Does not have migration key revision");
    }

  }
  else
  {
    v12 = 0;
    v13 = CFSTR("Does not support migration capability");
  }
  nr_framework_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    nr_framework_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[NRDevice valueForProperty:](self, "valueForProperty:", CFSTR("pairingID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v21 = "-[NRDevice(migration) canMigrate]";
      v18 = " - ";
      v22 = 2112;
      v24 = 1024;
      v23 = v17;
      if (v12)
        v18 = "";
      v25 = v12;
      v26 = 2080;
      v27 = v18;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_1A0BDB000, v16, OS_LOG_TYPE_DEFAULT, "%s: %@ %{BOOL}d%s%@", buf, 0x30u);

    }
  }

  return v12;
}

- (BOOL)archived
{
  void *v2;
  char v3;

  -[NRDevice valueForProperty:](self, "valueForProperty:", CFSTR("isArchived"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)migrationError
{
  void *v3;

  if (-[NRDevice archived](self, "archived"))
  {
    -[NRDevice valueForProperty:](self, "valueForProperty:", CFSTR("lastPairingError"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)migrationConfirmed
{
  void *v2;
  char v3;

  -[NRDevice valueForProperty:](self, "valueForProperty:", CFSTR("migrationConsent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NRDevice)init
{
  abort();
}

void __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  -[NRDevice _fireChangeNotificationsForDiff:secureProperties:notify:](*(_QWORD *)(a1 + 32), a2, a4, 1);
  -[NRDevice _updateSelfRetain](*(_QWORD *)(a1 + 32));
}

void __51__NRDevice_initWithRegistry_diff_pairingID_notify___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v15 = a3;
  if (v4)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(v4 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(*(id *)(v4 + 40), "objectForKeyedSubscript:", v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v14)
              {
                objc_msgSend(*(id *)(v4 + 40), "setObject:forKeyedSubscript:", v13, v10);
                -[NRDevice _queueFirePropertyObserversForProperty:fromValue:](v4, v10, 0);
              }
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
}

- (void)_queueFirePropertyObserversForProperty:(void *)a3 fromValue:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 80));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__NRDevice__queueFirePropertyObserversForProperty_fromValue___block_invoke;
  block[3] = &unk_1E4496F58;
  v18 = v10;
  v19 = a1;
  v13 = v5;
  v20 = v13;
  v14 = v6;
  v21 = v14;
  v22 = v12;
  v15 = v12;
  v16 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NRDevice *v3;
  NRDevice *me;

  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeAllObjects](v3->_observers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v3->_changeBlocks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v3->_promiscuousChangeBlocks, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);

  me = v3->_me;
  v3->_me = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("NRDevice[%p]: "), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NRDevice propertyNames](self, "propertyNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A1B01C40]();
        -[NRDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@=\"%@\" "), v9, v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)addPropertyObserver:(id)a3 forPropertyChanges:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NRDevice *v9;
  id v10;
  id v11;
  _QWORD v12[7];

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__NRDevice_addPropertyObserver_forPropertyChanges___block_invoke;
  v12[3] = &unk_1E4495008;
  v12[4] = self;
  v12[5] = v6;
  v12[6] = v7;
  p_lock = &self->_lock;
  v9 = self;
  v10 = v7;
  v11 = v6;
  os_unfair_lock_lock_with_options();
  __51__NRDevice_addPropertyObserver_forPropertyChanges___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);

}

void __51__NRDevice_addPropertyObserver_forPropertyChanges___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  v5 = v4;
  if (v1)
  {
    if (v4)
    {
      v29 = 0uLL;
      v30 = 0uLL;
      v27 = 0uLL;
      v28 = 0uLL;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v28;
        obj = v5;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(obj);
            v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(*(id *)(v1 + 56), "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v25 = 0u;
              v26 = 0u;
              v23 = 0u;
              v24 = 0u;
              v12 = v11;
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, &v31, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v24;
                while (2)
                {
                  for (j = 0; j != v14; ++j)
                  {
                    if (*(_QWORD *)v24 != v15)
                      objc_enumerationMutation(v12);
                    if (*(id *)(*((_QWORD *)&v23 + 1) + 8 * j) == v3)
                    {

                      goto LABEL_21;
                    }
                  }
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, &v31, 16);
                  if (v14)
                    continue;
                  break;
                }
              }

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
              v12 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v12, "addPointer:", v3);
            objc_msgSend(*(id *)(v1 + 56), "setObject:forKey:", v12, v10);
LABEL_21:

          }
          v5 = obj;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v7);
      }
    }
    else
    {
      v33 = 0uLL;
      v34 = 0uLL;
      v31 = 0uLL;
      v32 = 0uLL;
      v17 = *(id *)(v1 + 64);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
        while (2)
        {
          for (k = 0; k != v19; ++k)
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v17);
            if (*(id *)(*((_QWORD *)&v31 + 1) + 8 * k) == v3)
            {

              goto LABEL_34;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v19)
            continue;
          break;
        }
      }

      objc_msgSend(*(id *)(v1 + 64), "addPointer:", v3);
    }
  }
LABEL_34:

}

- (void)removePropertyObserver:(id)a3 forPropertyChanges:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NRDevice *v9;
  id v10;
  id v11;
  _QWORD v12[7];

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__NRDevice_removePropertyObserver_forPropertyChanges___block_invoke;
  v12[3] = &unk_1E4495008;
  v12[4] = self;
  v12[5] = v6;
  v12[6] = v7;
  p_lock = &self->_lock;
  v9 = self;
  v10 = v7;
  v11 = v6;
  os_unfair_lock_lock_with_options();
  __54__NRDevice_removePropertyObserver_forPropertyChanges___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);

}

void __54__NRDevice_removePropertyObserver_forPropertyChanges___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id obj;
  uint64_t v37;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  obj = v2;
  v37 = v1;
  if (v1)
  {
    if (obj)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v51 != v6)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(v37 + 56), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v9 = v8;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v10)
            {
              v11 = v10;
              v12 = 0;
              v13 = *(_QWORD *)v47;
              while (2)
              {
                v14 = 0;
                v15 = v11 + v12;
                do
                {
                  if (*(_QWORD *)v47 != v13)
                    objc_enumerationMutation(v9);
                  if (*(id *)(*((_QWORD *)&v46 + 1) + 8 * v14) == v3)
                  {

                    if (v12 + v14 != 0x7FFFFFFFFFFFFFFFLL)
                      objc_msgSend(v9, "removePointerAtIndex:");
                    goto LABEL_19;
                  }
                  ++v14;
                }
                while (v11 != v14);
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
                v12 = v15;
                if (v11)
                  continue;
                break;
              }
            }

LABEL_19:
          }
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v5);
      }
    }
    else
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      objc_msgSend(*(id *)(v1 + 56), "allKeys");
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v47 != v18)
              objc_enumerationMutation(v35);
            objc_msgSend(*(id *)(v37 + 56), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v21 = v20;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
            if (v22)
            {
              v23 = v22;
              v24 = 0;
              v25 = *(_QWORD *)v43;
              while (2)
              {
                v26 = 0;
                v27 = v23 + v24;
                do
                {
                  if (*(_QWORD *)v43 != v25)
                    objc_enumerationMutation(v21);
                  if (*(id *)(*((_QWORD *)&v42 + 1) + 8 * v26) == v3)
                  {

                    if (v24 + v26 != 0x7FFFFFFFFFFFFFFFLL)
                      objc_msgSend(v21, "removePointerAtIndex:");
                    goto LABEL_38;
                  }
                  ++v26;
                }
                while (v23 != v26);
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
                v24 = v27;
                if (v23)
                  continue;
                break;
              }
            }

LABEL_38:
          }
          v17 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        }
        while (v17);
      }

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v28 = *(id *)(v37 + 64);
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, &v50, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v39;
        while (2)
        {
          v33 = 0;
          v34 = v30 + v31;
          do
          {
            if (*(_QWORD *)v39 != v32)
              objc_enumerationMutation(v28);
            if (*(id *)(*((_QWORD *)&v38 + 1) + 8 * v33) == v3)
            {

              if (v31 + v33 != 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(*(id *)(v37 + 64), "removePointerAtIndex:");
              goto LABEL_51;
            }
            ++v33;
          }
          while (v30 != v33);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, &v50, 16);
          v31 = v34;
          if (v30)
            continue;
          break;
        }
      }

    }
  }
LABEL_51:

}

void __29__NRDevice_valueForProperty___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1[4] + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = v7;
    v10 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
  }

}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "BOOLValue") & 1) == 0)
    -[NRDevice postNotification:withUserInfo:](*(_QWORD *)(a1 + 32), CFSTR("NRPairedDeviceRegistryDeviceDidBecomeInactive"));

}

- (void)postNotification:(uint64_t)a1 withUserInfo:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(0, "mutableCopy");
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", a1, CFSTR("device"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 24), CFSTR("pairingID"));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__NRDevice_postNotification_withUserInfo___block_invoke;
    block[3] = &unk_1E4495008;
    v7 = v3;
    v8 = a1;
    v9 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  __CFString **v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = objc_msgSend(v6, "BOOLValue");
    v5 = NRPairedDeviceRegistryDeviceDidBeginPairingNotification;
    if (!v4)
      v5 = NRPairedDeviceRegistryDeviceDidReceiveBTPairingRequestNotification;
    -[NRDevice postNotification:withUserInfo:](*(_QWORD *)(a1 + 32), *v5);
  }

}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "BOOLValue"))
    -[NRDevice postNotification:withUserInfo:](*(_QWORD *)(a1 + 32), CFSTR("NRPairedDeviceRegistryDeviceDidBecomeActive"));

}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "BOOLValue"))
    -[NRDevice postNotification:withUserInfo:](*(_QWORD *)(a1 + 32), CFSTR("NRPairedDeviceRegistryRemoteUnpairingDidBeginNotification"));

}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
    v6 = *(_QWORD *)(a1 + 32);
    if ((v5 & 1) != 0)
    {
      -[NRDevice postNotification:withUserInfo:](v6, CFSTR("NRPairedDeviceRegistryDeviceDidPairNotification"));
    }
    else
    {
      objc_msgSend(*(id *)(v6 + 40), "objectForKeyedSubscript:", CFSTR("lastPairingError"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        -[NRDevice postNotification:withUserInfo:](*(_QWORD *)(a1 + 32), CFSTR("NRPairedDeviceRegistryDeviceDidUnpairNotification"));

    }
  }

}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "BOOLValue"))
    -[NRDevice postNotification:withUserInfo:](*(_QWORD *)(a1 + 32), CFSTR("NRPairedDeviceRegistryDeviceIsSetupNotification"));

}

void __68__NRDevice__fireChangeNotificationsForDiff_secureProperties_notify___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    if (objc_msgSend(v6, "integerValue") == 3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", CFSTR("isPaired"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "BOOLValue");

      if ((v5 & 1) == 0)
        -[NRDevice postNotification:withUserInfo:](*(_QWORD *)(a1 + 32), CFSTR("NRPairedDeviceRegistryDeviceDidBeginActivation"));
    }
  }

}

void __42__NRDevice_postNotification_withUserInfo___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], *(_QWORD *)(a1[5] + 32), a1[6]);

}

void __61__NRDevice__queueFirePropertyObserversForProperty_fromValue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "device:propertyDidChange:fromValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 64);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

- (NRDevice)initWithCoder:(id)a3
{
  id v4;
  NRDevice *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *observers;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *properties;
  uint64_t v12;
  NSPointerArray *promiscuousObservers;
  NSMutableDictionary *v14;
  NSMutableDictionary *changeBlocks;
  NSMutableArray *v16;
  NSMutableArray *promiscuousChangeBlocks;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NRDevice;
  v5 = -[NRDevice init](&v19, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observers = v5->_observers;
    v5->_observers = v6;

    NRClassesForPropertiesWithArray(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("properties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v12 = objc_claimAutoreleasedReturnValue();
    promiscuousObservers = v5->_promiscuousObservers;
    v5->_promiscuousObservers = (NSPointerArray *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    changeBlocks = v5->_changeBlocks;
    v5->_changeBlocks = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    promiscuousChangeBlocks = v5->_promiscuousChangeBlocks;
    v5->_promiscuousChangeBlocks = v16;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)propertyNames
{
  NRRegistry *registry;
  os_unfair_lock_s *p_lock;
  _QWORD *v5;
  NRDevice *v6;
  id v7;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  NRDevice *v12;
  uint64_t *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  registry = self->_registry;
  if (registry)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __25__NRDevice_propertyNames__block_invoke;
    v14[3] = &unk_1E4496228;
    v14[4] = self;
    v14[5] = &v15;
    -[NRRegistry deasyncGrabRegistryWithReadBlock:](registry, "deasyncGrabRegistryWithReadBlock:", v14);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v10 = __25__NRDevice_propertyNames__block_invoke_2;
    v11 = &unk_1E4495A48;
    v12 = self;
    v13 = &v15;
    p_lock = &self->_lock;
    v5 = v9;
    v6 = self;
    os_unfair_lock_lock_with_options();
    v10((uint64_t)v5);

    os_unfair_lock_unlock(p_lock);
  }
  v7 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __25__NRDevice_propertyNames__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allPropertyNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __25__NRDevice_propertyNames__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)registerForPropertyChanges:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NRDevice *v9;
  id v10;
  id v11;
  _QWORD v12[7];

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__NRDevice_registerForPropertyChanges_withBlock___block_invoke;
  v12[3] = &unk_1E44955F0;
  v12[4] = self;
  v12[5] = v6;
  v12[6] = v7;
  p_lock = &self->_lock;
  v9 = self;
  v10 = v7;
  v11 = v6;
  os_unfair_lock_lock_with_options();
  __49__NRDevice_registerForPropertyChanges_withBlock___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);

}

void __49__NRDevice_registerForPropertyChanges_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    if (v3)
    {
      v30 = 0uLL;
      v31 = 0uLL;
      v28 = 0uLL;
      v29 = 0uLL;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v29;
        obj = v3;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v29 != v7)
              objc_enumerationMutation(obj);
            v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(*(id *)(v1 + 72), "objectForKey:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v26 = 0u;
              v27 = 0u;
              v24 = 0u;
              v25 = 0u;
              v11 = v10;
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, &v32, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v25;
                while (2)
                {
                  for (j = 0; j != v13; ++j)
                  {
                    if (*(_QWORD *)v25 != v14)
                      objc_enumerationMutation(v11);
                    if (*(id *)(*((_QWORD *)&v24 + 1) + 8 * j) == v4)
                    {

                      goto LABEL_21;
                    }
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, &v32, 16);
                  if (v13)
                    continue;
                  break;
                }
              }

            }
            else
            {
              v11 = (id)objc_opt_new();
            }
            v16 = (void *)MEMORY[0x1A1B01DE4](v4);
            objc_msgSend(v11, "addObject:", v16);

            objc_msgSend(*(id *)(v1 + 72), "setObject:forKey:", v11, v9);
LABEL_21:

          }
          v3 = obj;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v6);
      }
    }
    else
    {
      v34 = 0uLL;
      v35 = 0uLL;
      v32 = 0uLL;
      v33 = 0uLL;
      v17 = *(id *)(v1 + 80);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
LABEL_26:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          if (*(id *)(*((_QWORD *)&v32 + 1) + 8 * v21) == v4)
            break;
          if (v19 == ++v21)
          {
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            if (v19)
              goto LABEL_26;
            goto LABEL_32;
          }
        }
      }
      else
      {
LABEL_32:

        v22 = *(void **)(v1 + 80);
        v17 = (id)MEMORY[0x1A1B01DE4](v4);
        objc_msgSend(v22, "addObject:", v17);
      }

    }
  }

}

- (void)unregisterForPropertyChanges:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  NRDevice *v9;
  id v10;
  id v11;
  _QWORD v12[7];

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__NRDevice_unregisterForPropertyChanges_withBlock___block_invoke;
  v12[3] = &unk_1E44955F0;
  v12[4] = self;
  v12[5] = v6;
  v12[6] = v7;
  p_lock = &self->_lock;
  v9 = self;
  v10 = v7;
  v11 = v6;
  os_unfair_lock_lock_with_options();
  __51__NRDevice_unregisterForPropertyChanges_withBlock___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(p_lock);

}

void __51__NRDevice_unregisterForPropertyChanges_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    if (v3)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v25 != v7)
              objc_enumerationMutation(v3);
            v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            v10 = *(void **)(v1 + 72);
            if (v4)
            {
              objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = (void *)MEMORY[0x1A1B01DE4](v4);
              objc_msgSend(v11, "removeObject:", v12);

              if (!objc_msgSend(v11, "count"))
                objc_msgSend(*(id *)(v1 + 72), "removeObjectForKey:", v9);

            }
            else
            {
              objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            }
          }
          v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v6);
      }
    }
    else
    {
      v13 = *(void **)(v1 + 72);
      if (v4)
      {
        objc_msgSend(v13, "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
              objc_msgSend(*(id *)(v1 + 72), "objectForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)MEMORY[0x1A1B01DE4](v4);
              objc_msgSend(v20, "removeObject:", v21);

              if (!objc_msgSend(v20, "count"))
                objc_msgSend(*(id *)(v1 + 72), "removeObjectForKey:", v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v16);
        }
        v22 = *(void **)(v1 + 80);
        v23 = (void *)MEMORY[0x1A1B01DE4](v4);
        objc_msgSend(v22, "removeObject:", v23);

      }
      else
      {
        objc_msgSend(v13, "removeAllObjects");
        objc_msgSend(*(id *)(v1 + 80), "removeAllObjects");
      }
    }
  }

}

@end
