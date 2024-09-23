@implementation CKShare

+ (void)initialize
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  sub_18A5CEF4C((uint64_t)a1, v3, 0, &unk_1E1FC4268, 0);
}

- (CKShare)initWithRootRecord:(CKRecord *)rootRecord
{
  CKRecord *v4;
  CKRecordID *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  CKShare *v21;

  v4 = rootRecord;
  v5 = [CKRecordID alloc];
  CKCreateGUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(CFSTR("Share-"), v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithRecordName_zoneID_(v5, v18, (uint64_t)v9, (uint64_t)v17);

  v21 = (CKShare *)objc_msgSend_initWithRootRecord_shareID_(self, v20, (uint64_t)v4, (uint64_t)v19);
  return v21;
}

- (CKShare)initWithRootRecord:(CKRecord *)rootRecord shareID:(CKRecordID *)shareID
{
  CKRecord *v6;
  CKRecordID *v7;
  CKShare *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKShare *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKReference *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CKRecordID *rootRecordID;
  objc_super v31;

  v6 = rootRecord;
  v7 = shareID;
  v31.receiver = self;
  v31.super_class = (Class)CKShare;
  v8 = -[CKRecord initWithRecordType:recordID:](&v31, sel_initWithRecordType_recordID_, CFSTR("cloudkit.share"), v7);
  v12 = v8;
  if (v8)
  {
    objc_msgSend__commonCKShareInit(v8, v9, v10, v11);
    objc_msgSend__addOwnerParticipant(v12, v13, v14, v15);
    if (v6)
    {
      v16 = [CKReference alloc];
      v18 = (void *)objc_msgSend_initWithRecordID_action_(v16, v17, (uint64_t)v7, 0);
      objc_msgSend_setShare_(v6, v19, (uint64_t)v18, v20);

      objc_msgSend_recordID(v6, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_copy(v24, v25, v26, v27);
      rootRecordID = v12->_rootRecordID;
      v12->_rootRecordID = (CKRecordID *)v28;

    }
  }

  return v12;
}

- (CKShare)initWithRecordZoneID:(CKRecordZoneID *)recordZoneID
{
  CKRecordZoneID *v4;
  CKRecordID *v5;
  const char *v6;
  void *v7;
  CKShare *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKShare *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v4 = recordZoneID;
  v5 = [CKRecordID alloc];
  v7 = (void *)objc_msgSend_initWithRecordName_zoneID_(v5, v6, (uint64_t)CFSTR("cloudkit.zoneshare"), (uint64_t)v4);

  v17.receiver = self;
  v17.super_class = (Class)CKShare;
  v8 = -[CKRecord initWithRecordType:recordID:](&v17, sel_initWithRecordType_recordID_, CFSTR("cloudkit.share"), v7);
  v12 = v8;
  if (v8)
  {
    objc_msgSend__commonCKShareInit(v8, v9, v10, v11);
    objc_msgSend__addOwnerParticipant(v12, v13, v14, v15);
  }

  return v12;
}

- (id)initInternalWithShareRecordID:(id)a3
{
  CKShare *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKShare *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKShare;
  v3 = -[CKRecord initWithRecordType:recordID:](&v9, sel_initWithRecordType_recordID_, CFSTR("cloudkit.share"), a3);
  v7 = v3;
  if (v3)
    objc_msgSend__commonCKShareInit(v3, v4, v5, v6);
  return v7;
}

- (CKShare)init
{
  CKException *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = [CKException alloc];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, (uint64_t)CFSTR("You must call -[%@ initWithRootRecord:shareID:]"), v4);

  objc_exception_throw(v6);
}

- (CKShare)initWithRecordType:(CKRecordType)recordType
{
  NSString *v3;
  CKException *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  id v8;

  v3 = recordType;
  v4 = [CKException alloc];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend_initWithCode_format_(v4, v7, 12, (uint64_t)CFSTR("You must call -[%@ initWithRootRecord:shareID:]"), v6);

  objc_exception_throw(v8);
}

- (CKShare)initWithRecordType:(CKRecordType)recordType recordID:(CKRecordID *)recordID
{
  NSString *v5;
  CKRecordID *v6;
  CKException *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  v5 = recordType;
  v6 = recordID;
  v7 = [CKException alloc];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_initWithCode_format_(v7, v10, 12, (uint64_t)CFSTR("You must call -[%@ initWithRootRecord:shareID:]"), v9);

  objc_exception_throw(v11);
}

- (CKShare)initWithRecordType:(CKRecordType)recordType zoneID:(CKRecordZoneID *)zoneID
{
  NSString *v5;
  CKRecordZoneID *v6;
  CKException *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  id v11;

  v5 = recordType;
  v6 = zoneID;
  v7 = [CKException alloc];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_initWithCode_format_(v7, v10, 12, (uint64_t)CFSTR("You must call -[%@ initWithRootRecord:shareID:]"), v9);

  objc_exception_throw(v11);
}

- (void)_addOwnerParticipant
{
  CKUserIdentity *v3;
  CKRecordID *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  CKShareParticipant *v10;
  const char *v11;
  uint64_t v12;
  void *inited;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  id v24;

  v3 = [CKUserIdentity alloc];
  v4 = [CKRecordID alloc];
  v7 = (void *)objc_msgSend_initWithRecordName_(v4, v5, (uint64_t)CFSTR("__defaultOwner__"), v6);
  v24 = (id)objc_msgSend_initWithUserRecordID_(v3, v8, (uint64_t)v7, v9);

  v10 = [CKShareParticipant alloc];
  inited = (void *)objc_msgSend_initInternalWithUserIdentity_(v10, v11, (uint64_t)v24, v12);
  objc_msgSend_setRole_(inited, v14, 1, v15);
  objc_msgSend_setPermission_(inited, v16, 3, v17);
  objc_msgSend_setIsCurrentUser_(inited, v18, 1, v19);
  objc_msgSend_setAcceptanceStatus_(inited, v20, 2, v21);
  objc_msgSend__addParticipantBypassingChecks_(self, v22, (uint64_t)inited, v23);

}

- (void)_commonCKShareInit
{
  NSMutableArray *v3;
  NSMutableArray *mutableAllParticipants;
  NSMutableArray *v5;
  NSMutableArray *mutableRequesters;
  NSMutableArray *v7;
  NSMutableArray *mutableApprovedRequesters;
  NSMutableArray *v9;
  NSMutableArray *mutableBlockedIdentities;
  NSMutableArray *v11;
  NSMutableArray *lastFetchedParticipants;
  NSMutableSet *v13;
  NSMutableSet *addedParticipantIDs;
  NSMutableSet *v15;
  NSMutableSet *removedParticipantIDs;

  self->_publicPermission = 1;
  v3 = (NSMutableArray *)objc_opt_new();
  mutableAllParticipants = self->_mutableAllParticipants;
  self->_mutableAllParticipants = v3;

  v5 = (NSMutableArray *)objc_opt_new();
  mutableRequesters = self->_mutableRequesters;
  self->_mutableRequesters = v5;

  v7 = (NSMutableArray *)objc_opt_new();
  mutableApprovedRequesters = self->_mutableApprovedRequesters;
  self->_mutableApprovedRequesters = v7;

  v9 = (NSMutableArray *)objc_opt_new();
  mutableBlockedIdentities = self->_mutableBlockedIdentities;
  self->_mutableBlockedIdentities = v9;

  self->_accessRequestsEnabled = 0;
  v11 = (NSMutableArray *)objc_opt_new();
  lastFetchedParticipants = self->_lastFetchedParticipants;
  self->_lastFetchedParticipants = v11;

  v13 = (NSMutableSet *)objc_opt_new();
  addedParticipantIDs = self->_addedParticipantIDs;
  self->_addedParticipantIDs = v13;

  v15 = (NSMutableSet *)objc_opt_new();
  removedParticipantIDs = self->_removedParticipantIDs;
  self->_removedParticipantIDs = v15;

  self->_participantVisibility = 0;
  self->_participantSelfRemovalBehavior = 0;
}

- (void)_removeNonOneTimeLinkPendingPrivateAndAdminParticipants
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_participants(self, a2, v2, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_copy(v5, v6, v7, v8);

  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v9);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend_role(v18, v12, v13, v14) == 3 || objc_msgSend_role(v18, v12, v13, v14) == 2)
          && (objc_msgSend_usesOneTimeURL(v18, v12, v13, v14) & 1) == 0
          && objc_msgSend_acceptanceStatus(v18, v12, v13, v14) == 1
          && (objc_msgSend_isCurrentUser(v18, v12, v13, v14) & 1) == 0)
        {
          objc_msgSend__removeParticipantBypassingChecks_(self, v12, (uint64_t)v18, v14);
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v15);
  }

}

- (void)_removeAllNonOneTimeLinkParticipants
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_participants(self, a2, v2, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_copy(v5, v6, v7, v8);

  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v9);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend_role(v18, v12, v13, v14) == 3
           || objc_msgSend_role(v18, v12, v13, v14) == 4
           || objc_msgSend_role(v18, v12, v13, v14) == 2)
          && (objc_msgSend_usesOneTimeURL(v18, v12, v13, v14) & 1) == 0
          && (objc_msgSend_isCurrentUser(v18, v12, v13, v14) & 1) == 0)
        {
          objc_msgSend__removeParticipantBypassingChecks_(self, v12, (uint64_t)v18, v14);
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v15);
  }

}

- (CKShareParticipantPermission)publicPermission
{
  CKShare *v2;
  CKShareParticipantPermission publicPermission;

  v2 = self;
  objc_sync_enter(v2);
  publicPermission = v2->_publicPermission;
  objc_sync_exit(v2);

  return publicPermission;
}

- (BOOL)isCurrentUserOwnerOrAdmin
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  objc_msgSend_currentUserParticipant(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
    v12 = objc_msgSend_role(v4, v5, v6, v7) == 1 || objc_msgSend_role(v8, v9, v10, v11) == 2;
  else
    v12 = 0;

  return v12;
}

- (void)setPublicPermission:(CKShareParticipantPermission)publicPermission
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CKException *v12;
  const char *v13;
  id v14;
  void *v15;
  const char *v16;
  CKShare *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_currentUserParticipant(obj, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_msgSend_isCurrentUserOwnerOrAdmin(obj, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)obj, CFSTR("CKShare.m"), 251, CFSTR("Only owners and admins may set the public permission of a share"));

  }
  if ((unint64_t)(publicPermission - 2) >= 3)
  {
    if (publicPermission == CKShareParticipantPermissionNone)
    {
      if ((obj->_publicPermission & 0xFFFFFFFFFFFFFFFELL) == 2)
        objc_msgSend__removeAllNonOneTimeLinkParticipants(obj, v8, v9, v10);
    }
    else if (publicPermission == CKShareParticipantPermissionUnknown)
    {
      v12 = [CKException alloc];
      v14 = (id)objc_msgSend_initWithCode_format_(v12, v13, 12, (uint64_t)CFSTR("You can't set a share's publicPermission to CKShareParticipantPermissionUnknown"));
      objc_exception_throw(v14);
    }
  }
  else
  {
    objc_msgSend__removeNonOneTimeLinkPendingPrivateAndAdminParticipants(obj, v8, v9, v10);
  }
  objc_msgSend__setPublicPermissionNoSideEffects_(obj, v8, publicPermission, v10);

  objc_sync_exit(obj);
}

- (void)_setPublicPermissionNoSideEffects:(int64_t)a3
{
  CKShare *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_publicPermission = a3;
  objc_sync_exit(obj);

}

- (void)setAllowsReadOnlyParticipantsToSeeEachOther:(BOOL)a3
{
  ((void (*)(CKShare *, char *, BOOL))MEMORY[0x1E0DE7D20])(self, sel_setParticipantVisibility_, !a3);
}

