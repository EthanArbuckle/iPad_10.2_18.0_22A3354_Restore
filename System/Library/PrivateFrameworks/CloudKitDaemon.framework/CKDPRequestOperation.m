@implementation CKDPRequestOperation

- (CKDPQueryRetrieveRequest)queryRetrieveRequest
{
  return self->_queryRetrieveRequest;
}

- (CKDPOperation)request
{
  return self->_request;
}

- (void)setRecordRetrieveChangesRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recordRetrieveChangesRequest, a3);
}

- (CKDPRecordRetrieveChangesRequest)recordRetrieveChangesRequest
{
  return self->_recordRetrieveChangesRequest;
}

- (CKDPZoneRetrieveChangesRequest)zoneRetrieveChangesRequest
{
  return self->_zoneRetrieveChangesRequest;
}

- (void)setZoneRetrieveChangesRequest:(id)a3
{
  objc_storeStrong((id *)&self->_zoneRetrieveChangesRequest, a3);
}

- (void)setQueryRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_queryRetrieveRequest, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneDeleteRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneRetrieveChangesRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordRetrieveVersionsRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordRetrieveChangesRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordDeleteRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordResolveTokenRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_fetchArchivedRecordsRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordMoveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareAccessRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_queryRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mergeableDeltaSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mergeableDeltaMetadataRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mergeableDeltaReplaceRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mergeableDeltaRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_assetUploadTokenRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deleteContainerRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userAvailableQuotaRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bundlesForContainerRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_webAuthTokenRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_updateMissingAssetStatusRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_anonymousShareAddRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_anonymousShareRemoveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subscriptionCreateRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subscriptionRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subscriptionDeleteRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userQueryRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userPrivacySettingsRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userPrivacySettingsUpdateRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userPrivacySettingsResetRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userPrivacySettingsBatchLookupRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareAcceptRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareDeclineRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareVettingInitiateRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tokenRegistrationRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tokenUnregistrationRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_setBadgeCountRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notificationSyncRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notificationMarkReadRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_archiveRecordsRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_markAssetBrokenRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_functionInvokeRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (CKDPRequestOperationHeader)header
{
  return self->_header;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSaveRequest, 0);
  objc_storeStrong((id *)&self->_zoneRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_zoneRetrieveChangesRequest, 0);
  objc_storeStrong((id *)&self->_zoneDeleteRequest, 0);
  objc_storeStrong((id *)&self->_webAuthTokenRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_userRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_userQueryRequest, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsUpdateRequest, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsResetRequest, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsBatchLookupRequest, 0);
  objc_storeStrong((id *)&self->_userAvailableQuotaRequest, 0);
  objc_storeStrong((id *)&self->_updateMissingAssetStatusRequest, 0);
  objc_storeStrong((id *)&self->_tokenUnregistrationRequest, 0);
  objc_storeStrong((id *)&self->_tokenRegistrationRequest, 0);
  objc_storeStrong((id *)&self->_subscriptionRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_subscriptionDeleteRequest, 0);
  objc_storeStrong((id *)&self->_subscriptionCreateRequest, 0);
  objc_storeStrong((id *)&self->_shareVettingInitiateRequest, 0);
  objc_storeStrong((id *)&self->_shareDeclineRequest, 0);
  objc_storeStrong((id *)&self->_shareAccessRequest, 0);
  objc_storeStrong((id *)&self->_shareAcceptRequest, 0);
  objc_storeStrong((id *)&self->_setBadgeCountRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_recordSaveRequest, 0);
  objc_storeStrong((id *)&self->_recordRetrieveVersionsRequest, 0);
  objc_storeStrong((id *)&self->_recordRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_recordRetrieveChangesRequest, 0);
  objc_storeStrong((id *)&self->_recordResolveTokenRequest, 0);
  objc_storeStrong((id *)&self->_recordMoveRequest, 0);
  objc_storeStrong((id *)&self->_recordDeleteRequest, 0);
  objc_storeStrong((id *)&self->_queryRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_notificationSyncRequest, 0);
  objc_storeStrong((id *)&self->_notificationMarkReadRequest, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaSaveRequest, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaReplaceRequest, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_markAssetBrokenRequest, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_functionInvokeRequest, 0);
  objc_storeStrong((id *)&self->_fetchArchivedRecordsRequest, 0);
  objc_storeStrong((id *)&self->_deleteContainerRequest, 0);
  objc_storeStrong((id *)&self->_bundlesForContainerRequest, 0);
  objc_storeStrong((id *)&self->_assetUploadTokenRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_archiveRecordsRequest, 0);
  objc_storeStrong((id *)&self->_anonymousShareRemoveRequest, 0);
  objc_storeStrong((id *)&self->_anonymousShareAddRequest, 0);
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPRequestOperation;
  -[CKDPRequestOperation description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPRequestOperationHeader *header;
  void *v8;
  const char *v9;
  CKDPOperation *request;
  void *v11;
  const char *v12;
  CKDPCodeFunctionInvokeRequest *functionInvokeRequest;
  void *v14;
  const char *v15;
  CKDPMergeableDeltaSaveRequest *mergeableDeltaSaveRequest;
  void *v17;
  const char *v18;
  CKDPMergeableDeltaMetadataRetrieveRequest *mergeableDeltaMetadataRetrieveRequest;
  void *v20;
  const char *v21;
  CKDPMergeableDeltaReplaceRequest *mergeableDeltaReplaceRequest;
  void *v23;
  const char *v24;
  CKDPMergeableDeltaRetrieveRequest *mergeableDeltaRetrieveRequest;
  void *v26;
  const char *v27;
  CKDPShareVettingInitiateRequest *shareVettingInitiateRequest;
  void *v29;
  const char *v30;
  CKDPZoneSaveRequest *zoneSaveRequest;
  void *v32;
  const char *v33;
  CKDPZoneRetrieveRequest *zoneRetrieveRequest;
  void *v35;
  const char *v36;
  CKDPZoneDeleteRequest *zoneDeleteRequest;
  void *v38;
  const char *v39;
  CKDPZoneRetrieveChangesRequest *zoneRetrieveChangesRequest;
  void *v41;
  const char *v42;
  CKDPRecordSaveRequest *recordSaveRequest;
  void *v44;
  const char *v45;
  CKDPRecordRetrieveRequest *recordRetrieveRequest;
  void *v47;
  const char *v48;
  CKDPRecordRetrieveVersionsRequest *recordRetrieveVersionsRequest;
  void *v50;
  const char *v51;
  CKDPRecordRetrieveChangesRequest *recordRetrieveChangesRequest;
  void *v53;
  const char *v54;
  CKDPRecordDeleteRequest *recordDeleteRequest;
  void *v56;
  const char *v57;
  CKDPRecordResolveTokenRequest *recordResolveTokenRequest;
  void *v59;
  const char *v60;
  CKDPShareAccessRequest *shareAccessRequest;
  void *v62;
  const char *v63;
  CKDPRecordMoveRequest *recordMoveRequest;
  void *v65;
  const char *v66;
  CKDPFetchArchivedRecordsRequest *fetchArchivedRecordsRequest;
  void *v68;
  const char *v69;
  CKDPUserAvailableQuotaRequest *userAvailableQuotaRequest;
  void *v71;
  const char *v72;
  CKDPUserRetrieveRequest *userRetrieveRequest;
  void *v74;
  const char *v75;
  CKDPQueryRetrieveRequest *queryRetrieveRequest;
  void *v77;
  const char *v78;
  CKDPAssetUploadTokenRetrieveRequest *assetUploadTokenRetrieveRequest;
  void *v80;
  const char *v81;
  CKDPDeleteContainerRequest *deleteContainerRequest;
  void *v83;
  const char *v84;
  CKDPBundlesForContainerRequest *bundlesForContainerRequest;
  void *v86;
  const char *v87;
  CKDPWebAuthTokenRetrieveRequest *webAuthTokenRetrieveRequest;
  void *v89;
  const char *v90;
  CKDPUpdateMissingAssetStatusRequest *updateMissingAssetStatusRequest;
  void *v92;
  const char *v93;
  CKDPShareAcceptRequest *shareAcceptRequest;
  void *v95;
  const char *v96;
  CKDPShareDeclineRequest *shareDeclineRequest;
  void *v98;
  const char *v99;
  CKDPAnonymousShareAddRequest *anonymousShareAddRequest;
  void *v101;
  const char *v102;
  CKDPAnonymousShareRemoveRequest *anonymousShareRemoveRequest;
  void *v104;
  const char *v105;
  CKDPSubscriptionCreateRequest *subscriptionCreateRequest;
  void *v107;
  const char *v108;
  CKDPSubscriptionRetrieveRequest *subscriptionRetrieveRequest;
  void *v110;
  const char *v111;
  CKDPSubscriptionDeleteRequest *subscriptionDeleteRequest;
  void *v113;
  const char *v114;
  CKDPArchiveRecordsRequest *archiveRecordsRequest;
  void *v116;
  const char *v117;
  CKDPMarkAssetBrokenRequest *markAssetBrokenRequest;
  void *v119;
  const char *v120;
  CKDPUserQueryRequest *userQueryRequest;
  void *v122;
  const char *v123;
  CKDPUserPrivacySettingsUpdateRequest *userPrivacySettingsUpdateRequest;
  void *v125;
  const char *v126;
  CKDPUserPrivacySettingsResetRequest *userPrivacySettingsResetRequest;
  void *v128;
  const char *v129;
  CKDPUserPrivacySettingsBatchLookupRequest *userPrivacySettingsBatchLookupRequest;
  void *v131;
  const char *v132;
  CKDPUserPrivacySettingsRetrieveRequest *userPrivacySettingsRetrieveRequest;
  void *v134;
  const char *v135;
  CKDPTokenRegistrationRequest *tokenRegistrationRequest;
  void *v137;
  const char *v138;
  CKDPTokenUnregistrationRequest *tokenUnregistrationRequest;
  void *v140;
  const char *v141;
  CKDPSetBadgeCountRequest *setBadgeCountRequest;
  void *v143;
  const char *v144;
  CKDPNotificationSyncRequest *notificationSyncRequest;
  void *v146;
  const char *v147;
  CKDPNotificationMarkReadRequest *notificationMarkReadRequest;
  void *v149;
  const char *v150;
  id v151;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    objc_msgSend_dictionaryRepresentation(header, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("header"));

  }
  request = self->_request;
  if (request)
  {
    objc_msgSend_dictionaryRepresentation(request, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("request"));

  }
  functionInvokeRequest = self->_functionInvokeRequest;
  if (functionInvokeRequest)
  {
    objc_msgSend_dictionaryRepresentation(functionInvokeRequest, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("functionInvokeRequest"));

  }
  mergeableDeltaSaveRequest = self->_mergeableDeltaSaveRequest;
  if (mergeableDeltaSaveRequest)
  {
    objc_msgSend_dictionaryRepresentation(mergeableDeltaSaveRequest, v4, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("mergeableDeltaSaveRequest"));

  }
  mergeableDeltaMetadataRetrieveRequest = self->_mergeableDeltaMetadataRetrieveRequest;
  if (mergeableDeltaMetadataRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(mergeableDeltaMetadataRetrieveRequest, v4, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, CFSTR("mergeableDeltaMetadataRetrieveRequest"));

  }
  mergeableDeltaReplaceRequest = self->_mergeableDeltaReplaceRequest;
  if (mergeableDeltaReplaceRequest)
  {
    objc_msgSend_dictionaryRepresentation(mergeableDeltaReplaceRequest, v4, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, CFSTR("mergeableDeltaReplaceRequest"));

  }
  mergeableDeltaRetrieveRequest = self->_mergeableDeltaRetrieveRequest;
  if (mergeableDeltaRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(mergeableDeltaRetrieveRequest, v4, v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, CFSTR("mergeableDeltaRetrieveRequest"));

  }
  shareVettingInitiateRequest = self->_shareVettingInitiateRequest;
  if (shareVettingInitiateRequest)
  {
    objc_msgSend_dictionaryRepresentation(shareVettingInitiateRequest, v4, v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, CFSTR("shareVettingInitiateRequest"));

  }
  zoneSaveRequest = self->_zoneSaveRequest;
  if (zoneSaveRequest)
  {
    objc_msgSend_dictionaryRepresentation(zoneSaveRequest, v4, v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, CFSTR("zoneSaveRequest"));

  }
  zoneRetrieveRequest = self->_zoneRetrieveRequest;
  if (zoneRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(zoneRetrieveRequest, v4, v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v35, CFSTR("zoneRetrieveRequest"));

  }
  zoneDeleteRequest = self->_zoneDeleteRequest;
  if (zoneDeleteRequest)
  {
    objc_msgSend_dictionaryRepresentation(zoneDeleteRequest, v4, v5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v39, (uint64_t)v38, CFSTR("zoneDeleteRequest"));

  }
  zoneRetrieveChangesRequest = self->_zoneRetrieveChangesRequest;
  if (zoneRetrieveChangesRequest)
  {
    objc_msgSend_dictionaryRepresentation(zoneRetrieveChangesRequest, v4, v5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v42, (uint64_t)v41, CFSTR("zoneRetrieveChangesRequest"));

  }
  recordSaveRequest = self->_recordSaveRequest;
  if (recordSaveRequest)
  {
    objc_msgSend_dictionaryRepresentation(recordSaveRequest, v4, v5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v45, (uint64_t)v44, CFSTR("recordSaveRequest"));

  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  if (recordRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(recordRetrieveRequest, v4, v5);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v48, (uint64_t)v47, CFSTR("recordRetrieveRequest"));

  }
  recordRetrieveVersionsRequest = self->_recordRetrieveVersionsRequest;
  if (recordRetrieveVersionsRequest)
  {
    objc_msgSend_dictionaryRepresentation(recordRetrieveVersionsRequest, v4, v5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)v50, CFSTR("recordRetrieveVersionsRequest"));

  }
  recordRetrieveChangesRequest = self->_recordRetrieveChangesRequest;
  if (recordRetrieveChangesRequest)
  {
    objc_msgSend_dictionaryRepresentation(recordRetrieveChangesRequest, v4, v5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v54, (uint64_t)v53, CFSTR("recordRetrieveChangesRequest"));

  }
  recordDeleteRequest = self->_recordDeleteRequest;
  if (recordDeleteRequest)
  {
    objc_msgSend_dictionaryRepresentation(recordDeleteRequest, v4, v5);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v57, (uint64_t)v56, CFSTR("recordDeleteRequest"));

  }
  recordResolveTokenRequest = self->_recordResolveTokenRequest;
  if (recordResolveTokenRequest)
  {
    objc_msgSend_dictionaryRepresentation(recordResolveTokenRequest, v4, v5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v60, (uint64_t)v59, CFSTR("recordResolveTokenRequest"));

  }
  shareAccessRequest = self->_shareAccessRequest;
  if (shareAccessRequest)
  {
    objc_msgSend_dictionaryRepresentation(shareAccessRequest, v4, v5);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v62, CFSTR("shareAccessRequest"));

  }
  recordMoveRequest = self->_recordMoveRequest;
  if (recordMoveRequest)
  {
    objc_msgSend_dictionaryRepresentation(recordMoveRequest, v4, v5);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v66, (uint64_t)v65, CFSTR("recordMoveRequest"));

  }
  fetchArchivedRecordsRequest = self->_fetchArchivedRecordsRequest;
  if (fetchArchivedRecordsRequest)
  {
    objc_msgSend_dictionaryRepresentation(fetchArchivedRecordsRequest, v4, v5);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v69, (uint64_t)v68, CFSTR("fetchArchivedRecordsRequest"));

  }
  userAvailableQuotaRequest = self->_userAvailableQuotaRequest;
  if (userAvailableQuotaRequest)
  {
    objc_msgSend_dictionaryRepresentation(userAvailableQuotaRequest, v4, v5);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v72, (uint64_t)v71, CFSTR("userAvailableQuotaRequest"));

  }
  userRetrieveRequest = self->_userRetrieveRequest;
  if (userRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(userRetrieveRequest, v4, v5);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v75, (uint64_t)v74, CFSTR("userRetrieveRequest"));

  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  if (queryRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(queryRetrieveRequest, v4, v5);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v78, (uint64_t)v77, CFSTR("queryRetrieveRequest"));

  }
  assetUploadTokenRetrieveRequest = self->_assetUploadTokenRetrieveRequest;
  if (assetUploadTokenRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(assetUploadTokenRetrieveRequest, v4, v5);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v81, (uint64_t)v80, CFSTR("assetUploadTokenRetrieveRequest"));

  }
  deleteContainerRequest = self->_deleteContainerRequest;
  if (deleteContainerRequest)
  {
    objc_msgSend_dictionaryRepresentation(deleteContainerRequest, v4, v5);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v84, (uint64_t)v83, CFSTR("deleteContainerRequest"));

  }
  bundlesForContainerRequest = self->_bundlesForContainerRequest;
  if (bundlesForContainerRequest)
  {
    objc_msgSend_dictionaryRepresentation(bundlesForContainerRequest, v4, v5);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v87, (uint64_t)v86, CFSTR("bundlesForContainerRequest"));

  }
  webAuthTokenRetrieveRequest = self->_webAuthTokenRetrieveRequest;
  if (webAuthTokenRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(webAuthTokenRetrieveRequest, v4, v5);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v90, (uint64_t)v89, CFSTR("webAuthTokenRetrieveRequest"));

  }
  updateMissingAssetStatusRequest = self->_updateMissingAssetStatusRequest;
  if (updateMissingAssetStatusRequest)
  {
    objc_msgSend_dictionaryRepresentation(updateMissingAssetStatusRequest, v4, v5);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v93, (uint64_t)v92, CFSTR("updateMissingAssetStatusRequest"));

  }
  shareAcceptRequest = self->_shareAcceptRequest;
  if (shareAcceptRequest)
  {
    objc_msgSend_dictionaryRepresentation(shareAcceptRequest, v4, v5);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v96, (uint64_t)v95, CFSTR("shareAcceptRequest"));

  }
  shareDeclineRequest = self->_shareDeclineRequest;
  if (shareDeclineRequest)
  {
    objc_msgSend_dictionaryRepresentation(shareDeclineRequest, v4, v5);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v99, (uint64_t)v98, CFSTR("shareDeclineRequest"));

  }
  anonymousShareAddRequest = self->_anonymousShareAddRequest;
  if (anonymousShareAddRequest)
  {
    objc_msgSend_dictionaryRepresentation(anonymousShareAddRequest, v4, v5);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v102, (uint64_t)v101, CFSTR("anonymousShareAddRequest"));

  }
  anonymousShareRemoveRequest = self->_anonymousShareRemoveRequest;
  if (anonymousShareRemoveRequest)
  {
    objc_msgSend_dictionaryRepresentation(anonymousShareRemoveRequest, v4, v5);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v105, (uint64_t)v104, CFSTR("anonymousShareRemoveRequest"));

  }
  subscriptionCreateRequest = self->_subscriptionCreateRequest;
  if (subscriptionCreateRequest)
  {
    objc_msgSend_dictionaryRepresentation(subscriptionCreateRequest, v4, v5);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v108, (uint64_t)v107, CFSTR("subscriptionCreateRequest"));

  }
  subscriptionRetrieveRequest = self->_subscriptionRetrieveRequest;
  if (subscriptionRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(subscriptionRetrieveRequest, v4, v5);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v111, (uint64_t)v110, CFSTR("subscriptionRetrieveRequest"));

  }
  subscriptionDeleteRequest = self->_subscriptionDeleteRequest;
  if (subscriptionDeleteRequest)
  {
    objc_msgSend_dictionaryRepresentation(subscriptionDeleteRequest, v4, v5);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v114, (uint64_t)v113, CFSTR("subscriptionDeleteRequest"));

  }
  archiveRecordsRequest = self->_archiveRecordsRequest;
  if (archiveRecordsRequest)
  {
    objc_msgSend_dictionaryRepresentation(archiveRecordsRequest, v4, v5);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v117, (uint64_t)v116, CFSTR("archiveRecordsRequest"));

  }
  markAssetBrokenRequest = self->_markAssetBrokenRequest;
  if (markAssetBrokenRequest)
  {
    objc_msgSend_dictionaryRepresentation(markAssetBrokenRequest, v4, v5);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v120, (uint64_t)v119, CFSTR("markAssetBrokenRequest"));

  }
  userQueryRequest = self->_userQueryRequest;
  if (userQueryRequest)
  {
    objc_msgSend_dictionaryRepresentation(userQueryRequest, v4, v5);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v123, (uint64_t)v122, CFSTR("userQueryRequest"));

  }
  userPrivacySettingsUpdateRequest = self->_userPrivacySettingsUpdateRequest;
  if (userPrivacySettingsUpdateRequest)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettingsUpdateRequest, v4, v5);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v126, (uint64_t)v125, CFSTR("userPrivacySettingsUpdateRequest"));

  }
  userPrivacySettingsResetRequest = self->_userPrivacySettingsResetRequest;
  if (userPrivacySettingsResetRequest)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettingsResetRequest, v4, v5);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v129, (uint64_t)v128, CFSTR("userPrivacySettingsResetRequest"));

  }
  userPrivacySettingsBatchLookupRequest = self->_userPrivacySettingsBatchLookupRequest;
  if (userPrivacySettingsBatchLookupRequest)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettingsBatchLookupRequest, v4, v5);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v132, (uint64_t)v131, CFSTR("userPrivacySettingsBatchLookupRequest"));

  }
  userPrivacySettingsRetrieveRequest = self->_userPrivacySettingsRetrieveRequest;
  if (userPrivacySettingsRetrieveRequest)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettingsRetrieveRequest, v4, v5);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v135, (uint64_t)v134, CFSTR("userPrivacySettingsRetrieveRequest"));

  }
  tokenRegistrationRequest = self->_tokenRegistrationRequest;
  if (tokenRegistrationRequest)
  {
    objc_msgSend_dictionaryRepresentation(tokenRegistrationRequest, v4, v5);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v138, (uint64_t)v137, CFSTR("tokenRegistrationRequest"));

  }
  tokenUnregistrationRequest = self->_tokenUnregistrationRequest;
  if (tokenUnregistrationRequest)
  {
    objc_msgSend_dictionaryRepresentation(tokenUnregistrationRequest, v4, v5);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v141, (uint64_t)v140, CFSTR("tokenUnregistrationRequest"));

  }
  setBadgeCountRequest = self->_setBadgeCountRequest;
  if (setBadgeCountRequest)
  {
    objc_msgSend_dictionaryRepresentation(setBadgeCountRequest, v4, v5);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v144, (uint64_t)v143, CFSTR("setBadgeCountRequest"));

  }
  notificationSyncRequest = self->_notificationSyncRequest;
  if (notificationSyncRequest)
  {
    objc_msgSend_dictionaryRepresentation(notificationSyncRequest, v4, v5);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v147, (uint64_t)v146, CFSTR("notificationSyncRequest"));

  }
  notificationMarkReadRequest = self->_notificationMarkReadRequest;
  if (notificationMarkReadRequest)
  {
    objc_msgSend_dictionaryRepresentation(notificationMarkReadRequest, v4, v5);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v150, (uint64_t)v149, CFSTR("notificationMarkReadRequest"));

  }
  v151 = v6;

  return v151;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRequestOperationReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRequestOperationHeader *header;
  CKDPOperation *request;
  CKDPZoneSaveRequest *zoneSaveRequest;
  CKDPZoneRetrieveRequest *zoneRetrieveRequest;
  CKDPZoneDeleteRequest *zoneDeleteRequest;
  CKDPZoneRetrieveChangesRequest *zoneRetrieveChangesRequest;
  CKDPRecordSaveRequest *recordSaveRequest;
  CKDPRecordRetrieveRequest *recordRetrieveRequest;
  CKDPRecordRetrieveVersionsRequest *recordRetrieveVersionsRequest;
  CKDPRecordRetrieveChangesRequest *recordRetrieveChangesRequest;
  CKDPRecordDeleteRequest *recordDeleteRequest;
  CKDPRecordResolveTokenRequest *recordResolveTokenRequest;
  CKDPFetchArchivedRecordsRequest *fetchArchivedRecordsRequest;
  CKDPRecordMoveRequest *recordMoveRequest;
  CKDPShareAccessRequest *shareAccessRequest;
  CKDPQueryRetrieveRequest *queryRetrieveRequest;
  CKDPMergeableDeltaSaveRequest *mergeableDeltaSaveRequest;
  CKDPMergeableDeltaMetadataRetrieveRequest *mergeableDeltaMetadataRetrieveRequest;
  CKDPMergeableDeltaReplaceRequest *mergeableDeltaReplaceRequest;
  CKDPMergeableDeltaRetrieveRequest *mergeableDeltaRetrieveRequest;
  CKDPAssetUploadTokenRetrieveRequest *assetUploadTokenRetrieveRequest;
  CKDPDeleteContainerRequest *deleteContainerRequest;
  CKDPUserAvailableQuotaRequest *userAvailableQuotaRequest;
  CKDPBundlesForContainerRequest *bundlesForContainerRequest;
  CKDPWebAuthTokenRetrieveRequest *webAuthTokenRetrieveRequest;
  CKDPUpdateMissingAssetStatusRequest *updateMissingAssetStatusRequest;
  CKDPAnonymousShareAddRequest *anonymousShareAddRequest;
  CKDPAnonymousShareRemoveRequest *anonymousShareRemoveRequest;
  CKDPSubscriptionCreateRequest *subscriptionCreateRequest;
  CKDPSubscriptionRetrieveRequest *subscriptionRetrieveRequest;
  CKDPSubscriptionDeleteRequest *subscriptionDeleteRequest;
  CKDPUserRetrieveRequest *userRetrieveRequest;
  CKDPUserQueryRequest *userQueryRequest;
  CKDPUserPrivacySettingsRetrieveRequest *userPrivacySettingsRetrieveRequest;
  CKDPUserPrivacySettingsUpdateRequest *userPrivacySettingsUpdateRequest;
  CKDPUserPrivacySettingsResetRequest *userPrivacySettingsResetRequest;
  CKDPUserPrivacySettingsBatchLookupRequest *userPrivacySettingsBatchLookupRequest;
  CKDPShareAcceptRequest *shareAcceptRequest;
  CKDPShareDeclineRequest *shareDeclineRequest;
  CKDPShareVettingInitiateRequest *shareVettingInitiateRequest;
  CKDPTokenRegistrationRequest *tokenRegistrationRequest;
  CKDPTokenUnregistrationRequest *tokenUnregistrationRequest;
  CKDPSetBadgeCountRequest *setBadgeCountRequest;
  CKDPNotificationSyncRequest *notificationSyncRequest;
  CKDPNotificationMarkReadRequest *notificationMarkReadRequest;
  CKDPArchiveRecordsRequest *archiveRecordsRequest;
  CKDPMarkAssetBrokenRequest *markAssetBrokenRequest;
  CKDPCodeFunctionInvokeRequest *functionInvokeRequest;
  id v54;

  v4 = a3;
  header = self->_header;
  v54 = v4;
  if (header)
  {
    objc_msgSend_setHeader_(v4, v5, (uint64_t)header);
    v4 = v54;
  }
  request = self->_request;
  if (request)
  {
    objc_msgSend_setRequest_(v54, v5, (uint64_t)request);
    v4 = v54;
  }
  zoneSaveRequest = self->_zoneSaveRequest;
  if (zoneSaveRequest)
  {
    objc_msgSend_setZoneSaveRequest_(v54, v5, (uint64_t)zoneSaveRequest);
    v4 = v54;
  }
  zoneRetrieveRequest = self->_zoneRetrieveRequest;
  if (zoneRetrieveRequest)
  {
    objc_msgSend_setZoneRetrieveRequest_(v54, v5, (uint64_t)zoneRetrieveRequest);
    v4 = v54;
  }
  zoneDeleteRequest = self->_zoneDeleteRequest;
  if (zoneDeleteRequest)
  {
    objc_msgSend_setZoneDeleteRequest_(v54, v5, (uint64_t)zoneDeleteRequest);
    v4 = v54;
  }
  zoneRetrieveChangesRequest = self->_zoneRetrieveChangesRequest;
  if (zoneRetrieveChangesRequest)
  {
    objc_msgSend_setZoneRetrieveChangesRequest_(v54, v5, (uint64_t)zoneRetrieveChangesRequest);
    v4 = v54;
  }
  recordSaveRequest = self->_recordSaveRequest;
  if (recordSaveRequest)
  {
    objc_msgSend_setRecordSaveRequest_(v54, v5, (uint64_t)recordSaveRequest);
    v4 = v54;
  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  if (recordRetrieveRequest)
  {
    objc_msgSend_setRecordRetrieveRequest_(v54, v5, (uint64_t)recordRetrieveRequest);
    v4 = v54;
  }
  recordRetrieveVersionsRequest = self->_recordRetrieveVersionsRequest;
  if (recordRetrieveVersionsRequest)
  {
    objc_msgSend_setRecordRetrieveVersionsRequest_(v54, v5, (uint64_t)recordRetrieveVersionsRequest);
    v4 = v54;
  }
  recordRetrieveChangesRequest = self->_recordRetrieveChangesRequest;
  if (recordRetrieveChangesRequest)
  {
    objc_msgSend_setRecordRetrieveChangesRequest_(v54, v5, (uint64_t)recordRetrieveChangesRequest);
    v4 = v54;
  }
  recordDeleteRequest = self->_recordDeleteRequest;
  if (recordDeleteRequest)
  {
    objc_msgSend_setRecordDeleteRequest_(v54, v5, (uint64_t)recordDeleteRequest);
    v4 = v54;
  }
  recordResolveTokenRequest = self->_recordResolveTokenRequest;
  if (recordResolveTokenRequest)
  {
    objc_msgSend_setRecordResolveTokenRequest_(v54, v5, (uint64_t)recordResolveTokenRequest);
    v4 = v54;
  }
  fetchArchivedRecordsRequest = self->_fetchArchivedRecordsRequest;
  if (fetchArchivedRecordsRequest)
  {
    objc_msgSend_setFetchArchivedRecordsRequest_(v54, v5, (uint64_t)fetchArchivedRecordsRequest);
    v4 = v54;
  }
  recordMoveRequest = self->_recordMoveRequest;
  if (recordMoveRequest)
  {
    objc_msgSend_setRecordMoveRequest_(v54, v5, (uint64_t)recordMoveRequest);
    v4 = v54;
  }
  shareAccessRequest = self->_shareAccessRequest;
  if (shareAccessRequest)
  {
    objc_msgSend_setShareAccessRequest_(v54, v5, (uint64_t)shareAccessRequest);
    v4 = v54;
  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  if (queryRetrieveRequest)
  {
    objc_msgSend_setQueryRetrieveRequest_(v54, v5, (uint64_t)queryRetrieveRequest);
    v4 = v54;
  }
  mergeableDeltaSaveRequest = self->_mergeableDeltaSaveRequest;
  if (mergeableDeltaSaveRequest)
  {
    objc_msgSend_setMergeableDeltaSaveRequest_(v54, v5, (uint64_t)mergeableDeltaSaveRequest);
    v4 = v54;
  }
  mergeableDeltaMetadataRetrieveRequest = self->_mergeableDeltaMetadataRetrieveRequest;
  if (mergeableDeltaMetadataRetrieveRequest)
  {
    objc_msgSend_setMergeableDeltaMetadataRetrieveRequest_(v54, v5, (uint64_t)mergeableDeltaMetadataRetrieveRequest);
    v4 = v54;
  }
  mergeableDeltaReplaceRequest = self->_mergeableDeltaReplaceRequest;
  if (mergeableDeltaReplaceRequest)
  {
    objc_msgSend_setMergeableDeltaReplaceRequest_(v54, v5, (uint64_t)mergeableDeltaReplaceRequest);
    v4 = v54;
  }
  mergeableDeltaRetrieveRequest = self->_mergeableDeltaRetrieveRequest;
  if (mergeableDeltaRetrieveRequest)
  {
    objc_msgSend_setMergeableDeltaRetrieveRequest_(v54, v5, (uint64_t)mergeableDeltaRetrieveRequest);
    v4 = v54;
  }
  assetUploadTokenRetrieveRequest = self->_assetUploadTokenRetrieveRequest;
  if (assetUploadTokenRetrieveRequest)
  {
    objc_msgSend_setAssetUploadTokenRetrieveRequest_(v54, v5, (uint64_t)assetUploadTokenRetrieveRequest);
    v4 = v54;
  }
  deleteContainerRequest = self->_deleteContainerRequest;
  if (deleteContainerRequest)
  {
    objc_msgSend_setDeleteContainerRequest_(v54, v5, (uint64_t)deleteContainerRequest);
    v4 = v54;
  }
  userAvailableQuotaRequest = self->_userAvailableQuotaRequest;
  if (userAvailableQuotaRequest)
  {
    objc_msgSend_setUserAvailableQuotaRequest_(v54, v5, (uint64_t)userAvailableQuotaRequest);
    v4 = v54;
  }
  bundlesForContainerRequest = self->_bundlesForContainerRequest;
  if (bundlesForContainerRequest)
  {
    objc_msgSend_setBundlesForContainerRequest_(v54, v5, (uint64_t)bundlesForContainerRequest);
    v4 = v54;
  }
  webAuthTokenRetrieveRequest = self->_webAuthTokenRetrieveRequest;
  if (webAuthTokenRetrieveRequest)
  {
    objc_msgSend_setWebAuthTokenRetrieveRequest_(v54, v5, (uint64_t)webAuthTokenRetrieveRequest);
    v4 = v54;
  }
  updateMissingAssetStatusRequest = self->_updateMissingAssetStatusRequest;
  if (updateMissingAssetStatusRequest)
  {
    objc_msgSend_setUpdateMissingAssetStatusRequest_(v54, v5, (uint64_t)updateMissingAssetStatusRequest);
    v4 = v54;
  }
  anonymousShareAddRequest = self->_anonymousShareAddRequest;
  if (anonymousShareAddRequest)
  {
    objc_msgSend_setAnonymousShareAddRequest_(v54, v5, (uint64_t)anonymousShareAddRequest);
    v4 = v54;
  }
  anonymousShareRemoveRequest = self->_anonymousShareRemoveRequest;
  if (anonymousShareRemoveRequest)
  {
    objc_msgSend_setAnonymousShareRemoveRequest_(v54, v5, (uint64_t)anonymousShareRemoveRequest);
    v4 = v54;
  }
  subscriptionCreateRequest = self->_subscriptionCreateRequest;
  if (subscriptionCreateRequest)
  {
    objc_msgSend_setSubscriptionCreateRequest_(v54, v5, (uint64_t)subscriptionCreateRequest);
    v4 = v54;
  }
  subscriptionRetrieveRequest = self->_subscriptionRetrieveRequest;
  if (subscriptionRetrieveRequest)
  {
    objc_msgSend_setSubscriptionRetrieveRequest_(v54, v5, (uint64_t)subscriptionRetrieveRequest);
    v4 = v54;
  }
  subscriptionDeleteRequest = self->_subscriptionDeleteRequest;
  if (subscriptionDeleteRequest)
  {
    objc_msgSend_setSubscriptionDeleteRequest_(v54, v5, (uint64_t)subscriptionDeleteRequest);
    v4 = v54;
  }
  userRetrieveRequest = self->_userRetrieveRequest;
  if (userRetrieveRequest)
  {
    objc_msgSend_setUserRetrieveRequest_(v54, v5, (uint64_t)userRetrieveRequest);
    v4 = v54;
  }
  userQueryRequest = self->_userQueryRequest;
  if (userQueryRequest)
  {
    objc_msgSend_setUserQueryRequest_(v54, v5, (uint64_t)userQueryRequest);
    v4 = v54;
  }
  userPrivacySettingsRetrieveRequest = self->_userPrivacySettingsRetrieveRequest;
  if (userPrivacySettingsRetrieveRequest)
  {
    objc_msgSend_setUserPrivacySettingsRetrieveRequest_(v54, v5, (uint64_t)userPrivacySettingsRetrieveRequest);
    v4 = v54;
  }
  userPrivacySettingsUpdateRequest = self->_userPrivacySettingsUpdateRequest;
  if (userPrivacySettingsUpdateRequest)
  {
    objc_msgSend_setUserPrivacySettingsUpdateRequest_(v54, v5, (uint64_t)userPrivacySettingsUpdateRequest);
    v4 = v54;
  }
  userPrivacySettingsResetRequest = self->_userPrivacySettingsResetRequest;
  if (userPrivacySettingsResetRequest)
  {
    objc_msgSend_setUserPrivacySettingsResetRequest_(v54, v5, (uint64_t)userPrivacySettingsResetRequest);
    v4 = v54;
  }
  userPrivacySettingsBatchLookupRequest = self->_userPrivacySettingsBatchLookupRequest;
  if (userPrivacySettingsBatchLookupRequest)
  {
    objc_msgSend_setUserPrivacySettingsBatchLookupRequest_(v54, v5, (uint64_t)userPrivacySettingsBatchLookupRequest);
    v4 = v54;
  }
  shareAcceptRequest = self->_shareAcceptRequest;
  if (shareAcceptRequest)
  {
    objc_msgSend_setShareAcceptRequest_(v54, v5, (uint64_t)shareAcceptRequest);
    v4 = v54;
  }
  shareDeclineRequest = self->_shareDeclineRequest;
  if (shareDeclineRequest)
  {
    objc_msgSend_setShareDeclineRequest_(v54, v5, (uint64_t)shareDeclineRequest);
    v4 = v54;
  }
  shareVettingInitiateRequest = self->_shareVettingInitiateRequest;
  if (shareVettingInitiateRequest)
  {
    objc_msgSend_setShareVettingInitiateRequest_(v54, v5, (uint64_t)shareVettingInitiateRequest);
    v4 = v54;
  }
  tokenRegistrationRequest = self->_tokenRegistrationRequest;
  if (tokenRegistrationRequest)
  {
    objc_msgSend_setTokenRegistrationRequest_(v54, v5, (uint64_t)tokenRegistrationRequest);
    v4 = v54;
  }
  tokenUnregistrationRequest = self->_tokenUnregistrationRequest;
  if (tokenUnregistrationRequest)
  {
    objc_msgSend_setTokenUnregistrationRequest_(v54, v5, (uint64_t)tokenUnregistrationRequest);
    v4 = v54;
  }
  setBadgeCountRequest = self->_setBadgeCountRequest;
  if (setBadgeCountRequest)
  {
    objc_msgSend_setSetBadgeCountRequest_(v54, v5, (uint64_t)setBadgeCountRequest);
    v4 = v54;
  }
  notificationSyncRequest = self->_notificationSyncRequest;
  if (notificationSyncRequest)
  {
    objc_msgSend_setNotificationSyncRequest_(v54, v5, (uint64_t)notificationSyncRequest);
    v4 = v54;
  }
  notificationMarkReadRequest = self->_notificationMarkReadRequest;
  if (notificationMarkReadRequest)
  {
    objc_msgSend_setNotificationMarkReadRequest_(v54, v5, (uint64_t)notificationMarkReadRequest);
    v4 = v54;
  }
  archiveRecordsRequest = self->_archiveRecordsRequest;
  if (archiveRecordsRequest)
  {
    objc_msgSend_setArchiveRecordsRequest_(v54, v5, (uint64_t)archiveRecordsRequest);
    v4 = v54;
  }
  markAssetBrokenRequest = self->_markAssetBrokenRequest;
  if (markAssetBrokenRequest)
  {
    objc_msgSend_setMarkAssetBrokenRequest_(v54, v5, (uint64_t)markAssetBrokenRequest);
    v4 = v54;
  }
  functionInvokeRequest = self->_functionInvokeRequest;
  if (functionInvokeRequest)
  {
    objc_msgSend_setFunctionInvokeRequest_(v54, v5, (uint64_t)functionInvokeRequest);
    v4 = v54;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
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
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_header, v11, (uint64_t)a3);
  v13 = (void *)v10[9];
  v10[9] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_request, v14, (uint64_t)a3);
  v16 = (void *)v10[25];
  v10[25] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_zoneSaveRequest, v17, (uint64_t)a3);
  v19 = (void *)v10[48];
  v10[48] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_zoneRetrieveRequest, v20, (uint64_t)a3);
  v22 = (void *)v10[47];
  v10[47] = v21;

  v24 = objc_msgSend_copyWithZone_(self->_zoneDeleteRequest, v23, (uint64_t)a3);
  v25 = (void *)v10[45];
  v10[45] = v24;

  v27 = objc_msgSend_copyWithZone_(self->_zoneRetrieveChangesRequest, v26, (uint64_t)a3);
  v28 = (void *)v10[46];
  v10[46] = v27;

  v30 = objc_msgSend_copyWithZone_(self->_recordSaveRequest, v29, (uint64_t)a3);
  v31 = (void *)v10[24];
  v10[24] = v30;

  v33 = objc_msgSend_copyWithZone_(self->_recordRetrieveRequest, v32, (uint64_t)a3);
  v34 = (void *)v10[22];
  v10[22] = v33;

  v36 = objc_msgSend_copyWithZone_(self->_recordRetrieveVersionsRequest, v35, (uint64_t)a3);
  v37 = (void *)v10[23];
  v10[23] = v36;

  v39 = objc_msgSend_copyWithZone_(self->_recordRetrieveChangesRequest, v38, (uint64_t)a3);
  v40 = (void *)v10[21];
  v10[21] = v39;

  v42 = objc_msgSend_copyWithZone_(self->_recordDeleteRequest, v41, (uint64_t)a3);
  v43 = (void *)v10[18];
  v10[18] = v42;

  v45 = objc_msgSend_copyWithZone_(self->_recordResolveTokenRequest, v44, (uint64_t)a3);
  v46 = (void *)v10[20];
  v10[20] = v45;

  v48 = objc_msgSend_copyWithZone_(self->_fetchArchivedRecordsRequest, v47, (uint64_t)a3);
  v49 = (void *)v10[7];
  v10[7] = v48;

  v51 = objc_msgSend_copyWithZone_(self->_recordMoveRequest, v50, (uint64_t)a3);
  v52 = (void *)v10[19];
  v10[19] = v51;

  v54 = objc_msgSend_copyWithZone_(self->_shareAccessRequest, v53, (uint64_t)a3);
  v55 = (void *)v10[28];
  v10[28] = v54;

  v57 = objc_msgSend_copyWithZone_(self->_queryRetrieveRequest, v56, (uint64_t)a3);
  v58 = (void *)v10[17];
  v10[17] = v57;

  v60 = objc_msgSend_copyWithZone_(self->_mergeableDeltaSaveRequest, v59, (uint64_t)a3);
  v61 = (void *)v10[14];
  v10[14] = v60;

  v63 = objc_msgSend_copyWithZone_(self->_mergeableDeltaMetadataRetrieveRequest, v62, (uint64_t)a3);
  v64 = (void *)v10[11];
  v10[11] = v63;

  v66 = objc_msgSend_copyWithZone_(self->_mergeableDeltaReplaceRequest, v65, (uint64_t)a3);
  v67 = (void *)v10[12];
  v10[12] = v66;

  v69 = objc_msgSend_copyWithZone_(self->_mergeableDeltaRetrieveRequest, v68, (uint64_t)a3);
  v70 = (void *)v10[13];
  v10[13] = v69;

  v72 = objc_msgSend_copyWithZone_(self->_assetUploadTokenRetrieveRequest, v71, (uint64_t)a3);
  v73 = (void *)v10[4];
  v10[4] = v72;

  v75 = objc_msgSend_copyWithZone_(self->_deleteContainerRequest, v74, (uint64_t)a3);
  v76 = (void *)v10[6];
  v10[6] = v75;

  v78 = objc_msgSend_copyWithZone_(self->_userAvailableQuotaRequest, v77, (uint64_t)a3);
  v79 = (void *)v10[37];
  v10[37] = v78;

  v81 = objc_msgSend_copyWithZone_(self->_bundlesForContainerRequest, v80, (uint64_t)a3);
  v82 = (void *)v10[5];
  v10[5] = v81;

  v84 = objc_msgSend_copyWithZone_(self->_webAuthTokenRetrieveRequest, v83, (uint64_t)a3);
  v85 = (void *)v10[44];
  v10[44] = v84;

  v87 = objc_msgSend_copyWithZone_(self->_updateMissingAssetStatusRequest, v86, (uint64_t)a3);
  v88 = (void *)v10[36];
  v10[36] = v87;

  v90 = objc_msgSend_copyWithZone_(self->_anonymousShareAddRequest, v89, (uint64_t)a3);
  v91 = (void *)v10[1];
  v10[1] = v90;

  v93 = objc_msgSend_copyWithZone_(self->_anonymousShareRemoveRequest, v92, (uint64_t)a3);
  v94 = (void *)v10[2];
  v10[2] = v93;

  v96 = objc_msgSend_copyWithZone_(self->_subscriptionCreateRequest, v95, (uint64_t)a3);
  v97 = (void *)v10[31];
  v10[31] = v96;

  v99 = objc_msgSend_copyWithZone_(self->_subscriptionRetrieveRequest, v98, (uint64_t)a3);
  v100 = (void *)v10[33];
  v10[33] = v99;

  v102 = objc_msgSend_copyWithZone_(self->_subscriptionDeleteRequest, v101, (uint64_t)a3);
  v103 = (void *)v10[32];
  v10[32] = v102;

  v105 = objc_msgSend_copyWithZone_(self->_userRetrieveRequest, v104, (uint64_t)a3);
  v106 = (void *)v10[43];
  v10[43] = v105;

  v108 = objc_msgSend_copyWithZone_(self->_userQueryRequest, v107, (uint64_t)a3);
  v109 = (void *)v10[42];
  v10[42] = v108;

  v111 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsRetrieveRequest, v110, (uint64_t)a3);
  v112 = (void *)v10[40];
  v10[40] = v111;

  v114 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsUpdateRequest, v113, (uint64_t)a3);
  v115 = (void *)v10[41];
  v10[41] = v114;

  v117 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsResetRequest, v116, (uint64_t)a3);
  v118 = (void *)v10[39];
  v10[39] = v117;

  v120 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsBatchLookupRequest, v119, (uint64_t)a3);
  v121 = (void *)v10[38];
  v10[38] = v120;

  v123 = objc_msgSend_copyWithZone_(self->_shareAcceptRequest, v122, (uint64_t)a3);
  v124 = (void *)v10[27];
  v10[27] = v123;

  v126 = objc_msgSend_copyWithZone_(self->_shareDeclineRequest, v125, (uint64_t)a3);
  v127 = (void *)v10[29];
  v10[29] = v126;

  v129 = objc_msgSend_copyWithZone_(self->_shareVettingInitiateRequest, v128, (uint64_t)a3);
  v130 = (void *)v10[30];
  v10[30] = v129;

  v132 = objc_msgSend_copyWithZone_(self->_tokenRegistrationRequest, v131, (uint64_t)a3);
  v133 = (void *)v10[34];
  v10[34] = v132;

  v135 = objc_msgSend_copyWithZone_(self->_tokenUnregistrationRequest, v134, (uint64_t)a3);
  v136 = (void *)v10[35];
  v10[35] = v135;

  v138 = objc_msgSend_copyWithZone_(self->_setBadgeCountRequest, v137, (uint64_t)a3);
  v139 = (void *)v10[26];
  v10[26] = v138;

  v141 = objc_msgSend_copyWithZone_(self->_notificationSyncRequest, v140, (uint64_t)a3);
  v142 = (void *)v10[16];
  v10[16] = v141;

  v144 = objc_msgSend_copyWithZone_(self->_notificationMarkReadRequest, v143, (uint64_t)a3);
  v145 = (void *)v10[15];
  v10[15] = v144;

  v147 = objc_msgSend_copyWithZone_(self->_archiveRecordsRequest, v146, (uint64_t)a3);
  v148 = (void *)v10[3];
  v10[3] = v147;

  v150 = objc_msgSend_copyWithZone_(self->_markAssetBrokenRequest, v149, (uint64_t)a3);
  v151 = (void *)v10[10];
  v10[10] = v150;

  v153 = objc_msgSend_copyWithZone_(self->_functionInvokeRequest, v152, (uint64_t)a3);
  v154 = (void *)v10[8];
  v10[8] = v153;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRequestOperationHeader *header;
  uint64_t v9;
  CKDPOperation *request;
  uint64_t v11;
  CKDPZoneSaveRequest *zoneSaveRequest;
  uint64_t v13;
  CKDPZoneRetrieveRequest *zoneRetrieveRequest;
  uint64_t v15;
  CKDPZoneDeleteRequest *zoneDeleteRequest;
  uint64_t v17;
  CKDPZoneRetrieveChangesRequest *zoneRetrieveChangesRequest;
  uint64_t v19;
  CKDPRecordSaveRequest *recordSaveRequest;
  uint64_t v21;
  CKDPRecordRetrieveRequest *recordRetrieveRequest;
  uint64_t v23;
  CKDPRecordRetrieveVersionsRequest *recordRetrieveVersionsRequest;
  uint64_t v25;
  CKDPRecordRetrieveChangesRequest *recordRetrieveChangesRequest;
  uint64_t v27;
  CKDPRecordDeleteRequest *recordDeleteRequest;
  uint64_t v29;
  CKDPRecordResolveTokenRequest *recordResolveTokenRequest;
  uint64_t v31;
  CKDPFetchArchivedRecordsRequest *fetchArchivedRecordsRequest;
  uint64_t v33;
  CKDPRecordMoveRequest *recordMoveRequest;
  uint64_t v35;
  CKDPShareAccessRequest *shareAccessRequest;
  uint64_t v37;
  CKDPQueryRetrieveRequest *queryRetrieveRequest;
  uint64_t v39;
  CKDPMergeableDeltaSaveRequest *mergeableDeltaSaveRequest;
  uint64_t v41;
  CKDPMergeableDeltaMetadataRetrieveRequest *mergeableDeltaMetadataRetrieveRequest;
  uint64_t v43;
  CKDPMergeableDeltaReplaceRequest *mergeableDeltaReplaceRequest;
  uint64_t v45;
  CKDPMergeableDeltaRetrieveRequest *mergeableDeltaRetrieveRequest;
  uint64_t v47;
  CKDPAssetUploadTokenRetrieveRequest *assetUploadTokenRetrieveRequest;
  uint64_t v49;
  CKDPDeleteContainerRequest *deleteContainerRequest;
  uint64_t v51;
  CKDPUserAvailableQuotaRequest *userAvailableQuotaRequest;
  uint64_t v53;
  CKDPBundlesForContainerRequest *bundlesForContainerRequest;
  uint64_t v55;
  CKDPWebAuthTokenRetrieveRequest *webAuthTokenRetrieveRequest;
  uint64_t v57;
  CKDPUpdateMissingAssetStatusRequest *updateMissingAssetStatusRequest;
  uint64_t v59;
  CKDPAnonymousShareAddRequest *anonymousShareAddRequest;
  uint64_t v61;
  CKDPAnonymousShareRemoveRequest *anonymousShareRemoveRequest;
  uint64_t v63;
  CKDPSubscriptionCreateRequest *subscriptionCreateRequest;
  uint64_t v65;
  CKDPSubscriptionRetrieveRequest *subscriptionRetrieveRequest;
  uint64_t v67;
  CKDPSubscriptionDeleteRequest *subscriptionDeleteRequest;
  uint64_t v69;
  CKDPUserRetrieveRequest *userRetrieveRequest;
  uint64_t v71;
  CKDPUserQueryRequest *userQueryRequest;
  uint64_t v73;
  CKDPUserPrivacySettingsRetrieveRequest *userPrivacySettingsRetrieveRequest;
  uint64_t v75;
  CKDPUserPrivacySettingsUpdateRequest *userPrivacySettingsUpdateRequest;
  uint64_t v77;
  CKDPUserPrivacySettingsResetRequest *userPrivacySettingsResetRequest;
  uint64_t v79;
  CKDPUserPrivacySettingsBatchLookupRequest *userPrivacySettingsBatchLookupRequest;
  uint64_t v81;
  CKDPShareAcceptRequest *shareAcceptRequest;
  uint64_t v83;
  CKDPShareDeclineRequest *shareDeclineRequest;
  uint64_t v85;
  CKDPShareVettingInitiateRequest *shareVettingInitiateRequest;
  uint64_t v87;
  CKDPTokenRegistrationRequest *tokenRegistrationRequest;
  uint64_t v89;
  CKDPTokenUnregistrationRequest *tokenUnregistrationRequest;
  uint64_t v91;
  CKDPSetBadgeCountRequest *setBadgeCountRequest;
  uint64_t v93;
  CKDPNotificationSyncRequest *notificationSyncRequest;
  uint64_t v95;
  CKDPNotificationMarkReadRequest *notificationMarkReadRequest;
  uint64_t v97;
  CKDPArchiveRecordsRequest *archiveRecordsRequest;
  uint64_t v99;
  CKDPMarkAssetBrokenRequest *markAssetBrokenRequest;
  uint64_t v101;
  CKDPCodeFunctionInvokeRequest *functionInvokeRequest;
  uint64_t v103;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_98;
  header = self->_header;
  v9 = v4[9];
  if ((unint64_t)header | v9)
  {
    if (!objc_msgSend_isEqual_(header, v7, v9))
      goto LABEL_98;
  }
  request = self->_request;
  v11 = v4[25];
  if ((unint64_t)request | v11)
  {
    if (!objc_msgSend_isEqual_(request, v7, v11))
      goto LABEL_98;
  }
  zoneSaveRequest = self->_zoneSaveRequest;
  v13 = v4[48];
  if ((unint64_t)zoneSaveRequest | v13)
  {
    if (!objc_msgSend_isEqual_(zoneSaveRequest, v7, v13))
      goto LABEL_98;
  }
  zoneRetrieveRequest = self->_zoneRetrieveRequest;
  v15 = v4[47];
  if ((unint64_t)zoneRetrieveRequest | v15)
  {
    if (!objc_msgSend_isEqual_(zoneRetrieveRequest, v7, v15))
      goto LABEL_98;
  }
  zoneDeleteRequest = self->_zoneDeleteRequest;
  v17 = v4[45];
  if ((unint64_t)zoneDeleteRequest | v17)
  {
    if (!objc_msgSend_isEqual_(zoneDeleteRequest, v7, v17))
      goto LABEL_98;
  }
  zoneRetrieveChangesRequest = self->_zoneRetrieveChangesRequest;
  v19 = v4[46];
  if ((unint64_t)zoneRetrieveChangesRequest | v19)
  {
    if (!objc_msgSend_isEqual_(zoneRetrieveChangesRequest, v7, v19))
      goto LABEL_98;
  }
  recordSaveRequest = self->_recordSaveRequest;
  v21 = v4[24];
  if ((unint64_t)recordSaveRequest | v21)
  {
    if (!objc_msgSend_isEqual_(recordSaveRequest, v7, v21))
      goto LABEL_98;
  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  v23 = v4[22];
  if ((unint64_t)recordRetrieveRequest | v23)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveRequest, v7, v23))
      goto LABEL_98;
  }
  recordRetrieveVersionsRequest = self->_recordRetrieveVersionsRequest;
  v25 = v4[23];
  if ((unint64_t)recordRetrieveVersionsRequest | v25)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveVersionsRequest, v7, v25))
      goto LABEL_98;
  }
  recordRetrieveChangesRequest = self->_recordRetrieveChangesRequest;
  v27 = v4[21];
  if ((unint64_t)recordRetrieveChangesRequest | v27)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveChangesRequest, v7, v27))
      goto LABEL_98;
  }
  recordDeleteRequest = self->_recordDeleteRequest;
  v29 = v4[18];
  if ((unint64_t)recordDeleteRequest | v29)
  {
    if (!objc_msgSend_isEqual_(recordDeleteRequest, v7, v29))
      goto LABEL_98;
  }
  recordResolveTokenRequest = self->_recordResolveTokenRequest;
  v31 = v4[20];
  if ((unint64_t)recordResolveTokenRequest | v31)
  {
    if (!objc_msgSend_isEqual_(recordResolveTokenRequest, v7, v31))
      goto LABEL_98;
  }
  fetchArchivedRecordsRequest = self->_fetchArchivedRecordsRequest;
  v33 = v4[7];
  if ((unint64_t)fetchArchivedRecordsRequest | v33)
  {
    if (!objc_msgSend_isEqual_(fetchArchivedRecordsRequest, v7, v33))
      goto LABEL_98;
  }
  recordMoveRequest = self->_recordMoveRequest;
  v35 = v4[19];
  if ((unint64_t)recordMoveRequest | v35)
  {
    if (!objc_msgSend_isEqual_(recordMoveRequest, v7, v35))
      goto LABEL_98;
  }
  shareAccessRequest = self->_shareAccessRequest;
  v37 = v4[28];
  if ((unint64_t)shareAccessRequest | v37)
  {
    if (!objc_msgSend_isEqual_(shareAccessRequest, v7, v37))
      goto LABEL_98;
  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  v39 = v4[17];
  if ((unint64_t)queryRetrieveRequest | v39)
  {
    if (!objc_msgSend_isEqual_(queryRetrieveRequest, v7, v39))
      goto LABEL_98;
  }
  mergeableDeltaSaveRequest = self->_mergeableDeltaSaveRequest;
  v41 = v4[14];
  if ((unint64_t)mergeableDeltaSaveRequest | v41)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaSaveRequest, v7, v41))
      goto LABEL_98;
  }
  mergeableDeltaMetadataRetrieveRequest = self->_mergeableDeltaMetadataRetrieveRequest;
  v43 = v4[11];
  if ((unint64_t)mergeableDeltaMetadataRetrieveRequest | v43)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaMetadataRetrieveRequest, v7, v43))
      goto LABEL_98;
  }
  mergeableDeltaReplaceRequest = self->_mergeableDeltaReplaceRequest;
  v45 = v4[12];
  if ((unint64_t)mergeableDeltaReplaceRequest | v45)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaReplaceRequest, v7, v45))
      goto LABEL_98;
  }
  mergeableDeltaRetrieveRequest = self->_mergeableDeltaRetrieveRequest;
  v47 = v4[13];
  if ((unint64_t)mergeableDeltaRetrieveRequest | v47)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaRetrieveRequest, v7, v47))
      goto LABEL_98;
  }
  assetUploadTokenRetrieveRequest = self->_assetUploadTokenRetrieveRequest;
  v49 = v4[4];
  if ((unint64_t)assetUploadTokenRetrieveRequest | v49)
  {
    if (!objc_msgSend_isEqual_(assetUploadTokenRetrieveRequest, v7, v49))
      goto LABEL_98;
  }
  deleteContainerRequest = self->_deleteContainerRequest;
  v51 = v4[6];
  if ((unint64_t)deleteContainerRequest | v51)
  {
    if (!objc_msgSend_isEqual_(deleteContainerRequest, v7, v51))
      goto LABEL_98;
  }
  userAvailableQuotaRequest = self->_userAvailableQuotaRequest;
  v53 = v4[37];
  if ((unint64_t)userAvailableQuotaRequest | v53)
  {
    if (!objc_msgSend_isEqual_(userAvailableQuotaRequest, v7, v53))
      goto LABEL_98;
  }
  bundlesForContainerRequest = self->_bundlesForContainerRequest;
  v55 = v4[5];
  if ((unint64_t)bundlesForContainerRequest | v55)
  {
    if (!objc_msgSend_isEqual_(bundlesForContainerRequest, v7, v55))
      goto LABEL_98;
  }
  webAuthTokenRetrieveRequest = self->_webAuthTokenRetrieveRequest;
  v57 = v4[44];
  if ((unint64_t)webAuthTokenRetrieveRequest | v57)
  {
    if (!objc_msgSend_isEqual_(webAuthTokenRetrieveRequest, v7, v57))
      goto LABEL_98;
  }
  updateMissingAssetStatusRequest = self->_updateMissingAssetStatusRequest;
  v59 = v4[36];
  if ((unint64_t)updateMissingAssetStatusRequest | v59)
  {
    if (!objc_msgSend_isEqual_(updateMissingAssetStatusRequest, v7, v59))
      goto LABEL_98;
  }
  anonymousShareAddRequest = self->_anonymousShareAddRequest;
  v61 = v4[1];
  if ((unint64_t)anonymousShareAddRequest | v61)
  {
    if (!objc_msgSend_isEqual_(anonymousShareAddRequest, v7, v61))
      goto LABEL_98;
  }
  anonymousShareRemoveRequest = self->_anonymousShareRemoveRequest;
  v63 = v4[2];
  if ((unint64_t)anonymousShareRemoveRequest | v63)
  {
    if (!objc_msgSend_isEqual_(anonymousShareRemoveRequest, v7, v63))
      goto LABEL_98;
  }
  subscriptionCreateRequest = self->_subscriptionCreateRequest;
  v65 = v4[31];
  if ((unint64_t)subscriptionCreateRequest | v65)
  {
    if (!objc_msgSend_isEqual_(subscriptionCreateRequest, v7, v65))
      goto LABEL_98;
  }
  subscriptionRetrieveRequest = self->_subscriptionRetrieveRequest;
  v67 = v4[33];
  if ((unint64_t)subscriptionRetrieveRequest | v67)
  {
    if (!objc_msgSend_isEqual_(subscriptionRetrieveRequest, v7, v67))
      goto LABEL_98;
  }
  subscriptionDeleteRequest = self->_subscriptionDeleteRequest;
  v69 = v4[32];
  if ((unint64_t)subscriptionDeleteRequest | v69)
  {
    if (!objc_msgSend_isEqual_(subscriptionDeleteRequest, v7, v69))
      goto LABEL_98;
  }
  userRetrieveRequest = self->_userRetrieveRequest;
  v71 = v4[43];
  if ((unint64_t)userRetrieveRequest | v71)
  {
    if (!objc_msgSend_isEqual_(userRetrieveRequest, v7, v71))
      goto LABEL_98;
  }
  userQueryRequest = self->_userQueryRequest;
  v73 = v4[42];
  if ((unint64_t)userQueryRequest | v73)
  {
    if (!objc_msgSend_isEqual_(userQueryRequest, v7, v73))
      goto LABEL_98;
  }
  userPrivacySettingsRetrieveRequest = self->_userPrivacySettingsRetrieveRequest;
  v75 = v4[40];
  if ((unint64_t)userPrivacySettingsRetrieveRequest | v75)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsRetrieveRequest, v7, v75))
      goto LABEL_98;
  }
  userPrivacySettingsUpdateRequest = self->_userPrivacySettingsUpdateRequest;
  v77 = v4[41];
  if ((unint64_t)userPrivacySettingsUpdateRequest | v77)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsUpdateRequest, v7, v77))
      goto LABEL_98;
  }
  userPrivacySettingsResetRequest = self->_userPrivacySettingsResetRequest;
  v79 = v4[39];
  if ((unint64_t)userPrivacySettingsResetRequest | v79)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsResetRequest, v7, v79))
      goto LABEL_98;
  }
  userPrivacySettingsBatchLookupRequest = self->_userPrivacySettingsBatchLookupRequest;
  v81 = v4[38];
  if ((unint64_t)userPrivacySettingsBatchLookupRequest | v81)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsBatchLookupRequest, v7, v81))
      goto LABEL_98;
  }
  shareAcceptRequest = self->_shareAcceptRequest;
  v83 = v4[27];
  if ((unint64_t)shareAcceptRequest | v83)
  {
    if (!objc_msgSend_isEqual_(shareAcceptRequest, v7, v83))
      goto LABEL_98;
  }
  shareDeclineRequest = self->_shareDeclineRequest;
  v85 = v4[29];
  if ((unint64_t)shareDeclineRequest | v85)
  {
    if (!objc_msgSend_isEqual_(shareDeclineRequest, v7, v85))
      goto LABEL_98;
  }
  shareVettingInitiateRequest = self->_shareVettingInitiateRequest;
  v87 = v4[30];
  if ((unint64_t)shareVettingInitiateRequest | v87)
  {
    if (!objc_msgSend_isEqual_(shareVettingInitiateRequest, v7, v87))
      goto LABEL_98;
  }
  tokenRegistrationRequest = self->_tokenRegistrationRequest;
  v89 = v4[34];
  if ((unint64_t)tokenRegistrationRequest | v89)
  {
    if (!objc_msgSend_isEqual_(tokenRegistrationRequest, v7, v89))
      goto LABEL_98;
  }
  tokenUnregistrationRequest = self->_tokenUnregistrationRequest;
  v91 = v4[35];
  if ((unint64_t)tokenUnregistrationRequest | v91)
  {
    if (!objc_msgSend_isEqual_(tokenUnregistrationRequest, v7, v91))
      goto LABEL_98;
  }
  setBadgeCountRequest = self->_setBadgeCountRequest;
  v93 = v4[26];
  if ((unint64_t)setBadgeCountRequest | v93)
  {
    if (!objc_msgSend_isEqual_(setBadgeCountRequest, v7, v93))
      goto LABEL_98;
  }
  notificationSyncRequest = self->_notificationSyncRequest;
  v95 = v4[16];
  if ((unint64_t)notificationSyncRequest | v95)
  {
    if (!objc_msgSend_isEqual_(notificationSyncRequest, v7, v95))
      goto LABEL_98;
  }
  if (((notificationMarkReadRequest = self->_notificationMarkReadRequest,
         v97 = v4[15],
         !((unint64_t)notificationMarkReadRequest | v97))
     || objc_msgSend_isEqual_(notificationMarkReadRequest, v7, v97))
    && ((archiveRecordsRequest = self->_archiveRecordsRequest,
         v99 = v4[3],
         !((unint64_t)archiveRecordsRequest | v99))
     || objc_msgSend_isEqual_(archiveRecordsRequest, v7, v99))
    && ((markAssetBrokenRequest = self->_markAssetBrokenRequest,
         v101 = v4[10],
         !((unint64_t)markAssetBrokenRequest | v101))
     || objc_msgSend_isEqual_(markAssetBrokenRequest, v7, v101)))
  {
    functionInvokeRequest = self->_functionInvokeRequest;
    v103 = v4[8];
    if ((unint64_t)functionInvokeRequest | v103)
      isEqual = objc_msgSend_isEqual_(functionInvokeRequest, v7, v103);
    else
      isEqual = 1;
  }
  else
  {
LABEL_98:
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
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
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
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
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;

  v4 = objc_msgSend_hash(self->_header, a2, v2);
  v7 = objc_msgSend_hash(self->_request, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_zoneSaveRequest, v8, v9);
  v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_zoneRetrieveRequest, v11, v12);
  v16 = objc_msgSend_hash(self->_zoneDeleteRequest, v14, v15);
  v19 = v16 ^ objc_msgSend_hash(self->_zoneRetrieveChangesRequest, v17, v18);
  v22 = v13 ^ v19 ^ objc_msgSend_hash(self->_recordSaveRequest, v20, v21);
  v25 = objc_msgSend_hash(self->_recordRetrieveRequest, v23, v24);
  v28 = v25 ^ objc_msgSend_hash(self->_recordRetrieveVersionsRequest, v26, v27);
  v31 = v28 ^ objc_msgSend_hash(self->_recordRetrieveChangesRequest, v29, v30);
  v34 = v22 ^ v31 ^ objc_msgSend_hash(self->_recordDeleteRequest, v32, v33);
  v37 = objc_msgSend_hash(self->_recordResolveTokenRequest, v35, v36);
  v40 = v37 ^ objc_msgSend_hash(self->_fetchArchivedRecordsRequest, v38, v39);
  v43 = v40 ^ objc_msgSend_hash(self->_recordMoveRequest, v41, v42);
  v46 = v43 ^ objc_msgSend_hash(self->_shareAccessRequest, v44, v45);
  v49 = v34 ^ v46 ^ objc_msgSend_hash(self->_queryRetrieveRequest, v47, v48);
  v52 = objc_msgSend_hash(self->_mergeableDeltaSaveRequest, v50, v51);
  v55 = v52 ^ objc_msgSend_hash(self->_mergeableDeltaMetadataRetrieveRequest, v53, v54);
  v58 = v55 ^ objc_msgSend_hash(self->_mergeableDeltaReplaceRequest, v56, v57);
  v61 = v58 ^ objc_msgSend_hash(self->_mergeableDeltaRetrieveRequest, v59, v60);
  v64 = v61 ^ objc_msgSend_hash(self->_assetUploadTokenRetrieveRequest, v62, v63);
  v67 = v49 ^ v64 ^ objc_msgSend_hash(self->_deleteContainerRequest, v65, v66);
  v70 = objc_msgSend_hash(self->_userAvailableQuotaRequest, v68, v69);
  v73 = v70 ^ objc_msgSend_hash(self->_bundlesForContainerRequest, v71, v72);
  v76 = v73 ^ objc_msgSend_hash(self->_webAuthTokenRetrieveRequest, v74, v75);
  v79 = v76 ^ objc_msgSend_hash(self->_updateMissingAssetStatusRequest, v77, v78);
  v82 = v79 ^ objc_msgSend_hash(self->_anonymousShareAddRequest, v80, v81);
  v85 = v82 ^ objc_msgSend_hash(self->_anonymousShareRemoveRequest, v83, v84);
  v88 = v67 ^ v85 ^ objc_msgSend_hash(self->_subscriptionCreateRequest, v86, v87);
  v91 = objc_msgSend_hash(self->_subscriptionRetrieveRequest, v89, v90);
  v94 = v91 ^ objc_msgSend_hash(self->_subscriptionDeleteRequest, v92, v93);
  v97 = v94 ^ objc_msgSend_hash(self->_userRetrieveRequest, v95, v96);
  v100 = v97 ^ objc_msgSend_hash(self->_userQueryRequest, v98, v99);
  v103 = v100 ^ objc_msgSend_hash(self->_userPrivacySettingsRetrieveRequest, v101, v102);
  v106 = v103 ^ objc_msgSend_hash(self->_userPrivacySettingsUpdateRequest, v104, v105);
  v109 = v106 ^ objc_msgSend_hash(self->_userPrivacySettingsResetRequest, v107, v108);
  v112 = v88 ^ v109 ^ objc_msgSend_hash(self->_userPrivacySettingsBatchLookupRequest, v110, v111);
  v115 = objc_msgSend_hash(self->_shareAcceptRequest, v113, v114);
  v118 = v115 ^ objc_msgSend_hash(self->_shareDeclineRequest, v116, v117);
  v121 = v118 ^ objc_msgSend_hash(self->_shareVettingInitiateRequest, v119, v120);
  v124 = v121 ^ objc_msgSend_hash(self->_tokenRegistrationRequest, v122, v123);
  v127 = v124 ^ objc_msgSend_hash(self->_tokenUnregistrationRequest, v125, v126);
  v130 = v127 ^ objc_msgSend_hash(self->_setBadgeCountRequest, v128, v129);
  v133 = v130 ^ objc_msgSend_hash(self->_notificationSyncRequest, v131, v132);
  v136 = v133 ^ objc_msgSend_hash(self->_notificationMarkReadRequest, v134, v135);
  v139 = v112 ^ v136 ^ objc_msgSend_hash(self->_archiveRecordsRequest, v137, v138);
  v142 = objc_msgSend_hash(self->_markAssetBrokenRequest, v140, v141);
  return v139 ^ v142 ^ objc_msgSend_hash(self->_functionInvokeRequest, v143, v144);
}

