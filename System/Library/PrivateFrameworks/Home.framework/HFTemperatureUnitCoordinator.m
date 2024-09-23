@implementation HFTemperatureUnitCoordinator

+ (id)sharedCoordinator
{
  if (qword_1ED379430 != -1)
    dispatch_once(&qword_1ED379430, &__block_literal_global_134);
  return (id)_MergedGlobals_274;
}

- (BOOL)isCelsius
{
  return self->_isCelsius;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTemperatureUnitCoordinator observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTemperatureUnitCoordinator observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

void __49__HFTemperatureUnitCoordinator_sharedCoordinator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_274;
  _MergedGlobals_274 = v0;

}

- (HFTemperatureUnitCoordinator)init
{
  HFTemperatureUnitCoordinator *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFTemperatureUnitCoordinator;
  v2 = -[HFTemperatureUnitCoordinator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTemperatureUnitCoordinator setObservers:](v2, "setObservers:", v3);

    -[HFTemperatureUnitCoordinator _updateIsCelsiusNotifyingObservers:](v2, "_updateIsCelsiusNotifyingObservers:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__temperatureUnitDidChange, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)_updateIsCelsiusNotifyingObservers:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 isCelsius;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  isCelsius = self->_isCelsius;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99828]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isCelsius = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C99830]);

  if (v3 && isCelsius != self->_isCelsius)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[HFTemperatureUnitCoordinator observers](self, "observers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "temperatureUnitObserver:didChangeTemperatureUnit:", self, self->_isCelsius);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_temperatureUnitDidChange
{
  -[HFTemperatureUnitCoordinator _updateIsCelsiusNotifyingObservers:](self, "_updateIsCelsiusNotifyingObservers:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
