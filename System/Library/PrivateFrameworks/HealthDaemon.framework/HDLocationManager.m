@implementation HDLocationManager

- (HDLocationManager)init
{
  HDLocationManager *v2;
  HDAssertionManager *v3;
  HDAssertionManager *assertionManager;
  id v5;
  uint64_t v6;
  HKObserverSet *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDLocationManager;
  v2 = -[HDLocationManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v3;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v2->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v2, CFSTR("HDWorkoutSessionAssertionIdentifierLocationUpdating"), MEMORY[0x1E0C80D38]);
    v5 = objc_alloc(MEMORY[0x1E0CB6988]);
    v6 = objc_msgSend(v5, "initWithName:loggingCategory:", CFSTR("health-location-manager-observers"), *MEMORY[0x1E0CB5380]);
    observers = v2->_observers;
    v2->_observers = (HKObserverSet *)v6;

    -[HDLocationManager setLocationManagerConfiguration:](v2, 0);
  }
  return v2;
}

- (void)setLocationManagerConfiguration:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      v5 = _Block_copy(v3);
      v6 = (void *)a1[5];
      a1[5] = v5;

    }
    else
    {
      objc_initWeak(&location, a1);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__HDLocationManager_setLocationManagerConfiguration___block_invoke;
      v9[3] = &unk_1E6CEB420;
      objc_copyWeak(&v10, &location);
      v7 = _Block_copy(v9);
      v8 = (void *)a1[5];
      a1[5] = v7;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

- (void)dealloc
{
  CLLocationManager *locationManager;
  CLInUseAssertion *inUseAssertion;
  objc_super v5;

  -[HDAssertionManager removeObserver:](self->_assertionManager, "removeObserver:", self);
  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  -[CLInUseAssertion invalidate](self->_inUseAssertion, "invalidate");
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

  v5.receiver = self;
  v5.super_class = (Class)HDLocationManager;
  -[HDLocationManager dealloc](&v5, sel_dealloc);
}

- (void)requestWhenInUseAuthorization
{
  -[CLLocationManager requestWhenInUseAuthorization](self->_locationManager, "requestWhenInUseAuthorization");
}

- (id)takeLocationUpdatingAssertionForOwnerIdentifier:(id)a3 desiredAccuracy:(double)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  double v14;

  v6 = (objc_class *)MEMORY[0x1E0D29800];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierLocationUpdating"), v7);

  if (-[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v8))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HDLocationManager_takeLocationUpdatingAssertionForOwnerIdentifier_desiredAccuracy___block_invoke;
    block[3] = &unk_1E6CE9C58;
    block[4] = self;
    v14 = a4;
    v9 = v8;
    v13 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __85__HDLocationManager_takeLocationUpdatingAssertionForOwnerIdentifier_desiredAccuracy___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_takeLocationUpdatingAssertionWithAccuracy:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_unitTest_didTakeAssertion:", *(_QWORD *)(a1 + 40));
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierLocationUpdating"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    -[HDLocationManager _mainQueue_releaseLocationUpdatingAssertion](self, "_mainQueue_releaseLocationUpdatingAssertion");
  -[HDLocationManager _mainQueue_updateLocationManager](self, "_mainQueue_updateLocationManager");
  -[HDLocationManager _unitTest_didInvalidateAssertion:](self, "_unitTest_didInvalidateAssertion:", v7);

}

id __53__HDLocationManager_setLocationManagerConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_newLocationManagerWithEffectiveBundlePath:", CFSTR("/System/Library/LocationBundles/AppleWatchWorkout.bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_mainQueue_newLocationManagerWithEffectiveBundlePath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3C8]), "initWithEffectiveBundlePath:delegate:onQueue:", v4, self, v5);

  objc_msgSend(v6, "setActivityType:", 3);
  return v6;
}