- (BOOL)allowsReadOnlyParticipantsToSeeEachOther
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_participantVisibility(self, a2, v2, v3) == 0;
}

- (void)setOneTimeURLMetadatasByParticipantID:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *oneTimeURLMetadatasByParticipantID;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v14, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_mutableCopy(v8, v9, v10, v11);
  oneTimeURLMetadatasByParticipantID = v4->_oneTimeURLMetadatasByParticipantID;
  v4->_oneTimeURLMetadatasByParticipantID = (NSMutableDictionary *)v12;

  objc_sync_exit(v4);
}

- (NSMutableDictionary)oneTimeURLMetadatasByParticipantID
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_CKDeepCopy(v2->_oneTimeURLMetadatasByParticipantID, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9);

  objc_sync_exit(v2);
  return (NSMutableDictionary *)v10;
}

- (id)copyWithZone:(_NSZone *)a3 userFields:(BOOL)a4
{
  _QWORD *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  CKShare *v45;
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
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
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
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  objc_super v212;

  v212.receiver = self;
  v212.super_class = (Class)CKShare;
  v5 = -[CKRecord copyWithZone:userFields:](&v212, sel_copyWithZone_userFields_, a3, a4);
  objc_msgSend_containerID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_copy(v9, v10, v11, v12);
  v14 = (void *)v5[1];
  v5[1] = v13;

  objc_msgSend_etag(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_copy(v18, v19, v20, v21);
  v23 = (void *)v5[2];
  v5[2] = v22;

  objc_msgSend_rootRecordID(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_copy(v27, v28, v29, v30);
  v32 = (void *)v5[49];
  v5[49] = v31;

  *((_BYTE *)v5 + 346) = objc_msgSend_allowsAnonymousPublicAccess(self, v33, v34, v35);
  v5[44] = objc_msgSend_publicPermission(self, v36, v37, v38);
  v5[46] = objc_msgSend_participantVisibility(self, v39, v40, v41);
  v5[47] = objc_msgSend_participantSelfRemovalBehavior(self, v42, v43, v44);
  v45 = self;
  objc_sync_enter(v45);
  objc_msgSend_mutableAllParticipants(v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_mutableCopy(v53, v54, v55, v56);
  v58 = (void *)v5[50];
  v5[50] = v57;

  objc_msgSend_lastFetchedParticipants(v45, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_mutableCopy(v66, v67, v68, v69);
  v71 = (void *)v5[51];
  v5[51] = v70;

  objc_msgSend_addedParticipantIDs(v45, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend_mutableCopy(v75, v76, v77, v78);
  v80 = (void *)v5[52];
  v5[52] = v79;

  objc_msgSend_removedParticipantIDs(v45, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend_mutableCopy(v84, v85, v86, v87);
  v89 = (void *)v5[53];
  v5[53] = v88;

  objc_msgSend_mutableRequesters(v45, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v93, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend_mutableCopy(v97, v98, v99, v100);
  v102 = (void *)v5[54];
  v5[54] = v101;

  objc_msgSend_mutableApprovedRequesters(v45, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v106, v107, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend_mutableCopy(v110, v111, v112, v113);
  v115 = (void *)v5[55];
  v5[55] = v114;

  objc_msgSend_mutableBlockedIdentities(v45, v116, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v119, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend_mutableCopy(v123, v124, v125, v126);
  v128 = (void *)v5[56];
  v5[56] = v127;

  objc_sync_exit(v45);
  *((_BYTE *)v5 + 344) = objc_msgSend_accessRequestsEnabled(v45, v129, v130, v131);
  objc_msgSend_invitedKeysToRemove(v45, v132, v133, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v135, v136, v137, v138);
  v139 = objc_claimAutoreleasedReturnValue();
  v140 = (void *)v5[45];
  v5[45] = v139;

  objc_msgSend_invitedProtectionData(v45, v141, v142, v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend_copy(v144, v145, v146, v147);
  v149 = (void *)v5[57];
  v5[57] = v148;

  objc_msgSend_invitedProtectionEtag(v45, v150, v151, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend_copy(v153, v154, v155, v156);
  v158 = (void *)v5[58];
  v5[58] = v157;

  objc_msgSend_previousInvitedProtectionEtag(v45, v159, v160, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend_copy(v162, v163, v164, v165);
  v167 = (void *)v5[59];
  v5[59] = v166;

  objc_msgSend_publicProtectionData(v45, v168, v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = objc_msgSend_copy(v171, v172, v173, v174);
  v176 = (void *)v5[60];
  v5[60] = v175;

  objc_msgSend_publicProtectionEtag(v45, v177, v178, v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = objc_msgSend_copy(v180, v181, v182, v183);
  v185 = (void *)v5[61];
  v5[61] = v184;

  objc_msgSend_previousPublicProtectionEtag(v45, v186, v187, v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = objc_msgSend_copy(v189, v190, v191, v192);
  v194 = (void *)v5[62];
  v5[62] = v193;

  *((_BYTE *)v5 + 347) = objc_msgSend_serializePersonalInfo(v45, v195, v196, v197);
  objc_msgSend_oneTimeURLMetadatasByParticipantID(v45, v198, v199, v200);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v201, v202, v203, v204);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = objc_msgSend_mutableCopy(v205, v206, v207, v208);
  v210 = (void *)v5[48];
  v5[48] = v209;

  return v5;
}

- (id)copyWithOriginalValues
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  int v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v70.receiver = self;
  v70.super_class = (Class)CKShare;
  v2 = -[CKRecord copyWithOriginalValues](&v70, sel_copyWithOriginalValues);
  objc_msgSend_removedParticipantIDs(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v6, v7, v8, v9);

  objc_msgSend_owner(v2, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantID(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_addedParticipantIDs(v2, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_containsObject_(v21, v22, (uint64_t)v17, v23);

  }
  else
  {
    v65 = 0;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend_mutableAllParticipants(v2, v18, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend_copy(v24, v25, v26, v27);

  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v66, (uint64_t)v71, 16);
  if (v30)
  {
    v34 = v30;
    v35 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v67 != v35)
          objc_enumerationMutation(v28);
        v37 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend_addedParticipantIDs(v2, v31, v32, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_participantID(v37, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_containsObject_(v38, v43, (uint64_t)v42, v44))
        {
          v48 = objc_msgSend_role(v37, v45, v46, v47);

          if (v48 == 1)
            continue;
          objc_msgSend_mutableAllParticipants(v2, v31, v32, v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v38, v49, (uint64_t)v37, v50);
        }
        else
        {

        }
      }
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v66, (uint64_t)v71, 16);
    }
    while (v34);
  }

  objc_msgSend_addedParticipantIDs(v2, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v54, v55, v56, v57);

  if (v65)
  {
    objc_msgSend_addedParticipantIDs(v2, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v61, v62, (uint64_t)v17, v63);

  }
  return v2;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  CKShare *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  objc_super v87;

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)CKShare;
  -[CKRecord CKDescribePropertiesUsing:](&v87, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_rootRecordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("rootRecordID"), (uint64_t)v8, 0);

  objc_msgSend_etag(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("etag"), (uint64_t)v13, 0);

  v18 = objc_msgSend_publicPermission(self, v15, v16, v17);
  CKStringFromParticipantPermission(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v20, (uint64_t)CFSTR("publicPermission"), (uint64_t)v19, 0);

  v24 = objc_msgSend_participantVisibility(self, v21, v22, v23);
  if (v24 > 3)
    objc_msgSend_addProperty_value_shouldRedact_(v4, v25, (uint64_t)CFSTR("participantVisibility"), (uint64_t)CFSTR("Unknown"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v4, v25, (uint64_t)CFSTR("participantVisibility"), (uint64_t)off_1E1F642A0[v24], 0);
  v29 = objc_msgSend_participantSelfRemovalBehavior(self, v26, v27, v28);
  if (v29 > 3)
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v30, (uint64_t)CFSTR("participantSelfRemovalBehavior"), (uint64_t)CFSTR("Unknown"), 0);
  else
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v30, (uint64_t)CFSTR("participantSelfRemovalBehavior"), (uint64_t)off_1E1F642C0[v29], 0);
  if (objc_msgSend_allowsAnonymousPublicAccess(self, v31, v32, v33))
    objc_msgSend_addProperty_value_shouldRedact_(v4, v34, (uint64_t)CFSTR("allowsAnonymousPublicAccess"), (uint64_t)CFSTR("true"), 0);
  objc_msgSend_baseToken(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v38, (uint64_t)CFSTR("baseToken"), (uint64_t)v37, 0);

  objc_msgSend_routingKey(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v43, (uint64_t)CFSTR("routingKey"), (uint64_t)v42, 0);

  objc_msgSend_mutableEncryptedPSK(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v48, (uint64_t)CFSTR("mutableEncryptedPSK"), (uint64_t)v47, 0);

  v49 = self;
  objc_sync_enter(v49);
  objc_msgSend_mutableAllParticipants(v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v53, v54, v55, v56))
    objc_msgSend_addProperty_value_shouldRedact_(v4, v57, (uint64_t)CFSTR("participants"), (uint64_t)v53, 0);
  objc_msgSend_mutableRequesters(v49, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v60, v61, v62, v63))
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v64, (uint64_t)CFSTR("requesters"), (uint64_t)v60, 0);
  objc_msgSend_mutableApprovedRequesters(v49, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v67, v68, v69, v70))
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v71, (uint64_t)CFSTR("approvedRequesters"), (uint64_t)v67, 0);
  objc_msgSend_mutableBlockedIdentities(v49, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v74, v75, v76, v77))
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v78, (uint64_t)CFSTR("blockedIdentities"), (uint64_t)v74, 0);
  if (objc_msgSend_accessRequestsEnabled(v49, v78, v79, v80))
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v81, (uint64_t)CFSTR("accessRequestsEnabled"), (uint64_t)CFSTR("true"), 0);
  else
    objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v81, (uint64_t)CFSTR("accessRequestsEnabled"), (uint64_t)CFSTR("false"), 0);

  objc_sync_exit(v49);
  objc_msgSend_currentUserParticipant(v49, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v86, (uint64_t)CFSTR("currentParticipant"), (uint64_t)v85, 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKShare *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKShare *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)hasEncryptedData
{
  return 1;
}

- (BOOL)hasPropertiesRequiringDecryption
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKShare;
  if (-[CKRecord hasPropertiesRequiringDecryption](&v12, sel_hasPropertiesRequiringDecryption))
    return 1;
  objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v7, v8, v9, v10) != 0;

  return v6;
}

- (BOOL)hasPropertiesRequiringEncryption
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKShare;
  if (-[CKRecord hasPropertiesRequiringEncryption](&v12, sel_hasPropertiesRequiringEncryption))
    return 1;
  objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v7, v8, v9, v10) != 0;

  return v6;
}

- (BOOL)hasModifiedPropertiesRequiringEncryption
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKShare;
  if (-[CKRecord hasModifiedPropertiesRequiringEncryption](&v12, sel_hasModifiedPropertiesRequiringEncryption))
    return 1;
  objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v7, v8, v9, v10) != 0;

  return v6;
}

- (BOOL)hasModifiedEncryptedData
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKShare;
  if (-[CKRecord hasModifiedEncryptedData](&v12, sel_hasModifiedEncryptedData))
    return 1;
  objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v7, v8, v9, v10) != 0;

  return v6;
}

- (BOOL)isZoneWideShare
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char isEqualToString;

  objc_msgSend_recordID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v8, v9, (uint64_t)CFSTR("cloudkit.zoneshare"), v10);

  return isEqualToString;
}

