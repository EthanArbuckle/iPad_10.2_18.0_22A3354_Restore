@implementation HFAccessorySettingMobileTimerAdapter

- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HFAccessorySettingMobileTimerAdapter *v18;
  void *v19;
  uint64_t v20;
  NSHashTable *observers;
  uint64_t v22;
  NSMutableSet *internalAlarmsBeingAdded;
  uint64_t v24;
  NSMutableSet *internalAlarmsBeingRemoved;
  uint64_t v26;
  NSMutableSet *internalAlarmsBeingUpdated;
  uint64_t v28;
  NSUserDefaults *soundBoardPrefs;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  COAlarmManager *coordinationAlarmManager;
  void *v39;
  objc_super v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingMobileTimerAdapter.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

  }
  v42[0] = CFSTR("root.mobileTimer.alarms");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CBA1E0];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = (void *)v7;
  objc_msgSend(v15, "setItemValueClasses:forKeyPath:", v14, CFSTR("root.mobileTimer.alarms"));

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41.receiver = self;
  v41.super_class = (Class)HFAccessorySettingMobileTimerAdapter;
  v18 = -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](&v41, sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_, v6, v17, a4, 0);

  v19 = v6;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    observers = v18->_observers;
    v18->_observers = (NSHashTable *)v20;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    internalAlarmsBeingAdded = v18->_internalAlarmsBeingAdded;
    v18->_internalAlarmsBeingAdded = (NSMutableSet *)v22;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = objc_claimAutoreleasedReturnValue();
    internalAlarmsBeingRemoved = v18->_internalAlarmsBeingRemoved;
    v18->_internalAlarmsBeingRemoved = (NSMutableSet *)v24;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v26 = objc_claimAutoreleasedReturnValue();
    internalAlarmsBeingUpdated = v18->_internalAlarmsBeingUpdated;
    v18->_internalAlarmsBeingUpdated = (NSMutableSet *)v26;

    -[HFAccessorySettingMobileTimerAdapter _setupDebugHandler](v18, "_setupDebugHandler");
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.soundboard"));
    soundBoardPrefs = v18->_soundBoardPrefs;
    v18->_soundBoardPrefs = (NSUserDefaults *)v28;

    if (_os_feature_enabled_impl())
    {
      v30 = v6;
      if (objc_msgSend(v30, "conformsToProtocol:", &unk_1F0449888))
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      objc_msgSend(v32, "accessories");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x1E0D148D8];
      objc_msgSend(v33, "anyObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "hf_AlarmManagerForAccessory:", v35);
      v36 = objc_claimAutoreleasedReturnValue();
      coordinationAlarmManager = v18->_coordinationAlarmManager;
      v18->_coordinationAlarmManager = (COAlarmManager *)v36;

    }
  }

  return v18;
}

- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingMobileTimerAdapter.m"), 124, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingMobileTimerAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (HFAccessorySettingMobileTimerAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingMobileTimerAdapter.m"), 129, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingMobileTimerAdapter initWithHomeKitSettingsVendor:keyPaths:updateHandler:]",
    v8);

  return 0;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAccessorySettingMobileTimerAdapter observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAccessorySettingMobileTimerAdapter observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSSet)alarmsWithPendingEdits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[HFAccessorySettingMobileTimerAdapter internalAlarmsBeingAdded](self, "internalAlarmsBeingAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[HFAccessorySettingMobileTimerAdapter internalAlarmsBeingUpdated](self, "internalAlarmsBeingUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[HFAccessorySettingMobileTimerAdapter internalAlarmsBeingRemoved](self, "internalAlarmsBeingRemoved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  return (NSSet *)v3;
}

- (HMAccessoryCollectionSetting)alarmCollectionSetting
{
  return (HMAccessoryCollectionSetting *)-[HFAccessorySettingAdapter settingForKeyPath:](self, "settingForKeyPath:", CFSTR("root.mobileTimer.alarms"));
}

- (BOOL)isAdapterReady
{
  BOOL v3;
  void *v4;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  -[HFAccessorySettingMobileTimerAdapter alarmCollectionSetting](self, "alarmCollectionSetting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)shouldSynchronizeMobileTimerToHomeKit
{
  return 1;
}

- (void)homeKitSettingWasUpdated:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x39uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEBUG, "Setting '%@' was updated to: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v6, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("root.mobileTimer.alarms"));

  if (v10)
  {
    -[HFAccessorySettingMobileTimerAdapter _notifyObserversOfUpdates](self, "_notifyObserversOfUpdates");
    v11 = -[HFAccessorySettingMobileTimerAdapter _synchronizeHomeKitToMobileTimer](self, "_synchronizeHomeKitToMobileTimer");
  }

}

- (id)allAlarms
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D4FA50];
  -[HFAccessorySettingAdapter valueManager](self, "valueManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForSettingAtKeyPath:", CFSTR("root.mobileTimer.alarms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_buildAlarmsFromCollectionSettingItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allAlarmsFuture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  if (_os_feature_enabled_impl()
    && (-[HFAccessorySettingMobileTimerAdapter coordinationAlarmManager](self, "coordinationAlarmManager"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "alarms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reschedule:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__HFAccessorySettingMobileTimerAdapter_allAlarmsFuture__block_invoke;
    v10[3] = &unk_1EA72ADB0;
    v10[4] = self;
    objc_msgSend(v7, "flatMap:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFAccessorySettingMobileTimerAdapter alarmSettingsCurrentItemsFuture](self, "alarmSettingsCurrentItemsFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flatMap:", &__block_literal_global_199);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id __55__HFAccessorySettingMobileTimerAdapter_allAlarmsFuture__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internalAlarmsBeingAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 32), "internalAlarmsBeingAdded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    HFLogForCategory(4uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "internalAlarmsBeingAdded");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[HFAccessorySettingMobileTimerAdapter allAlarmsFuture]_block_invoke";
      v15 = 2112;
      v16 = v9;
      v17 = 2048;
      v18 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%s(%@): reporting %lu new-alarms-being-added to the offical Coordination set", (uint8_t *)&v13, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __55__HFAccessorySettingMobileTimerAdapter_allAlarmsFuture__block_invoke_282(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D4FA50], "hf_buildAlarmsFromCollectionSettingItems:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)alarmSettingsCurrentItemsFuture
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[HFAccessorySettingAdapter valueManager](self, "valueManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingAdapter settingWatchFutureForKeyPath:](self, "settingWatchFutureForKeyPath:", CFSTR("root.mobileTimer.alarms"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__HFAccessorySettingMobileTimerAdapter_alarmSettingsCurrentItemsFuture__block_invoke;
  v8[3] = &unk_1EA73D168;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__HFAccessorySettingMobileTimerAdapter_alarmSettingsCurrentItemsFuture__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "valueForSetting:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)alarmManagerAlarms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (_os_feature_enabled_impl()
    && (-[HFAccessorySettingMobileTimerAdapter coordinationAlarmManager](self, "coordinationAlarmManager"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "alarms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFAccessorySettingMobileTimerAdapter alarmManagerForSynchronizationFuture](self, "alarmManagerForSynchronizationFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flatMap:", &__block_literal_global_285);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flatMap:", &__block_literal_global_286_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reschedule:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __58__HFAccessorySettingMobileTimerAdapter_alarmManagerAlarms__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarms");
}

id __58__HFAccessorySettingMobileTimerAdapter_alarmManagerAlarms__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)updateAlarm:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFAccessorySettingMobileTimerAdapter internalAlarmsBeingUpdated](self, "internalAlarmsBeingUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  HFLogForCategory(0x39uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Updating alarm %@", buf, 0xCu);
  }

  v7 = _os_feature_enabled_impl();
  v8 = MEMORY[0x1E0C809B0];
  if (!v7)
    goto LABEL_6;
  -[HFAccessorySettingMobileTimerAdapter coordinationAlarmManager](self, "coordinationAlarmManager");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        -[HFAccessorySettingMobileTimerAdapter coordinationAlarmManager](self, "coordinationAlarmManager"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "updateAlarm:", v4),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v12))
  {
LABEL_6:
    -[HFAccessorySettingAdapter valueManager](self, "valueManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingMobileTimerAdapter alarmCollectionSettingFuture](self, "alarmCollectionSettingFuture");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __52__HFAccessorySettingMobileTimerAdapter_updateAlarm___block_invoke;
    v21[3] = &unk_1EA73D1F0;
    v22 = v13;
    v23 = v4;
    v15 = v13;
    objc_msgSend(v14, "flatMap:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __52__HFAccessorySettingMobileTimerAdapter_updateAlarm___block_invoke_2;
  v19[3] = &unk_1EA72A0C8;
  v19[4] = self;
  v20 = v4;
  v16 = v4;
  v17 = (id)objc_msgSend(v12, "addCompletionBlock:", v19);

  return v12;
}

id __52__HFAccessorySettingMobileTimerAdapter_updateAlarm___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)MEMORY[0x1E0CBA1E8];
  objc_msgSend(*(id *)(a1 + 40), "alarmID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_alarmItemsMatchingAlarmId:withinItemArray:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInArray:", v9);

  objc_msgSend(MEMORY[0x1E0CBA1E8], "hf_collectionSettingItemForAlarm:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

  objc_msgSend(*(id *)(a1 + 32), "changeValueForSetting:toValue:changeType:", v4, v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __52__HFAccessorySettingMobileTimerAdapter_updateAlarm___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logError:operationDescription:", v5, CFSTR("updateAlarm:"));

  }
  objc_msgSend(*(id *)(a1 + 32), "_submitAnalyticsForUpdatedAlarm:success:", *(_QWORD *)(a1 + 40), a3 == 0);
  objc_msgSend(*(id *)(a1 + 32), "internalAlarmsBeingUpdated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfUpdates");
}

- (id)removeAlarm:(id)a3
{
  HFAccessorySettingMobileTimerAdapter *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  _QWORD v22[5];
  HFAccessorySettingMobileTimerAdapter *v23;
  _QWORD v24[4];
  id v25;
  HFAccessorySettingMobileTimerAdapter *v26;
  uint8_t buf[4];
  HFAccessorySettingMobileTimerAdapter *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (HFAccessorySettingMobileTimerAdapter *)a3;
  if (v5)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    -[HFAccessorySettingMobileTimerAdapter internalAlarmsBeingRemoved](self, "internalAlarmsBeingRemoved");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    HFLogForCategory(0x39uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Remove alarm %@", buf, 0xCu);
    }

    v8 = _os_feature_enabled_impl();
    v9 = MEMORY[0x1E0C809B0];
    if (!v8)
      goto LABEL_14;
    -[HFAccessorySettingMobileTimerAdapter coordinationAlarmManager](self, "coordinationAlarmManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HFAccessorySettingMobileTimerAdapter coordinationAlarmManager](self, "coordinationAlarmManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAlarm:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    -[HFAccessorySettingMobileTimerAdapter _notifyObserversOfUpdates](self, "_notifyObserversOfUpdates");

    if (!v12)
    {
LABEL_14:
      -[HFAccessorySettingAdapter valueManager](self, "valueManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingMobileTimerAdapter alarmCollectionSettingFuture](self, "alarmCollectionSettingFuture");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __52__HFAccessorySettingMobileTimerAdapter_removeAlarm___block_invoke;
      v24[3] = &unk_1EA73D1F0;
      v25 = v16;
      v26 = v5;
      v18 = v16;
      objc_msgSend(v17, "flatMap:", v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __52__HFAccessorySettingMobileTimerAdapter_removeAlarm___block_invoke_2;
    v22[3] = &unk_1EA72A0C8;
    v22[4] = self;
    v23 = v5;
    v19 = (id)objc_msgSend(v12, "addCompletionBlock:", v22);

  }
  else
  {
    HFLogForCategory(0x39uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v21;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "%@:%@ nil alarm. If you can reproduce this, please file a radar!", buf, 0x16u);

    }
    if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", -1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleError:operationType:options:retryBlock:cancelBlock:", v14, CFSTR("HFOperationRemoveHomePodAlarm"), 0, 0, 0);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id __52__HFAccessorySettingMobileTimerAdapter_removeAlarm___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)MEMORY[0x1E0CBA1E8];
  objc_msgSend(*(id *)(a1 + 40), "alarmID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_alarmItemsMatchingAlarmId:withinItemArray:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInArray:", v9);

  objc_msgSend(*(id *)(a1 + 32), "changeValueForSetting:toValue:changeType:", v4, v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __52__HFAccessorySettingMobileTimerAdapter_removeAlarm___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logError:operationDescription:", v5, CFSTR("removeAlarm:"));

  }
  objc_msgSend(*(id *)(a1 + 32), "_submitAnalyticsForDeletedAlarm:success:", *(_QWORD *)(a1 + 40), v5 == 0);
  objc_msgSend(*(id *)(a1 + 32), "internalAlarmsBeingRemoved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfUpdates");

}

- (id)addAlarm:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFAccessorySettingMobileTimerAdapter internalAlarmsBeingAdded](self, "internalAlarmsBeingAdded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  HFLogForCategory(4uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Adding alarm %@", buf, 0xCu);
  }

  v7 = _os_feature_enabled_impl();
  v8 = MEMORY[0x1E0C809B0];
  if (!v7)
    goto LABEL_8;
  -[HFAccessorySettingMobileTimerAdapter coordinationAlarmManager](self, "coordinationAlarmManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HFAccessorySettingMobileTimerAdapter coordinationAlarmManager](self, "coordinationAlarmManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAlarm:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[HFAccessorySettingMobileTimerAdapter _notifyObserversOfUpdates](self, "_notifyObserversOfUpdates");

  if (!v11)
  {
LABEL_8:
    -[HFAccessorySettingAdapter valueManager](self, "valueManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBA1E8], "hf_collectionSettingItemForAlarm:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingMobileTimerAdapter alarmCollectionSettingFuture](self, "alarmCollectionSettingFuture");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __49__HFAccessorySettingMobileTimerAdapter_addAlarm___block_invoke;
    v22[3] = &unk_1EA73D1F0;
    v23 = v12;
    v24 = v13;
    v15 = v13;
    v16 = v12;
    objc_msgSend(v14, "flatMap:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __49__HFAccessorySettingMobileTimerAdapter_addAlarm___block_invoke_2;
  v20[3] = &unk_1EA72A0C8;
  v20[4] = self;
  v21 = v4;
  v17 = v4;
  v18 = (id)objc_msgSend(v11, "addCompletionBlock:", v20);

  return v11;
}

id __49__HFAccessorySettingMobileTimerAdapter_addAlarm___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForSetting:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "changeValueForSetting:toValue:changeType:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __49__HFAccessorySettingMobileTimerAdapter_addAlarm___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(4uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v9 = 136315650;
    v10 = "-[HFAccessorySettingMobileTimerAdapter addAlarm:]_block_invoke_2";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@): alarm added with %@ result ", (uint8_t *)&v9, 0x20u);
  }

  if (v4)
  {
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logError:operationDescription:", v4, CFSTR("addAlarm:"));

  }
  objc_msgSend(*(id *)(a1 + 32), "_submitAnalyticsForAddedAlarm:success:", *(_QWORD *)(a1 + 40), v4 == 0);
  objc_msgSend(*(id *)(a1 + 32), "internalAlarmsBeingAdded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfUpdates");
}

- (id)alarmCollectionSettingFuture
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFAccessorySettingAdapter settingWatchFutureForKeyPath:](self, "settingWatchFutureForKeyPath:", CFSTR("root.mobileTimer.alarms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flatMap:", &__block_literal_global_301);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __68__HFAccessorySettingMobileTimerAdapter_alarmCollectionSettingFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  v4 = objc_opt_class();
  v5 = v2;
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  objc_msgSend(v3, "futureWithResult:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_synchronizeHomeKitToMobileTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[HFAccessorySettingAdapter mode](self, "mode"))
  {
    objc_initWeak(&location, self);
    -[HFAccessorySettingMobileTimerAdapter alarmManagerForSynchronizationFuture](self, "alarmManagerForSynchronizationFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke;
    v11 = &unk_1EA73D238;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v3, "flatMap:", &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSuccessBlock:", &__block_literal_global_305, v8, v9, v10, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addFailureBlock:", &__block_literal_global_308_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "alarmManagerAlarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_2;
  v10[3] = &unk_1EA73A878;
  objc_copyWeak(&v12, v4);
  v7 = v3;
  v11 = v7;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  return v8;
}

id __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "allAlarmsFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_3;
  v9[3] = &unk_1EA736B00;
  v10 = v3;
  v11 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
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
  _BYTE v42[128];
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAlarmDiff generateAlarmDiffFromSet:toSet:](HFAlarmDiff, "generateAlarmDiffFromSet:toSet:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x39uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Synchronizing HomeKit->MobileTimer: %@", buf, 0xCu);
  }

  if (objc_msgSend(v5, "inputWasEqual"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v5, "addedAlarms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(a1 + 40), "addAlarm:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v11);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v5, "updatedAlarms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 40), "updateAlarm:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v17);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v5, "deletedAlarms", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(a1 + 40), "removeAlarm:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v25));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v23);
    }

    v27 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "combineAllFutures:ignoringErrors:scheduler:", v8, 0, v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_303()
{
  NSObject *v0;
  uint8_t v1[16];

  HFLogForCategory(0x39uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DD34E000, v0, OS_LOG_TYPE_DEFAULT, "Synchronized Alarms to MTAlarmManager!", v1, 2u);
  }

}

