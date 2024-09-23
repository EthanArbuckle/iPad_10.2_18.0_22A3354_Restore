@implementation CKThrottle

- (BOOL)isServerThrottle
{
  return (self->_flags & 3) != 0;
}

- (BOOL)isExpired
{
  uint64_t v2;
  uint64_t v3;
  NSDate *expirationDate;
  double v5;

  expirationDate = self->_expirationDate;
  if (!expirationDate)
    return 1;
  objc_msgSend_timeIntervalSinceNow(expirationDate, a2, v2, v3);
  return v5 < 0.0;
}

- (BOOL)appliesToCriteria:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int isEqualToString;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  char v42;
  char hasPrefix;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  int v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  int v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_timeIntervalSinceNow(self->_throttleStartDate, v5, v6, v7);
  if (v11 > 0.0)
    goto LABEL_6;
  if (!self->_containerIdentifier)
  {
    isEqualToString = 1;
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_containerID(v4, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    if (v12)
    {
      objc_msgSend_containerIdentifier(v12, v13, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)self->_containerIdentifier, v19);

    }
    else
    {
      isEqualToString = 1;
    }

  }
  else
  {
LABEL_6:
    isEqualToString = 0;
  }
LABEL_10:
  v21 = objc_msgSend_integerValue(self->_databaseScope, v8, v9, v10);
  if (isEqualToString && (v22 = v21) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_48;
    v26 = objc_msgSend_databaseScope(v4, v23, v24, v25);
    if (v26)
    {
      if (v22 != v26)
        goto LABEL_48;
    }
  }
  else if (!isEqualToString)
  {
    goto LABEL_48;
  }
  if (self->_zoneName)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      objc_msgSend_relevantZoneIDs(v4, v27, v28, v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v81, (uint64_t)v85, 16);
      if (v32)
      {
        v36 = v32;
        v37 = *(_QWORD *)v82;
LABEL_21:
        v38 = 0;
        while (1)
        {
          if (*(_QWORD *)v82 != v37)
            objc_enumerationMutation(v30);
          objc_msgSend_zoneName(*(void **)(*((_QWORD *)&v81 + 1) + 8 * v38), v33, v34, v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend_isEqualToString_(v39, v40, (uint64_t)self->_zoneName, v41);

          if ((v42 & 1) != 0)
            break;
          if (v36 == ++v38)
          {
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v81, (uint64_t)v85, 16);
            if (v36)
              goto LABEL_21;
            hasPrefix = 0;
            goto LABEL_52;
          }
        }
      }

      goto LABEL_29;
    }
LABEL_48:
    hasPrefix = 0;
    goto LABEL_49;
  }
LABEL_29:
  if (self->_operationType)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_48;
    v47 = objc_msgSend_intValue(self->_operationType, v44, v45, v46);
    if (!objc_msgSend_isOperationType_(v4, v48, v47, v49))
      goto LABEL_48;
  }
  if (self->_serviceName)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_48;
    objc_msgSend_serviceName(v4, v50, v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v56 = (void *)v53;
      v57 = objc_msgSend_isEqualToString_(self->_serviceName, v54, v53, v55);

      if (!v57)
        goto LABEL_48;
    }
  }
  if (self->_functionName)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_48;
    objc_msgSend_functionName(v4, v58, v59, v60);
    v61 = objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v64 = (void *)v61;
      v65 = objc_msgSend_isEqualToString_(self->_functionName, v62, v61, v63);

      if (!v65)
        goto LABEL_48;
    }
  }
  if (self->_bundleID)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_48;
    objc_msgSend_applicationBundleIdentifierForContainerAccess(v4, v66, v67, v68);
    v69 = objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      v72 = (void *)v69;
      v73 = objc_msgSend_isEqualToString_(self->_bundleID, v70, v69, v71);

      if (!v73)
        goto LABEL_48;
    }
  }
  if (!self->_operationGroupNamePrefix)
  {
    hasPrefix = 1;
    goto LABEL_49;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_48;
  objc_msgSend_operationGroupName(v4, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v77;
  if (v77)
    hasPrefix = objc_msgSend_hasPrefix_(v77, v78, (uint64_t)self->_operationGroupNamePrefix, v79);
  else
    hasPrefix = 1;
LABEL_52:

LABEL_49:
  return hasPrefix;
}

- (CKThrottle)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CKThrottle *v5;
  uint64_t v6;
  NSDate *expirationDate;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSDate *throttleStartDate;
  NSNumber *sentRequestCount;
  NSNumber *currentRequestWindowIndex;
  NSNumber *errorCode;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKThrottle;
  v5 = -[CKThrottle init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    throttleStartDate = v5->_throttleStartDate;
    v5->_throttleStartDate = (NSDate *)v11;

    sentRequestCount = v5->_sentRequestCount;
    v5->_sentRequestCount = (NSNumber *)&unk_1E1FC4BF8;

    currentRequestWindowIndex = v5->_currentRequestWindowIndex;
    v5->_currentRequestWindowIndex = (NSNumber *)&unk_1E1FC4BF8;

    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)&unk_1E1FC4C10;

  }
  return v5;
}

