@implementation CKModifyRecordsOperationInfo

- (CKModifyRecordsOperationInfo)init
{
  CKModifyRecordsOperationInfo *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CKModifyRecordsOperationInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKModifyRecordsOperationInfo;
  v2 = -[CKOperationInfo init](&v8, sel_init);
  v6 = v2;
  if (v2)
    objc_msgSend__commonInit(v2, v3, v4, v5);
  return v6;
}

- (void)_commonInit
{
  self->_atomic = 1;
  self->_shouldModifyRecordsInDatabase = 1;
  self->_alwaysFetchPCSFromServer = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t shouldOnlySaveAssetContent;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t shouldReportRecordsInFlight;
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
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t PCSFromServer;
  const char *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t shouldCloneFileInAssetCache;
  const char *v85;
  objc_super v86;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v86.receiver = self;
  v86.super_class = (Class)CKModifyRecordsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v86, sel_encodeWithCoder_, v4);
  objc_msgSend_recordsToSave(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("records"));

  objc_msgSend_recordIDsToDelete(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("recordIDs"));

  objc_msgSend_clientChangeTokenData(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("clientChangeToken"));

  v24 = objc_msgSend_savePolicy(self, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v4, v25, v24, (uint64_t)CFSTR("savePolicy"));
  shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, shouldOnlySaveAssetContent, (uint64_t)CFSTR("shouldOnlySaveAssetContent"));
  objc_msgSend_recordIDsToDeleteToEtags(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, (uint64_t)CFSTR("recordIDsToEtags"));

  v39 = objc_msgSend_atomic(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(v4, v40, v39, (uint64_t)CFSTR("atomic"));
  objc_msgSend_conflictLosersToResolveByRecordID(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("conflictLosersToResolveByRecordID"));

  objc_msgSend_pluginFieldsForRecordDeletesByID(self, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v50, (uint64_t)v49, (uint64_t)CFSTR("pluginFieldsForRecordDeletesByID"));

  shouldReportRecordsInFlight = objc_msgSend_shouldReportRecordsInFlight(self, v51, v52, v53);
  objc_msgSend_encodeBool_forKey_(v4, v55, shouldReportRecordsInFlight, (uint64_t)CFSTR("shouldReportRecordsInFlight"));
  objc_msgSend_assetUUIDToExpectedProperties(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v59, (uint64_t)CFSTR("assetUUIDToExpectedProperties"));

  objc_msgSend_packageUUIDToExpectedProperties(self, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, (uint64_t)CFSTR("packageUUIDToExpectedProperties"));

  v69 = objc_msgSend_originatingFromDaemon(self, v66, v67, v68);
  objc_msgSend_encodeBool_forKey_(v4, v70, v69, (uint64_t)CFSTR("originatingFromDaemon"));
  v74 = objc_msgSend_markAsParticipantNeedsNewInvitationToken(self, v71, v72, v73);
  objc_msgSend_encodeBool_forKey_(v4, v75, v74, (uint64_t)CFSTR("markAsParticipantNeedsNewInvitationToken"));
  PCSFromServer = objc_msgSend_alwaysFetchPCSFromServer(self, v76, v77, v78);
  objc_msgSend_encodeBool_forKey_(v4, v80, PCSFromServer, (uint64_t)CFSTR("alwaysFetchPCSFromServer"));
  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v81, v82, v83);
  objc_msgSend_encodeBool_forKey_(v4, v85, shouldCloneFileInAssetCache, (uint64_t)CFSTR("ShouldCloneFileInAssetCache"));
  objc_autoreleasePoolPop(v5);

}

