@implementation CLLocationManagerStateTracker

- (void)setActivityType:(int64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t activityType;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      activityType = self->_state.activityType;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "activityType";
      v22 = 2050;
      v23 = activityType;
      v24 = 2050;
      v25 = a3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLActivityType}lld, \"new\":%{public, location:CLActivityType}lld}", (uint8_t *)v11, 0x4Eu);
    }
  }
  self->_state.activityType = a3;
}

- (void)setAllowsAlteredAccessoryLocations:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 allowsAlteredAccessoryLocations;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      allowsAlteredAccessoryLocations = self->_state.allowsAlteredAccessoryLocations;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "allowsAlteredAccessoryLocations";
      v22 = 1026;
      v23 = allowsAlteredAccessoryLocations;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.allowsAlteredAccessoryLocations = v3;
}

- (void)setRequestingLocation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 requestingLocation;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      requestingLocation = self->_state.requestingLocation;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "requestingLocation";
      v22 = 1026;
      v23 = requestingLocation;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.requestingLocation = v3;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  CLLocationManagerStateTracker *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  v3 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290562;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = "state_transition";
    v14 = 2082;
    v15 = "LocationManager";
    v16 = 2050;
    v17 = objc_msgSend_identifier(self, v4, v5, v6);
    v18 = 2082;
    v19 = "lifecycle";
    v20 = 2050;
    v21 = self;
    v22 = 2050;
    v23 = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  v7.receiver = self;
  v7.super_class = (Class)CLLocationManagerStateTracker;
  -[CLStateTracker dealloc](&v7, sel_dealloc);
}

- (double)headingFilter
{
  return self->_state.headingFilter;
}

- (void)setUpdatingHeading:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 updatingHeading;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      updatingHeading = self->_state.updatingHeading;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "updatingHeading";
      v22 = 1026;
      v23 = updatingHeading;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.updatingHeading = v3;
}

- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a4 <= 0x4F)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v9 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
    {
      v12 = 68289538;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2050;
      v17 = 80;
      v18 = 2050;
      v19 = a4;
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v12, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    }
    v10 = qword_1ECD8E740;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
    {
      v12 = 68289538;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2050;
      v17 = 80;
      v18 = 2050;
      v19 = a4;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "state dump failure", "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v12, 0x26u);
    }
  }
  else
  {
    *(_OWORD *)a3 = *(_OWORD *)&self->_state.distanceFilter;
    v6 = *(_OWORD *)&self->_state.batchingLocation;
    v8 = *(_OWORD *)&self->_state.updatingLocation;
    v7 = *(_OWORD *)&self->_state.allowsLocationPrompts;
    *((_OWORD *)a3 + 3) = *(_OWORD *)&self->_state.activityType;
    *((_OWORD *)a3 + 4) = v6;
    *((_OWORD *)a3 + 1) = v8;
    *((_OWORD *)a3 + 2) = v7;
  }
  return a4 > 0x4F;
}

+ (const)trackerStateTypeName
{
  return "_CLLocationManagerStateTrackerState";
}

+ (unint64_t)trackerStateSize
{
  return 80;
}

- (BOOL)updatingLocation
{
  return self->_state.updatingLocation;
}

- (BOOL)paused
{
  return self->_state.paused;
}

- (BOOL)courtesyPromptNeeded
{
  return self->_state.courtesyPromptNeeded;
}

- (double)desiredAccuracy
{
  return self->_state.desiredAccuracy;
}

- (BOOL)dynamicAccuracyReductionEnabled
{
  return self->_state.dynamicAccuracyReductionEnabled;
}

- (double)distanceFilter
{
  return self->_state.distanceFilter;
}

- (BOOL)allowsAlteredAccessoryLocations
{
  return self->_state.allowsAlteredAccessoryLocations;
}

- (void)setUpdatingLocation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 updatingLocation;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      updatingLocation = self->_state.updatingLocation;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "updatingLocation";
      v22 = 1026;
      v23 = updatingLocation;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.updatingLocation = v3;
}

- (BOOL)allowsMapCorrection
{
  return self->_state.allowsMapCorrection;
}

- (BOOL)requestingLocation
{
  return self->_state.requestingLocation;
}

- (void)setPreviousAuthorizationStatusValid:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 previousAuthorizationStatusValid;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      previousAuthorizationStatusValid = self->_state.previousAuthorizationStatusValid;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "previousAuthorizationStatusValid";
      v22 = 1026;
      v23 = previousAuthorizationStatusValid;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.previousAuthorizationStatusValid = v3;
}

