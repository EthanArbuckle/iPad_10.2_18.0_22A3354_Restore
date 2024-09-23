@implementation CKCheckSupportedDeviceCapabilitiesOperation

- (CKCheckSupportedDeviceCapabilitiesOperation)init
{
  CKCheckSupportedDeviceCapabilitiesOperation *v2;
  uint64_t v3;
  NSMutableDictionary *recordZoneErrors;
  uint64_t v5;
  NSMutableDictionary *resultsByRecordZoneID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  v2 = -[CKOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordZoneErrors = v2->_recordZoneErrors;
    v2->_recordZoneErrors = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    resultsByRecordZoneID = v2->_resultsByRecordZoneID;
    v2->_resultsByRecordZoneID = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (CKCheckSupportedDeviceCapabilitiesOperation)initWithDesiredCapabilities:(id)a3 zoneIDs:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKCheckSupportedDeviceCapabilitiesOperation *v17;
  uint64_t v18;
  NSArray *zoneIDs;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSArray *desiredCapabilitySets;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CKDeviceCapabilityCheckOptions *options;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = (CKCheckSupportedDeviceCapabilitiesOperation *)objc_msgSend_init(self, v11, v12, v13);
  if (v17)
  {
    v18 = objc_msgSend_copy(v9, v14, v15, v16);
    zoneIDs = v17->_zoneIDs;
    v17->_zoneIDs = (NSArray *)v18;

    v23 = (void *)objc_msgSend_copy(v8, v20, v21, v22);
    v33[0] = v23;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v33, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    desiredCapabilitySets = v17->_desiredCapabilitySets;
    v17->_desiredCapabilitySets = (NSArray *)v25;

    v30 = objc_msgSend_copy(v10, v27, v28, v29);
    options = v17->_options;
    v17->_options = (CKDeviceCapabilityCheckOptions *)v30;

  }
  return v17;
}

- (CKCheckSupportedDeviceCapabilitiesOperation)initWithDesiredCapabilitySets:(id)a3 zoneIDs:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKCheckSupportedDeviceCapabilitiesOperation *v17;
  uint64_t v18;
  NSArray *zoneIDs;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *desiredCapabilitySets;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CKDeviceCapabilityCheckOptions *options;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = (CKCheckSupportedDeviceCapabilitiesOperation *)objc_msgSend_init(self, v11, v12, v13);
  if (v17)
  {
    v18 = objc_msgSend_copy(v9, v14, v15, v16);
    zoneIDs = v17->_zoneIDs;
    v17->_zoneIDs = (NSArray *)v18;

    v23 = objc_msgSend_copy(v8, v20, v21, v22);
    desiredCapabilitySets = v17->_desiredCapabilitySets;
    v17->_desiredCapabilitySets = (NSArray *)v23;

    v28 = objc_msgSend_copy(v10, v25, v26, v27);
    options = v17->_options;
    v17->_options = (CKDeviceCapabilityCheckOptions *)v28;

  }
  return v17;
}

- (void)setPerResultBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perResultBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7EF5C8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perResultBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perResultBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perResultBlock = self->_perResultBlock;
    self->_perResultBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perResultBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A7EF770;
    v16 = sub_18A7EF798;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7EF7A0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perResultBlock);
  }
  return v8;
}

- (void)setCheckSupportedDeviceCapabilitiesCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id checkSupportedDeviceCapabilitiesCompletionBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7EF8FC;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    checkSupportedDeviceCapabilitiesCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_checkSupportedDeviceCapabilitiesCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    checkSupportedDeviceCapabilitiesCompletionBlock = self->_checkSupportedDeviceCapabilitiesCompletionBlock;
    self->_checkSupportedDeviceCapabilitiesCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)checkSupportedDeviceCapabilitiesCompletionBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A7EF770;
    v16 = sub_18A7EF798;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7EFAA4;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_checkSupportedDeviceCapabilitiesCompletionBlock);
  }
  return v8;
}

- (void)setCheckSupportedDeviceCapabilitiesCompletionBlock:(id)a3
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = a3 == 0;
  v9 = a3;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setCheckSupportedDeviceCapabilitiesCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

}