void __72__HFAccessorySettingMobileTimerAdapter__synchronizeHomeKitToMobileTimer__block_invoke_306(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0x39uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "FAILED to Synchronize Alarms to MTAlarmManager: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)_synchronizeMobileTimerToHomeKitWithChangeType:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[HFAccessorySettingAdapter mode](self, "mode"))
  {
    -[HFAccessorySettingAdapter valueManager](self, "valueManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[HFAccessorySettingMobileTimerAdapter alarmManagerAlarms](self, "alarmManagerAlarms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke;
    v10[3] = &unk_1EA72FB20;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "flatMap:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "alarmSettingsCurrentItemsFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_2;
  v9[3] = &unk_1EA73D348;
  v13 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = WeakRetained;
  v12 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
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
  _BYTE v67[128];
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "na_map:", &__block_literal_global_310_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 56);
  if (v8 == 1)
  {
    v50 = v3;
    v13 = (void *)objc_msgSend(v3, "mutableCopy");
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_opt_new();
    v16 = v15;

    v48 = v7;
    v49 = v4;
    +[HFAlarmDiff generateAlarmDiffFromSet:toSet:](HFAlarmDiff, "generateAlarmDiffFromSet:toSet:", v4, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x39uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v17;
      _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Atomic Synchronization of Alarms Settings: %@", buf, 0xCu);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v17, "addedAlarms");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v64 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(MEMORY[0x1E0CBA1E8], "hf_collectionSettingItemForAlarm:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      }
      while (v21);
    }

    v61 = 0u;
    v62 = 0u;
    v60 = 0u;
    v59 = 0u;
    v47 = v17;
    objc_msgSend(v17, "updatedAlarms");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v60 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CBA1E8], "hf_collectionSettingItemForAlarm:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x1E0CBA1E8];
          objc_msgSend(v30, "alarmID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "hf_alarmItemsMatchingAlarmId:withinItemArray:", v33, v16);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObjectsInArray:", v34);

          objc_msgSend(v16, "addObject:", v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v27);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v47, "deletedAlarms");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v56 != v38)
            objc_enumerationMutation(v35);
          v40 = (void *)MEMORY[0x1E0CBA1E8];
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "alarmID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "hf_alarmItemsMatchingAlarmId:withinItemArray:", v41, v16);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObjectsInArray:", v42);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      }
      while (v37);
    }

    v12 = (id)objc_msgSend(v16, "copy");
    v4 = v49;
    v3 = v50;
    v7 = v48;
  }
  else if (v8)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_312_0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

  }
  objc_msgSend(*(id *)(a1 + 40), "alarmCollectionSettingFuture");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_313;
  v51[3] = &unk_1EA73D320;
  v52 = *(id *)(a1 + 48);
  v53 = v12;
  v54 = *(_QWORD *)(a1 + 56);
  v44 = v12;
  objc_msgSend(v43, "flatMap:", v51);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

