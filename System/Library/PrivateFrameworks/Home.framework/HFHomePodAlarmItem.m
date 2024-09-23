@implementation HFHomePodAlarmItem

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_4 != -1)
    dispatch_once(&_MergedGlobals_2_4, &__block_literal_global_3_13);
  return (NAIdentity *)(id)qword_1ED378A28;
}

void __33__HFHomePodAlarmItem_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCharacteristic:", &__block_literal_global_5_15);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_6_12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED378A28;
  qword_1ED378A28 = v2;

}

uint64_t __33__HFHomePodAlarmItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarm");
}

id __33__HFHomePodAlarmItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (HFHomePodAlarmItem)initWithMediaProfileContainer:(id)a3 alarm:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HFHomePodAlarmItem *v11;
  HFHomePodAlarmItem *v12;
  void *v13;
  uint64_t v14;
  NSString *alarmIdentifier;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomePodAlarmItem.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomePodAlarmItem.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alarm"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)HFHomePodAlarmItem;
  v11 = -[HFHomePodAlarmItem init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaProfileContainer, a3);
    objc_storeStrong((id *)&v12->_alarm, a4);
    objc_msgSend(v10, "alarmID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    alarmIdentifier = v12->_alarmIdentifier;
    v12->_alarmIdentifier = (NSString *)v14;

  }
  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[HFHomePodAlarmItem alarm](self, "alarm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (HMMediaProfile)mediaProfile
{
  void *v2;
  void *v3;
  void *v4;

  -[HFHomePodAlarmItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMediaProfile *)v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v48[5];
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id location[2];

  v4 = a3;
  -[HFHomePodAlarmItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsAdapterManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adapterForIdentifier:", CFSTR("MobileTimerAdapter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_msgSend(v7, "allAlarmsFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v10 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke;
    v51[3] = &unk_1EA731800;
    objc_copyWeak(&v53, location);
    v11 = v8;
    v52 = v11;
    v12 = (id)objc_msgSend(v9, "addSuccessBlock:", v51);
    v49[0] = v10;
    v49[1] = 3221225472;
    v49[2] = __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_3;
    v49[3] = &unk_1EA726968;
    v13 = v11;
    v50 = v13;
    v14 = (id)objc_msgSend(v9, "addFailureBlock:", v49);
    v15 = v50;
    v16 = v13;

    objc_destroyWeak(&v53);
    objc_destroyWeak(location);
    goto LABEL_16;
  }
  objc_msgSend(v7, "allAlarms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E20];
  -[HFHomePodAlarmItem mediaProfileContainer](self, "mediaProfileContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomePodAlarmItem mediaProfileContainer](self, "mediaProfileContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObjects:", v18, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFHomePodAlarmItem mediaProfileContainer](self, "mediaProfileContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hf_dependentHomeKitObjectsForDownstreamItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unionSet:", v23);

  -[HFHomePodAlarmItem mediaProfileContainer](self, "mediaProfileContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = &unk_1F0420440;
  v26 = v24;
  v27 = v26;
  if (v26)
  {
    if (objc_msgSend(v26, "conformsToProtocol:", v25))
      v28 = v27;
    else
      v28 = 0;
    v29 = v27;
    if (v28)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v32);

  }
  v29 = 0;
LABEL_10:

  objc_msgSend(v29, "settings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "hf_accessorySettingAtKeyPath:", CFSTR("root.mobileTimer.alarms"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v29, "settings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "hf_accessorySettingAtKeyPath:", CFSTR("root.mobileTimer.alarms"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v36);

  }
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_4;
  v48[3] = &unk_1EA7353A8;
  v48[4] = self;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v48);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomePodAlarmItem setAlarm:](self, "setAlarm:", v37);

  v38 = (void *)objc_opt_new();
  -[HFHomePodAlarmItem alarm](self, "alarm");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[HFHomePodAlarmItem alarm](self, "alarm");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "displayTitle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, CFSTR("title"));

    -[HFHomePodAlarmItem alarm](self, "alarm");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v42, CFSTR("MTALARM"));

    objc_msgSend(v38, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v21, CFSTR("dependentHomeKitObjects"));
    v43 = (void *)MEMORY[0x1E0CB37E8];
    -[HFHomePodAlarmItem mediaProfileContainer](self, "mediaProfileContainer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "settings");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "numberWithInt:", objc_msgSend(v45, "isControllable") ^ 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v46, CFSTR("isDisabled"));

  }
  else
  {
    objc_msgSend(v38, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v38);
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v16;
}

void __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];

  v34 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_dependentHomeKitObjectsForDownstreamItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v10);

  objc_msgSend(WeakRetained, "mediaProfileContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &unk_1F0420440;
  v13 = v11;
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  if (objc_msgSend(v13, "conformsToProtocol:", v12))
    v15 = v14;
  else
    v15 = 0;
  v16 = v14;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v19);

LABEL_7:
    v16 = 0;
  }

  objc_msgSend(v16, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hf_accessorySettingAtKeyPath:", CFSTR("root.mobileTimer.alarms"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v16, "settings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hf_accessorySettingAtKeyPath:", CFSTR("root.mobileTimer.alarms"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v23);

  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_2;
  v35[3] = &unk_1EA7353A8;
  v35[4] = WeakRetained;
  objc_msgSend(v34, "na_firstObjectPassingTest:", v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAlarm:", v24);

  v25 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "alarm");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(WeakRetained, "alarm");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "displayTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("title"));

    objc_msgSend(WeakRetained, "alarm");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("MTALARM"));

    objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v8, CFSTR("dependentHomeKitObjects"));
    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "settings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithInt:", objc_msgSend(v32, "isControllable") ^ 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, CFSTR("isDisabled"));

  }
  else
  {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v25);

}

uint64_t __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alarmIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

uint64_t __50__HFHomePodAlarmItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alarmIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  -[HFHomePodAlarmItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsAdapterManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adapterForIdentifier:", CFSTR("MobileTimerAdapter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (-[HFHomePodAlarmItem alarm](self, "alarm"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(v7, "alarmsWithPendingEdits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomePodAlarmItem alarm](self, "alarm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if (v11)
      a3 = 2;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HFHomePodAlarmItem;
    a3 = -[HFItem _effectiveLoadingStateForSuggestedLoadingState:](&v13, sel__effectiveLoadingStateForSuggestedLoadingState_, a3);
  }

  return a3;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)alarmIdentifier
{
  return self->_alarmIdentifier;
}

- (void)setAlarmIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmIdentifier, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
