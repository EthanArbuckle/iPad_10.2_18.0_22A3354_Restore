@implementation CKDPResponseOperation

- (CKDPResponseOperationResult)result
{
  return self->_result;
}

- (CKDPQueryRetrieveResponse)queryRetrieveResponse
{
  return self->_queryRetrieveResponse;
}

- (CKDPRecordRetrieveChangesResponse)recordRetrieveChangesResponse
{
  return self->_recordRetrieveChangesResponse;
}

- (BOOL)hasRecordRetrieveChangesResponse
{
  return self->_recordRetrieveChangesResponse != 0;
}

- (CKDPZoneRetrieveChangesResponse)zoneRetrieveChangesResponse
{
  return self->_zoneRetrieveChangesResponse;
}

- (BOOL)hasZoneRetrieveChangesResponse
{
  return self->_zoneRetrieveChangesResponse != 0;
}

- (BOOL)hasQueryRetrieveResponse
{
  return self->_queryRetrieveResponse != 0;
}

- (CKDPOperation)response
{
  return self->_response;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BE9C76D4((id *)&self->super.super.isa, (uint64_t)a3);
}

- (CKDPResponseOperationHeader)header
{
  return self->_header;
}

- (BOOL)hasResult
{
  return self->_result != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSaveResponse, 0);
  objc_storeStrong((id *)&self->_zoneRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_zoneRetrieveChangesResponse, 0);
  objc_storeStrong((id *)&self->_zoneDeleteResponse, 0);
  objc_storeStrong((id *)&self->_webAuthTokenRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_userRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_userQueryResponse, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsUpdateResponse, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsResetResponse, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsBatchLookupResponse, 0);
  objc_storeStrong((id *)&self->_userAvailableQuotaResponse, 0);
  objc_storeStrong((id *)&self->_updateMissingAssetStatusResponse, 0);
  objc_storeStrong((id *)&self->_tokenUnregistrationResponse, 0);
  objc_storeStrong((id *)&self->_tokenRegistrationResponse, 0);
  objc_storeStrong((id *)&self->_subscriptionRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_subscriptionDeleteResponse, 0);
  objc_storeStrong((id *)&self->_subscriptionCreateResponse, 0);
  objc_storeStrong((id *)&self->_shareVettingInitiateResponse, 0);
  objc_storeStrong((id *)&self->_shareDeclineResponse, 0);
  objc_storeStrong((id *)&self->_shareAccessResponse, 0);
  objc_storeStrong((id *)&self->_shareAcceptResponse, 0);
  objc_storeStrong((id *)&self->_setBadgeCountResponse, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_recordSaveResponse, 0);
  objc_storeStrong((id *)&self->_recordRetrieveVersionsResponse, 0);
  objc_storeStrong((id *)&self->_recordRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_recordRetrieveChangesResponse, 0);
  objc_storeStrong((id *)&self->_recordResolveTokenResponse, 0);
  objc_storeStrong((id *)&self->_recordMoveResponse, 0);
  objc_storeStrong((id *)&self->_recordDeleteResponse, 0);
  objc_storeStrong((id *)&self->_queryRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_notificationSyncResponse, 0);
  objc_storeStrong((id *)&self->_notificationMarkReadResponse, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaSaveResponse, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaReplaceResponse, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_markAssetBrokenResponse, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_functionInvokeResponse, 0);
  objc_storeStrong((id *)&self->_fetchArchivedRecordsResponse, 0);
  objc_storeStrong((id *)&self->_deleteContainerResponse, 0);
  objc_storeStrong((id *)&self->_bundlesForContainerResponse, 0);
  objc_storeStrong((id *)&self->_assetUploadTokenRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_archiveRecordsResponse, 0);
  objc_storeStrong((id *)&self->_anonymousShareRemoveResponse, 0);
  objc_storeStrong((id *)&self->_anonymousShareAddResponse, 0);
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
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
  v11.super_class = (Class)CKDPResponseOperation;
  -[CKDPResponseOperation description](&v11, sel_description);
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
  CKDPOperation *response;
  void *v8;
  const char *v9;
  CKDPResponseOperationResult *v10;
  void *v11;
  const char *v12;
  CKDPResponseOperationHeader *header;
  void *v14;
  const char *v15;
  CKDPCodeFunctionInvokeResponse *functionInvokeResponse;
  void *v17;
  const char *v18;
  CKDPMergeableDeltaSaveResponse *mergeableDeltaSaveResponse;
  void *v20;
  const char *v21;
  CKDPMergeableDeltaMetadataRetrieveResponse *mergeableDeltaMetadataRetrieveResponse;
  void *v23;
  const char *v24;
  CKDPMergeableDeltaReplaceResponse *mergeableDeltaReplaceResponse;
  void *v26;
  const char *v27;
  CKDPMergeableDeltaRetrieveResponse *mergeableDeltaRetrieveResponse;
  void *v29;
  const char *v30;
  CKDPShareVettingInitiateResponse *shareVettingInitiateResponse;
  void *v32;
  const char *v33;
  CKDPZoneSaveResponse *zoneSaveResponse;
  void *v35;
  const char *v36;
  CKDPZoneRetrieveResponse *zoneRetrieveResponse;
  void *v38;
  const char *v39;
  CKDPZoneDeleteResponse *zoneDeleteResponse;
  void *v41;
  const char *v42;
  CKDPZoneRetrieveChangesResponse *zoneRetrieveChangesResponse;
  void *v44;
  const char *v45;
  CKDPRecordSaveResponse *recordSaveResponse;
  void *v47;
  const char *v48;
  CKDPRecordRetrieveResponse *recordRetrieveResponse;
  void *v50;
  const char *v51;
  CKDPRecordRetrieveVersionsResponse *recordRetrieveVersionsResponse;
  void *v53;
  const char *v54;
  CKDPRecordRetrieveChangesResponse *recordRetrieveChangesResponse;
  void *v56;
  const char *v57;
  CKDPRecordDeleteResponse *recordDeleteResponse;
  void *v59;
  const char *v60;
  CKDPRecordResolveTokenResponse *recordResolveTokenResponse;
  void *v62;
  const char *v63;
  CKDPShareAccessResponse *shareAccessResponse;
  void *v65;
  const char *v66;
  CKDPRecordMoveResponse *recordMoveResponse;
  void *v68;
  const char *v69;
  CKDPFetchArchivedRecordsResponse *fetchArchivedRecordsResponse;
  void *v71;
  const char *v72;
  CKDPUserAvailableQuotaResponse *userAvailableQuotaResponse;
  void *v74;
  const char *v75;
  CKDPUserRetrieveResponse *userRetrieveResponse;
  void *v77;
  const char *v78;
  CKDPQueryRetrieveResponse *queryRetrieveResponse;
  void *v80;
  const char *v81;
  CKDPAssetUploadTokenRetrieveResponse *assetUploadTokenRetrieveResponse;
  void *v83;
  const char *v84;
  CKDPDeleteContainerResponse *deleteContainerResponse;
  void *v86;
  const char *v87;
  CKDPBundlesForContainerResponse *bundlesForContainerResponse;
  void *v89;
  const char *v90;
  CKDPWebAuthTokenRetrieveResponse *webAuthTokenRetrieveResponse;
  void *v92;
  const char *v93;
  CKDPUpdateMissingAssetStatusResponse *updateMissingAssetStatusResponse;
  void *v95;
  const char *v96;
  CKDPShareAcceptResponse *shareAcceptResponse;
  void *v98;
  const char *v99;
  CKDPShareDeclineResponse *shareDeclineResponse;
  void *v101;
  const char *v102;
  CKDPAnonymousShareAddResponse *anonymousShareAddResponse;
  void *v104;
  const char *v105;
  CKDPAnonymousShareRemoveResponse *anonymousShareRemoveResponse;
  void *v107;
  const char *v108;
  CKDPSubscriptionCreateResponse *subscriptionCreateResponse;
  void *v110;
  const char *v111;
  CKDPSubscriptionRetrieveResponse *subscriptionRetrieveResponse;
  void *v113;
  const char *v114;
  CKDPSubscriptionDeleteResponse *subscriptionDeleteResponse;
  void *v116;
  const char *v117;
  CKDPArchiveRecordsResponse *archiveRecordsResponse;
  void *v119;
  const char *v120;
  CKDPMarkAssetBrokenResponse *markAssetBrokenResponse;
  void *v122;
  const char *v123;
  CKDPUserQueryResponse *userQueryResponse;
  void *v125;
  const char *v126;
  CKDPUserPrivacySettingsUpdateResponse *userPrivacySettingsUpdateResponse;
  void *v128;
  const char *v129;
  CKDPUserPrivacySettingsResetResponse *userPrivacySettingsResetResponse;
  void *v131;
  const char *v132;
  CKDPUserPrivacySettingsBatchLookupResponse *userPrivacySettingsBatchLookupResponse;
  void *v134;
  const char *v135;
  CKDPUserPrivacySettingsRetrieveResponse *userPrivacySettingsRetrieveResponse;
  void *v137;
  const char *v138;
  CKDPTokenRegistrationResponse *tokenRegistrationResponse;
  void *v140;
  const char *v141;
  CKDPTokenUnregistrationResponse *tokenUnregistrationResponse;
  void *v143;
  const char *v144;
  CKDPSetBadgeCountResponse *setBadgeCountResponse;
  void *v146;
  const char *v147;
  CKDPNotificationSyncResponse *notificationSyncResponse;
  void *v149;
  const char *v150;
  CKDPNotificationMarkReadResponse *notificationMarkReadResponse;
  void *v152;
  const char *v153;
  id v154;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  if (response)
  {
    objc_msgSend_dictionaryRepresentation(response, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("response"));

  }
  v10 = self->_result;
  if (v10)
  {
    objc_msgSend_dictionaryRepresentation(v10, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("result"));

  }
  header = self->_header;
  if (header)
  {
    objc_msgSend_dictionaryRepresentation(header, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("header"));

  }
  functionInvokeResponse = self->_functionInvokeResponse;
  if (functionInvokeResponse)
  {
    objc_msgSend_dictionaryRepresentation(functionInvokeResponse, v4, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("functionInvokeResponse"));

  }
  mergeableDeltaSaveResponse = self->_mergeableDeltaSaveResponse;
  if (mergeableDeltaSaveResponse)
  {
    objc_msgSend_dictionaryRepresentation(mergeableDeltaSaveResponse, v4, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, CFSTR("mergeableDeltaSaveResponse"));

  }
  mergeableDeltaMetadataRetrieveResponse = self->_mergeableDeltaMetadataRetrieveResponse;
  if (mergeableDeltaMetadataRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(mergeableDeltaMetadataRetrieveResponse, v4, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, CFSTR("mergeableDeltaMetadataRetrieveResponse"));

  }
  mergeableDeltaReplaceResponse = self->_mergeableDeltaReplaceResponse;
  if (mergeableDeltaReplaceResponse)
  {
    objc_msgSend_dictionaryRepresentation(mergeableDeltaReplaceResponse, v4, v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, CFSTR("mergeableDeltaReplaceResponse"));

  }
  mergeableDeltaRetrieveResponse = self->_mergeableDeltaRetrieveResponse;
  if (mergeableDeltaRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(mergeableDeltaRetrieveResponse, v4, v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, CFSTR("mergeableDeltaRetrieveResponse"));

  }
  shareVettingInitiateResponse = self->_shareVettingInitiateResponse;
  if (shareVettingInitiateResponse)
  {
    objc_msgSend_dictionaryRepresentation(shareVettingInitiateResponse, v4, v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, CFSTR("shareVettingInitiateResponse"));

  }
  zoneSaveResponse = self->_zoneSaveResponse;
  if (zoneSaveResponse)
  {
    objc_msgSend_dictionaryRepresentation(zoneSaveResponse, v4, v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v35, CFSTR("zoneSaveResponse"));

  }
  zoneRetrieveResponse = self->_zoneRetrieveResponse;
  if (zoneRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(zoneRetrieveResponse, v4, v5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v39, (uint64_t)v38, CFSTR("zoneRetrieveResponse"));

  }
  zoneDeleteResponse = self->_zoneDeleteResponse;
  if (zoneDeleteResponse)
  {
    objc_msgSend_dictionaryRepresentation(zoneDeleteResponse, v4, v5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v42, (uint64_t)v41, CFSTR("zoneDeleteResponse"));

  }
  zoneRetrieveChangesResponse = self->_zoneRetrieveChangesResponse;
  if (zoneRetrieveChangesResponse)
  {
    objc_msgSend_dictionaryRepresentation(zoneRetrieveChangesResponse, v4, v5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v45, (uint64_t)v44, CFSTR("zoneRetrieveChangesResponse"));

  }
  recordSaveResponse = self->_recordSaveResponse;
  if (recordSaveResponse)
  {
    objc_msgSend_dictionaryRepresentation(recordSaveResponse, v4, v5);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v48, (uint64_t)v47, CFSTR("recordSaveResponse"));

  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  if (recordRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(recordRetrieveResponse, v4, v5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)v50, CFSTR("recordRetrieveResponse"));

  }
  recordRetrieveVersionsResponse = self->_recordRetrieveVersionsResponse;
  if (recordRetrieveVersionsResponse)
  {
    objc_msgSend_dictionaryRepresentation(recordRetrieveVersionsResponse, v4, v5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v54, (uint64_t)v53, CFSTR("recordRetrieveVersionsResponse"));

  }
  recordRetrieveChangesResponse = self->_recordRetrieveChangesResponse;
  if (recordRetrieveChangesResponse)
  {
    objc_msgSend_dictionaryRepresentation(recordRetrieveChangesResponse, v4, v5);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v57, (uint64_t)v56, CFSTR("recordRetrieveChangesResponse"));

  }
  recordDeleteResponse = self->_recordDeleteResponse;
  if (recordDeleteResponse)
  {
    objc_msgSend_dictionaryRepresentation(recordDeleteResponse, v4, v5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v60, (uint64_t)v59, CFSTR("recordDeleteResponse"));

  }
  recordResolveTokenResponse = self->_recordResolveTokenResponse;
  if (recordResolveTokenResponse)
  {
    objc_msgSend_dictionaryRepresentation(recordResolveTokenResponse, v4, v5);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v62, CFSTR("recordResolveTokenResponse"));

  }
  shareAccessResponse = self->_shareAccessResponse;
  if (shareAccessResponse)
  {
    objc_msgSend_dictionaryRepresentation(shareAccessResponse, v4, v5);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v66, (uint64_t)v65, CFSTR("shareAccessResponse"));

  }
  recordMoveResponse = self->_recordMoveResponse;
  if (recordMoveResponse)
  {
    objc_msgSend_dictionaryRepresentation(recordMoveResponse, v4, v5);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v69, (uint64_t)v68, CFSTR("recordMoveResponse"));

  }
  fetchArchivedRecordsResponse = self->_fetchArchivedRecordsResponse;
  if (fetchArchivedRecordsResponse)
  {
    objc_msgSend_dictionaryRepresentation(fetchArchivedRecordsResponse, v4, v5);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v72, (uint64_t)v71, CFSTR("fetchArchivedRecordsResponse"));

  }
  userAvailableQuotaResponse = self->_userAvailableQuotaResponse;
  if (userAvailableQuotaResponse)
  {
    objc_msgSend_dictionaryRepresentation(userAvailableQuotaResponse, v4, v5);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v75, (uint64_t)v74, CFSTR("userAvailableQuotaResponse"));

  }
  userRetrieveResponse = self->_userRetrieveResponse;
  if (userRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(userRetrieveResponse, v4, v5);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v78, (uint64_t)v77, CFSTR("userRetrieveResponse"));

  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  if (queryRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(queryRetrieveResponse, v4, v5);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v81, (uint64_t)v80, CFSTR("queryRetrieveResponse"));

  }
  assetUploadTokenRetrieveResponse = self->_assetUploadTokenRetrieveResponse;
  if (assetUploadTokenRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(assetUploadTokenRetrieveResponse, v4, v5);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v84, (uint64_t)v83, CFSTR("assetUploadTokenRetrieveResponse"));

  }
  deleteContainerResponse = self->_deleteContainerResponse;
  if (deleteContainerResponse)
  {
    objc_msgSend_dictionaryRepresentation(deleteContainerResponse, v4, v5);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v87, (uint64_t)v86, CFSTR("deleteContainerResponse"));

  }
  bundlesForContainerResponse = self->_bundlesForContainerResponse;
  if (bundlesForContainerResponse)
  {
    objc_msgSend_dictionaryRepresentation(bundlesForContainerResponse, v4, v5);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v90, (uint64_t)v89, CFSTR("bundlesForContainerResponse"));

  }
  webAuthTokenRetrieveResponse = self->_webAuthTokenRetrieveResponse;
  if (webAuthTokenRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(webAuthTokenRetrieveResponse, v4, v5);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v93, (uint64_t)v92, CFSTR("webAuthTokenRetrieveResponse"));

  }
  updateMissingAssetStatusResponse = self->_updateMissingAssetStatusResponse;
  if (updateMissingAssetStatusResponse)
  {
    objc_msgSend_dictionaryRepresentation(updateMissingAssetStatusResponse, v4, v5);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v96, (uint64_t)v95, CFSTR("updateMissingAssetStatusResponse"));

  }
  shareAcceptResponse = self->_shareAcceptResponse;
  if (shareAcceptResponse)
  {
    objc_msgSend_dictionaryRepresentation(shareAcceptResponse, v4, v5);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v99, (uint64_t)v98, CFSTR("shareAcceptResponse"));

  }
  shareDeclineResponse = self->_shareDeclineResponse;
  if (shareDeclineResponse)
  {
    objc_msgSend_dictionaryRepresentation(shareDeclineResponse, v4, v5);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v102, (uint64_t)v101, CFSTR("shareDeclineResponse"));

  }
  anonymousShareAddResponse = self->_anonymousShareAddResponse;
  if (anonymousShareAddResponse)
  {
    objc_msgSend_dictionaryRepresentation(anonymousShareAddResponse, v4, v5);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v105, (uint64_t)v104, CFSTR("anonymousShareAddResponse"));

  }
  anonymousShareRemoveResponse = self->_anonymousShareRemoveResponse;
  if (anonymousShareRemoveResponse)
  {
    objc_msgSend_dictionaryRepresentation(anonymousShareRemoveResponse, v4, v5);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v108, (uint64_t)v107, CFSTR("anonymousShareRemoveResponse"));

  }
  subscriptionCreateResponse = self->_subscriptionCreateResponse;
  if (subscriptionCreateResponse)
  {
    objc_msgSend_dictionaryRepresentation(subscriptionCreateResponse, v4, v5);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v111, (uint64_t)v110, CFSTR("subscriptionCreateResponse"));

  }
  subscriptionRetrieveResponse = self->_subscriptionRetrieveResponse;
  if (subscriptionRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(subscriptionRetrieveResponse, v4, v5);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v114, (uint64_t)v113, CFSTR("subscriptionRetrieveResponse"));

  }
  subscriptionDeleteResponse = self->_subscriptionDeleteResponse;
  if (subscriptionDeleteResponse)
  {
    objc_msgSend_dictionaryRepresentation(subscriptionDeleteResponse, v4, v5);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v117, (uint64_t)v116, CFSTR("subscriptionDeleteResponse"));

  }
  archiveRecordsResponse = self->_archiveRecordsResponse;
  if (archiveRecordsResponse)
  {
    objc_msgSend_dictionaryRepresentation(archiveRecordsResponse, v4, v5);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v120, (uint64_t)v119, CFSTR("archiveRecordsResponse"));

  }
  markAssetBrokenResponse = self->_markAssetBrokenResponse;
  if (markAssetBrokenResponse)
  {
    objc_msgSend_dictionaryRepresentation(markAssetBrokenResponse, v4, v5);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v123, (uint64_t)v122, CFSTR("markAssetBrokenResponse"));

  }
  userQueryResponse = self->_userQueryResponse;
  if (userQueryResponse)
  {
    objc_msgSend_dictionaryRepresentation(userQueryResponse, v4, v5);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v126, (uint64_t)v125, CFSTR("userQueryResponse"));

  }
  userPrivacySettingsUpdateResponse = self->_userPrivacySettingsUpdateResponse;
  if (userPrivacySettingsUpdateResponse)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettingsUpdateResponse, v4, v5);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v129, (uint64_t)v128, CFSTR("userPrivacySettingsUpdateResponse"));

  }
  userPrivacySettingsResetResponse = self->_userPrivacySettingsResetResponse;
  if (userPrivacySettingsResetResponse)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettingsResetResponse, v4, v5);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v132, (uint64_t)v131, CFSTR("userPrivacySettingsResetResponse"));

  }
  userPrivacySettingsBatchLookupResponse = self->_userPrivacySettingsBatchLookupResponse;
  if (userPrivacySettingsBatchLookupResponse)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettingsBatchLookupResponse, v4, v5);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v135, (uint64_t)v134, CFSTR("userPrivacySettingsBatchLookupResponse"));

  }
  userPrivacySettingsRetrieveResponse = self->_userPrivacySettingsRetrieveResponse;
  if (userPrivacySettingsRetrieveResponse)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettingsRetrieveResponse, v4, v5);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v138, (uint64_t)v137, CFSTR("userPrivacySettingsRetrieveResponse"));

  }
  tokenRegistrationResponse = self->_tokenRegistrationResponse;
  if (tokenRegistrationResponse)
  {
    objc_msgSend_dictionaryRepresentation(tokenRegistrationResponse, v4, v5);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v141, (uint64_t)v140, CFSTR("tokenRegistrationResponse"));

  }
  tokenUnregistrationResponse = self->_tokenUnregistrationResponse;
  if (tokenUnregistrationResponse)
  {
    objc_msgSend_dictionaryRepresentation(tokenUnregistrationResponse, v4, v5);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v144, (uint64_t)v143, CFSTR("tokenUnregistrationResponse"));

  }
  setBadgeCountResponse = self->_setBadgeCountResponse;
  if (setBadgeCountResponse)
  {
    objc_msgSend_dictionaryRepresentation(setBadgeCountResponse, v4, v5);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v147, (uint64_t)v146, CFSTR("setBadgeCountResponse"));

  }
  notificationSyncResponse = self->_notificationSyncResponse;
  if (notificationSyncResponse)
  {
    objc_msgSend_dictionaryRepresentation(notificationSyncResponse, v4, v5);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v150, (uint64_t)v149, CFSTR("notificationSyncResponse"));

  }
  notificationMarkReadResponse = self->_notificationMarkReadResponse;
  if (notificationMarkReadResponse)
  {
    objc_msgSend_dictionaryRepresentation(notificationMarkReadResponse, v4, v5);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v153, (uint64_t)v152, CFSTR("notificationMarkReadResponse"));

  }
  v154 = v6;

  return v154;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_response)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_result)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneDeleteResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zoneRetrieveChangesResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordRetrieveVersionsResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordRetrieveChangesResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordDeleteResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordResolveTokenResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_fetchArchivedRecordsResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordMoveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareAccessResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_queryRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mergeableDeltaSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mergeableDeltaMetadataRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mergeableDeltaReplaceResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mergeableDeltaRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_assetUploadTokenRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deleteContainerResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userAvailableQuotaResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bundlesForContainerResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_webAuthTokenRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_updateMissingAssetStatusResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_anonymousShareAddResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_anonymousShareRemoveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subscriptionCreateResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subscriptionRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_subscriptionDeleteResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userQueryResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userPrivacySettingsRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userPrivacySettingsUpdateResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userPrivacySettingsResetResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userPrivacySettingsBatchLookupResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareAcceptResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareDeclineResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_shareVettingInitiateResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tokenRegistrationResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_tokenUnregistrationResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_setBadgeCountResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notificationSyncResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_notificationMarkReadResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_archiveRecordsResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_markAssetBrokenResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_functionInvokeResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPOperation *response;
  CKDPResponseOperationResult *result;
  CKDPResponseOperationHeader *header;
  CKDPZoneSaveResponse *zoneSaveResponse;
  CKDPZoneRetrieveResponse *zoneRetrieveResponse;
  CKDPZoneDeleteResponse *zoneDeleteResponse;
  CKDPZoneRetrieveChangesResponse *zoneRetrieveChangesResponse;
  CKDPRecordSaveResponse *recordSaveResponse;
  CKDPRecordRetrieveResponse *recordRetrieveResponse;
  CKDPRecordRetrieveVersionsResponse *recordRetrieveVersionsResponse;
  CKDPRecordRetrieveChangesResponse *recordRetrieveChangesResponse;
  CKDPRecordDeleteResponse *recordDeleteResponse;
  CKDPRecordResolveTokenResponse *recordResolveTokenResponse;
  CKDPFetchArchivedRecordsResponse *fetchArchivedRecordsResponse;
  CKDPRecordMoveResponse *recordMoveResponse;
  CKDPShareAccessResponse *shareAccessResponse;
  CKDPQueryRetrieveResponse *queryRetrieveResponse;
  CKDPMergeableDeltaSaveResponse *mergeableDeltaSaveResponse;
  CKDPMergeableDeltaMetadataRetrieveResponse *mergeableDeltaMetadataRetrieveResponse;
  CKDPMergeableDeltaReplaceResponse *mergeableDeltaReplaceResponse;
  CKDPMergeableDeltaRetrieveResponse *mergeableDeltaRetrieveResponse;
  CKDPAssetUploadTokenRetrieveResponse *assetUploadTokenRetrieveResponse;
  CKDPDeleteContainerResponse *deleteContainerResponse;
  CKDPUserAvailableQuotaResponse *userAvailableQuotaResponse;
  CKDPBundlesForContainerResponse *bundlesForContainerResponse;
  CKDPWebAuthTokenRetrieveResponse *webAuthTokenRetrieveResponse;
  CKDPUpdateMissingAssetStatusResponse *updateMissingAssetStatusResponse;
  CKDPAnonymousShareAddResponse *anonymousShareAddResponse;
  CKDPAnonymousShareRemoveResponse *anonymousShareRemoveResponse;
  CKDPSubscriptionCreateResponse *subscriptionCreateResponse;
  CKDPSubscriptionRetrieveResponse *subscriptionRetrieveResponse;
  CKDPSubscriptionDeleteResponse *subscriptionDeleteResponse;
  CKDPUserRetrieveResponse *userRetrieveResponse;
  CKDPUserQueryResponse *userQueryResponse;
  CKDPUserPrivacySettingsRetrieveResponse *userPrivacySettingsRetrieveResponse;
  CKDPUserPrivacySettingsUpdateResponse *userPrivacySettingsUpdateResponse;
  CKDPUserPrivacySettingsResetResponse *userPrivacySettingsResetResponse;
  CKDPUserPrivacySettingsBatchLookupResponse *userPrivacySettingsBatchLookupResponse;
  CKDPShareAcceptResponse *shareAcceptResponse;
  CKDPShareDeclineResponse *shareDeclineResponse;
  CKDPShareVettingInitiateResponse *shareVettingInitiateResponse;
  CKDPTokenRegistrationResponse *tokenRegistrationResponse;
  CKDPTokenUnregistrationResponse *tokenUnregistrationResponse;
  CKDPSetBadgeCountResponse *setBadgeCountResponse;
  CKDPNotificationSyncResponse *notificationSyncResponse;
  CKDPNotificationMarkReadResponse *notificationMarkReadResponse;
  CKDPArchiveRecordsResponse *archiveRecordsResponse;
  CKDPMarkAssetBrokenResponse *markAssetBrokenResponse;
  CKDPCodeFunctionInvokeResponse *functionInvokeResponse;
  id v55;

  v4 = a3;
  response = self->_response;
  v55 = v4;
  if (response)
  {
    objc_msgSend_setResponse_(v4, v5, (uint64_t)response);
    v4 = v55;
  }
  result = self->_result;
  if (result)
  {
    objc_msgSend_setResult_(v55, v5, (uint64_t)result);
    v4 = v55;
  }
  header = self->_header;
  if (header)
  {
    objc_msgSend_setHeader_(v55, v5, (uint64_t)header);
    v4 = v55;
  }
  zoneSaveResponse = self->_zoneSaveResponse;
  if (zoneSaveResponse)
  {
    objc_msgSend_setZoneSaveResponse_(v55, v5, (uint64_t)zoneSaveResponse);
    v4 = v55;
  }
  zoneRetrieveResponse = self->_zoneRetrieveResponse;
  if (zoneRetrieveResponse)
  {
    objc_msgSend_setZoneRetrieveResponse_(v55, v5, (uint64_t)zoneRetrieveResponse);
    v4 = v55;
  }
  zoneDeleteResponse = self->_zoneDeleteResponse;
  if (zoneDeleteResponse)
  {
    objc_msgSend_setZoneDeleteResponse_(v55, v5, (uint64_t)zoneDeleteResponse);
    v4 = v55;
  }
  zoneRetrieveChangesResponse = self->_zoneRetrieveChangesResponse;
  if (zoneRetrieveChangesResponse)
  {
    objc_msgSend_setZoneRetrieveChangesResponse_(v55, v5, (uint64_t)zoneRetrieveChangesResponse);
    v4 = v55;
  }
  recordSaveResponse = self->_recordSaveResponse;
  if (recordSaveResponse)
  {
    objc_msgSend_setRecordSaveResponse_(v55, v5, (uint64_t)recordSaveResponse);
    v4 = v55;
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  if (recordRetrieveResponse)
  {
    objc_msgSend_setRecordRetrieveResponse_(v55, v5, (uint64_t)recordRetrieveResponse);
    v4 = v55;
  }
  recordRetrieveVersionsResponse = self->_recordRetrieveVersionsResponse;
  if (recordRetrieveVersionsResponse)
  {
    objc_msgSend_setRecordRetrieveVersionsResponse_(v55, v5, (uint64_t)recordRetrieveVersionsResponse);
    v4 = v55;
  }
  recordRetrieveChangesResponse = self->_recordRetrieveChangesResponse;
  if (recordRetrieveChangesResponse)
  {
    objc_msgSend_setRecordRetrieveChangesResponse_(v55, v5, (uint64_t)recordRetrieveChangesResponse);
    v4 = v55;
  }
  recordDeleteResponse = self->_recordDeleteResponse;
  if (recordDeleteResponse)
  {
    objc_msgSend_setRecordDeleteResponse_(v55, v5, (uint64_t)recordDeleteResponse);
    v4 = v55;
  }
  recordResolveTokenResponse = self->_recordResolveTokenResponse;
  if (recordResolveTokenResponse)
  {
    objc_msgSend_setRecordResolveTokenResponse_(v55, v5, (uint64_t)recordResolveTokenResponse);
    v4 = v55;
  }
  fetchArchivedRecordsResponse = self->_fetchArchivedRecordsResponse;
  if (fetchArchivedRecordsResponse)
  {
    objc_msgSend_setFetchArchivedRecordsResponse_(v55, v5, (uint64_t)fetchArchivedRecordsResponse);
    v4 = v55;
  }
  recordMoveResponse = self->_recordMoveResponse;
  if (recordMoveResponse)
  {
    objc_msgSend_setRecordMoveResponse_(v55, v5, (uint64_t)recordMoveResponse);
    v4 = v55;
  }
  shareAccessResponse = self->_shareAccessResponse;
  if (shareAccessResponse)
  {
    objc_msgSend_setShareAccessResponse_(v55, v5, (uint64_t)shareAccessResponse);
    v4 = v55;
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  if (queryRetrieveResponse)
  {
    objc_msgSend_setQueryRetrieveResponse_(v55, v5, (uint64_t)queryRetrieveResponse);
    v4 = v55;
  }
  mergeableDeltaSaveResponse = self->_mergeableDeltaSaveResponse;
  if (mergeableDeltaSaveResponse)
  {
    objc_msgSend_setMergeableDeltaSaveResponse_(v55, v5, (uint64_t)mergeableDeltaSaveResponse);
    v4 = v55;
  }
  mergeableDeltaMetadataRetrieveResponse = self->_mergeableDeltaMetadataRetrieveResponse;
  if (mergeableDeltaMetadataRetrieveResponse)
  {
    objc_msgSend_setMergeableDeltaMetadataRetrieveResponse_(v55, v5, (uint64_t)mergeableDeltaMetadataRetrieveResponse);
    v4 = v55;
  }
  mergeableDeltaReplaceResponse = self->_mergeableDeltaReplaceResponse;
  if (mergeableDeltaReplaceResponse)
  {
    objc_msgSend_setMergeableDeltaReplaceResponse_(v55, v5, (uint64_t)mergeableDeltaReplaceResponse);
    v4 = v55;
  }
  mergeableDeltaRetrieveResponse = self->_mergeableDeltaRetrieveResponse;
  if (mergeableDeltaRetrieveResponse)
  {
    objc_msgSend_setMergeableDeltaRetrieveResponse_(v55, v5, (uint64_t)mergeableDeltaRetrieveResponse);
    v4 = v55;
  }
  assetUploadTokenRetrieveResponse = self->_assetUploadTokenRetrieveResponse;
  if (assetUploadTokenRetrieveResponse)
  {
    objc_msgSend_setAssetUploadTokenRetrieveResponse_(v55, v5, (uint64_t)assetUploadTokenRetrieveResponse);
    v4 = v55;
  }
  deleteContainerResponse = self->_deleteContainerResponse;
  if (deleteContainerResponse)
  {
    objc_msgSend_setDeleteContainerResponse_(v55, v5, (uint64_t)deleteContainerResponse);
    v4 = v55;
  }
  userAvailableQuotaResponse = self->_userAvailableQuotaResponse;
  if (userAvailableQuotaResponse)
  {
    objc_msgSend_setUserAvailableQuotaResponse_(v55, v5, (uint64_t)userAvailableQuotaResponse);
    v4 = v55;
  }
  bundlesForContainerResponse = self->_bundlesForContainerResponse;
  if (bundlesForContainerResponse)
  {
    objc_msgSend_setBundlesForContainerResponse_(v55, v5, (uint64_t)bundlesForContainerResponse);
    v4 = v55;
  }
  webAuthTokenRetrieveResponse = self->_webAuthTokenRetrieveResponse;
  if (webAuthTokenRetrieveResponse)
  {
    objc_msgSend_setWebAuthTokenRetrieveResponse_(v55, v5, (uint64_t)webAuthTokenRetrieveResponse);
    v4 = v55;
  }
  updateMissingAssetStatusResponse = self->_updateMissingAssetStatusResponse;
  if (updateMissingAssetStatusResponse)
  {
    objc_msgSend_setUpdateMissingAssetStatusResponse_(v55, v5, (uint64_t)updateMissingAssetStatusResponse);
    v4 = v55;
  }
  anonymousShareAddResponse = self->_anonymousShareAddResponse;
  if (anonymousShareAddResponse)
  {
    objc_msgSend_setAnonymousShareAddResponse_(v55, v5, (uint64_t)anonymousShareAddResponse);
    v4 = v55;
  }
  anonymousShareRemoveResponse = self->_anonymousShareRemoveResponse;
  if (anonymousShareRemoveResponse)
  {
    objc_msgSend_setAnonymousShareRemoveResponse_(v55, v5, (uint64_t)anonymousShareRemoveResponse);
    v4 = v55;
  }
  subscriptionCreateResponse = self->_subscriptionCreateResponse;
  if (subscriptionCreateResponse)
  {
    objc_msgSend_setSubscriptionCreateResponse_(v55, v5, (uint64_t)subscriptionCreateResponse);
    v4 = v55;
  }
  subscriptionRetrieveResponse = self->_subscriptionRetrieveResponse;
  if (subscriptionRetrieveResponse)
  {
    objc_msgSend_setSubscriptionRetrieveResponse_(v55, v5, (uint64_t)subscriptionRetrieveResponse);
    v4 = v55;
  }
  subscriptionDeleteResponse = self->_subscriptionDeleteResponse;
  if (subscriptionDeleteResponse)
  {
    objc_msgSend_setSubscriptionDeleteResponse_(v55, v5, (uint64_t)subscriptionDeleteResponse);
    v4 = v55;
  }
  userRetrieveResponse = self->_userRetrieveResponse;
  if (userRetrieveResponse)
  {
    objc_msgSend_setUserRetrieveResponse_(v55, v5, (uint64_t)userRetrieveResponse);
    v4 = v55;
  }
  userQueryResponse = self->_userQueryResponse;
  if (userQueryResponse)
  {
    objc_msgSend_setUserQueryResponse_(v55, v5, (uint64_t)userQueryResponse);
    v4 = v55;
  }
  userPrivacySettingsRetrieveResponse = self->_userPrivacySettingsRetrieveResponse;
  if (userPrivacySettingsRetrieveResponse)
  {
    objc_msgSend_setUserPrivacySettingsRetrieveResponse_(v55, v5, (uint64_t)userPrivacySettingsRetrieveResponse);
    v4 = v55;
  }
  userPrivacySettingsUpdateResponse = self->_userPrivacySettingsUpdateResponse;
  if (userPrivacySettingsUpdateResponse)
  {
    objc_msgSend_setUserPrivacySettingsUpdateResponse_(v55, v5, (uint64_t)userPrivacySettingsUpdateResponse);
    v4 = v55;
  }
  userPrivacySettingsResetResponse = self->_userPrivacySettingsResetResponse;
  if (userPrivacySettingsResetResponse)
  {
    objc_msgSend_setUserPrivacySettingsResetResponse_(v55, v5, (uint64_t)userPrivacySettingsResetResponse);
    v4 = v55;
  }
  userPrivacySettingsBatchLookupResponse = self->_userPrivacySettingsBatchLookupResponse;
  if (userPrivacySettingsBatchLookupResponse)
  {
    objc_msgSend_setUserPrivacySettingsBatchLookupResponse_(v55, v5, (uint64_t)userPrivacySettingsBatchLookupResponse);
    v4 = v55;
  }
  shareAcceptResponse = self->_shareAcceptResponse;
  if (shareAcceptResponse)
  {
    objc_msgSend_setShareAcceptResponse_(v55, v5, (uint64_t)shareAcceptResponse);
    v4 = v55;
  }
  shareDeclineResponse = self->_shareDeclineResponse;
  if (shareDeclineResponse)
  {
    objc_msgSend_setShareDeclineResponse_(v55, v5, (uint64_t)shareDeclineResponse);
    v4 = v55;
  }
  shareVettingInitiateResponse = self->_shareVettingInitiateResponse;
  if (shareVettingInitiateResponse)
  {
    objc_msgSend_setShareVettingInitiateResponse_(v55, v5, (uint64_t)shareVettingInitiateResponse);
    v4 = v55;
  }
  tokenRegistrationResponse = self->_tokenRegistrationResponse;
  if (tokenRegistrationResponse)
  {
    objc_msgSend_setTokenRegistrationResponse_(v55, v5, (uint64_t)tokenRegistrationResponse);
    v4 = v55;
  }
  tokenUnregistrationResponse = self->_tokenUnregistrationResponse;
  if (tokenUnregistrationResponse)
  {
    objc_msgSend_setTokenUnregistrationResponse_(v55, v5, (uint64_t)tokenUnregistrationResponse);
    v4 = v55;
  }
  setBadgeCountResponse = self->_setBadgeCountResponse;
  if (setBadgeCountResponse)
  {
    objc_msgSend_setSetBadgeCountResponse_(v55, v5, (uint64_t)setBadgeCountResponse);
    v4 = v55;
  }
  notificationSyncResponse = self->_notificationSyncResponse;
  if (notificationSyncResponse)
  {
    objc_msgSend_setNotificationSyncResponse_(v55, v5, (uint64_t)notificationSyncResponse);
    v4 = v55;
  }
  notificationMarkReadResponse = self->_notificationMarkReadResponse;
  if (notificationMarkReadResponse)
  {
    objc_msgSend_setNotificationMarkReadResponse_(v55, v5, (uint64_t)notificationMarkReadResponse);
    v4 = v55;
  }
  archiveRecordsResponse = self->_archiveRecordsResponse;
  if (archiveRecordsResponse)
  {
    objc_msgSend_setArchiveRecordsResponse_(v55, v5, (uint64_t)archiveRecordsResponse);
    v4 = v55;
  }
  markAssetBrokenResponse = self->_markAssetBrokenResponse;
  if (markAssetBrokenResponse)
  {
    objc_msgSend_setMarkAssetBrokenResponse_(v55, v5, (uint64_t)markAssetBrokenResponse);
    v4 = v55;
  }
  functionInvokeResponse = self->_functionInvokeResponse;
  if (functionInvokeResponse)
  {
    objc_msgSend_setFunctionInvokeResponse_(v55, v5, (uint64_t)functionInvokeResponse);
    v4 = v55;
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
  const char *v155;
  uint64_t v156;
  void *v157;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_response, v11, (uint64_t)a3);
  v13 = (void *)v10[25];
  v10[25] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_result, v14, (uint64_t)a3);
  v16 = (void *)v10[26];
  v10[26] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_header, v17, (uint64_t)a3);
  v19 = (void *)v10[9];
  v10[9] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_zoneSaveResponse, v20, (uint64_t)a3);
  v22 = (void *)v10[49];
  v10[49] = v21;

  v24 = objc_msgSend_copyWithZone_(self->_zoneRetrieveResponse, v23, (uint64_t)a3);
  v25 = (void *)v10[48];
  v10[48] = v24;

  v27 = objc_msgSend_copyWithZone_(self->_zoneDeleteResponse, v26, (uint64_t)a3);
  v28 = (void *)v10[46];
  v10[46] = v27;

  v30 = objc_msgSend_copyWithZone_(self->_zoneRetrieveChangesResponse, v29, (uint64_t)a3);
  v31 = (void *)v10[47];
  v10[47] = v30;

  v33 = objc_msgSend_copyWithZone_(self->_recordSaveResponse, v32, (uint64_t)a3);
  v34 = (void *)v10[24];
  v10[24] = v33;

  v36 = objc_msgSend_copyWithZone_(self->_recordRetrieveResponse, v35, (uint64_t)a3);
  v37 = (void *)v10[22];
  v10[22] = v36;

  v39 = objc_msgSend_copyWithZone_(self->_recordRetrieveVersionsResponse, v38, (uint64_t)a3);
  v40 = (void *)v10[23];
  v10[23] = v39;

  v42 = objc_msgSend_copyWithZone_(self->_recordRetrieveChangesResponse, v41, (uint64_t)a3);
  v43 = (void *)v10[21];
  v10[21] = v42;

  v45 = objc_msgSend_copyWithZone_(self->_recordDeleteResponse, v44, (uint64_t)a3);
  v46 = (void *)v10[18];
  v10[18] = v45;

  v48 = objc_msgSend_copyWithZone_(self->_recordResolveTokenResponse, v47, (uint64_t)a3);
  v49 = (void *)v10[20];
  v10[20] = v48;

  v51 = objc_msgSend_copyWithZone_(self->_fetchArchivedRecordsResponse, v50, (uint64_t)a3);
  v52 = (void *)v10[7];
  v10[7] = v51;

  v54 = objc_msgSend_copyWithZone_(self->_recordMoveResponse, v53, (uint64_t)a3);
  v55 = (void *)v10[19];
  v10[19] = v54;

  v57 = objc_msgSend_copyWithZone_(self->_shareAccessResponse, v56, (uint64_t)a3);
  v58 = (void *)v10[29];
  v10[29] = v57;

  v60 = objc_msgSend_copyWithZone_(self->_queryRetrieveResponse, v59, (uint64_t)a3);
  v61 = (void *)v10[17];
  v10[17] = v60;

  v63 = objc_msgSend_copyWithZone_(self->_mergeableDeltaSaveResponse, v62, (uint64_t)a3);
  v64 = (void *)v10[14];
  v10[14] = v63;

  v66 = objc_msgSend_copyWithZone_(self->_mergeableDeltaMetadataRetrieveResponse, v65, (uint64_t)a3);
  v67 = (void *)v10[11];
  v10[11] = v66;

  v69 = objc_msgSend_copyWithZone_(self->_mergeableDeltaReplaceResponse, v68, (uint64_t)a3);
  v70 = (void *)v10[12];
  v10[12] = v69;

  v72 = objc_msgSend_copyWithZone_(self->_mergeableDeltaRetrieveResponse, v71, (uint64_t)a3);
  v73 = (void *)v10[13];
  v10[13] = v72;

  v75 = objc_msgSend_copyWithZone_(self->_assetUploadTokenRetrieveResponse, v74, (uint64_t)a3);
  v76 = (void *)v10[4];
  v10[4] = v75;

  v78 = objc_msgSend_copyWithZone_(self->_deleteContainerResponse, v77, (uint64_t)a3);
  v79 = (void *)v10[6];
  v10[6] = v78;

  v81 = objc_msgSend_copyWithZone_(self->_userAvailableQuotaResponse, v80, (uint64_t)a3);
  v82 = (void *)v10[38];
  v10[38] = v81;

  v84 = objc_msgSend_copyWithZone_(self->_bundlesForContainerResponse, v83, (uint64_t)a3);
  v85 = (void *)v10[5];
  v10[5] = v84;

  v87 = objc_msgSend_copyWithZone_(self->_webAuthTokenRetrieveResponse, v86, (uint64_t)a3);
  v88 = (void *)v10[45];
  v10[45] = v87;

  v90 = objc_msgSend_copyWithZone_(self->_updateMissingAssetStatusResponse, v89, (uint64_t)a3);
  v91 = (void *)v10[37];
  v10[37] = v90;

  v93 = objc_msgSend_copyWithZone_(self->_anonymousShareAddResponse, v92, (uint64_t)a3);
  v94 = (void *)v10[1];
  v10[1] = v93;

  v96 = objc_msgSend_copyWithZone_(self->_anonymousShareRemoveResponse, v95, (uint64_t)a3);
  v97 = (void *)v10[2];
  v10[2] = v96;

  v99 = objc_msgSend_copyWithZone_(self->_subscriptionCreateResponse, v98, (uint64_t)a3);
  v100 = (void *)v10[32];
  v10[32] = v99;

  v102 = objc_msgSend_copyWithZone_(self->_subscriptionRetrieveResponse, v101, (uint64_t)a3);
  v103 = (void *)v10[34];
  v10[34] = v102;

  v105 = objc_msgSend_copyWithZone_(self->_subscriptionDeleteResponse, v104, (uint64_t)a3);
  v106 = (void *)v10[33];
  v10[33] = v105;

  v108 = objc_msgSend_copyWithZone_(self->_userRetrieveResponse, v107, (uint64_t)a3);
  v109 = (void *)v10[44];
  v10[44] = v108;

  v111 = objc_msgSend_copyWithZone_(self->_userQueryResponse, v110, (uint64_t)a3);
  v112 = (void *)v10[43];
  v10[43] = v111;

  v114 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsRetrieveResponse, v113, (uint64_t)a3);
  v115 = (void *)v10[41];
  v10[41] = v114;

  v117 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsUpdateResponse, v116, (uint64_t)a3);
  v118 = (void *)v10[42];
  v10[42] = v117;

  v120 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsResetResponse, v119, (uint64_t)a3);
  v121 = (void *)v10[40];
  v10[40] = v120;

  v123 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsBatchLookupResponse, v122, (uint64_t)a3);
  v124 = (void *)v10[39];
  v10[39] = v123;

  v126 = objc_msgSend_copyWithZone_(self->_shareAcceptResponse, v125, (uint64_t)a3);
  v127 = (void *)v10[28];
  v10[28] = v126;

  v129 = objc_msgSend_copyWithZone_(self->_shareDeclineResponse, v128, (uint64_t)a3);
  v130 = (void *)v10[30];
  v10[30] = v129;

  v132 = objc_msgSend_copyWithZone_(self->_shareVettingInitiateResponse, v131, (uint64_t)a3);
  v133 = (void *)v10[31];
  v10[31] = v132;

  v135 = objc_msgSend_copyWithZone_(self->_tokenRegistrationResponse, v134, (uint64_t)a3);
  v136 = (void *)v10[35];
  v10[35] = v135;

  v138 = objc_msgSend_copyWithZone_(self->_tokenUnregistrationResponse, v137, (uint64_t)a3);
  v139 = (void *)v10[36];
  v10[36] = v138;

  v141 = objc_msgSend_copyWithZone_(self->_setBadgeCountResponse, v140, (uint64_t)a3);
  v142 = (void *)v10[27];
  v10[27] = v141;

  v144 = objc_msgSend_copyWithZone_(self->_notificationSyncResponse, v143, (uint64_t)a3);
  v145 = (void *)v10[16];
  v10[16] = v144;

  v147 = objc_msgSend_copyWithZone_(self->_notificationMarkReadResponse, v146, (uint64_t)a3);
  v148 = (void *)v10[15];
  v10[15] = v147;

  v150 = objc_msgSend_copyWithZone_(self->_archiveRecordsResponse, v149, (uint64_t)a3);
  v151 = (void *)v10[3];
  v10[3] = v150;

  v153 = objc_msgSend_copyWithZone_(self->_markAssetBrokenResponse, v152, (uint64_t)a3);
  v154 = (void *)v10[10];
  v10[10] = v153;

  v156 = objc_msgSend_copyWithZone_(self->_functionInvokeResponse, v155, (uint64_t)a3);
  v157 = (void *)v10[8];
  v10[8] = v156;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPOperation *response;
  uint64_t v9;
  CKDPResponseOperationResult *v10;
  uint64_t v11;
  CKDPResponseOperationHeader *header;
  uint64_t v13;
  CKDPZoneSaveResponse *zoneSaveResponse;
  uint64_t v15;
  CKDPZoneRetrieveResponse *zoneRetrieveResponse;
  uint64_t v17;
  CKDPZoneDeleteResponse *zoneDeleteResponse;
  uint64_t v19;
  CKDPZoneRetrieveChangesResponse *zoneRetrieveChangesResponse;
  uint64_t v21;
  CKDPRecordSaveResponse *recordSaveResponse;
  uint64_t v23;
  CKDPRecordRetrieveResponse *recordRetrieveResponse;
  uint64_t v25;
  CKDPRecordRetrieveVersionsResponse *recordRetrieveVersionsResponse;
  uint64_t v27;
  CKDPRecordRetrieveChangesResponse *recordRetrieveChangesResponse;
  uint64_t v29;
  CKDPRecordDeleteResponse *recordDeleteResponse;
  uint64_t v31;
  CKDPRecordResolveTokenResponse *recordResolveTokenResponse;
  uint64_t v33;
  CKDPFetchArchivedRecordsResponse *fetchArchivedRecordsResponse;
  uint64_t v35;
  CKDPRecordMoveResponse *recordMoveResponse;
  uint64_t v37;
  CKDPShareAccessResponse *shareAccessResponse;
  uint64_t v39;
  CKDPQueryRetrieveResponse *queryRetrieveResponse;
  uint64_t v41;
  CKDPMergeableDeltaSaveResponse *mergeableDeltaSaveResponse;
  uint64_t v43;
  CKDPMergeableDeltaMetadataRetrieveResponse *mergeableDeltaMetadataRetrieveResponse;
  uint64_t v45;
  CKDPMergeableDeltaReplaceResponse *mergeableDeltaReplaceResponse;
  uint64_t v47;
  CKDPMergeableDeltaRetrieveResponse *mergeableDeltaRetrieveResponse;
  uint64_t v49;
  CKDPAssetUploadTokenRetrieveResponse *assetUploadTokenRetrieveResponse;
  uint64_t v51;
  CKDPDeleteContainerResponse *deleteContainerResponse;
  uint64_t v53;
  CKDPUserAvailableQuotaResponse *userAvailableQuotaResponse;
  uint64_t v55;
  CKDPBundlesForContainerResponse *bundlesForContainerResponse;
  uint64_t v57;
  CKDPWebAuthTokenRetrieveResponse *webAuthTokenRetrieveResponse;
  uint64_t v59;
  CKDPUpdateMissingAssetStatusResponse *updateMissingAssetStatusResponse;
  uint64_t v61;
  CKDPAnonymousShareAddResponse *anonymousShareAddResponse;
  uint64_t v63;
  CKDPAnonymousShareRemoveResponse *anonymousShareRemoveResponse;
  uint64_t v65;
  CKDPSubscriptionCreateResponse *subscriptionCreateResponse;
  uint64_t v67;
  CKDPSubscriptionRetrieveResponse *subscriptionRetrieveResponse;
  uint64_t v69;
  CKDPSubscriptionDeleteResponse *subscriptionDeleteResponse;
  uint64_t v71;
  CKDPUserRetrieveResponse *userRetrieveResponse;
  uint64_t v73;
  CKDPUserQueryResponse *userQueryResponse;
  uint64_t v75;
  CKDPUserPrivacySettingsRetrieveResponse *userPrivacySettingsRetrieveResponse;
  uint64_t v77;
  CKDPUserPrivacySettingsUpdateResponse *userPrivacySettingsUpdateResponse;
  uint64_t v79;
  CKDPUserPrivacySettingsResetResponse *userPrivacySettingsResetResponse;
  uint64_t v81;
  CKDPUserPrivacySettingsBatchLookupResponse *userPrivacySettingsBatchLookupResponse;
  uint64_t v83;
  CKDPShareAcceptResponse *shareAcceptResponse;
  uint64_t v85;
  CKDPShareDeclineResponse *shareDeclineResponse;
  uint64_t v87;
  CKDPShareVettingInitiateResponse *shareVettingInitiateResponse;
  uint64_t v89;
  CKDPTokenRegistrationResponse *tokenRegistrationResponse;
  uint64_t v91;
  CKDPTokenUnregistrationResponse *tokenUnregistrationResponse;
  uint64_t v93;
  CKDPSetBadgeCountResponse *setBadgeCountResponse;
  uint64_t v95;
  CKDPNotificationSyncResponse *notificationSyncResponse;
  uint64_t v97;
  CKDPNotificationMarkReadResponse *notificationMarkReadResponse;
  uint64_t v99;
  CKDPArchiveRecordsResponse *archiveRecordsResponse;
  uint64_t v101;
  CKDPMarkAssetBrokenResponse *markAssetBrokenResponse;
  uint64_t v103;
  CKDPCodeFunctionInvokeResponse *functionInvokeResponse;
  uint64_t v105;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_100;
  response = self->_response;
  v9 = v4[25];
  if ((unint64_t)response | v9)
  {
    if (!objc_msgSend_isEqual_(response, v7, v9))
      goto LABEL_100;
  }
  v10 = self->_result;
  v11 = v4[26];
  if ((unint64_t)v10 | v11)
  {
    if (!objc_msgSend_isEqual_(v10, v7, v11))
      goto LABEL_100;
  }
  header = self->_header;
  v13 = v4[9];
  if ((unint64_t)header | v13)
  {
    if (!objc_msgSend_isEqual_(header, v7, v13))
      goto LABEL_100;
  }
  zoneSaveResponse = self->_zoneSaveResponse;
  v15 = v4[49];
  if ((unint64_t)zoneSaveResponse | v15)
  {
    if (!objc_msgSend_isEqual_(zoneSaveResponse, v7, v15))
      goto LABEL_100;
  }
  zoneRetrieveResponse = self->_zoneRetrieveResponse;
  v17 = v4[48];
  if ((unint64_t)zoneRetrieveResponse | v17)
  {
    if (!objc_msgSend_isEqual_(zoneRetrieveResponse, v7, v17))
      goto LABEL_100;
  }
  zoneDeleteResponse = self->_zoneDeleteResponse;
  v19 = v4[46];
  if ((unint64_t)zoneDeleteResponse | v19)
  {
    if (!objc_msgSend_isEqual_(zoneDeleteResponse, v7, v19))
      goto LABEL_100;
  }
  zoneRetrieveChangesResponse = self->_zoneRetrieveChangesResponse;
  v21 = v4[47];
  if ((unint64_t)zoneRetrieveChangesResponse | v21)
  {
    if (!objc_msgSend_isEqual_(zoneRetrieveChangesResponse, v7, v21))
      goto LABEL_100;
  }
  recordSaveResponse = self->_recordSaveResponse;
  v23 = v4[24];
  if ((unint64_t)recordSaveResponse | v23)
  {
    if (!objc_msgSend_isEqual_(recordSaveResponse, v7, v23))
      goto LABEL_100;
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  v25 = v4[22];
  if ((unint64_t)recordRetrieveResponse | v25)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveResponse, v7, v25))
      goto LABEL_100;
  }
  recordRetrieveVersionsResponse = self->_recordRetrieveVersionsResponse;
  v27 = v4[23];
  if ((unint64_t)recordRetrieveVersionsResponse | v27)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveVersionsResponse, v7, v27))
      goto LABEL_100;
  }
  recordRetrieveChangesResponse = self->_recordRetrieveChangesResponse;
  v29 = v4[21];
  if ((unint64_t)recordRetrieveChangesResponse | v29)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveChangesResponse, v7, v29))
      goto LABEL_100;
  }
  recordDeleteResponse = self->_recordDeleteResponse;
  v31 = v4[18];
  if ((unint64_t)recordDeleteResponse | v31)
  {
    if (!objc_msgSend_isEqual_(recordDeleteResponse, v7, v31))
      goto LABEL_100;
  }
  recordResolveTokenResponse = self->_recordResolveTokenResponse;
  v33 = v4[20];
  if ((unint64_t)recordResolveTokenResponse | v33)
  {
    if (!objc_msgSend_isEqual_(recordResolveTokenResponse, v7, v33))
      goto LABEL_100;
  }
  fetchArchivedRecordsResponse = self->_fetchArchivedRecordsResponse;
  v35 = v4[7];
  if ((unint64_t)fetchArchivedRecordsResponse | v35)
  {
    if (!objc_msgSend_isEqual_(fetchArchivedRecordsResponse, v7, v35))
      goto LABEL_100;
  }
  recordMoveResponse = self->_recordMoveResponse;
  v37 = v4[19];
  if ((unint64_t)recordMoveResponse | v37)
  {
    if (!objc_msgSend_isEqual_(recordMoveResponse, v7, v37))
      goto LABEL_100;
  }
  shareAccessResponse = self->_shareAccessResponse;
  v39 = v4[29];
  if ((unint64_t)shareAccessResponse | v39)
  {
    if (!objc_msgSend_isEqual_(shareAccessResponse, v7, v39))
      goto LABEL_100;
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  v41 = v4[17];
  if ((unint64_t)queryRetrieveResponse | v41)
  {
    if (!objc_msgSend_isEqual_(queryRetrieveResponse, v7, v41))
      goto LABEL_100;
  }
  mergeableDeltaSaveResponse = self->_mergeableDeltaSaveResponse;
  v43 = v4[14];
  if ((unint64_t)mergeableDeltaSaveResponse | v43)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaSaveResponse, v7, v43))
      goto LABEL_100;
  }
  mergeableDeltaMetadataRetrieveResponse = self->_mergeableDeltaMetadataRetrieveResponse;
  v45 = v4[11];
  if ((unint64_t)mergeableDeltaMetadataRetrieveResponse | v45)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaMetadataRetrieveResponse, v7, v45))
      goto LABEL_100;
  }
  mergeableDeltaReplaceResponse = self->_mergeableDeltaReplaceResponse;
  v47 = v4[12];
  if ((unint64_t)mergeableDeltaReplaceResponse | v47)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaReplaceResponse, v7, v47))
      goto LABEL_100;
  }
  mergeableDeltaRetrieveResponse = self->_mergeableDeltaRetrieveResponse;
  v49 = v4[13];
  if ((unint64_t)mergeableDeltaRetrieveResponse | v49)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaRetrieveResponse, v7, v49))
      goto LABEL_100;
  }
  assetUploadTokenRetrieveResponse = self->_assetUploadTokenRetrieveResponse;
  v51 = v4[4];
  if ((unint64_t)assetUploadTokenRetrieveResponse | v51)
  {
    if (!objc_msgSend_isEqual_(assetUploadTokenRetrieveResponse, v7, v51))
      goto LABEL_100;
  }
  deleteContainerResponse = self->_deleteContainerResponse;
  v53 = v4[6];
  if ((unint64_t)deleteContainerResponse | v53)
  {
    if (!objc_msgSend_isEqual_(deleteContainerResponse, v7, v53))
      goto LABEL_100;
  }
  userAvailableQuotaResponse = self->_userAvailableQuotaResponse;
  v55 = v4[38];
  if ((unint64_t)userAvailableQuotaResponse | v55)
  {
    if (!objc_msgSend_isEqual_(userAvailableQuotaResponse, v7, v55))
      goto LABEL_100;
  }
  bundlesForContainerResponse = self->_bundlesForContainerResponse;
  v57 = v4[5];
  if ((unint64_t)bundlesForContainerResponse | v57)
  {
    if (!objc_msgSend_isEqual_(bundlesForContainerResponse, v7, v57))
      goto LABEL_100;
  }
  webAuthTokenRetrieveResponse = self->_webAuthTokenRetrieveResponse;
  v59 = v4[45];
  if ((unint64_t)webAuthTokenRetrieveResponse | v59)
  {
    if (!objc_msgSend_isEqual_(webAuthTokenRetrieveResponse, v7, v59))
      goto LABEL_100;
  }
  updateMissingAssetStatusResponse = self->_updateMissingAssetStatusResponse;
  v61 = v4[37];
  if ((unint64_t)updateMissingAssetStatusResponse | v61)
  {
    if (!objc_msgSend_isEqual_(updateMissingAssetStatusResponse, v7, v61))
      goto LABEL_100;
  }
  anonymousShareAddResponse = self->_anonymousShareAddResponse;
  v63 = v4[1];
  if ((unint64_t)anonymousShareAddResponse | v63)
  {
    if (!objc_msgSend_isEqual_(anonymousShareAddResponse, v7, v63))
      goto LABEL_100;
  }
  anonymousShareRemoveResponse = self->_anonymousShareRemoveResponse;
  v65 = v4[2];
  if ((unint64_t)anonymousShareRemoveResponse | v65)
  {
    if (!objc_msgSend_isEqual_(anonymousShareRemoveResponse, v7, v65))
      goto LABEL_100;
  }
  subscriptionCreateResponse = self->_subscriptionCreateResponse;
  v67 = v4[32];
  if ((unint64_t)subscriptionCreateResponse | v67)
  {
    if (!objc_msgSend_isEqual_(subscriptionCreateResponse, v7, v67))
      goto LABEL_100;
  }
  subscriptionRetrieveResponse = self->_subscriptionRetrieveResponse;
  v69 = v4[34];
  if ((unint64_t)subscriptionRetrieveResponse | v69)
  {
    if (!objc_msgSend_isEqual_(subscriptionRetrieveResponse, v7, v69))
      goto LABEL_100;
  }
  subscriptionDeleteResponse = self->_subscriptionDeleteResponse;
  v71 = v4[33];
  if ((unint64_t)subscriptionDeleteResponse | v71)
  {
    if (!objc_msgSend_isEqual_(subscriptionDeleteResponse, v7, v71))
      goto LABEL_100;
  }
  userRetrieveResponse = self->_userRetrieveResponse;
  v73 = v4[44];
  if ((unint64_t)userRetrieveResponse | v73)
  {
    if (!objc_msgSend_isEqual_(userRetrieveResponse, v7, v73))
      goto LABEL_100;
  }
  userQueryResponse = self->_userQueryResponse;
  v75 = v4[43];
  if ((unint64_t)userQueryResponse | v75)
  {
    if (!objc_msgSend_isEqual_(userQueryResponse, v7, v75))
      goto LABEL_100;
  }
  userPrivacySettingsRetrieveResponse = self->_userPrivacySettingsRetrieveResponse;
  v77 = v4[41];
  if ((unint64_t)userPrivacySettingsRetrieveResponse | v77)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsRetrieveResponse, v7, v77))
      goto LABEL_100;
  }
  userPrivacySettingsUpdateResponse = self->_userPrivacySettingsUpdateResponse;
  v79 = v4[42];
  if ((unint64_t)userPrivacySettingsUpdateResponse | v79)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsUpdateResponse, v7, v79))
      goto LABEL_100;
  }
  userPrivacySettingsResetResponse = self->_userPrivacySettingsResetResponse;
  v81 = v4[40];
  if ((unint64_t)userPrivacySettingsResetResponse | v81)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsResetResponse, v7, v81))
      goto LABEL_100;
  }
  userPrivacySettingsBatchLookupResponse = self->_userPrivacySettingsBatchLookupResponse;
  v83 = v4[39];
  if ((unint64_t)userPrivacySettingsBatchLookupResponse | v83)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsBatchLookupResponse, v7, v83))
      goto LABEL_100;
  }
  shareAcceptResponse = self->_shareAcceptResponse;
  v85 = v4[28];
  if ((unint64_t)shareAcceptResponse | v85)
  {
    if (!objc_msgSend_isEqual_(shareAcceptResponse, v7, v85))
      goto LABEL_100;
  }
  shareDeclineResponse = self->_shareDeclineResponse;
  v87 = v4[30];
  if ((unint64_t)shareDeclineResponse | v87)
  {
    if (!objc_msgSend_isEqual_(shareDeclineResponse, v7, v87))
      goto LABEL_100;
  }
  shareVettingInitiateResponse = self->_shareVettingInitiateResponse;
  v89 = v4[31];
  if ((unint64_t)shareVettingInitiateResponse | v89)
  {
    if (!objc_msgSend_isEqual_(shareVettingInitiateResponse, v7, v89))
      goto LABEL_100;
  }
  tokenRegistrationResponse = self->_tokenRegistrationResponse;
  v91 = v4[35];
  if ((unint64_t)tokenRegistrationResponse | v91)
  {
    if (!objc_msgSend_isEqual_(tokenRegistrationResponse, v7, v91))
      goto LABEL_100;
  }
  tokenUnregistrationResponse = self->_tokenUnregistrationResponse;
  v93 = v4[36];
  if ((unint64_t)tokenUnregistrationResponse | v93)
  {
    if (!objc_msgSend_isEqual_(tokenUnregistrationResponse, v7, v93))
      goto LABEL_100;
  }
  setBadgeCountResponse = self->_setBadgeCountResponse;
  v95 = v4[27];
  if ((unint64_t)setBadgeCountResponse | v95)
  {
    if (!objc_msgSend_isEqual_(setBadgeCountResponse, v7, v95))
      goto LABEL_100;
  }
  notificationSyncResponse = self->_notificationSyncResponse;
  v97 = v4[16];
  if ((unint64_t)notificationSyncResponse | v97)
  {
    if (!objc_msgSend_isEqual_(notificationSyncResponse, v7, v97))
      goto LABEL_100;
  }
  if (((notificationMarkReadResponse = self->_notificationMarkReadResponse,
         v99 = v4[15],
         !((unint64_t)notificationMarkReadResponse | v99))
     || objc_msgSend_isEqual_(notificationMarkReadResponse, v7, v99))
    && ((archiveRecordsResponse = self->_archiveRecordsResponse,
         v101 = v4[3],
         !((unint64_t)archiveRecordsResponse | v101))
     || objc_msgSend_isEqual_(archiveRecordsResponse, v7, v101))
    && ((markAssetBrokenResponse = self->_markAssetBrokenResponse,
         v103 = v4[10],
         !((unint64_t)markAssetBrokenResponse | v103))
     || objc_msgSend_isEqual_(markAssetBrokenResponse, v7, v103)))
  {
    functionInvokeResponse = self->_functionInvokeResponse;
    v105 = v4[8];
    if ((unint64_t)functionInvokeResponse | v105)
      isEqual = objc_msgSend_isEqual_(functionInvokeResponse, v7, v105);
    else
      isEqual = 1;
  }
  else
  {
LABEL_100:
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
  uint64_t v145;
  const char *v146;
  uint64_t v147;

  v4 = objc_msgSend_hash(self->_response, a2, v2);
  v7 = objc_msgSend_hash(self->_result, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_header, v8, v9);
  v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_zoneSaveResponse, v11, v12);
  v16 = objc_msgSend_hash(self->_zoneRetrieveResponse, v14, v15);
  v19 = v16 ^ objc_msgSend_hash(self->_zoneDeleteResponse, v17, v18);
  v22 = v13 ^ v19 ^ objc_msgSend_hash(self->_zoneRetrieveChangesResponse, v20, v21);
  v25 = objc_msgSend_hash(self->_recordSaveResponse, v23, v24);
  v28 = v25 ^ objc_msgSend_hash(self->_recordRetrieveResponse, v26, v27);
  v31 = v28 ^ objc_msgSend_hash(self->_recordRetrieveVersionsResponse, v29, v30);
  v34 = v22 ^ v31 ^ objc_msgSend_hash(self->_recordRetrieveChangesResponse, v32, v33);
  v37 = objc_msgSend_hash(self->_recordDeleteResponse, v35, v36);
  v40 = v37 ^ objc_msgSend_hash(self->_recordResolveTokenResponse, v38, v39);
  v43 = v40 ^ objc_msgSend_hash(self->_fetchArchivedRecordsResponse, v41, v42);
  v46 = v43 ^ objc_msgSend_hash(self->_recordMoveResponse, v44, v45);
  v49 = v34 ^ v46 ^ objc_msgSend_hash(self->_shareAccessResponse, v47, v48);
  v52 = objc_msgSend_hash(self->_queryRetrieveResponse, v50, v51);
  v55 = v52 ^ objc_msgSend_hash(self->_mergeableDeltaSaveResponse, v53, v54);
  v58 = v55 ^ objc_msgSend_hash(self->_mergeableDeltaMetadataRetrieveResponse, v56, v57);
  v61 = v58 ^ objc_msgSend_hash(self->_mergeableDeltaReplaceResponse, v59, v60);
  v64 = v61 ^ objc_msgSend_hash(self->_mergeableDeltaRetrieveResponse, v62, v63);
  v67 = v49 ^ v64 ^ objc_msgSend_hash(self->_assetUploadTokenRetrieveResponse, v65, v66);
  v70 = objc_msgSend_hash(self->_deleteContainerResponse, v68, v69);
  v73 = v70 ^ objc_msgSend_hash(self->_userAvailableQuotaResponse, v71, v72);
  v76 = v73 ^ objc_msgSend_hash(self->_bundlesForContainerResponse, v74, v75);
  v79 = v76 ^ objc_msgSend_hash(self->_webAuthTokenRetrieveResponse, v77, v78);
  v82 = v79 ^ objc_msgSend_hash(self->_updateMissingAssetStatusResponse, v80, v81);
  v85 = v82 ^ objc_msgSend_hash(self->_anonymousShareAddResponse, v83, v84);
  v88 = v67 ^ v85 ^ objc_msgSend_hash(self->_anonymousShareRemoveResponse, v86, v87);
  v91 = objc_msgSend_hash(self->_subscriptionCreateResponse, v89, v90);
  v94 = v91 ^ objc_msgSend_hash(self->_subscriptionRetrieveResponse, v92, v93);
  v97 = v94 ^ objc_msgSend_hash(self->_subscriptionDeleteResponse, v95, v96);
  v100 = v97 ^ objc_msgSend_hash(self->_userRetrieveResponse, v98, v99);
  v103 = v100 ^ objc_msgSend_hash(self->_userQueryResponse, v101, v102);
  v106 = v103 ^ objc_msgSend_hash(self->_userPrivacySettingsRetrieveResponse, v104, v105);
  v109 = v106 ^ objc_msgSend_hash(self->_userPrivacySettingsUpdateResponse, v107, v108);
  v112 = v88 ^ v109 ^ objc_msgSend_hash(self->_userPrivacySettingsResetResponse, v110, v111);
  v115 = objc_msgSend_hash(self->_userPrivacySettingsBatchLookupResponse, v113, v114);
  v118 = v115 ^ objc_msgSend_hash(self->_shareAcceptResponse, v116, v117);
  v121 = v118 ^ objc_msgSend_hash(self->_shareDeclineResponse, v119, v120);
  v124 = v121 ^ objc_msgSend_hash(self->_shareVettingInitiateResponse, v122, v123);
  v127 = v124 ^ objc_msgSend_hash(self->_tokenRegistrationResponse, v125, v126);
  v130 = v127 ^ objc_msgSend_hash(self->_tokenUnregistrationResponse, v128, v129);
  v133 = v130 ^ objc_msgSend_hash(self->_setBadgeCountResponse, v131, v132);
  v136 = v133 ^ objc_msgSend_hash(self->_notificationSyncResponse, v134, v135);
  v139 = v112 ^ v136 ^ objc_msgSend_hash(self->_notificationMarkReadResponse, v137, v138);
  v142 = objc_msgSend_hash(self->_archiveRecordsResponse, v140, v141);
  v145 = v142 ^ objc_msgSend_hash(self->_markAssetBrokenResponse, v143, v144);
  return v139 ^ v145 ^ objc_msgSend_hash(self->_functionInvokeResponse, v146, v147);
}