- (void)setPreviousAuthorizationStatus:(int)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t previousAuthorizationStatus;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      previousAuthorizationStatus = self->_state.previousAuthorizationStatus;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "previousAuthorizationStatus";
      v22 = 2050;
      v23 = previousAuthorizationStatus;
      v24 = 2050;
      v25 = a3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLClientAuthorizationStatus}lld, \"new\":%{public, location:CLClientAuthorizationStatus}lld}", (uint8_t *)v11, 0x4Eu);
    }
  }
  self->_state.previousAuthorizationStatus = a3;
}

- (void)setLimitsPrecision:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 limitsPrecision;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      limitsPrecision = self->_state.limitsPrecision;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "limitsPrecision";
      v22 = 1026;
      v23 = limitsPrecision;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.limitsPrecision = v3;
}

- (void)setIsAuthorizedForWidgetUpdates:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 isAuthorizedForWidgetUpdates;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      isAuthorizedForWidgetUpdates = self->_state.isAuthorizedForWidgetUpdates;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "isAuthorizedForWidgetUpdates";
      v22 = 1026;
      v23 = isAuthorizedForWidgetUpdates;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.isAuthorizedForWidgetUpdates = v3;
}

- (CLLocationManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5
{
  CLLocationManagerStateTracker *v7;
  CLLocationManagerStateTracker *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v20;
  NSObject *v21;
  objc_super v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  _BYTE v36[18];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CLLocationManagerStateTracker;
  v7 = -[CLStateTracker initWithQueue:](&v22, sel_initWithQueue_, a3);
  v8 = v7;
  if (!v7)
    return v8;
  v7->_identifier = a4;
  if (!a5)
    goto LABEL_7;
  if (v7->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v20 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "!_inTransaction";
      _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    }
    v21 = qword_1ECD8E740;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "!_inTransaction";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Already in a transaction. LocationManager threading bug?", "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    }
    v8 = (CLLocationManagerStateTracker *)qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2082;
      v28 = "assert";
      v29 = 2081;
      v30 = "!_inTransaction";
      _os_log_impl(&dword_18F5B3000, &v8->super.super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  else
  {
    v7->_inTransaction = 1;
    (*((void (**)(id, CLLocationManagerStateTracker *))a5 + 2))(a5, v7);
    v8->_inTransaction = 0;
    if (qword_1ECD8E748 == -1)
      goto LABEL_5;
  }
  dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
LABEL_5:
  v9 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend_identifier(v8, v10, v11, v12);
    *(_DWORD *)buf = 68290562;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2082;
    v28 = "state_transition";
    v29 = 2082;
    v30 = "LocationManager";
    v31 = 2050;
    v32 = v13;
    v33 = 2082;
    v34 = "init";
    v35 = 1040;
    *(_DWORD *)v36 = 80;
    *(_WORD *)&v36[4] = 2098;
    *(_QWORD *)&v36[6] = &v8->_state;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"new\":%{public, location:_CLLocationManagerStateTrackerState}.*P}", buf, 0x4Au);
LABEL_7:
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
  }
  v14 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend_identifier(v8, v15, v16, v17);
    *(_DWORD *)buf = 68290562;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2082;
    v28 = "state_transition";
    v29 = 2082;
    v30 = "LocationManager";
    v31 = 2050;
    v32 = v18;
    v33 = 2082;
    v34 = "lifecycle";
    v35 = 2050;
    *(_QWORD *)v36 = 0;
    *(_WORD *)&v36[8] = 2050;
    *(_QWORD *)&v36[10] = v8;
    _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  return v8;
}

- (void)identifier
{
  return self->_identifier;
}

- (void)setDesiredAccuracy:(double)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double desiredAccuracy;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      desiredAccuracy = self->_state.desiredAccuracy;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "desiredAccuracy";
      v22 = 2050;
      v23 = desiredAccuracy;
      v24 = 2050;
      v25 = a3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}f\", \"new\":\"%{public}f\"}", (uint8_t *)v11, 0x4Eu);
    }
  }
  self->_state.desiredAccuracy = a3;
}

- (void)setDistanceFilter:(double)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double distanceFilter;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      distanceFilter = self->_state.distanceFilter;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "distanceFilter";
      v22 = 2050;
      v23 = distanceFilter;
      v24 = 2050;
      v25 = a3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}f\", \"new\":\"%{public}f\"}", (uint8_t *)v11, 0x4Eu);
    }
  }
  self->_state.distanceFilter = a3;
}

- (void)setHeadingFilter:(double)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double headingFilter;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      headingFilter = self->_state.headingFilter;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "headingFilter";
      v22 = 2050;
      v23 = headingFilter;
      v24 = 2050;
      v25 = a3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}f\", \"new\":\"%{public}f\"}", (uint8_t *)v11, 0x4Eu);
    }
  }
  self->_state.headingFilter = a3;
}

- (void)setCourtesyPromptNeeded:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 courtesyPromptNeeded;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      courtesyPromptNeeded = self->_state.courtesyPromptNeeded;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "courtesyPromptNeeded";
      v22 = 1026;
      v23 = courtesyPromptNeeded;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.courtesyPromptNeeded = v3;
}