uint64_t __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D4FA50], "hf_buildAlarmFromCollectionSettingItem:", a2);
}

uint64_t __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CBA1E8], "hf_collectionSettingItemForAlarm:", a2);
}

uint64_t __87__HFAccessorySettingMobileTimerAdapter__synchronizeMobileTimerToHomeKitWithChangeType___block_invoke_313(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeValueForSetting:toValue:changeType:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NAFuture)alarmManagerForSynchronizationFuture
{
  NAFuture *alarmManagerForSynchronizationFuture;
  void *v5;
  void *v6;
  void *v7;
  NAFuture *v8;
  NAFuture *v9;
  NAFuture *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  alarmManagerForSynchronizationFuture = self->_alarmManagerForSynchronizationFuture;
  if (alarmManagerForSynchronizationFuture)
    return alarmManagerForSynchronizationFuture;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D519C0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __76__HFAccessorySettingMobileTimerAdapter_alarmManagerForSynchronizationFuture__block_invoke;
  v14 = &unk_1EA729F60;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v5, "futureWithBlock:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reschedule:", v7);
  v8 = (NAFuture *)objc_claimAutoreleasedReturnValue();
  v9 = self->_alarmManagerForSynchronizationFuture;
  self->_alarmManagerForSynchronizationFuture = v8;

  v10 = self->_alarmManagerForSynchronizationFuture;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