- (id)copy
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;

  v3 = objc_alloc_init((Class)objc_opt_class());
  v7 = objc_msgSend_copy(self->_throttleID, v4, v5, v6);
  v8 = (void *)*((_QWORD *)v3 + 3);
  *((_QWORD *)v3 + 3) = v7;

  v12 = objc_msgSend_copy(self->_label, v9, v10, v11);
  v13 = (void *)*((_QWORD *)v3 + 4);
  *((_QWORD *)v3 + 4) = v12;

  v17 = objc_msgSend_copy(self->_containerIdentifier, v14, v15, v16);
  v18 = (void *)*((_QWORD *)v3 + 5);
  *((_QWORD *)v3 + 5) = v17;

  v22 = objc_msgSend_copy(self->_databaseScope, v19, v20, v21);
  v23 = (void *)*((_QWORD *)v3 + 6);
  *((_QWORD *)v3 + 6) = v22;

  v27 = objc_msgSend_copy(self->_zoneName, v24, v25, v26);
  v28 = (void *)*((_QWORD *)v3 + 7);
  *((_QWORD *)v3 + 7) = v27;

  objc_storeStrong((id *)v3 + 8, self->_operationType);
  v32 = objc_msgSend_copy(self->_serviceName, v29, v30, v31);
  v33 = (void *)*((_QWORD *)v3 + 9);
  *((_QWORD *)v3 + 9) = v32;

  v37 = objc_msgSend_copy(self->_functionName, v34, v35, v36);
  v38 = (void *)*((_QWORD *)v3 + 10);
  *((_QWORD *)v3 + 10) = v37;

  v42 = objc_msgSend_copy(self->_bundleID, v39, v40, v41);
  v43 = (void *)*((_QWORD *)v3 + 11);
  *((_QWORD *)v3 + 11) = v42;

  v47 = objc_msgSend_copy(self->_operationGroupNamePrefix, v44, v45, v46);
  v48 = (void *)*((_QWORD *)v3 + 12);
  *((_QWORD *)v3 + 12) = v47;

  v52 = objc_msgSend_copy(self->_intervalLengthSeconds, v49, v50, v51);
  v53 = (void *)*((_QWORD *)v3 + 14);
  *((_QWORD *)v3 + 14) = v52;

  v57 = objc_msgSend_copy(self->_repeatEverySeconds, v54, v55, v56);
  v58 = (void *)*((_QWORD *)v3 + 15);
  *((_QWORD *)v3 + 15) = v57;

  v62 = objc_msgSend_copy(self->_allowedRequestCount, v59, v60, v61);
  v63 = (void *)*((_QWORD *)v3 + 16);
  *((_QWORD *)v3 + 16) = v62;

  v67 = objc_msgSend_copy(self->_throttleStartDate, v64, v65, v66);
  v68 = (void *)*((_QWORD *)v3 + 13);
  *((_QWORD *)v3 + 13) = v67;

  v72 = objc_msgSend_copy(self->_expirationDate, v69, v70, v71);
  v73 = (void *)*((_QWORD *)v3 + 17);
  *((_QWORD *)v3 + 17) = v72;

  v77 = objc_msgSend_copy(self->_errorCode, v74, v75, v76);
  v78 = (void *)*((_QWORD *)v3 + 18);
  *((_QWORD *)v3 + 18) = v77;

  *((_QWORD *)v3 + 19) = self->_flags;
  objc_msgSend_sentRequestCount(self, v79, v80, v81);
  v82 = objc_claimAutoreleasedReturnValue();
  v83 = (void *)*((_QWORD *)v3 + 1);
  *((_QWORD *)v3 + 1) = v82;

  objc_msgSend_currentRequestWindowIndex(self, v84, v85, v86);
  v87 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = v87;

  return v3;
}