- (void)setAllowsMapCorrection:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 allowsMapCorrection;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      allowsMapCorrection = self->_state.allowsMapCorrection;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "allowsMapCorrection";
      v22 = 1026;
      v23 = allowsMapCorrection;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.allowsMapCorrection = v3;
}

- (void)setAllowsLocationPrompts:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 allowsLocationPrompts;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      allowsLocationPrompts = self->_state.allowsLocationPrompts;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "allowsLocationPrompts";
      v22 = 1026;
      v23 = allowsLocationPrompts;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.allowsLocationPrompts = v3;
}

- (BOOL)previousAuthorizationStatusValid
{
  return self->_state.previousAuthorizationStatusValid;
}

- (int)previousAuthorizationStatus
{
  return self->_state.previousAuthorizationStatus;
}

- (BOOL)isAuthorizedForWidgetUpdates
{
  return self->_state.isAuthorizedForWidgetUpdates;
}

- (void)setPausesLocationUpdatesAutomatically:(int)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t pausesLocationUpdatesAutomatically;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      pausesLocationUpdatesAutomatically = self->_state.pausesLocationUpdatesAutomatically;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "pausesLocationUpdatesAutomatically";
      v22 = 2050;
      v23 = pausesLocationUpdatesAutomatically;
      v24 = 2050;
      v25 = a3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLAutoPause}lld, \"new\":%{public, location:CLAutoPause}lld}", (uint8_t *)v11, 0x4Eu);
    }
  }
  self->_state.pausesLocationUpdatesAutomatically = a3;
}

- (int)pausesLocationUpdatesAutomatically
{
  return self->_state.pausesLocationUpdatesAutomatically;
}

- (BOOL)limitsPrecision
{
  return self->_state.limitsPrecision;
}

- (BOOL)updatingHeading
{
  return self->_state.updatingHeading;
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_initInSilo_withIdentifier_state_, a3, a4);
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  objc_msgSend_assertInside(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v12 = objc_msgSend_queue(a3, v9, v10, v11);
  return (id)objc_msgSend_initWithQueue_identifier_state_(self, v13, v12, (uint64_t)a4, a5);
}

- (CLLocationManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4
{
  return (CLLocationManagerStateTracker *)objc_msgSend_initWithQueue_identifier_state_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (BOOL)allowsLocationPrompts
{
  return self->_state.allowsLocationPrompts;
}

- (void)setDynamicAccuracyReductionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 dynamicAccuracyReductionEnabled;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      dynamicAccuracyReductionEnabled = self->_state.dynamicAccuracyReductionEnabled;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "dynamicAccuracyReductionEnabled";
      v22 = 1026;
      v23 = dynamicAccuracyReductionEnabled;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.dynamicAccuracyReductionEnabled = v3;
}

- (int64_t)activityType
{
  return self->_state.activityType;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 paused;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      paused = self->_state.paused;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "paused";
      v22 = 1026;
      v23 = paused;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.paused = v3;
}

- (BOOL)allowsBackgroundLocationUpdates
{
  return self->_state.allowsBackgroundLocationUpdates;
}

- (void)setAllowsBackgroundLocationUpdates:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 allowsBackgroundLocationUpdates;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      allowsBackgroundLocationUpdates = self->_state.allowsBackgroundLocationUpdates;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "allowsBackgroundLocationUpdates";
      v22 = 1026;
      v23 = allowsBackgroundLocationUpdates;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.allowsBackgroundLocationUpdates = v3;
}

- (BOOL)showsBackgroundLocationIndicator
{
  return self->_state.showsBackgroundLocationIndicator;
}

- (void)setShowsBackgroundLocationIndicator:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 showsBackgroundLocationIndicator;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      showsBackgroundLocationIndicator = self->_state.showsBackgroundLocationIndicator;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "showsBackgroundLocationIndicator";
      v22 = 1026;
      v23 = showsBackgroundLocationIndicator;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.showsBackgroundLocationIndicator = v3;
}

- (BOOL)batchingLocation
{
  return self->_state.batchingLocation;
}

- (void)setBatchingLocation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 batchingLocation;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      batchingLocation = self->_state.batchingLocation;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "batchingLocation";
      v22 = 1026;
      v23 = batchingLocation;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.batchingLocation = v3;
}

- (BOOL)updatingVehicleSpeed
{
  return self->_state.updatingVehicleSpeed;
}

- (void)setUpdatingVehicleSpeed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 updatingVehicleSpeed;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      updatingVehicleSpeed = self->_state.updatingVehicleSpeed;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "updatingVehicleSpeed";
      v22 = 1026;
      v23 = updatingVehicleSpeed;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.updatingVehicleSpeed = v3;
}

