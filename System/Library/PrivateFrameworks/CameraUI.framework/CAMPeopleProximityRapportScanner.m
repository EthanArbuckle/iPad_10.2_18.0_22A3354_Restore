@implementation CAMPeopleProximityRapportScanner

- (CAMPeopleProximityRapportScanner)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CAMPeopleProximityRapportScanner *v9;
  CAMPeopleProximityRapportScanner *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMPeopleProximityRapportScanner;
  v9 = -[CAMPeopleProximityRapportScanner init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->__queue_peopleDiscoverySessionID = 1;
  }

  return v10;
}

- (void)dealloc
{
  RPPeopleDiscovery *v3;
  RPPeopleDiscovery *queue_peopleDiscovery;
  NSObject *queue;
  objc_super v6;
  _QWORD block[4];
  RPPeopleDiscovery *v8;

  v3 = self->__queue_peopleDiscovery;
  if (v3)
  {
    ++self->__queue_peopleDiscoverySessionID;
    queue_peopleDiscovery = self->__queue_peopleDiscovery;
    self->__queue_peopleDiscovery = 0;

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CAMPeopleProximityRapportScanner_dealloc__block_invoke;
    block[3] = &unk_1EA328868;
    v8 = v3;
    dispatch_async(queue, block);

  }
  v6.receiver = self;
  v6.super_class = (Class)CAMPeopleProximityRapportScanner;
  -[CAMPeopleProximityRapportScanner dealloc](&v6, sel_dealloc);
}

uint64_t __43__CAMPeopleProximityRapportScanner_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)isScanning
{
  return self->__queue_peopleDiscovery != 0;
}