- (void)mergeFrom:(id)a3
{
  uint64_t *v4;
  CKDPRequestOperationHeader *header;
  uint64_t v6;
  CKDPOperation *request;
  uint64_t v8;
  CKDPZoneSaveRequest *zoneSaveRequest;
  uint64_t v10;
  CKDPZoneRetrieveRequest *zoneRetrieveRequest;
  uint64_t v12;
  CKDPZoneDeleteRequest *zoneDeleteRequest;
  uint64_t v14;
  CKDPZoneRetrieveChangesRequest *zoneRetrieveChangesRequest;
  uint64_t v16;
  CKDPRecordSaveRequest *recordSaveRequest;
  uint64_t v18;
  CKDPRecordRetrieveRequest *recordRetrieveRequest;
  uint64_t v20;
  CKDPRecordRetrieveVersionsRequest *recordRetrieveVersionsRequest;
  uint64_t v22;
  CKDPRecordRetrieveChangesRequest *recordRetrieveChangesRequest;
  uint64_t v24;
  CKDPRecordDeleteRequest *recordDeleteRequest;
  uint64_t v26;
  CKDPRecordResolveTokenRequest *recordResolveTokenRequest;
  uint64_t v28;
  CKDPFetchArchivedRecordsRequest *fetchArchivedRecordsRequest;
  uint64_t v30;
  CKDPRecordMoveRequest *recordMoveRequest;
  uint64_t v32;
  CKDPShareAccessRequest *shareAccessRequest;
  uint64_t v34;
  CKDPQueryRetrieveRequest *queryRetrieveRequest;
  uint64_t v36;
  CKDPMergeableDeltaSaveRequest *mergeableDeltaSaveRequest;
  uint64_t v38;
  CKDPMergeableDeltaMetadataRetrieveRequest *mergeableDeltaMetadataRetrieveRequest;
  uint64_t v40;
  CKDPMergeableDeltaReplaceRequest *mergeableDeltaReplaceRequest;
  uint64_t v42;
  CKDPMergeableDeltaRetrieveRequest *mergeableDeltaRetrieveRequest;
  uint64_t v44;
  CKDPAssetUploadTokenRetrieveRequest *assetUploadTokenRetrieveRequest;
  uint64_t v46;
  CKDPDeleteContainerRequest *deleteContainerRequest;
  uint64_t v48;
  CKDPUserAvailableQuotaRequest *userAvailableQuotaRequest;
  uint64_t v50;
  CKDPBundlesForContainerRequest *bundlesForContainerRequest;
  uint64_t v52;
  CKDPWebAuthTokenRetrieveRequest *webAuthTokenRetrieveRequest;
  uint64_t v54;
  CKDPUpdateMissingAssetStatusRequest *updateMissingAssetStatusRequest;
  uint64_t v56;
  CKDPAnonymousShareAddRequest *anonymousShareAddRequest;
  uint64_t v58;
  CKDPAnonymousShareRemoveRequest *anonymousShareRemoveRequest;
  uint64_t v60;
  CKDPSubscriptionCreateRequest *subscriptionCreateRequest;
  uint64_t v62;
  CKDPSubscriptionRetrieveRequest *subscriptionRetrieveRequest;
  uint64_t v64;
  CKDPSubscriptionDeleteRequest *subscriptionDeleteRequest;
  uint64_t v66;
  CKDPUserRetrieveRequest *userRetrieveRequest;
  uint64_t v68;
  CKDPUserQueryRequest *userQueryRequest;
  uint64_t v70;
  CKDPUserPrivacySettingsRetrieveRequest *userPrivacySettingsRetrieveRequest;
  uint64_t v72;
  CKDPUserPrivacySettingsUpdateRequest *userPrivacySettingsUpdateRequest;
  uint64_t v74;
  CKDPUserPrivacySettingsResetRequest *userPrivacySettingsResetRequest;
  uint64_t v76;
  CKDPUserPrivacySettingsBatchLookupRequest *userPrivacySettingsBatchLookupRequest;
  uint64_t v78;
  CKDPShareAcceptRequest *shareAcceptRequest;
  uint64_t v80;
  CKDPShareDeclineRequest *shareDeclineRequest;
  uint64_t v82;
  CKDPShareVettingInitiateRequest *shareVettingInitiateRequest;
  uint64_t v84;
  CKDPTokenRegistrationRequest *tokenRegistrationRequest;
  uint64_t v86;
  CKDPTokenUnregistrationRequest *tokenUnregistrationRequest;
  uint64_t v88;
  CKDPSetBadgeCountRequest *setBadgeCountRequest;
  uint64_t v90;
  CKDPNotificationSyncRequest *notificationSyncRequest;
  uint64_t v92;
  CKDPNotificationMarkReadRequest *notificationMarkReadRequest;
  uint64_t v94;
  CKDPArchiveRecordsRequest *archiveRecordsRequest;
  uint64_t v96;
  CKDPMarkAssetBrokenRequest *markAssetBrokenRequest;
  uint64_t v98;
  CKDPCodeFunctionInvokeRequest *functionInvokeRequest;
  uint64_t v100;
  uint64_t *v101;

  v4 = (uint64_t *)a3;
  header = self->_header;
  v101 = v4;
  v6 = v4[9];
  if (header)
  {
    if (v6)
      objc_msgSend_mergeFrom_(header, (const char *)v4, v6);
  }
  else if (v6)
  {
    objc_msgSend_setHeader_(self, (const char *)v4, v6);
  }
  request = self->_request;
  v8 = v101[25];
  if (request)
  {
    if (v8)
      objc_msgSend_mergeFrom_(request, (const char *)v101, v8);
  }
  else if (v8)
  {
    objc_msgSend_setRequest_(self, (const char *)v101, v8);
  }
  zoneSaveRequest = self->_zoneSaveRequest;
  v10 = v101[48];
  if (zoneSaveRequest)
  {
    if (v10)
      objc_msgSend_mergeFrom_(zoneSaveRequest, (const char *)v101, v10);
  }
  else if (v10)
  {
    objc_msgSend_setZoneSaveRequest_(self, (const char *)v101, v10);
  }
  zoneRetrieveRequest = self->_zoneRetrieveRequest;
  v12 = v101[47];
  if (zoneRetrieveRequest)
  {
    if (v12)
      objc_msgSend_mergeFrom_(zoneRetrieveRequest, (const char *)v101, v12);
  }
  else if (v12)
  {
    objc_msgSend_setZoneRetrieveRequest_(self, (const char *)v101, v12);
  }
  zoneDeleteRequest = self->_zoneDeleteRequest;
  v14 = v101[45];
  if (zoneDeleteRequest)
  {
    if (v14)
      objc_msgSend_mergeFrom_(zoneDeleteRequest, (const char *)v101, v14);
  }
  else if (v14)
  {
    objc_msgSend_setZoneDeleteRequest_(self, (const char *)v101, v14);
  }
  zoneRetrieveChangesRequest = self->_zoneRetrieveChangesRequest;
  v16 = v101[46];
  if (zoneRetrieveChangesRequest)
  {
    if (v16)
      objc_msgSend_mergeFrom_(zoneRetrieveChangesRequest, (const char *)v101, v16);
  }
  else if (v16)
  {
    objc_msgSend_setZoneRetrieveChangesRequest_(self, (const char *)v101, v16);
  }
  recordSaveRequest = self->_recordSaveRequest;
  v18 = v101[24];
  if (recordSaveRequest)
  {
    if (v18)
      objc_msgSend_mergeFrom_(recordSaveRequest, (const char *)v101, v18);
  }
  else if (v18)
  {
    objc_msgSend_setRecordSaveRequest_(self, (const char *)v101, v18);
  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  v20 = v101[22];
  if (recordRetrieveRequest)
  {
    if (v20)
      objc_msgSend_mergeFrom_(recordRetrieveRequest, (const char *)v101, v20);
  }
  else if (v20)
  {
    objc_msgSend_setRecordRetrieveRequest_(self, (const char *)v101, v20);
  }
  recordRetrieveVersionsRequest = self->_recordRetrieveVersionsRequest;
  v22 = v101[23];
  if (recordRetrieveVersionsRequest)
  {
    if (v22)
      objc_msgSend_mergeFrom_(recordRetrieveVersionsRequest, (const char *)v101, v22);
  }
  else if (v22)
  {
    objc_msgSend_setRecordRetrieveVersionsRequest_(self, (const char *)v101, v22);
  }
  recordRetrieveChangesRequest = self->_recordRetrieveChangesRequest;
  v24 = v101[21];
  if (recordRetrieveChangesRequest)
  {
    if (v24)
      objc_msgSend_mergeFrom_(recordRetrieveChangesRequest, (const char *)v101, v24);
  }
  else if (v24)
  {
    objc_msgSend_setRecordRetrieveChangesRequest_(self, (const char *)v101, v24);
  }
  recordDeleteRequest = self->_recordDeleteRequest;
  v26 = v101[18];
  if (recordDeleteRequest)
  {
    if (v26)
      objc_msgSend_mergeFrom_(recordDeleteRequest, (const char *)v101, v26);
  }
  else if (v26)
  {
    objc_msgSend_setRecordDeleteRequest_(self, (const char *)v101, v26);
  }
  recordResolveTokenRequest = self->_recordResolveTokenRequest;
  v28 = v101[20];
  if (recordResolveTokenRequest)
  {
    if (v28)
      objc_msgSend_mergeFrom_(recordResolveTokenRequest, (const char *)v101, v28);
  }
  else if (v28)
  {
    objc_msgSend_setRecordResolveTokenRequest_(self, (const char *)v101, v28);
  }
  fetchArchivedRecordsRequest = self->_fetchArchivedRecordsRequest;
  v30 = v101[7];
  if (fetchArchivedRecordsRequest)
  {
    if (v30)
      objc_msgSend_mergeFrom_(fetchArchivedRecordsRequest, (const char *)v101, v30);
  }
  else if (v30)
  {
    objc_msgSend_setFetchArchivedRecordsRequest_(self, (const char *)v101, v30);
  }
  recordMoveRequest = self->_recordMoveRequest;
  v32 = v101[19];
  if (recordMoveRequest)
  {
    if (v32)
      objc_msgSend_mergeFrom_(recordMoveRequest, (const char *)v101, v32);
  }
  else if (v32)
  {
    objc_msgSend_setRecordMoveRequest_(self, (const char *)v101, v32);
  }
  shareAccessRequest = self->_shareAccessRequest;
  v34 = v101[28];
  if (shareAccessRequest)
  {
    if (v34)
      objc_msgSend_mergeFrom_(shareAccessRequest, (const char *)v101, v34);
  }
  else if (v34)
  {
    objc_msgSend_setShareAccessRequest_(self, (const char *)v101, v34);
  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  v36 = v101[17];
  if (queryRetrieveRequest)
  {
    if (v36)
      objc_msgSend_mergeFrom_(queryRetrieveRequest, (const char *)v101, v36);
  }
  else if (v36)
  {
    objc_msgSend_setQueryRetrieveRequest_(self, (const char *)v101, v36);
  }
  mergeableDeltaSaveRequest = self->_mergeableDeltaSaveRequest;
  v38 = v101[14];
  if (mergeableDeltaSaveRequest)
  {
    if (v38)
      objc_msgSend_mergeFrom_(mergeableDeltaSaveRequest, (const char *)v101, v38);
  }
  else if (v38)
  {
    objc_msgSend_setMergeableDeltaSaveRequest_(self, (const char *)v101, v38);
  }
  mergeableDeltaMetadataRetrieveRequest = self->_mergeableDeltaMetadataRetrieveRequest;
  v40 = v101[11];
  if (mergeableDeltaMetadataRetrieveRequest)
  {
    if (v40)
      objc_msgSend_mergeFrom_(mergeableDeltaMetadataRetrieveRequest, (const char *)v101, v40);
  }
  else if (v40)
  {
    objc_msgSend_setMergeableDeltaMetadataRetrieveRequest_(self, (const char *)v101, v40);
  }
  mergeableDeltaReplaceRequest = self->_mergeableDeltaReplaceRequest;
  v42 = v101[12];
  if (mergeableDeltaReplaceRequest)
  {
    if (v42)
      objc_msgSend_mergeFrom_(mergeableDeltaReplaceRequest, (const char *)v101, v42);
  }
  else if (v42)
  {
    objc_msgSend_setMergeableDeltaReplaceRequest_(self, (const char *)v101, v42);
  }
  mergeableDeltaRetrieveRequest = self->_mergeableDeltaRetrieveRequest;
  v44 = v101[13];
  if (mergeableDeltaRetrieveRequest)
  {
    if (v44)
      objc_msgSend_mergeFrom_(mergeableDeltaRetrieveRequest, (const char *)v101, v44);
  }
  else if (v44)
  {
    objc_msgSend_setMergeableDeltaRetrieveRequest_(self, (const char *)v101, v44);
  }
  assetUploadTokenRetrieveRequest = self->_assetUploadTokenRetrieveRequest;
  v46 = v101[4];
  if (assetUploadTokenRetrieveRequest)
  {
    if (v46)
      objc_msgSend_mergeFrom_(assetUploadTokenRetrieveRequest, (const char *)v101, v46);
  }
  else if (v46)
  {
    objc_msgSend_setAssetUploadTokenRetrieveRequest_(self, (const char *)v101, v46);
  }
  deleteContainerRequest = self->_deleteContainerRequest;
  v48 = v101[6];
  if (deleteContainerRequest)
  {
    if (v48)
      objc_msgSend_mergeFrom_(deleteContainerRequest, (const char *)v101, v48);
  }
  else if (v48)
  {
    objc_msgSend_setDeleteContainerRequest_(self, (const char *)v101, v48);
  }
  userAvailableQuotaRequest = self->_userAvailableQuotaRequest;
  v50 = v101[37];
  if (userAvailableQuotaRequest)
  {
    if (v50)
      objc_msgSend_mergeFrom_(userAvailableQuotaRequest, (const char *)v101, v50);
  }
  else if (v50)
  {
    objc_msgSend_setUserAvailableQuotaRequest_(self, (const char *)v101, v50);
  }
  bundlesForContainerRequest = self->_bundlesForContainerRequest;
  v52 = v101[5];
  if (bundlesForContainerRequest)
  {
    if (v52)
      objc_msgSend_mergeFrom_(bundlesForContainerRequest, (const char *)v101, v52);
  }
  else if (v52)
  {
    objc_msgSend_setBundlesForContainerRequest_(self, (const char *)v101, v52);
  }
  webAuthTokenRetrieveRequest = self->_webAuthTokenRetrieveRequest;
  v54 = v101[44];
  if (webAuthTokenRetrieveRequest)
  {
    if (v54)
      objc_msgSend_mergeFrom_(webAuthTokenRetrieveRequest, (const char *)v101, v54);
  }
  else if (v54)
  {
    objc_msgSend_setWebAuthTokenRetrieveRequest_(self, (const char *)v101, v54);
  }
  updateMissingAssetStatusRequest = self->_updateMissingAssetStatusRequest;
  v56 = v101[36];
  if (updateMissingAssetStatusRequest)
  {
    if (v56)
      objc_msgSend_mergeFrom_(updateMissingAssetStatusRequest, (const char *)v101, v56);
  }
  else if (v56)
  {
    objc_msgSend_setUpdateMissingAssetStatusRequest_(self, (const char *)v101, v56);
  }
  anonymousShareAddRequest = self->_anonymousShareAddRequest;
  v58 = v101[1];
  if (anonymousShareAddRequest)
  {
    if (v58)
      objc_msgSend_mergeFrom_(anonymousShareAddRequest, (const char *)v101, v58);
  }
  else if (v58)
  {
    objc_msgSend_setAnonymousShareAddRequest_(self, (const char *)v101, v58);
  }
  anonymousShareRemoveRequest = self->_anonymousShareRemoveRequest;
  v60 = v101[2];
  if (anonymousShareRemoveRequest)
  {
    if (v60)
      objc_msgSend_mergeFrom_(anonymousShareRemoveRequest, (const char *)v101, v60);
  }
  else if (v60)
  {
    objc_msgSend_setAnonymousShareRemoveRequest_(self, (const char *)v101, v60);
  }
  subscriptionCreateRequest = self->_subscriptionCreateRequest;
  v62 = v101[31];
  if (subscriptionCreateRequest)
  {
    if (v62)
      objc_msgSend_mergeFrom_(subscriptionCreateRequest, (const char *)v101, v62);
  }
  else if (v62)
  {
    objc_msgSend_setSubscriptionCreateRequest_(self, (const char *)v101, v62);
  }
  subscriptionRetrieveRequest = self->_subscriptionRetrieveRequest;
  v64 = v101[33];
  if (subscriptionRetrieveRequest)
  {
    if (v64)
      objc_msgSend_mergeFrom_(subscriptionRetrieveRequest, (const char *)v101, v64);
  }
  else if (v64)
  {
    objc_msgSend_setSubscriptionRetrieveRequest_(self, (const char *)v101, v64);
  }
  subscriptionDeleteRequest = self->_subscriptionDeleteRequest;
  v66 = v101[32];
  if (subscriptionDeleteRequest)
  {
    if (v66)
      objc_msgSend_mergeFrom_(subscriptionDeleteRequest, (const char *)v101, v66);
  }
  else if (v66)
  {
    objc_msgSend_setSubscriptionDeleteRequest_(self, (const char *)v101, v66);
  }
  userRetrieveRequest = self->_userRetrieveRequest;
  v68 = v101[43];
  if (userRetrieveRequest)
  {
    if (v68)
      objc_msgSend_mergeFrom_(userRetrieveRequest, (const char *)v101, v68);
  }
  else if (v68)
  {
    objc_msgSend_setUserRetrieveRequest_(self, (const char *)v101, v68);
  }
  userQueryRequest = self->_userQueryRequest;
  v70 = v101[42];
  if (userQueryRequest)
  {
    if (v70)
      objc_msgSend_mergeFrom_(userQueryRequest, (const char *)v101, v70);
  }
  else if (v70)
  {
    objc_msgSend_setUserQueryRequest_(self, (const char *)v101, v70);
  }
  userPrivacySettingsRetrieveRequest = self->_userPrivacySettingsRetrieveRequest;
  v72 = v101[40];
  if (userPrivacySettingsRetrieveRequest)
  {
    if (v72)
      objc_msgSend_mergeFrom_(userPrivacySettingsRetrieveRequest, (const char *)v101, v72);
  }
  else if (v72)
  {
    objc_msgSend_setUserPrivacySettingsRetrieveRequest_(self, (const char *)v101, v72);
  }
  userPrivacySettingsUpdateRequest = self->_userPrivacySettingsUpdateRequest;
  v74 = v101[41];
  if (userPrivacySettingsUpdateRequest)
  {
    if (v74)
      objc_msgSend_mergeFrom_(userPrivacySettingsUpdateRequest, (const char *)v101, v74);
  }
  else if (v74)
  {
    objc_msgSend_setUserPrivacySettingsUpdateRequest_(self, (const char *)v101, v74);
  }
  userPrivacySettingsResetRequest = self->_userPrivacySettingsResetRequest;
  v76 = v101[39];
  if (userPrivacySettingsResetRequest)
  {
    if (v76)
      objc_msgSend_mergeFrom_(userPrivacySettingsResetRequest, (const char *)v101, v76);
  }
  else if (v76)
  {
    objc_msgSend_setUserPrivacySettingsResetRequest_(self, (const char *)v101, v76);
  }
  userPrivacySettingsBatchLookupRequest = self->_userPrivacySettingsBatchLookupRequest;
  v78 = v101[38];
  if (userPrivacySettingsBatchLookupRequest)
  {
    if (v78)
      objc_msgSend_mergeFrom_(userPrivacySettingsBatchLookupRequest, (const char *)v101, v78);
  }
  else if (v78)
  {
    objc_msgSend_setUserPrivacySettingsBatchLookupRequest_(self, (const char *)v101, v78);
  }
  shareAcceptRequest = self->_shareAcceptRequest;
  v80 = v101[27];
  if (shareAcceptRequest)
  {
    if (v80)
      objc_msgSend_mergeFrom_(shareAcceptRequest, (const char *)v101, v80);
  }
  else if (v80)
  {
    objc_msgSend_setShareAcceptRequest_(self, (const char *)v101, v80);
  }
  shareDeclineRequest = self->_shareDeclineRequest;
  v82 = v101[29];
  if (shareDeclineRequest)
  {
    if (v82)
      objc_msgSend_mergeFrom_(shareDeclineRequest, (const char *)v101, v82);
  }
  else if (v82)
  {
    objc_msgSend_setShareDeclineRequest_(self, (const char *)v101, v82);
  }
  shareVettingInitiateRequest = self->_shareVettingInitiateRequest;
  v84 = v101[30];
  if (shareVettingInitiateRequest)
  {
    if (v84)
      objc_msgSend_mergeFrom_(shareVettingInitiateRequest, (const char *)v101, v84);
  }
  else if (v84)
  {
    objc_msgSend_setShareVettingInitiateRequest_(self, (const char *)v101, v84);
  }
  tokenRegistrationRequest = self->_tokenRegistrationRequest;
  v86 = v101[34];
  if (tokenRegistrationRequest)
  {
    if (v86)
      objc_msgSend_mergeFrom_(tokenRegistrationRequest, (const char *)v101, v86);
  }
  else if (v86)
  {
    objc_msgSend_setTokenRegistrationRequest_(self, (const char *)v101, v86);
  }
  tokenUnregistrationRequest = self->_tokenUnregistrationRequest;
  v88 = v101[35];
  if (tokenUnregistrationRequest)
  {
    if (v88)
      objc_msgSend_mergeFrom_(tokenUnregistrationRequest, (const char *)v101, v88);
  }
  else if (v88)
  {
    objc_msgSend_setTokenUnregistrationRequest_(self, (const char *)v101, v88);
  }
  setBadgeCountRequest = self->_setBadgeCountRequest;
  v90 = v101[26];
  if (setBadgeCountRequest)
  {
    if (v90)
      objc_msgSend_mergeFrom_(setBadgeCountRequest, (const char *)v101, v90);
  }
  else if (v90)
  {
    objc_msgSend_setSetBadgeCountRequest_(self, (const char *)v101, v90);
  }
  notificationSyncRequest = self->_notificationSyncRequest;
  v92 = v101[16];
  if (notificationSyncRequest)
  {
    if (v92)
      objc_msgSend_mergeFrom_(notificationSyncRequest, (const char *)v101, v92);
  }
  else if (v92)
  {
    objc_msgSend_setNotificationSyncRequest_(self, (const char *)v101, v92);
  }
  notificationMarkReadRequest = self->_notificationMarkReadRequest;
  v94 = v101[15];
  if (notificationMarkReadRequest)
  {
    if (v94)
      objc_msgSend_mergeFrom_(notificationMarkReadRequest, (const char *)v101, v94);
  }
  else if (v94)
  {
    objc_msgSend_setNotificationMarkReadRequest_(self, (const char *)v101, v94);
  }
  archiveRecordsRequest = self->_archiveRecordsRequest;
  v96 = v101[3];
  if (archiveRecordsRequest)
  {
    if (v96)
      objc_msgSend_mergeFrom_(archiveRecordsRequest, (const char *)v101, v96);
  }
  else if (v96)
  {
    objc_msgSend_setArchiveRecordsRequest_(self, (const char *)v101, v96);
  }
  markAssetBrokenRequest = self->_markAssetBrokenRequest;
  v98 = v101[10];
  if (markAssetBrokenRequest)
  {
    if (v98)
      objc_msgSend_mergeFrom_(markAssetBrokenRequest, (const char *)v101, v98);
  }
  else if (v98)
  {
    objc_msgSend_setMarkAssetBrokenRequest_(self, (const char *)v101, v98);
  }
  functionInvokeRequest = self->_functionInvokeRequest;
  v100 = v101[8];
  if (functionInvokeRequest)
  {
    if (v100)
      objc_msgSend_mergeFrom_(functionInvokeRequest, (const char *)v101, v100);
  }
  else if (v100)
  {
    objc_msgSend_setFunctionInvokeRequest_(self, (const char *)v101, v100);
  }

}

- (BOOL)hasFunctionInvokeRequest
{
  return self->_functionInvokeRequest != 0;
}

- (CKDPCodeFunctionInvokeRequest)functionInvokeRequest
{
  return self->_functionInvokeRequest;
}

- (void)setFunctionInvokeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_functionInvokeRequest, a3);
}

