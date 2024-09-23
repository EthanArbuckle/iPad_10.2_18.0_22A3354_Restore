@implementation CKDPResponseOperationResultErrorClient

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("unknown");
  switch(a3)
  {
    case 1:
      return v3;
    case 2:
      v3 = CFSTR("expiredAppConfig");
      return v3;
    case 3:
      return CFSTR("expiredGlobalConfig");
    case 4:
      return CFSTR("badSyntax");
    case 5:
      return CFSTR("forbidden");
    case 6:
      return CFSTR("throttled");
    case 7:
      return CFSTR("refused");
    case 8:
      return CFSTR("notSupported");
    case 9:
      return CFSTR("exists");
    case 10:
      return CFSTR("requestAlreadyProcessed");
    case 11:
      return CFSTR("badAuthToken");
    case 12:
      return CFSTR("needsAuthentication");
    case 13:
      return CFSTR("mescalSignatureMissing");
    case 14:
      return CFSTR("invalidMescalSignature");
    case 15:
      return CFSTR("opLockFailure");
    case 16:
      return CFSTR("atomicFailure");
    case 17:
      return CFSTR("resetNeeded");
    case 18:
      return CFSTR("fieldsPerTypeLimitExceeded");
    case 19:
      return CFSTR("typeBusy");
    case 20:
      return CFSTR("numRecordTypesLimitExceeded");
    case 21:
      return CFSTR("invalidContainer");
    case 22:
      return CFSTR("invalidRecordTypeName");
    case 23:
      return CFSTR("invalidFieldName");
    case 24:
      return CFSTR("invalidFieldValue");
    case 25:
      return CFSTR("invalidIdentifier");
    case 26:
      return CFSTR("fieldNotQueryable");
    case 27:
      return CFSTR("fieldNotSortable");
    case 28:
      return CFSTR("queryFilterLimitExceeded");
    case 29:
      return CFSTR("queryFilterValuesLimitExceeded");
    case 30:
      return CFSTR("membershipQueryLimitExceeded");
    case 31:
      return CFSTR("notificationAdditionalFieldLimitExceeded");
    case 32:
      return CFSTR("notificationAdditionalFieldInvalidType");
    case 33:
      return CFSTR("subscriptionLimitExceeded");
    case 34:
      return CFSTR("uniqueTriggerLimitExceeded");
    case 35:
      return CFSTR("triggerSubscriptionBindingTypeMismatch");
    case 36:
      return CFSTR("zoneSizeLimitExceeded");
    case 37:
      return CFSTR("zoneCountLimitExceeded");
    case 38:
      return CFSTR("uniqueFieldFailure");
    case 39:
      return CFSTR("validatingReferenceError");
    case 40:
      return CFSTR("fullResetNeeded");
    case 41:
      return CFSTR("alreadyShared");
    case 42:
      return CFSTR("emailOutOfNetwork");
    case 43:
      return CFSTR("duplicateSubscription");
    case 46:
      return CFSTR("expiredPutReceipt");
    case 47:
      return CFSTR("quotaExceeded");
    case 48:
      return CFSTR("zoneNotFound");
    case 49:
      return CFSTR("invalidBundleId");
    case 50:
      return CFSTR("unsupportedDevice");
    case 51:
      return CFSTR("blocklisted");
    case 52:
      return CFSTR("recordProtectionInfoTagMismatch");
    case 53:
      return CFSTR("zoneProtectionInfoTagMismatch");
    case 54:
      return CFSTR("assetSizeLimitExceeded");
    case 55:
      return CFSTR("batchOperationLimitExceeded");
    case 56:
      return CFSTR("requestSizeLimitExceeded");
    case 57:
      return CFSTR("recordSizeLimitExceeded");
    case 58:
      return CFSTR("databaseCommitSizeExceeded");
    case 59:
      return CFSTR("userDeletedDataForZone");
    case 60:
      return CFSTR("staleRecordUpdate");
    case 61:
      return CFSTR("shareParticipantLimitExceeded");
    case 62:
      return CFSTR("shareParticipantError");
    case 64:
      return CFSTR("pcsChainingError");
    case 65:
      return CFSTR("hierarchyAlreadyHasShare");
    case 66:
      return CFSTR("u13Restricted");
    case 67:
      return CFSTR("managedAppleIdRestricted");
    case 68:
      return CFSTR("shareParticipantContactError");
    case 69:
      return CFSTR("recordArchived");
    case 70:
      return CFSTR("databaseAccessDenied");
    case 71:
      return CFSTR("parentHierarchyDepthLimitExceeded");
    case 72:
      return CFSTR("zonePcsUserIdentityUnknown");
    case 73:
      return CFSTR("managedAppleIdBackupBlocked");
    case 75:
      return CFSTR("outOfNetworkUsersUnsupported");
    case 76:
      return CFSTR("gameAssignmentNotFound");
    case 77:
      return CFSTR("queryBeginsWithValueLengthLimitExceeded");
    case 78:
      return CFSTR("userResetEncryptedData");
    case 79:
      return CFSTR("mergeableValueNotFound");
    case 80:
      return CFSTR("invalidPublicKey");
    case 81:
      return CFSTR("mergeableDeltaSizeLimitExceeded");
    case 82:
      return CFSTR("mergeableDeltaNotFound");
    case 83:
      return CFSTR("mergeableDeltaInvalid");
    case 84:
      return CFSTR("mergeableValueCompactionRequired");
    case 85:
      return CFSTR("unprovisionedICloudAccount");
    case 86:
      return CFSTR("purgedICloudAccount");
    case 87:
      return CFSTR("invalidDsidForICloudAccount");
    case 88:
      return CFSTR("shareRegionUnsupported");
    case 89:
      return CFSTR("a2aSignatureValidationError");
    case 90:
      return CFSTR("participantIdMismatch");
    case 94:
      return CFSTR("groupKitSignatureValidationError");
    default:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("unknown")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("expiredAppConfig")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("expiredGlobalConfig")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("badSyntax")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("forbidden")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("throttled")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("refused")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("notSupported")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("exists")) & 1) != 0)
  {
    v6 = 9;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("requestAlreadyProcessed")) & 1) != 0)
  {
    v6 = 10;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("badAuthToken")) & 1) != 0)
  {
    v6 = 11;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("needsAuthentication")) & 1) != 0)
  {
    v6 = 12;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("mescalSignatureMissing")) & 1) != 0)
  {
    v6 = 13;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v18, (uint64_t)CFSTR("invalidMescalSignature")) & 1) != 0)
  {
    v6 = 14;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("opLockFailure")) & 1) != 0)
  {
    v6 = 15;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v20, (uint64_t)CFSTR("atomicFailure")) & 1) != 0)
  {
    v6 = 16;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v21, (uint64_t)CFSTR("resetNeeded")) & 1) != 0)
  {
    v6 = 17;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v22, (uint64_t)CFSTR("fieldsPerTypeLimitExceeded")) & 1) != 0)
  {
    v6 = 18;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v23, (uint64_t)CFSTR("typeBusy")) & 1) != 0)
  {
    v6 = 19;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v24, (uint64_t)CFSTR("numRecordTypesLimitExceeded")) & 1) != 0)
  {
    v6 = 20;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v25, (uint64_t)CFSTR("invalidContainer")) & 1) != 0)
  {
    v6 = 21;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v26, (uint64_t)CFSTR("invalidRecordTypeName")) & 1) != 0)
  {
    v6 = 22;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v27, (uint64_t)CFSTR("invalidFieldName")) & 1) != 0)
  {
    v6 = 23;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v28, (uint64_t)CFSTR("invalidFieldValue")) & 1) != 0)
  {
    v6 = 24;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v29, (uint64_t)CFSTR("invalidIdentifier")) & 1) != 0)
  {
    v6 = 25;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v30, (uint64_t)CFSTR("fieldNotQueryable")) & 1) != 0)
  {
    v6 = 26;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v31, (uint64_t)CFSTR("fieldNotSortable")) & 1) != 0)
  {
    v6 = 27;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v32, (uint64_t)CFSTR("queryFilterLimitExceeded")) & 1) != 0)
  {
    v6 = 28;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v33, (uint64_t)CFSTR("queryFilterValuesLimitExceeded")) & 1) != 0)
  {
    v6 = 29;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v34, (uint64_t)CFSTR("membershipQueryLimitExceeded")) & 1) != 0)
  {
    v6 = 30;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v35, (uint64_t)CFSTR("notificationAdditionalFieldLimitExceeded")) & 1) != 0)
  {
    v6 = 31;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v36, (uint64_t)CFSTR("notificationAdditionalFieldInvalidType")) & 1) != 0)
  {
    v6 = 32;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v37, (uint64_t)CFSTR("subscriptionLimitExceeded")) & 1) != 0)
  {
    v6 = 33;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v38, (uint64_t)CFSTR("uniqueTriggerLimitExceeded")) & 1) != 0)
  {
    v6 = 34;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v39, (uint64_t)CFSTR("triggerSubscriptionBindingTypeMismatch")) & 1) != 0)
  {
    v6 = 35;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v40, (uint64_t)CFSTR("zoneSizeLimitExceeded")) & 1) != 0)
  {
    v6 = 36;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v41, (uint64_t)CFSTR("zoneCountLimitExceeded")) & 1) != 0)
  {
    v6 = 37;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v42, (uint64_t)CFSTR("uniqueFieldFailure")) & 1) != 0)
  {
    v6 = 38;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v43, (uint64_t)CFSTR("validatingReferenceError")) & 1) != 0)
  {
    v6 = 39;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v44, (uint64_t)CFSTR("fullResetNeeded")) & 1) != 0)
  {
    v6 = 40;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v45, (uint64_t)CFSTR("alreadyShared")) & 1) != 0)
  {
    v6 = 41;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v46, (uint64_t)CFSTR("emailOutOfNetwork")) & 1) != 0)
  {
    v6 = 42;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v47, (uint64_t)CFSTR("duplicateSubscription")) & 1) != 0)
  {
    v6 = 43;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v48, (uint64_t)CFSTR("expiredPutReceipt")) & 1) != 0)
  {
    v6 = 46;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v49, (uint64_t)CFSTR("quotaExceeded")) & 1) != 0)
  {
    v6 = 47;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v50, (uint64_t)CFSTR("zoneNotFound")) & 1) != 0)
  {
    v6 = 48;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v51, (uint64_t)CFSTR("invalidBundleId")) & 1) != 0)
  {
    v6 = 49;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v52, (uint64_t)CFSTR("unsupportedDevice")) & 1) != 0)
  {
    v6 = 50;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v53, (uint64_t)CFSTR("blocklisted")) & 1) != 0)
  {
    v6 = 51;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v54, (uint64_t)CFSTR("recordProtectionInfoTagMismatch")) & 1) != 0)
  {
    v6 = 52;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v55, (uint64_t)CFSTR("zoneProtectionInfoTagMismatch")) & 1) != 0)
  {
    v6 = 53;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v56, (uint64_t)CFSTR("assetSizeLimitExceeded")) & 1) != 0)
  {
    v6 = 54;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v57, (uint64_t)CFSTR("batchOperationLimitExceeded")) & 1) != 0)
  {
    v6 = 55;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v58, (uint64_t)CFSTR("requestSizeLimitExceeded")) & 1) != 0)
  {
    v6 = 56;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v59, (uint64_t)CFSTR("recordSizeLimitExceeded")) & 1) != 0)
  {
    v6 = 57;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v60, (uint64_t)CFSTR("databaseCommitSizeExceeded")) & 1) != 0)
  {
    v6 = 58;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v61, (uint64_t)CFSTR("userDeletedDataForZone")) & 1) != 0)
  {
    v6 = 59;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v62, (uint64_t)CFSTR("staleRecordUpdate")) & 1) != 0)
  {
    v6 = 60;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v63, (uint64_t)CFSTR("shareParticipantLimitExceeded")) & 1) != 0)
  {
    v6 = 61;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v64, (uint64_t)CFSTR("shareParticipantError")) & 1) != 0)
  {
    v6 = 62;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v65, (uint64_t)CFSTR("pcsChainingError")) & 1) != 0)
  {
    v6 = 64;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v66, (uint64_t)CFSTR("hierarchyAlreadyHasShare")) & 1) != 0)
  {
    v6 = 65;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v67, (uint64_t)CFSTR("u13Restricted")) & 1) != 0)
  {
    v6 = 66;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v68, (uint64_t)CFSTR("managedAppleIdRestricted")) & 1) != 0)
  {
    v6 = 67;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v69, (uint64_t)CFSTR("shareParticipantContactError")) & 1) != 0)
  {
    v6 = 68;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v70, (uint64_t)CFSTR("recordArchived")) & 1) != 0)
  {
    v6 = 69;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v71, (uint64_t)CFSTR("databaseAccessDenied")) & 1) != 0)
  {
    v6 = 70;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v72, (uint64_t)CFSTR("parentHierarchyDepthLimitExceeded")) & 1) != 0)
  {
    v6 = 71;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v73, (uint64_t)CFSTR("zonePcsUserIdentityUnknown")) & 1) != 0)
  {
    v6 = 72;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v74, (uint64_t)CFSTR("managedAppleIdBackupBlocked")) & 1) != 0)
  {
    v6 = 73;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v75, (uint64_t)CFSTR("outOfNetworkUsersUnsupported")) & 1) != 0)
  {
    v6 = 75;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v76, (uint64_t)CFSTR("gameAssignmentNotFound")) & 1) != 0)
  {
    v6 = 76;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v77, (uint64_t)CFSTR("queryBeginsWithValueLengthLimitExceeded")) & 1) != 0)
  {
    v6 = 77;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v78, (uint64_t)CFSTR("userResetEncryptedData")) & 1) != 0)
  {
    v6 = 78;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v79, (uint64_t)CFSTR("mergeableValueNotFound")) & 1) != 0)
  {
    v6 = 79;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v80, (uint64_t)CFSTR("invalidPublicKey")) & 1) != 0)
  {
    v6 = 80;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v81, (uint64_t)CFSTR("mergeableDeltaSizeLimitExceeded")) & 1) != 0)
  {
    v6 = 81;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v82, (uint64_t)CFSTR("mergeableDeltaNotFound")) & 1) != 0)
  {
    v6 = 82;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v83, (uint64_t)CFSTR("mergeableDeltaInvalid")) & 1) != 0)
  {
    v6 = 83;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v84, (uint64_t)CFSTR("mergeableValueCompactionRequired")) & 1) != 0)
  {
    v6 = 84;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v85, (uint64_t)CFSTR("unprovisionedICloudAccount")) & 1) != 0)
  {
    v6 = 85;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v86, (uint64_t)CFSTR("purgedICloudAccount")) & 1) != 0)
  {
    v6 = 86;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v87, (uint64_t)CFSTR("invalidDsidForICloudAccount")) & 1) != 0)
  {
    v6 = 87;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v88, (uint64_t)CFSTR("shareRegionUnsupported")) & 1) != 0)
  {
    v6 = 88;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v89, (uint64_t)CFSTR("a2aSignatureValidationError")) & 1) != 0)
  {
    v6 = 89;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v90, (uint64_t)CFSTR("participantIdMismatch")) & 1) != 0)
  {
    v6 = 90;
  }
  else if (objc_msgSend_isEqualToString_(v3, v91, (uint64_t)CFSTR("groupKitSignatureValidationError")))
  {
    v6 = 94;
  }
  else
  {
    v6 = 1;
  }

  return v6;
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
  v11.super_class = (Class)CKDPResponseOperationResultErrorClient;
  -[CKDPResponseOperationResultErrorClient description](&v11, sel_description);
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
  __CFString *v7;
  const char *v8;
  CKDPOplockFailure *oplockFailure;
  void *v10;
  const char *v11;
  CKDPUniqueFieldFailure *uniqueFieldFailure;
  void *v13;
  const char *v14;
  CKDPMoveOplockFailure *moveOplockFailure;
  void *v16;
  const char *v17;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = CFSTR("unknown");
    switch(self->_type)
    {
      case 1:
        goto LABEL_90;
      case 2:
        v7 = CFSTR("expiredAppConfig");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("expiredAppConfig"), CFSTR("type"));
        break;
      case 3:
        v7 = CFSTR("expiredGlobalConfig");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("expiredGlobalConfig"), CFSTR("type"));
        break;
      case 4:
        v7 = CFSTR("badSyntax");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("badSyntax"), CFSTR("type"));
        break;
      case 5:
        v7 = CFSTR("forbidden");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("forbidden"), CFSTR("type"));
        break;
      case 6:
        v7 = CFSTR("throttled");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("throttled"), CFSTR("type"));
        break;
      case 7:
        v7 = CFSTR("refused");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("refused"), CFSTR("type"));
        break;
      case 8:
        v7 = CFSTR("notSupported");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("notSupported"), CFSTR("type"));
        break;
      case 9:
        v7 = CFSTR("exists");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("exists"), CFSTR("type"));
        break;
      case 0xA:
        v7 = CFSTR("requestAlreadyProcessed");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("requestAlreadyProcessed"), CFSTR("type"));
        break;
      case 0xB:
        v7 = CFSTR("badAuthToken");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("badAuthToken"), CFSTR("type"));
        break;
      case 0xC:
        v7 = CFSTR("needsAuthentication");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("needsAuthentication"), CFSTR("type"));
        break;
      case 0xD:
        v7 = CFSTR("mescalSignatureMissing");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("mescalSignatureMissing"), CFSTR("type"));
        break;
      case 0xE:
        v7 = CFSTR("invalidMescalSignature");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidMescalSignature"), CFSTR("type"));
        break;
      case 0xF:
        v7 = CFSTR("opLockFailure");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("opLockFailure"), CFSTR("type"));
        break;
      case 0x10:
        v7 = CFSTR("atomicFailure");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("atomicFailure"), CFSTR("type"));
        break;
      case 0x11:
        v7 = CFSTR("resetNeeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("resetNeeded"), CFSTR("type"));
        break;
      case 0x12:
        v7 = CFSTR("fieldsPerTypeLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("fieldsPerTypeLimitExceeded"), CFSTR("type"));
        break;
      case 0x13:
        v7 = CFSTR("typeBusy");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("typeBusy"), CFSTR("type"));
        break;
      case 0x14:
        v7 = CFSTR("numRecordTypesLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("numRecordTypesLimitExceeded"), CFSTR("type"));
        break;
      case 0x15:
        v7 = CFSTR("invalidContainer");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidContainer"), CFSTR("type"));
        break;
      case 0x16:
        v7 = CFSTR("invalidRecordTypeName");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidRecordTypeName"), CFSTR("type"));
        break;
      case 0x17:
        v7 = CFSTR("invalidFieldName");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidFieldName"), CFSTR("type"));
        break;
      case 0x18:
        v7 = CFSTR("invalidFieldValue");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidFieldValue"), CFSTR("type"));
        break;
      case 0x19:
        v7 = CFSTR("invalidIdentifier");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidIdentifier"), CFSTR("type"));
        break;
      case 0x1A:
        v7 = CFSTR("fieldNotQueryable");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("fieldNotQueryable"), CFSTR("type"));
        break;
      case 0x1B:
        v7 = CFSTR("fieldNotSortable");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("fieldNotSortable"), CFSTR("type"));
        break;
      case 0x1C:
        v7 = CFSTR("queryFilterLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("queryFilterLimitExceeded"), CFSTR("type"));
        break;
      case 0x1D:
        v7 = CFSTR("queryFilterValuesLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("queryFilterValuesLimitExceeded"), CFSTR("type"));
        break;
      case 0x1E:
        v7 = CFSTR("membershipQueryLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("membershipQueryLimitExceeded"), CFSTR("type"));
        break;
      case 0x1F:
        v7 = CFSTR("notificationAdditionalFieldLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("notificationAdditionalFieldLimitExceeded"), CFSTR("type"));
        break;
      case 0x20:
        v7 = CFSTR("notificationAdditionalFieldInvalidType");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("notificationAdditionalFieldInvalidType"), CFSTR("type"));
        break;
      case 0x21:
        v7 = CFSTR("subscriptionLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("subscriptionLimitExceeded"), CFSTR("type"));
        break;
      case 0x22:
        v7 = CFSTR("uniqueTriggerLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("uniqueTriggerLimitExceeded"), CFSTR("type"));
        break;
      case 0x23:
        v7 = CFSTR("triggerSubscriptionBindingTypeMismatch");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("triggerSubscriptionBindingTypeMismatch"), CFSTR("type"));
        break;
      case 0x24:
        v7 = CFSTR("zoneSizeLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("zoneSizeLimitExceeded"), CFSTR("type"));
        break;
      case 0x25:
        v7 = CFSTR("zoneCountLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("zoneCountLimitExceeded"), CFSTR("type"));
        break;
      case 0x26:
        v7 = CFSTR("uniqueFieldFailure");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("uniqueFieldFailure"), CFSTR("type"));
        break;
      case 0x27:
        v7 = CFSTR("validatingReferenceError");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("validatingReferenceError"), CFSTR("type"));
        break;
      case 0x28:
        v7 = CFSTR("fullResetNeeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("fullResetNeeded"), CFSTR("type"));
        break;
      case 0x29:
        v7 = CFSTR("alreadyShared");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("alreadyShared"), CFSTR("type"));
        break;
      case 0x2A:
        v7 = CFSTR("emailOutOfNetwork");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("emailOutOfNetwork"), CFSTR("type"));
        break;
      case 0x2B:
        v7 = CFSTR("duplicateSubscription");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("duplicateSubscription"), CFSTR("type"));
        break;
      case 0x2E:
        v7 = CFSTR("expiredPutReceipt");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("expiredPutReceipt"), CFSTR("type"));
        break;
      case 0x2F:
        v7 = CFSTR("quotaExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("quotaExceeded"), CFSTR("type"));
        break;
      case 0x30:
        v7 = CFSTR("zoneNotFound");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("zoneNotFound"), CFSTR("type"));
        break;
      case 0x31:
        v7 = CFSTR("invalidBundleId");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidBundleId"), CFSTR("type"));
        break;
      case 0x32:
        v7 = CFSTR("unsupportedDevice");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("unsupportedDevice"), CFSTR("type"));
        break;
      case 0x33:
        v7 = CFSTR("blocklisted");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("blocklisted"), CFSTR("type"));
        break;
      case 0x34:
        v7 = CFSTR("recordProtectionInfoTagMismatch");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("recordProtectionInfoTagMismatch"), CFSTR("type"));
        break;
      case 0x35:
        v7 = CFSTR("zoneProtectionInfoTagMismatch");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("zoneProtectionInfoTagMismatch"), CFSTR("type"));
        break;
      case 0x36:
        v7 = CFSTR("assetSizeLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("assetSizeLimitExceeded"), CFSTR("type"));
        break;
      case 0x37:
        v7 = CFSTR("batchOperationLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("batchOperationLimitExceeded"), CFSTR("type"));
        break;
      case 0x38:
        v7 = CFSTR("requestSizeLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("requestSizeLimitExceeded"), CFSTR("type"));
        break;
      case 0x39:
        v7 = CFSTR("recordSizeLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("recordSizeLimitExceeded"), CFSTR("type"));
        break;
      case 0x3A:
        v7 = CFSTR("databaseCommitSizeExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("databaseCommitSizeExceeded"), CFSTR("type"));
        break;
      case 0x3B:
        v7 = CFSTR("userDeletedDataForZone");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("userDeletedDataForZone"), CFSTR("type"));
        break;
      case 0x3C:
        v7 = CFSTR("staleRecordUpdate");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("staleRecordUpdate"), CFSTR("type"));
        break;
      case 0x3D:
        v7 = CFSTR("shareParticipantLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("shareParticipantLimitExceeded"), CFSTR("type"));
        break;
      case 0x3E:
        v7 = CFSTR("shareParticipantError");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("shareParticipantError"), CFSTR("type"));
        break;
      case 0x40:
        v7 = CFSTR("pcsChainingError");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("pcsChainingError"), CFSTR("type"));
        break;
      case 0x41:
        v7 = CFSTR("hierarchyAlreadyHasShare");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("hierarchyAlreadyHasShare"), CFSTR("type"));
        break;
      case 0x42:
        v7 = CFSTR("u13Restricted");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("u13Restricted"), CFSTR("type"));
        break;
      case 0x43:
        v7 = CFSTR("managedAppleIdRestricted");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("managedAppleIdRestricted"), CFSTR("type"));
        break;
      case 0x44:
        v7 = CFSTR("shareParticipantContactError");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("shareParticipantContactError"), CFSTR("type"));
        break;
      case 0x45:
        v7 = CFSTR("recordArchived");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("recordArchived"), CFSTR("type"));
        break;
      case 0x46:
        v7 = CFSTR("databaseAccessDenied");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("databaseAccessDenied"), CFSTR("type"));
        break;
      case 0x47:
        v7 = CFSTR("parentHierarchyDepthLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("parentHierarchyDepthLimitExceeded"), CFSTR("type"));
        break;
      case 0x48:
        v7 = CFSTR("zonePcsUserIdentityUnknown");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("zonePcsUserIdentityUnknown"), CFSTR("type"));
        break;
      case 0x49:
        v7 = CFSTR("managedAppleIdBackupBlocked");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("managedAppleIdBackupBlocked"), CFSTR("type"));
        break;
      case 0x4B:
        v7 = CFSTR("outOfNetworkUsersUnsupported");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("outOfNetworkUsersUnsupported"), CFSTR("type"));
        break;
      case 0x4C:
        v7 = CFSTR("gameAssignmentNotFound");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("gameAssignmentNotFound"), CFSTR("type"));
        break;
      case 0x4D:
        v7 = CFSTR("queryBeginsWithValueLengthLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("queryBeginsWithValueLengthLimitExceeded"), CFSTR("type"));
        break;
      case 0x4E:
        v7 = CFSTR("userResetEncryptedData");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("userResetEncryptedData"), CFSTR("type"));
        break;
      case 0x4F:
        v7 = CFSTR("mergeableValueNotFound");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("mergeableValueNotFound"), CFSTR("type"));
        break;
      case 0x50:
        v7 = CFSTR("invalidPublicKey");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidPublicKey"), CFSTR("type"));
        break;
      case 0x51:
        v7 = CFSTR("mergeableDeltaSizeLimitExceeded");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("mergeableDeltaSizeLimitExceeded"), CFSTR("type"));
        break;
      case 0x52:
        v7 = CFSTR("mergeableDeltaNotFound");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("mergeableDeltaNotFound"), CFSTR("type"));
        break;
      case 0x53:
        v7 = CFSTR("mergeableDeltaInvalid");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("mergeableDeltaInvalid"), CFSTR("type"));
        break;
      case 0x54:
        v7 = CFSTR("mergeableValueCompactionRequired");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("mergeableValueCompactionRequired"), CFSTR("type"));
        break;
      case 0x55:
        v7 = CFSTR("unprovisionedICloudAccount");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("unprovisionedICloudAccount"), CFSTR("type"));
        break;
      case 0x56:
        v7 = CFSTR("purgedICloudAccount");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("purgedICloudAccount"), CFSTR("type"));
        break;
      case 0x57:
        v7 = CFSTR("invalidDsidForICloudAccount");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("invalidDsidForICloudAccount"), CFSTR("type"));
        break;
      case 0x58:
        v7 = CFSTR("shareRegionUnsupported");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("shareRegionUnsupported"), CFSTR("type"));
        break;
      case 0x59:
        v7 = CFSTR("a2aSignatureValidationError");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("a2aSignatureValidationError"), CFSTR("type"));
        break;
      case 0x5A:
        v7 = CFSTR("participantIdMismatch");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("participantIdMismatch"), CFSTR("type"));
        break;
      case 0x5E:
        v7 = CFSTR("groupKitSignatureValidationError");
