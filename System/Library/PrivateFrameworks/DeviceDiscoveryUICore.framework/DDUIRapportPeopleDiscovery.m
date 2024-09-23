@implementation DDUIRapportPeopleDiscovery

- (DDUIRapportPeopleDiscovery)initWithRemoteDisplayDiscovery:(id)a3 deviceSelectedHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_discovery, a3);
  -[RPRemoteDisplayDiscovery setDiscoveryFlags:](self->_discovery, "setDiscoveryFlags:", -[RPRemoteDisplayDiscovery discoveryFlags](self->_discovery, "discoveryFlags") | 3);
  -[RPRemoteDisplayDiscovery setDeviceSelectedHandler:](self->_discovery, "setDeviceSelectedHandler:", v8);
  location = 0;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke;
  v15[3] = &unk_1E81B4988;
  objc_copyWeak(&v16, &location);
  -[RPRemoteDisplayDiscovery setDeviceFoundHandler:](self->_discovery, "setDeviceFoundHandler:", v15);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke_1;
  v13[3] = &unk_1E81B49B0;
  objc_copyWeak(&v14, &location);
  -[RPRemoteDisplayDiscovery setDeviceChangedHandler:](self->_discovery, "setDeviceChangedHandler:", v13);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke_3;
  v11[3] = &unk_1E81B4988;
  objc_copyWeak(&v12, &location);
  -[RPRemoteDisplayDiscovery setDeviceLostHandler:](self->_discovery, "setDeviceLostHandler:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return self;
}

void __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "RPRemoteDisplayDevice found: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "discoveredDevicesMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(WeakRetained, "setDiscoveredDevicesMap:", v7);

  }
  objc_msgSend(WeakRetained, "discoveredDevicesMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, v9);

}

void __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "RPRemoteDisplayDevice changed: %@", (uint8_t *)&v12, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "discoveredDevicesMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "discoveredDevicesMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idsDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(WeakRetained, "discoveredDevicesMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "idsDeviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, v11);

    }
  }

}

void __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "RPRemoteDisplayDevice lost: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "discoveredDevicesMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "discoveredDevicesMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "idsDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
}

- (void)activateDiscoveryWithCompletion:(id)a3
{
  id v4;
  RPRemoteDisplayDiscovery *discovery;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  discovery = self->_discovery;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__DDUIRapportPeopleDiscovery_activateDiscoveryWithCompletion___block_invoke;
  v7[3] = &unk_1E81B49D8;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  -[RPRemoteDisplayDiscovery activateWithCompletion:](discovery, "activateWithCompletion:", v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __62__DDUIRapportPeopleDiscovery_activateDiscoveryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreRapportLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v17 = 134218242;
    v18 = v5;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "DDUIRapportPeopleDiscovery activated {self: %p, inError: %@}", (uint8_t *)&v17, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (!v3 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "availablePeopleChangedHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "availablePeopleChangedHandler");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "availablePeople");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v10);

    }
    objc_msgSend(v7, "discoverySessionChangedHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "discoverySessionChangedHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "discovery");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "currentState");
      objc_msgSend(v7, "discovery");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "peerDeviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *))v12)[2](v12, v14, v16);

    }
  }

}

- (id)availablePeople
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v48;
  void *context;
  DDUIRapportPeopleDiscovery *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id obj;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1CAA33CE8](self, a2);
  v56 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = self;
  -[RPRemoteDisplayDiscovery discoveredPeople](self->_discovery, "discoveredPeople");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _DDUICoreRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = v4;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "Finding available people among %@", buf, 0xCu);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v66 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "accountAltDSID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && objc_msgSend(v56, "containsObject:", v11) && objc_msgSend(v3, "count"))
          {
            v12 = 0;
            do
            {
              objc_msgSend(v3, "objectAtIndexedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "accountAltDSID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqual:", v11);

              if (v15)
                objc_msgSend(v3, "removeObjectAtIndex:", v12--);
              ++v12;
            }
            while (v12 < objc_msgSend(v3, "count"));
          }
          _DDUICoreRapportLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v10;
            _os_log_impl(&dword_1C87B2000, v16, OS_LOG_TYPE_DEFAULT, "Found acceptable person %@", buf, 0xCu);
          }

          objc_msgSend(v3, "addObject:", v10);
          objc_msgSend(v56, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v7);
  }

  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[DDUIRapportPeopleDiscovery previousAvailablePeople](v50, "previousAvailablePeople");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v62 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v23, "accountAltDSID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v20);
  }

  v53 = (void *)objc_msgSend(v56, "mutableCopy");
  objc_msgSend(v53, "minusSet:", v17);
  v51 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v51, "minusSet:", v56);
  v52 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v52, "unionSet:", v56);
  -[DDUIRapportPeopleDiscovery previousAvailablePeople](v50, "previousAvailablePeople");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");
  v27 = v26;
  v48 = v17;
  if (v26)
  {
    v28 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v17, context);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;

  if (objc_msgSend(v29, "count"))
  {
    v30 = 0;
    do
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", v30, v48);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v31, "accountAltDSID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v51, "containsObject:", v32))
          objc_msgSend(v29, "removeObjectAtIndex:", v30--);

      }
      ++v30;
    }
    while (v30 < objc_msgSend(v29, "count"));
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v54 = v3;
  v33 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v58 != v35)
          objc_enumerationMutation(v54);
        v37 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v38 = v34;
          objc_msgSend(v37, "accountAltDSID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v53, "containsObject:", v39))
          {
            objc_msgSend(v29, "addObject:", v37);
          }
          else if (objc_msgSend(v52, "containsObject:", v39) && objc_msgSend(v29, "count"))
          {
            v40 = 0;
            while (1)
            {
              objc_msgSend(v29, "objectAtIndexedSubscript:", v40, v48);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "accountAltDSID");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v39, "isEqual:", v42);

              if (v43)
                break;
              if (++v40 >= (unint64_t)objc_msgSend(v29, "count"))
                goto LABEL_55;
            }
            objc_msgSend(v29, "replaceObjectAtIndex:withObject:", v40, v37);
          }