- (void)mergeFrom:(id)a3
{
  uint64_t *v4;
  CKDPOperation *response;
  uint64_t v6;
  CKDPResponseOperationResult *result;
  uint64_t v8;
  CKDPResponseOperationHeader *header;
  uint64_t v10;
  CKDPZoneSaveResponse *zoneSaveResponse;
  uint64_t v12;
  CKDPZoneRetrieveResponse *zoneRetrieveResponse;
  uint64_t v14;
  CKDPZoneDeleteResponse *zoneDeleteResponse;
  uint64_t v16;
  CKDPZoneRetrieveChangesResponse *zoneRetrieveChangesResponse;
  uint64_t v18;
  CKDPRecordSaveResponse *recordSaveResponse;
  uint64_t v20;
  CKDPRecordRetrieveResponse *recordRetrieveResponse;
  uint64_t v22;
  CKDPRecordRetrieveVersionsResponse *recordRetrieveVersionsResponse;
  uint64_t v24;
  CKDPRecordRetrieveChangesResponse *recordRetrieveChangesResponse;
  uint64_t v26;
  CKDPRecordDeleteResponse *recordDeleteResponse;
  uint64_t v28;
  CKDPRecordResolveTokenResponse *recordResolveTokenResponse;
  uint64_t v30;
  CKDPFetchArchivedRecordsResponse *fetchArchivedRecordsResponse;
  uint64_t v32;
  CKDPRecordMoveResponse *recordMoveResponse;
  uint64_t v34;
  CKDPShareAccessResponse *shareAccessResponse;
  uint64_t v36;
  CKDPQueryRetrieveResponse *queryRetrieveResponse;
  uint64_t v38;
  CKDPMergeableDeltaSaveResponse *mergeableDeltaSaveResponse;
  uint64_t v40;
  CKDPMergeableDeltaMetadataRetrieveResponse *mergeableDeltaMetadataRetrieveResponse;
  uint64_t v42;
  CKDPMergeableDeltaReplaceResponse *mergeableDeltaReplaceResponse;
  uint64_t v44;
  CKDPMergeableDeltaRetrieveResponse *mergeableDeltaRetrieveResponse;
  uint64_t v46;
  CKDPAssetUploadTokenRetrieveResponse *assetUploadTokenRetrieveResponse;
  uint64_t v48;
  CKDPDeleteContainerResponse *deleteContainerResponse;
  uint64_t v50;
  CKDPUserAvailableQuotaResponse *userAvailableQuotaResponse;
  uint64_t v52;
  CKDPBundlesForContainerResponse *bundlesForContainerResponse;
  uint64_t v54;
  CKDPWebAuthTokenRetrieveResponse *webAuthTokenRetrieveResponse;
  uint64_t v56;
  CKDPUpdateMissingAssetStatusResponse *updateMissingAssetStatusResponse;
  uint64_t v58;
  CKDPAnonymousShareAddResponse *anonymousShareAddResponse;
  uint64_t v60;
  CKDPAnonymousShareRemoveResponse *anonymousShareRemoveResponse;
  uint64_t v62;
  CKDPSubscriptionCreateResponse *subscriptionCreateResponse;
  uint64_t v64;
  CKDPSubscriptionRetrieveResponse *subscriptionRetrieveResponse;
  uint64_t v66;
  CKDPSubscriptionDeleteResponse *subscriptionDeleteResponse;
  uint64_t v68;
  CKDPUserRetrieveResponse *userRetrieveResponse;
  uint64_t v70;
  CKDPUserQueryResponse *userQueryResponse;
  uint64_t v72;
  CKDPUserPrivacySettingsRetrieveResponse *userPrivacySettingsRetrieveResponse;
  uint64_t v74;
  CKDPUserPrivacySettingsUpdateResponse *userPrivacySettingsUpdateResponse;
  uint64_t v76;
  CKDPUserPrivacySettingsResetResponse *userPrivacySettingsResetResponse;
  uint64_t v78;
  CKDPUserPrivacySettingsBatchLookupResponse *userPrivacySettingsBatchLookupResponse;
  uint64_t v80;
  CKDPShareAcceptResponse *shareAcceptResponse;
  uint64_t v82;
  CKDPShareDeclineResponse *shareDeclineResponse;
  uint64_t v84;
  CKDPShareVettingInitiateResponse *shareVettingInitiateResponse;
  uint64_t v86;
  CKDPTokenRegistrationResponse *tokenRegistrationResponse;
  uint64_t v88;
  CKDPTokenUnregistrationResponse *tokenUnregistrationResponse;
  uint64_t v90;
  CKDPSetBadgeCountResponse *setBadgeCountResponse;
  uint64_t v92;
  CKDPNotificationSyncResponse *notificationSyncResponse;
  uint64_t v94;
  CKDPNotificationMarkReadResponse *notificationMarkReadResponse;
  uint64_t v96;
  CKDPArchiveRecordsResponse *archiveRecordsResponse;
  uint64_t v98;
  CKDPMarkAssetBrokenResponse *markAssetBrokenResponse;
  uint64_t v100;
  CKDPCodeFunctionInvokeResponse *functionInvokeResponse;
  uint64_t v102;
  uint64_t *v103;

  v4 = (uint64_t *)a3;
  response = self->_response;
  v103 = v4;
  v6 = v4[25];
  if (response)
  {
    if (v6)
      objc_msgSend_mergeFrom_(response, (const char *)v4, v6);
  }
  else if (v6)
  {
    objc_msgSend_setResponse_(self, (const char *)v4, v6);
  }
  result = self->_result;
  v8 = v103[26];
  if (result)
  {
    if (v8)
      objc_msgSend_mergeFrom_(result, (const char *)v103, v8);
  }
  else if (v8)
  {
    objc_msgSend_setResult_(self, (const char *)v103, v8);
  }
  header = self->_header;
  v10 = v103[9];
  if (header)
  {
    if (v10)
      objc_msgSend_mergeFrom_(header, (const char *)v103, v10);
  }
  else if (v10)
  {
    objc_msgSend_setHeader_(self, (const char *)v103, v10);
  }
  zoneSaveResponse = self->_zoneSaveResponse;
  v12 = v103[49];
  if (zoneSaveResponse)
  {
    if (v12)
      objc_msgSend_mergeFrom_(zoneSaveResponse, (const char *)v103, v12);
  }
  else if (v12)
  {
    objc_msgSend_setZoneSaveResponse_(self, (const char *)v103, v12);
  }
  zoneRetrieveResponse = self->_zoneRetrieveResponse;
  v14 = v103[48];
  if (zoneRetrieveResponse)
  {
    if (v14)
      objc_msgSend_mergeFrom_(zoneRetrieveResponse, (const char *)v103, v14);
  }
  else if (v14)
  {
    objc_msgSend_setZoneRetrieveResponse_(self, (const char *)v103, v14);
  }
  zoneDeleteResponse = self->_zoneDeleteResponse;
  v16 = v103[46];
  if (zoneDeleteResponse)
  {
    if (v16)
      objc_msgSend_mergeFrom_(zoneDeleteResponse, (const char *)v103, v16);
  }
  else if (v16)
  {
    objc_msgSend_setZoneDeleteResponse_(self, (const char *)v103, v16);
  }
  zoneRetrieveChangesResponse = self->_zoneRetrieveChangesResponse;
  v18 = v103[47];
  if (zoneRetrieveChangesResponse)
  {
    if (v18)
      objc_msgSend_mergeFrom_(zoneRetrieveChangesResponse, (const char *)v103, v18);
  }
  else if (v18)
  {
    objc_msgSend_setZoneRetrieveChangesResponse_(self, (const char *)v103, v18);
  }
  recordSaveResponse = self->_recordSaveResponse;
  v20 = v103[24];
  if (recordSaveResponse)
  {
    if (v20)
      objc_msgSend_mergeFrom_(recordSaveResponse, (const char *)v103, v20);
  }
  else if (v20)
  {
    objc_msgSend_setRecordSaveResponse_(self, (const char *)v103, v20);
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  v22 = v103[22];
  if (recordRetrieveResponse)
  {
    if (v22)
      objc_msgSend_mergeFrom_(recordRetrieveResponse, (const char *)v103, v22);
  }
  else if (v22)
  {
    objc_msgSend_setRecordRetrieveResponse_(self, (const char *)v103, v22);
  }
  recordRetrieveVersionsResponse = self->_recordRetrieveVersionsResponse;
  v24 = v103[23];
  if (recordRetrieveVersionsResponse)
  {
    if (v24)
      objc_msgSend_mergeFrom_(recordRetrieveVersionsResponse, (const char *)v103, v24);
  }
  else if (v24)
  {
    objc_msgSend_setRecordRetrieveVersionsResponse_(self, (const char *)v103, v24);
  }
  recordRetrieveChangesResponse = self->_recordRetrieveChangesResponse;
  v26 = v103[21];
  if (recordRetrieveChangesResponse)
  {
    if (v26)
      objc_msgSend_mergeFrom_(recordRetrieveChangesResponse, (const char *)v103, v26);
  }
  else if (v26)
  {
    objc_msgSend_setRecordRetrieveChangesResponse_(self, (const char *)v103, v26);
  }
  recordDeleteResponse = self->_recordDeleteResponse;
  v28 = v103[18];
  if (recordDeleteResponse)
  {
    if (v28)
      objc_msgSend_mergeFrom_(recordDeleteResponse, (const char *)v103, v28);
  }
  else if (v28)
  {
    objc_msgSend_setRecordDeleteResponse_(self, (const char *)v103, v28);
  }
  recordResolveTokenResponse = self->_recordResolveTokenResponse;
  v30 = v103[20];
  if (recordResolveTokenResponse)
  {
    if (v30)
      objc_msgSend_mergeFrom_(recordResolveTokenResponse, (const char *)v103, v30);
  }
  else if (v30)
  {
    objc_msgSend_setRecordResolveTokenResponse_(self, (const char *)v103, v30);
  }
  fetchArchivedRecordsResponse = self->_fetchArchivedRecordsResponse;
  v32 = v103[7];
  if (fetchArchivedRecordsResponse)
  {
    if (v32)
      objc_msgSend_mergeFrom_(fetchArchivedRecordsResponse, (const char *)v103, v32);
  }
  else if (v32)
  {
    objc_msgSend_setFetchArchivedRecordsResponse_(self, (const char *)v103, v32);
  }
  recordMoveResponse = self->_recordMoveResponse;
  v34 = v103[19];
  if (recordMoveResponse)
  {
    if (v34)
      objc_msgSend_mergeFrom_(recordMoveResponse, (const char *)v103, v34);
  }
  else if (v34)
  {
    objc_msgSend_setRecordMoveResponse_(self, (const char *)v103, v34);
  }
  shareAccessResponse = self->_shareAccessResponse;
  v36 = v103[29];
  if (shareAccessResponse)
  {
    if (v36)
      objc_msgSend_mergeFrom_(shareAccessResponse, (const char *)v103, v36);
  }
  else if (v36)
  {
    objc_msgSend_setShareAccessResponse_(self, (const char *)v103, v36);
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  v38 = v103[17];
  if (queryRetrieveResponse)
  {
    if (v38)
      objc_msgSend_mergeFrom_(queryRetrieveResponse, (const char *)v103, v38);
  }
  else if (v38)
  {
    objc_msgSend_setQueryRetrieveResponse_(self, (const char *)v103, v38);
  }
  mergeableDeltaSaveResponse = self->_mergeableDeltaSaveResponse;
  v40 = v103[14];
  if (mergeableDeltaSaveResponse)
  {
    if (v40)
      objc_msgSend_mergeFrom_(mergeableDeltaSaveResponse, (const char *)v103, v40);
  }
  else if (v40)
  {
    objc_msgSend_setMergeableDeltaSaveResponse_(self, (const char *)v103, v40);
  }
  mergeableDeltaMetadataRetrieveResponse = self->_mergeableDeltaMetadataRetrieveResponse;
  v42 = v103[11];
  if (mergeableDeltaMetadataRetrieveResponse)
  {
    if (v42)
      objc_msgSend_mergeFrom_(mergeableDeltaMetadataRetrieveResponse, (const char *)v103, v42);
  }
  else if (v42)
  {
    objc_msgSend_setMergeableDeltaMetadataRetrieveResponse_(self, (const char *)v103, v42);
  }
  mergeableDeltaReplaceResponse = self->_mergeableDeltaReplaceResponse;
  v44 = v103[12];
  if (mergeableDeltaReplaceResponse)
  {
    if (v44)
      objc_msgSend_mergeFrom_(mergeableDeltaReplaceResponse, (const char *)v103, v44);
  }
  else if (v44)
  {
    objc_msgSend_setMergeableDeltaReplaceResponse_(self, (const char *)v103, v44);
  }
  mergeableDeltaRetrieveResponse = self->_mergeableDeltaRetrieveResponse;
  v46 = v103[13];
  if (mergeableDeltaRetrieveResponse)
  {
    if (v46)
      objc_msgSend_mergeFrom_(mergeableDeltaRetrieveResponse, (const char *)v103, v46);
  }
  else if (v46)
  {
    objc_msgSend_setMergeableDeltaRetrieveResponse_(self, (const char *)v103, v46);
  }
  assetUploadTokenRetrieveResponse = self->_assetUploadTokenRetrieveResponse;
  v48 = v103[4];
  if (assetUploadTokenRetrieveResponse)
  {
    if (v48)
      objc_msgSend_mergeFrom_(assetUploadTokenRetrieveResponse, (const char *)v103, v48);
  }
  else if (v48)
  {
    objc_msgSend_setAssetUploadTokenRetrieveResponse_(self, (const char *)v103, v48);
  }
  deleteContainerResponse = self->_deleteContainerResponse;
  v50 = v103[6];
  if (deleteContainerResponse)
  {
    if (v50)
      objc_msgSend_mergeFrom_(deleteContainerResponse, (const char *)v103, v50);
  }
  else if (v50)
  {
    objc_msgSend_setDeleteContainerResponse_(self, (const char *)v103, v50);
  }
  userAvailableQuotaResponse = self->_userAvailableQuotaResponse;
  v52 = v103[38];
  if (userAvailableQuotaResponse)
  {
    if (v52)
      objc_msgSend_mergeFrom_(userAvailableQuotaResponse, (const char *)v103, v52);
  }
  else if (v52)
  {
    objc_msgSend_setUserAvailableQuotaResponse_(self, (const char *)v103, v52);
  }
  bundlesForContainerResponse = self->_bundlesForContainerResponse;
  v54 = v103[5];
  if (bundlesForContainerResponse)
  {
    if (v54)
      objc_msgSend_mergeFrom_(bundlesForContainerResponse, (const char *)v103, v54);
  }
  else if (v54)
  {
    objc_msgSend_setBundlesForContainerResponse_(self, (const char *)v103, v54);
  }
  webAuthTokenRetrieveResponse = self->_webAuthTokenRetrieveResponse;
  v56 = v103[45];
  if (webAuthTokenRetrieveResponse)
  {
    if (v56)
      objc_msgSend_mergeFrom_(webAuthTokenRetrieveResponse, (const char *)v103, v56);
  }
  else if (v56)
  {
    objc_msgSend_setWebAuthTokenRetrieveResponse_(self, (const char *)v103, v56);
  }
  updateMissingAssetStatusResponse = self->_updateMissingAssetStatusResponse;
  v58 = v103[37];
  if (updateMissingAssetStatusResponse)
  {
    if (v58)
      objc_msgSend_mergeFrom_(updateMissingAssetStatusResponse, (const char *)v103, v58);
  }
  else if (v58)
  {
    objc_msgSend_setUpdateMissingAssetStatusResponse_(self, (const char *)v103, v58);
  }
  anonymousShareAddResponse = self->_anonymousShareAddResponse;
  v60 = v103[1];
  if (anonymousShareAddResponse)
  {
    if (v60)
      objc_msgSend_mergeFrom_(anonymousShareAddResponse, (const char *)v103, v60);
  }
  else if (v60)
  {
    objc_msgSend_setAnonymousShareAddResponse_(self, (const char *)v103, v60);
  }
  anonymousShareRemoveResponse = self->_anonymousShareRemoveResponse;
  v62 = v103[2];
  if (anonymousShareRemoveResponse)
  {
    if (v62)
      objc_msgSend_mergeFrom_(anonymousShareRemoveResponse, (const char *)v103, v62);
  }
  else if (v62)
  {
    objc_msgSend_setAnonymousShareRemoveResponse_(self, (const char *)v103, v62);
  }
  subscriptionCreateResponse = self->_subscriptionCreateResponse;
  v64 = v103[32];
  if (subscriptionCreateResponse)
  {
    if (v64)
      objc_msgSend_mergeFrom_(subscriptionCreateResponse, (const char *)v103, v64);
  }
  else if (v64)
  {
    objc_msgSend_setSubscriptionCreateResponse_(self, (const char *)v103, v64);
  }
  subscriptionRetrieveResponse = self->_subscriptionRetrieveResponse;
  v66 = v103[34];
  if (subscriptionRetrieveResponse)
  {
    if (v66)
      objc_msgSend_mergeFrom_(subscriptionRetrieveResponse, (const char *)v103, v66);
  }
  else if (v66)
  {
    objc_msgSend_setSubscriptionRetrieveResponse_(self, (const char *)v103, v66);
  }
  subscriptionDeleteResponse = self->_subscriptionDeleteResponse;
  v68 = v103[33];
  if (subscriptionDeleteResponse)
  {
    if (v68)
      objc_msgSend_mergeFrom_(subscriptionDeleteResponse, (const char *)v103, v68);
  }
  else if (v68)
  {
    objc_msgSend_setSubscriptionDeleteResponse_(self, (const char *)v103, v68);
  }
  userRetrieveResponse = self->_userRetrieveResponse;
  v70 = v103[44];
  if (userRetrieveResponse)
  {
    if (v70)
      objc_msgSend_mergeFrom_(userRetrieveResponse, (const char *)v103, v70);
  }
  else if (v70)
  {
    objc_msgSend_setUserRetrieveResponse_(self, (const char *)v103, v70);
  }
  userQueryResponse = self->_userQueryResponse;
  v72 = v103[43];
  if (userQueryResponse)
  {
    if (v72)
      objc_msgSend_mergeFrom_(userQueryResponse, (const char *)v103, v72);
  }
  else if (v72)
  {
    objc_msgSend_setUserQueryResponse_(self, (const char *)v103, v72);
  }
  userPrivacySettingsRetrieveResponse = self->_userPrivacySettingsRetrieveResponse;
  v74 = v103[41];
  if (userPrivacySettingsRetrieveResponse)
  {
    if (v74)
      objc_msgSend_mergeFrom_(userPrivacySettingsRetrieveResponse, (const char *)v103, v74);
  }
  else if (v74)
  {
    objc_msgSend_setUserPrivacySettingsRetrieveResponse_(self, (const char *)v103, v74);
  }
  userPrivacySettingsUpdateResponse = self->_userPrivacySettingsUpdateResponse;
  v76 = v103[42];
  if (userPrivacySettingsUpdateResponse)
  {
    if (v76)
      objc_msgSend_mergeFrom_(userPrivacySettingsUpdateResponse, (const char *)v103, v76);
  }
  else if (v76)
  {
    objc_msgSend_setUserPrivacySettingsUpdateResponse_(self, (const char *)v103, v76);
  }
  userPrivacySettingsResetResponse = self->_userPrivacySettingsResetResponse;
  v78 = v103[40];
  if (userPrivacySettingsResetResponse)
  {
    if (v78)
      objc_msgSend_mergeFrom_(userPrivacySettingsResetResponse, (const char *)v103, v78);
  }
  else if (v78)
  {
    objc_msgSend_setUserPrivacySettingsResetResponse_(self, (const char *)v103, v78);
  }
  userPrivacySettingsBatchLookupResponse = self->_userPrivacySettingsBatchLookupResponse;
  v80 = v103[39];
  if (userPrivacySettingsBatchLookupResponse)
  {
    if (v80)
      objc_msgSend_mergeFrom_(userPrivacySettingsBatchLookupResponse, (const char *)v103, v80);
  }
  else if (v80)
  {
    objc_msgSend_setUserPrivacySettingsBatchLookupResponse_(self, (const char *)v103, v80);
  }
  shareAcceptResponse = self->_shareAcceptResponse;
  v82 = v103[28];
  if (shareAcceptResponse)
  {
    if (v82)
      objc_msgSend_mergeFrom_(shareAcceptResponse, (const char *)v103, v82);
  }
  else if (v82)
  {
    objc_msgSend_setShareAcceptResponse_(self, (const char *)v103, v82);
  }
  shareDeclineResponse = self->_shareDeclineResponse;
  v84 = v103[30];
  if (shareDeclineResponse)
  {
    if (v84)
      objc_msgSend_mergeFrom_(shareDeclineResponse, (const char *)v103, v84);
  }
  else if (v84)
  {
    objc_msgSend_setShareDeclineResponse_(self, (const char *)v103, v84);
  }
  shareVettingInitiateResponse = self->_shareVettingInitiateResponse;
  v86 = v103[31];
  if (shareVettingInitiateResponse)
  {
    if (v86)
      objc_msgSend_mergeFrom_(shareVettingInitiateResponse, (const char *)v103, v86);
  }
  else if (v86)
  {
    objc_msgSend_setShareVettingInitiateResponse_(self, (const char *)v103, v86);
  }
  tokenRegistrationResponse = self->_tokenRegistrationResponse;
  v88 = v103[35];
  if (tokenRegistrationResponse)
  {
    if (v88)
      objc_msgSend_mergeFrom_(tokenRegistrationResponse, (const char *)v103, v88);
  }
  else if (v88)
  {
    objc_msgSend_setTokenRegistrationResponse_(self, (const char *)v103, v88);
  }
  tokenUnregistrationResponse = self->_tokenUnregistrationResponse;
  v90 = v103[36];
  if (tokenUnregistrationResponse)
  {
    if (v90)
      objc_msgSend_mergeFrom_(tokenUnregistrationResponse, (const char *)v103, v90);
  }
  else if (v90)
  {
    objc_msgSend_setTokenUnregistrationResponse_(self, (const char *)v103, v90);
  }
  setBadgeCountResponse = self->_setBadgeCountResponse;
  v92 = v103[27];
  if (setBadgeCountResponse)
  {
    if (v92)
      objc_msgSend_mergeFrom_(setBadgeCountResponse, (const char *)v103, v92);
  }
  else if (v92)
  {
    objc_msgSend_setSetBadgeCountResponse_(self, (const char *)v103, v92);
  }
  notificationSyncResponse = self->_notificationSyncResponse;
  v94 = v103[16];
  if (notificationSyncResponse)
  {
    if (v94)
      objc_msgSend_mergeFrom_(notificationSyncResponse, (const char *)v103, v94);
  }
  else if (v94)
  {
    objc_msgSend_setNotificationSyncResponse_(self, (const char *)v103, v94);
  }
  notificationMarkReadResponse = self->_notificationMarkReadResponse;
  v96 = v103[15];
  if (notificationMarkReadResponse)
  {
    if (v96)
      objc_msgSend_mergeFrom_(notificationMarkReadResponse, (const char *)v103, v96);
  }
  else if (v96)
  {
    objc_msgSend_setNotificationMarkReadResponse_(self, (const char *)v103, v96);
  }
  archiveRecordsResponse = self->_archiveRecordsResponse;
  v98 = v103[3];
  if (archiveRecordsResponse)
  {
    if (v98)
      objc_msgSend_mergeFrom_(archiveRecordsResponse, (const char *)v103, v98);
  }
  else if (v98)
  {
    objc_msgSend_setArchiveRecordsResponse_(self, (const char *)v103, v98);
  }
  markAssetBrokenResponse = self->_markAssetBrokenResponse;
  v100 = v103[10];
  if (markAssetBrokenResponse)
  {
    if (v100)
      objc_msgSend_mergeFrom_(markAssetBrokenResponse, (const char *)v103, v100);
  }
  else if (v100)
  {
    objc_msgSend_setMarkAssetBrokenResponse_(self, (const char *)v103, v100);
  }
  functionInvokeResponse = self->_functionInvokeResponse;
  v102 = v103[8];
  if (functionInvokeResponse)
  {
    if (v102)
      objc_msgSend_mergeFrom_(functionInvokeResponse, (const char *)v103, v102);
  }
  else if (v102)
  {
    objc_msgSend_setFunctionInvokeResponse_(self, (const char *)v103, v102);
  }

}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (BOOL)hasFunctionInvokeResponse
{
  return self->_functionInvokeResponse != 0;
}

- (CKDPCodeFunctionInvokeResponse)functionInvokeResponse
{
  return self->_functionInvokeResponse;
}

- (void)setFunctionInvokeResponse:(id)a3
{
  objc_storeStrong((id *)&self->_functionInvokeResponse, a3);
}

- (BOOL)hasMergeableDeltaSaveResponse
{
  return self->_mergeableDeltaSaveResponse != 0;
}

- (CKDPMergeableDeltaSaveResponse)mergeableDeltaSaveResponse
{
  return self->_mergeableDeltaSaveResponse;
}

- (void)setMergeableDeltaSaveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaSaveResponse, a3);
}

