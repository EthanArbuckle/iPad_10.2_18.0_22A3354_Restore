@implementation CLSActivity

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D407CDF4;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB5F0 != -1)
    dispatch_once(&qword_1ED0FB5F0, block);
  return (id)qword_1ED0FB5E8;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSActivity;
  return -[CLSObject _init](&v3, sel__init);
}

- (id)_initWithTargetClass:(Class)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSActivity;
  v4 = -[CLSObject _init](&v8, sel__init);
  if (v4)
  {
    NSStringFromClass(a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[16];
    v4[16] = v5;

  }
  return v4;
}

- (CLSActivity)initWithCoder:(id)a3
{
  id v4;
  CLSActivity *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *primaryActivityItemIdentifier;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *parentEntityName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSActivity;
  v5 = -[CLSObject initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("primaryActivityItemIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryActivityItemIdentifier = v5->_primaryActivityItemIdentifier;
    v5->_primaryActivityItemIdentifier = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("parentEntityName"));
    v12 = objc_claimAutoreleasedReturnValue();
    parentEntityName = v5->_parentEntityName;
    v5->_parentEntityName = (NSString *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSActivity;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_primaryActivityItemIdentifier, CFSTR("primaryActivityItemIdentifier"), v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_parentEntityName, CFSTR("parentEntityName"));

}

- (int64_t)type
{
  uint64_t v2;
  void *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  char isEqualToString;
  const char *v9;
  uint64_t v10;
  void *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  objc_msgSend_parentEntityName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v7, (uint64_t)v6);

  if ((isEqualToString & 1) != 0)
    return 2;
  objc_msgSend_parentEntityName(self, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v12, v15, (uint64_t)v14))
  {

  }
  else
  {
    objc_msgSend_parentEntityName(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      return 0;
  }
  return 1;
}

- (void)setProgress:(double)progress
{
  ((void (*)(CLSActivity *, char *))MEMORY[0x1E0DE7D20])(self, sel_addProgressRangeFromStart_toEnd_);
}

- (void)addProgressRangeFromStart:(double)start toEnd:(double)end
{
  uint64_t v4;
  CLSRange *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  id started;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isStarted(self, a2, v4) & 1) != 0)
  {
    v9 = [CLSRange alloc];
    started = (id)objc_msgSend_initWithStart_end_(v9, v10, v11, start, end);
    objc_msgSend_addChild_changedPropertyName_(self, v12, (uint64_t)started, CFSTR("progress"));

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = objc_opt_class();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v13, v16, 3, self, CFSTR("Activity must be started before calling: - [%@ %@];"),
      v14,
      v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v18 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_error_impl(&dword_1D4054000, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
}

- (double)progress
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dataStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_opt_class();
    objc_msgSend_childrenOfClass_(self, v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v7, v8, v9))
    {
      objc_msgSend_compressOverlappingRanges_(CLSRange, v10, (uint64_t)v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v22, v26, 16);
      if (v13)
      {
        v16 = v13;
        v17 = *(_QWORD *)v23;
        v18 = 0.0;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v11);
            objc_msgSend_delta(*(void **)(*((_QWORD *)&v22 + 1) + 8 * i), v14, v15);
            v18 = v18 + v20;
          }
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v22, v26, 16);
        }
        while (v16);
      }
      else
      {
        v18 = 0.0;
      }

    }
    else
    {
      v18 = 0.0;
    }

  }
  else
  {
    v18 = 0.0;
  }

  return v18;
}

- (NSTimeInterval)duration
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  double v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dataStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v4, v5, v6);
  v7 = objc_opt_class();
  objc_msgSend_childrenOfClass_(self, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v10, v11);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v9;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v34, 16);
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v31;
    v19 = 0.0;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v12);
        objc_msgSend_length(*(void **)(*((_QWORD *)&v30 + 1) + 8 * i), v15, v16, (_QWORD)v30);
        v19 = v19 + v21;
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v30, v34, 16);
    }
    while (v17);
  }
  else
  {
    v19 = 0.0;
  }

  objc_msgSend_unlock(v4, v22, v23);
  if (objc_msgSend_isStarted(self, v24, v25))
  {
    objc_msgSend_runningDelta(self, v26, v27);
    v19 = v19 + v28;
  }
  objc_msgSend_unlock(self, v26, v27, (_QWORD)v30);

  return v19;
}

