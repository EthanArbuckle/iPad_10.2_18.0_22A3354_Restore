@implementation CKMergeableRecordValue

- (CKMergeableRecordValue)initWithValueID:(id)a3
{
  id v5;
  CKMergeableRecordValue *v6;
  CKMergeableRecordValue *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *deltasToSave;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *unmergedDeltas;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSSet *serverDeltaMetadatas;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *pendingReplacementRequests;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKMergeableRecordValue;
  v6 = -[CKMergeableRecordValue init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_valueID, a3);
    objc_msgSend_set(MEMORY[0x1E0C99E60], v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    deltasToSave = v7->_deltasToSave;
    v7->_deltasToSave = (NSSet *)v11;

    objc_msgSend_set(MEMORY[0x1E0C99E60], v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    unmergedDeltas = v7->_unmergedDeltas;
    v7->_unmergedDeltas = (NSSet *)v16;

    v7->_encryptMetadataTernary = -1;
    objc_msgSend_set(MEMORY[0x1E0C99E60], v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    serverDeltaMetadatas = v7->_serverDeltaMetadatas;
    v7->_serverDeltaMetadatas = (NSSet *)v21;

    objc_msgSend_array(MEMORY[0x1E0C99D20], v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    pendingReplacementRequests = v7->_pendingReplacementRequests;
    v7->_pendingReplacementRequests = (NSArray *)v26;

    *(_WORD *)&v7->_isValueIDKnownToServer = 256;
  }

  return v7;
}

- (CKMergeableRecordValue)init
{
  uint64_t v2;

  return (CKMergeableRecordValue *)objc_msgSend_initWithValueID_(self, a2, 0, v2);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKMergeableRecordValue *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKMergeableRecordValue *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  CKMergeableRecordValueDescription *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = [CKMergeableRecordValueDescription alloc];
  v9 = (id)objc_msgSend_initWithMergeableRecordValue_shortDescription_(v5, v6, (uint64_t)self, 0);
  objc_msgSend_CKDescribePropertiesUsing_(v9, v7, (uint64_t)v4, v8);

}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  _BOOL4 v3;
  CKMergeableRecordValueDescription *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  v5 = [CKMergeableRecordValueDescription alloc];
  v7 = (void *)objc_msgSend_initWithMergeableRecordValue_shortDescription_(v5, v6, (uint64_t)self, 1);
  v11 = v7;
  if (v3)
    objc_msgSend_redactedDescription(v7, v8, v9, v10);
  else
    objc_msgSend_description(v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)CKVeryShortDescription
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<CKMergeableRecordValue: %p>"), v2, self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMergeableRecordValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  CKMergeableValueID *v8;
  CKMergeableValueID *valueID;
  const char *v10;
  uint64_t v11;
  CKMergeableRecordValue *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  NSSet *v26;
  NSSet *deltasToSave;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSArray *v41;
  NSArray *pendingReplacementRequests;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  void *v52;
  NSSet *v53;
  NSSet *unmergedDeltas;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  CKDistributedTimestampStateVector *lastKnownServerTimestampVector;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  NSSet *serverDeltaMetadatas;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  CKMultiValueMergeableDeltaRegisterState *multiValueRegisterState;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_valueID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);
  v8 = (CKMergeableValueID *)objc_claimAutoreleasedReturnValue();
  valueID = self->_valueID;
  self->_valueID = v8;

  v12 = (CKMergeableRecordValue *)objc_msgSend_initWithValueID_(self, v10, (uint64_t)self->_valueID, v11);
  if (v12)
  {
    NSStringFromSelector(sel_isValueIDKnownToServer);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_isValueIDKnownToServer = objc_msgSend_decodeBoolForKey_(v4, v14, (uint64_t)v13, v15);

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deltasToSave);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v21, (uint64_t)v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      v26 = v24;
    else
      v26 = (NSSet *)objc_opt_new();
    deltasToSave = v12->_deltasToSave;
    v12->_deltasToSave = v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend_setWithObjects_(v28, v31, v29, v32, v30, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_pendingReplacementRequests);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v35, (uint64_t)v33, (uint64_t)v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v36;
    if (v36)
    {
      v41 = v36;
    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E0C99D20], v37, v38, v39);
      v41 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    pendingReplacementRequests = v12->_pendingReplacementRequests;
    v12->_pendingReplacementRequests = v41;

    v43 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    v45 = objc_opt_class();
    objc_msgSend_setWithObjects_(v43, v46, v44, v47, v45, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_unmergedDeltas);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v50, (uint64_t)v48, (uint64_t)v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
      v53 = v51;
    else
      v53 = (NSSet *)objc_opt_new();
    unmergedDeltas = v12->_unmergedDeltas;
    v12->_unmergedDeltas = v53;

    v55 = objc_opt_class();
    NSStringFromSelector(sel_lastKnownServerTimestampVector);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v55, (uint64_t)v56);
    v58 = objc_claimAutoreleasedReturnValue();
    lastKnownServerTimestampVector = v12->_lastKnownServerTimestampVector;
    v12->_lastKnownServerTimestampVector = (CKDistributedTimestampStateVector *)v58;

    NSStringFromSelector(sel_encryptMetadataTernary);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_encryptMetadataTernary = objc_msgSend_decodeIntegerForKey_(v4, v61, (uint64_t)v60, v62);

    v63 = (void *)MEMORY[0x1E0C99E60];
    v64 = objc_opt_class();
    v65 = objc_opt_class();
    objc_msgSend_setWithObjects_(v63, v66, v64, v67, v65, 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_serverDeltaMetadatas);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v70, (uint64_t)v68, (uint64_t)v69);
    v71 = objc_claimAutoreleasedReturnValue();
    serverDeltaMetadatas = v12->_serverDeltaMetadatas;
    v12->_serverDeltaMetadatas = (NSSet *)v71;

    v73 = objc_opt_class();
    NSStringFromSelector(sel_multiValueRegisterState);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v75, v73, (uint64_t)v74);
    v76 = objc_claimAutoreleasedReturnValue();
    multiValueRegisterState = v12->_multiValueRegisterState;
    v12->_multiValueRegisterState = (CKMultiValueMergeableDeltaRegisterState *)v76;

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  CKMergeableValueID *valueID;
  void *v5;
  const char *v6;
  _BOOL8 isValueIDKnownToServer;
  void *v8;
  const char *v9;
  NSSet *deltasToSave;
  void *v11;
  const char *v12;
  NSArray *pendingReplacementRequests;
  void *v14;
  const char *v15;
  NSSet *unmergedDeltas;
  void *v17;
  const char *v18;
  CKDistributedTimestampStateVector *lastKnownServerTimestampVector;
  void *v20;
  const char *v21;
  int64_t encryptMetadataTernary;
  void *v23;
  const char *v24;
  NSSet *serverDeltaMetadatas;
  void *v26;
  const char *v27;
  CKMultiValueMergeableDeltaRegisterState *multiValueRegisterState;
  void *v29;
  const char *v30;
  id v31;

  v31 = a3;
  valueID = self->_valueID;
  NSStringFromSelector(sel_valueID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v6, (uint64_t)valueID, (uint64_t)v5);

  isValueIDKnownToServer = self->_isValueIDKnownToServer;
  NSStringFromSelector(sel_isValueIDKnownToServer);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v31, v9, isValueIDKnownToServer, (uint64_t)v8);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_3;
  deltasToSave = self->_deltasToSave;
  NSStringFromSelector(sel_deltasToSave);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v12, (uint64_t)deltasToSave, (uint64_t)v11);

  pendingReplacementRequests = self->_pendingReplacementRequests;
  NSStringFromSelector(sel_pendingReplacementRequests);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v15, (uint64_t)pendingReplacementRequests, (uint64_t)v14);

  if (!byte_1EDF6A0E0)
  {
LABEL_3:
    unmergedDeltas = self->_unmergedDeltas;
    NSStringFromSelector(sel_unmergedDeltas);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v31, v18, (uint64_t)unmergedDeltas, (uint64_t)v17);

  }
  lastKnownServerTimestampVector = self->_lastKnownServerTimestampVector;
  NSStringFromSelector(sel_lastKnownServerTimestampVector);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v21, (uint64_t)lastKnownServerTimestampVector, (uint64_t)v20);

  encryptMetadataTernary = self->_encryptMetadataTernary;
  NSStringFromSelector(sel_encryptMetadataTernary);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v31, v24, encryptMetadataTernary, (uint64_t)v23);

  serverDeltaMetadatas = self->_serverDeltaMetadatas;
  NSStringFromSelector(sel_serverDeltaMetadatas);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v27, (uint64_t)serverDeltaMetadatas, (uint64_t)v26);

  multiValueRegisterState = self->_multiValueRegisterState;
  NSStringFromSelector(sel_multiValueRegisterState);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v30, (uint64_t)multiValueRegisterState, (uint64_t)v29);

}