LABEL_55:

          v34 = v38;
        }
      }
      v34 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v34);
  }

  v44 = (void *)objc_msgSend(v29, "copy");
  objc_autoreleasePoolPop(context);
  -[DDUIRapportPeopleDiscovery setPreviousAvailablePeople:](v50, "setPreviousAvailablePeople:", v44);
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _DDUICoreRapportLog();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = v45;
    _os_log_impl(&dword_1C87B2000, v46, OS_LOG_TYPE_DEFAULT, "rapport people: %@", buf, 0xCu);
  }

  return v45;
}

- (id)getDiscoveredDevicesMap
{
  void *v2;
  void *v3;

  -[DDUIRapportPeopleDiscovery discoveredDevicesMap](self, "discoveredDevicesMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)setAvailablePeopleChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id availablePeopleChangedHandler;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _BYTE buf[12];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_availablePeopleChangedHandler != v4)
  {
    _DDUICoreRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1CAA33E80](v4);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = self;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPeopleDiscovery set people changed handler {self: %p, availableDevicesChangedHandler: %@}", buf, 0x16u);

    }
    v7 = (void *)MEMORY[0x1CAA33E80](v4);
    availablePeopleChangedHandler = self->_availablePeopleChangedHandler;
    self->_availablePeopleChangedHandler = v7;

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke;
    v18[3] = &unk_1E81B4A00;
    objc_copyWeak(&v20, (id *)buf);
    v10 = v4;
    v19 = v10;
    -[RPRemoteDisplayDiscovery setPersonFoundHandler:](self->_discovery, "setPersonFoundHandler:", v18);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke_2;
    v15[3] = &unk_1E81B4A00;
    objc_copyWeak(&v17, (id *)buf);
    v11 = v10;
    v16 = v11;
    -[RPRemoteDisplayDiscovery setPersonChangedHandler:](self->_discovery, "setPersonChangedHandler:", v15);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke_3;
    v12[3] = &unk_1E81B4A00;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v11;
    -[RPRemoteDisplayDiscovery setPersonLostHandler:](self->_discovery, "setPersonLostHandler:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

void __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "availablePeople");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    WeakRetained = v5;
  }

}

void __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "availablePeople");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    WeakRetained = v5;
  }

}

void __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "availablePeople");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    WeakRetained = v5;
  }

}

- (void)setDiscoverySessionChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id discoverySessionChangedHandler;
  int v9;
  DDUIRapportPeopleDiscovery *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_discoverySessionChangedHandler != v4)
  {
    _DDUICoreRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1CAA33E80](v4);
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPeopleDiscovery set session changed handler {self: %p, discoverySessionStateChangedHandler: %@}", (uint8_t *)&v9, 0x16u);

    }
    v7 = (void *)MEMORY[0x1CAA33E80](v4);
    discoverySessionChangedHandler = self->_discoverySessionChangedHandler;
    self->_discoverySessionChangedHandler = v7;

    -[RPRemoteDisplayDiscovery setDiscoverySessionStateChangedHandler:](self->_discovery, "setDiscoverySessionStateChangedHandler:", self->_discoverySessionChangedHandler);
  }

}

- (unsigned)discoverySessionState
{
  return -[RPRemoteDisplayDiscovery currentState](self->_discovery, "currentState");
}