- (BOOL)hasMergeableDeltaMetadataRetrieveResponse
{
  return self->_mergeableDeltaMetadataRetrieveResponse != 0;
}

- (CKDPMergeableDeltaMetadataRetrieveResponse)mergeableDeltaMetadataRetrieveResponse
{
  return self->_mergeableDeltaMetadataRetrieveResponse;
}

- (void)setMergeableDeltaMetadataRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataRetrieveResponse, a3);
}

- (BOOL)hasMergeableDeltaReplaceResponse
{
  return self->_mergeableDeltaReplaceResponse != 0;
}

- (CKDPMergeableDeltaReplaceResponse)mergeableDeltaReplaceResponse
{
  return self->_mergeableDeltaReplaceResponse;
}

- (void)setMergeableDeltaReplaceResponse:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaReplaceResponse, a3);
}

- (BOOL)hasMergeableDeltaRetrieveResponse
{
  return self->_mergeableDeltaRetrieveResponse != 0;
}

- (CKDPMergeableDeltaRetrieveResponse)mergeableDeltaRetrieveResponse
{
  return self->_mergeableDeltaRetrieveResponse;
}

- (void)setMergeableDeltaRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaRetrieveResponse, a3);
}

- (BOOL)hasShareVettingInitiateResponse
{
  return self->_shareVettingInitiateResponse != 0;
}