- (id)CKDeepCopy
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_copy(self, a2, v2, v3);
}

- (id)CKDeepCopyWithLeafNodeCopyBlock:(id)a3
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CKThrottle *v4;
  const char *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_encodeEntry_withCoder_(CKThrottleTable, v5, (uint64_t)v4, (uint64_t)v6);
  objc_sync_exit(v4);

}

- (CKThrottle)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CKThrottle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKThrottle;
  v6 = -[CKThrottle init](&v8, sel_init);
  if (v6)
    objc_msgSend_decodeEntry_withCoder_(CKThrottleTable, v5, (uint64_t)v6, (uint64_t)v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CKThrottle *v4;
  CKThrottle *v5;
  const char *v6;
  char HaveEqualProperties_other_includePrimaryKeys;

  v4 = (CKThrottle *)a3;
  if (v4 == self)
  {
    HaveEqualProperties_other_includePrimaryKeys = 1;
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    HaveEqualProperties_other_includePrimaryKeys = objc_msgSend_entriesHaveEqualProperties_other_includePrimaryKeys_(CKThrottleTable, v6, (uint64_t)v5, (uint64_t)v4, 0);
    objc_sync_exit(v5);

  }
  return HaveEqualProperties_other_includePrimaryKeys;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  objc_msgSend_throttleID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_hash(self->_label, v10, v11, v12) ^ v9;

  return v13;
}

- (NSString)description
{
  uint64_t v2;

  return (NSString *)objc_msgSend_descriptionOfEntry_(CKThrottleTable, a2, (uint64_t)self, v2);
}

- (void)setFlag:(unint64_t)a3
{
  self->_flags |= a3;
}

- (BOOL)isServerJSONThrottle
{
  return self->_flags & 1;
}

- (BOOL)isServerProtobufThrottle
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (id)throttleBlockingUntilNextRequestWindow
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSDate *throttleStartDate;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v5 = (void *)objc_msgSend_copy(self, a2, v2, v3);
  objc_msgSend_setAllowedRequestCount_(v5, v6, 0, v7);
  throttleStartDate = self->_throttleStartDate;
  objc_msgSend_delayUntilNextOperationAllowed(self, v9, v10, v11);
  objc_msgSend_dateByAddingTimeInterval_(throttleStartDate, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpirationDate_(v5, v16, (uint64_t)v15, v17);

  return v5;
}

- (BOOL)canTestInClientProcess
{
  return self->_operationType == 0;
}