void __76__HFAccessorySettingMobileTimerAdapter_alarmManagerForSynchronizationFuture__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "mode") == 1)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", WeakRetained, sel__alarmWasAdded_, *MEMORY[0x1E0D4F948], v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", WeakRetained, sel__alarmWasDeleted_, *MEMORY[0x1E0D4F960], v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", WeakRetained, sel__alarmWasUpdated_, *MEMORY[0x1E0D4F968], v4);

    objc_msgSend(v8, "finishWithResult:", v4);
  }
  else
  {
    objc_msgSend(v8, "finishWithNoResult");
  }

}

- (void)_submitAnalyticsForAddedAlarm:(id)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v4 = a4;
  v20[5] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("homePodAlarmID");
  v5 = a3;
  objc_msgSend(v5, "alarmIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v19[1] = CFSTR("alarmCreatedSuccessfully");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  v19[2] = CFSTR("isMusicAlarm");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "sound");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", v9 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  v19[3] = CFSTR("hasCustomVolume");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "sound");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", v12 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  v19[4] = CFSTR("customVolumeLevel");
  objc_msgSend(v5, "sound");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "soundVolume");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &unk_1EA7CD910;
  if (v15)
    v17 = (void *)v15;
  v20[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 15, v18);

}

- (void)_submitAnalyticsForUpdatedAlarm:(id)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v4 = a4;
  v20[5] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("homePodAlarmID");
  v5 = a3;
  objc_msgSend(v5, "alarmIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v19[1] = CFSTR("alarmUpdatedSuccessfully");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  v19[2] = CFSTR("isMusicAlarm");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "sound");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", v9 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  v19[3] = CFSTR("hasCustomVolume");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "sound");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", v12 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  v19[4] = CFSTR("customVolumeLevel");
  objc_msgSend(v5, "sound");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "soundVolume");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &unk_1EA7CD910;
  if (v15)
    v17 = (void *)v15;
  v20[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 16, v18);

}