- (CKMultiValueMergeableDeltaRegister)multiValueRegister
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  CKMultiValueMergeableDeltaRegister *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!byte_1EDF6A0E0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v5 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Multi-value register accessed outside the client process", buf, 2u);
    }
  }
  objc_msgSend_multiValueRegisterState(self, a2, v2, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v8 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      objc_msgSend_vector(v7, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKVeryShortDescription(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v13;
      v42 = 2112;
      v43 = v17;
      _os_log_debug_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_DEBUG, "Loading multi-value register state with vector %@ for mergeable record value %@", buf, 0x16u);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v18 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      v34 = v18;
      objc_msgSend_CKVeryShortDescription(self, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v38;
      _os_log_debug_impl(&dword_18A5C5000, v34, OS_LOG_TYPE_DEBUG, "Creating multi-value register state for mergeable record value %@", buf, 0xCu);

    }
    v7 = (void *)objc_opt_new();
    objc_msgSend_setMultiValueRegisterState_(self, v19, (uint64_t)v7, v20);
  }
  v21 = [CKMultiValueMergeableDeltaRegister alloc];
  v39 = 0;
  v23 = (void *)objc_msgSend_initWithPersistedState_contents_error_(v21, v22, (uint64_t)v7, 0, &v39);
  v24 = v39;
  v28 = v24;
  if (!v23)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    objc_msgSend_description(v24, v25, v26, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v29, v32, v30, (uint64_t)CFSTR("Failed to initialize CKMultiValueMergeableDeltaRegister: %@"), v31);

  }
  return (CKMultiValueMergeableDeltaRegister *)v23;
}

- (BOOL)encryptMetadata
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_encryptMetadataTernary(self, a2, v2, v3) == 1;
}

- (void)setEncryptMetadata:(BOOL)a3
{
  uint64_t v3;

  objc_msgSend_setEncryptMetadataTernary_(self, a2, a3, v3);
}

- (void)setLastKnownServerTimestampVector:(id)a3
{
  uint64_t v3;
  CKDistributedTimestampStateVector *v5;
  CKDistributedTimestampStateVector *lastKnownServerTimestampVector;

  if (self->_lastKnownServerTimestampVector != a3)
  {
    v5 = (CKDistributedTimestampStateVector *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3);
    lastKnownServerTimestampVector = self->_lastKnownServerTimestampVector;
    self->_lastKnownServerTimestampVector = v5;

  }
}

- (BOOL)mergeIntoMergeable:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CKMergeableRecordValue *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  char v34;
  CKMergeableRecordValue *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  int v48;
  CKMergeableRecordValue *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  const char *v56;
  char v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  NSObject *v67;
  BOOL v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  CKMergeableRecordValue *v78;
  id v79;
  id v80;
  uint8_t buf[4];
  CKMergeableRecordValue *v82;
  __int16 v83;
  CKMergeableRecordValue *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend_conformsToProtocol_(v6, v7, (uint64_t)&unk_1EDF870D8, v8))
  {
    if (!objc_msgSend_conformsToProtocol_(v6, v9, (uint64_t)&unk_1EDF87048, v10))
    {
      NSStringFromProtocol((Protocol *)&unk_1EDF87048);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol((Protocol *)&unk_1EDF870D8);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v41, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Mergeable should conform to either %@ or %@"), v39, v40);
      v35 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();

      v29 = 0;
      goto LABEL_55;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v82 = self;
      _os_log_debug_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_DEBUG, "Merging record value into non-versioned mergeable %@", buf, 0xCu);
    }
    v18 = v6;
    objc_msgSend_multiValueRegister(self, v19, v20, v21);
    v22 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = objc_msgSend_deltaDeliveryRequirements(v22, v23, v24, v25);
    else
      v26 = -1;
    objc_msgSend_stateVector(v22, v23, v24, v25);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deliverableDeltasWithCurrentStateVector_usingDeliveryRequirements_(self, v43, (uint64_t)v42, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v29, v44, v45, v46))
    {
      v79 = 0;
      v48 = objc_msgSend_mergeDeltas_error_(v22, v47, (uint64_t)v29, (uint64_t)&v79);
      v49 = (CKMergeableRecordValue *)v79;
      if (v48)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v50 = (void *)ck_log_facility_distributed_sync;
        if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
        {
          v73 = v50;
          v77 = objc_msgSend_count(v29, v74, v75, v76);
          *(_DWORD *)buf = 134218242;
          v82 = (CKMergeableRecordValue *)v77;
          v83 = 2112;
          v84 = v22;
          _os_log_debug_impl(&dword_18A5C5000, v73, OS_LOG_TYPE_DEBUG, "Merged %lu deltas into multi-value register %@", buf, 0x16u);

        }
        objc_msgSend_contents(v22, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v49;
        v55 = v18;
        v57 = objc_msgSend_mergeDeltas_error_(v18, v56, (uint64_t)v54, (uint64_t)&v78);
        v35 = v78;

        if ((v57 & 1) != 0)
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v58 = ck_log_facility_distributed_sync;
          if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_18A5C5000, v58, OS_LOG_TYPE_DEBUG, "Merged multi-value register changes into mergeable", buf, 2u);
          }
          objc_msgSend_persistedState(v22, v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setMultiValueRegisterState_(self, v63, (uint64_t)v62, v64);

          goto LABEL_35;
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v18 = v55;
        v70 = ck_log_facility_distributed_sync;
        if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v35;
          _os_log_error_impl(&dword_18A5C5000, v70, OS_LOG_TYPE_ERROR, "Error merging multi-value register changes into mergeable: %@", buf, 0xCu);
        }
      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v69 = ck_log_facility_distributed_sync;
        if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v82 = v22;
          v83 = 2112;
          v84 = v49;
          _os_log_error_impl(&dword_18A5C5000, v69, OS_LOG_TYPE_ERROR, "Error merging deltas into multi-value register %@: %@", buf, 0x16u);
        }
        v35 = v49;
      }

      goto LABEL_55;
    }
    v35 = 0;
LABEL_35:

    goto LABEL_36;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v11 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v82 = self;
    _os_log_debug_impl(&dword_18A5C5000, v11, OS_LOG_TYPE_DEBUG, "Merging record value into versioned mergeable %@", buf, 0xCu);
  }
  v12 = v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = objc_msgSend_deltaDeliveryRequirements(v12, v13, v14, v15);
  else
    v16 = -1;
  objc_msgSend_stateVector(v12, v13, v14, v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deliverableDeltasWithCurrentStateVector_usingDeliveryRequirements_(self, v28, (uint64_t)v27, v16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_count(v29, v30, v31, v32))
  {
    v35 = 0;
LABEL_36:

LABEL_37:
    if (objc_msgSend_count(v29, v36, v37, v38))
      objc_msgSend_didMergeDeltas_(self, v65, (uint64_t)v29, v66);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v67 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v82 = self;
      _os_log_debug_impl(&dword_18A5C5000, v67, OS_LOG_TYPE_DEBUG, "Done merging record value %@", buf, 0xCu);
    }
    v68 = 1;
    if (a4)
      goto LABEL_60;
    goto LABEL_61;
  }
  v80 = 0;
  v34 = objc_msgSend_mergeDeltas_error_(v12, v33, (uint64_t)v29, (uint64_t)&v80);
  v35 = (CKMergeableRecordValue *)v80;

  if ((v34 & 1) != 0)
    goto LABEL_37;
LABEL_55:
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v71 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v82 = self;
    v83 = 2112;
    v84 = v35;
    _os_log_error_impl(&dword_18A5C5000, v71, OS_LOG_TYPE_ERROR, "Error merging record value %@: %@", buf, 0x16u);
  }
  v68 = 0;
  if (a4)
LABEL_60:
    *a4 = objc_retainAutorelease(v35);
LABEL_61:

  return v68;
}