- (double)delayUntilNextOperationAllowed
{
  uint64_t v2;
  uint64_t v3;
  double v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;
  unsigned int v20;
  CKThrottle *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  float v47;
  uint64_t v48;
  NSNumber *sentRequestCount;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSNumber *currentRequestWindowIndex;
  float v54;
  double v55;

  objc_msgSend_timeIntervalSinceNow(self->_expirationDate, a2, v2, v3);
  v6 = v5;
  v10 = objc_msgSend_unsignedIntValue(self->_allowedRequestCount, v7, v8, v9);
  v14 = objc_msgSend_unsignedIntValue(self->_repeatEverySeconds, v11, v12, v13);
  v18 = objc_msgSend_unsignedIntValue(self->_intervalLengthSeconds, v15, v16, v17);
  if (v10)
    v19 = 1;
  else
    v19 = v14 > v18;
  if (v19)
  {
    v20 = v18;
    v21 = self;
    objc_sync_enter(v21);
    v25 = objc_msgSend_unsignedIntValue(v21->_sentRequestCount, v22, v23, v24);
    v32 = 0.0;
    if (v25 >= objc_msgSend_unsignedIntValue(self->_allowedRequestCount, v26, v27, v28))
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], v29, v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v33;
      if (v14 <= v20)
        v14 = v20;
      objc_msgSend_timeIntervalSinceDate_(v33, v34, (uint64_t)v21->_throttleStartDate, v35);
      v38 = v37;
      v42 = objc_msgSend_unsignedIntValue(v21->_currentRequestWindowIndex, v39, v40, v41);
      v46 = (double)v14;
      v47 = v38 / (double)v14;
      v48 = vcvtms_u32_f32(v47);
      if (v48 != v42)
      {
        sentRequestCount = v21->_sentRequestCount;
        v21->_sentRequestCount = (NSNumber *)&unk_1E1FC4BF8;

        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v50, v48, v51);
        v52 = objc_claimAutoreleasedReturnValue();
        currentRequestWindowIndex = v21->_currentRequestWindowIndex;
        v21->_currentRequestWindowIndex = (NSNumber *)v52;

        if (v10)
          v6 = 0.0;
      }
      v54 = (double)v20
          + v46 * (double)objc_msgSend_unsignedIntValue(v21->_currentRequestWindowIndex, v43, v44, v45);
      v55 = v54 - v38;
      if (v55 < 0.0)
        v55 = 0.0;
      if (v55 >= v6)
        v32 = v6;
      else
        v32 = v55;

    }
    objc_sync_exit(v21);

    return v32;
  }
  return v6;
}

- (NSNumber)sentRequestCount
{
  CKThrottle *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sentRequestCount;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSentRequestCount:(id)a3
{
  NSNumber *v4;
  NSNumber *sentRequestCount;
  CKThrottle *obj;

  v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  sentRequestCount = obj->_sentRequestCount;
  obj->_sentRequestCount = v4;

  objc_sync_exit(obj);
}

- (void)incrementSentRequestCount
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSNumber *sentRequestCount;
  CKThrottle *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend_intValue(obj->_sentRequestCount, v3, v4, v5);
  objc_msgSend_numberWithInt_(v2, v7, (v6 + 1), v8);
  v9 = objc_claimAutoreleasedReturnValue();
  sentRequestCount = obj->_sentRequestCount;
  obj->_sentRequestCount = (NSNumber *)v9;

  objc_sync_exit(obj);
}

- (NSNumber)currentRequestWindowIndex
{
  CKThrottle *v2;
  NSNumber *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentRequestWindowIndex;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentRequestWindowIndex:(id)a3
{
  NSNumber *v4;
  NSNumber *currentRequestWindowIndex;
  CKThrottle *obj;

  v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentRequestWindowIndex = obj->_currentRequestWindowIndex;
  obj->_currentRequestWindowIndex = v4;

  objc_sync_exit(obj);
}

- (NSNumber)throttleID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setThrottleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(id)a3
{
  objc_storeStrong((id *)&self->_databaseScope, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_operationType, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)operationGroupNamePrefix
{
  return self->_operationGroupNamePrefix;
}

- (void)setOperationGroupNamePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)throttleStartDate
{
  return self->_throttleStartDate;
}

- (void)setThrottleStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_throttleStartDate, a3);
}

- (NSNumber)intervalLengthSeconds
{
  return self->_intervalLengthSeconds;
}

- (void)setIntervalLengthSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_intervalLengthSeconds, a3);
}

- (NSNumber)repeatEverySeconds
{
  return self->_repeatEverySeconds;
}

- (void)setRepeatEverySeconds:(id)a3
{
  objc_storeStrong((id *)&self->_repeatEverySeconds, a3);
}

- (NSNumber)allowedRequestCount
{
  return self->_allowedRequestCount;
}

- (void)setAllowedRequestCount:(id)a3
{
  objc_storeStrong((id *)&self->_allowedRequestCount, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_allowedRequestCount, 0);
  objc_storeStrong((id *)&self->_repeatEverySeconds, 0);
  objc_storeStrong((id *)&self->_intervalLengthSeconds, 0);
  objc_storeStrong((id *)&self->_throttleStartDate, 0);
  objc_storeStrong((id *)&self->_operationGroupNamePrefix, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_databaseScope, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_throttleID, 0);
  objc_storeStrong((id *)&self->_currentRequestWindowIndex, 0);
  objc_storeStrong((id *)&self->_sentRequestCount, 0);
}

@end