- (void)_submitAnalyticsForDeletedAlarm:(id)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v4 = a4;
  v20[5] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("homePodAlarmID");
  v5 = a3;
  objc_msgSend(v5, "alarmIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v19[1] = CFSTR("alarmDeletedSuccessfully");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  v19[2] = CFSTR("isMusicAlarm");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "sound");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", v9 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  v19[3] = CFSTR("hasCustomVolume");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "sound");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", v12 != 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  v19[4] = CFSTR("customVolumeLevel");
  objc_msgSend(v5, "sound");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "soundVolume");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &unk_1EA7CD910;
  if (v15)
    v17 = (void *)v15;
  v20[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 17, v18);

}

- (void)_alarmWasAdded:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  HFLogForCategory(0x39uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Alarm was added; synchronizing MTAlarmManager -> HomeKit",
      v5,
      2u);
  }

  -[HFAccessorySettingMobileTimerAdapter _respondToAlarmManagerUpdate](self, "_respondToAlarmManagerUpdate");
}

- (void)_alarmWasDeleted:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  HFLogForCategory(0x39uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Alarm was deleted; synchronizing MTAlarmManager -> HomeKit",
      v5,
      2u);
  }

  -[HFAccessorySettingMobileTimerAdapter _respondToAlarmManagerUpdate](self, "_respondToAlarmManagerUpdate");
}