- (BOOL)mergeRecordValue:(id)a3 error:(id *)a4
{
  CKMergeableRecordValue *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  char isEqual;
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
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  BOOL v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t i;
  void *v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t j;
  void *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  int v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  NSObject *v196;
  objc_class *v197;
  CKMergeableRecordValue *v198;
  objc_class *v199;
  CKMergeableRecordValue *v200;
  objc_class *v201;
  void *v202;
  objc_class *v203;
  void *v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  NSObject *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  CKMergeableRecordValue *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  CKMergeableRecordValue *v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  NSObject *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  CKMergeableRecordValue *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  CKMergeableRecordValue *v255;
  NSObject *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  CKMergeableRecordValue *v260;
  NSObject *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  CKMergeableRecordValue *v265;
  char v266;
  id *v267;
  CKMergeableRecordValue *v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  uint8_t buf[4];
  CKMergeableRecordValue *v278;
  __int16 v279;
  CKMergeableRecordValue *v280;
  __int16 v281;
  void *v282;
  __int16 v283;
  void *v284;
  _BYTE v285[128];
  _BYTE v286[128];
  uint64_t v287;

  v287 = *MEMORY[0x1E0C80C00];
  v6 = (CKMergeableRecordValue *)a3;
  if (self != v6)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v7 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v278 = v6;
      v279 = 2112;
      v280 = self;
      _os_log_debug_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_DEBUG, "Merging record value %@ into %@", buf, 0x16u);
    }
    objc_msgSend_valueID(self, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v15 = (void *)v11;
      objc_msgSend_valueID(self, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueID(v6, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v16, v21, (uint64_t)v20, v22);

      if ((isEqual & 1) == 0)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v76 = ck_log_facility_distributed_sync;
        if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18A5C5000, v76, OS_LOG_TYPE_ERROR, "Can't merge a mergeable with a different value ID.", buf, 2u);
        }
        objc_msgSend_valueID(v6, v77, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        if (v80)
        {
          objc_msgSend_valueID(self, v81, v82, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_valueID(v6, v85, v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v89, (uint64_t)CFSTR("CKErrorDomain"), 150, CFSTR("Other mergeable value ID doesn't match this value. self=%@ other=%@"), v84, v88);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (!a4)
            goto LABEL_89;
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v81, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Tried to merge value without an ID into a value that has an ID. self=%@ other=%@"), self, v6);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (!a4)
            goto LABEL_89;
        }
        goto LABEL_88;
      }
    }
    objc_msgSend_valueID(self, v12, v13, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v28 = (void *)ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
      {
        v256 = v28;
        objc_msgSend_valueID(v6, v257, v258, v259);
        v260 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v278 = v260;
        _os_log_debug_impl(&dword_18A5C5000, v256, OS_LOG_TYPE_DEBUG, "Assigning value ID from other value %@", buf, 0xCu);

      }
      objc_msgSend_valueID(v6, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValueID_(self, v33, (uint64_t)v32, v34);

    }
    if ((objc_msgSend_isValueIDKnownToServer(self, v25, v26, v27) & 1) == 0
      && objc_msgSend_isValueIDKnownToServer(v6, v35, v36, v37))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v38 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18A5C5000, v38, OS_LOG_TYPE_DEBUG, "Setting isValueIDKnownToServer during merge", buf, 2u);
      }
      objc_msgSend_setIsValueIDKnownToServer_(self, v39, 1, v40);
    }
    objc_msgSend_unmergedDeltas(v6, v35, v36, v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_count(v41, v42, v43, v44);

    if (v45)
    {
      objc_msgSend_unmergedDeltas(self, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unmergedDeltas(v6, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setByAddingObjectsFromSet_(v49, v54, (uint64_t)v53, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUnmergedDeltas_(self, v57, (uint64_t)v56, v58);

    }
    objc_msgSend_lastKnownServerTimestampVector(v6, v46, v47, v48);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend_lastKnownServerTimestampVector(self, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v63)
      {
        objc_msgSend_lastKnownServerTimestampVector(self, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastKnownServerTimestampVector(v6, v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionStateVector_(v67, v72, (uint64_t)v71, v73);

      }
      else
      {
        objc_msgSend_lastKnownServerTimestampVector(v6, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setLastKnownServerTimestampVector_(self, v91, (uint64_t)v67, v92);
      }

    }
    v267 = a4;
    objc_msgSend_serverDeltaMetadatas(v6, v60, v61, v62);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend_count(v93, v94, v95, v96);

    if (v97)
    {
      objc_msgSend_serverDeltaMetadatas(self, v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serverDeltaMetadatas(v6, v102, v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setByAddingObjectsFromSet_(v101, v106, (uint64_t)v105, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setServerDeltaMetadatas_(self, v109, (uint64_t)v108, v110);

    }
    v268 = v6;
    v111 = (void *)objc_opt_new();
    v273 = 0u;
    v274 = 0u;
    v275 = 0u;
    v276 = 0u;
    objc_msgSend_serverDeltaMetadatas(self, v112, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v273, (uint64_t)v286, 16);
    if (v117)
    {
      v121 = v117;
      v122 = *(_QWORD *)v274;
      do
      {
        for (i = 0; i != v121; ++i)
        {
          if (*(_QWORD *)v274 != v122)
            objc_enumerationMutation(v115);
          objc_msgSend_replacedDeltaIdentifiers(*(void **)(*((_QWORD *)&v273 + 1) + 8 * i), v118, v119, v120);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v111, v125, (uint64_t)v124, v126);

        }
        v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v118, (uint64_t)&v273, (uint64_t)v286, 16);
      }
      while (v121);
    }

    if (objc_msgSend_count(v111, v127, v128, v129))
    {
      v133 = (void *)objc_opt_new();
      v269 = 0u;
      v270 = 0u;
      v271 = 0u;
      v272 = 0u;
      objc_msgSend_serverDeltaMetadatas(self, v134, v135, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v137, v138, (uint64_t)&v269, (uint64_t)v285, 16);
      if (v139)
      {
        v143 = v139;
        v144 = *(_QWORD *)v270;
        do
        {
          for (j = 0; j != v143; ++j)
          {
            if (*(_QWORD *)v270 != v144)
              objc_enumerationMutation(v137);
            v146 = *(void **)(*((_QWORD *)&v269 + 1) + 8 * j);
            objc_msgSend_identifier(v146, v140, v141, v142);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            v150 = objc_msgSend_containsObject_(v111, v148, (uint64_t)v147, v149);

            if (v150)
              objc_msgSend_addObject_(v133, v140, (uint64_t)v146, v142);
          }
          v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v137, v140, (uint64_t)&v269, (uint64_t)v285, 16);
        }
        while (v143);
      }

      if (objc_msgSend_count(v133, v151, v152, v153))
      {
        objc_msgSend_serverDeltaMetadatas(self, v154, v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = (void *)objc_msgSend_mutableCopy(v157, v158, v159, v160);

        objc_msgSend_minusSet_(v161, v162, (uint64_t)v133, v163);
        v167 = (void *)objc_msgSend_copy(v161, v164, v165, v166);
        objc_msgSend_setServerDeltaMetadatas_(self, v168, (uint64_t)v167, v169);

      }
    }
    objc_msgSend_multiValueRegisterState(self, v130, v131, v132);
    v170 = objc_claimAutoreleasedReturnValue();
    v6 = v268;
    if (v170)
    {
      v174 = (void *)v170;
      objc_msgSend_multiValueRegisterState(v268, v171, v172, v173);
      v175 = objc_claimAutoreleasedReturnValue();
      if (v175)
      {
        v179 = (void *)v175;
        objc_msgSend_multiValueRegisterState(self, v176, v177, v178);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v180, v181, v182, v183);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multiValueRegisterState(v268, v185, v186, v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v188, v189, v190, v191);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        v266 = objc_msgSend_isEqual_(v184, v193, (uint64_t)v192, v194);

        if ((v266 & 1) == 0)
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v195 = (void *)ck_log_facility_distributed_sync;
          if (!os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
          {
LABEL_87:

            v90 = 0;
            a4 = v267;
            if (!v267)
            {
LABEL_89:
              v75 = v90 == 0;

              goto LABEL_90;
            }
LABEL_88:
            *a4 = objc_retainAutorelease(v90);
            goto LABEL_89;
          }
          v196 = v195;
          v197 = (objc_class *)objc_opt_class();
          NSStringFromClass(v197);
          v198 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
          v199 = (objc_class *)objc_opt_class();
          NSStringFromClass(v199);
          v200 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
          v201 = (objc_class *)objc_opt_class();
          NSStringFromClass(v201);
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v203 = (objc_class *)objc_opt_class();
          NSStringFromClass(v203);
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v278 = v198;
          v279 = 2112;
          v280 = v200;
          v281 = 2112;
          v282 = v202;
          v283 = 2112;
          v284 = v204;
          _os_log_fault_impl(&dword_18A5C5000, v196, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Usage of %@ may be causing unbounded metadata growth on upload. When saving mergeable changes to CloudKit, you must set only your locally persisted %@ on a CKRecord. If a %@ is fetched from the server, it must be merged into your locally persisted %@ and not directly used for saving new mergeable changes, unless it's the initial fetch.", buf, 0x2Au);

LABEL_86:
          goto LABEL_87;
        }
      }
      else
      {

      }
    }
    objc_msgSend_multiValueRegisterState(v268, v171, v172, v173);
    v205 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v205)
      goto LABEL_87;
    objc_msgSend_multiValueRegisterState(self, v206, v207, v208);
    v209 = objc_claimAutoreleasedReturnValue();
    if (v209)
    {
      v196 = v209;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v210 = (void *)ck_log_facility_distributed_sync;
      if (!os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
        goto LABEL_83;
      v211 = v210;
      objc_msgSend_vector(v196, v212, v213, v214);
      v215 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKVeryShortDescription(self, v216, v217, v218);
      v219 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v278 = v215;
      v279 = 2112;
      v280 = v219;
      _os_log_debug_impl(&dword_18A5C5000, v211, OS_LOG_TYPE_DEBUG, "Loading multi-value register state with vector %@ for mergeable record value %@", buf, 0x16u);

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v220 = (void *)ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
      {
        v261 = v220;
        objc_msgSend_CKVeryShortDescription(self, v262, v263, v264);
        v265 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v278 = v265;
        _os_log_debug_impl(&dword_18A5C5000, v261, OS_LOG_TYPE_DEBUG, "Creating multi-value register state for mergeable record value %@", buf, 0xCu);

      }
      v196 = objc_opt_new();
      objc_msgSend_setMultiValueRegisterState_(self, v221, (uint64_t)v196, v222);
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
LABEL_83:
    v223 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      v243 = v223;
      objc_msgSend_multiValueRegisterState(v268, v244, v245, v246);
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vector(v247, v248, v249, v250);
      v251 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vector(v196, v252, v253, v254);
      v255 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v278 = v251;
      v279 = 2112;
      v280 = v255;
      _os_log_debug_impl(&dword_18A5C5000, v243, OS_LOG_TYPE_DEBUG, "Merging remote multi-value register with vector %@ into local multi-value register with vector %@ during mergeable record value merge", buf, 0x16u);

    }
    objc_msgSend_multiValueRegisterState(self, v224, v225, v226);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vector(v227, v228, v229, v230);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multiValueRegisterState(v268, v232, v233, v234);
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vector(v235, v236, v237, v238);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionStateVector_(v231, v240, (uint64_t)v239, v241);

    goto LABEL_86;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v74 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v278 = self;
    _os_log_fault_impl(&dword_18A5C5000, v74, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Trying to merge CKMergeableRecordValue into itself: %@", buf, 0xCu);
  }
  v75 = 1;
LABEL_90:

  return v75;
}

- (id)deliverableDeltasWithCurrentStateVector:(id)a3 usingDeliveryRequirements:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSMapTable *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  NSMapTable *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSObject *log;
  _QWORD v82[4];
  NSMapTable *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  unint64_t v93;
  __int16 v94;
  uint64_t v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v7, v8, v9);
  v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  objc_msgSend_unmergedDeltas(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v84, (uint64_t)v96, 16);
  if (v16)
  {
    v20 = v16;
    v21 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v85 != v21)
          objc_enumerationMutation(v14);
        v23 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend_metadata(v23, v17, v18, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v10, v25, (uint64_t)v23, (uint64_t)v24);

      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v84, (uint64_t)v96, 16);
    }
    while (v20);
  }

  v26 = (void *)MEMORY[0x1E0C99E60];
  NSAllMapTableKeys(v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v26, v28, (uint64_t)v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deliverableDeltaMetadatasInDeltaSet_withMergeableValueCurrentStateVector_deliveryRequirements_(CKMergeableDeltaMetadata, v31, (uint64_t)v30, (uint64_t)v6, a4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = sub_18A7DF6B8;
  v82[3] = &unk_1E1F65890;
  v33 = v10;
  v83 = v33;
  objc_msgSend_CKMap_(v32, v34, (uint64_t)v82, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v37 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    log = v37;
    v79 = objc_msgSend_count(v36, v52, v53, v54);
    objc_msgSend_unmergedDeltas(self, v55, v56, v57);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_count(v80, v58, v59, v60);
    objc_msgSend_CKVeryShortDescription(self, v62, v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v89 = v79;
    v90 = 2048;
    v91 = v61;
    v92 = 2048;
    v93 = a4;
    v94 = 2112;
    v95 = v65;
    v66 = (void *)v65;
    _os_log_debug_impl(&dword_18A5C5000, log, OS_LOG_TYPE_DEBUG, "Found %ld deliverable deltas out of %ld unmerged deltas with delivery requirements %llu from %@", buf, 0x2Au);

  }
  v41 = objc_msgSend_count(v32, v38, v39, v40);
  objc_msgSend_unmergedDeltas(self, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_count(v45, v46, v47, v48);

  if (v41 != v49)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v50 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      v67 = v50;
      NSAllMapTableKeys(v33);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v69, (uint64_t)v68, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v32, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mergeableDeltaMetadataByCombiningMetadatas_(CKMergeableDeltaMetadata, v76, (uint64_t)v75, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v89 = (uint64_t)v71;
      v90 = 2112;
      v91 = (uint64_t)v78;
      v92 = 2112;
      v93 = (unint64_t)v6;
      _os_log_debug_impl(&dword_18A5C5000, v67, OS_LOG_TYPE_DEBUG, "Combined delta directory: %@, combined deliverable deltas: %@, local state vector: %@", buf, 0x20u);

    }
  }

  return v36;
}

- (void)addUnmergedDeltas:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  CKMergeableRecordValue *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    v22 = v5;
    v26 = 134218242;
    v27 = objc_msgSend_count(v4, v23, v24, v25);
    v28 = 2112;
    v29 = self;
    _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "Adding %ld unmerged deltas to %@", (uint8_t *)&v26, 0x16u);

  }
  objc_msgSend_unmergedDeltas(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_mutableCopy(v9, v10, v11, v12);

  objc_msgSend_addObjectsFromArray_(v13, v14, (uint64_t)v4, v15);
  v19 = (void *)objc_msgSend_copy(v13, v16, v17, v18);
  objc_msgSend_setUnmergedDeltas_(self, v20, (uint64_t)v19, v21);

}

- (void)didMergeDeltas:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  char v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    v45 = v5;
    v49 = objc_msgSend_count(v4, v46, v47, v48);
    objc_msgSend_CKVeryShortDescription(self, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v62 = v49;
    v63 = 2112;
    v64 = v53;
    _os_log_debug_impl(&dword_18A5C5000, v45, OS_LOG_TYPE_DEBUG, "Did merge %ld deltas into %@", buf, 0x16u);

  }
  objc_msgSend_sanityCheckDeltas_(self, v6, (uint64_t)v4, v7);
  objc_msgSend_unmergedDeltas(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_mutableCopy(v11, v12, v13, v14);

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v16, (uint64_t)v4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v15, v19, (uint64_t)v18, v20);

  v54 = v15;
  v24 = (void *)objc_msgSend_copy(v15, v21, v22, v23);
  objc_msgSend_setUnmergedDeltas_(self, v25, (uint64_t)v24, v26);

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v31 = v4;
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v33)
  {
    v37 = v33;
    v38 = *(_QWORD *)v57;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v57 != v38)
          objc_enumerationMutation(v31);
        objc_msgSend_fileURL(*(void **)(*((_QWORD *)&v56 + 1) + 8 * v39), v34, v35, v36);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v55 = 0;
          v42 = objc_msgSend_removeItemAtURL_error_(v30, v40, (uint64_t)v41, (uint64_t)&v55);
          v43 = v55;
          if ((v42 & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v44 = ck_log_facility_distributed_sync;
            if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62 = (uint64_t)v43;
              _os_log_fault_impl(&dword_18A5C5000, v44, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Failed to remove mergeable delta file after merging: %@", buf, 0xCu);
            }
          }

        }
        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v56, (uint64_t)v60, 16);
    }
    while (v37);
  }

}

