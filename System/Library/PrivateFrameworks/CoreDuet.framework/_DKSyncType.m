@implementation _DKSyncType

- (void)setXpcActivity:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (_BYTE)initWithIsSingleDevice:(_BYTE *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_DKSyncType;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[8] = a2;
  }
  return result;
}

- (void)mergeType:(uint64_t)a1
{
  unsigned __int8 *v3;
  int v4;
  unint64_t v5;
  BOOL v6;
  BOOL *v7;
  int v8;
  BOOL v9;
  int v10;
  _BYTE *v11;
  void *v12;
  id v13;
  void *v14;
  id *v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  _BYTE *v19;
  int v20;
  BOOL *v21;
  BOOL v22;
  _BYTE *v23;
  int v24;
  int v25;
  unsigned __int8 *v26;

  v3 = a2;
  if (!a1)
    goto LABEL_43;
  if (*(_BYTE *)(a1 + 9))
  {
    *(_BYTE *)(a1 + 9) = 1;
LABEL_6:
    *(_WORD *)(a1 + 10) = 0;
LABEL_7:
    *(_BYTE *)(a1 + 12) = 0;
    goto LABEL_8;
  }
  if (!v3)
  {
    v17 = (_BYTE *)(a1 + 10);
    v24 = *(unsigned __int8 *)(a1 + 10);
    *(_BYTE *)(a1 + 9) = 0;
    if (v24)
    {
LABEL_45:
      *v17 = 1;
LABEL_47:
      *(_WORD *)(a1 + 11) = 0;
      goto LABEL_8;
    }
    v19 = (_BYTE *)(a1 + 11);
    v25 = *(unsigned __int8 *)(a1 + 11);
    *(_BYTE *)(a1 + 10) = 0;
    if (v25)
    {
LABEL_49:
      *v19 = 1;
      goto LABEL_7;
    }
    *(_BYTE *)(a1 + 11) = 0;
    v23 = (_BYTE *)(a1 + 12);
    v21 = (BOOL *)(a1 + 12);
    goto LABEL_54;
  }
  v4 = v3[9];
  *(_BYTE *)(a1 + 9) = v4;
  if (v4)
    goto LABEL_6;
  v17 = (_BYTE *)(a1 + 10);
  if (*(_BYTE *)(a1 + 10))
    goto LABEL_45;
  v18 = v3[10];
  *v17 = v18;
  if (v18)
    goto LABEL_47;
  v19 = (_BYTE *)(a1 + 11);
  if (*(_BYTE *)(a1 + 11))
    goto LABEL_49;
  v20 = v3[11];
  *v19 = v20;
  if (v20)
    goto LABEL_7;
  v21 = (BOOL *)(a1 + 12);
  if (!*(_BYTE *)(a1 + 12))
  {
    v23 = v3 + 12;
LABEL_54:
    v22 = *v23 != 0;
    goto LABEL_55;
  }
  v22 = 1;
LABEL_55:
  *v21 = v22;
LABEL_8:
  if (v3)
  {
    if (v3[11])
      *(_QWORD *)(a1 + 32) = *((_QWORD *)v3 + 4);
    v5 = *((_QWORD *)v3 + 3);
    if (v5 > *(_QWORD *)(a1 + 24))
      *(_QWORD *)(a1 + 24) = v5;
  }
  if (!*(_BYTE *)(a1 + 12))
  {
    *(_DWORD *)(a1 + 13) = 0;
    goto LABEL_34;
  }
  if (*(_BYTE *)(a1 + 13))
  {
    *(_BYTE *)(a1 + 13) = 1;
    v6 = *(_BYTE *)(a1 + 14) != 0;
    if (!v3 || *(_BYTE *)(a1 + 14))
    {
LABEL_24:
      *(_BYTE *)(a1 + 14) = v6;
      if (*(_BYTE *)(a1 + 15))
        goto LABEL_25;
      if (v3)
        goto LABEL_29;
      goto LABEL_63;
    }
LABEL_23:
    v6 = v3[14] != 0;
    goto LABEL_24;
  }
  if (!v3)
  {
    *(_BYTE *)(a1 + 13) = 0;
    if (*(_BYTE *)(a1 + 15))
    {
      *(_BYTE *)(a1 + 15) = 1;
LABEL_64:
      v11 = (_BYTE *)(a1 + 16);
      v7 = (BOOL *)(a1 + 16);
      goto LABEL_32;
    }
LABEL_63:
    *(_BYTE *)(a1 + 15) = 0;
    goto LABEL_64;
  }
  *(_BYTE *)(a1 + 13) = v3[13];
  if (!*(_BYTE *)(a1 + 14))
    goto LABEL_23;
  *(_BYTE *)(a1 + 14) = 1;
  if (*(_BYTE *)(a1 + 15))
  {
LABEL_25:
    v7 = (BOOL *)(a1 + 16);
    v8 = *(unsigned __int8 *)(a1 + 16);
    *(_BYTE *)(a1 + 15) = 1;
    v9 = v8 != 0;
    if (!v3 || v8)
      goto LABEL_33;
    goto LABEL_31;
  }
LABEL_29:
  v7 = (BOOL *)(a1 + 16);
  v10 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 15) = v3[15];
  if (!v10)
  {
LABEL_31:
    v11 = v3 + 16;
LABEL_32:
    v9 = *v11 != 0;
    goto LABEL_33;
  }
  v9 = 1;