- (void)_alarmWasUpdated:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  HFLogForCategory(0x39uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Alarm was updated; synchronizing MTAlarmManager -> HomeKit",
      v5,
      2u);
  }

  -[HFAccessorySettingMobileTimerAdapter _respondToAlarmManagerUpdate](self, "_respondToAlarmManagerUpdate");
}

- (void)_respondToAlarmManagerUpdate
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  if (-[HFAccessorySettingAdapter mode](self, "mode") != 1)
    NSLog(CFSTR("Should not get here!"));
  if (-[HFAccessorySettingMobileTimerAdapter shouldSynchronizeMobileTimerToHomeKit](self, "shouldSynchronizeMobileTimerToHomeKit"))
  {
    -[HFAccessorySettingMobileTimerAdapter _synchronizeMobileTimerToHomeKitWithChangeType:](self, "_synchronizeMobileTimerToHomeKitWithChangeType:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v5, "addCompletionBlock:", &__block_literal_global_326);

  }
  else
  {
    HFLogForCategory(0x39uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "We should not _synchronizeMobileTimerToHomeKitWithChangeType", buf, 2u);
    }

  }
}

void __68__HFAccessorySettingMobileTimerAdapter__respondToAlarmManagerUpdate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory(0x39uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Error updating MTAlarmManager -> HomeKit: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Finished synchronizing MTAlarmManager -> HomeKit", (uint8_t *)&v6, 2u);
  }

}

- (void)_notifyObserversOfUpdates
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[HFAccessorySettingMobileTimerAdapter allAlarmsFuture](self, "allAlarmsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__HFAccessorySettingMobileTimerAdapter__notifyObserversOfUpdates__block_invoke;
  v5[3] = &unk_1EA730B78;
  v5[4] = self;
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

}