- (void)_mainQueue_updateLocationManager
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  CLLocationManager *locationManager;
  CLLocationManager *v7;
  CLLocationManager *v8;
  CLLocationManager *v9;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("HDWorkoutSessionAssertionIdentifierLocationUpdating"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[HKObserverSet count](self->_observers, "count");
  locationManager = self->_locationManager;
  if (v4 | v5)
  {
    if (!locationManager)
    {
      (*((void (**)(void))self->_locationManagerConfiguration + 2))();
      v8 = (CLLocationManager *)objc_claimAutoreleasedReturnValue();
      v9 = self->_locationManager;
      self->_locationManager = v8;

      -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
    }
  }
  else
  {
    -[CLLocationManager setDelegate:](locationManager, "setDelegate:", 0);
    v7 = self->_locationManager;
    self->_locationManager = 0;

  }
}

- (void)_mainQueue_takeLocationUpdatingAssertionWithAccuracy:(double)a3
{
  void *v5;
  void *v6;
  CLInUseAssertion *v7;
  CLInUseAssertion *inUseAssertion;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HDLocationManager _mainQueue_updateLocationManager](self, "_mainQueue_updateLocationManager");
  if (!self->_inUseAssertion)
  {
    v5 = (void *)MEMORY[0x1E0C9E3A8];
    HKWorkoutLocationBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CLInUseAssertion *)objc_msgSend(v5, "newAssertionForBundle:withReason:", v6, CFSTR("HDLocationManager requested location"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v7;

  }
  -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", a3);
  -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
}

- (void)_mainQueue_releaseLocationUpdatingAssertion
{
  CLInUseAssertion *inUseAssertion;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  -[CLInUseAssertion invalidate](self->_inUseAssertion, "invalidate");
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  HKObserverSet *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HDLocationManager_locationManagerDidChangeAuthorization___block_invoke;
  v7[3] = &unk_1E6CEB448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

void __59__HDLocationManager_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "healthLocationManager:didChangeAuthorizationStatus:", v2, objc_msgSend(v3, "authorizationStatus"));

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  HKObserverSet *observers;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HDLocationManager_locationManager_didUpdateLocations___block_invoke;
  v8[3] = &unk_1E6CEB448;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v8);

}

uint64_t __56__HDLocationManager_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "healthLocationManager:didUpdateLocations:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  HKObserverSet *observers;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HDLocationManager_locationManager_didFailWithError___block_invoke;
  v8[3] = &unk_1E6CEB448;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v8);

}

uint64_t __54__HDLocationManager_locationManager_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "healthLocationManager:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__HDLocationManager_addObserver___block_invoke;
  v6[3] = &unk_1E6CE8080;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __33__HDLocationManager_addObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "registerObserver:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_updateLocationManager");
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__HDLocationManager_removeObserver___block_invoke;
  v6[3] = &unk_1E6CE8080;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __36__HDLocationManager_removeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unregisterObserver:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_updateLocationManager");
}

- (void)_unitTest_setLocationManagerConfiguration:(id)a3
{
  -[HDLocationManager setLocationManagerConfiguration:](self, a3);
}

- (id)_unitTest_locationManager
{
  return self->_locationManager;
}

- (void)_unitTest_didTakeAssertion:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_unitTestDelegate);
    objc_msgSend(v6, "_unitTest_healthLocationManager:didTakeAssertion:", self, v7);

  }
}

- (void)_unitTest_didInvalidateAssertion:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_unitTestDelegate);
    objc_msgSend(v6, "_unitTest_healthLocationManager:didInvalidateAssertion:", self, v7);

  }
}

- (HDLocationManagerUnitTestDelegate)unitTestDelegate
{
  return (HDLocationManagerUnitTestDelegate *)objc_loadWeakRetained((id *)&self->_unitTestDelegate);
}

- (void)setUnitTestDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_unitTestDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTestDelegate);
  objc_storeStrong(&self->_locationManagerConfiguration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
}

@end
