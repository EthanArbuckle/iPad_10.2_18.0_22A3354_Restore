@implementation BKSHIDUISensorMode

- (int)proximityDetectionMode
{
  return self->_proximityDetectionMode;
}

- (BOOL)pocketTouchesExpected
{
  return self->_pocketTouchesExpected;
}

- (BOOL)digitizerEnabled
{
  return self->_digitizerEnabled;
}

- (unint64_t)changeSource
{
  return self->_changeSource;
}

- (NSSet)multitouchHostStateKeys
{
  return self->_multitouchHostStateKeys;
}

- (int64_t)displayState
{
  return self->_displayState;
}

- (id)_initCopyFrom:(id)a3
{
  id *v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (id *)a3;
  v5 = -[BKSHIDUISensorMode _init](self, "_init");
  v6 = v5;
  if (v5)
  {
    do
      v7 = __ldaxr(&_BKSNextUIModeIdentifier_staticIdentifier);
    while (__stlxr(v7 + 1, &_BKSNextUIModeIdentifier_staticIdentifier));
    v5[1] = v7;
    v8 = objc_msgSend(v4[2], "copy");
    v9 = (void *)v6[2];
    v6[2] = v8;

    v6[3] = v4[3];
    v6[4] = v4[4];
    *((_DWORD *)v6 + 10) = *((_DWORD *)v4 + 10);
    v6[7] = v4[7];
    *((_BYTE *)v6 + 64) = *((_BYTE *)v4 + 64);
    *((_BYTE *)v6 + 65) = *((_BYTE *)v4 + 65);
    v10 = objc_msgSend(v4[6], "copy");
    v11 = (void *)v6[6];
    v6[6] = v10;

    *((_BYTE *)v6 + 66) = *((_BYTE *)v4 + 66);
    *((_BYTE *)v6 + 67) = *((_BYTE *)v4 + 67);
  }

  return v6;
}