- (void)startDiscoveryWithScanRate:(unint64_t)a3 timeout:(double)a4
{
  unsigned int queue_peopleDiscoverySessionID;
  NSMutableDictionary *v7;
  NSMutableDictionary *queue_discoveredPersons;
  NSMutableDictionary *v9;
  NSMutableDictionary *queue_discoveredIdentities;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  RPPeopleDiscovery *v14;
  RPPeopleDiscovery *queue_peopleDiscovery;
  RPPeopleDiscovery *v16;
  _QWORD v17[4];
  id v18[2];
  unsigned int v19;
  _QWORD v20[4];
  id v21;
  unsigned int v22;
  _QWORD v23[4];
  id v24;
  unsigned int v25;
  _QWORD v26[4];
  id v27;
  unsigned int v28;
  _QWORD v29[4];
  id v30;
  unsigned int v31;
  _QWORD v32[4];
  id v33;
  unsigned int v34;
  id location[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->__queue_peopleDiscovery)
  {
    queue_peopleDiscoverySessionID = self->__queue_peopleDiscoverySessionID;
    CAMSignpostWithIDAndArgs(78, 0xEEEEB0B5B2B2EEEELL, queue_peopleDiscoverySessionID, 0, 0, 0);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_discoveredPersons = self->__queue_discoveredPersons;
    self->__queue_discoveredPersons = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queue_discoveredIdentities = self->__queue_discoveredIdentities;
    self->__queue_discoveredIdentities = v9;

    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v11 = (void *)getRPPeopleDiscoveryClass_softClass;
    v39 = getRPPeopleDiscoveryClass_softClass;
    v12 = MEMORY[0x1E0C809B0];
    if (!getRPPeopleDiscoveryClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getRPPeopleDiscoveryClass_block_invoke;
      location[3] = &unk_1EA329140;
      location[4] = &v36;
      __getRPPeopleDiscoveryClass_block_invoke((uint64_t)location);
      v11 = (void *)v37[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v36, 8);
    v14 = (RPPeopleDiscovery *)objc_alloc_init(v13);
    queue_peopleDiscovery = self->__queue_peopleDiscovery;
    self->__queue_peopleDiscovery = v14;

    -[RPPeopleDiscovery setDispatchQueue:](self->__queue_peopleDiscovery, "setDispatchQueue:", self->_queue);
    -[RPPeopleDiscovery setDiscoveryMode:](self->__queue_peopleDiscovery, "setDiscoveryMode:", 400);
    -[RPPeopleDiscovery setDiscoveryFlags:](self->__queue_peopleDiscovery, "setDiscoveryFlags:", 24);
    -[RPPeopleDiscovery setChangeFlags:](self->__queue_peopleDiscovery, "setChangeFlags:", 6);
    objc_initWeak(location, self);
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke;
    v32[3] = &unk_1EA329658;
    objc_copyWeak(&v33, location);
    v34 = queue_peopleDiscoverySessionID;
    -[RPPeopleDiscovery setPersonFoundHandler:](self->__queue_peopleDiscovery, "setPersonFoundHandler:", v32);
    v29[0] = v12;
    v29[1] = 3221225472;
    v29[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_2;
    v29[3] = &unk_1EA329658;
    objc_copyWeak(&v30, location);
    v31 = queue_peopleDiscoverySessionID;
    -[RPPeopleDiscovery setPersonLostHandler:](self->__queue_peopleDiscovery, "setPersonLostHandler:", v29);
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_3;
    v26[3] = &unk_1EA329680;
    objc_copyWeak(&v27, location);
    v28 = queue_peopleDiscoverySessionID;
    -[RPPeopleDiscovery setPersonChangedHandler:](self->__queue_peopleDiscovery, "setPersonChangedHandler:", v26);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_4;
    v23[3] = &unk_1EA3296A8;
    objc_copyWeak(&v24, location);
    v25 = queue_peopleDiscoverySessionID;
    -[RPPeopleDiscovery setInvalidationHandler:](self->__queue_peopleDiscovery, "setInvalidationHandler:", v23);
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_5;
    v20[3] = &unk_1EA3296A8;
    objc_copyWeak(&v21, location);
    v22 = queue_peopleDiscoverySessionID;
    -[RPPeopleDiscovery setInterruptionHandler:](self->__queue_peopleDiscovery, "setInterruptionHandler:", v20);
    v16 = self->__queue_peopleDiscovery;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_6;
    v17[3] = &unk_1EA3296D0;
    objc_copyWeak(v18, location);
    v18[1] = *(id *)&a4;
    v19 = queue_peopleDiscoverySessionID;
    -[RPPeopleDiscovery activateWithCompletion:](v16, "activateWithCompletion:", v17);
    objc_destroyWeak(v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);
    objc_destroyWeak(location);
  }
}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryPersonFound:peopleDiscoverySessionID:", v4, *(unsigned int *)(a1 + 40));

}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryPersonLost:peopleDiscoverySessionID:", v4, *(unsigned int *)(a1 + 40));

}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_queue_discoveryPersonChanged:withChangeFlags:peopleDiscoverySessionID:", v6, a3, *(unsigned int *)(a1 + 40));

}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_discoveryInvalidatedWithPeopleDiscoverySessionID:", *(unsigned int *)(a1 + 40));

}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_discoveryInterruptedWithPeopleDiscoverySessionID:", *(unsigned int *)(a1 + 40));

}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_6(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryActivatedWithError:timeout:peopleDiscoverySessionID:", v4, *(unsigned int *)(a1 + 48), *(double *)(a1 + 40));

}

- (void)stopDiscovery
{
  NSObject *v3;
  unsigned int queue_peopleDiscoverySessionID;
  RPPeopleDiscovery *queue_peopleDiscovery;
  NSMutableDictionary *queue_discoveredPersons;
  NSMutableDictionary *queue_discoveredIdentities;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscovery)
  {
    v3 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      queue_peopleDiscoverySessionID = self->__queue_peopleDiscoverySessionID;
      v9[0] = 67109120;
      v9[1] = queue_peopleDiscoverySessionID;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] discovery stop ID %u", (uint8_t *)v9, 8u);
    }

    -[RPPeopleDiscovery invalidate](self->__queue_peopleDiscovery, "invalidate");
    queue_peopleDiscovery = self->__queue_peopleDiscovery;
    self->__queue_peopleDiscovery = 0;

    queue_discoveredPersons = self->__queue_discoveredPersons;
    self->__queue_discoveredPersons = 0;

    queue_discoveredIdentities = self->__queue_discoveredIdentities;
    self->__queue_discoveredIdentities = 0;

    ++self->__queue_peopleDiscoverySessionID;
    -[CAMPeopleProximityRapportScanner delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peopleProximityScannerDidStopDiscovery:", self);

  }
}