- (void)didSaveDeltas:(id)a3 replacementRequests:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  const char *v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  int v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  NSObject *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  id v135;
  id v136;
  void *v137;
  void *v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  uint8_t v148[128];
  uint8_t buf[4];
  uint64_t v150;
  __int16 v151;
  uint64_t v152;
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend_addObjectsFromArray_(v8, v9, (uint64_t)v6, v10);
  objc_msgSend_CKFlatMap_(v7, v11, (uint64_t)&unk_1E1F58A38, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v8, v14, (uint64_t)v13, v15);

  v16 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend_CKMap_(v8, v17, (uint64_t)&unk_1E1F599F8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v16, v20, (uint64_t)v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v23 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    v122 = v23;
    v126 = objc_msgSend_count(v6, v123, v124, v125);
    v130 = objc_msgSend_count(v8, v127, v128, v129);
    *(_DWORD *)buf = 134218240;
    v150 = v126;
    v151 = 2048;
    v152 = v130 - objc_msgSend_count(v6, v131, v132, v133);
    _os_log_debug_impl(&dword_18A5C5000, v122, OS_LOG_TYPE_DEBUG, "Did save %ld deltas and %ld replacement deltas to server", buf, 0x16u);

  }
  objc_msgSend_sanityCheckDeltas_(self, v24, (uint64_t)v8, v25);
  objc_msgSend_mergeLastKnownServerTimestampVectorFromDeltas_(self, v26, (uint64_t)v8, v27);
  objc_msgSend_serverDeltaMetadatas(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend_mutableCopy(v31, v32, v33, v34);

  objc_msgSend_unionSet_(v35, v36, (uint64_t)v22, v37);
  if (objc_msgSend_count(v7, v38, v39, v40))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v137 = v22;
    v138 = v8;
    v44 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v150 = (uint64_t)v7;
      _os_log_debug_impl(&dword_18A5C5000, v44, OS_LOG_TYPE_DEBUG, "Will remove server metadatas for replacement requests: %@", buf, 0xCu);
    }
    v134 = v35;
    v45 = (void *)objc_opt_new();
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v46 = v7;
    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v143, (uint64_t)v148, 16);
    if (v48)
    {
      v52 = v48;
      v53 = *(_QWORD *)v144;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v144 != v53)
            objc_enumerationMutation(v46);
          objc_msgSend_deltaIdentifiersToReplace(*(void **)(*((_QWORD *)&v143 + 1) + 8 * i), v49, v50, v51);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v45, v56, (uint64_t)v55, v57);

        }
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v143, (uint64_t)v148, 16);
      }
      while (v52);
    }
    v135 = v7;
    v136 = v6;

    v58 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    objc_msgSend_serverDeltaMetadatas(self, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v139, (uint64_t)v147, 16);
    if (v64)
    {
      v68 = v64;
      v69 = *(_QWORD *)v140;
      do
      {
        for (j = 0; j != v68; ++j)
        {
          if (*(_QWORD *)v140 != v69)
            objc_enumerationMutation(v62);
          v71 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * j);
          objc_msgSend_identifier(v71, v65, v66, v67);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend_containsObject_(v45, v73, (uint64_t)v72, v74);

          if (v75)
            objc_msgSend_addObject_(v58, v65, (uint64_t)v71, v67);
        }
        v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v139, (uint64_t)v147, 16);
      }
      while (v68);
    }

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v7 = v135;
    v6 = v136;
    v35 = v134;
    v76 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v150 = (uint64_t)v58;
      _os_log_debug_impl(&dword_18A5C5000, v76, OS_LOG_TYPE_DEBUG, "Removing known server metadatas: %@", buf, 0xCu);
    }
    objc_msgSend_minusSet_(v134, v77, (uint64_t)v58, v78);

    v22 = v137;
    v8 = v138;
  }
  v79 = (void *)objc_msgSend_copy(v35, v41, v42, v43);
  objc_msgSend_setServerDeltaMetadatas_(self, v80, (uint64_t)v79, v81);

  objc_msgSend_deltasToSave(self, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend_mutableCopy(v85, v86, v87, v88);

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v90, (uint64_t)v6, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v89, v93, (uint64_t)v92, v94);

  v98 = (void *)objc_msgSend_copy(v89, v95, v96, v97);
  objc_msgSend_setDeltasToSave_(self, v99, (uint64_t)v98, v100);

  v101 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend_pendingReplacementRequests(self, v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v101, v106, (uint64_t)v105, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v109, (uint64_t)v7, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v108, v112, (uint64_t)v111, v113);

  objc_msgSend_allObjects(v108, v114, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPendingReplacementRequests_(self, v118, (uint64_t)v117, v119);

  objc_msgSend_setSavedDeltaMetadatas_(self, v120, (uint64_t)v22, v121);
}