- (void)CKAssignToContainerWithID:(id)a3
{
  id v4;
  CKShare *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  objc_super v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v12.receiver = v5;
  v12.super_class = (Class)CKShare;
  -[CKRecord CKAssignToContainerWithID:](&v12, sel_CKAssignToContainerWithID_, v4);
  objc_msgSend_mutableAllParticipants(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAssignToContainerWithID_(v9, v10, (uint64_t)v4, v11);

  objc_sync_exit(v5);
}

- (id)allParticipants
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_mutableAllParticipants(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v6, v7, v8, v9);

  objc_sync_exit(v2);
  return v10;
}

- (void)setAllParticipants:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = (void *)objc_msgSend_mutableCopy(v11, v5, v6, v7);
  objc_msgSend_setMutableAllParticipants_(v4, v9, (uint64_t)v8, v10);

  objc_sync_exit(v4);
}

- (NSArray)participants
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_removedParticipantIDs(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mutableAllParticipants(v2, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v11, v12, v13))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_18A75F0AC;
    v21[3] = &unk_1E1F64088;
    v22 = v6;
    objc_msgSend_CKFilter_(v10, v17, (uint64_t)v21, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)objc_msgSend_copy(v10, v14, v15, v16);
  }

  objc_sync_exit(v2);
  return (NSArray *)v19;
}

- (NSArray)requesters
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v6 = (void *)objc_msgSend_copy(v2->_mutableRequesters, v3, v4, v5);
  objc_sync_exit(v2);

  return (NSArray *)v6;
}

- (void)setRequesters:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *mutableRequesters;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_mutableCopy(v10, v5, v6, v7);
  mutableRequesters = v4->_mutableRequesters;
  v4->_mutableRequesters = (NSMutableArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)approvedRequesters
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v6 = (void *)objc_msgSend_copy(v2->_mutableApprovedRequesters, v3, v4, v5);
  objc_sync_exit(v2);

  return (NSArray *)v6;
}

- (void)setApprovedRequesters:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *mutableApprovedRequesters;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_mutableCopy(v10, v5, v6, v7);
  mutableApprovedRequesters = v4->_mutableApprovedRequesters;
  v4->_mutableApprovedRequesters = (NSMutableArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)blockedIdentities
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v6 = (void *)objc_msgSend_copy(v2->_mutableBlockedIdentities, v3, v4, v5);
  objc_sync_exit(v2);

  return (NSArray *)v6;
}

- (void)setBlockedIdentities:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *mutableBlockedIdentities;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_mutableCopy(v10, v5, v6, v7);
  mutableBlockedIdentities = v4->_mutableBlockedIdentities;
  v4->_mutableBlockedIdentities = (NSMutableArray *)v8;

  objc_sync_exit(v4);
}

- (id)lookupInfosFromRequesters:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
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
  CKUserIdentityLookupInfo *v30;
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
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  CKUserIdentityLookupInfo *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  CKUserIdentityLookupInfo *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint8_t v101[16];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v8 = v3;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v102, (uint64_t)v106, 16);
  if (v10)
  {
    v14 = v10;
    v15 = *(_QWORD *)v103;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v103 != v15)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v16);
        objc_msgSend_userIdentity(v17, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lookupInfo(v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userRecordID(v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v30 = [CKUserIdentityLookupInfo alloc];
          objc_msgSend_userIdentity(v17, v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lookupInfo(v34, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_userRecordID(v38, v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend_initWithUserRecordID_(v30, v43, (uint64_t)v42, v44);
LABEL_12:
          v91 = (void *)v45;

          objc_msgSend_addObject_(v7, v92, (uint64_t)v91, v93);
          goto LABEL_13;
        }
        objc_msgSend_userIdentity(v17, v27, v28, v29);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lookupInfo(v46, v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_emailAddress(v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          v58 = [CKUserIdentityLookupInfo alloc];
          objc_msgSend_userIdentity(v17, v59, v60, v61);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lookupInfo(v34, v62, v63, v64);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_emailAddress(v38, v65, v66, v67);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend_initWithEmailAddress_(v58, v68, (uint64_t)v42, v69);
          goto LABEL_12;
        }
        objc_msgSend_userIdentity(v17, v55, v56, v57);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lookupInfo(v70, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_phoneNumber(v74, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (v78)
        {
          v79 = [CKUserIdentityLookupInfo alloc];
          objc_msgSend_userIdentity(v17, v80, v81, v82);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lookupInfo(v34, v83, v84, v85);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_phoneNumber(v38, v86, v87, v88);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend_initWithPhoneNumber_(v79, v89, (uint64_t)v42, v90);
          goto LABEL_12;
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v94 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v101 = 0;
          _os_log_error_impl(&dword_18A5C5000, v94, OS_LOG_TYPE_ERROR, "Cannot approve share requester without a user record ID, email address, or phone number.", v101, 2u);
        }
LABEL_13:
        ++v16;
      }
      while (v14 != v16);
      v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v102, (uint64_t)v106, 16);
      v14 = v95;
    }
    while (v95);
  }

  v99 = (void *)objc_msgSend_copy(v7, v96, v97, v98);
  return v99;
}

- (void)approveRequesters:(id)a3 inContainer:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_approveRequesters_inContainer_withPermission_asRole_completionHandler_, a3, a4);
}

- (void)approveRequesters:(id)a3 inContainer:(id)a4 withPermission:(int64_t)a5 asRole:(int64_t)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  CKFetchShareParticipantsOperation *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, void *);
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  int64_t v56;
  int64_t v57;
  id location;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  objc_msgSend_currentUserParticipant(self, v16, v17, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v19, v20, v21) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20, v21);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 555, CFSTR("Only owners and admins may approve share requesters"));

    if (!v13)
      goto LABEL_8;
  }
  else if (!v13)
  {
    goto LABEL_8;
  }
  v23 = objc_msgSend_count(v13, v19, v20, v21);
  if (v14 && v23)
  {
    objc_msgSend_lookupInfosFromRequesters_(self, v24, (uint64_t)v13, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = [CKFetchShareParticipantsOperation alloc];
    v30 = (void *)objc_msgSend_initWithUserIdentityLookupInfos_(v27, v28, (uint64_t)v26, v29);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v35 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = sub_18A75F91C;
    v54[3] = &unk_1E1F640B0;
    v56 = a5;
    v57 = a6;
    v36 = v34;
    v55 = v36;
    objc_msgSend_setPerShareParticipantCompletionBlock_(v30, v37, (uint64_t)v54, v38);
    v46 = v35;
    v47 = 3221225472;
    v48 = sub_18A75FA9C;
    v49 = &unk_1E1F640D8;
    objc_copyWeak(&v53, &location);
    v52 = v15;
    v39 = v36;
    v50 = v39;
    v51 = v13;
    objc_msgSend_setFetchShareParticipantsCompletionBlock_(v30, v40, (uint64_t)&v46, v41);
    objc_msgSend_addOperation_(v14, v42, (uint64_t)v30, v43, v46, v47, v48, v49);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);

    goto LABEL_10;
  }
LABEL_8:
  if (v15)
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
LABEL_10:

}

- (void)denyRequesters:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKShare *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a3;
  objc_msgSend_currentUserParticipant(self, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 613, CFSTR("Only owners and admins may deny share requesters"));

  }
  if (v20)
  {
    v15 = self;
    objc_sync_enter(v15);
    objc_msgSend_removeObjectsInArray_(v15->_mutableRequesters, v16, (uint64_t)v20, v17);
    objc_sync_exit(v15);

  }
}

- (void)_unblockIdentitiesReferencedByParticipant:(id)a3
{
  id v4;
  id v5;
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
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
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
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  CKShare *v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  CKShare *v94;
  void (**v95)(void *, void *);
  id v96;
  NSMutableArray *obj;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD aBlock[4];
  id v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  id v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v96 = a3;
  if (v96)
  {
    v94 = self;
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_18A760214;
    aBlock[3] = &unk_1E1F64100;
    v5 = v4;
    v104 = v5;
    v95 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend_userIdentity(v96, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userRecordID(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2](v95, v17);

    objc_msgSend_userIdentity(v96, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lookupInfo(v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emailAddress(v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2](v95, v29);

    objc_msgSend_userIdentity(v96, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lookupInfo(v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_phoneNumber(v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2](v95, v41);

    v98 = (void *)objc_opt_new();
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v93 = 448;
    obj = self->_mutableBlockedIdentities;
    v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v99, (uint64_t)v109, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v100 != v47)
            objc_enumerationMutation(obj);
          v49 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
          objc_msgSend_userIdentity(v49, v43, v44, v45, v93);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lookupInfo(v50, v51, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_userRecordID(v54, v55, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v58, v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_userIdentity(v49, v63, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lookupInfo(v66, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_emailAddress(v70, v71, v72, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_userIdentity(v49, v75, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lookupInfo(v78, v79, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_phoneNumber(v82, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62 && (objc_msgSend_containsObject_(v5, v87, (uint64_t)v62, v88) & 1) != 0
            || v74 && (objc_msgSend_containsObject_(v5, v87, (uint64_t)v74, v88) & 1) != 0
            || v86 && objc_msgSend_containsObject_(v5, v87, (uint64_t)v86, v88))
          {
            objc_msgSend_addObject_(v98, v87, (uint64_t)v49, v88);
          }

        }
        v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v99, (uint64_t)v109, 16);
      }
      while (v46);
    }

    v89 = v94;
    objc_sync_enter(v89);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v90 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v106 = v98;
      v107 = 2112;
      v108 = v96;
      _os_log_impl(&dword_18A5C5000, v90, OS_LOG_TYPE_DEFAULT, "Unblocking identities: %@ referenced by participant: %@", buf, 0x16u);
    }
    objc_msgSend_removeObjectsInArray_(*(void **)((char *)&v94->super.super.isa + v93), v91, (uint64_t)v98, v92, v93);
    objc_sync_exit(v89);

  }
}

- (int64_t)_indexForIdentity:(id)a3 matchingAnyInCollection:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
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
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  char isEqualToString;
  char v74;
  int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  id v80;
  void *v81;
  void *v82;
  void *v83;

  v5 = a3;
  v6 = a4;
  objc_msgSend_lookupInfo(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userRecordID(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v14, v15, v16, v17);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lookupInfo(v5, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emailAddress(v21, v22, v23, v24);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lookupInfo(v5, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phoneNumber(v28, v29, v30, v31);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v6, v32, v33, v34))
  {
    v80 = v5;
    v37 = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v6, v35, v37, v36, v80);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_userIdentity(v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lookupInfo(v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userRecordID(v46, v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_lookupInfo(v42, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_emailAddress(v58, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_lookupInfo(v42, v63, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_phoneNumber(v66, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        isEqualToString = 0;
        if (v83 && v54)
          isEqualToString = objc_msgSend_isEqualToString_(v83, v71, (uint64_t)v54, v72);
        v74 = 0;
        if (v82 && v62)
          v74 = objc_msgSend_isEqualToString_(v82, v71, (uint64_t)v62, v72);
        v75 = 0;
        if (v81 && v70)
          v75 = objc_msgSend_isEqualToString_(v81, v71, (uint64_t)v70, v72);
      }
      else
      {
        v74 = 0;
        v70 = 0;
        v62 = 0;
        v54 = 0;
        isEqualToString = 0;
        v75 = 0;
      }

      if ((isEqualToString & 1) != 0 || (v74 & 1) != 0 || v75)
        break;
      if (++v37 >= (unint64_t)objc_msgSend_count(v6, v76, v77, v78))
      {
        v37 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
    }
    v5 = v80;
  }
  else
  {
    v37 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v37;
}

- (BOOL)_existingParticipantReferencedByUserIdentities:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = a3;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend_participants(self, v7, v8, v9, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend__indexForIdentity_matchingAnyInCollection_(self, v15, v13, (uint64_t)v14);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v10)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)_existingRequestersForUserIdentities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v6);
        v13 = objc_msgSend__indexForIdentity_matchingAnyInCollection_(self, v9, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (uint64_t)self->_mutableRequesters, (_QWORD)v21);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_objectAtIndexedSubscript_(self->_mutableRequesters, v9, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_containsObject_(v5, v16, (uint64_t)v15, v17) & 1) == 0)
            objc_msgSend_addObject_(v5, v18, (uint64_t)v15, v19);

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)_userIdentityLookupInfoHasSingleIdentifier:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;

  if (!a3)
    return 0;
  v3 = a3;
  objc_msgSend_emailAddress(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_phoneNumber(v3, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 1;
  if (v7)
    v15 = 2;
  if (v11)
    v16 = v15;
  else
    v16 = v7 != 0;
  objc_msgSend_userRecordID(v3, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    return v16 + 1;
  else
    return v16;
}

- (BOOL)blockUserIdentities:(id)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  BOOL v16;
  CKShare *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  CKShareBlockedIdentity *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *mutableBlockedIdentities;
  uint64_t v32;
  NSMutableArray *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v45;
  const char *v46;
  id v47;
  void *v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  objc_msgSend_currentUserParticipant(self, v7, v8, v9);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v10, v11, v12) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v13, v12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 736, CFSTR("Only owners and admins may block."));

  }
  if (!v47)
    goto LABEL_25;
  if (!objc_msgSend__existingParticipantReferencedByUserIdentities_(self, v10, (uint64_t)v47, v12))
  {
    v17 = self;
    objc_sync_enter(v17);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v47;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v50, (uint64_t)v54, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v51 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          v23 = [CKShareBlockedIdentity alloc];
          v26 = (void *)objc_msgSend_initWithUserIdentity_(v23, v24, v22, v25);
          v29 = objc_msgSend__indexForIdentity_matchingAnyInCollection_(v17, v27, v22, (uint64_t)v17->_mutableBlockedIdentities);
          mutableBlockedIdentities = v17->_mutableBlockedIdentities;
          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!mutableBlockedIdentities)
            {
              v32 = objc_opt_new();
              v33 = v17->_mutableBlockedIdentities;
              v17->_mutableBlockedIdentities = (NSMutableArray *)v32;

              mutableBlockedIdentities = v17->_mutableBlockedIdentities;
            }
            objc_msgSend_addObject_(mutableBlockedIdentities, v28, (uint64_t)v26, v30);
          }
          else
          {
            objc_msgSend_replaceObjectAtIndex_withObject_(mutableBlockedIdentities, v28, v29, (uint64_t)v26);
          }

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v50, (uint64_t)v54, 16);
      }
      while (v19);
    }

    v38 = (void *)objc_msgSend_copy(obj, v35, v36, v37);
    objc_msgSend__existingRequestersForUserIdentities_(v17, v39, (uint64_t)v38, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_removeObjectsInArray_(v17->_mutableRequesters, v42, (uint64_t)v41, v43);
    objc_sync_exit(v17);

LABEL_25:
    v16 = 1;
    goto LABEL_26;
  }
  if (a4)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v47;
      _os_log_error_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_ERROR, "Existing share participant referenced by user identities: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v15, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Cannot block an identity referenced by an existing share participant."));
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_26:

  return v16;
}