- (void)_queue_discoveryActivatedWithError:(id)a3 timeout:(double)a4 peopleDiscoverySessionID:(unsigned int)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  unsigned int v18;
  id buf;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a5)
  {
    v9 = os_log_create("com.apple.camera", "SharedLibrary");
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CAMPeopleProximityRapportScanner _queue_discoveryActivatedWithError:timeout:peopleDiscoverySessionID:].cold.1((uint64_t)v8, v10);

      -[CAMPeopleProximityRapportScanner stopDiscovery](self, "stopDiscovery");
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = a5;
        _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] People discovery activated ID %u", (uint8_t *)&buf, 8u);
      }

      objc_initWeak(&buf, self);
      v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      -[CAMPeopleProximityRapportScanner queue](self, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __104__CAMPeopleProximityRapportScanner__queue_discoveryActivatedWithError_timeout_peopleDiscoverySessionID___block_invoke;
      v16 = &unk_1EA3296A8;
      objc_copyWeak(&v17, &buf);
      v18 = a5;
      dispatch_after(v11, v12, &v13);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&buf);
    }
    CAMSignpostWithIDAndArgs(79, 0xEEEEB0B5B2B2EEEELL, a5, objc_msgSend(v8, "code", v13, v14, v15, v16), 0, 0);
  }

}

void __104__CAMPeopleProximityRapportScanner__queue_discoveryActivatedWithError_timeout_peopleDiscoverySessionID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_discoveryTimeoutForSessionID:", *(unsigned int *)(a1 + 40));

}

- (void)_queue_discoveryInvalidatedWithPeopleDiscoverySessionID:(unsigned int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a3)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] People discovery invalidated ID %u", (uint8_t *)v6, 8u);
    }

    -[CAMPeopleProximityRapportScanner stopDiscovery](self, "stopDiscovery");
  }
}

- (void)_queue_discoveryInterruptedWithPeopleDiscoverySessionID:(unsigned int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a3)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] People discovery interrupted ID %u", (uint8_t *)v6, 8u);
    }

    -[CAMPeopleProximityRapportScanner stopDiscovery](self, "stopDiscovery");
  }
}

- (void)_queue_discoveryPersonFound:(id)a3 peopleDiscoverySessionID:(unsigned int)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a4)
  {
    +[CAMLibrarySelectionIdentity identityWithPerson:](CAMLibrarySelectionIdentity, "identityWithPerson:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPeopleProximityRapportScanner delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "peopleProximityScanner:shouldDiscoverIdentity:", self, v6);

    if (v8
      && -[CAMPeopleProximityRapportScanner _queue_shouldAdvertisePerson:](self, "_queue_shouldAdvertisePerson:", v15))
    {
      objc_msgSend(v15, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->__queue_discoveredPersons, "setObject:forKeyedSubscript:", v15, v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->__queue_discoveredIdentities, "setObject:forKeyedSubscript:", v6, v9);
      v10 = objc_msgSend(v15, "proximity");
      v11 = 20;
      v12 = 10;
      if (v10 != 10)
        v12 = 0;
      if (v10 != 20)
        v11 = v12;
      if (v10 == 30)
        v13 = 30;
      else
        v13 = v11;
      -[CAMPeopleProximityRapportScanner delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "peopleProximityScanner:didDiscoverIdentity:distance:rssi:", self, v6, v13, 0);

    }
  }

}