- (double)runningDelta
{
  NSDate *activityStartDate;
  void *v3;
  NSDate *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  double v9;
  double v10;

  activityStartDate = self->_activityStartDate;
  if (!activityStartDate)
    return 0.0;
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = activityStartDate;
  objc_msgSend_date(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceDate_(v7, v8, (uint64_t)v4);
  v10 = v9;

  return v10;
}

- (BOOL)isStarted
{
  uint64_t v2;
  CLSActivity *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v3 = self;
  objc_msgSend_dataStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_runningActivities(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend_containsObject_(v7, v8, (uint64_t)v3);

  return (char)v3;
}

- (void)start
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSDate *v25;
  NSDate *activityStartDate;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  int v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dataStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_lock(v4, v5, v6);
    if (objc_msgSend_isStarted(self, v8, v9))
    {
      objc_msgSend_unlock(v7, v10, v11);
    }
    else
    {
      objc_msgSend_parent(self, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend_parent(self, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_parentObjectID(v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }
      if (objc_msgSend_effectiveAuthorizationStatus(self, v14, v15) != 2)
        objc_msgSend_triggerProgressTransparencyMessageForAttachmentID_(v7, v20, (uint64_t)v19);
      objc_msgSend_addRunningActivitiesObject_(v7, v20, (uint64_t)self);
      objc_msgSend_lock(self, v21, v22);
      objc_msgSend_date(MEMORY[0x1E0C99D68], v23, v24);
      v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
      activityStartDate = self->_activityStartDate;
      self->_activityStartDate = v25;

      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v27 = (void *)CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        v30 = v27;
        objc_msgSend_objectID(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138412290;
        v37 = v33;
        _os_log_impl(&dword_1D4054000, v30, OS_LOG_TYPE_INFO, "Started CLSActivity '%@'", (uint8_t *)&v36, 0xCu);

      }
      objc_msgSend_unlock(self, v28, v29);
      objc_msgSend_unlock(v7, v34, v35);

    }
  }

}

- (void)stop
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSDate *activityStartDate;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dataStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_lock(v4, v5, v6);
    if ((objc_msgSend_isStarted(self, v8, v9) & 1) != 0)
    {
      objc_msgSend_lock(self, v10, v11);
      if (!self->_paused)
        objc_msgSend__generateTimeInterval(self, v12, v13);
      objc_msgSend_removeRunningActivitiesObject_(v7, v12, (uint64_t)self);
      self->_paused = 0;
      activityStartDate = self->_activityStartDate;
      self->_activityStartDate = 0;

      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v15 = (void *)CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        v18 = v15;
        objc_msgSend_objectID(self, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v21;
        _os_log_impl(&dword_1D4054000, v18, OS_LOG_TYPE_INFO, "Stopped CLSActivity '%@'", (uint8_t *)&v22, 0xCu);

      }
      objc_msgSend_unlock(self, v16, v17);
    }
    objc_msgSend_unlock(v7, v10, v11);
  }

}

- (void)pause
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSDate *activityStartDate;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  CLSActivity *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, v2);
  if (self->_paused)
  {
    objc_msgSend_unlock(self, v4, v5);
  }
  else
  {
    objc_msgSend__generateTimeInterval(self, v4, v5);
    activityStartDate = self->_activityStartDate;
    self->_activityStartDate = 0;

    self->_paused = 1;
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_INFO, "Paused CLSActivity '%p'", (uint8_t *)&v10, 0xCu);
    }
    objc_msgSend_unlock(self, v8, v9);
  }
}

- (void)resume
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSDate *v6;
  NSDate *activityStartDate;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  CLSActivity *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, v2);
  if (self->_paused)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v4, v5);
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    activityStartDate = self->_activityStartDate;
    self->_activityStartDate = v6;

    self->_paused = 0;
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_INFO, "Resumed CLSActivity '%p'", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend_unlock(self, v9, v10);
  }
  else
  {
    objc_msgSend_unlock(self, v4, v5);
  }
}

