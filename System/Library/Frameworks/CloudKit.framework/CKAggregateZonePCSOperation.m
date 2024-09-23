@implementation CKAggregateZonePCSOperation

- (CKAggregateZonePCSOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAggregateZonePCSOperation;
  return -[CKOperation init](&v3, sel_init);
}

- (CKAggregateZonePCSOperation)initWithSourceZoneIDs:(id)a3 targetZone:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKAggregateZonePCSOperation *v14;
  uint64_t v15;
  NSArray *sourceZoneIDs;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CKRecordZone *targetZone;

  v6 = a3;
  v7 = a4;
  v14 = (CKAggregateZonePCSOperation *)objc_msgSend_init(self, v8, v9, v10);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    sourceZoneIDs = v14->_sourceZoneIDs;
    v14->_sourceZoneIDs = (NSArray *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    targetZone = v14->_targetZone;
    v14->_targetZone = (CKRecordZone *)v20;

  }
  return v14;
}

- (void)setAggregateZonePCSCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id aggregateZonePCSCompletionBlock;
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
    block[2] = sub_18A788700;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    aggregateZonePCSCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_aggregateZonePCSCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    aggregateZonePCSCompletionBlock = self->_aggregateZonePCSCompletionBlock;
    self->_aggregateZonePCSCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)aggregateZonePCSCompletionBlock
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
    v15 = sub_18A7888A8;
    v16 = sub_18A7888D0;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7888D8;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_aggregateZonePCSCompletionBlock);
  }
  return v8;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performAggregateZonePCSOperation_withBlock_;
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
  objc_super v17;

  v4 = a3;
  objc_msgSend_sourceZoneIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceZoneIDs_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_targetZone(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetZone_(v4, v15, (uint64_t)v14, v16);

  v17.receiver = self;
  v17.super_class = (Class)CKAggregateZonePCSOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v17, sel_fillOutOperationInfo_, v4);

}

- (void)fillFromOperationInfo:(id)a3
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKAggregateZonePCSOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v17, sel_fillFromOperationInfo_, v4);
  objc_msgSend_sourceZoneIDs(v4, v5, v6, v7, v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceZoneIDs_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_targetZone(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTargetZone_(self, v15, (uint64_t)v14, v16);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKAggregateZonePCSOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v9, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_aggregateZonePCSCompletionBlock(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  BOOL result;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  int v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend_database(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_scope(v6, v7, v8, v9);

  if (v10 == 1)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v11, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("You can't execute this operation in the public database"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v14;
      return result;
    }
    return 0;
  }
  objc_msgSend_sourceZoneIDs(self, v11, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v16, v17, v18, v19))
    goto LABEL_16;
  objc_msgSend_targetZone(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend_sourceZoneIDs(self, v24, v25, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v27, (uint64_t)&v44, (uint64_t)v48, 16);
    if (v28)
    {
      v30 = v28;
      v31 = *(_QWORD *)v45;
LABEL_8:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v16);
        if (!objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v29, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v32), (uint64_t)a3))break;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v29, (uint64_t)&v44, (uint64_t)v48, 16);
          if (v30)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
LABEL_16:

      return 0;
    }
LABEL_14:

    objc_msgSend_targetZone(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v41, (uint64_t)v40, (uint64_t)a3);

    if (v42)
    {
      v43.receiver = self;
      v43.super_class = (Class)CKAggregateZonePCSOperation;
      return -[CKDatabaseOperation CKOperationShouldRun:](&v43, sel_CKOperationShouldRun_, a3);
    }
  }
  return 0;
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
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void (**v54)(_QWORD, _QWORD, _QWORD);
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  objc_super v59;
  uint8_t buf[16];

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKAggregateZonePCSOperation", "Finishing", buf, 2u);
    }

  }
  objc_msgSend_targetZone(self, v7, v8, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v26 = (void *)MEMORY[0x1E0C99E20];
    v27 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_targetZone(self, v23, v24, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v27, v33, (uint64_t)v32, v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v26, v36, (uint64_t)v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_zoneIDsToZoneNamesString_(self, v39, (uint64_t)v38, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationMetric(self, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v45, v46, (uint64_t)v41, (uint64_t)CFSTR("zoneNames"));

  }
  objc_msgSend_aggregateZonePCSCompletionBlock(self, v23, v24, v25);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_aggregateZonePCSCompletionBlock(self, v48, v49, v50);
    v54 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v55 = 0;
    }
    else
    {
      objc_msgSend_targetZone(self, v51, v52, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_CKClientSuitableError(v4, v51, v52, v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v54)[2](v54, v55, v56);

    if (!v4)
    objc_msgSend_setAggregateZonePCSCompletionBlock_(self, v57, 0, v58);
  }
  v59.receiver = self;
  v59.super_class = (Class)CKAggregateZonePCSOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v59, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKAggregateZonePCSOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKAggregateZonePCSOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/aggregate-zone-pcs", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (NSArray)sourceZoneIDs
{
  return self->_sourceZoneIDs;
}

- (void)setSourceZoneIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (CKRecordZone)targetZone
{
  return self->_targetZone;
}

- (void)setTargetZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetZone, 0);
  objc_storeStrong((id *)&self->_sourceZoneIDs, 0);
  objc_storeStrong(&self->_aggregateZonePCSCompletionBlock, 0);
}

@end