- (BOOL)hasMergeableDeltaSaveRequest
{
  return self->_mergeableDeltaSaveRequest != 0;
}

- (CKDPMergeableDeltaSaveRequest)mergeableDeltaSaveRequest
{
  return self->_mergeableDeltaSaveRequest;
}

- (void)setMergeableDeltaSaveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaSaveRequest, a3);
}

- (BOOL)hasMergeableDeltaMetadataRetrieveRequest
{
  return self->_mergeableDeltaMetadataRetrieveRequest != 0;
}

- (CKDPMergeableDeltaMetadataRetrieveRequest)mergeableDeltaMetadataRetrieveRequest
{
  return self->_mergeableDeltaMetadataRetrieveRequest;
}

- (void)setMergeableDeltaMetadataRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataRetrieveRequest, a3);
}

- (BOOL)hasMergeableDeltaReplaceRequest
{
  return self->_mergeableDeltaReplaceRequest != 0;
}

- (CKDPMergeableDeltaReplaceRequest)mergeableDeltaReplaceRequest
{
  return self->_mergeableDeltaReplaceRequest;
}

- (void)setMergeableDeltaReplaceRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaReplaceRequest, a3);
}

- (BOOL)hasMergeableDeltaRetrieveRequest
{
  return self->_mergeableDeltaRetrieveRequest != 0;
}

