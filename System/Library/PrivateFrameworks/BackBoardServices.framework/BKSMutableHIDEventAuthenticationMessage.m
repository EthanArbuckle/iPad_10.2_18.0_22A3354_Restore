@implementation BKSMutableHIDEventAuthenticationMessage

- (void)setVersionedPID:(int64_t)a3
{
  self->super._versionedPID = a3;
}

- (void)setDestinationAuditToken:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BKSMutableHIDEventAuthenticationMessage *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (objc_class *)objc_msgSend(v14, "classForCoder");
      if (!v6)
        v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("destinationAuditToken"), v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v16 = v11;
        v17 = 2114;
        v18 = v13;
        v19 = 2048;
        v20 = self;
        v21 = 2114;
        v22 = CFSTR("BKSHIDEventAuthenticationMessage.m");
        v23 = 1024;
        v24 = 415;
        v25 = 2114;
        v26 = v10;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A13310CLL);
    }
  }

  self->super._versionedPID = objc_msgSend(v14, "versionedPID");
}

- (void)setContext:(unint64_t)a3
{
  self->super._context = a3;
}

- (void)setSecureNameStatus:(int64_t)a3
{
  self->super._secureNameStatus = a3;
}

- (void)setTargetSlotID:(unsigned int)a3
{
  self->super._targetSlotID = a3;
}

- (void)setTargetContextID:(unsigned int)a3
{
  self->super._targetContextID = a3;
}

- (void)setEventType:(unsigned int)a3
{
  self->super._eventType = a3;
}

- (void)setHitTestInformationFromStartEvent:(id)a3
{
  BKSHIDEventHitTestLayerInformation *v5;
  BKSHIDEventHitTestLayerInformation **p_hitTestInformationFromStartEvent;
  BKSHIDEventHitTestLayerInformation *hitTestInformationFromStartEvent;
  BKSHIDEventHitTestLayerInformation *v8;

  v5 = (BKSHIDEventHitTestLayerInformation *)a3;
  hitTestInformationFromStartEvent = self->super._hitTestInformationFromStartEvent;
  p_hitTestInformationFromStartEvent = &self->super._hitTestInformationFromStartEvent;
  if (hitTestInformationFromStartEvent != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_hitTestInformationFromStartEvent, a3);
    v5 = v8;
  }

}

- (void)setHitTestInformationFromEndEvent:(id)a3
{
  BKSHIDEventHitTestLayerInformation *v5;
  BKSHIDEventHitTestLayerInformation **p_hitTestInformationFromEndEvent;
  BKSHIDEventHitTestLayerInformation *hitTestInformationFromEndEvent;
  BKSHIDEventHitTestLayerInformation *v8;

  v5 = (BKSHIDEventHitTestLayerInformation *)a3;
  hitTestInformationFromEndEvent = self->super._hitTestInformationFromEndEvent;
  p_hitTestInformationFromEndEvent = &self->super._hitTestInformationFromEndEvent;
  if (hitTestInformationFromEndEvent != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_hitTestInformationFromEndEvent, a3);
    v5 = v8;
  }

}

- (void)setOriginIdentifier:(unint64_t)a3
{
  self->super._originIdentifier = a3;
}

- (void)setRegistrantEntitled:(BOOL)a3
{
  self->super._registrantEntitled = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = -[BKSHIDEventAuthenticationMessage _init](+[BKSHIDEventAuthenticationMessage allocWithZone:](BKSHIDEventAuthenticationMessage, "allocWithZone:", a3));
  v4[1] = self->super._versionedPID;
  *((_DWORD *)v4 + 4) = self->super._eventType;
  *((_DWORD *)v4 + 5) = self->super._targetSlotID;
  *((_DWORD *)v4 + 6) = self->super._targetContextID;
  v5 = -[BKSHIDEventHitTestLayerInformation copy](self->super._hitTestInformationFromStartEvent, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[BKSHIDEventHitTestLayerInformation copy](self->super._hitTestInformationFromEndEvent, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v4[6] = self->super._timestamp;
  v4[7] = self->super._originIdentifier;
  v4[8] = self->super._context;
  v4[9] = self->super._secureNameStatus;
  *((_BYTE *)v4 + 80) = self->super._registrantEntitled;
  v9 = -[NSData copy](self->super._signature, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

@end