- (CKModifyRecordsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKModifyRecordsOperationInfo *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKModifyRecordsOperationInfo *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSArray *recordsToSave;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSArray *recordIDsToDelete;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSData *clientChangeTokenData;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  NSDictionary *recordIDsToDeleteToEtags;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  NSDictionary *conflictLosersToResolveByRecordID;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  NSDictionary *pluginFieldsForRecordDeletesByID;
  const char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  NSDictionary *assetUUIDToExpectedProperties;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  NSDictionary *packageUUIDToExpectedProperties;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *context;
  objc_super v103;
  _QWORD v104[2];
  _QWORD v105[5];

  v105[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v103.receiver = self;
  v103.super_class = (Class)CKModifyRecordsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v103, sel_initWithCoder_, v4);
  v9 = v5;
  if (v5)
  {
    v10 = objc_msgSend__commonInit(v5, v6, v7, v8);
    context = (void *)MEMORY[0x18D76DE4C](v10);
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v15, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("records"));
    v18 = objc_claimAutoreleasedReturnValue();
    recordsToSave = v9->_recordsToSave;
    v9->_recordsToSave = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend_setWithObjects_(v20, v23, v21, v24, v22, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v26, (uint64_t)v25, (uint64_t)CFSTR("recordIDs"));
    v27 = objc_claimAutoreleasedReturnValue();
    recordIDsToDelete = v9->_recordIDsToDelete;
    v9->_recordIDsToDelete = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend_setWithObjects_(v29, v31, v30, v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("clientChangeToken"));
    v35 = objc_claimAutoreleasedReturnValue();
    clientChangeTokenData = v9->_clientChangeTokenData;
    v9->_clientChangeTokenData = (NSData *)v35;

    v9->_savePolicy = objc_msgSend_decodeInt64ForKey_(v4, v37, (uint64_t)CFSTR("savePolicy"), v38);
    v9->_shouldOnlySaveAssetContent = objc_msgSend_decodeBoolForKey_(v4, v39, (uint64_t)CFSTR("shouldOnlySaveAssetContent"), v40);
    v41 = (void *)MEMORY[0x1E0C99E60];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    objc_msgSend_setWithObjects_(v41, v45, v42, v46, v43, v44, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v48, (uint64_t)v47, (uint64_t)CFSTR("recordIDsToEtags"));
    v49 = objc_claimAutoreleasedReturnValue();
    recordIDsToDeleteToEtags = v9->_recordIDsToDeleteToEtags;
    v9->_recordIDsToDeleteToEtags = (NSDictionary *)v49;

    v9->_atomic = objc_msgSend_decodeBoolForKey_(v4, v51, (uint64_t)CFSTR("atomic"), v52);
    v53 = (void *)MEMORY[0x1E0C99E60];
    v105[0] = objc_opt_class();
    v105[1] = objc_opt_class();
    v105[2] = objc_opt_class();
    v105[3] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v54, (uint64_t)v105, 4);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v53, v56, (uint64_t)v55, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v59, (uint64_t)v58, (uint64_t)CFSTR("conflictLosersToResolveByRecordID"));
    v60 = objc_claimAutoreleasedReturnValue();
    conflictLosersToResolveByRecordID = v9->_conflictLosersToResolveByRecordID;
    v9->_conflictLosersToResolveByRecordID = (NSDictionary *)v60;

    CKAcceptableValueClasses();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = objc_opt_class();
    v104[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v63, (uint64_t)v104, 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setByAddingObjectsFromArray_(v62, v65, (uint64_t)v64, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v68, (uint64_t)v67, (uint64_t)CFSTR("pluginFieldsForRecordDeletesByID"));
    v69 = objc_claimAutoreleasedReturnValue();
    pluginFieldsForRecordDeletesByID = v9->_pluginFieldsForRecordDeletesByID;
    v9->_pluginFieldsForRecordDeletesByID = (NSDictionary *)v69;

    v9->_shouldReportRecordsInFlight = objc_msgSend_decodeBoolForKey_(v4, v71, (uint64_t)CFSTR("shouldReportRecordsInFlight"), v72);
    v73 = (void *)MEMORY[0x1E0C99E60];
    v74 = objc_opt_class();
    v75 = objc_opt_class();
    v76 = objc_opt_class();
    objc_msgSend_setWithObjects_(v73, v77, v74, v78, v75, v76, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v80, (uint64_t)v79, (uint64_t)CFSTR("assetUUIDToExpectedProperties"));
    v81 = objc_claimAutoreleasedReturnValue();
    assetUUIDToExpectedProperties = v9->_assetUUIDToExpectedProperties;
    v9->_assetUUIDToExpectedProperties = (NSDictionary *)v81;

    v83 = (void *)MEMORY[0x1E0C99E60];
    v84 = objc_opt_class();
    v85 = objc_opt_class();
    v86 = objc_opt_class();
    objc_msgSend_setWithObjects_(v83, v87, v84, v88, v85, v86, 0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v90, (uint64_t)v89, (uint64_t)CFSTR("packageUUIDToExpectedProperties"));
    v91 = objc_claimAutoreleasedReturnValue();
    packageUUIDToExpectedProperties = v9->_packageUUIDToExpectedProperties;
    v9->_packageUUIDToExpectedProperties = (NSDictionary *)v91;

    v9->_originatingFromDaemon = objc_msgSend_decodeBoolForKey_(v4, v93, (uint64_t)CFSTR("originatingFromDaemon"), v94);
    v9->_markAsParticipantNeedsNewInvitationToken = objc_msgSend_decodeBoolForKey_(v4, v95, (uint64_t)CFSTR("markAsParticipantNeedsNewInvitationToken"), v96);
    v9->_alwaysFetchPCSFromServer = objc_msgSend_decodeBoolForKey_(v4, v97, (uint64_t)CFSTR("alwaysFetchPCSFromServer"), v98);
    v9->_shouldCloneFileInAssetCache = objc_msgSend_decodeBoolForKey_(v4, v99, (uint64_t)CFSTR("ShouldCloneFileInAssetCache"), v100);
    objc_autoreleasePoolPop(context);
  }

  return v9;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordsToSave, a3);
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, a3);
}