- (CKDPShareVettingInitiateResponse)shareVettingInitiateResponse
{
  return self->_shareVettingInitiateResponse;
}

- (void)setShareVettingInitiateResponse:(id)a3
{
  objc_storeStrong((id *)&self->_shareVettingInitiateResponse, a3);
}

- (BOOL)hasZoneSaveResponse
{
  return self->_zoneSaveResponse != 0;
}

- (CKDPZoneSaveResponse)zoneSaveResponse
{
  return self->_zoneSaveResponse;
}

- (void)setZoneSaveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSaveResponse, a3);
}

- (BOOL)hasZoneRetrieveResponse
{
  return self->_zoneRetrieveResponse != 0;
}

- (CKDPZoneRetrieveResponse)zoneRetrieveResponse
{
  return self->_zoneRetrieveResponse;
}

- (void)setZoneRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_zoneRetrieveResponse, a3);
}

- (BOOL)hasZoneDeleteResponse
{
  return self->_zoneDeleteResponse != 0;
}

- (CKDPZoneDeleteResponse)zoneDeleteResponse
{
  return self->_zoneDeleteResponse;
}

- (void)setZoneDeleteResponse:(id)a3
{
  objc_storeStrong((id *)&self->_zoneDeleteResponse, a3);
}

- (void)setZoneRetrieveChangesResponse:(id)a3
{
  objc_storeStrong((id *)&self->_zoneRetrieveChangesResponse, a3);
}