- (id)_init
{
  BKSHIDUISensorMode *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BKSHIDUISensorMode *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)BKSHIDUISensorMode;
  v3 = -[BKSHIDUISensorMode init](&v12, sel_init);
  if (v3)
  {
    v4 = objc_opt_class();
    if (v4 != objc_opt_class())
    {
      v5 = objc_opt_class();
      if (v5 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSUISensorMode cannot be subclassed"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v14 = v9;
          v15 = 2114;
          v16 = v11;
          v17 = 2048;
          v18 = v3;
          v19 = 2114;
          v20 = CFSTR("BKSHIDUISensorMode.m");
          v21 = 1024;
          v22 = 121;
          v23 = 2114;
          v24 = v8;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A0FA530);
      }
    }
    do
      v6 = __ldaxr(&_BKSNextUIModeIdentifier_staticIdentifier);
    while (__stlxr(v6 + 1, &_BKSNextUIModeIdentifier_staticIdentifier));
    v3->_identifier = v6;
    v3->_versionedPID = BSGetVersionedPID();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitouchHostStateKeys, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (BKSHIDUISensorMode)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDUISensorMode *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDUISensorMode *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSHIDUISensorMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDUISensorMode.m");
    v17 = 1024;
    v18 = 94;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDUISensorMode *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKSHIDUISensorMode)initWithCoder:(id)a3
{
  id v4;
  BKSHIDUISensorMode *v5;
  uint64_t v6;
  NSString *reason;
  uint64_t v8;
  NSSet *multitouchHostStateKeys;
  BKSHIDUISensorMode *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BKSHIDUISensorMode;
  v5 = -[BKSHIDUISensorMode init](&v17, sel_init);
  v5->_identifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identifier"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
  v6 = objc_claimAutoreleasedReturnValue();
  reason = v5->_reason;
  v5->_reason = (NSString *)v6;

  v5->_versionedPID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("versionedPID"));
  v5->_changeSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeSource"));
  v5->_proximityDetectionMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proximityDetectionMode"));
  v5->_displayState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayState"));
  v5->_digitizerEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("digitizerEnabled"));
  v5->_pocketTouchesExpected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pocketTouchesExpected"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multitouchHostStateKeys"));
  v8 = objc_claimAutoreleasedReturnValue();
  multitouchHostStateKeys = v5->_multitouchHostStateKeys;
  v5->_multitouchHostStateKeys = (NSSet *)v8;

  if (-[BKSHIDUISensorMode _settingKeysAllowed:](v5, "_settingKeysAllowed:", v5->_multitouchHostStateKeys))
  {
    v5->_estimatedProximityMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("estimatedProximityMode"));
    v5->_postEventWithCurrentDetectionMask = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("postEventWithCurrentDetectionMask"));
    v10 = v5;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2FE0];
    v18 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("disallowed settings:%@"), v5->_multitouchHostStateKeys);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 22, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v15);

    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *reason;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_identifier, CFSTR("identifier"));
  reason = self->_reason;
  if (reason)
    objc_msgSend(v5, "encodeObject:forKey:", reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_versionedPID, CFSTR("versionedPID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeSource, CFSTR("changeSource"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_proximityDetectionMode, CFSTR("proximityDetectionMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayState, CFSTR("displayState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_digitizerEnabled, CFSTR("digitizerEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pocketTouchesExpected, CFSTR("pocketTouchesExpected"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_multitouchHostStateKeys, CFSTR("multitouchHostStateKeys"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_estimatedProximityMode, CFSTR("estimatedProximityMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_postEventWithCurrentDetectionMask, CFSTR("postEventWithCurrentDetectionMask"));

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSet *multitouchHostStateKeys;

  -[NSString hash](self->_reason, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_versionedPID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_changeSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_displayState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_proximityDetectionMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hash");

  multitouchHostStateKeys = self->_multitouchHostStateKeys;
  if (multitouchHostStateKeys)
    -[NSSet hash](multitouchHostStateKeys, "hash");
  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = v8
    && v8[1] == self->_identifier
    && BSEqualObjects()
    && -[BKSHIDUISensorMode isEqualExceptIdentifierAndReasons:](self, "isEqualExceptIdentifierAndReasons:", v8);

  return v9;
}

- (BOOL)isEqualExceptIdentifierAndReasons:(id)a3
{
  char *v4;
  char *v5;
  BOOL v6;

  v4 = (char *)a3;
  v5 = v4;
  v6 = *(_OWORD *)(v4 + 24) == *(_OWORD *)&self->_versionedPID
    && -[BKSHIDUISensorMode isEffectivelyEqualToMode:](self, "isEffectivelyEqualToMode:", v4);

  return v6;
}

- (BOOL)isEffectivelyEqualToMode:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = BSEqualObjects()
    && v4[10] == self->_proximityDetectionMode
    && *((unsigned __int8 *)v4 + 64) == self->_digitizerEnabled
    && *((_QWORD *)v4 + 7) == self->_displayState
    && *((unsigned __int8 *)v4 + 65) == self->_pocketTouchesExpected
    && *((unsigned __int8 *)v4 + 66) == self->_estimatedProximityMode
    && *((unsigned __int8 *)v4 + 67) == self->_postEventWithCurrentDetectionMask;

  return v5;
}

- (id)mutableCopy
{
  return -[BKSHIDUISensorMode _initCopyFrom:]([BKSMutableHIDUISensorMode alloc], "_initCopyFrom:", self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDUISensorMode *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__BKSHIDUISensorMode_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (id)initForProtobufDecoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDUISensorMode;
  return -[BKSHIDUISensorMode init](&v3, sel_init);
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[BKSHIDUISensorMode _settingKeysAllowed:](self, "_settingKeysAllowed:", self->_multitouchHostStateKeys))
    return self;
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2FE0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("disallowed settings:%@"), self->_multitouchHostStateKeys, *MEMORY[0x1E0CB2D68]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 22, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)tapToWakeEnabled
{
  return -[NSSet containsObject:](self->_multitouchHostStateKeys, "containsObject:", CFSTR("WakeOnTapEnabled"));
}

- (BOOL)coverGestureEnabled
{
  return -[NSSet containsObject:](self->_multitouchHostStateKeys, "containsObject:", CFSTR("CoverGestureEnabled"));
}

- (BOOL)wakeOnSwipeEnabled
{
  return -[NSSet containsObject:](self->_multitouchHostStateKeys, "containsObject:", CFSTR("WakeOnSwipeEnabled"));
}

- (BOOL)wakeOnLongPressEnabled
{
  return -[NSSet containsObject:](self->_multitouchHostStateKeys, "containsObject:", CFSTR("WakeOnLongPressEnabled"));
}

- (BOOL)wakeOnTapThroughEnabled
{
  return -[NSSet containsObject:](self->_multitouchHostStateKeys, "containsObject:", CFSTR("WakeOnTapThroughEnabled"));
}

- (BOOL)wakeOnSwipeThroughEnabled
{
  return -[NSSet containsObject:](self->_multitouchHostStateKeys, "containsObject:", CFSTR("WakeOnSwipeThroughEnabled"));
}

- (BOOL)wakeOnLongPressThroughEnabled
{
  return -[NSSet containsObject:](self->_multitouchHostStateKeys, "containsObject:", CFSTR("WakeOnLongPressThroughEnabled"));
}

- (BOOL)postEventWithCurrentDetectionMask
{
  return self->_postEventWithCurrentDetectionMask;
}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (BOOL)estimatedProximityMode
{
  return self->_estimatedProximityMode;
}

- (BOOL)isRestrictedToSystemShell
{
  unsigned int proximityDetectionMode;
  BOOL result;
  BOOL v5;
  int v6;
  BOOL v7;

  proximityDetectionMode = self->_proximityDetectionMode;
  result = 1;
  v5 = proximityDetectionMode > 0x14;
  v6 = (1 << proximityDetectionMode) & 0x100030;
  v7 = v5 || v6 == 0;
  if (v7 && !self->_pocketTouchesExpected)
    return -[BKSHIDUISensorMode _comparisonScore](self, "_comparisonScore") > 10;
  return result;
}

- (NSString)_identifierDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[M%d-%d]"), self->_versionedPID, self->_identifier);
}

- (BOOL)_settingKeysAllowed:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _settingKeysAllowed__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_settingKeysAllowed__onceToken, &__block_literal_global_91);
  v5 = objc_msgSend(v4, "intersectsSet:", _settingKeysAllowed__disallowedSettingKeys);

  return v5 ^ 1;
}

- (int64_t)_comparisonScore
{
  unsigned int v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = self->_proximityDetectionMode - 1;
  if (v3 > 0xC)
    v4 = 0;
  else
    v4 = qword_18A161340[v3];
  if (self->_estimatedProximityMode)
    v4 += 5000;
  v5 = v4 + self->_postEventWithCurrentDetectionMask;
  if (self->_digitizerEnabled)
  {
    if (-[NSSet count](self->_multitouchHostStateKeys, "count"))
    {
      v6 = (void *)-[NSSet mutableCopy](self->_multitouchHostStateKeys, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("CoverGestureEnabled"), CFSTR("WakeOnTapEnabled"), CFSTR("WakeOnSwipeEnabled"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minusSet:", v7);

      v5 += 100 * objc_msgSend(v6, "count");
    }
  }
  else
  {
    v5 += 100 * -[NSSet count](self->_multitouchHostStateKeys, "count") + 4000;
  }
  return v5;
}

- (int64_t)identifier
{
  return self->_identifier;
}

void __42__BKSHIDUISensorMode__settingKeysAllowed___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ScreenOn"), CFSTR("DigitizerSurfaceCovered"), CFSTR("PocketTouchesExpected"), CFSTR("FaceTouchesExpected"), 0);
  v1 = (void *)_settingKeysAllowed__disallowedSettingKeys;
  _settingKeysAllowed__disallowedSettingKeys = v0;

}

id __48__BKSHIDUISensorMode_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_identifierDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "_comparisonScore"), CFSTR("score"));
  v5 = *(void **)(a1 + 32);
  BSProcessDescriptionForPID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, 0);

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("reason"));
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(v7 + 32);
  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    NSStringFromBKSHIDUISensorChangeSource(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:withName:", v10, CFSTR("changeSource"));

    v7 = *(_QWORD *)(a1 + 40);
  }
  v11 = *(unsigned int *)(v7 + 40);
  if ((_DWORD)v11)
  {
    v12 = *(void **)(a1 + 32);
    NSStringFromBKSHIDServicesProximityDetectionMode(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:withName:", v13, CFSTR("proximityDetectionMode"));

    v7 = *(_QWORD *)(a1 + 40);
  }
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(v7 + 64), CFSTR("digitizerEnabled"));
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(v15 + 56);
  if (v16)
  {
    v17 = *(void **)(a1 + 32);
    NSStringFromBKSHIDUISensorDisplayState(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:withName:", v18, CFSTR("displayState"));

    v15 = *(_QWORD *)(a1 + 40);
  }
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(v15 + 65), CFSTR("pocketTouchesExpected"), 1);
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("multitouchHostStateKeys"), 1);
  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 66), CFSTR("estimatedProximityMode"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 67), CFSTR("postEventWithCurrentDetectionMask"), 1);
}