- (void)fillOutOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  objc_msgSend_zoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneIDs_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_desiredCapabilitySets(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredCapabilitySets_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_options(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptions_(v4, v21, (uint64_t)v20, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v23, sel_fillOutOperationInfo_, v4);

}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *zoneIDs;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *desiredCapabilitySets;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKDeviceCapabilityCheckOptions *v18;
  CKDeviceCapabilityCheckOptions *options;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v20, sel_fillFromOperationInfo_, v4);
  objc_msgSend_zoneIDs(v4, v5, v6, v7, v20.receiver, v20.super_class);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  zoneIDs = self->_zoneIDs;
  self->_zoneIDs = v8;

  objc_msgSend_desiredCapabilitySets(v4, v10, v11, v12);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  desiredCapabilitySets = self->_desiredCapabilitySets;
  self->_desiredCapabilitySets = v13;

  objc_msgSend_options(v4, v15, v16, v17);
  v18 = (CKDeviceCapabilityCheckOptions *)objc_claimAutoreleasedReturnValue();

  options = self->_options;
  self->_options = v18;

}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perResultBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_checkSupportedDeviceCapabilitiesCompletionBlock(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 != 0;

  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  objc_class *v20;
  void *v21;
  const char *v22;
  objc_class *v23;
  void *v24;
  const char *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_zoneIDs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend_zoneIDs(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a3)
            {
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v25, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected zoneID passed to %@: %@"), v24, v16);
              *a3 = (id)objc_claimAutoreleasedReturnValue();

            }
LABEL_16:

            return 0;
          }
          if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v17, v16, (uint64_t)a3))
            goto LABEL_16;
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v18, (uint64_t)&v27, (uint64_t)v31, 16);
        if (v13)
          continue;
        break;
      }
    }

    v26.receiver = self;
    v26.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
    return -[CKDatabaseOperation CKOperationShouldRun:](&v26, sel_CKOperationShouldRun_, a3);
  }
  else
  {
    if (a3)
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v22, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("property zoneIDs must not be nil for %@"), v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

+ (SEL)daemonInvocationSelector
{
  return sel_performCheckSupportedDeviceCapabilitiesOperation_withBlock_;
}

- (void)performCKOperation
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    objc_msgSend_operationID(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneIDs(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_desiredCapabilitySets(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v16;
    _os_log_debug_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_DEBUG, "Checking supported device capabilities in zones with operation %{public}@ zoneIDs=%@ capabilitySets=%@", buf, 0x20u);

  }
  v17.receiver = self;
  v17.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  -[CKOperation performCKOperation](&v17, sel_performCKOperation);
}

- (void)handleSupportedDeviceCapabilityCheckResultForRecordZoneID:(id)a3 capabilitySet:(id)a4 result:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CKSignpost *signpost;
  CKSignpost *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CKSignpost *v22;
  CKSignpost *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  CKSignpost *v28;
  CKSignpost *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  uint32_t v37;
  CKSignpost *v38;
  CKSignpost *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  CKSignpost *v43;
  CKSignpost *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  NSMutableDictionary *resultsByRecordZoneID;
  NSMutableDictionary *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void (**v69)(void *, id, id, id, void *);
  void *v70;
  void *v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  _BYTE v77[24];
  id v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend_CKClientSuitableError(a6, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v18 = signpost;

  if (v16)
  {
    if (!v18)
    {
      if ((objc_msgSend_canDropItemResultsEarly(self, v19, v20, v21) & 1) != 0)
        goto LABEL_37;
LABEL_25:
      if (self)
        objc_msgSend_setObject_forKeyedSubscript_(self->_recordZoneErrors, v52, (uint64_t)v16, (uint64_t)v10, *(_OWORD *)v77, *(_QWORD *)&v77[16], v78);
      else
        objc_msgSend_setObject_forKeyedSubscript_(0, v52, (uint64_t)v16, (uint64_t)v10, *(_OWORD *)v77, *(_QWORD *)&v77[16], v78);
      goto LABEL_37;
    }
    if (self)
      v22 = self->super.super._signpost;
    else
      v22 = 0;
    v23 = v22;
    objc_msgSend_log(v23, v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    if (self)
      v28 = self->super.super._signpost;
    else
      v28 = 0;
    v29 = v28;
    v33 = objc_msgSend_identifier(v29, v30, v31, v32);

    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)v77 = 138412802;
      *(_QWORD *)&v77[4] = v10;
      *(_WORD *)&v77[12] = 2112;
      *(_QWORD *)&v77[14] = v11;
      *(_WORD *)&v77[22] = 2112;
      v78 = v16;
      v34 = "Record zone %@ supported device capabilities check failed for capability set %@ with error: %@";
      v35 = v27;
      v36 = v33;
      v37 = 32;
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v35, OS_SIGNPOST_EVENT, v36, "CKCheckSupportedDeviceCapabilitiesOperation", v34, v77, v37);
    }
  }
  else
  {
    if (!v18)
    {
      if ((objc_msgSend_canDropItemResultsEarly(self, v19, v20, v21) & 1) != 0)
        goto LABEL_37;
      goto LABEL_28;
    }
    if (self)
      v38 = self->super.super._signpost;
    else
      v38 = 0;
    v39 = v38;
    objc_msgSend_log(v39, v40, v41, v42);
    v27 = objc_claimAutoreleasedReturnValue();

    if (self)
      v43 = self->super.super._signpost;
    else
      v43 = 0;
    v44 = v43;
    v48 = objc_msgSend_identifier(v44, v45, v46, v47);

    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)v77 = 138412546;
      *(_QWORD *)&v77[4] = v10;
      *(_WORD *)&v77[12] = 2112;
      *(_QWORD *)&v77[14] = v11;
      v34 = "Record zone %@ supported device capabilities %@ checked";
      v35 = v27;
      v36 = v48;
      v37 = 22;
      goto LABEL_20;
    }
  }

  if ((objc_msgSend_canDropItemResultsEarly(self, v49, v50, v51) & 1) != 0)
    goto LABEL_37;
  if (v16)
    goto LABEL_25;