LABEL_33:
  *v7 = v9;
LABEL_34:
  v26 = v3;
  if (*(_BYTE *)(a1 + 8))
  {
    if (v3)
    {
      *(_BYTE *)(a1 + 8) = v3[8];
LABEL_38:
      v12 = (void *)*((_QWORD *)v3 + 5);
      goto LABEL_39;
    }
    v12 = 0;
    *(_BYTE *)(a1 + 8) = 0;
  }
  else
  {
    *(_BYTE *)(a1 + 8) = 0;
    if (v3)
      goto LABEL_38;
    v12 = 0;
  }
LABEL_39:
  v13 = v12;
  v14 = v13;
  v16 = *(_QWORD *)(a1 + 40);
  v15 = (id *)(a1 + 40);
  if (!v16 && v13)
    objc_storeStrong(v15, v12);

  v3 = v26;
LABEL_43:

}

- (BOOL)forceSync
{
  if (result)
    return *(_BYTE *)(result + 9) != 0;
  return result;
}

- (BOOL)isInitialSync
{
  if (result)
    return *(_BYTE *)(result + 10) != 0;
  return result;
}

- (BOOL)isPeriodicSync
{
  if (result)
    return *(_BYTE *)(result + 11) != 0;
  return result;
}

- (BOOL)isTriggeredSync
{
  if (result)
    return *(_BYTE *)(result + 12) != 0;
  return result;
}

- (double)periodicSyncInterval
{
  if (a1)
    return *(double *)(a1 + 32);
  else
    return 0.0;
}

- (uint64_t)urgency
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (BOOL)didActivatePeer
{
  if (result)
    return *(_BYTE *)(result + 13) != 0;
  return result;
}

- (BOOL)didReceivePush
{
  if (result)
    return *(_BYTE *)(result + 14) != 0;
  return result;
}

- (BOOL)didAddSyncedEvents
{
  if (result)
    return *(_BYTE *)(result + 15) != 0;
  return result;
}

- (BOOL)didDeleteSyncedEvents
{
  if (result)
    return *(_BYTE *)(result + 16) != 0;
  return result;
}