+ (BKSHIDUISensorMode)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDUISensorMode *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSHIDUISensorMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BKSHIDUISensorMode.m");
    v17 = 1024;
    v18 = 99;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDUISensorMode *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)buildModeForReason:(id)a3 builder:(id)a4
{
  void (**v5)(id, id);
  id v6;
  id v7;
  void *v8;

  v5 = (void (**)(id, id))a4;
  v6 = a3;
  v7 = -[BKSHIDUISensorMode _init]([BKSMutableHIDUISensorMode alloc], "_init");
  objc_msgSend(v7, "setReason:", v6);

  v5[2](v5, v7);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

+ (id)protobufSchema
{
  return (id)objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", a1, &__block_literal_global_9602);
}

+ (id)_prevailingMode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  int v16;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_70);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "proximityDetectionMode");
  if (objc_msgSend(v5, "digitizerEnabled") && !objc_msgSend(v5, "pocketTouchesExpected")
    || v6 == 20)
  {
    v27 = v4;
    v28 = v3;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v7 = 0;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (v14 != v5)
          {
            if (objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "digitizerEnabled")
              && objc_msgSend(v14, "pocketTouchesExpected"))
            {
              v15 = v14;

              v11 = (unint64_t)v15;
            }
            if (v6 == 20)
            {
              v16 = objc_msgSend(v14, "proximityDetectionMode");
              if (v16 && v16 != 20)
              {
                v18 = v14;

                v7 = (unint64_t)v18;
              }
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v7 = 0;
    }

    v3 = v28;
    if (v11 | v7)
    {
      v19 = (void *)objc_msgSend(v5, "mutableCopy");
      v20 = objc_msgSend(v19, "changeSource");
      if (!v20)
      {
        v20 = objc_msgSend((id)v11, "changeSource");
        if (!v20)
          v20 = objc_msgSend((id)v7, "changeSource");
      }
      objc_msgSend(v19, "setChangeSource:", v20);
      objc_msgSend(v5, "reason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

      if (v11)
      {
        objc_msgSend((id)v11, "_identifierDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appendFormat:", CFSTR(" + pocketTouches(%@)"), v23);

        objc_msgSend(v19, "setPocketTouchesExpected:", 1);
      }
      v4 = v27;
      if (v7)
      {
        objc_msgSend((id)v7, "_identifierDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appendFormat:", CFSTR(" + prox(%@)"), v24);

        objc_msgSend(v19, "setProximityDetectionMode:", objc_msgSend((id)v7, "proximityDetectionMode"));
      }
      objc_msgSend(v19, "setReason:", v22);
      v25 = objc_msgSend(v19, "copy");

      v5 = (void *)v25;
    }
    else
    {
      v4 = v27;
    }

  }
  else
  {
    v7 = 0;
  }

  return v5;
}

uint64_t __38__BKSHIDUISensorMode__prevailingMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "_comparisonScore");
  objc_msgSend(v4, "_comparisonScore");

  return BSCompareIntegers();
}

void __36__BKSHIDUISensorMode_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_reason");
  objc_msgSend(v2, "addField:", "_versionedPID");
  objc_msgSend(v2, "addField:", "_changeSource");
  objc_msgSend(v2, "addField:", "_proximityDetectionMode");
  objc_msgSend(v2, "addField:", "_displayState");
  objc_msgSend(v2, "addField:", "_digitizerEnabled");
  objc_msgSend(v2, "addField:", "_pocketTouchesExpected");
  objc_msgSend(v2, "addRepeatingField:containsClass:", "_multitouchHostStateKeys", objc_opt_class());
  objc_msgSend(v2, "addField:", "_estimatedProximityMode");
  objc_msgSend(v2, "addField:", "_postEventWithCurrentDetectionMask");

}

@end