- (BOOL)updatingVehicleHeading
{
  return self->_state.updatingVehicleHeading;
}

- (void)setUpdatingVehicleHeading:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 updatingVehicleHeading;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      updatingVehicleHeading = self->_state.updatingVehicleHeading;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "updatingVehicleHeading";
      v22 = 1026;
      v23 = updatingVehicleHeading;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.updatingVehicleHeading = v3;
}

- (BOOL)matchInfoEnabled
{
  return self->_state.matchInfoEnabled;
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 matchInfoEnabled;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      matchInfoEnabled = self->_state.matchInfoEnabled;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "matchInfoEnabled";
      v22 = 1026;
      v23 = matchInfoEnabled;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.matchInfoEnabled = v3;
}

- (BOOL)groundAltitudeEnabled
{
  return self->_state.groundAltitudeEnabled;
}

- (void)setGroundAltitudeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 groundAltitudeEnabled;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      groundAltitudeEnabled = self->_state.groundAltitudeEnabled;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "groundAltitudeEnabled";
      v22 = 1026;
      v23 = groundAltitudeEnabled;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.groundAltitudeEnabled = v3;
}

- (BOOL)fusionInfoEnabled
{
  return self->_state.fusionInfoEnabled;
}

- (void)setFusionInfoEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 fusionInfoEnabled;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      fusionInfoEnabled = self->_state.fusionInfoEnabled;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "fusionInfoEnabled";
      v22 = 1026;
      v23 = fusionInfoEnabled;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.fusionInfoEnabled = v3;
}

- (BOOL)trackRunInfoEnabled
{
  return self->_state.trackRunInfoEnabled;
}

- (void)setTrackRunInfoEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 trackRunInfoEnabled;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v5 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend_identifier(self, v6, v7, v8);
      trackRunInfoEnabled = self->_state.trackRunInfoEnabled;
      v11[0] = 68290562;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "state_transition";
      v16 = 2082;
      v17 = "LocationManager";
      v18 = 2050;
      v19 = v9;
      v20 = 2082;
      v21 = "trackRunInfoEnabled";
      v22 = 1026;
      v23 = trackRunInfoEnabled;
      v24 = 1026;
      v25 = v3;
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v11, 0x46u);
    }
  }
  self->_state.trackRunInfoEnabled = v3;
}

- (void)updateState:(id)a3
{
  _CLLocationManagerStateTrackerState *p_state;
  __int128 v4;
  __int128 v5;
  CLLocationManagerStateTracker *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _OWORD v14[5];
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _OWORD *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _CLLocationManagerStateTrackerState *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  p_state = &self->_state;
  v4 = *(_OWORD *)&self->_state.activityType;
  v14[2] = *(_OWORD *)&self->_state.allowsLocationPrompts;
  v14[3] = v4;
  v14[4] = *(_OWORD *)&self->_state.batchingLocation;
  v5 = *(_OWORD *)&self->_state.updatingLocation;
  v14[0] = *(_OWORD *)&self->_state.distanceFilter;
  v14[1] = v5;
  if (self->_inTransaction)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    v12 = qword_1ECD8E740;
    p_state = (_CLLocationManagerStateTrackerState *)"assert";
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "!_inTransaction";
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    }
    v13 = qword_1ECD8E740;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E740))
    {
      *(_DWORD *)buf = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "!_inTransaction";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Already in a transaction. LocationManager threading bug?", "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
    }
    v6 = (CLLocationManagerStateTracker *)qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2082;
      v20 = "assert";
      v21 = 2081;
      v22 = "!_inTransaction";
      _os_log_impl(&dword_18F5B3000, &v6->super.super, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Already in a transaction. LocationManager threading bug?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  else
  {
    v6 = self;
    self->_inTransaction = 1;
    (*((void (**)(id, CLLocationManagerStateTracker *))a3 + 2))(a3, self);
    v6->_inTransaction = 0;
    if (qword_1ECD8E748 == -1)
      goto LABEL_3;
  }
  dispatch_once(&qword_1ECD8E748, &unk_1E2991348);
LABEL_3:
  v7 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend_identifier(v6, v8, v9, v10);
    *(_DWORD *)buf = 68291074;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "state_transition";
    v21 = 2082;
    v22 = "LocationManager";
    v23 = 2050;
    v24 = v11;
    v25 = 2082;
    v26 = "allStates";
    v27 = 1040;
    v28 = 80;
    v29 = 2098;
    v30 = v14;
    v31 = 1040;
    v32 = 80;
    v33 = 2098;
    v34 = p_state;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:_CLLocationManagerStateTrackerState}.*P, \"new\":%{public, location:_CLLocationManagerStateTrackerState}.*P}", buf, 0x5Au);
  }
}

@end