- (CKDPMergeableDeltaRetrieveRequest)mergeableDeltaRetrieveRequest
{
  return self->_mergeableDeltaRetrieveRequest;
}

- (void)setMergeableDeltaRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaRetrieveRequest, a3);
}

- (BOOL)hasShareVettingInitiateRequest
{
  return self->_shareVettingInitiateRequest != 0;
}

- (CKDPShareVettingInitiateRequest)shareVettingInitiateRequest
{
  return self->_shareVettingInitiateRequest;
}

- (void)setShareVettingInitiateRequest:(id)a3
{
  objc_storeStrong((id *)&self->_shareVettingInitiateRequest, a3);
}

- (BOOL)hasZoneSaveRequest
{
  return self->_zoneSaveRequest != 0;
}

- (CKDPZoneSaveRequest)zoneSaveRequest
{
  return self->_zoneSaveRequest;
}

- (void)setZoneSaveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSaveRequest, a3);
}

- (BOOL)hasZoneRetrieveRequest
{
  return self->_zoneRetrieveRequest != 0;
}

- (CKDPZoneRetrieveRequest)zoneRetrieveRequest
{
  return self->_zoneRetrieveRequest;
}

- (void)setZoneRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_zoneRetrieveRequest, a3);
}

- (BOOL)hasZoneDeleteRequest
{
  return self->_zoneDeleteRequest != 0;
}