- (BOOL)hasRecordSaveResponse
{
  return self->_recordSaveResponse != 0;
}

- (CKDPRecordSaveResponse)recordSaveResponse
{
  return self->_recordSaveResponse;
}

- (void)setRecordSaveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_recordSaveResponse, a3);
}

- (BOOL)hasRecordRetrieveResponse
{
  return self->_recordRetrieveResponse != 0;
}

- (CKDPRecordRetrieveResponse)recordRetrieveResponse
{
  return self->_recordRetrieveResponse;
}

- (void)setRecordRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_recordRetrieveResponse, a3);
}

- (BOOL)hasRecordRetrieveVersionsResponse
{
  return self->_recordRetrieveVersionsResponse != 0;
}

- (CKDPRecordRetrieveVersionsResponse)recordRetrieveVersionsResponse
{
  return self->_recordRetrieveVersionsResponse;
}

- (void)setRecordRetrieveVersionsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_recordRetrieveVersionsResponse, a3);
}

- (void)setRecordRetrieveChangesResponse:(id)a3
{
  objc_storeStrong((id *)&self->_recordRetrieveChangesResponse, a3);
}

- (BOOL)hasRecordDeleteResponse
{
  return self->_recordDeleteResponse != 0;
}

- (CKDPRecordDeleteResponse)recordDeleteResponse
{
  return self->_recordDeleteResponse;
}