LABEL_90:
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v7, CFSTR("type"));
        break;
      default:
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_type);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, CFSTR("type"));
        break;
    }

  }
  oplockFailure = self->_oplockFailure;
  if (oplockFailure)
  {
    objc_msgSend_dictionaryRepresentation(oplockFailure, v4, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("oplockFailure"));

  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  if (uniqueFieldFailure)
  {
    objc_msgSend_dictionaryRepresentation(uniqueFieldFailure, v4, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("uniqueFieldFailure"));

  }
  moveOplockFailure = self->_moveOplockFailure;
  if (moveOplockFailure)
  {
    objc_msgSend_dictionaryRepresentation(moveOplockFailure, v4, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("moveOplockFailure"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorClientReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_oplockFailure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_uniqueFieldFailure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_moveOplockFailure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  CKDPOplockFailure *oplockFailure;
  CKDPUniqueFieldFailure *uniqueFieldFailure;
  CKDPMoveOplockFailure *moveOplockFailure;
  _DWORD *v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_type;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  oplockFailure = self->_oplockFailure;
  v9 = v4;
  if (oplockFailure)
  {
    objc_msgSend_setOplockFailure_(v4, v5, (uint64_t)oplockFailure);
    v4 = v9;
  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  if (uniqueFieldFailure)
  {
    objc_msgSend_setUniqueFieldFailure_(v9, v5, (uint64_t)uniqueFieldFailure);
    v4 = v9;
  }
  moveOplockFailure = self->_moveOplockFailure;
  if (moveOplockFailure)
  {
    objc_msgSend_setMoveOplockFailure_(v9, v5, (uint64_t)moveOplockFailure);
    v4 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_type;
    *(_BYTE *)(v10 + 40) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_oplockFailure, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  v16 = objc_msgSend_copyWithZone_(self->_uniqueFieldFailure, v15, (uint64_t)a3);
  v17 = (void *)v12[4];
  v12[4] = v16;

  v19 = objc_msgSend_copyWithZone_(self->_moveOplockFailure, v18, (uint64_t)a3);
  v20 = (void *)v12[1];
  v12[1] = v19;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPOplockFailure *oplockFailure;
  uint64_t v9;
  CKDPUniqueFieldFailure *uniqueFieldFailure;
  uint64_t v11;
  CKDPMoveOplockFailure *moveOplockFailure;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[5] & 1) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((v4[5] & 1) != 0)
  {
LABEL_13:
    isEqual = 0;
    goto LABEL_14;
  }
  oplockFailure = self->_oplockFailure;
  v9 = v4[2];
  if ((unint64_t)oplockFailure | v9 && !objc_msgSend_isEqual_(oplockFailure, v7, v9))
    goto LABEL_13;
  uniqueFieldFailure = self->_uniqueFieldFailure;
  v11 = v4[4];
  if ((unint64_t)uniqueFieldFailure | v11)
  {
    if (!objc_msgSend_isEqual_(uniqueFieldFailure, v7, v11))
      goto LABEL_13;
  }
  moveOplockFailure = self->_moveOplockFailure;
  v13 = v4[1];
  if ((unint64_t)moveOplockFailure | v13)
    isEqual = objc_msgSend_isEqual_(moveOplockFailure, v7, v13);
  else
    isEqual = 1;
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_oplockFailure, a2, v2) ^ v4;
  v8 = objc_msgSend_hash(self->_uniqueFieldFailure, v6, v7);
  return v5 ^ v8 ^ objc_msgSend_hash(self->_moveOplockFailure, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  CKDPOplockFailure *oplockFailure;
  uint64_t v7;
  CKDPUniqueFieldFailure *uniqueFieldFailure;
  uint64_t v9;
  CKDPMoveOplockFailure *moveOplockFailure;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  v5 = v4;
  if ((v4[10] & 1) != 0)
  {
    self->_type = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  oplockFailure = self->_oplockFailure;
  v7 = v5[2];
  v12 = v5;
  if (oplockFailure)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_mergeFrom_(oplockFailure, (const char *)v5, v7);
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend_setOplockFailure_(self, (const char *)v5, v7);
  }
  v5 = v12;
LABEL_9:
  uniqueFieldFailure = self->_uniqueFieldFailure;
  v9 = v5[4];
  if (uniqueFieldFailure)
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_mergeFrom_(uniqueFieldFailure, (const char *)v5, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_setUniqueFieldFailure_(self, (const char *)v5, v9);
  }
  v5 = v12;
LABEL_15:
  moveOplockFailure = self->_moveOplockFailure;
  v11 = v5[1];
  if (moveOplockFailure)
  {
    if (v11)
    {
      objc_msgSend_mergeFrom_(moveOplockFailure, (const char *)v5, v11);
LABEL_20:
      v5 = v12;
    }
  }
  else if (v11)
  {
    objc_msgSend_setMoveOplockFailure_(self, (const char *)v5, v11);
    goto LABEL_20;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueFieldFailure, 0);
  objc_storeStrong((id *)&self->_oplockFailure, 0);
  objc_storeStrong((id *)&self->_moveOplockFailure, 0);
}

- (BOOL)hasOplockFailure
{
  return self->_oplockFailure != 0;
}

- (CKDPOplockFailure)oplockFailure
{
  return self->_oplockFailure;
}

- (void)setOplockFailure:(id)a3
{
  objc_storeStrong((id *)&self->_oplockFailure, a3);
}

- (BOOL)hasUniqueFieldFailure
{
  return self->_uniqueFieldFailure != 0;
}

- (CKDPUniqueFieldFailure)uniqueFieldFailure
{
  return self->_uniqueFieldFailure;
}

- (void)setUniqueFieldFailure:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueFieldFailure, a3);
}

- (BOOL)hasMoveOplockFailure
{
  return self->_moveOplockFailure != 0;
}

- (CKDPMoveOplockFailure)moveOplockFailure
{
  return self->_moveOplockFailure;
}

- (void)setMoveOplockFailure:(id)a3
{
  objc_storeStrong((id *)&self->_moveOplockFailure, a3);
}

- (id)_typeCKLogValue
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  __CFString *v5;

  v4 = objc_msgSend_type(self, a2, v2);
  v5 = CFSTR("unknown");
  switch((int)v4)
  {
    case 1:
      return v5;
    case 2:
      return CFSTR("expiredAppConfig");
    case 3:
      return CFSTR("expiredGlobalConfig");
    case 4:
      return CFSTR("badSyntax");
    case 5:
      return CFSTR("forbidden");
    case 6:
      return CFSTR("throttled");
    case 7:
      return CFSTR("refused");
    case 8:
      return CFSTR("notSupported");
    case 9:
      return CFSTR("exists");
    case 10:
      return CFSTR("requestAlreadyProcessed");
    case 11:
      return CFSTR("badAuthToken");
    case 12:
      return CFSTR("needsAuthentication");
    case 13:
      return CFSTR("mescalSignatureMissing");
    case 14:
      return CFSTR("invalidMescalSignature");
    case 15:
      return CFSTR("opLockFailure");
    case 16:
      return CFSTR("atomicFailure");
    case 17:
      return CFSTR("resetNeeded");
    case 18:
      return CFSTR("fieldsPerTypeLimitExceeded");
    case 19:
      return CFSTR("typeBusy");
    case 20:
      return CFSTR("numRecordTypesLimitExceeded");
    case 21:
      return CFSTR("invalidContainer");
    case 22:
      return CFSTR("invalidRecordTypeName");
    case 23:
      return CFSTR("invalidFieldName");
    case 24:
      return CFSTR("invalidFieldValue");
    case 25:
      return CFSTR("invalidIdentifier");
    case 26:
      return CFSTR("fieldNotQueryable");
    case 27:
      return CFSTR("fieldNotSortable");
    case 28:
      return CFSTR("queryFilterLimitExceeded");
    case 29:
      return CFSTR("queryFilterValuesLimitExceeded");
    case 30:
      return CFSTR("membershipQueryLimitExceeded");
    case 31:
      return CFSTR("notificationAdditionalFieldLimitExceeded");
    case 32:
      return CFSTR("notificationAdditionalFieldInvalidType");
    case 33:
      return CFSTR("subscriptionLimitExceeded");
    case 34:
      return CFSTR("uniqueTriggerLimitExceeded");
    case 35:
      return CFSTR("triggerSubscriptionBindingTypeMismatch");
    case 36:
      return CFSTR("zoneSizeLimitExceeded");
    case 37:
      return CFSTR("zoneCountLimitExceeded");
    case 38:
      return CFSTR("uniqueFieldFailure");
    case 39:
      return CFSTR("validatingReferenceError");
    case 40:
      return CFSTR("fullResetNeeded");
    case 41:
      return CFSTR("alreadyShared");
    case 42:
      return CFSTR("emailOutOfNetwork");
    case 43:
      return CFSTR("duplicateSubscription");
    case 46:
      return CFSTR("expiredPutReceipt");
    case 47:
      return CFSTR("quotaExceeded");
    case 48:
      return CFSTR("zoneNotFound");
    case 49:
      return CFSTR("invalidBundleId");
    case 50:
      return CFSTR("unsupportedDevice");
    case 51:
      return CFSTR("blocklisted");
    case 52:
      return CFSTR("recordProtectionInfoTagMismatch");
    case 53:
      return CFSTR("zoneProtectionInfoTagMismatch");
    case 54:
      return CFSTR("assetSizeLimitExceeded");
    case 55:
      return CFSTR("batchOperationLimitExceeded");
    case 56:
      return CFSTR("requestSizeLimitExceeded");
    case 57:
      return CFSTR("recordSizeLimitExceeded");
    case 58:
      return CFSTR("databaseCommitSizeExceeded");
    case 59:
      return CFSTR("userDeletedDataForZone");
    case 60:
      return CFSTR("staleRecordUpdate");
    case 61:
      return CFSTR("shareParticipantLimitExceeded");
    case 62:
      return CFSTR("shareParticipantError");
    case 64:
      return CFSTR("pcsChainingError");
    case 65:
      return CFSTR("hierarchyAlreadyHasShare");
    case 66:
      return CFSTR("u13Restricted");
    case 67:
      return CFSTR("managedAppleIdRestricted");
    case 68:
      return CFSTR("shareParticipantContactError");
    case 69:
      return CFSTR("recordArchived");
    case 70:
      return CFSTR("databaseAccessDenied");
    case 71:
      return CFSTR("parentHierarchyDepthLimitExceeded");
    case 72:
      return CFSTR("zonePcsUserIdentityUnknown");
    case 73:
      return CFSTR("managedAppleIdBackupBlocked");
    case 75:
      return CFSTR("outOfNetworkUsersUnsupported");
    case 76:
      return CFSTR("gameAssignmentNotFound");
    case 77:
      return CFSTR("queryBeginsWithValueLengthLimitExceeded");
    case 78:
      return CFSTR("userResetEncryptedData");
    case 79:
      return CFSTR("mergeableValueNotFound");
    case 80:
      return CFSTR("invalidPublicKey");
    case 81:
      return CFSTR("mergeableDeltaSizeLimitExceeded");
    case 82:
      return CFSTR("mergeableDeltaNotFound");
    case 83:
      return CFSTR("mergeableDeltaInvalid");
    case 84:
      return CFSTR("mergeableValueCompactionRequired");
    case 85:
      return CFSTR("unprovisionedICloudAccount");
    case 86:
      return CFSTR("purgedICloudAccount");
    case 87:
      return CFSTR("invalidDsidForICloudAccount");
    case 88:
      return CFSTR("shareRegionUnsupported");
    case 89:
      return CFSTR("a2aSignatureValidationError");
    case 90:
      return CFSTR("participantIdMismatch");
    case 94:
      v5 = CFSTR("groupKitSignatureValidationError");
      return v5;
    default:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v5;
  }
}

@end