- (CKDPZoneDeleteRequest)zoneDeleteRequest
{
  return self->_zoneDeleteRequest;
}

- (void)setZoneDeleteRequest:(id)a3
{
  objc_storeStrong((id *)&self->_zoneDeleteRequest, a3);
}

- (BOOL)hasZoneRetrieveChangesRequest
{
  return self->_zoneRetrieveChangesRequest != 0;
}

- (BOOL)hasRecordSaveRequest
{
  return self->_recordSaveRequest != 0;
}

- (CKDPRecordSaveRequest)recordSaveRequest
{
  return self->_recordSaveRequest;
}

- (void)setRecordSaveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recordSaveRequest, a3);
}

- (BOOL)hasRecordRetrieveRequest
{
  return self->_recordRetrieveRequest != 0;
}

- (CKDPRecordRetrieveRequest)recordRetrieveRequest
{
  return self->_recordRetrieveRequest;
}

- (void)setRecordRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recordRetrieveRequest, a3);
}

- (BOOL)hasRecordRetrieveVersionsRequest
{
  return self->_recordRetrieveVersionsRequest != 0;
}

- (CKDPRecordRetrieveVersionsRequest)recordRetrieveVersionsRequest
{
  return self->_recordRetrieveVersionsRequest;
}

- (void)setRecordRetrieveVersionsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recordRetrieveVersionsRequest, a3);
}