- (BOOL)blockRequesters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  char v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v10)
  {
    v14 = v10;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v8);
        objc_msgSend_userIdentity(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v16), v11, v12, v13, (_QWORD)v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v7, v18, (uint64_t)v17, v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }

  v23 = (void *)objc_msgSend_copy(v7, v20, v21, v22);
  v25 = objc_msgSend_blockUserIdentities_error_(self, v24, (uint64_t)v23, (uint64_t)a4);

  return v25;
}

- (BOOL)blockUserIdentityLookupInfos:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  CKUserIdentity *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *inited;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  char v33;
  NSObject *v35;
  CKException *v36;
  const char *v37;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = (id)objc_msgSend_copy(v5, v7, v8, v9);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v40, (uint64_t)v46, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v10);
        v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        if ((objc_msgSend__userIdentityLookupInfoHasSingleIdentifier_(self, v13, v18, v14) & 1) == 0)
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v35 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v18;
            _os_log_fault_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_FAULT, "Multiple identifiers found on lookup info: %@", buf, 0xCu);
          }
          v36 = [CKException alloc];
          v38 = (id)objc_msgSend_initWithCode_format_(v36, v37, 12, (uint64_t)CFSTR("You cannot block a user identity lookup info with multiple identifiers."));
          objc_exception_throw(v38);
        }
        v19 = [CKUserIdentity alloc];
        inited = (void *)objc_msgSend_initInternal(v19, v20, v21, v22);
        objc_msgSend_setLookupInfo_(inited, v24, v18, v25);
        objc_msgSend_addObject_(v6, v26, (uint64_t)inited, v27);

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v40, (uint64_t)v46, 16);
    }
    while (v15);
  }

  v31 = (void *)objc_msgSend_copy(v6, v28, v29, v30);
  v33 = objc_msgSend_blockUserIdentities_error_(self, v32, (uint64_t)v31, (uint64_t)a4);

  return v33;
}

- (void)unblockIdentities:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableArray *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  id obj;
  CKShare *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  objc_msgSend_currentUserParticipant(self, v5, v6, v7);
  v31 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v31;
  if (v31 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 804, CFSTR("Only owners and admins may unblock users"));

    v11 = (void *)v31;
  }
  if (v32 && objc_msgSend_count(v32, v8, v9, v10))
  {
    v34 = self;
    objc_sync_enter(v34);
    v12 = (void *)objc_opt_new();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v32;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v39, (uint64_t)v44, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v18 = v34->_mutableBlockedIdentities;
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v35, (uint64_t)v43, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v36 != v23)
                  objc_enumerationMutation(v18);
                v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
                if (objc_msgSend_isEqual_(v17, v20, v25, v21, v31))
                  objc_msgSend_addObject_(v12, v20, v25, v21);
              }
              v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v35, (uint64_t)v43, 16);
            }
            while (v22);
          }

        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v39, (uint64_t)v44, 16);
      }
      while (v14);
    }

    objc_msgSend_removeObjectsInArray_(v34->_mutableBlockedIdentities, v27, (uint64_t)v12, v28);
    objc_sync_exit(v34);

    v11 = (void *)v31;
  }

}

- (void)enableAccessRequests:(BOOL)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKShare *v13;
  void *v14;
  const char *v15;
  id v16;

  objc_msgSend_currentUserParticipant(self, a2, a3, v3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v7, v8, v9) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 825, CFSTR("Only owners and admins may set deny access requests."));

  }
  v13 = self;
  objc_sync_enter(v13);
  v13->_accessRequestsEnabled = a3;
  objc_sync_exit(v13);

}

- (void)clearModifiedParticipants
{
  CKShare *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_recordID(v2, v4, v5, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v21;
    _os_log_debug_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_DEBUG, "Clearing modified participants on share %@", (uint8_t *)&v22, 0xCu);

  }
  objc_msgSend_addedParticipantIDs(v2, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v10, v11, v12, v13);

  objc_msgSend_removedParticipantIDs(v2, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v17, v18, v19, v20);

  objc_sync_exit(v2);
}

- (NSArray)invitedKeysToRemove
{
  CKShare *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_invitedKeysToRemove;
  objc_sync_exit(v2);

  return v3;
}

- (void)setInvitedKeysToRemove:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *invitedKeysToRemove;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  invitedKeysToRemove = v4->_invitedKeysToRemove;
  v4->_invitedKeysToRemove = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (CKShareParticipant)owner
{
  CKShare *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend_mutableAllParticipants(v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v13)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
      if (objc_msgSend_role(v15, v9, v10, v11) == 1)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v23, (uint64_t)v27, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v21 = v15;

    if (!v21)
      goto LABEL_10;
  }
  else
  {
LABEL_9:

LABEL_10:
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)v3, CFSTR("CKShare.m"), 861, CFSTR("You should never have a share without an owner"));

    v21 = 0;
  }
  objc_sync_exit(v3);

  return (CKShareParticipant *)v21;
}

- (id)_knownParticipantWithParticipantID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  char isEqualToString;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_participants(self, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend_participantID(v16, v10, v11, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v4, v18, (uint64_t)v17, v19);

        if ((isEqualToString & 1) != 0)
        {
          v13 = v16;
          goto LABEL_11;
        }
      }
      v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  return v13;
}

- (id)_knownParticipantEqualToParticipant:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = a3;
  objc_msgSend_participants(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__knownParticipantEqualToParticipant_inParticipants_(self, v9, (uint64_t)v4, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_knownParticipantEqualToParticipant:(id)a3 inParticipants:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(void *, void *);
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
  id v19;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
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
  char isEqual;
  id obj;
  uint64_t v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD aBlock[4];
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = sub_18A761AF0;
    v66 = sub_18A761B00;
    v67 = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = sub_18A761AF0;
    v60 = sub_18A761B00;
    v61 = v6;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_18A761B08;
    aBlock[3] = &unk_1E1F64150;
    v54 = &v56;
    v47 = v5;
    v53 = v47;
    v55 = &v62;
    v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    v8[2](v8, &unk_1E1F58698);
    v9 = (void *)v63[5];
    if (v9)
      goto LABEL_8;
    v8[2](v8, &unk_1E1F58CD8);
    v10 = (void *)v63[5];
    v63[5] = 0;

    v8[2](v8, &unk_1E1F64190);
    v9 = (void *)v63[5];
    if (v9)
      goto LABEL_8;
    objc_msgSend_userIdentity(v47, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_publicSharingKey(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v8[2](v8, &unk_1E1F641B0);
    v9 = (void *)v63[5];
    if (v9 || (v8[2](v8, &unk_1E1F641D0), (v9 = (void *)v63[5]) != 0))
    {
LABEL_8:
      v19 = v9;
    }
    else
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = (id)v57[5];
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v48, (uint64_t)v68, 16);
      if (v22)
      {
        v46 = *(_QWORD *)v49;
        while (2)
        {
          v45 = v22;
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v49 != v46)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend_userIdentity(v47, v23, v24, v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lookupInfo(v28, v29, v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_userIdentity(v27, v33, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lookupInfo(v36, v37, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            isEqual = objc_msgSend_isEqual_(v32, v41, (uint64_t)v40, v42);

            if ((isEqual & 1) != 0)
            {
              v19 = v27;

              goto LABEL_9;
            }
          }
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v48, (uint64_t)v68, 16);
          if (v22)
            continue;
          break;
        }
      }

      v19 = 0;
    }
LABEL_9:

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v62, 8);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)addParticipant:(CKShareParticipant *)participant
{
  CKShareParticipant *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  CKShareParticipant *v32;

  v5 = participant;
  v32 = v5;
  if (v5)
  {
    v9 = objc_msgSend_role(v5, v6, v7, v8);
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 953, CFSTR("You cannot add a nil participant"));

    v9 = objc_msgSend_role(0, v23, v24, v25);
  }
  if (v9 != 3 && objc_msgSend_role(v32, v10, v11, v12) != 2)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 956, CFSTR("You can only add PrivateUsers as participants on a share"));

  }
  objc_msgSend_currentUserParticipant(self, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v13, v14, v15) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 960, CFSTR("Only owners may add participants to a share"));

  }
  if (objc_msgSend_usesOneTimeURL(v32, v13, v14, v15)
    && (objc_msgSend_isZoneWideShare(self, v17, v18, v19) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v20, v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 963, CFSTR("One-time URL participants can only be added to zone-wide shares"));

  }
  objc_msgSend__addParticipantBypassingChecks_(self, v17, (uint64_t)v32, v19);

}