- (void)sanityCheckDeltas:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
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
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  __CFString *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  id obj;
  _QWORD v97[5];
  _QWORD v98[5];
  _QWORD v99[5];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = a3;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v100, (uint64_t)v104, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v101;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v101 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend_metadata(v9, v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend_metadata(v9, v15, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vectors(v18, v19, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_previous(v22, v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allSiteIdentifiers(v26, v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v10, v31, (uint64_t)v30, v32);

          objc_msgSend_metadata(v9, v33, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vectors(v36, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v40, v41, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allSiteIdentifiers(v44, v45, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v10, v49, (uint64_t)v48, v50);

          objc_msgSend_metadata(v9, v51, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vectors(v54, v55, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removals(v58, v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allSiteIdentifiers(v62, v63, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v10, v67, (uint64_t)v66, v68);

          objc_msgSend_metadata(v9, v69, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vectors(v72, v73, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dependencies(v76, v77, v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allSiteIdentifiers(v80, v81, v82, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v10, v85, (uint64_t)v84, v86);

        }
        if ((unint64_t)objc_msgSend_count(v10, v15, v16, v17) < 0x12D)
        {
          if ((unint64_t)objc_msgSend_count(v10, v87, v88, v89) < 0x65)
          {
            if ((unint64_t)objc_msgSend_count(v10, v92, v93, v94) < 0x33)
              goto LABEL_15;
            v97[0] = MEMORY[0x1E0C809B0];
            v97[1] = 3221225472;
            v97[2] = sub_18A7E066C;
            v97[3] = &unk_1E1F5FAA8;
            v97[4] = self;
            v90 = v97;
            v91 = CFSTR("CKMergeableRecordValueSiteIdentifierLowLimitExceededFault");
          }
          else
          {
            v98[0] = MEMORY[0x1E0C809B0];
            v98[1] = 3221225472;
            v98[2] = sub_18A7E0564;
            v98[3] = &unk_1E1F5FAA8;
            v98[4] = self;
            v90 = v98;
            v91 = CFSTR("CKMergeableRecordValueSiteIdentifierMediumLimitExceededFault");
          }
        }
        else
        {
          v99[0] = MEMORY[0x1E0C809B0];
          v99[1] = 3221225472;
          v99[2] = sub_18A7E045C;
          v99[3] = &unk_1E1F5FAA8;
          v99[4] = self;
          v90 = v99;
          v91 = CFSTR("CKMergeableRecordValueSiteIdentifierHighLimitExceededFault");
        }
        CKOncePerBoot(v91, v90);
LABEL_15:

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v95, (uint64_t)&v100, (uint64_t)v104, 16);
    }
    while (v6);
  }

}

- (void)addServerDeltaMetadatas:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  objc_msgSend_serverDeltaMetadatas(self, v5, v6, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v13, v8, (uint64_t)v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setServerDeltaMetadatas_(self, v11, (uint64_t)v10, v12);
}

- (void)mergeLastKnownServerTimestampVector:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKDistributedTimestampStateVector *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lastKnownServerTimestampVector(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v12 = objc_alloc_init(CKDistributedTimestampStateVector);
    objc_msgSend_setLastKnownServerTimestampVector_(self, v13, (uint64_t)v12, v14);

  }
  if (objc_msgSend_timestampCount(v4, v9, v10, v11))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v15 = (void *)ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      v22 = v15;
      objc_msgSend_CKShortDescriptionRedact_(self, v23, 0, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v4;
      v28 = 2112;
      v29 = v25;
      _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "Merging last known timestamp %@ into %@", (uint8_t *)&v26, 0x16u);

    }
    objc_msgSend_lastKnownServerTimestampVector(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionStateVector_(v19, v20, (uint64_t)v4, v21);

  }
}

- (void)mergeLastKnownServerTimestampVectorFromDeltas:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  CKMergeableRecordValue *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
  {
    v41 = v5;
    *(_DWORD *)buf = 134218242;
    v51 = objc_msgSend_count(v4, v42, v43, v44);
    v52 = 2112;
    v53 = self;
    _os_log_debug_impl(&dword_18A5C5000, v41, OS_LOG_TYPE_DEBUG, "Merging %lu deltas into %@", buf, 0x16u);

  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend_metadata(v15, v9, v10, v11, (_QWORD)v45);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectors(v16, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contents(v20, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mergeLastKnownServerTimestampVector_(self, v25, (uint64_t)v24, v26);

        objc_msgSend_metadata(v15, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectors(v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removals(v34, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mergeLastKnownServerTimestampVector_(self, v39, (uint64_t)v38, v40);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v12);
  }

}

- (BOOL)addDeltasToSaveFromMergeable:(id)a3 container:(id)a4 error:(id *)a5
{
  return MEMORY[0x1E0DE7D20](self, sel_addDeltasToSaveFromMergeable_error_, a3, a5);
}

- (BOOL)addDeltasToSaveFromMergeable:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  char v14;
  char v15;
  char v16;
  id v17;
  CKMergeableRecordValue *v18;
  id *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_class *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  BOOL v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSObject *v75;
  BOOL v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  NSObject *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  CKMergeableDeltaMetadata *v151;
  CKMergeableDeltaVectors *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  BOOL v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  void *v195;
  id *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  NSObject *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  BOOL v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  NSObject *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  NSObject *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  _BOOL4 v239;
  void *v240;
  NSObject *v241;
  id *v242;
  const char *v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  const char *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t k;
  void *v256;
  _BOOL4 v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  BOOL v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  NSObject *v270;
  id v271;
  const char *v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t m;
  void *v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  CKReplaceDeltasRequest *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  id v308;
  const char *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t n;
  void *v316;
  const char *v317;
  uint64_t v318;
  id v319;
  const char *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t ii;
  void *v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  void *v350;
  void *v351;
  NSObject *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  BOOL v364;
  NSObject *v365;
  const char *v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  id v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  NSObject *v380;
  CKMergeableRecordValue *v381;
  const char *v382;
  NSObject *v383;
  void *v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  void *v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void *v395;
  CKMergeableRecordValue *v396;
  CKMergeableRecordValue *v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  CKMergeableRecordValue *v402;
  CKMergeableRecordValue *v403;
  void *v404;
  CKMergeableRecordValue *v405;
  void *v406;
  id v407;
  void *v408;
  void *v409;
  void *v410;
  CKMergeableRecordValue *v411;
  void *v412;
  id v413;
  CKMergeableRecordValue *v414;
  id v416;
  char v417;
  CKMergeableRecordValue *v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  id v435;
  _QWORD v436[4];
  CKMergeableRecordValue *v437;
  id v438;
  CKMergeableRecordValue *v439;
  id v440;
  uint64_t *v441;
  uint64_t *v442;
  id v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  id obj;
  uint64_t v453;
  uint64_t *v454;
  uint64_t v455;
  char v456;
  uint64_t v457;
  uint64_t *v458;
  uint64_t v459;
  uint64_t (*v460)(uint64_t, uint64_t);
  void (*v461)(uint64_t);
  id v462;
  _BYTE v463[128];
  _BYTE v464[128];
  _BYTE v465[128];
  uint8_t v466[128];
  uint8_t buf[4];
  CKMergeableRecordValue *v468;
  __int16 v469;
  id v470;
  __int16 v471;
  void *v472;
  _BYTE v473[128];
  _BYTE v474[128];
  uint64_t v475;

  v475 = *MEMORY[0x1E0C80C00];
  v457 = 0;
  v458 = &v457;
  v459 = 0x3032000000;
  v460 = sub_18A7E2588;
  v461 = sub_18A7E2598;
  v462 = 0;
  v453 = 0;
  v454 = &v453;
  v455 = 0x2020000000;
  v456 = 1;
  v416 = a3;
  if (objc_msgSend_conformsToProtocol_(v416, v5, (uint64_t)&unk_1EDF870D8, v6))
  {
    v10 = v416;
    v13 = v416;
  }
  else
  {
    objc_msgSend_multiValueRegister(self, v7, v8, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v416;
  }
  v14 = objc_msgSend_conformsToProtocol_(v10, v11, (uint64_t)&unk_1EDF870D8, v12);
  if (!v13)
  {
    if (a4)
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v36, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Tried to save a %@ without a mergeable: %@"), v35, self);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_51:
    v76 = 0;
    goto LABEL_179;
  }
  v15 = v14;
  if ((v14 & 1) == 0)
  {
    v16 = v14;
    v17 = v13;
    v18 = (CKMergeableRecordValue *)v13;
    v19 = (id *)(v458 + 5);
    obj = (id)v458[5];
    objc_msgSend_mergeableDeltasForMetadata_error_(v416, v20, 0, (uint64_t)&obj);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v19, obj);
    if (v21)
    {
      if (objc_msgSend_count(v21, v22, v23, v24))
      {
        if ((unint64_t)objc_msgSend_count(v21, v25, v26, v27) < 2)
        {
          v450 = 0u;
          v451 = 0u;
          v448 = 0u;
          v449 = 0u;
          v29 = v21;
          v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v41, (uint64_t)&v448, (uint64_t)v474, 16);
          if (v45)
          {
            v46 = *(_QWORD *)v449;
            while (2)
            {
              for (i = 0; i != v45; ++i)
              {
                if (*(_QWORD *)v449 != v46)
                  objc_enumerationMutation(v29);
                objc_msgSend_metadata(*(void **)(*((_QWORD *)&v448 + 1) + 8 * i), v42, v43, v44);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = v48 == 0;

                if (!v49)
                {
                  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v42, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Delta for non-versioned mergeable has non-nil metadata"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_CKClientSuitableError(v40, v62, v63, v64);
                  v65 = objc_claimAutoreleasedReturnValue();
                  v66 = (void *)v458[5];
                  v458[5] = v65;

                  goto LABEL_32;
                }
              }
              v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v42, (uint64_t)&v448, (uint64_t)v474, 16);
              if (v45)
                continue;
              break;
            }
          }

          *((_BYTE *)v454 + 24) = 1;
          v50 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, v50);

          v51 = (id)ck_log_facility_distributed_sync;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v468 = v18;
            _os_log_debug_impl(&dword_18A5C5000, v51, OS_LOG_TYPE_DEBUG, "Generated mergeable deltas for multi-value register %@", buf, 0xCu);
          }

          objc_msgSend_setContents_(v18, v52, (uint64_t)v29, v53);
          objc_msgSend_persistedState(v18, v54, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setMultiValueRegisterState_(self, v58, (uint64_t)v57, v59);

          v60 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, v60);

          v61 = (id)ck_log_facility_distributed_sync;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v468 = v18;
            _os_log_debug_impl(&dword_18A5C5000, v61, OS_LOG_TYPE_DEBUG, "Populated multi-value register %@", buf, 0xCu);
          }

          goto LABEL_37;
        }
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v28, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Non-versioned mergeable returned more than one delta"));
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKClientSuitableError(v29, v30, v31, v32);
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v25, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Non-versioned mergeable did not return any deltas"));
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKClientSuitableError(v29, v37, v38, v39);
        v33 = objc_claimAutoreleasedReturnValue();
      }
      v40 = (void *)v458[5];
      v458[5] = v33;
LABEL_32:

    }
    *((_BYTE *)v454 + 24) = 0;
    v67 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v67);

    v29 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v395 = (void *)v458[5];
      *(_DWORD *)buf = 138412546;
      v468 = v18;
      v469 = 2112;
      v470 = v395;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Failed to generate mergeable deltas for multi-value register %@: %@", buf, 0x16u);
    }
LABEL_37:

    v13 = v17;
    v15 = v16;
  }
  if (*((_BYTE *)v454 + 24))
  {
    v68 = ck_log_initialization_block;
    v409 = v13;
    v417 = v15;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v68);

    v69 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v468 = self;
      _os_log_debug_impl(&dword_18A5C5000, v69, OS_LOG_TYPE_DEBUG, "Generating deltas for mergeable %@", buf, 0xCu);
    }

    objc_msgSend_lastKnownServerTimestampVector(self, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if (v73)
    {
      v413 = v73;
    }
    else
    {
      v413 = (id)objc_opt_new();

    }
    objc_msgSend_stateVector(v13, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v414 = (CKMergeableRecordValue *)objc_msgSend_copy(v80, v81, v82, v83);

    v84 = (void *)objc_opt_new();
    v446 = 0u;
    v447 = 0u;
    v444 = 0u;
    v445 = 0u;
    objc_msgSend_unmergedDeltas(self, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v444, (uint64_t)v473, 16);
    if (v93)
    {
      v94 = *(_QWORD *)v445;
      do
      {
        for (j = 0; j != v93; ++j)
        {
          if (*(_QWORD *)v445 != v94)
            objc_enumerationMutation(v88);
          objc_msgSend_metadata(*(void **)(*((_QWORD *)&v444 + 1) + 8 * j), v90, v91, v92);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_vectors(v96, v97, v98, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v100, v101, v102, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionStateVector_(v84, v105, (uint64_t)v104, v106);

        }
        v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v90, (uint64_t)&v444, (uint64_t)v473, 16);
      }
      while (v93);
    }

    objc_msgSend_clockVector(v414, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusVector_(v84, v111, (uint64_t)v110, v112);

    objc_msgSend_clockVector(v413, v113, v114, v115);
    v116 = objc_claimAutoreleasedReturnValue();
    v412 = (void *)objc_msgSend_mutableCopy((void *)v116, v117, v118, v119);

    objc_msgSend_clockVector(v84, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusVector_(v412, v124, (uint64_t)v123, v125);

    objc_msgSend_clockVector(v414, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v116) = objc_msgSend_isGreaterThanOrEqualToVector_(v129, v130, (uint64_t)v412, v131);

    if ((v116 & 1) != 0)
      goto LABEL_66;
    v135 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, v135);

    v136 = (id)ck_log_facility_distributed_sync;
    if (os_log_type_enabled(v136, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_valueID(self, v137, v138, v139);
      v397 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clockVector(v414, v398, v399, v400);
      v401 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v468 = v397;
      v469 = 2112;
      v470 = v401;
      v471 = 2112;
      v472 = v412;
      _os_log_fault_impl(&dword_18A5C5000, v136, OS_LOG_TYPE_FAULT, "Mergeable %@ regressed with current vector %@, server vector %@", buf, 0x20u);

    }
    if ((objc_msgSend_enabledFaultErrors(self, v140, v141, v142) & 1) != 0)
    {
      if (!a4)
      {
        v76 = 0;
LABEL_178:

        v13 = v409;
        goto LABEL_179;
      }
      objc_msgSend_valueID(self, v132, v133, v134);
      v410 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clockVector(v414, v372, v373, v374);
      v411 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v375, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Mergeable %@ regressed with current vector %@, server vector %@"), v410, v411, v412);
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKClientSuitableError(v376, v377, v378, v379);
      v408 = v376;
      v371 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_66:
      if ((v417 & 1) != 0)
      {
        v143 = v413;
      }
      else
      {
        v144 = objc_opt_new();

        v143 = (void *)v144;
      }
      v413 = v143;
      v410 = (void *)objc_msgSend_mutableCopy(v143, v132, v133, v134);
      objc_msgSend_clockVector(v414, v145, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_intersectVector_(v410, v149, (uint64_t)v148, v150);

      v151 = [CKMergeableDeltaMetadata alloc];
      v152 = [CKMergeableDeltaVectors alloc];
      v156 = (void *)objc_msgSend_mutableCopy(v414, v153, v154, v155);
      v158 = (void *)objc_msgSend_initWithPreviousStateVector_currentStateVector_(v152, v157, (uint64_t)v410, (uint64_t)v156);
      v411 = (CKMergeableRecordValue *)objc_msgSend_initWithVectors_(v151, v159, (uint64_t)v158, v160);

      objc_msgSend_vectors(v411, v161, v162, v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contents(v164, v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_timestampCount(v168, v169, v170, v171))
      {

LABEL_71:
        v408 = (void *)objc_opt_new();
        if (!objc_msgSend_inlineReplacementEnabled(self, v175, v176, v177)
          || (objc_msgSend_serverDeltaMetadatas(self, v178, v179, v180),
              v181 = (void *)objc_claimAutoreleasedReturnValue(),
              v185 = objc_msgSend_count(v181, v182, v183, v184) == 0,
              v181,
              v185))
        {
          v418 = 0;
        }
        else
        {
          v186 = objc_msgSend_enabledFaultErrors(self, v178, v179, v180);
          objc_msgSend_serverDeltaMetadatas(self, v187, v188, v189);
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          v195 = (void *)objc_msgSend_mutableCopy(v414, v191, v192, v193);
          v196 = (id *)(v458 + 5);
          if ((v186 & 2) != 0)
            v443 = *v196;
          objc_msgSend_replacementDeltaMetadatasForDeltaDirectory_withNextDeltaMetadata_currentStateVector_deltaDirectoryDeliveryRequirements_error_(CKMergeableDeltaMetadata, v194, (uint64_t)v190, (uint64_t)v411, v195, -1, (unint64_t)&v443 & (v186 << 62 >> 63));
          v418 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
          if ((v186 & 2) != 0)
            objc_storeStrong(v196, v443);

          if (v458[5])
          {
            v200 = ck_log_initialization_block;
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, v200);

            v201 = (id)ck_log_facility_distributed_sync;
            if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_valueID(self, v202, v203, v204);
              v403 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
              v404 = (void *)v458[5];
              *(_DWORD *)buf = 138412546;
              v468 = v403;
              v469 = 2112;
              v470 = v404;
              _os_log_error_impl(&dword_18A5C5000, v201, OS_LOG_TYPE_ERROR, "Error calculating replacement deltas for %@: %@", buf, 0x16u);

            }
            *((_BYTE *)v454 + 24) = 0;
          }
          objc_msgSend_replacementDeltaMetadatas(v418, v197, v198, v199);
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          v209 = objc_msgSend_count(v205, v206, v207, v208) == 0;

          if (!v209)
          {
            v213 = ck_log_initialization_block;
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, v213);

            v214 = (id)ck_log_facility_distributed_sync;
            if (os_log_type_enabled(v214, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v468 = v418;
              _os_log_debug_impl(&dword_18A5C5000, v214, OS_LOG_TYPE_DEBUG, "Found deltas to replace: %@", buf, 0xCu);
            }

            objc_msgSend_replacementDeltaMetadatas(v418, v215, v216, v217);
            v218 = (void *)objc_claimAutoreleasedReturnValue();
            v436[0] = MEMORY[0x1E0C809B0];
            v436[1] = 3221225472;
            v436[2] = sub_18A7E25A0;
            v436[3] = &unk_1E1F658F8;
            v437 = v418;
            v438 = v409;
            v439 = self;
            v441 = &v457;
            v442 = &v453;
            v440 = v408;
            objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v218, v219, (uint64_t)v436, v220);

          }
          objc_msgSend_updatedNextDeltaMetadata(v418, v210, v211, v212);
          v221 = (void *)objc_claimAutoreleasedReturnValue();

          if (v221)
          {
            v222 = ck_log_initialization_block;
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, v222);

            v223 = (id)ck_log_facility_distributed_sync;
            if (os_log_type_enabled(v223, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend_updatedNextDeltaMetadata(v418, v224, v225, v226);
              v405 = (CKMergeableRecordValue *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v468 = v405;
              _os_log_debug_impl(&dword_18A5C5000, v223, OS_LOG_TYPE_DEBUG, "Will use updated delta metadata: %@", buf, 0xCu);

            }
            objc_msgSend_updatedNextDeltaMetadata(v418, v227, v228, v229);
            v230 = objc_claimAutoreleasedReturnValue();

            v411 = (CKMergeableRecordValue *)v230;
          }
        }
        if (*((_BYTE *)v454 + 24))
        {
          objc_msgSend_vectors(v411, v178, v179, v180);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v231, v232, v233, v234);
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          v239 = objc_msgSend_timestampCount(v235, v236, v237, v238) == 0;

          if (v239)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v383 = ck_log_facility_distributed_sync;
            if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v468 = self;
              _os_log_debug_impl(&dword_18A5C5000, v383, OS_LOG_TYPE_DEBUG, "No new data to save for mergeable %@", buf, 0xCu);
            }
            goto LABEL_173;
          }
          v240 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, v240);

          v241 = (id)ck_log_facility_distributed_sync;
          if (os_log_type_enabled(v241, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v468 = v411;
            _os_log_debug_impl(&dword_18A5C5000, v241, OS_LOG_TYPE_DEBUG, "Will generate deltas for metadata: %@", buf, 0xCu);
          }

          v242 = (id *)(v458 + 5);
          v435 = (id)v458[5];
          objc_msgSend_mergeableDeltasForMetadata_error_(v409, v243, (uint64_t)v411, (uint64_t)&v435);
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v242, v435);
          if (v244)
          {
            if (objc_msgSend_count(v244, v245, v246, v247))
            {
              v433 = 0u;
              v434 = 0u;
              v431 = 0u;
              v432 = 0u;
              v407 = v244;
              v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v407, v249, (uint64_t)&v431, (uint64_t)v466, 16);
              if (v253)
              {
                v254 = *(_QWORD *)v432;
                while (2)
                {
                  for (k = 0; k != v253; ++k)
                  {
                    if (*(_QWORD *)v432 != v254)
                      objc_enumerationMutation(v407);
                    objc_msgSend_metadata(*(void **)(*((_QWORD *)&v431 + 1) + 8 * k), v250, v251, v252);
                    v256 = (void *)objc_claimAutoreleasedReturnValue();
                    v257 = v256 == 0;

                    if (v257)
                    {
                      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v250, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Delta for versioned mergeable has nil metadata"));
                      v384 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_CKClientSuitableError(v384, v385, v386, v387);
                      v388 = objc_claimAutoreleasedReturnValue();
                      v389 = (void *)v458[5];
                      v458[5] = v388;

                      goto LABEL_169;
                    }
                  }
                  v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v407, v250, (uint64_t)&v431, (uint64_t)v466, 16);
                  if (v253)
                    continue;
                  break;
                }
              }

              *((_BYTE *)v454 + 24) = 1;
              objc_msgSend_removableDeltaMetadatas(v418, v258, v259, v260);
              v261 = (void *)objc_claimAutoreleasedReturnValue();
              v265 = objc_msgSend_count(v261, v262, v263, v264) == 0;

              if (!v265)
              {
                v269 = ck_log_initialization_block;
                if (ck_log_initialization_predicate != -1)
                  dispatch_once(&ck_log_initialization_predicate, v269);

                v270 = (id)ck_log_facility_distributed_sync;
                if (os_log_type_enabled(v270, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_18A5C5000, v270, OS_LOG_TYPE_DEBUG, "Will fold empty deltas into new delta", buf, 2u);
                }

                v429 = 0u;
                v430 = 0u;
                v427 = 0u;
                v428 = 0u;
                v271 = v407;
                v276 = objc_msgSend_countByEnumeratingWithState_objects_count_(v271, v272, (uint64_t)&v427, (uint64_t)v465, 16);
                if (v276)
                {
                  v277 = *(_QWORD *)v428;
                  do
                  {
                    for (m = 0; m != v276; ++m)
                    {
                      if (*(_QWORD *)v428 != v277)
                        objc_enumerationMutation(v271);
                      v279 = *(void **)(*((_QWORD *)&v427 + 1) + 8 * m);
                      objc_msgSend_removableDeltaMetadatas(v418, v273, v274, v275);
                      v280 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_metadata(v279, v281, v282, v283);
                      v284 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setReplacedDeltaIdentifiers_(v284, v285, (uint64_t)v280, v286);

                    }
                    v276 = objc_msgSend_countByEnumeratingWithState_objects_count_(v271, v273, (uint64_t)&v427, (uint64_t)v465, 16);
                  }
                  while (v276);
                }

                v287 = [CKReplaceDeltasRequest alloc];
                objc_msgSend_valueID(self, v288, v289, v290);
                v291 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_removableDeltaMetadatas(v418, v292, v293, v294);
                v295 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_allObjects(v295, v296, v297, v298);
                v299 = (void *)objc_claimAutoreleasedReturnValue();
                v301 = (void *)objc_msgSend_initWithValueID_deltaIdentifiersToReplace_replacementDeltas_replacementDeltasContainNewData_(v287, v300, (uint64_t)v291, (uint64_t)v299, v271, 1);

                objc_msgSend_insertObject_atIndex_(v408, v302, (uint64_t)v301, 0);
                v407 = (id)MEMORY[0x1E0C9AA60];
              }
              v303 = objc_msgSend_maxInlineDeltaSize(CKMergeableDelta, v266, v267, v268);
              v307 = (void *)objc_msgSend_mutableCopy(v407, v304, v305, v306);
              v425 = 0u;
              v426 = 0u;
              v423 = 0u;
              v424 = 0u;
              v308 = v408;
              v313 = objc_msgSend_countByEnumeratingWithState_objects_count_(v308, v309, (uint64_t)&v423, (uint64_t)v464, 16);
              if (v313)
              {
                v314 = *(_QWORD *)v424;
                do
                {
                  for (n = 0; n != v313; ++n)
                  {
                    if (*(_QWORD *)v424 != v314)
                      objc_enumerationMutation(v308);
                    objc_msgSend_replacementDeltas(*(void **)(*((_QWORD *)&v423 + 1) + 8 * n), v310, v311, v312);
                    v316 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObjectsFromArray_(v307, v317, (uint64_t)v316, v318);

                  }
                  v313 = objc_msgSend_countByEnumeratingWithState_objects_count_(v308, v310, (uint64_t)&v423, (uint64_t)v464, 16);
                }
                while (v313);
              }

              v421 = 0u;
              v422 = 0u;
              v419 = 0u;
              v420 = 0u;
              v319 = v307;
              v324 = objc_msgSend_countByEnumeratingWithState_objects_count_(v319, v320, (uint64_t)&v419, (uint64_t)v463, 16);
              if (v324)
              {
                v325 = *(_QWORD *)v420;
                do
                {
                  for (ii = 0; ii != v324; ++ii)
                  {
                    if (*(_QWORD *)v420 != v325)
                      objc_enumerationMutation(v319);
                    v327 = *(void **)(*((_QWORD *)&v419 + 1) + 8 * ii);
                    objc_msgSend_valueID(self, v321, v322, v323);
                    v328 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setValueID_(v327, v329, (uint64_t)v328, v330);

                    v334 = objc_msgSend_encryptMetadataTernary(self, v331, v332, v333);
                    objc_msgSend_setEncryptMetadataTernary_(v327, v335, v334, v336);
                    objc_msgSend_populateAssetIfNecessaryWithMaxInlineSize_(v327, v337, v303, v338);
                  }
                  v324 = objc_msgSend_countByEnumeratingWithState_objects_count_(v319, v321, (uint64_t)&v419, (uint64_t)v463, 16);
                }
                while (v324);
              }

              objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v339, (uint64_t)v407, v340);
              v341 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setDeltasToSave_(self, v342, (uint64_t)v341, v343);

              v347 = objc_msgSend_copy(v308, v344, v345, v346);
              v350 = (void *)v347;
              if (v347)
                objc_msgSend_setPendingReplacementRequests_(self, v348, v347, v349);
              else
                objc_msgSend_setPendingReplacementRequests_(self, v348, MEMORY[0x1E0C9AA60], v349);

              v351 = ck_log_initialization_block;
              if (ck_log_initialization_predicate != -1)
                dispatch_once(&ck_log_initialization_predicate, v351);

              v352 = (id)ck_log_facility_distributed_sync;
              if (os_log_type_enabled(v352, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend_deltasToSave(self, v353, v354, v355);
                v406 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v468 = self;
                v469 = 2112;
                v470 = v406;
                _os_log_debug_impl(&dword_18A5C5000, v352, OS_LOG_TYPE_DEBUG, "Generated deltas for mergeable %@: %@", buf, 0x16u);

              }
              goto LABEL_173;
            }
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v248, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Mergeable did not return any deltas"));
            v407 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CKClientSuitableError(v407, v390, v391, v392);
            v393 = objc_claimAutoreleasedReturnValue();
            v384 = (void *)v458[5];
            v458[5] = v393;
LABEL_169:

          }
          *((_BYTE *)v454 + 24) = 0;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v380 = ck_log_facility_distributed_sync;
          if (!os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
          {
LABEL_173:
            if (a4)
              *a4 = objc_retainAutorelease((id)v458[5]);
            v76 = *((_BYTE *)v454 + 24) != 0;

            goto LABEL_176;
          }
          v402 = (CKMergeableRecordValue *)v458[5];
          *(_DWORD *)buf = 138412290;
          v468 = v402;
          v382 = "Error generating deltas: %@";
        }
        else
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v380 = ck_log_facility_distributed_sync;
          if (!os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
            goto LABEL_173;
          v381 = (CKMergeableRecordValue *)v458[5];
          *(_DWORD *)buf = 138412290;
          v468 = v381;
          v382 = "Not generating deltas due to previous error: %@";
        }
        _os_log_error_impl(&dword_18A5C5000, v380, OS_LOG_TYPE_ERROR, v382, buf, 0xCu);
        goto LABEL_173;
      }
      objc_msgSend_vectors(v411, v172, v173, v174);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removals(v356, v357, v358, v359);
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      v364 = objc_msgSend_timestampCount(v360, v361, v362, v363) == 0;

      if (v364)
        goto LABEL_71;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v365 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v468 = v414;
        v469 = 2112;
        v470 = v413;
        _os_log_error_impl(&dword_18A5C5000, v365, OS_LOG_TYPE_ERROR, "Mergeable has a new removal without a corresponding change to the version vector, with current vector %@, server vector %@", buf, 0x16u);
      }
      if (!a4)
      {
        v76 = 0;
LABEL_177:

        goto LABEL_178;
      }
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v366, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Mergeable has a new removal without a corresponding change to the version vector, with current vector %@, server vector %@"), v414, v413);
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKClientSuitableError(v367, v368, v369, v370);
      v408 = v367;
      v371 = (id)objc_claimAutoreleasedReturnValue();
    }
    v76 = 0;
    *a4 = v371;