- (BOOL)hasRecordRetrieveChangesRequest
{
  return self->_recordRetrieveChangesRequest != 0;
}

- (BOOL)hasRecordDeleteRequest
{
  return self->_recordDeleteRequest != 0;
}

- (CKDPRecordDeleteRequest)recordDeleteRequest
{
  return self->_recordDeleteRequest;
}

- (void)setRecordDeleteRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recordDeleteRequest, a3);
}

- (BOOL)hasRecordResolveTokenRequest
{
  return self->_recordResolveTokenRequest != 0;
}

- (CKDPRecordResolveTokenRequest)recordResolveTokenRequest
{
  return self->_recordResolveTokenRequest;
}

- (void)setRecordResolveTokenRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recordResolveTokenRequest, a3);
}

- (BOOL)hasShareAccessRequest
{
  return self->_shareAccessRequest != 0;
}

- (CKDPShareAccessRequest)shareAccessRequest
{
  return self->_shareAccessRequest;
}

- (void)setShareAccessRequest:(id)a3
{
  objc_storeStrong((id *)&self->_shareAccessRequest, a3);
}

- (BOOL)hasRecordMoveRequest
{
  return self->_recordMoveRequest != 0;
}

- (CKDPRecordMoveRequest)recordMoveRequest
{
  return self->_recordMoveRequest;
}