- (void)_addParticipantBypassingChecks:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  char isEqual;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  CKException *v81;
  const char *v82;
  id v83;
  id v84;

  v84 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v84)
  {
    objc_msgSend__knownParticipantEqualToParticipant_(v4, v5, (uint64_t)v84, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    if (v7)
    {
      if (objc_msgSend_acceptanceStatus(v7, v8, v9, v10) != 2)
      {
        v15 = objc_msgSend_role(v84, v12, v13, v14);
        objc_msgSend_setRole_(v11, v16, v15, v17);
        v21 = objc_msgSend_permission(v84, v18, v19, v20);
        objc_msgSend_setPermission_(v11, v22, v21, v23);
      }
    }
    else
    {
      objc_msgSend_recordID(v4, v8, v9, v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareRecordID(v84, v25, v26, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_msgSend_shareRecordID(v84, v28, v29, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v32, v33, (uint64_t)v24, v34);

        if ((isEqual & 1) == 0)
        {
          v81 = [CKException alloc];
          v83 = (id)objc_msgSend_initWithCode_format_(v81, v82, 12, (uint64_t)CFSTR("You can't move participants between shares. Create a new participant to add to this share"));
          objc_exception_throw(v83);
        }
      }
      objc_msgSend_setShareRecordID_(v84, v28, (uint64_t)v24, v30);
      objc_msgSend__unblockIdentitiesReferencedByParticipant_(v4, v36, (uint64_t)v84, v37);
      objc_msgSend_removedParticipantIDs(v4, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_participantID(v84, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_containsObject_(v41, v46, (uint64_t)v45, v47);

      if (v48)
      {
        objc_msgSend_mutableAllParticipants(v4, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__knownParticipantEqualToParticipant_inParticipants_(v4, v53, (uint64_t)v84, (uint64_t)v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          objc_msgSend_mutableAllParticipants(v4, v55, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v58, v59, (uint64_t)v54, v60);

        }
        objc_msgSend_removedParticipantIDs(v4, v55, v56, v57);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_participantID(v84, v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v61, v66, (uint64_t)v65, v67);

      }
      objc_msgSend_mutableAllParticipants(v4, v49, v50, v51);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v68, v69, (uint64_t)v84, v70);

      objc_msgSend_addedParticipantIDs(v4, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_participantID(v84, v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v74, v79, (uint64_t)v78, v80);

    }
  }
  objc_sync_exit(v4);

}

- (void)removeParticipant:(CKShareParticipant *)participant
{
  CKShareParticipant *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  char isEqual;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  CKException *v40;
  const char *v41;
  void *v42;
  CKException *v43;
  const char *v44;
  CKException *v45;
  const char *v46;
  CKShareParticipant *v47;

  v5 = participant;
  if (v5)
  {
    v47 = v5;
    objc_msgSend_shareRecordID(v5, v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_4;
    v13 = (void *)v9;
    objc_msgSend_shareRecordID(v47, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v14, v19, (uint64_t)v18, v20);

    if ((isEqual & 1) == 0)
    {
      v40 = [CKException alloc];
      v42 = (void *)objc_msgSend_initWithCode_format_(v40, v41, 12, (uint64_t)CFSTR("You can't move participants between shares. Create a new participant to add to this share"));
    }
    else
    {
LABEL_4:
      objc_msgSend__knownParticipantEqualToParticipant_(self, v10, (uint64_t)v47, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v22;
      if (!v22)
      {
LABEL_11:

        v5 = v47;
        goto LABEL_12;
      }
      if (objc_msgSend_role(v22, v23, v24, v25) == 1)
      {
        v43 = [CKException alloc];
        v42 = (void *)objc_msgSend_initWithCode_format_(v43, v44, 12, (uint64_t)CFSTR("You cannot remove the owner from a share"));
      }
      else
      {
        if (!objc_msgSend_isCurrentUser(v26, v27, v28, v29))
        {
          objc_msgSend_currentUserParticipant(self, v30, v31, v32);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36 && (objc_msgSend_isCurrentUserOwnerOrAdmin(self, v33, v34, v35) & 1) == 0)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v33, v37, v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, (uint64_t)self, CFSTR("CKShare.m"), 1028, CFSTR("Only owners may remove participants from a share"));

          }
          objc_msgSend__removeParticipantBypassingChecks_(self, v33, (uint64_t)v47, v35);

          goto LABEL_11;
        }
        v45 = [CKException alloc];
        v42 = (void *)objc_msgSend_initWithCode_format_(v45, v46, 12, (uint64_t)CFSTR("You cannot remove yourself as a participant on the share.  Delete the share instead if you want out."));
      }
    }
    objc_exception_throw(v42);
  }
LABEL_12:

}

- (void)_removeParticipantBypassingChecks:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
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
  const char *v38;
  uint64_t v39;
  id v40;

  v40 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend__knownParticipantEqualToParticipant_(v4, v5, (uint64_t)v40, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_addedParticipantIDs(v4, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantID(v10, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_containsObject_(v11, v16, (uint64_t)v15, v17);

    if (v18)
    {
      objc_msgSend_mutableAllParticipants(v4, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObject_(v22, v23, (uint64_t)v10, v24);

      objc_msgSend_addedParticipantIDs(v4, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_participantID(v10, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObject_(v28, v33, (uint64_t)v32, v34);
    }
    else
    {
      objc_msgSend_removedParticipantIDs(v4, v19, v20, v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_participantID(v10, v35, v36, v37);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v28, v38, (uint64_t)v32, v39);
    }

  }
  objc_sync_exit(v4);

}

- (id)addedParticipants
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_mutableAllParticipants(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A762648;
  v11[3] = &unk_1E1F64088;
  v11[4] = v2;
  objc_msgSend_CKFilter_(v6, v7, (uint64_t)v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v9;
}

- (id)removedParticipants
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_mutableAllParticipants(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A762760;
  v11[3] = &unk_1E1F64088;
  v11[4] = v2;
  objc_msgSend_CKFilter_(v6, v7, (uint64_t)v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v9;
}

- (CKShareParticipant)currentUserParticipant
{
  CKShare *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend_mutableAllParticipants(v2, v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend_isCurrentUser(v14, v8, v9, v10) & 1) != 0)
        {
          v11 = v14;
          goto LABEL_11;
        }
      }
      v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v16, (uint64_t)v20, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return (CKShareParticipant *)v11;
}

- (BOOL)_participantArray:(id)a3 containsEquivalentWithPermissionsParticipant:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v5;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend_isEqual_(v14, v9, (uint64_t)v6, v10, (_QWORD)v24)
          && (v18 = objc_msgSend_acceptanceStatus(v14, v15, v16, v17),
              v18 == objc_msgSend_acceptanceStatus(v6, v19, v20, v21))
          || objc_msgSend_role(v6, v15, v16, v17) == 1 && objc_msgSend_role(v14, v9, v22, v10) == 1)
        {
          LOBYTE(v11) = 1;
          goto LABEL_14;
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v24, (uint64_t)v28, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_14:

  return v11;
}

- (BOOL)_participantArray:(id)a3 isEquivalentToArray:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  const char *v22;
  char v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  v11 = objc_msgSend_count(v6, v8, v9, v10);
  if (v11 == objc_msgSend_count(v7, v12, v13, v14))
  {
    if (objc_msgSend_count(v6, v15, v16, v17))
    {
      v20 = 0;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v6, v18, v20, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend__participantArray_containsEquivalentWithPermissionsParticipant_(self, v22, (uint64_t)v7, (uint64_t)v21);

        if ((v23 & 1) == 0)
          break;
        ++v20;
      }
      while (v20 < objc_msgSend_count(v6, v24, v25, v26));
    }
    else
    {
      v23 = 1;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)resetFetchedParticipants
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  CKShare *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastFetchedParticipants_(obj, v6, (uint64_t)v5, v7);

  objc_sync_exit(obj);
}

- (void)registerFetchedParticipant:(id)a3
{
  CKShare *v4;
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
  id v15;

  v15 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_lastFetchedParticipants(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v15, v9, v10, v11);
  objc_msgSend_addObject_(v8, v13, (uint64_t)v12, v14);

  objc_sync_exit(v4);
}

- (id)updateFromServerShare:(id)a3
{
  id v4;
  CKShare *v5;
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
  uint64_t v16;
  void *v17;
  const char *v18;
  int isEquivalentToArray;
  const char *v20;
  int v21;
  const char *v22;
  int v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CKShare *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  id v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
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
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  id v143;
  CKShare *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  void *v159;
  NSObject *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _BYTE v179[128];
  _BYTE v180[128];
  uint8_t v181[128];
  uint8_t buf[4];
  void *v183;
  __int16 v184;
  void *v185;
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_lastFetchedParticipants(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participants(v5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participants(v4, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEquivalentToArray = objc_msgSend__participantArray_isEquivalentToArray_(v5, v18, (uint64_t)v17, (uint64_t)v9);
  v21 = objc_msgSend__participantArray_isEquivalentToArray_(v5, v20, (uint64_t)v13, (uint64_t)v9);
  v23 = objc_msgSend__participantArray_isEquivalentToArray_(v5, v22, (uint64_t)v13, (uint64_t)v17);

  objc_sync_exit(v5);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v24 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v159 = (void *)MEMORY[0x1E0CB37E8];
    v160 = v24;
    objc_msgSend_numberWithBool_(v159, v161, v21 ^ 1u, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v164, isEquivalentToArray ^ 1u, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v183 = v163;
    v184 = 2112;
    v185 = v166;
    _os_log_debug_impl(&dword_18A5C5000, v160, OS_LOG_TYPE_DEBUG, "Updating local share from a remote share, client participants changed: %@, server participants changed: %@", buf, 0x16u);

  }
  if ((isEquivalentToArray & 1) == 0)
  {
    if (((v21 | v23) & 1) == 0)
    {
      v139 = (void *)objc_opt_new();
      v143 = v4;
      v144 = v5;
      v151 = (void *)objc_msgSend_copyWithOriginalValues(v144, v145, v146, v147);
      if (v151)
        objc_msgSend_setObject_forKeyedSubscript_(v139, v148, (uint64_t)v151, (uint64_t)CFSTR("AncestorRecord"));
      if (v143)
        objc_msgSend_setObject_forKeyedSubscript_(v139, v148, (uint64_t)v143, (uint64_t)CFSTR("ServerRecord"));
      if (v144)
        objc_msgSend_setObject_forKeyedSubscript_(v139, v148, (uint64_t)v144, (uint64_t)CFSTR("ClientRecord"));
      objc_msgSend_participants(v144, v148, v149, v150);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_participants(v143, v153, v154, v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v157, (uint64_t)CFSTR("CKInternalErrorDomain"), 1022, v139, CFSTR("Participants conflict while trying to update share from the server. Participants:\n=== Client: %@\n=== Server: %@"), v152, v156);
      v142 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_51;
    }
    objc_msgSend_addedParticipants(v5, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removedParticipants(v5, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v5;
    objc_sync_enter(v33);
    objc_msgSend_participants(v4, v34, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v37;
    v41 = MEMORY[0x1E0C9AA60];
    if (v37)
      objc_msgSend_setAllParticipants_(v33, v38, v37, v39);
    else
      objc_msgSend_setAllParticipants_(v33, v38, MEMORY[0x1E0C9AA60], v39);

    objc_msgSend_resetFetchedParticipants(v33, v42, v43, v44);
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    objc_msgSend_mutableAllParticipants(v33, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v175, (uint64_t)v181, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v176;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v176 != v53)
            objc_enumerationMutation(v48);
          objc_msgSend_registerFetchedParticipant_(v33, v50, *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * i), v51);
        }
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v175, (uint64_t)v181, 16);
      }
      while (v52);
    }

    objc_msgSend_requesters(v4, v55, v56, v57);
    v58 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)v58;
    if (v58)
      objc_msgSend_setRequesters_(v33, v59, v58, v60);
    else
      objc_msgSend_setRequesters_(v33, v59, v41, v60);

    objc_msgSend_approvedRequesters(v4, v62, v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
    v68 = (void *)v65;
    if (v65)
      objc_msgSend_setApprovedRequesters_(v33, v66, v65, v67);
    else
      objc_msgSend_setApprovedRequesters_(v33, v66, v41, v67);

    objc_msgSend_blockedIdentities(v4, v69, v70, v71);
    v72 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)v72;
    if (v72)
      objc_msgSend_setBlockedIdentities_(v33, v73, v72, v74);
    else
      objc_msgSend_setBlockedIdentities_(v33, v73, v41, v74);

    v79 = objc_msgSend_accessRequestsEnabled(v4, v76, v77, v78);
    objc_msgSend_setAccessRequestsEnabled_(v33, v80, v79, v81);
    objc_sync_exit(v33);

    objc_msgSend_clearModifiedParticipants(v33, v82, v83, v84);
    v173 = 0u;
    v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    v85 = v28;
    v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v171, (uint64_t)v180, 16);
    if (v89)
    {
      v90 = *(_QWORD *)v172;
      do
      {
        for (j = 0; j != v89; ++j)
        {
          if (*(_QWORD *)v172 != v90)
            objc_enumerationMutation(v85);
          objc_msgSend__addParticipantBypassingChecks_(v33, v87, *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * j), v88);
        }
        v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v87, (uint64_t)&v171, (uint64_t)v180, 16);
      }
      while (v89);
    }

    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v92 = v32;
    v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v167, (uint64_t)v179, 16);
    if (v96)
    {
      v97 = *(_QWORD *)v168;
      do
      {
        for (k = 0; k != v96; ++k)
        {
          if (*(_QWORD *)v168 != v97)
            objc_enumerationMutation(v92);
          objc_msgSend__removeParticipantBypassingChecks_(v33, v94, *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * k), v95);
        }
        v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v94, (uint64_t)&v167, (uint64_t)v179, 16);
      }
      while (v96);
    }

  }
  objc_msgSend_invitedProtectionData(v4, v25, v26, v27);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvitedProtectionData_(v5, v100, (uint64_t)v99, v101);

  objc_msgSend_invitedProtectionEtag(v4, v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvitedProtectionEtag_(v5, v106, (uint64_t)v105, v107);

  objc_msgSend_publicProtectionData(v4, v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicProtectionData_(v5, v112, (uint64_t)v111, v113);

  objc_msgSend_publicProtectionEtag(v4, v114, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPublicProtectionEtag_(v5, v118, (uint64_t)v117, v119);

  objc_msgSend_etag(v4, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEtag_(v5, v124, (uint64_t)v123, v125);

  objc_msgSend_routingKey(v4, v126, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoutingKey_(v5, v130, (uint64_t)v129, v131);

  objc_msgSend_displayedHostname(v4, v132, v133, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  if (v135)
  {
    objc_msgSend_displayedHostname(v4, v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayedHostname_(v5, v140, (uint64_t)v139, v141);
    v142 = 0;
LABEL_51:

    goto LABEL_52;
  }
  v142 = 0;
LABEL_52:

  return v142;
}

- (void)updateWithSavedRecordXPCMetadata:(id)a3 shouldOnlySaveAssetContent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CKShare *v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  uint64_t v78;

  v4 = a4;
  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v76.receiver = self;
  v76.super_class = (Class)CKShare;
  -[CKRecord updateWithSavedRecordXPCMetadata:shouldOnlySaveAssetContent:](&v76, sel_updateWithSavedRecordXPCMetadata_shouldOnlySaveAssetContent_, v6, v4);
  objc_msgSend_serverRecord(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = self;
    objc_sync_enter(v11);
    v12 = v10;
    objc_sync_enter(v12);
    v13 = v12;
    objc_msgSend_mutableAllParticipants(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAllParticipants_(v11, v18, (uint64_t)v17, v19);

    objc_msgSend_mutableRequesters(v13, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequesters_(v11, v24, (uint64_t)v23, v25);

    objc_msgSend_mutableApprovedRequesters(v13, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setApprovedRequesters_(v11, v30, (uint64_t)v29, v31);

    objc_msgSend_mutableBlockedIdentities(v13, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBlockedIdentities_(v11, v36, (uint64_t)v35, v37);

    v41 = objc_msgSend_accessRequestsEnabled(v13, v38, v39, v40);
    objc_msgSend_setAccessRequestsEnabled_(v11, v42, v41, v43);
    objc_msgSend_resetFetchedParticipants(v11, v44, v45, v46);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    objc_msgSend_mutableAllParticipants(v13, v47, v48, v49, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v72, (uint64_t)v77, 16);
    if (v54)
    {
      v55 = *(_QWORD *)v73;
      do
      {
        v56 = 0;
        do
        {
          if (*(_QWORD *)v73 != v55)
            objc_enumerationMutation(v50);
          objc_msgSend_registerFetchedParticipant_(v11, v52, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v56++), v53);
        }
        while (v54 != v56);
        v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v52, (uint64_t)&v72, (uint64_t)v77, 16);
      }
      while (v54);
    }

    objc_msgSend_clearModifiedParticipants(v11, v57, v58, v59);
    objc_msgSend_publicSharingIdentity(v13, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicSharingIdentity_(v11, v64, (uint64_t)v63, v65);

    objc_msgSend_oneTimeURLMetadatasByParticipantID(v13, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOneTimeURLMetadatasByParticipantID_(v11, v70, (uint64_t)v69, v71);

    objc_sync_exit(v13);
    objc_sync_exit(v11);

  }
}

- (void)_addParticipantEmails:(id)a3 phoneNumbers:(id)a4 asReadWrite:(BOOL)a5 inContainer:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  CKFetchShareParticipantsOperation *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  id v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  id v52;
  _QWORD v53[5];
  BOOL v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = a4;
  objc_msgSend_lookupInfosWithEmails_(CKUserIdentityLookupInfo, v15, (uint64_t)a3, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v19 = (void *)MEMORY[0x1E0C9AA60];
  if (v17)
    v20 = (void *)v17;
  else
    v20 = (void *)MEMORY[0x1E0C9AA60];
  v21 = v20;

  objc_msgSend_lookupInfosWithPhoneNumbers_(CKUserIdentityLookupInfo, v22, (uint64_t)v14, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    v25 = v24;
  else
    v25 = v19;
  v26 = v25;

  objc_msgSend_arrayByAddingObjectsFromArray_(v21, v27, (uint64_t)v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = [CKFetchShareParticipantsOperation alloc];
  v33 = (void *)objc_msgSend_initWithUserIdentityLookupInfos_(v30, v31, (uint64_t)v29, v32);
  objc_msgSend_resolvedConfiguration(v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestOriginator_(v37, v38, 5, v39);

  v40 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = sub_18A763840;
  v53[3] = &unk_1E1F641F8;
  v54 = a5;
  v53[4] = self;
  objc_msgSend_setPerShareParticipantCompletionBlock_(v33, v41, (uint64_t)v53, v42);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v43 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v29;
    _os_log_debug_impl(&dword_18A5C5000, v43, OS_LOG_TYPE_DEBUG, "Fetching share participants for UI: %@", buf, 0xCu);
  }
  v50[0] = v40;
  v50[1] = 3221225472;
  v50[2] = sub_18A76389C;
  v50[3] = &unk_1E1F64248;
  v51 = v12;
  v52 = v13;
  v50[4] = self;
  v44 = v12;
  v45 = v13;
  objc_msgSend_setFetchShareParticipantsCompletionBlock_(v33, v46, (uint64_t)v50, v47);
  objc_msgSend_addOperation_(v44, v48, (uint64_t)v33, v49);

}

- (void)_stripPersonalInfo
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  objc_msgSend_participants(self, a2, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v4);
        objc_msgSend__stripPersonalInfo(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7, v8, v9);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }

}

- (id)_copyWithoutPersonalInfo
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_copy(self, a2, v2, v3);
  objc_msgSend__stripPersonalInfo(v4, v5, v6, v7);
  return v4;
}

- (void)_getDecryptedShareInContainer:(id)a3 completionHandler:(id)a4
{
  objc_msgSend_decryptPersonalInfoOnShare_completionHandler_(a3, a2, (uint64_t)self, (uint64_t)a4);
}

- (void)setWantsPublicSharingKey:(BOOL)a3
{
  CKException *v3;
  const char *v4;
  id v5;

  v3 = [CKException alloc];
  v5 = (id)objc_msgSend_initWithCode_format_(v3, v4, 12, (uint64_t)CFSTR("Cannot set this property on CKShare"));
  objc_exception_throw(v5);
}

- (id)encryptedPublicSharingKey
{
  return 0;
}

- (NSData)publicSharingIdentity
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (void)setPublicSharingIdentity:(id)a3
{
  CKShare *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  CKEncryptedData *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_mutableEncryptedPSK(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v8, v9, v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v23)
  {
    if (v23)
    {
      v15 = [CKEncryptedData alloc];
      v18 = (void *)objc_msgSend_initWithData_(v15, v16, (uint64_t)v23, v17);
      objc_msgSend_setMutableEncryptedPSK_(v4, v19, (uint64_t)v18, v20);

    }
    else
    {
      objc_msgSend_setMutableEncryptedPSK_(v4, v13, 0, v14);
    }
    objc_msgSend_setMutableURL_(v4, v21, 0, v22);
  }
  objc_sync_exit(v4);

}

- (id)oneTimeURLForParticipantID:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v79;
  void *v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  int v91;
  id v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    if ((objc_msgSend_isZoneWideShare(self, v4, v5, v6) & 1) != 0)
    {
      objc_msgSend__knownParticipantWithParticipantID_(self, v8, (uint64_t)v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
      if (v10)
      {
        if (objc_msgSend_role(v10, v11, v12, v13) == 1)
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v18 = ck_log_facility_ck;
          if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            goto LABEL_30;
          LOWORD(v91) = 0;
          v19 = "You cannot get a one-time URL for an owner participant";
        }
        else
        {
          objc_msgSend_mutableEncryptedPSK(self, v15, v16, v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_data(v22, v23, v24, v25);
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v30 = (void *)v26;
            objc_msgSend_routingKey(self, v27, v28, v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend_length(v31, v32, v33, v34);

            if (v35)
            {
              objc_msgSend_oneTimeURLMetadatasByParticipantID(self, v36, v37, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v39, v40, (uint64_t)v7, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42
                && (objc_msgSend_encryptedOneTimeFullToken(v42, v43, v44, v45),
                    v46 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend_data(v46, v47, v48, v49),
                    v50 = (void *)objc_claimAutoreleasedReturnValue(),
                    v50,
                    v46,
                    v50))
              {
                objc_msgSend_routingKey(self, v51, v52, v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_oneTimeShortTokenWithRoutingKey_(v42, v55, (uint64_t)v54, v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_CKSafeStringForURLPathComponent(v57, v58, v59, v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();

                if (v61)
                {
                  v62 = (void *)objc_opt_class();
                  objc_msgSend_objectForKeyedSubscript_(self, v63, (uint64_t)CFSTR("cloudkit.title"), v64);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(self, v66, (uint64_t)CFSTR("cloudkit.type"), v67);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_containerID(self, v69, v70, v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_displayedHostname(self, v73, v74, v75);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_shareURLWithShortToken_shareTitle_shareType_containerID_displayedHostname_(v62, v77, (uint64_t)v61, (uint64_t)v65, v68, v72, v76);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  if (ck_log_initialization_predicate != -1)
                    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                  v80 = (void *)ck_log_facility_ck;
                  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                  {
                    v86 = v80;
                    objc_msgSend_recordID(self, v87, v88, v89);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    v91 = 138412546;
                    v92 = v7;
                    v93 = 2112;
                    v94 = v90;
                    _os_log_error_impl(&dword_18A5C5000, v86, OS_LOG_TYPE_ERROR, "Failed to get the one-time short token for participant %@ on %@", (uint8_t *)&v91, 0x16u);

                  }
                  v21 = 0;
                }

              }
              else
              {
                if (ck_log_initialization_predicate != -1)
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                v79 = (void *)ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                {
                  v81 = v79;
                  objc_msgSend_recordID(self, v82, v83, v84);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v91 = 138412546;
                  v92 = v7;
                  v93 = 2112;
                  v94 = v85;
                  _os_log_error_impl(&dword_18A5C5000, v81, OS_LOG_TYPE_ERROR, "Failed to get the one-time URL metadata for %@ on record %@", (uint8_t *)&v91, 0x16u);

                }
                v21 = 0;
              }

              goto LABEL_31;
            }
          }
          else
          {

          }
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v18 = ck_log_facility_ck;
          if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
LABEL_30:
            v21 = 0;
LABEL_31:

            goto LABEL_32;
          }
          LOWORD(v91) = 0;
          v19 = "You cannot get a one-time URL for a participant until the share it's been saved to the server";
        }
      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v18 = ck_log_facility_ck;
        if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        LOWORD(v91) = 0;
        v19 = "You cannot get a one-time URL for a participant that isn't on the share";
      }
      _os_log_error_impl(&dword_18A5C5000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v91, 2u);
      goto LABEL_30;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v20 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v91) = 0;
      _os_log_error_impl(&dword_18A5C5000, v20, OS_LOG_TYPE_ERROR, "You cannot get a one-time URL for a participant on a hierarhical share", (uint8_t *)&v91, 2u);
    }
  }
  v21 = 0;
LABEL_32:

  return v21;
}

- (int64_t)participantVisibility
{
  CKShare *v2;
  int64_t participantVisibility;

  v2 = self;
  objc_sync_enter(v2);
  participantVisibility = v2->_participantVisibility;
  objc_sync_exit(v2);

  return participantVisibility;
}

- (void)setParticipantVisibility:(int64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKShare *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  CKShare *obj;

  obj = self;
  objc_sync_enter(obj);
  v8 = obj;
  if (obj->_participantVisibility != a3)
  {
    v9 = objc_msgSend_publicPermission(obj, v5, v6, v7);
    if (a3 == 1)
    {
      if (v9 == 1)
      {
LABEL_7:
        v8 = obj;
        obj->_participantVisibility = a3;
        goto LABEL_8;
      }
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v15, (uint64_t)a2, (uint64_t)obj, CFSTR("CKShare.m"), 1364, CFSTR("Cannot set %@ on a share with publicPermission != CKShareParticipantPermissionNone"), CFSTR("ReadOnlyParticipantsSeeSelfAndOwner"));
    }
    else
    {
      if (a3 != 3 || v9 != 1)
        goto LABEL_7;
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)obj, CFSTR("CKShare.m"), 1367, CFSTR("Cannot set %@ on a share with publicPermission == CKShareParticipantPermissionNone"), CFSTR("OwnerSeesSelfAndParticipantsSeeSelfAndOwner"));
    }

    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v8);

}

- (int64_t)participantSelfRemovalBehavior
{
  CKShare *v2;
  int64_t participantSelfRemovalBehavior;

  v2 = self;
  objc_sync_enter(v2);
  participantSelfRemovalBehavior = v2->_participantSelfRemovalBehavior;
  objc_sync_exit(v2);

  return participantSelfRemovalBehavior;
}

- (void)setParticipantSelfRemovalBehavior:(int64_t)a3
{
  const char *v5;
  uint64_t v6;
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
  CKShare *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_currentUserParticipant(obj, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_msgSend_isCurrentUserOwnerOrAdmin(obj, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)obj, CFSTR("CKShare.m"), 1389, CFSTR("Only owners may set the participant self removal behavior of a share"));

  }
  if (obj->_participantSelfRemovalBehavior != a3)
    obj->_participantSelfRemovalBehavior = a3;

  objc_sync_exit(obj);
}

- (BOOL)allNonOwnerParticipantsHavePermission:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_participants(self, a2, a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v5, v6, v7, v8) >= 2)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v5;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v12)
    {
      v16 = v12;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v10);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend_role(v19, v13, v14, v15, (_QWORD)v21) != 1
            && objc_msgSend_permission(v19, v13, v14, v15) != a3)
          {
            v9 = 0;
            goto LABEL_14;
          }
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v16)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_14:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)allNonOwnerParticipantsHaveRole:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_participants(self, a2, a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v5, v6, v7, v8) >= 2)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v5;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v12)
    {
      v16 = v12;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v10);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend_role(v19, v13, v14, v15, (_QWORD)v21) != 1 && objc_msgSend_role(v19, v13, v14, v15) != a3)
          {
            v9 = 0;
            goto LABEL_14;
          }
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v16)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_14:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeSystemFieldsWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  CKShare *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  objc_super v126;

  v4 = a3;
  v8 = (void *)MEMORY[0x18D76DE4C]();
  if (!byte_1EDF6A0E0 && (objc_msgSend_serializePersonalInfo(self, v5, v6, v7) & 1) == 0)
    objc_msgSend__stripPersonalInfo(self, v9, v10, v11);
  v126.receiver = self;
  v126.super_class = (Class)CKShare;
  -[CKRecord encodeSystemFieldsWithCoder:](&v126, sel_encodeSystemFieldsWithCoder_, v4);
  objc_msgSend_containerID(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, (uint64_t)CFSTR("ContainerID"));

  objc_msgSend_rootRecordID(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("RootRecordID"));

  v25 = objc_msgSend_publicPermission(self, v22, v23, v24);
  objc_msgSend_encodeInteger_forKey_(v4, v26, v25, (uint64_t)CFSTR("PublicPermission"));
  LODWORD(v20) = objc_msgSend_encodeAllowsReadOnlyParticipantsToSeeEachOther(self, v27, v28, v29);
  v33 = objc_msgSend_participantVisibility(self, v30, v31, v32);
  if ((_DWORD)v20)
    objc_msgSend_encodeBool_forKey_(v4, v34, v33 == 0, (uint64_t)CFSTR("AllowsReadOnlyParticipantsToSeeEachOther"));
  else
    objc_msgSend_encodeInteger_forKey_(v4, v34, v33, (uint64_t)CFSTR("ParticipantVisibility"));
  v38 = objc_msgSend_participantSelfRemovalBehavior(self, v35, v36, v37);
  objc_msgSend_encodeInteger_forKey_(v4, v39, v38, (uint64_t)CFSTR("ParticipantSelfRemovalBehavior"));
  v43 = objc_msgSend_allowsAnonymousPublicAccess(self, v40, v41, v42);
  objc_msgSend_encodeBool_forKey_(v4, v44, v43, (uint64_t)CFSTR("AllowsAnonymousAccess"));
  v45 = self;
  objc_sync_enter(v45);
  objc_msgSend_mutableAllParticipants(v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v50, (uint64_t)v49, (uint64_t)CFSTR("Participants"));

  objc_msgSend_lastFetchedParticipants(v45, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v54, (uint64_t)CFSTR("LastFetchedParticipants"));

  objc_msgSend_addedParticipantIDs(v45, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v59, (uint64_t)CFSTR("AddedParticipantIDs"));

  objc_msgSend_removedParticipantIDs(v45, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, (uint64_t)CFSTR("RemovedParticipantIDs"));

  objc_msgSend_mutableRequesters(v45, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v70, (uint64_t)v69, (uint64_t)CFSTR("Requesters"));

  objc_msgSend_mutableApprovedRequesters(v45, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v75, (uint64_t)v74, (uint64_t)CFSTR("ApprovedRequesters"));

  objc_msgSend_mutableBlockedIdentities(v45, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v80, (uint64_t)v79, (uint64_t)CFSTR("BlockedIdentities"));

  v84 = objc_msgSend_accessRequestsEnabled(v45, v81, v82, v83);
  objc_msgSend_encodeBool_forKey_(v4, v85, v84, (uint64_t)CFSTR("AccessRequestsEnabled"));
  objc_msgSend_oneTimeURLMetadatasByParticipantID(v45, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v90, (uint64_t)v89, (uint64_t)CFSTR("oneTimeURLMetadatasByParticipantID"));

  objc_sync_exit(v45);
  objc_msgSend_invitedKeysToRemove(v45, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v95, (uint64_t)v94, (uint64_t)CFSTR("InvitedKeysToRemove"));

  if (byte_1EDF6A0E0 || objc_msgSend_serializeProtectionData(v45, v96, v97, v98))
  {
    objc_msgSend_invitedProtectionData(v45, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v100, (uint64_t)v99, (uint64_t)CFSTR("InvitedPCS"));

    objc_msgSend_invitedProtectionEtag(v45, v101, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v105, (uint64_t)v104, (uint64_t)CFSTR("InvitedPCSEtag"));

    objc_msgSend_previousInvitedProtectionEtag(v45, v106, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v110, (uint64_t)v109, (uint64_t)CFSTR("PreviousInvitedPCSEtag"));

    objc_msgSend_publicProtectionData(v45, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v115, (uint64_t)v114, (uint64_t)CFSTR("PublicPCS"));

    objc_msgSend_publicProtectionEtag(v45, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v120, (uint64_t)v119, (uint64_t)CFSTR("PublicPCSEtag"));

    objc_msgSend_previousPublicProtectionEtag(v45, v121, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v125, (uint64_t)v124, (uint64_t)CFSTR("PreviousPublicPCSEtag"));

  }
  objc_autoreleasePoolPop(v8);

}