LABEL_28:
  if (self)
    objc_msgSend_objectForKeyedSubscript_(self->_resultsByRecordZoneID, v52, (uint64_t)v10, v54, *(_QWORD *)v77, *(_OWORD *)&v77[8], v78);
  else
    objc_msgSend_objectForKeyedSubscript_(0, v52, (uint64_t)v10, v54, *(_QWORD *)v77, *(_OWORD *)&v77[8], v78);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v55)
  {
    v57 = (void *)objc_opt_new();
    if (self)
      objc_msgSend_setObject_forKeyedSubscript_(self->_resultsByRecordZoneID, v56, (uint64_t)v57, (uint64_t)v10);
    else
      objc_msgSend_setObject_forKeyedSubscript_(0, v56, (uint64_t)v57, (uint64_t)v10);

  }
  if (self)
    resultsByRecordZoneID = self->_resultsByRecordZoneID;
  else
    resultsByRecordZoneID = 0;
  v59 = resultsByRecordZoneID;
  objc_msgSend_objectForKeyedSubscript_(v59, v60, (uint64_t)v10, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v62, v63, (uint64_t)v12, (uint64_t)v11);

LABEL_37:
  objc_msgSend_perResultBlock_wrapper(self, v52, v53, v54, *(_QWORD *)v77, *(_OWORD *)&v77[8]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v64;
  if (v64)
  {
    v69 = (void (**)(void *, id, id, id, void *))_Block_copy(v64);
  }
  else
  {
    objc_msgSend_perResultBlock(self, v65, v66, v67);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void (**)(void *, id, id, id, void *))_Block_copy(v70);

  }
  if (v69)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v71 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v72 = v71;
      objc_msgSend_operationID(self, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v77 = 138544130;
      *(_QWORD *)&v77[4] = v76;
      *(_WORD *)&v77[12] = 2112;
      *(_QWORD *)&v77[14] = v11;
      *(_WORD *)&v77[22] = 2112;
      v78 = v10;
      v79 = 2112;
      v80 = v16;
      _os_log_debug_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about supported device capabilities %@ in zone with ID %@: %@", v77, 0x2Au);

    }
    v69[2](v69, v10, v11, v12, v16);
  }

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKSignpost *v10;
  CKSignpost *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  CKSignpost *v16;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  os_signpost_id_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSMutableDictionary *resultsByRecordZoneID;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  __CFString *v54;
  const __CFString *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  __CFString *v60;
  const __CFString *v61;
  objc_super v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v10 = self->super.super._signpost;
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend_log(v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->super.super._signpost;
    else
      v16 = 0;
    v17 = v16;
    v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKCheckSupportedDeviceCapabilitiesOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    if (self)
      v22 = objc_msgSend_count(self->_recordZoneErrors, v7, v8, v9);
    else
      v22 = objc_msgSend_count(0, v7, v8, v9);
    if (v22)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      if (self)
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)self->_recordZoneErrors, (uint64_t)CFSTR("CKPartialErrors"));
      else
        objc_msgSend_setObject_forKeyedSubscript_(v23, v24, 0, (uint64_t)CFSTR("CKPartialErrors"));
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v25, CFSTR("Couldn't check supported device capabilities in some record zones"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_checkSupportedDeviceCapabilitiesCompletionBlock(self, v7, v8, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v28 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v29, v30, v31);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = &stru_1E1F66ED0;
      if (v4)
        v55 = CFSTR(" Error was: ");
      else
        v55 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v50, v51, v52);
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v64 = v53;
      v65 = 2112;
      v66 = v55;
      v67 = 2112;
      v68 = v54;
      _os_log_debug_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_DEBUG, "Operation %{public}@ has completed.%@%@", buf, 0x20u);
      if (v4)

    }
    objc_msgSend_checkSupportedDeviceCapabilitiesCompletionBlock(self, v32, v33, v34);
    v38 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v39 = 0;
    }
    else
    {
      if (self)
        resultsByRecordZoneID = self->_resultsByRecordZoneID;
      else
        resultsByRecordZoneID = 0;
      v39 = resultsByRecordZoneID;
    }
    objc_msgSend_CKClientSuitableError(v4, v35, v36, v37);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSMutableDictionary *, void *))v38)[2](v38, v39, v47);

    if (!v4)
    objc_msgSend_setCheckSupportedDeviceCapabilitiesCompletionBlock_(self, v48, 0, v49);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v40 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(self, v41, v42, v43);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = &stru_1E1F66ED0;
      if (v4)
        v61 = CFSTR(" Error was: ");
      else
        v61 = &stru_1E1F66ED0;
      if (v4)
      {
        objc_msgSend_CKClientSuitableError(v4, v56, v57, v58);
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543874;
      v64 = v59;
      v65 = 2114;
      v66 = v61;
      v67 = 2112;
      v68 = v60;
      _os_log_debug_impl(&dword_18A5C5000, v40, OS_LOG_TYPE_DEBUG, "Operation %{public}@ finished but no checkSupportedDeviceCapabilitiesCompletionBlock was set.%{public}@%@", buf, 0x20u);
      if (v4)

    }
  }
  objc_msgSend_setPerResultBlock_(self, v44, 0, v45);
  v62.receiver = self;
  v62.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v62, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)ckSignpostBegin
{
  CKSignpost *signpost;
  CKSignpost *v4;
  CKSignpost *v5;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  CKSignpost *v11;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v4 = signpost;

  if (v4)
  {
    if (self)
      v5 = self->super.super._signpost;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend_log(v6, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = self->super.super._signpost;
    else
      v11 = 0;
    v12 = v11;
    v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      objc_msgSend_operationID(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_group(self, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupName(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfo(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      CKStringForDiscretionaryNetworkBehavior(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      CKStringForQOS(v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 138413570;
      v55 = v20;
      v56 = 2112;
      v57 = v24;
      v58 = 2112;
      v59 = v32;
      v60 = 2114;
      v61 = v36;
      v62 = 2114;
      v63 = v45;
      v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKCheckSupportedDeviceCapabilitiesOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  CKSignpost *v7;
  CKSignpost *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CKSignpost *v13;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_signpost_id_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v7 = self->super.super._signpost;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend_log(v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (self)
      v13 = self->super.super._signpost;
    else
      v13 = 0;
    v14 = v13;
    v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v19 = 138412290;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKCheckSupportedDeviceCapabilitiesOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/check-supported-capabilities", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  objc_super v22;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v10, v6, v11, v7, v8, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v13, (uint64_t)v12, (uint64_t)sel_handleSupportedDeviceCapabilityCheckResultForRecordZoneID_capabilitySet_result_error_, 1, 0);

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend_setWithObjects_(v14, v16, v15, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v19, (uint64_t)v18, (uint64_t)sel_handleSupportedDeviceCapabilityCheckResultForRecordZoneID_capabilitySet_result_error_, 2, 0);

  CKErrorUserInfoClasses();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v5, v21, (uint64_t)v20, (uint64_t)sel_handleSupportedDeviceCapabilityCheckResultForRecordZoneID_capabilitySet_result_error_, 3, 0);

  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___CKCheckSupportedDeviceCapabilitiesOperation;
  objc_msgSendSuper2(&v22, sel_applyDaemonCallbackInterfaceTweaks_, v5);

}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (NSArray)desiredCapabilitySets
{
  return self->_desiredCapabilitySets;
}

- (CKDeviceCapabilityCheckOptions)options
{
  return self->_options;
}

- (id)perResultBlock_wrapper
{
  return self->_perResultBlock_wrapper;
}

- (void)setPerResultBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (id)checkSupportedDeviceCapabilitiesCompletionBlock_wrapper
{
  return self->_checkSupportedDeviceCapabilitiesCompletionBlock_wrapper;
}

- (void)setCheckSupportedDeviceCapabilitiesCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_checkSupportedDeviceCapabilitiesCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perResultBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_resultsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneErrors, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_desiredCapabilitySets, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong(&self->_checkSupportedDeviceCapabilitiesCompletionBlock, 0);
  objc_storeStrong(&self->_perResultBlock, 0);
}

@end