- (void)setRecordDeleteResponse:(id)a3
{
  objc_storeStrong((id *)&self->_recordDeleteResponse, a3);
}

- (BOOL)hasRecordResolveTokenResponse
{
  return self->_recordResolveTokenResponse != 0;
}

- (CKDPRecordResolveTokenResponse)recordResolveTokenResponse
{
  return self->_recordResolveTokenResponse;
}

- (void)setRecordResolveTokenResponse:(id)a3
{
  objc_storeStrong((id *)&self->_recordResolveTokenResponse, a3);
}

- (BOOL)hasShareAccessResponse
{
  return self->_shareAccessResponse != 0;
}

- (CKDPShareAccessResponse)shareAccessResponse
{
  return self->_shareAccessResponse;
}

- (void)setShareAccessResponse:(id)a3
{
  objc_storeStrong((id *)&self->_shareAccessResponse, a3);
}

- (BOOL)hasRecordMoveResponse
{
  return self->_recordMoveResponse != 0;
}

- (CKDPRecordMoveResponse)recordMoveResponse
{
  return self->_recordMoveResponse;
}

- (void)setRecordMoveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_recordMoveResponse, a3);
}

- (BOOL)hasFetchArchivedRecordsResponse
{
  return self->_fetchArchivedRecordsResponse != 0;
}