void __65__HFAccessorySettingMobileTimerAdapter__notifyObserversOfUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "mobileTimerAdapter:didUpdateAlarms:", *(_QWORD *)(a1 + 32), v3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_beginMonitoringSettingsKeyPath:(id)a3
{
  void *v4;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (-[HFAccessorySettingAdapter mode](self, "mode", a3) == 1)
  {
    -[HFAccessorySettingMobileTimerAdapter _synchronizeMobileTimerToHomeKitWithChangeType:](self, "_synchronizeMobileTimerToHomeKitWithChangeType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (-[HFAccessorySettingAdapter mode](self, "mode"))
  {
    NSLog(CFSTR("Invalid mode specified for MobileTimer adapter!"), 0);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[HFAccessorySettingMobileTimerAdapter alarmCollectionSettingFuture](self, "alarmCollectionSettingFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HFAccessorySettingMobileTimerAdapter__beginMonitoringSettingsKeyPath___block_invoke;
  v8[3] = &unk_1EA73D390;
  v8[4] = self;
  objc_msgSend(v6, "addSuccessBlock:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __72__HFAccessorySettingMobileTimerAdapter__beginMonitoringSettingsKeyPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "mobileTimerAdapterDidUpdateReadiness:", *(_QWORD *)(a1 + 32));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_setupDebugHandler
{
  void *v2;
  objc_class *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  +[HFDebugStateDumpManager sharedInstance](HFDebugStateDumpManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HFAccessorySettingMobileTimerAdapter__setupDebugHandler__block_invoke;
  v6[3] = &unk_1EA7266C0;
  objc_copyWeak(&v7, &location);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "registerStateDumpHandler:withName:", v6, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __58__HFAccessorySettingMobileTimerAdapter__setupDebugHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[HFStateDumpBuilderContext contextWithDetailLevel:](HFStateDumpBuilderContext, "contextWithDetailLevel:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", WeakRetained, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "internalAlarmsBeingAdded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:withName:options:", v4, CFSTR("alarmsBeingAdded"), 1);

  objc_msgSend(WeakRetained, "internalAlarmsBeingRemoved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:withName:options:", v5, CFSTR("alarmsBeingRemoved"), 1);

  objc_msgSend(WeakRetained, "internalAlarmsBeingUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:withName:options:", v6, CFSTR("alarmsBeingUpdated"), 1);

  if (objc_msgSend(WeakRetained, "mode") == 1)
    v7 = CFSTR("Accessory");
  else
    v7 = CFSTR("Controller");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("adapterMode"));
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "alarmsSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("MTAlarms"));

  objc_msgSend(WeakRetained, "settingForKeyPath:", CFSTR("root.mobileTimer.alarms"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("HKAlarms"));

  objc_msgSend(v3, "buildPropertyListRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setAlarmManagerForSynchronizationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManagerForSynchronizationFuture, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NAFuture)setupAccessoryAdapterModeFuture
{
  return self->_setupAccessoryAdapterModeFuture;
}

- (NSMutableSet)internalAlarmsBeingAdded
{
  return self->_internalAlarmsBeingAdded;
}

- (NSMutableSet)internalAlarmsBeingRemoved
{
  return self->_internalAlarmsBeingRemoved;
}

- (NSMutableSet)internalAlarmsBeingUpdated
{
  return self->_internalAlarmsBeingUpdated;
}

- (NSUserDefaults)soundBoardPrefs
{
  return self->_soundBoardPrefs;
}

- (void)setSoundBoardPrefs:(id)a3
{
  objc_storeStrong((id *)&self->_soundBoardPrefs, a3);
}

- (COAlarmManager)coordinationAlarmManager
{
  return self->_coordinationAlarmManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationAlarmManager, 0);
  objc_storeStrong((id *)&self->_soundBoardPrefs, 0);
  objc_storeStrong((id *)&self->_internalAlarmsBeingUpdated, 0);
  objc_storeStrong((id *)&self->_internalAlarmsBeingRemoved, 0);
  objc_storeStrong((id *)&self->_internalAlarmsBeingAdded, 0);
  objc_storeStrong((id *)&self->_setupAccessoryAdapterModeFuture, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_alarmManagerForSynchronizationFuture, 0);
}

@end