- (RPRemoteDisplayDevice)dedicatedDevice
{
  return (RPRemoteDisplayDevice *)-[RPRemoteDisplayDiscovery dedicatedDevice](self->_discovery, "dedicatedDevice");
}

- (void)setDedicatedDevice:(id)a3
{
  -[RPRemoteDisplayDiscovery saveDedicatedDevice:](self->_discovery, "saveDedicatedDevice:", a3);
}

- (void)setDedicatedDeviceChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id dedicatedDeviceChangedHandler;
  int v9;
  DDUIRapportPeopleDiscovery *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_dedicatedDeviceChangedHandler != v4)
  {
    _DDUICoreRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1CAA33E80](v4);
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPeopleDiscovery set dedicated device changed handler {self: %p, dedicatedDeviceChangedHandler: %@}", (uint8_t *)&v9, 0x16u);

    }
    v7 = (void *)MEMORY[0x1CAA33E80](v4);
    dedicatedDeviceChangedHandler = self->_dedicatedDeviceChangedHandler;
    self->_dedicatedDeviceChangedHandler = v7;

    -[RPRemoteDisplayDiscovery setDedicatedDeviceChangedHandler:](self->_discovery, "setDedicatedDeviceChangedHandler:", self->_dedicatedDeviceChangedHandler);
  }

}

- (void)attemptDedicatedDeviceConnection
{
  -[RPRemoteDisplayDiscovery requestDedicatedDeviceConfirmationWithCompletion:](self->_discovery, "requestDedicatedDeviceConfirmationWithCompletion:", &__block_literal_global_3);
}

void __62__DDUIRapportPeopleDiscovery_attemptDedicatedDeviceConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _DDUICoreRapportLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "requestDedicatedDeviceConfirmation completed with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setPersonDeclinedHandler:(id)a3
{
  void *v4;
  id personDeclinedHandler;
  id v6;

  if (self->_personDeclinedHandler != a3)
  {
    v6 = a3;
    v4 = (void *)MEMORY[0x1CAA33E80]();
    personDeclinedHandler = self->_personDeclinedHandler;
    self->_personDeclinedHandler = v4;

    -[RPRemoteDisplayDiscovery setPersonDeclinedHandler:](self->_discovery, "setPersonDeclinedHandler:", v6);
  }
}

- (void)cancelPerson:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _DDUICoreRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "Canceling confirmation for person: %@", (uint8_t *)&v6, 0xCu);
  }

  -[RPRemoteDisplayDiscovery personCanceled:](self->_discovery, "personCanceled:", v4);
}

- (void)selectPerson:(id)a3 forDedicatedPairing:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  -[RPRemoteDisplayDiscovery setPersonSelected:forDedicatedPairing:](self->_discovery, "setPersonSelected:forDedicatedPairing:", a3);
  _DDUICoreRapportLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v7 = CFSTR("[dedicated]");
    else
      v7 = &stru_1E81B4FA0;
    -[RPRemoteDisplayDiscovery personSelected](self->_discovery, "personSelected");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1C87B2000, v6, OS_LOG_TYPE_DEFAULT, "Setting RPRemoteDisplayDiscovery person selected %{public}@ to %@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)invalidate
{
  RPRemoteDisplayDiscovery *discovery;

  -[RPRemoteDisplayDiscovery invalidate](self->_discovery, "invalidate");
  discovery = self->_discovery;
  self->_discovery = 0;

}

- (id)availablePeopleChangedHandler
{
  return self->_availablePeopleChangedHandler;
}

- (id)discoverySessionChangedHandler
{
  return self->_discoverySessionChangedHandler;
}

- (id)personDeclinedHandler
{
  return self->_personDeclinedHandler;
}

- (id)dedicatedDeviceChangedHandler
{
  return self->_dedicatedDeviceChangedHandler;
}

- (RPRemoteDisplayDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (NSMutableDictionary)discoveredDevicesMap
{
  return self->_discoveredDevicesMap;
}

- (void)setDiscoveredDevicesMap:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredDevicesMap, a3);
}

- (NSArray)previousAvailablePeople
{
  return self->_previousAvailablePeople;
}

- (void)setPreviousAvailablePeople:(id)a3
{
  objc_storeStrong((id *)&self->_previousAvailablePeople, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAvailablePeople, 0);
  objc_storeStrong((id *)&self->_discoveredDevicesMap, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong(&self->_dedicatedDeviceChangedHandler, 0);
  objc_storeStrong(&self->_personDeclinedHandler, 0);
  objc_storeStrong(&self->_discoverySessionChangedHandler, 0);
  objc_storeStrong(&self->_availablePeopleChangedHandler, 0);
}

@end