- (CKShare)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CKShare *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKContainerID *containerID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CKRecordID *rootRecordID;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableArray *mutableAllParticipants;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSMutableArray *lastFetchedParticipants;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSMutableSet *addedParticipantIDs;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSMutableSet *removedParticipantIDs;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSMutableArray *mutableRequesters;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSMutableArray *mutableApprovedRequesters;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  NSMutableArray *mutableBlockedIdentities;
  const char *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  NSMutableDictionary *oneTimeURLMetadatasByParticipantID;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  NSArray *invitedKeysToRemove;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  NSData *invitedProtectionData;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  NSString *invitedProtectionEtag;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  NSString *previousInvitedProtectionEtag;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  NSData *publicProtectionData;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  NSString *publicProtectionEtag;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  NSString *previousPublicProtectionEtag;
  void *context;
  objc_super v175;

  v4 = aDecoder;
  v175.receiver = self;
  v175.super_class = (Class)CKShare;
  v5 = -[CKRecord initWithCoder:](&v175, sel_initWithCoder_, v4);
  if (v5)
  {
    context = (void *)MEMORY[0x18D76DE4C]();
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("ContainerID"));
    v8 = objc_claimAutoreleasedReturnValue();
    containerID = v5->super._containerID;
    v5->super._containerID = (CKContainerID *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("RootRecordID"));
    v12 = objc_claimAutoreleasedReturnValue();
    rootRecordID = v5->_rootRecordID;
    v5->_rootRecordID = (CKRecordID *)v12;

    v5->_publicPermission = objc_msgSend_decodeIntegerForKey_(v4, v14, (uint64_t)CFSTR("PublicPermission"), v15);
    if (objc_msgSend_containsValueForKey_(v4, v16, (uint64_t)CFSTR("ParticipantVisibility"), v17))
    {
      v5->_participantVisibility = objc_msgSend_decodeIntegerForKey_(v4, v18, (uint64_t)CFSTR("ParticipantVisibility"), v19);
    }
    else if (objc_msgSend_containsValueForKey_(v4, v18, (uint64_t)CFSTR("AllowsReadOnlyParticipantsToSeeEachOther"), v19))
    {
      if (objc_msgSend_decodeBoolForKey_(v4, v20, (uint64_t)CFSTR("AllowsReadOnlyParticipantsToSeeEachOther"), v21))v5->_participantVisibility = 0;
      else
        v5->_participantVisibility = 1;
    }
    v5->_participantSelfRemovalBehavior = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("ParticipantSelfRemovalBehavior"), v21);
    v5->_allowsAnonymousPublicAccess = objc_msgSend_decodeBoolForKey_(v4, v22, (uint64_t)CFSTR("AllowsAnonymousAccess"), v23);
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    objc_msgSend_setWithObjects_(v24, v28, v25, v29, v26, v27, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, (uint64_t)CFSTR("Participants"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_mutableCopy(v32, v33, v34, v35);
    mutableAllParticipants = v5->_mutableAllParticipants;
    v5->_mutableAllParticipants = (NSMutableArray *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    v41 = objc_opt_class();
    objc_msgSend_setWithObjects_(v38, v42, v39, v43, v40, v41, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("LastFetchedParticipants"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_mutableCopy(v46, v47, v48, v49);
    lastFetchedParticipants = v5->_lastFetchedParticipants;
    v5->_lastFetchedParticipants = (NSMutableArray *)v50;

    v52 = (void *)MEMORY[0x1E0C99E60];
    v53 = objc_opt_class();
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    v56 = objc_opt_class();
    objc_msgSend_setWithObjects_(v52, v57, v53, v58, v54, v55, v56, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v60, (uint64_t)v59, (uint64_t)CFSTR("AddedParticipantIDs"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_mutableCopy(v61, v62, v63, v64);
    addedParticipantIDs = v5->_addedParticipantIDs;
    v5->_addedParticipantIDs = (NSMutableSet *)v65;

    v67 = (void *)MEMORY[0x1E0C99E60];
    v68 = objc_opt_class();
    v69 = objc_opt_class();
    v70 = objc_opt_class();
    v71 = objc_opt_class();
    objc_msgSend_setWithObjects_(v67, v72, v68, v73, v69, v70, v71, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v75, (uint64_t)v74, (uint64_t)CFSTR("RemovedParticipantIDs"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend_mutableCopy(v76, v77, v78, v79);
    removedParticipantIDs = v5->_removedParticipantIDs;
    v5->_removedParticipantIDs = (NSMutableSet *)v80;

    v82 = (void *)MEMORY[0x1E0C99E60];
    v83 = objc_opt_class();
    v84 = objc_opt_class();
    v85 = objc_opt_class();
    objc_msgSend_setWithObjects_(v82, v86, v83, v87, v84, v85, 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v89, (uint64_t)v88, (uint64_t)CFSTR("Requesters"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_mutableCopy(v90, v91, v92, v93);
    mutableRequesters = v5->_mutableRequesters;
    v5->_mutableRequesters = (NSMutableArray *)v94;

    v96 = (void *)MEMORY[0x1E0C99E60];
    v97 = objc_opt_class();
    v98 = objc_opt_class();
    v99 = objc_opt_class();
    objc_msgSend_setWithObjects_(v96, v100, v97, v101, v98, v99, 0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v103, (uint64_t)v102, (uint64_t)CFSTR("ApprovedRequesters"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend_mutableCopy(v104, v105, v106, v107);
    mutableApprovedRequesters = v5->_mutableApprovedRequesters;
    v5->_mutableApprovedRequesters = (NSMutableArray *)v108;

    v110 = (void *)MEMORY[0x1E0C99E60];
    v111 = objc_opt_class();
    v112 = objc_opt_class();
    v113 = objc_opt_class();
    v114 = objc_opt_class();
    objc_msgSend_setWithObjects_(v110, v115, v111, v116, v112, v113, v114, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v118, (uint64_t)v117, (uint64_t)CFSTR("BlockedIdentities"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend_mutableCopy(v119, v120, v121, v122);
    mutableBlockedIdentities = v5->_mutableBlockedIdentities;
    v5->_mutableBlockedIdentities = (NSMutableArray *)v123;

    v5->_accessRequestsEnabled = objc_msgSend_decodeBoolForKey_(v4, v125, (uint64_t)CFSTR("AccessRequestsEnabled"), v126);
    v127 = (void *)MEMORY[0x1E0C99E60];
    v128 = objc_opt_class();
    v129 = objc_opt_class();
    v130 = objc_opt_class();
    v131 = objc_opt_class();
    objc_msgSend_setWithObjects_(v127, v132, v128, v133, v129, v130, v131, 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v135, (uint64_t)v134, (uint64_t)CFSTR("oneTimeURLMetadatasByParticipantID"));
    v136 = objc_claimAutoreleasedReturnValue();
    oneTimeURLMetadatasByParticipantID = v5->_oneTimeURLMetadatasByParticipantID;
    v5->_oneTimeURLMetadatasByParticipantID = (NSMutableDictionary *)v136;

    v138 = (void *)MEMORY[0x1E0C99E60];
    v139 = objc_opt_class();
    v140 = objc_opt_class();
    v141 = objc_opt_class();
    v142 = objc_opt_class();
    objc_msgSend_setWithObjects_(v138, v143, v139, v144, v140, v141, v142, 0);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v146, (uint64_t)v145, (uint64_t)CFSTR("InvitedKeysToRemove"));
    v147 = objc_claimAutoreleasedReturnValue();
    invitedKeysToRemove = v5->_invitedKeysToRemove;
    v5->_invitedKeysToRemove = (NSArray *)v147;

    v149 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v150, v149, (uint64_t)CFSTR("InvitedPCS"));
    v151 = objc_claimAutoreleasedReturnValue();
    invitedProtectionData = v5->_invitedProtectionData;
    v5->_invitedProtectionData = (NSData *)v151;

    v153 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v154, v153, (uint64_t)CFSTR("InvitedPCSEtag"));
    v155 = objc_claimAutoreleasedReturnValue();
    invitedProtectionEtag = v5->_invitedProtectionEtag;
    v5->_invitedProtectionEtag = (NSString *)v155;

    v157 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v158, v157, (uint64_t)CFSTR("PreviousInvitedPCSEtag"));
    v159 = objc_claimAutoreleasedReturnValue();
    previousInvitedProtectionEtag = v5->_previousInvitedProtectionEtag;
    v5->_previousInvitedProtectionEtag = (NSString *)v159;

    v161 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v162, v161, (uint64_t)CFSTR("PublicPCS"));
    v163 = objc_claimAutoreleasedReturnValue();
    publicProtectionData = v5->_publicProtectionData;
    v5->_publicProtectionData = (NSData *)v163;

    v165 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v166, v165, (uint64_t)CFSTR("PublicPCSEtag"));
    v167 = objc_claimAutoreleasedReturnValue();
    publicProtectionEtag = v5->_publicProtectionEtag;
    v5->_publicProtectionEtag = (NSString *)v167;

    v169 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v170, v169, (uint64_t)CFSTR("PreviousPublicPCSEtag"));
    v171 = objc_claimAutoreleasedReturnValue();
    previousPublicProtectionEtag = v5->_previousPublicProtectionEtag;
    v5->_previousPublicProtectionEtag = (NSString *)v171;

    objc_autoreleasePoolPop(context);
  }

  return v5;
}

- (BOOL)accessRequestsEnabled
{
  return self->_accessRequestsEnabled;
}

- (void)setAccessRequestsEnabled:(BOOL)a3
{
  self->_accessRequestsEnabled = a3;
}

- (BOOL)encodeAllowsReadOnlyParticipantsToSeeEachOther
{
  return self->_encodeAllowsReadOnlyParticipantsToSeeEachOther;
}

- (void)setEncodeAllowsReadOnlyParticipantsToSeeEachOther:(BOOL)a3
{
  self->_encodeAllowsReadOnlyParticipantsToSeeEachOther = a3;
}

- (CKRecordID)rootRecordID
{
  return self->_rootRecordID;
}

- (BOOL)allowsAnonymousPublicAccess
{
  return self->_allowsAnonymousPublicAccess;
}

- (void)setAllowsAnonymousPublicAccess:(BOOL)a3
{
  self->_allowsAnonymousPublicAccess = a3;
}

- (NSMutableArray)mutableAllParticipants
{
  return self->_mutableAllParticipants;
}

- (void)setMutableAllParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAllParticipants, a3);
}

- (NSMutableArray)lastFetchedParticipants
{
  return self->_lastFetchedParticipants;
}

- (void)setLastFetchedParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_lastFetchedParticipants, a3);
}

- (NSMutableSet)addedParticipantIDs
{
  return self->_addedParticipantIDs;
}

- (NSMutableSet)removedParticipantIDs
{
  return self->_removedParticipantIDs;
}

- (NSMutableArray)mutableRequesters
{
  return self->_mutableRequesters;
}

- (void)setMutableRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_mutableRequesters, a3);
}