- (CKDPFetchArchivedRecordsResponse)fetchArchivedRecordsResponse
{
  return self->_fetchArchivedRecordsResponse;
}

- (void)setFetchArchivedRecordsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_fetchArchivedRecordsResponse, a3);
}

- (BOOL)hasUserAvailableQuotaResponse
{
  return self->_userAvailableQuotaResponse != 0;
}

- (CKDPUserAvailableQuotaResponse)userAvailableQuotaResponse
{
  return self->_userAvailableQuotaResponse;
}

- (void)setUserAvailableQuotaResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userAvailableQuotaResponse, a3);
}

- (BOOL)hasUserRetrieveResponse
{
  return self->_userRetrieveResponse != 0;
}

- (CKDPUserRetrieveResponse)userRetrieveResponse
{
  return self->_userRetrieveResponse;
}

- (void)setUserRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userRetrieveResponse, a3);
}

- (void)setQueryRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_queryRetrieveResponse, a3);
}

- (BOOL)hasAssetUploadTokenRetrieveResponse
{
  return self->_assetUploadTokenRetrieveResponse != 0;
}

- (CKDPAssetUploadTokenRetrieveResponse)assetUploadTokenRetrieveResponse
{
  return self->_assetUploadTokenRetrieveResponse;
}

- (void)setAssetUploadTokenRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_assetUploadTokenRetrieveResponse, a3);
}

