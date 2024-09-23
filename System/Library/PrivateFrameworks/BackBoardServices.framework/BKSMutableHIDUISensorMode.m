@implementation BKSMutableHIDUISensorMode

- (BKSMutableHIDUISensorMode)initWithReason:(id)a3
{
  id v4;
  BKSMutableHIDUISensorMode *v5;
  BKSMutableHIDUISensorMode *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKSMutableHIDUISensorMode;
  v5 = -[BKSHIDUISensorMode _init](&v8, sel__init);
  v6 = v5;
  if (v5)
    -[BKSMutableHIDUISensorMode setReason:](v5, "setReason:", v4);

  return v6;
}

- (id)copy
{
  return -[BKSHIDUISensorMode _initCopyFrom:]([BKSHIDUISensorMode alloc], "_initCopyFrom:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDUISensorMode _initCopyFrom:]([BKSHIDUISensorMode alloc], "_initCopyFrom:", self);
}

- (void)setReason:(id)a3
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *reason;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  BKSMutableHIDUISensorMode *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  if (!v23)
  {
    NSStringFromClass(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v11;
      v26 = 2114;
      v27 = v13;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKSHIDUISensorMode.m");
      v32 = 1024;
      v33 = 612;
      v34 = 2114;
      v35 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A145558);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_msgSend(v23, "classForCoder");
    if (!v15)
      v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v20;
      v26 = 2114;
      v27 = v22;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKSHIDUISensorMode.m");
      v32 = 1024;
      v33 = 612;
      v34 = 2114;
      v35 = v19;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A145690);
  }

  v7 = (NSString *)objc_msgSend(v23, "copy");
  reason = self->super._reason;
  self->super._reason = v7;

}

- (void)setChangeSource:(unint64_t)a3
{
  self->super._changeSource = a3;
}

- (void)setProximityDetectionMode:(int)a3
{
  self->super._proximityDetectionMode = a3;
}

- (void)setDisplayState:(int64_t)a3
{
  self->super._displayState = a3;
}

- (void)setDigitizerEnabled:(BOOL)a3
{
  self->super._digitizerEnabled = a3;
}

- (void)setPocketTouchesExpected:(BOOL)a3
{
  self->super._pocketTouchesExpected = a3;
}

- (void)setMultitouchHostStateKeys:(id)a3
{
  NSSet *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  NSSet *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKSMutableHIDUISensorMode *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (NSSet *)a3;
  if (self->super._multitouchHostStateKeys != v6)
  {
    v11 = v6;
    if (!-[BKSHIDUISensorMode _settingKeysAllowed:](self, "_settingKeysAllowed:", v6))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[self _settingKeysAllowed:multitouchHostStateKeys]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v13 = v8;
        v14 = 2114;
        v15 = v10;
        v16 = 2048;
        v17 = self;
        v18 = 2114;
        v19 = CFSTR("BKSHIDUISensorMode.m");
        v20 = 1024;
        v21 = 645;
        v22 = 2114;
        v23 = v7;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A14584CLL);
    }
    objc_storeStrong((id *)&self->super._multitouchHostStateKeys, a3);
    v6 = v11;
  }

}

- (void)setTapToWakeEnabled:(BOOL)a3
{
  -[BKSMutableHIDUISensorMode _setSettingKey:enabled:](self, "_setSettingKey:enabled:", CFSTR("WakeOnTapEnabled"), a3);
}

- (void)setCoverGestureEnabled:(BOOL)a3
{
  -[BKSMutableHIDUISensorMode _setSettingKey:enabled:](self, "_setSettingKey:enabled:", CFSTR("CoverGestureEnabled"), a3);
}

- (void)setWakeOnSwipeEnabled:(BOOL)a3
{
  -[BKSMutableHIDUISensorMode _setSettingKey:enabled:](self, "_setSettingKey:enabled:", CFSTR("WakeOnSwipeEnabled"), a3);
}

- (void)setWakeOnLongPressEnabled:(BOOL)a3
{
  -[BKSMutableHIDUISensorMode _setSettingKey:enabled:](self, "_setSettingKey:enabled:", CFSTR("WakeOnLongPressEnabled"), a3);
}

- (void)setWakeOnTapThroughEnabled:(BOOL)a3
{
  -[BKSMutableHIDUISensorMode _setSettingKey:enabled:](self, "_setSettingKey:enabled:", CFSTR("WakeOnTapThroughEnabled"), a3);
}

- (void)setWakeOnSwipeThroughEnabled:(BOOL)a3
{
  -[BKSMutableHIDUISensorMode _setSettingKey:enabled:](self, "_setSettingKey:enabled:", CFSTR("WakeOnSwipeThroughEnabled"), a3);
}

- (void)setWakeOnLongTapThroughEnabled:(BOOL)a3
{
  -[BKSMutableHIDUISensorMode _setSettingKey:enabled:](self, "_setSettingKey:enabled:", CFSTR("WakeOnLongPressThroughEnabled"), a3);
}

- (void)setPostEventWithCurrentDetectionMask:(BOOL)a3
{
  self->super._postEventWithCurrentDetectionMask = a3;
}

- (void)setVersionedPID:(int64_t)a3
{
  self->super._versionedPID = a3;
}

- (void)setEstimatedProximityMode:(BOOL)a3
{
  self->super._estimatedProximityMode = a3;
}

- (void)_setSettingKey:(id)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSSet *multitouchHostStateKeys;
  _BOOL4 v8;
  NSUInteger v9;
  NSSet *v10;
  NSSet *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  multitouchHostStateKeys = self->super._multitouchHostStateKeys;
  if (v4)
  {
    v12 = v6;
    if (multitouchHostStateKeys)
      -[NSSet setByAddingObject:](multitouchHostStateKeys, "setByAddingObject:", v6);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (multitouchHostStateKeys)
  {
    v12 = v6;
    v8 = -[NSSet containsObject:](multitouchHostStateKeys, "containsObject:", v6);
    v6 = v12;
    if (v8)
    {
      v9 = -[NSSet count](self->super._multitouchHostStateKeys, "count");
      v10 = self->super._multitouchHostStateKeys;
      if (v9 == 1)
      {
        v11 = 0;
LABEL_11:
        self->super._multitouchHostStateKeys = v11;

        v6 = v12;
        goto LABEL_12;
      }
      v11 = (NSSet *)-[NSSet mutableCopy](v10, "mutableCopy");
      -[NSSet removeObject:](v11, "removeObject:", v12);
LABEL_10:
      v10 = self->super._multitouchHostStateKeys;
      goto LABEL_11;
    }
  }
LABEL_12:

}

@end