- (void)setRecordMoveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recordMoveRequest, a3);
}

- (BOOL)hasFetchArchivedRecordsRequest
{
  return self->_fetchArchivedRecordsRequest != 0;
}

- (CKDPFetchArchivedRecordsRequest)fetchArchivedRecordsRequest
{
  return self->_fetchArchivedRecordsRequest;
}

- (void)setFetchArchivedRecordsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchArchivedRecordsRequest, a3);
}

- (BOOL)hasUserAvailableQuotaRequest
{
  return self->_userAvailableQuotaRequest != 0;
}

- (CKDPUserAvailableQuotaRequest)userAvailableQuotaRequest
{
  return self->_userAvailableQuotaRequest;
}

- (void)setUserAvailableQuotaRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userAvailableQuotaRequest, a3);
}

- (BOOL)hasUserRetrieveRequest
{
  return self->_userRetrieveRequest != 0;
}

- (CKDPUserRetrieveRequest)userRetrieveRequest
{
  return self->_userRetrieveRequest;
}

- (void)setUserRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userRetrieveRequest, a3);
}

- (BOOL)hasQueryRetrieveRequest
{
  return self->_queryRetrieveRequest != 0;
}

- (BOOL)hasAssetUploadTokenRetrieveRequest
{
  return self->_assetUploadTokenRetrieveRequest != 0;
}