- (void)_generatePartialTimeOnSave
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  CLSActivity *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, v2);
  if (objc_msgSend_isStarted(self, v4, v5) && !self->_paused)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__generateTimeInterval(self, v9, v10);
    objc_storeStrong((id *)&self->_activityStartDate, v8);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v11 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      v14 = 134217984;
      v15 = self;
      _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_INFO, "CLSActivity partial time intervals generated for datastore save '%p'", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend_unlock(self, v12, v13);

  }
  else
  {
    objc_msgSend_unlock(self, v6, v7);
  }
}

- (int64_t)effectiveAuthorizationStatus
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSActivity;
  if ((id)-[CLSObject effectiveAuthorizationStatus](&v3, sel_effectiveAuthorizationStatus) == (id)1)
    return 1;
  else
    return 2;
}

- (void)_generateTimeInterval
{
  CLSTimeInterval *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  id v21;

  v3 = [CLSTimeInterval alloc];
  v21 = (id)objc_msgSend__init(v3, v4, v5);
  objc_msgSend_objectID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParentObjectID_(v21, v9, (uint64_t)v8);

  objc_msgSend_setModified_(v21, v10, 1);
  if (objc_msgSend_isStarted(self, v11, v12))
  {
    objc_msgSend_setStartTime_(v21, v13, (uint64_t)self->_activityStartDate);
    objc_msgSend_runningDelta(self, v14, v15);
    objc_msgSend_setLength_(v21, v16, v17);
    objc_msgSend_willChangeValueForKey_(self, v18, (uint64_t)CFSTR("duration"));
    objc_msgSend__addChild_lock_(self, v19, (uint64_t)v21, 0);
    objc_msgSend_didChangeValueForKey_(self, v20, (uint64_t)CFSTR("duration"));
  }

}