- (BOOL)hasDeleteContainerResponse
{
  return self->_deleteContainerResponse != 0;
}

- (CKDPDeleteContainerResponse)deleteContainerResponse
{
  return self->_deleteContainerResponse;
}

- (void)setDeleteContainerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_deleteContainerResponse, a3);
}

- (BOOL)hasBundlesForContainerResponse
{
  return self->_bundlesForContainerResponse != 0;
}

- (CKDPBundlesForContainerResponse)bundlesForContainerResponse
{
  return self->_bundlesForContainerResponse;
}

- (void)setBundlesForContainerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_bundlesForContainerResponse, a3);
}

- (BOOL)hasWebAuthTokenRetrieveResponse
{
  return self->_webAuthTokenRetrieveResponse != 0;
}

- (CKDPWebAuthTokenRetrieveResponse)webAuthTokenRetrieveResponse
{
  return self->_webAuthTokenRetrieveResponse;
}

- (void)setWebAuthTokenRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_webAuthTokenRetrieveResponse, a3);
}

- (BOOL)hasUpdateMissingAssetStatusResponse
{
  return self->_updateMissingAssetStatusResponse != 0;
}

- (CKDPUpdateMissingAssetStatusResponse)updateMissingAssetStatusResponse
{
  return self->_updateMissingAssetStatusResponse;
}

- (void)setUpdateMissingAssetStatusResponse:(id)a3
{
  objc_storeStrong((id *)&self->_updateMissingAssetStatusResponse, a3);
}

- (BOOL)hasShareAcceptResponse
{
  return self->_shareAcceptResponse != 0;
}

- (CKDPShareAcceptResponse)shareAcceptResponse
{
  return self->_shareAcceptResponse;
}

- (void)setShareAcceptResponse:(id)a3
{
  objc_storeStrong((id *)&self->_shareAcceptResponse, a3);
}

- (BOOL)hasShareDeclineResponse
{
  return self->_shareDeclineResponse != 0;
}

- (CKDPShareDeclineResponse)shareDeclineResponse
{
  return self->_shareDeclineResponse;
}

- (void)setShareDeclineResponse:(id)a3
{
  objc_storeStrong((id *)&self->_shareDeclineResponse, a3);
}

- (BOOL)hasAnonymousShareAddResponse
{
  return self->_anonymousShareAddResponse != 0;
}

- (CKDPAnonymousShareAddResponse)anonymousShareAddResponse
{
  return self->_anonymousShareAddResponse;
}

- (void)setAnonymousShareAddResponse:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousShareAddResponse, a3);
}

- (BOOL)hasAnonymousShareRemoveResponse
{
  return self->_anonymousShareRemoveResponse != 0;
}

- (CKDPAnonymousShareRemoveResponse)anonymousShareRemoveResponse
{
  return self->_anonymousShareRemoveResponse;
}

- (void)setAnonymousShareRemoveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousShareRemoveResponse, a3);
}

- (BOOL)hasSubscriptionCreateResponse
{
  return self->_subscriptionCreateResponse != 0;
}

- (CKDPSubscriptionCreateResponse)subscriptionCreateResponse
{
  return self->_subscriptionCreateResponse;
}

- (void)setSubscriptionCreateResponse:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionCreateResponse, a3);
}

- (BOOL)hasSubscriptionRetrieveResponse
{
  return self->_subscriptionRetrieveResponse != 0;
}

- (CKDPSubscriptionRetrieveResponse)subscriptionRetrieveResponse
{
  return self->_subscriptionRetrieveResponse;
}

- (void)setSubscriptionRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionRetrieveResponse, a3);
}

- (BOOL)hasSubscriptionDeleteResponse
{
  return self->_subscriptionDeleteResponse != 0;
}

- (CKDPSubscriptionDeleteResponse)subscriptionDeleteResponse
{
  return self->_subscriptionDeleteResponse;
}

- (void)setSubscriptionDeleteResponse:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionDeleteResponse, a3);
}

- (BOOL)hasArchiveRecordsResponse
{
  return self->_archiveRecordsResponse != 0;
}

- (CKDPArchiveRecordsResponse)archiveRecordsResponse
{
  return self->_archiveRecordsResponse;
}

- (void)setArchiveRecordsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_archiveRecordsResponse, a3);
}

- (BOOL)hasMarkAssetBrokenResponse
{
  return self->_markAssetBrokenResponse != 0;
}

- (CKDPMarkAssetBrokenResponse)markAssetBrokenResponse
{
  return self->_markAssetBrokenResponse;
}

- (void)setMarkAssetBrokenResponse:(id)a3
{
  objc_storeStrong((id *)&self->_markAssetBrokenResponse, a3);
}

- (BOOL)hasUserQueryResponse
{
  return self->_userQueryResponse != 0;
}

- (CKDPUserQueryResponse)userQueryResponse
{
  return self->_userQueryResponse;
}

- (void)setUserQueryResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userQueryResponse, a3);
}

- (BOOL)hasUserPrivacySettingsUpdateResponse
{
  return self->_userPrivacySettingsUpdateResponse != 0;
}

- (CKDPUserPrivacySettingsUpdateResponse)userPrivacySettingsUpdateResponse
{
  return self->_userPrivacySettingsUpdateResponse;
}

- (void)setUserPrivacySettingsUpdateResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettingsUpdateResponse, a3);
}

- (BOOL)hasUserPrivacySettingsResetResponse
{
  return self->_userPrivacySettingsResetResponse != 0;
}

- (CKDPUserPrivacySettingsResetResponse)userPrivacySettingsResetResponse
{
  return self->_userPrivacySettingsResetResponse;
}

- (void)setUserPrivacySettingsResetResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettingsResetResponse, a3);
}

- (BOOL)hasUserPrivacySettingsBatchLookupResponse
{
  return self->_userPrivacySettingsBatchLookupResponse != 0;
}

- (CKDPUserPrivacySettingsBatchLookupResponse)userPrivacySettingsBatchLookupResponse
{
  return self->_userPrivacySettingsBatchLookupResponse;
}

- (void)setUserPrivacySettingsBatchLookupResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettingsBatchLookupResponse, a3);
}

- (BOOL)hasUserPrivacySettingsRetrieveResponse
{
  return self->_userPrivacySettingsRetrieveResponse != 0;
}

- (CKDPUserPrivacySettingsRetrieveResponse)userPrivacySettingsRetrieveResponse
{
  return self->_userPrivacySettingsRetrieveResponse;
}

- (void)setUserPrivacySettingsRetrieveResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettingsRetrieveResponse, a3);
}

- (BOOL)hasTokenRegistrationResponse
{
  return self->_tokenRegistrationResponse != 0;
}

- (CKDPTokenRegistrationResponse)tokenRegistrationResponse
{
  return self->_tokenRegistrationResponse;
}

- (void)setTokenRegistrationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_tokenRegistrationResponse, a3);
}

- (BOOL)hasTokenUnregistrationResponse
{
  return self->_tokenUnregistrationResponse != 0;
}

- (CKDPTokenUnregistrationResponse)tokenUnregistrationResponse
{
  return self->_tokenUnregistrationResponse;
}

- (void)setTokenUnregistrationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_tokenUnregistrationResponse, a3);
}

- (BOOL)hasSetBadgeCountResponse
{
  return self->_setBadgeCountResponse != 0;
}

- (CKDPSetBadgeCountResponse)setBadgeCountResponse
{
  return self->_setBadgeCountResponse;
}

- (void)setSetBadgeCountResponse:(id)a3
{
  objc_storeStrong((id *)&self->_setBadgeCountResponse, a3);
}

- (BOOL)hasNotificationSyncResponse
{
  return self->_notificationSyncResponse != 0;
}

- (CKDPNotificationSyncResponse)notificationSyncResponse
{
  return self->_notificationSyncResponse;
}

- (void)setNotificationSyncResponse:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSyncResponse, a3);
}

- (BOOL)hasNotificationMarkReadResponse
{
  return self->_notificationMarkReadResponse != 0;
}

- (CKDPNotificationMarkReadResponse)notificationMarkReadResponse
{
  return self->_notificationMarkReadResponse;
}

- (void)setNotificationMarkReadResponse:(id)a3
{
  objc_storeStrong((id *)&self->_notificationMarkReadResponse, a3);
}

@end