- (CKDPAssetUploadTokenRetrieveRequest)assetUploadTokenRetrieveRequest
{
  return self->_assetUploadTokenRetrieveRequest;
}

- (void)setAssetUploadTokenRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_assetUploadTokenRetrieveRequest, a3);
}

- (BOOL)hasDeleteContainerRequest
{
  return self->_deleteContainerRequest != 0;
}

- (CKDPDeleteContainerRequest)deleteContainerRequest
{
  return self->_deleteContainerRequest;
}

- (void)setDeleteContainerRequest:(id)a3
{
  objc_storeStrong((id *)&self->_deleteContainerRequest, a3);
}

- (BOOL)hasBundlesForContainerRequest
{
  return self->_bundlesForContainerRequest != 0;
}

- (CKDPBundlesForContainerRequest)bundlesForContainerRequest
{
  return self->_bundlesForContainerRequest;
}

- (void)setBundlesForContainerRequest:(id)a3
{
  objc_storeStrong((id *)&self->_bundlesForContainerRequest, a3);
}

- (BOOL)hasWebAuthTokenRetrieveRequest
{
  return self->_webAuthTokenRetrieveRequest != 0;
}

- (CKDPWebAuthTokenRetrieveRequest)webAuthTokenRetrieveRequest
{
  return self->_webAuthTokenRetrieveRequest;
}

- (void)setWebAuthTokenRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_webAuthTokenRetrieveRequest, a3);
}

- (BOOL)hasUpdateMissingAssetStatusRequest
{
  return self->_updateMissingAssetStatusRequest != 0;
}

- (CKDPUpdateMissingAssetStatusRequest)updateMissingAssetStatusRequest
{
  return self->_updateMissingAssetStatusRequest;
}

- (void)setUpdateMissingAssetStatusRequest:(id)a3
{
  objc_storeStrong((id *)&self->_updateMissingAssetStatusRequest, a3);
}

- (BOOL)hasShareAcceptRequest
{
  return self->_shareAcceptRequest != 0;
}

- (CKDPShareAcceptRequest)shareAcceptRequest
{
  return self->_shareAcceptRequest;
}

- (void)setShareAcceptRequest:(id)a3
{
  objc_storeStrong((id *)&self->_shareAcceptRequest, a3);
}

- (BOOL)hasShareDeclineRequest
{
  return self->_shareDeclineRequest != 0;
}

- (CKDPShareDeclineRequest)shareDeclineRequest
{
  return self->_shareDeclineRequest;
}

- (void)setShareDeclineRequest:(id)a3
{
  objc_storeStrong((id *)&self->_shareDeclineRequest, a3);
}

- (BOOL)hasAnonymousShareAddRequest
{
  return self->_anonymousShareAddRequest != 0;
}

- (CKDPAnonymousShareAddRequest)anonymousShareAddRequest
{
  return self->_anonymousShareAddRequest;
}

- (void)setAnonymousShareAddRequest:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousShareAddRequest, a3);
}

- (BOOL)hasAnonymousShareRemoveRequest
{
  return self->_anonymousShareRemoveRequest != 0;
}

- (CKDPAnonymousShareRemoveRequest)anonymousShareRemoveRequest
{
  return self->_anonymousShareRemoveRequest;
}

- (void)setAnonymousShareRemoveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousShareRemoveRequest, a3);
}

- (BOOL)hasSubscriptionCreateRequest
{
  return self->_subscriptionCreateRequest != 0;
}

- (CKDPSubscriptionCreateRequest)subscriptionCreateRequest
{
  return self->_subscriptionCreateRequest;
}

- (void)setSubscriptionCreateRequest:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionCreateRequest, a3);
}

- (BOOL)hasSubscriptionRetrieveRequest
{
  return self->_subscriptionRetrieveRequest != 0;
}

- (CKDPSubscriptionRetrieveRequest)subscriptionRetrieveRequest
{
  return self->_subscriptionRetrieveRequest;
}

- (void)setSubscriptionRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionRetrieveRequest, a3);
}

- (BOOL)hasSubscriptionDeleteRequest
{
  return self->_subscriptionDeleteRequest != 0;
}

- (CKDPSubscriptionDeleteRequest)subscriptionDeleteRequest
{
  return self->_subscriptionDeleteRequest;
}

- (void)setSubscriptionDeleteRequest:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionDeleteRequest, a3);
}

- (BOOL)hasArchiveRecordsRequest
{
  return self->_archiveRecordsRequest != 0;
}

- (CKDPArchiveRecordsRequest)archiveRecordsRequest
{
  return self->_archiveRecordsRequest;
}

- (void)setArchiveRecordsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_archiveRecordsRequest, a3);
}

- (BOOL)hasMarkAssetBrokenRequest
{
  return self->_markAssetBrokenRequest != 0;
}

- (CKDPMarkAssetBrokenRequest)markAssetBrokenRequest
{
  return self->_markAssetBrokenRequest;
}

- (void)setMarkAssetBrokenRequest:(id)a3
{
  objc_storeStrong((id *)&self->_markAssetBrokenRequest, a3);
}

- (BOOL)hasUserQueryRequest
{
  return self->_userQueryRequest != 0;
}

- (CKDPUserQueryRequest)userQueryRequest
{
  return self->_userQueryRequest;
}

- (void)setUserQueryRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userQueryRequest, a3);
}

- (BOOL)hasUserPrivacySettingsUpdateRequest
{
  return self->_userPrivacySettingsUpdateRequest != 0;
}

- (CKDPUserPrivacySettingsUpdateRequest)userPrivacySettingsUpdateRequest
{
  return self->_userPrivacySettingsUpdateRequest;
}

- (void)setUserPrivacySettingsUpdateRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettingsUpdateRequest, a3);
}

- (BOOL)hasUserPrivacySettingsResetRequest
{
  return self->_userPrivacySettingsResetRequest != 0;
}

- (CKDPUserPrivacySettingsResetRequest)userPrivacySettingsResetRequest
{
  return self->_userPrivacySettingsResetRequest;
}

- (void)setUserPrivacySettingsResetRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettingsResetRequest, a3);
}

- (BOOL)hasUserPrivacySettingsBatchLookupRequest
{
  return self->_userPrivacySettingsBatchLookupRequest != 0;
}

- (CKDPUserPrivacySettingsBatchLookupRequest)userPrivacySettingsBatchLookupRequest
{
  return self->_userPrivacySettingsBatchLookupRequest;
}

- (void)setUserPrivacySettingsBatchLookupRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettingsBatchLookupRequest, a3);
}

- (BOOL)hasUserPrivacySettingsRetrieveRequest
{
  return self->_userPrivacySettingsRetrieveRequest != 0;
}

- (CKDPUserPrivacySettingsRetrieveRequest)userPrivacySettingsRetrieveRequest
{
  return self->_userPrivacySettingsRetrieveRequest;
}

- (void)setUserPrivacySettingsRetrieveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettingsRetrieveRequest, a3);
}

- (BOOL)hasTokenRegistrationRequest
{
  return self->_tokenRegistrationRequest != 0;
}

- (CKDPTokenRegistrationRequest)tokenRegistrationRequest
{
  return self->_tokenRegistrationRequest;
}

- (void)setTokenRegistrationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_tokenRegistrationRequest, a3);
}

- (BOOL)hasTokenUnregistrationRequest
{
  return self->_tokenUnregistrationRequest != 0;
}

- (CKDPTokenUnregistrationRequest)tokenUnregistrationRequest
{
  return self->_tokenUnregistrationRequest;
}

- (void)setTokenUnregistrationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_tokenUnregistrationRequest, a3);
}

- (BOOL)hasSetBadgeCountRequest
{
  return self->_setBadgeCountRequest != 0;
}

- (CKDPSetBadgeCountRequest)setBadgeCountRequest
{
  return self->_setBadgeCountRequest;
}

- (void)setSetBadgeCountRequest:(id)a3
{
  objc_storeStrong((id *)&self->_setBadgeCountRequest, a3);
}

- (BOOL)hasNotificationSyncRequest
{
  return self->_notificationSyncRequest != 0;
}

- (CKDPNotificationSyncRequest)notificationSyncRequest
{
  return self->_notificationSyncRequest;
}

- (void)setNotificationSyncRequest:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSyncRequest, a3);
}

- (BOOL)hasNotificationMarkReadRequest
{
  return self->_notificationMarkReadRequest != 0;
}

- (CKDPNotificationMarkReadRequest)notificationMarkReadRequest
{
  return self->_notificationMarkReadRequest;
}

- (void)setNotificationMarkReadRequest:(id)a3
{
  objc_storeStrong((id *)&self->_notificationMarkReadRequest, a3);
}

@end