- (NSString)primaryActivityItemIdentifier
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_primaryActivityItemIdentifier;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setPrimaryActivityItemIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *primaryActivityItemIdentifier;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  primaryActivityItemIdentifier = self->_primaryActivityItemIdentifier;
  v12 = (id)v8;
  if (v8 | (unint64_t)primaryActivityItemIdentifier
    && (!v8
     || !primaryActivityItemIdentifier
     || (objc_msgSend_isEqualToString_(primaryActivityItemIdentifier, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_primaryActivityItemIdentifier, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (CLSActivityItem)primaryActivityItem
{
  uint64_t v2;
  const char *v4;
  void *v5;
  void *v6;

  objc_msgSend_primaryActivityItemIdentifier(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_activityItemWithIdentifier_(self, v4, (uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (CLSActivityItem *)v6;
}

- (void)setPrimaryActivityItem:(CLSActivityItem *)primaryActivityItem
{
  CLSActivityItem *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = primaryActivityItem;
  if ((objc_msgSend_validatePrimaryActivityItemType_(self, v6, (uint64_t)v5) & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = objc_opt_class();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    objc_msgSend_primaryActivityItem(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_class();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v14, v22, 3, self, CFSTR("- [%@ %@]: Cannot set activity item subclass of %@, when the current primaryActivityItem class is %@. The primaryActivityItem must always be set with the same subclass type."), v15, v16, v17, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v24 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 138412290;
    v31 = v23;
    v25 = "Error occurred in '-setPrimaryActivityItem:'. Error: %@";
    goto LABEL_14;
  }
  if ((objc_msgSend_isStarted(self, v7, v8) & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = objc_opt_class();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v26, v29, 3, self, CFSTR("Activity must be started before calling: - [%@ %@];"),
      v27,
      v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v24 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 138412290;
    v31 = v23;
    v25 = "%@";
LABEL_14:
    _os_log_error_impl(&dword_1D4054000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend_identifier(v5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrimaryActivityItemIdentifier_(self, v12, (uint64_t)v11);

  objc_msgSend_addChild_changedPropertyName_(self, v13, (uint64_t)v5, CFSTR("primaryActivityItem"));
LABEL_12:

}

- (BOOL)validatePrimaryActivityItemType:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  const char *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;

  v4 = a3;
  objc_msgSend_primaryActivityItem(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend_primaryActivityItem(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12 == 0;

  }
  return v11;
}

- (void)addAdditionalActivityItem:(CLSActivityItem *)activityItem
{
  CLSActivityItem *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = activityItem;
  if ((objc_msgSend_isStarted(self, v6, v7) & 1) != 0)
  {
    objc_msgSend_addChild_changedPropertyName_(self, v8, (uint64_t)v5, CFSTR("additionalActivityItems"));
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v9, v12, 3, self, CFSTR("Activity must be started before calling: - [%@ %@];"),
      v10,
      v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v14 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_1D4054000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
}

- (BOOL)_isObjectPrimaryItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = a3;
  objc_msgSend_primaryActivityItemIdentifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend__isObjectActivityItem_withIdentifier_(self, v8, (uint64_t)v4, v7);

  return (char)self;
}

- (BOOL)_isObjectActivityItem:(id)a3 withIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  char isEqualToString;
  BOOL v21;

  v5 = a3;
  v6 = (uint64_t)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v7 = v5;
  objc_msgSend_identifier(v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v6 | v10)
  {
    v13 = (void *)v10;
    objc_msgSend_identifier(v7, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    if (!v6 || !v14)
    {

LABEL_10:
      v21 = 0;
      goto LABEL_11;
    }
    objc_msgSend_identifier(v7, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v18, v19, v6);

    if ((isEqualToString & 1) == 0)
      goto LABEL_10;
  }
  else
  {

  }
  v21 = 1;
LABEL_11:

  return v21;
}

- (id)activityItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, const char *, _BYTE *);
  void *v15;
  CLSActivity *v16;
  id v17;

  v4 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = sub_1D40BB240;
  v15 = &unk_1E974BD68;
  v16 = self;
  v17 = v4;
  v5 = v4;
  objc_msgSend_childrenPassingTest_(self, v6, (uint64_t)&v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v7, v8, v9, v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)additionalActivityItems
{
  void *v2;
  const char *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D40BB2F4;
  v6[3] = &unk_1E974A910;
  v6[4] = self;
  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v2, v3, (uint64_t)&unk_1E9749BF0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLSActivity;
  -[CLSObject dictionaryRepresentation](&v24, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryActivityItemIdentifier(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_primaryActivityItemIdentifier(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("primaryActivityItemIdentifier"));

  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_progress(self, v7, v8);
  objc_msgSend_numberWithDouble_(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, CFSTR("progress"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_duration(self, v17, v18);
  objc_msgSend_numberWithDouble_(v16, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, CFSTR("duration"));

  return v3;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CLSActivity;
  -[CLSObject description](&v26, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_progress(self, v7, v8);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (progress: %.2f)"), v10);
  objc_msgSend_duration(self, v11, v12);
  objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR(" (duration: %.2f)"), v14);
  objc_msgSend_primaryActivityItemIdentifier(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_UTF8String(v17, v18, v19);
  objc_msgSend_appendFormat_(v6, v21, (uint64_t)CFSTR(" (primary-item-id: %.512s)"), v20);
  v24 = (void *)objc_msgSend_copy(v6, v22, v23);

  return (NSString *)v24;
}

- (void)removeAllActivityItems
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)&unk_1E974BDA8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v20, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend__isObjectPrimaryItem_(self, v6, v10))
        {
          objc_msgSend_primaryActivityItem(self, v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeChild_changedPropertyName_(self, v14, (uint64_t)v13, CFSTR("primaryActivityItem"));

        }
        else
        {
          objc_msgSend_removeChild_changedPropertyName_(self, v11, v10, CFSTR("additionalActivityItems"));
        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v20, v26, 16);
    }
    while (v7);
  }
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v15 = (void *)CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    v19 = objc_msgSend_count(v3, v17, v18);
    *(_DWORD *)buf = 134217984;
    v25 = v19;
    _os_log_impl(&dword_1D4054000, v16, OS_LOG_TYPE_INFO, "removeAllActivityItems removed %lu activityItems", buf, 0xCu);

  }
}

- (NSString)parentEntityName
{
  return self->_parentEntityName;
}

- (void)setParentEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isBackgroudTimeTrackingEnabled
{
  return self->_backgroundTimeTrackingEnabled;
}

- (void)setBackgroundTimeTrackingEnabled:(BOOL)a3
{
  self->_backgroundTimeTrackingEnabled = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentEntityName, 0);
  objc_storeStrong((id *)&self->_primaryActivityItemIdentifier, 0);
  objc_storeStrong((id *)&self->_activityStartDate, 0);
}

@end