- (NSMutableArray)mutableApprovedRequesters
{
  return self->_mutableApprovedRequesters;
}

- (void)setMutableApprovedRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_mutableApprovedRequesters, a3);
}

- (NSMutableArray)mutableBlockedIdentities
{
  return self->_mutableBlockedIdentities;
}

- (void)setMutableBlockedIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_mutableBlockedIdentities, a3);
}

- (NSData)invitedProtectionData
{
  return (NSData *)objc_getProperty(self, a2, 456, 1);
}

- (void)setInvitedProtectionData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (NSString)invitedProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setInvitedProtectionEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (NSString)previousInvitedProtectionEtag
{
  return self->_previousInvitedProtectionEtag;
}

- (NSData)publicProtectionData
{
  return (NSData *)objc_getProperty(self, a2, 480, 1);
}

- (void)setPublicProtectionData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 480);
}

- (NSString)publicProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 488, 1);
}

- (void)setPublicProtectionEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 488);
}

- (NSString)previousPublicProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPreviousPublicProtectionEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 496);
}

- (BOOL)serializePersonalInfo
{
  return self->_serializePersonalInfo;
}

- (void)setSerializePersonalInfo:(BOOL)a3
{
  self->_serializePersonalInfo = a3;
}

- (CKShareID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_previousPublicProtectionEtag, 0);
  objc_storeStrong((id *)&self->_publicProtectionEtag, 0);
  objc_storeStrong((id *)&self->_publicProtectionData, 0);
  objc_storeStrong((id *)&self->_previousInvitedProtectionEtag, 0);
  objc_storeStrong((id *)&self->_invitedProtectionEtag, 0);
  objc_storeStrong((id *)&self->_invitedProtectionData, 0);
  objc_storeStrong((id *)&self->_mutableBlockedIdentities, 0);
  objc_storeStrong((id *)&self->_mutableApprovedRequesters, 0);
  objc_storeStrong((id *)&self->_mutableRequesters, 0);
  objc_storeStrong((id *)&self->_removedParticipantIDs, 0);
  objc_storeStrong((id *)&self->_addedParticipantIDs, 0);
  objc_storeStrong((id *)&self->_lastFetchedParticipants, 0);
  objc_storeStrong((id *)&self->_mutableAllParticipants, 0);
  objc_storeStrong((id *)&self->_rootRecordID, 0);
  objc_storeStrong((id *)&self->_oneTimeURLMetadatasByParticipantID, 0);
  objc_storeStrong((id *)&self->_invitedKeysToRemove, 0);
}

@end
