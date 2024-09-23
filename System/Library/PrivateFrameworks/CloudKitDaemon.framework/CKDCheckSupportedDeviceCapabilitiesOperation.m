@implementation CKDCheckSupportedDeviceCapabilitiesOperation

- (CKDCheckSupportedDeviceCapabilitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDCheckSupportedDeviceCapabilitiesOperation *v9;
  uint64_t v10;
  NSArray *zoneIDs;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *desiredCapabilitySets;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKDeviceCapabilityCheckOptions *options;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDCheckSupportedDeviceCapabilitiesOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v21, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_zoneIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    zoneIDs = v9->_zoneIDs;
    v9->_zoneIDs = (NSArray *)v10;

    objc_msgSend_desiredCapabilitySets(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    desiredCapabilitySets = v9->_desiredCapabilitySets;
    v9->_desiredCapabilitySets = (NSArray *)v14;

    objc_msgSend_options(v6, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    options = v9->_options;
    v9->_options = (CKDeviceCapabilityCheckOptions *)v18;

  }
  return v9;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    objc_msgSend_error(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend_checkSupportedCapabilitiesWithServer(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
  {
    v5 = CFSTR("Checking Supported Device Capabilities");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDCheckSupportedDeviceCapabilitiesOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/check-device-capabilities", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)checkSupportedCapabilitiesWithServer
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  CKDCheckSupportedDeviceCapabilitiesURLRequest *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id from;
  _BYTE location[12];
  __int16 v43;
  CKDCheckSupportedDeviceCapabilitiesOperation *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v28 = v3;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543874;
    *(_QWORD *)&location[4] = v30;
    v43 = 2048;
    v44 = self;
    v45 = 2114;
    v46 = v33;
    _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "Check supported device capabilities operation <%{public}@: %p; %{public}@> is starting",
      location,
      0x20u);

  }
  objc_msgSend_stateTransitionGroup(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v6);

  v7 = [CKDCheckSupportedDeviceCapabilitiesURLRequest alloc];
  objc_msgSend_zoneIDs(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_desiredCapabilitySets(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithOperation_zoneIDs_desiredCapabilitySets_options_(v7, v17, (uint64_t)self, v10, v13, v16);

  objc_initWeak((id *)location, self);
  objc_initWeak(&from, v18);
  v19 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1BEBD3D70;
  v39[3] = &unk_1E7836A88;
  objc_copyWeak(&v40, (id *)location);
  objc_msgSend_setSupportedDeviceCapabilitiesCheckedForZoneBlock_(v18, v20, (uint64_t)v39);
  v37[0] = v19;
  v37[1] = 3221225472;
  v37[2] = sub_1BEBD3E04;
  v37[3] = &unk_1E7833C78;
  objc_copyWeak(&v38, (id *)location);
  objc_msgSend_setErrorCheckingSupportedDeviceCapabilitiesBlock_(v18, v21, (uint64_t)v37);
  v34[0] = v19;
  v34[1] = 3221225472;
  v34[2] = sub_1BEBD4030;
  v34[3] = &unk_1E782E468;
  objc_copyWeak(&v35, (id *)location);
  objc_copyWeak(&v36, &from);
  objc_msgSend_setCompletionBlock_(v18, v22, (uint64_t)v34);
  objc_msgSend_setRequest_(self, v23, (uint64_t)v18);
  objc_msgSend_container(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v26, v27, (uint64_t)v18);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);

}

- (void)_handleSupportedDeviceCapabilitiesCheckedForZoneID:(id)a3 capabilitySet:(id)a4 result:(id)a5 responseCode:(id)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_checkSupportedDeviceCapabilitiesProgressBlock(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_checkSupportedDeviceCapabilitiesProgressBlock(self, v14, v15);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, _QWORD))v16)[2](v16, v17, v9, v10, 0);

  }
}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (id)checkSupportedDeviceCapabilitiesProgressBlock
{
  return self->_checkSupportedDeviceCapabilitiesProgressBlock;
}

- (void)setCheckSupportedDeviceCapabilitiesProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDs, a3);
}

- (NSArray)desiredCapabilitySets
{
  return self->_desiredCapabilitySets;
}

- (void)setDesiredCapabilitySets:(id)a3
{
  objc_storeStrong((id *)&self->_desiredCapabilitySets, a3);
}

- (CKDeviceCapabilityCheckOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_desiredCapabilitySets, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong(&self->_checkSupportedDeviceCapabilitiesProgressBlock, 0);
}

@end