- (uint64_t)xpcActivity
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p:"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_forceSync)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" forceSync=%@,"), v7);
  if (self->_isInitialSync)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" isInitialSync=%@,"), v8);
  if (self->_isPeriodicSync)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" isPeriodicSync=%@,"), v9);
  if (self->_isTriggeredSync)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" isTriggeredSync=%@,"), v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_urgency);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" urgency=%@,"), v11);

  if (self->_didActivatePeer)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" didActivatePeer=%@,"), v12);
  if (self->_didReceivePush)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" didReceivePush=%@,"), v13);
  if (self->_didAddSyncedEvents)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" didAddSyncedEvents=%@,"), v14);
  if (self->_didDeleteSyncedEvents)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" didDeleteSyncedEvents=%@,"), v15);
  if (self->_isSingleDevice)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" isSingleDevice=%@,"), v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_periodicSyncInterval);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" periodicSyncInterval=%@,"), v17);

  objc_msgSend(v6, "appendFormat:", CFSTR(" xpcActivity=%@"), self->_xpcActivity);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v18 = (void *)objc_msgSend(v6, "copy");

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isSingleDevice;
  id v5;

  isSingleDevice = self->_isSingleDevice;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isSingleDevice, CFSTR("IsSingleDevice"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceSync, CFSTR("ForceSync"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isInitialSync, CFSTR("IsInitialSync"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPeriodicSync, CFSTR("IsPeriodicSync"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isTriggeredSync, CFSTR("IsTriggeredSync"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_urgency), CFSTR("Urgency"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didActivatePeer, CFSTR("DidActivatePeer"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didReceivePush, CFSTR("DidReceivePush"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didAddSyncedEvents, CFSTR("DidAddSyncedEvents"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didDeleteSyncedEvents, CFSTR("DidDeleteSyncedEvents"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("PeriodicSyncInterval"), self->_periodicSyncInterval);

}

- (_DKSyncType)initWithCoder:(id)a3
{
  id v4;
  char v5;
  _DKSyncType *v6;
  _DKSyncType *v7;
  _DKSyncType *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsSingleDevice"));
  v6 = [_DKSyncType alloc];
  if (v6
    && (v11.receiver = v6,
        v11.super_class = (Class)_DKSyncType,
        (v7 = -[_DKSyncType init](&v11, sel_init)) != 0))
  {
    v8 = v7;
    v7->_isSingleDevice = v5;
    v7->_forceSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ForceSync"));
    v8->_isInitialSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsInitialSync"));
    v8->_isPeriodicSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsPeriodicSync"));
    v8->_isTriggeredSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsTriggeredSync"));
    v8->_urgency = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("Urgency"));
    v8->_didActivatePeer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidActivatePeer"));
    v8->_didReceivePush = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidReceivePush"));
    v8->_didAddSyncedEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidAddSyncedEvents"));
    v8->_didDeleteSyncedEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidDeleteSyncedEvents"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PeriodicSyncInterval"));
    v8->_periodicSyncInterval = v9;
  }
  else
  {
    objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ForceSync"));
    objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsInitialSync"));
    objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsPeriodicSync"));
    objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsTriggeredSync"));
    objc_msgSend(v4, "decodeIntForKey:", CFSTR("Urgency"));
    objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidActivatePeer"));
    objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidReceivePush"));
    objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidAddSyncedEvents"));
    objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidDeleteSyncedEvents"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PeriodicSyncInterval"));
    v8 = 0;
  }

  return v8;
}

- (uint64_t)setForceSync:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 9) = a2;
  return result;
}

- (uint64_t)setIsInitialSync:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 10) = a2;
  return result;
}

- (uint64_t)setIsPeriodicSync:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 11) = a2;
  return result;
}

- (uint64_t)setIsTriggeredSync:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 12) = a2;
  return result;
}

- (uint64_t)setUrgency:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 24) = a2;
  return result;
}

- (uint64_t)setDidReceivePush:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 14) = a2;
  return result;
}

- (uint64_t)setDidDeleteSyncedEvents:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 16) = a2;
  return result;
}

- (uint64_t)setPeriodicSyncInterval:(uint64_t)result
{
  if (result)
    *(double *)(result + 32) = a2;
  return result;
}

- (BOOL)isEqualToSyncType:(uint64_t)a1
{
  _QWORD *v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = 0;
  if (a1 && v3)
    v4 = *(unsigned __int8 *)(a1 + 8) == *((unsigned __int8 *)v3 + 8)
      && *(unsigned __int8 *)(a1 + 9) == *((unsigned __int8 *)v3 + 9)
      && *(unsigned __int8 *)(a1 + 10) == *((unsigned __int8 *)v3 + 10)
      && *(unsigned __int8 *)(a1 + 11) == *((unsigned __int8 *)v3 + 11)
      && *(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v3 + 12)
      && *(_QWORD *)(a1 + 24) == v3[3]
      && *(unsigned __int8 *)(a1 + 13) == *((unsigned __int8 *)v3 + 13)
      && *(unsigned __int8 *)(a1 + 14) == *((unsigned __int8 *)v3 + 14)
      && *(unsigned __int8 *)(a1 + 15) == *((unsigned __int8 *)v3 + 15)
      && *(unsigned __int8 *)(a1 + 16) == *((unsigned __int8 *)v3 + 16)
      && *(double *)(a1 + 32) == *((double *)v3 + 4);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivity, 0);
}

@end