- (NSData)clientChangeTokenData
{
  return self->_clientChangeTokenData;
}

- (void)setClientChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_clientChangeTokenData, a3);
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (BOOL)shouldOnlySaveAssetContent
{
  return self->_shouldOnlySaveAssetContent;
}

- (void)setShouldOnlySaveAssetContent:(BOOL)a3
{
  self->_shouldOnlySaveAssetContent = a3;
}

- (NSDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, a3);
}

- (NSDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)shouldReportRecordsInFlight
{
  return self->_shouldReportRecordsInFlight;
}

- (void)setShouldReportRecordsInFlight:(BOOL)a3
{
  self->_shouldReportRecordsInFlight = a3;
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSDictionary)packageUUIDToExpectedProperties
{
  return self->_packageUUIDToExpectedProperties;
}

- (void)setPackageUUIDToExpectedProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)originatingFromDaemon
{
  return self->_originatingFromDaemon;
}

- (void)setOriginatingFromDaemon:(BOOL)a3
{
  self->_originatingFromDaemon = a3;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (BOOL)shouldSkipPCSRetryBehavior
{
  return self->_shouldSkipPCSRetryBehavior;
}

- (void)setShouldSkipPCSRetryBehavior:(BOOL)a3
{
  self->_shouldSkipPCSRetryBehavior = a3;
}

- (BOOL)shouldModifyRecordsInDatabase
{
  return self->_shouldModifyRecordsInDatabase;
}

- (void)setShouldModifyRecordsInDatabase:(BOOL)a3
{
  self->_shouldModifyRecordsInDatabase = a3;
}

- (BOOL)alwaysFetchPCSFromServer
{
  return self->_alwaysFetchPCSFromServer;
}

- (void)setAlwaysFetchPCSFromServer:(BOOL)a3
{
  self->_alwaysFetchPCSFromServer = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end