LABEL_176:

    goto LABEL_177;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v75 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
  {
    v396 = (CKMergeableRecordValue *)v458[5];
    *(_DWORD *)buf = 138412290;
    v468 = v396;
    _os_log_error_impl(&dword_18A5C5000, v75, OS_LOG_TYPE_ERROR, "Error preparing mergeable for upload: %@", buf, 0xCu);
  }
  if (!a4)
    goto LABEL_51;
  v76 = 0;
  *a4 = objc_retainAutorelease((id)v458[5]);
LABEL_179:

  _Block_object_dispose(&v453, 8);
  _Block_object_dispose(&v457, 8);

  return v76;
}

- (BOOL)hasAssetBackedDeltas
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _QWORD v69[2];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend_deltasToSave(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v5;
  objc_msgSend_unmergedDeltas(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v69, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v62, (uint64_t)v70, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v18 = v17;
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v58, (uint64_t)v68, 16);
        if (v20)
        {
          v24 = v20;
          v25 = *(_QWORD *)v59;
          while (2)
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v59 != v25)
                objc_enumerationMutation(v18);
              objc_msgSend_asset(*(void **)(*((_QWORD *)&v58 + 1) + 8 * j), v21, v22, v23);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
              {
LABEL_32:

                LOBYTE(v36) = 1;
                goto LABEL_33;
              }
            }
            v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v58, (uint64_t)v68, 16);
            if (v24)
              continue;
            break;
          }
        }

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v28, (uint64_t)&v62, (uint64_t)v70, 16);
    }
    while (v14);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend_pendingReplacementRequests(self, v29, v30, v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v32, (uint64_t)&v54, (uint64_t)v67, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v55;
    while (2)
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v55 != v37)
          objc_enumerationMutation(v11);
        v39 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend_replacementDeltas(v39, v33, v34, v35, 0);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v40, (uint64_t)&v50, (uint64_t)v66, 16);
        if (v41)
        {
          v45 = v41;
          v46 = *(_QWORD *)v51;
LABEL_23:
          v47 = 0;
          while (1)
          {
            if (*(_QWORD *)v51 != v46)
              objc_enumerationMutation(v18);
            objc_msgSend_asset(*(void **)(*((_QWORD *)&v50 + 1) + 8 * v47), v42, v43, v44);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            if (v48)
              goto LABEL_32;
            if (v45 == ++v47)
            {
              v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v42, (uint64_t)&v50, (uint64_t)v66, 16);
              if (v45)
                goto LABEL_23;
              break;
            }
          }
        }

      }
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v33, (uint64_t)&v54, (uint64_t)v67, 16);
      if (v36)
        continue;
      break;
    }
  }
