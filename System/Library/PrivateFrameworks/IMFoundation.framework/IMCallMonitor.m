@implementation IMCallMonitor

+ (id)sharedInstance
{
  if (qword_1ECD91038 != -1)
    dispatch_once(&qword_1ECD91038, &unk_1E2C42EC8);
  return (id)qword_1ECD90FE8;
}

- (IMCallMonitor)init
{
  IMCallMonitor *v2;
  IMCallMonitor *v3;
  NSDate *lastCallDate;
  CXCallObserver *callCenter;
  objc_class *v6;
  CXCallObserver *v7;
  CXCallObserver *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IMCallMonitor;
  v2 = -[IMCallMonitor init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    lastCallDate = v2->_lastCallDate;
    v2->_lastCallDate = 0;

    v3->_wasOnCall = 0;
    callCenter = v3->_callCenter;
    v3->_callCenter = 0;

    v6 = (objc_class *)IMWeakLinkClass(CFSTR("CXCallObserver"), CFSTR("CallKit"));
    if (v6)
    {
      v7 = (CXCallObserver *)objc_alloc_init(v6);
      v8 = v3->_callCenter;
      v3->_callCenter = v7;

      objc_msgSend_setDelegate_queue_(v3->_callCenter, v9, (uint64_t)v3, MEMORY[0x1E0C80D38]);
      v3->_wasOnCall = objc_msgSend_isOnCall(v3, v10, v11, v12);
    }
  }
  return v3;
}

- (BOOL)isOnCall
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend_calls(self->_callCenter, a2, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v4);
        if (!objc_msgSend_hasEnded(*(void **)(*((_QWORD *)&v13 + 1) + 8 * i), v6, v7, v8))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)isOnTelephonyCall
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char isEqualToString;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend_calls(self->_callCenter, a2, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend_hasEnded(v12, v6, v7, v8) & 1) == 0)
        {
          objc_msgSend_providerIdentifier(v12, v6, v7, v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)CFSTR("com.apple.coretelephony"), v15);

          if ((isEqualToString & 1) != 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v18, (uint64_t)v22, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  return v9;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  NSDate *v21;
  NSDate *lastCallDate;
  void *v23;
  const char *v24;
  id v25;

  v25 = a4;
  if (_IMWillLog(CFSTR("CallMonitor")))
    _IMAlwaysLog(0, CFSTR("CallMonitor"), CFSTR("Handling telephony event: call=%@"), v7, v8, v9, v10, v11, (char)v25);
  v12 = objc_msgSend_isOnCall(self, v5, v6, v7);
  if (_IMWillLog(CFSTR("CallMonitor")))
  {
    if (self->_wasOnCall)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    _IMAlwaysLog(0, CFSTR("CallMonitor"), CFSTR("    was on call: %@   is on call: %@"), v15, v16, v17, v18, v19, (char)v20);
  }
  if (self->_wasOnCall != v12)
  {
    self->_wasOnCall = v12;
    if ((v12 & 1) == 0)
    {
      v21 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
      lastCallDate = self->_lastCallDate;
      self->_lastCallDate = v21;

    }
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v13, v14, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v23, v24, (uint64_t)CFSTR("__kIMCallMonitorCallStatusChanged"), 0, 0);

  }
}

- (NSDate)dateLastCallEnded
{
  return self->_lastCallDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCallDate, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end