- (void)_queue_discoveryPersonChanged:(id)a3 withChangeFlags:(unsigned int)a4 peopleDiscoverySessionID:(unsigned int)a5
{
  uint64_t v5;
  char v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == (_DWORD)v5)
  {
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->__queue_discoveredPersons, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CAMPeopleProximityRapportScanner _queue_discoveryPersonChanged:withChangeFlags:peopleDiscoverySessionID:].cold.1((uint64_t)v8, v6, v11);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->__queue_discoveredPersons, "setObject:forKeyedSubscript:", v8, v9);
      v12 = objc_msgSend(v8, "proximity");
      switch(v12)
      {
        case 30:
          v13 = 30;
          break;
        case 20:
          v13 = 20;
          break;
        case 10:
          v13 = 10;
          break;
        default:
          v13 = 0;
          break;
      }
      v14 = objc_msgSend(v10, "proximity");
      switch(v14)
      {
        case 30:
          v15 = 30;
          break;
        case 20:
          v15 = 20;
          break;
        case 10:
          v15 = 10;
          break;
        default:
          v15 = 0;
          break;
      }
      if (v13 != v15)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->__queue_discoveredIdentities, "objectForKeyedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMPeopleProximityRapportScanner delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "peopleProximityScanner:didDiscoverIdentity:distance:rssi:", self, v16, v13, 0);

      }
    }
    else
    {
      -[CAMPeopleProximityRapportScanner _queue_discoveryPersonFound:peopleDiscoverySessionID:](self, "_queue_discoveryPersonFound:peopleDiscoverySessionID:", v8, v5);
    }

  }
}

- (void)_queue_discoveryPersonLost:(id)a3 peopleDiscoverySessionID:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a4)
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->__queue_discoveredPersons, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138477827;
        v13 = v6;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] Lost %{private}@", (uint8_t *)&v12, 0xCu);
      }

      -[NSMutableDictionary objectForKeyedSubscript:](self->__queue_discoveredIdentities, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[CAMPeopleProximityRapportScanner delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "peopleProximityScanner:didLoseIdentity:", self, v10);

      }
      -[NSMutableDictionary removeObjectForKey:](self->__queue_discoveredPersons, "removeObjectForKey:", v7);
      -[NSMutableDictionary removeObjectForKey:](self->__queue_discoveredIdentities, "removeObjectForKey:", v7);

    }
  }

}

- (BOOL)_queue_shouldAdvertisePerson:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return 1;
}

- (void)_queue_discoveryTimeoutForSessionID:(unsigned int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a3)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] Discovery timeout sessionID:%u", (uint8_t *)v6, 8u);
    }

    -[CAMPeopleProximityRapportScanner stopDiscovery](self, "stopDiscovery");
  }
}

- (CAMPeopleProximityScannerDelegate)delegate
{
  return (CAMPeopleProximityScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RPPeopleDiscovery)_queue_peopleDiscovery
{
  return self->__queue_peopleDiscovery;
}

- (void)set_queue_peopleDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->__queue_peopleDiscovery, a3);
}

- (NSMutableDictionary)_queue_discoveredPersons
{
  return self->__queue_discoveredPersons;
}

- (void)set_queue_discoveredPersons:(id)a3
{
  objc_storeStrong((id *)&self->__queue_discoveredPersons, a3);
}

- (NSMutableDictionary)_queue_discoveredIdentities
{
  return self->__queue_discoveredIdentities;
}

- (void)set_queue_discoveredIdentities:(id)a3
{
  objc_storeStrong((id *)&self->__queue_discoveredIdentities, a3);
}

- (unsigned)_queue_peopleDiscoverySessionID
{
  return self->__queue_peopleDiscoverySessionID;
}

- (void)set_queue_peopleDiscoverySessionID:(unsigned int)a3
{
  self->__queue_peopleDiscoverySessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__queue_discoveredIdentities, 0);
  objc_storeStrong((id *)&self->__queue_discoveredPersons, 0);
  objc_storeStrong((id *)&self->__queue_peopleDiscovery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_queue_discoveryActivatedWithError:(uint64_t)a1 timeout:(NSObject *)a2 peopleDiscoverySessionID:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "[CAMPeopleProximityRapportScanner] People discovery start failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_discoveryPersonChanged:(uint64_t)a1 withChangeFlags:(char)a2 peopleDiscoverySessionID:(NSObject *)a3 .cold.1(uint64_t a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_0_2();
    if ((a2 & 2) == 0)
    {
LABEL_3:
      if ((a2 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      OUTLINED_FUNCTION_0_2();
      if ((a2 & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  OUTLINED_FUNCTION_0_2();
  if ((a2 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a2 & 8) != 0)
LABEL_5:
    OUTLINED_FUNCTION_0_2();
LABEL_6:
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 138478083;
  v9 = a1;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_1DB760000, a3, OS_LOG_TYPE_DEBUG, "[CAMPeopleProximityRapportScanner] Getting person changes for %{private}@: %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