LABEL_33:

  return v36;
}

- (CKMergeableValueID)valueID
{
  return self->_valueID;
}

- (void)setValueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isValueIDKnownToServer
{
  return self->_isValueIDKnownToServer;
}

- (void)setIsValueIDKnownToServer:(BOOL)a3
{
  self->_isValueIDKnownToServer = a3;
}

- (CKDistributedTimestampStateVector)lastKnownServerTimestampVector
{
  return self->_lastKnownServerTimestampVector;
}

- (NSSet)deltasToSave
{
  return self->_deltasToSave;
}

- (void)setDeltasToSave:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)savedDeltaMetadatas
{
  return self->_savedDeltaMetadatas;
}

- (void)setSavedDeltaMetadatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)unmergedDeltas
{
  return self->_unmergedDeltas;
}

- (void)setUnmergedDeltas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CKMultiValueMergeableDeltaRegisterState)multiValueRegisterState
{
  return self->_multiValueRegisterState;
}

- (void)setMultiValueRegisterState:(id)a3
{
  objc_storeStrong((id *)&self->_multiValueRegisterState, a3);
}

- (int64_t)encryptMetadataTernary
{
  return self->_encryptMetadataTernary;
}

- (void)setEncryptMetadataTernary:(int64_t)a3
{
  self->_encryptMetadataTernary = a3;
}

- (NSSet)serverDeltaMetadatas
{
  return self->_serverDeltaMetadatas;
}

- (void)setServerDeltaMetadatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)pendingReplacementRequests
{
  return self->_pendingReplacementRequests;
}

- (void)setPendingReplacementRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)inlineReplacementEnabled
{
  return self->_inlineReplacementEnabled;
}

- (void)setInlineReplacementEnabled:(BOOL)a3
{
  self->_inlineReplacementEnabled = a3;
}

- (unint64_t)enabledFaultErrors
{
  return self->_enabledFaultErrors;
}

- (void)setEnabledFaultErrors:(unint64_t)a3
{
  self->_enabledFaultErrors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReplacementRequests, 0);
  objc_storeStrong((id *)&self->_serverDeltaMetadatas, 0);
  objc_storeStrong((id *)&self->_multiValueRegisterState, 0);
  objc_storeStrong((id *)&self->_unmergedDeltas, 0);
  objc_storeStrong((id *)&self->_savedDeltaMetadatas, 0);
  objc_storeStrong((id *)&self->_deltasToSave, 0);
  objc_storeStrong((id *)&self->_lastKnownServerTimestampVector, 0);
  objc_storeStrong((id *)&self->_valueID, 0);
}

@end
