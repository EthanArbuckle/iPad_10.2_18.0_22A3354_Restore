@implementation CPLBeforeUploadCheckItem

- (CPLBeforeUploadCheckItem)initWithChange:(id)a3 checkItems:(id)a4
{
  id v7;
  id v8;
  CPLBeforeUploadCheckItem *v9;
  CPLBeforeUploadCheckItem *v10;
  id *p_change;
  void *v12;
  NSObject *v14;
  id v15;
  uint64_t v16;
  CPLScopedIdentifier *scopedIdentifier;
  uint64_t v18;
  Class changeClass;
  int v20;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CPLBeforeUploadCheckItem;
  v9 = -[CPLBeforeUploadCheckItem init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    p_change = (id *)&v9->_change;
    objc_storeStrong((id *)&v9->_change, a3);
    if (!-[CPLRecordChange isDelete](v10->_change, "isDelete"))
    {
      objc_msgSend(*p_change, "recordModificationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 && _CPLSilentLogging == 0)
      {
        __CPLCheckOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = *p_change;
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "No record modification date for %@", buf, 0xCu);
        }

      }
    }
    -[CPLRecordChange scopedIdentifier](v10->_change, "scopedIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    scopedIdentifier = v10->_scopedIdentifier;
    v10->_scopedIdentifier = (CPLScopedIdentifier *)v16;

    objc_storeWeak((id *)&v10->_items, v8);
    objc_opt_class();
    v18 = objc_claimAutoreleasedReturnValue();
    changeClass = v10->_changeClass;
    v10->_changeClass = (Class)v18;

    v20 = -[CPLRecordChange isAssetChange](v10->_change, "isAssetChange");
    v10->_isAsset = v20;
    if (v20)
    {
      if ((objc_msgSend(*p_change, "isDelete") & 1) != 0)
        LOBYTE(v20) = 1;
      else
        LOBYTE(v20) = objc_msgSend(*p_change, "inTrash");
    }
    v10->_isTrashedOrDeletedAsset = v20;
    v10->_ruleGroups = objc_msgSend(v8, "ruleGroups");
    v10->_pushRepositoryPriority = objc_msgSend(v8, "pushRepositoryPriority");
  }

  return v10;
}

- (BOOL)isTrashedOrDeletedAsset
{
  return self->_change && self->_isTrashedOrDeletedAsset;
}

- (BOOL)needsToGenerateDerivatives
{
  if (!self->_change)
    return 0;
  if (self->_needsToGenerateImageDerivatives)
    return 1;
  return self->_needsToGenerateVideoComplementDerivatives;
}

- (BOOL)_addRelatedRecordWithScopedIdentifierToAdditionalRecords:(id)a3 provider:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = !v7 || objc_msgSend(v8, "willNeedToAccessRecordWithScopedIdentifier:error:", v7, a5);

  return v10;
}

- (BOOL)prepareWithError:(id *)a3
{
  CPLBeforeUploadCheckItems **p_items;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  CPLScopedIdentifier *v10;
  void *v11;
  _BOOL4 v12;
  CPLScopedIdentifier *v13;
  void *v14;
  _BOOL4 v15;
  CPLScopedIdentifier *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  CPLRecordChange *change;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  CPLScopedIdentifier *v35;
  NSObject *v36;
  CPLScopedIdentifier *scopedIdentifier;
  CPLScopedIdentifier *v38;
  int v39;
  CPLResourceTypeSet *v40;
  CPLResourceTypeSet *resourcesToGenerateImageDerivatives;
  CPLResourceTypeSet *v42;
  CPLResourceTypeSet *resourcesToGenerateVideoComplementDerivatives;
  int v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  int v48;
  id *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  CPLResourceTypeSet *v56;
  uint64_t v57;
  id v58;
  void *v59;
  CPLScopedIdentifier *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  void *v67;
  CPLScopedIdentifier *v68;
  void *v69;
  CPLScopedIdentifier *v70;
  _BOOL4 v71;
  uint64_t v72;
  void *v73;
  BOOL v74;
  id v76;
  int v77;
  _BOOL4 v78;
  NSObject *v79;
  uint64_t v80;
  NSObject *v81;
  CPLRecordChange *v82;
  id *v83;
  _BOOL4 v84;
  void *v85;
  NSObject *v86;
  CPLRecordChange *v87;
  const __CFString *v88;
  id *v89;
  CPLScopedIdentifier *v90;
  id *v91;
  CPLScopedIdentifier *v92;
  _BOOL4 v93;
  void *v94;
  char v95;
  int v96;
  id obj;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  _BOOL4 v102;
  int v103;
  CPLScopedIdentifier *v104;
  CPLScopedIdentifier *v105;
  CPLScopedIdentifier *v106;
  CPLScopedIdentifier *v107;
  CPLScopedIdentifier *v108;
  CPLScopedIdentifier *v109;
  CPLScopedIdentifier *v110;
  CPLScopedIdentifier *v111;
  CPLScopedIdentifier *v112;
  CPLScopedIdentifier *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  CPLScopedIdentifier *v118;
  id v119;
  CPLScopedIdentifier *v120;
  CPLScopedIdentifier *v121;
  CPLScopedIdentifier *v122;
  CPLScopedIdentifier *v123;
  CPLScopedIdentifier *v124;
  CPLScopedIdentifier *v125;
  id v126;
  uint8_t v127[128];
  uint8_t buf[4];
  uint64_t v129;
  __int16 v130;
  CPLScopedIdentifier *v131;
  __int16 v132;
  id v133;
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  p_items = &self->_items;
  WeakRetained = objc_loadWeakRetained((id *)&self->_items);
  objc_msgSend(WeakRetained, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPLRecordChange scopedIdentifier](self->_change, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = 0;
  v9 = objc_msgSend(v7, "willNeedToAccessRecordWithScopedIdentifier:error:", v8, &v126);
  v10 = (CPLScopedIdentifier *)v126;

  if ((v9 & 1) != 0)
  {
    -[CPLRecordChange relatedScopedIdentifier](self->_change, "relatedScopedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = v10;
    v12 = -[CPLBeforeUploadCheckItem _addRelatedRecordWithScopedIdentifierToAdditionalRecords:provider:error:](self, "_addRelatedRecordWithScopedIdentifierToAdditionalRecords:provider:error:", v11, v7, &v125);
    v13 = v125;

    if (!v12)
    {
LABEL_22:
      v26 = 0;
      goto LABEL_92;
    }
    -[CPLRecordChange secondaryScopedIdentifier](self->_change, "secondaryScopedIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v13;
    v15 = -[CPLBeforeUploadCheckItem _addRelatedRecordWithScopedIdentifierToAdditionalRecords:provider:error:](self, "_addRelatedRecordWithScopedIdentifierToAdditionalRecords:provider:error:", v14, v7, &v124);
    v10 = v124;

    if (!v15)
    {
      v26 = 0;
      v13 = v10;
      goto LABEL_92;
    }
    if ((self->_ruleGroups & 8) != 0
      && !-[CPLRecordChange canLowerQuota](self->_change, "canLowerQuota")
      && -[CPLRecordChange isAssetChange](self->_change, "isAssetChange")
      && !self->_pushRepositoryPriority)
    {
      v76 = objc_loadWeakRetained((id *)p_items);
      v77 = objc_msgSend(v76, "shouldCheckOverQuotaChangesWithServer");

      if (v77)
      {
        if ((self->_ruleGroups & 8) != 0)
        {
          v123 = v10;
          v78 = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", CFSTR("UpdatePushRepositoryPriorityWhenOverQuota"), &v123);
          v13 = v123;

          if (!v78)
            goto LABEL_22;
          v10 = v13;
        }
      }
      else
      {
        -[CPLRecordChange _recordKnownByCloudCache](self->_change, "_recordKnownByCloudCache");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLBeforeUploadCheckItem updatePushRepositoryPriorityWithRecordOnServer:](self, "updatePushRepositoryPriorityWithRecordOnServer:", v85);

        if (!self->_change)
          goto LABEL_145;
      }
    }
    v16 = (CPLScopedIdentifier *)objc_loadWeakRetained((id *)p_items);
    -[CPLScopedIdentifier sharingScopeIdentifier](v16, "sharingScopeIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_18;
    v18 = (void *)v17;
    v19 = -[CPLRecordChange supportsSharingScopedIdentifier](self->_change, "supportsSharingScopedIdentifier");

    if (v19 && -[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 64))
    {
      change = self->_change;
      v21 = objc_loadWeakRetained((id *)p_items);
      objc_msgSend(v21, "sharingScopeIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(change) = -[CPLRecordChange isSharedInScopeWithIdentifier:](change, "isSharedInScopeWithIdentifier:", v22);

      if ((change & 1) != 0)
      {
        -[CPLRecordChange relatedScopedIdentifier](self->_change, "relatedScopedIdentifier");
        v16 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if ((objc_msgSend(v7, "isCloudRecordWithScopedIdentifierShared:", v16) & 1) == 0)
          {
            -[CPLRecordChange _noteRelatedRecordShouldBeShared](self->_change, "_noteRelatedRecordShouldBeShared");
            if (!_CPLSilentLogging)
            {
              __CPLCheckOSLogDomain();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                -[CPLRecordChange scopedIdentifier](self->_change, "scopedIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v129 = (uint64_t)v24;
                v130 = 2112;
                v131 = v16;
                _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_DEFAULT, "In order to share %@, we will need to ensure %@ is also shared", buf, 0x16u);

              }
            }
          }
        }
LABEL_18:

        goto LABEL_19;
      }
      if ((self->_ruleGroups & 2) != 0)
      {
        v122 = v10;
        LOBYTE(v34) = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", CFSTR("AvoidAccidentalUnshare"), &v122);
        v35 = v122;
      }
      else
      {
        if (-[CPLRecordChange isFullRecord](self->_change, "isFullRecord"))
          goto LABEL_19;
        -[CPLRecordChange sharingRecordChangeData](self->_change, "sharingRecordChangeData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          goto LABEL_19;
        v121 = v10;
        v34 = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", CFSTR("UpdateRecordTargetForSharingChange"), &v121);
        v35 = v121;
      }
      v13 = v35;

      if ((v34 & 1) == 0)
        goto LABEL_22;
      v10 = v13;
    }
LABEL_19:
    if ((self->_ruleGroups & 2) != 0 && -[CPLRecordChange supportsSharing](self->_change, "supportsSharing"))
    {
      v120 = v10;
      v25 = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", CFSTR("UpdateRecordTargetDuringResetSync"), &v120);
      v13 = v120;

      if (!v25)
        goto LABEL_22;
    }
    else
    {
      v13 = v10;
    }
    if (!-[CPLRecordChange supportsResources](self->_change, "supportsResources")
      || !-[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 8))
    {
      v26 = 1;
      goto LABEL_92;
    }
    objc_msgSend(v7, "availableResourceTypesToUploadForChange:", self->_change);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange resourceCopyFromScopedIdentifier](self->_change, "resourceCopyFromScopedIdentifier");
    v28 = objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange resources](self->_change, "resources");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CPLRecordChange isAssetChange](self->_change, "isAssetChange"))
    {
      -[CPLRecordChange adjustments](self->_change, "adjustments");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v29 != 0;

    }
    else
    {
      v93 = 0;
    }
    v92 = (CPLScopedIdentifier *)v28;
    if (v28)
    {
      v119 = 0;
      v30 = objc_msgSend(v7, "willNeedToAccessRecordWithScopedIdentifier:error:", v28, &v119);
      v31 = v119;
      if ((v30 & 1) != 0)
      {
        v32 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLCheckOSLogDomain();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            scopedIdentifier = self->_scopedIdentifier;
            *(_DWORD *)buf = 138412802;
            v129 = v28;
            v130 = 2112;
            v131 = scopedIdentifier;
            v132 = 2112;
            v133 = v31;
            _os_log_impl(&dword_1B03C2000, v36, OS_LOG_TYPE_ERROR, "Can't copy resources from %@ to %@ as the source scope can't be accessed: %@", buf, 0x20u);
          }

        }
        v118 = v13;
        v32 = -[CPLBeforeUploadCheckItem rejectChangeWithReason:error:](self, "rejectChangeWithReason:error:", CFSTR("invalid source scope for copy"), &v118);
        v38 = v118;

        v13 = v38;
      }
      if (objc_msgSend(v94, "count"))
        v39 = 1;
      else
        v39 = v93;
      if (v39 == 1)
        v96 = objc_msgSend(v101, "isEmpty");
      else
        v96 = 0;

      if (!v32)
      {
        v26 = 0;
        goto LABEL_91;
      }
    }
    else
    {
      v96 = 0;
    }
    v91 = a3;
    v40 = objc_alloc_init(CPLResourceTypeSet);
    resourcesToGenerateImageDerivatives = self->_resourcesToGenerateImageDerivatives;
    self->_resourcesToGenerateImageDerivatives = v40;

    v42 = objc_alloc_init(CPLResourceTypeSet);
    resourcesToGenerateVideoComplementDerivatives = self->_resourcesToGenerateVideoComplementDerivatives;
    self->_resourcesToGenerateVideoComplementDerivatives = v42;

    *(_WORD *)&self->_needsToGenerateImageDerivatives = 257;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    obj = v94;
    v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
    if (v100)
    {
      v44 = 0;
      v102 = 0;
      v99 = *(_QWORD *)v115;
      v95 = v96;
      v98 = v7;
      do
      {
        v45 = 0;
        do
        {
          v103 = v44;
          if (*(_QWORD *)v115 != v99)
            objc_enumerationMutation(obj);
          v104 = v13;
          v46 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v45);
          v47 = objc_msgSend(v46, "resourceType", v91);
          v48 = objc_msgSend(v7, "isResourceDynamic:", v46);
          if (v93 && !v102)
            v102 = +[CPLResource isAdjustedResourceType:](CPLResource, "isAdjustedResourceType:", v47);
          v49 = (id *)p_items;
          v50 = objc_loadWeakRetained((id *)p_items);
          objc_msgSend(v50, "originalBatch");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordChange scopedIdentifier](self->_change, "scopedIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "localResourceOfType:forItemWithCloudScopedIdentifier:", v47, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v53)
          {
            v7 = v98;
            v65 = v104;
            if (!_CPLSilentLogging)
            {
              __CPLCheckOSLogDomain();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v129 = (uint64_t)v46;
                _os_log_impl(&dword_1B03C2000, v66, OS_LOG_TYPE_ERROR, "Cloud resource %@ does not match any local resource for upload", buf, 0xCu);
              }

            }
            +[CPLErrors invalidCloudCacheErrorWithReason:](CPLErrors, "invalidCloudCacheErrorWithReason:", 0);
            v60 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue();
            v53 = 0;
            goto LABEL_87;
          }
          if (((objc_msgSend(v101, "containsResourceType:", v47) ^ 1 | v48) & 1) != 0)
          {
            objc_msgSend(v46, "identity");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v54;
            if (v96)
            {
              objc_msgSend(v54, "setAvailable:", 1);

              v95 &= v47 != 5;
              v7 = v98;
            }
            else
            {
              v7 = v98;
              objc_msgSend(v54, "setAvailable:", v48 != 0);

            }
            v13 = v104;
          }
          else
          {
            v7 = v98;
            switch(v47)
            {
              case 1:
              case 2:
              case 16:
              case 17:
                v56 = self->_resourcesToGenerateImageDerivatives;
                v57 = v47;
                goto LABEL_66;
              case 3:
              case 4:
              case 5:
                self->_needsToGenerateImageDerivatives = 0;
                goto LABEL_71;
              case 6:
              case 7:
              case 21:
              case 28:
                self->_needsToGenerateVideoComplementDerivatives = 0;
                goto LABEL_71;
              case 8:
              case 9:
              case 10:
              case 11:
              case 12:
              case 13:
              case 14:
              case 15:
              case 19:
              case 20:
              case 22:
              case 23:
              case 24:
              case 25:
              case 26:
              case 27:
                goto LABEL_71;
              case 18:
                v56 = self->_resourcesToGenerateVideoComplementDerivatives;
                v57 = 18;
                goto LABEL_66;
              default:
                v7 = v98;
                if (v47 != 1000 || !v93)
                  goto LABEL_71;
                v56 = self->_resourcesToGenerateImageDerivatives;
                v57 = 1000;
LABEL_66:
                -[CPLResourceTypeSet addResourceType:](v56, "addResourceType:", v57);
LABEL_71:
                v58 = objc_loadWeakRetained(v49);
                v113 = v104;
                objc_msgSend(v58, "willUploadCloudResource:localResource:forItem:error:", v46, v53, self, &v113);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v113;

                if (!v59)
                {
                  if (!_CPLSilentLogging)
                  {
                    __CPLCheckOSLogDomain();
                    v79 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v129 = (uint64_t)v46;
                      v130 = 2112;
                      v131 = v60;
                      _os_log_impl(&dword_1B03C2000, v79, OS_LOG_TYPE_ERROR, "Can't create URL to upload cloud %@: %@", buf, 0x16u);
                    }

                  }
                  -[CPLScopedIdentifier domain](v60, "domain");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v65, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
                  {
                    v80 = -[CPLScopedIdentifier code](v60, "code");

                    a3 = v91;
                    if (v80 == 4)
                    {
                      +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", CFSTR("Resource storage is invalid during push to transport"));
                      v65 = v60;
                      v60 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue();
LABEL_88:

                    }
                    v26 = 0;

LABEL_90:
                    v13 = v60;
                    goto LABEL_91;
                  }
LABEL_87:
                  a3 = v91;
                  goto LABEL_88;
                }
                objc_msgSend(v46, "identity");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "setFileURL:", v59);
                objc_msgSend(v61, "setAvailable:", 1);

                v13 = v60;
                break;
            }
          }
          objc_msgSend(v46, "identity");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "isAvailable");

          v44 = v63 ^ 1 | v103;
          ++v45;
          p_items = (CPLBeforeUploadCheckItems **)v49;
        }
        while (v100 != v45);
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
        v100 = v64;
      }
      while (v64);
    }
    else
    {
      LOBYTE(v102) = 0;
      LOBYTE(v44) = 0;
      v95 = v96;
    }

    if (self->_needsToGenerateImageDerivatives
      && -[CPLResourceTypeSet isEmpty](self->_resourcesToGenerateImageDerivatives, "isEmpty"))
    {
      self->_needsToGenerateImageDerivatives = 0;
    }
    a3 = v91;
    if (self->_needsToGenerateVideoComplementDerivatives
      && -[CPLResourceTypeSet isEmpty](self->_resourcesToGenerateVideoComplementDerivatives, "isEmpty"))
    {
      self->_needsToGenerateVideoComplementDerivatives = 0;
    }
    if (v44 & 1 | !v93 | v102)
    {
      if ((v44 & 1) == 0)
      {
        if ((v95 & 1) == 0)
        {
          v26 = 1;
          goto LABEL_155;
        }
        goto LABEL_143;
      }
    }
    else
    {
      if (v96)
      {
        if (!_CPLSilentLogging)
        {
          __CPLCheckOSLogDomain();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            v82 = self->_change;
            *(_DWORD *)buf = 138412546;
            v129 = (uint64_t)v82;
            v130 = 2112;
            v131 = v92;
            _os_log_impl(&dword_1B03C2000, v81, OS_LOG_TYPE_DEFAULT, "%@ is adjusted but has no adjusted resources - we will copy them from %@", buf, 0x16u);
          }

        }
LABEL_143:
        v110 = v13;
        v83 = (id *)&v110;
        v84 = -[CPLBeforeUploadCheckItem requestFetchOfRecordWithScopedIdentifier:forRule:error:](self, "requestFetchOfRecordWithScopedIdentifier:forRule:error:", v92, CFSTR("CopyDerivativesFromSource"), &v110, v91);
LABEL_154:
        v26 = v84;
        v90 = (CPLScopedIdentifier *)*v83;

        v13 = v90;
LABEL_155:
        if (-[CPLBeforeUploadCheckItem needsToGenerateDerivatives](self, "needsToGenerateDerivatives", v91) && v26)
        {
          if ((self->_ruleGroups & 2) != 0)
          {
            v109 = v13;
            v26 = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", CFSTR("AvoidGeneratingDerivatives"), &v109);
            v60 = v109;

            goto LABEL_90;
          }
          v26 = 1;
        }
LABEL_91:

LABEL_92:
        -[CPLRecordChange recordChangeData](self->_change, "recordChangeData");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          if (v26)
          {
LABEL_94:
            v10 = v13;
            goto LABEL_95;
          }
LABEL_108:
          v27 = 0;
          v10 = v13;
          goto LABEL_109;
        }
        if (!v26)
          goto LABEL_108;
        if (-[CPLRecordChange isFullRecord](self->_change, "isFullRecord"))
        {
          v108 = v13;
          v71 = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", CFSTR("FullRecordAlreadyOnServer"), &v108);
          v10 = v108;

          if (!v71)
            goto LABEL_107;
          v13 = v10;
        }
        if ((self->_ruleGroups & 2) == 0)
          goto LABEL_94;
        if (!-[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 32))
          goto LABEL_94;
        objc_msgSend((id)objc_opt_class(), "copyPropertyBlockForDirection:", 1);
        v72 = objc_claimAutoreleasedReturnValue();
        if (!v72)
          goto LABEL_94;
        v73 = (void *)v72;
        v107 = v13;
        v74 = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", CFSTR("ForwardCompatibility"), &v107);
        v10 = v107;

        if (v74)
        {
LABEL_95:
          if (-[CPLRecordChange _shouldNotTrustCloudCache](self->_change, "_shouldNotTrustCloudCache"))
          {
            v106 = v10;
            v27 = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", CFSTR("DontTrustCloudCache"), &v106);
            v68 = v106;

            -[CPLRecordChange relatedScopedIdentifier](self->_change, "relatedScopedIdentifier");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (v69)
            {
              v105 = v68;
              v27 = -[CPLBeforeUploadCheckItem requestFetchOfRecordWithScopedIdentifier:forRule:error:](self, "requestFetchOfRecordWithScopedIdentifier:forRule:error:", v69, CFSTR("DontTrustCloudCache"), &v105);
              v70 = v105;

              v68 = v70;
            }

            v10 = v68;
LABEL_109:
            if (a3 && !v27)
              goto LABEL_111;
            goto LABEL_112;
          }
LABEL_145:
          v27 = 1;
          goto LABEL_112;
        }
LABEL_107:
        v27 = 0;
        goto LABEL_109;
      }
      if (!_CPLSilentLogging)
      {
        __CPLCheckOSLogDomain();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          v87 = self->_change;
          *(_DWORD *)buf = 138412290;
          v129 = (uint64_t)v87;
          _os_log_impl(&dword_1B03C2000, v86, OS_LOG_TYPE_DEFAULT, "%@ is adjusted but has no adjusted resources - considering the record as sparse", buf, 0xCu);
        }

      }
    }
    if (-[CPLRecordChange allowsToOnlyUploadNewResources](self->_change, "allowsToOnlyUploadNewResources", v91))
    {
      v112 = v13;
      v88 = CFSTR("OnlyUploadAddedResources");
      v83 = (id *)&v112;
      v89 = (id *)&v112;
    }
    else
    {
      v111 = v13;
      v88 = CFSTR("DropSparseResources");
      v83 = (id *)&v111;
      v89 = (id *)&v111;
    }
    v84 = -[CPLBeforeUploadCheckItem requestFetchForRule:error:](self, "requestFetchForRule:error:", v88, v89);
    goto LABEL_154;
  }
  if (a3)
  {
LABEL_111:
    v10 = objc_retainAutorelease(v10);
    v27 = 0;
    *a3 = v10;
    goto LABEL_112;
  }
  v27 = 0;
LABEL_112:

  return v27;
}

- (BOOL)_forRule:(id)a3 check:(void *)a4 error:(id *)a5
{
  id WeakRetained;
  CPLRecordChange *v8;
  CPLRecordChange *recordOnServer;

  if (!-[NSMutableSet containsObject:](self->_rulesForRecordFetch, "containsObject:", a3))
    return 1;
  if (!self->_hasCachedResultOfServerCheck)
  {
    self->_hasCachedResultOfServerCheck = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    objc_msgSend(WeakRetained, "recordFromTransportWithScopedIdentifier:", self->_scopedIdentifier);
    v8 = (CPLRecordChange *)objc_claimAutoreleasedReturnValue();
    recordOnServer = self->_recordOnServer;
    self->_recordOnServer = v8;

    self->_recordExistsOnServer = self->_recordOnServer != 0;
  }
  return ((uint64_t (*)(CPLBeforeUploadCheckItem *))a4)(self);
}

- (BOOL)_forAdditionalRecordRule:(id)a3 check:(void *)a4 error:(id *)a5
{
  void *v8;
  id WeakRetained;
  void *v10;
  char v11;

  if (!self->_change)
    return 1;
  -[NSMutableDictionary objectForKey:](self->_rulesForOtherRecordFetches, "objectForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    objc_msgSend(WeakRetained, "recordFromTransportWithScopedIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = ((uint64_t (*)(CPLBeforeUploadCheckItem *, void *, id *))a4)(self, v10, a5);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)checkBeforeUploadWithError:(id *)a3
{
  id WeakRetained;
  char v6;
  CPLRecordChange *change;
  _BOOL4 v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  BOOL v22;
  _BOOL4 v24;
  _BOOL4 v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  if (!-[CPLBeforeUploadCheckItem hasRequestedRecordFetch](self, "hasRequestedRecordFetch"))
    goto LABEL_22;
  if (-[CPLRecordChange isDelete](self->_change, "isDelete"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    v6 = objc_msgSend(WeakRetained, "transportHasRecordWithScopedIdentifier:", self->_scopedIdentifier);

    change = self->_change;
    if ((v6 & 1) != 0)
    {
      -[CPLRecordChange setRecordChangeData:](change, "setRecordChangeData:", 0);
      -[CPLRecordChange setSharingRecordChangeData:](self->_change, "setSharingRecordChangeData:", 0);
    }
    else
    {
      self->_change = 0;

    }
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  v37 = 0;
  v8 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("FullRecordAlreadyOnServer"), CPLUploadCheckRuleFullRecordAlreadyOnServerFunction, &v37);
  v9 = v37;
  v10 = v9;
  if (!v8)
    goto LABEL_31;
  v36 = v9;
  v11 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("DropSparseResources"), CPLUploadCheckRuleDropSparseResourcesFunction, &v36);
  v12 = v36;

  if (!v11)
    goto LABEL_28;
  v35 = v12;
  v13 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("OnlyUploadAddedResources"), CPLUploadCheckRuleOnlyUploadAddedResourcesFunction, &v35);
  v10 = v35;

  if (!v13)
    goto LABEL_31;
  v34 = v10;
  v14 = -[CPLBeforeUploadCheckItem _forAdditionalRecordRule:check:error:](self, "_forAdditionalRecordRule:check:error:", CFSTR("CopyDerivativesFromSource"), CPLUploadCheckRuleCopyDerivativesFromSourceFunction, &v34);
  v12 = v34;

  if (!v14)
    goto LABEL_28;
  v33 = v12;
  v15 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("DontTrustCloudCache"), CPLUploadCheckRuleDontTrustCloudCacheFunction, &v33);
  v10 = v33;

  if (!v15)
    goto LABEL_31;
  if ((self->_ruleGroups & 2) != 0)
  {
    v32 = v10;
    v16 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("ForwardCompatibility"), CPLUploadCheckRuleForwardCompatibilityFunction, &v32);
    v12 = v32;

    if (!v16)
      goto LABEL_28;
    if ((self->_ruleGroups & 2) != 0)
    {
      v31 = v12;
      v24 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("AvoidGeneratingDerivatives"), CPLUploadCheckRuleAvoidGeneratingDerivativesFunction, &v31);
      v10 = v31;

      if (!v24)
        goto LABEL_31;
      if ((self->_ruleGroups & 2) == 0)
        goto LABEL_14;
      v30 = v10;
      v25 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("AvoidAccidentalUnshare"), CPLUploadCheckRuleAvoidAccidentalUnshareFunction, &v30);
      v12 = v30;

      if (!v25)
        goto LABEL_28;
    }
    v10 = v12;
  }
LABEL_14:
  v17 = v10;
  v29 = v10;
  v18 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("UpdateRecordTargetForSharingChange"), CPLUploadCheckRuleUpdateRecordTargetForSharingChangeFunction, &v29);
  v10 = v29;

  if (!v18)
    goto LABEL_31;
  if ((self->_ruleGroups & 2) == 0)
    goto LABEL_18;
  v28 = v10;
  v19 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("UpdateRecordTargetDuringResetSync"), CPLUploadCheckRuleUpdateRecordTargetDuringResetSyncFunction, &v28);
  v12 = v28;

  if (v19)
  {
    v10 = v12;
LABEL_18:
    v20 = v10;
    v27 = v10;
    v21 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("EnsureRelatedRecordIsShared"), CPLUploadCheckRuleEnsureRelatedRecordIsSharedFunction, &v27);
    v10 = v27;

    if (v21)
    {
      if ((self->_ruleGroups & 8) == 0)
      {
LABEL_23:
        v22 = 1;
        goto LABEL_24;
      }
      v26 = v10;
      v22 = -[CPLBeforeUploadCheckItem _forRule:check:error:](self, "_forRule:check:error:", CFSTR("UpdatePushRepositoryPriorityWhenOverQuota"), CPLUploadCheckRuleUpdatePushRepositoryPriorityWhenOverQuotaFunction, &v26);
      v12 = v26;

      goto LABEL_29;
    }
LABEL_31:
    v22 = 0;
    if (!a3)
      goto LABEL_24;
    goto LABEL_32;
  }
LABEL_28:
  v22 = 0;
LABEL_29:
  v10 = v12;
  if (!a3)
    goto LABEL_24;
LABEL_32:
  if (!v22)
  {
    v10 = objc_retainAutorelease(v10);
    v22 = 0;
    *a3 = v10;
  }
LABEL_24:

  return v22;
}

- (BOOL)hasRequestedRecordFetch
{
  return self->_rulesForRecordFetch != 0;
}

- (BOOL)requestFetchForRule:(id)a3 error:(id *)a4
{
  __CFString *v6;
  NSMutableSet *rulesForRecordFetch;
  char v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  id WeakRetained;
  void *v12;

  v6 = (__CFString *)a3;
  if (v6 == CFSTR("CheckRuleDisabled"))
  {
    v8 = 1;
  }
  else
  {
    rulesForRecordFetch = self->_rulesForRecordFetch;
    if (rulesForRecordFetch)
    {
      v8 = 1;
    }
    else
    {
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v10 = self->_rulesForRecordFetch;
      self->_rulesForRecordFetch = v9;

      WeakRetained = objc_loadWeakRetained((id *)&self->_items);
      -[CPLRecordChange scopedIdentifier](self->_change, "scopedIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(WeakRetained, "requestFetchOfRecordWithScopedIdentifier:forItem:rule:error:", v12, self, v6, a4);

      rulesForRecordFetch = self->_rulesForRecordFetch;
    }
    -[NSMutableSet addObject:](rulesForRecordFetch, "addObject:", v6);
  }

  return v8;
}

- (BOOL)requestFetchOfRecordWithScopedIdentifier:(id)a3 forRule:(id)a4 error:(id *)a5
{
  id v8;
  __CFString *v9;
  id WeakRetained;
  int v11;
  NSMutableDictionary *rulesForOtherRecordFetches;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  BOOL v15;

  v8 = a3;
  v9 = (__CFString *)a4;
  if (v9 != CFSTR("CheckRuleDisabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    v11 = objc_msgSend(WeakRetained, "requestFetchOfRecordWithScopedIdentifier:forItem:rule:error:", v8, self, v9, a5);

    if (!v11)
    {
      v15 = 0;
      goto LABEL_8;
    }
    rulesForOtherRecordFetches = self->_rulesForOtherRecordFetches;
    if (!rulesForOtherRecordFetches)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = self->_rulesForOtherRecordFetches;
      self->_rulesForOtherRecordFetches = v13;

      rulesForOtherRecordFetches = self->_rulesForOtherRecordFetches;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](rulesForOtherRecordFetches, "setObject:forKeyedSubscript:", v8, v9);
  }
  v15 = 1;
LABEL_8:

  return v15;
}

- (void)dropResourceChangeWithReason:(id)a3
{
  id v5;
  CPLRecordChange *change;
  unint64_t v7;
  NSObject *v8;
  CPLRecordChange *v9;
  id WeakRetained;
  int v11;
  CPLRecordChange *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  change = self->_change;
  if (change
    && -[CPLRecordChange supportsResources](change, "supportsResources")
    && -[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 8))
  {
    v7 = -[CPLRecordChange changeType](self->_change, "changeType");
    if (!v7)
      v7 = -[CPLRecordChange fullChangeTypeForFullRecord](self->_change, "fullChangeTypeForFullRecord");
    if (v7 == 8)
    {
      -[CPLBeforeUploadCheckItem dropChangeWithReason:](self, "dropChangeWithReason:", v5);
    }
    else
    {
      objc_storeStrong((id *)&self->_dropReason, a3);
      if (!_CPLSilentLogging)
      {
        __CPLCheckOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_change;
          v11 = 138412546;
          v12 = v9;
          v13 = 2112;
          v14 = v5;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Dropping resource change for %@ - reason: %@", (uint8_t *)&v11, 0x16u);
        }

      }
      -[CPLRecordChange setChangeType:](self->_change, "setChangeType:", v7 & 0xFFFFFFFFFFFFFFF7);
      *(_WORD *)&self->_needsToGenerateImageDerivatives = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_items);
      objc_msgSend(WeakRetained, "itemWillDropResourceChange:", self);

    }
  }

}

- (void)_dropChangeWithReason:(id)a3
{
  id v6;
  CPLRecordChange *change;
  id WeakRetained;
  NSObject *v9;
  Class changeClass;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  Class v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_change)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        changeClass = self->_changeClass;
        *(_DWORD *)buf = 138412290;
        v15 = changeClass;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Trying to drop an already dropped %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 826, CFSTR("Trying to drop an already dropped %@"), self->_changeClass);

    abort();
  }
  v13 = v6;
  objc_storeStrong((id *)&self->_dropReason, a3);
  change = self->_change;
  self->_change = 0;

  *(_WORD *)&self->_needsToGenerateImageDerivatives = 0;
  if (-[CPLRecordChange supportsResources](self->_change, "supportsResources")
    && -[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    objc_msgSend(WeakRetained, "itemWillDropResourceChange:", self);

  }
}

- (void)dropChangeWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  CPLRecordChange *change;
  int v7;
  CPLRecordChange *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_change)
  {
    if (!_CPLSilentLogging)
    {
      __CPLCheckOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        change = self->_change;
        v7 = 138412546;
        v8 = change;
        v9 = 2112;
        v10 = v4;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Dropping %@ - reason: %@", (uint8_t *)&v7, 0x16u);
      }

    }
    -[CPLBeforeUploadCheckItem _dropChangeWithReason:](self, "_dropChangeWithReason:", v4);
  }

}

- (void)dropSharingChangeWithReason:(id)a3
{
  id v5;
  CPLRecordChange *change;
  unint64_t v7;
  NSObject *v8;
  CPLRecordChange *v9;
  NSObject *v10;
  CPLRecordChange *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  CPLRecordChange *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  change = self->_change;
  if (change && -[CPLRecordChange hasChangeType:](change, "hasChangeType:", 64))
  {
    if (!-[CPLRecordChange supportsSharing](self->_change, "supportsSharing"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = self->_change;
          *(_DWORD *)buf = 138412290;
          v15 = v11;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Trying to drop sharing change for unsupported %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 845, CFSTR("Trying to drop sharing change for unsupported %@"), self->_change);

      abort();
    }
    v7 = -[CPLRecordChange changeType](self->_change, "changeType");
    if (!v7)
      v7 = -[CPLRecordChange fullChangeTypeForFullRecord](self->_change, "fullChangeTypeForFullRecord");
    if (v7 == 64)
    {
      -[CPLBeforeUploadCheckItem dropChangeWithReason:](self, "dropChangeWithReason:", v5);
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLCheckOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_change;
          *(_DWORD *)buf = 138412546;
          v15 = v9;
          v16 = 2112;
          v17 = v5;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Dropping sharing change for %@ - reason: %@", buf, 0x16u);
        }

      }
      -[CPLRecordChange setChangeType:](self->_change, "setChangeType:", v7 & 0xFFFFFFFFFFFFFFBFLL);
    }
  }

}

- (void)reinjectChangeWithReason:(id)a3
{
  CPLBeforeUploadCheckItems **p_items;
  id WeakRetained;
  id v6;

  if (self->_change)
  {
    p_items = &self->_items;
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_items);
    objc_msgSend(WeakRetained, "itemShouldBeReinjectedInPushRepository:", self);

    -[CPLBeforeUploadCheckItem dropChangeWithReason:](self, "dropChangeWithReason:", v6);
  }
}

- (BOOL)rejectChangeWithReason:(id)a3 error:(id *)a4
{
  id v7;
  CPLRecordChange *change;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  CPLRecordChange *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  CPLRecordChange *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  change = self->_change;
  if (!change)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = self->_change;
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Trying to reject already rejected or dropped %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 869, CFSTR("Trying to reject already rejected or dropped %@"), self->_change);

    abort();
  }
  v9 = v7;
  self->_change = 0;

  v17 = CFSTR("CPLErrorRejectedReasonKey");
  v18 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 18, 0, v10, CFSTR("%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return 0;
}

- (BOOL)_serverResourcesMatches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  -[CPLRecordChange resourceForType:](self->_change, "resourceForType:", objc_msgSend(v4, "resourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fingerPrint");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fingerPrint");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = v8 && v10 && (objc_msgSend((id)v8, "isEqual:", v10) & 1) != 0 || (v8 | v10) == 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)dropGeneratingDerivativesIfPossibleWithRecordOnServer:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  CPLResourceTypeSet *resourcesToGenerateImageDerivatives;
  uint64_t v29;
  NSObject *v30;
  CPLRecordChange *change;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  CPLRecordChange *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  id v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  CPLRecordChange *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[CPLRecordChange isAssetChange](self->_change, "isAssetChange"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = v5;
    objc_msgSend(v5, "resources");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = 0;
      v23 = *(_QWORD *)v46;
LABEL_26:
      v24 = 0;
      while (2)
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v18);
        v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v24);
        v26 = objc_msgSend(v25, "resourceType");
        switch(v26)
        {
          case 1:
          case 2:
          case 16:
          case 17:
            if (!self->_needsToGenerateImageDerivatives)
              goto LABEL_41;
            v27 = v26;
            if (!-[CPLResourceTypeSet containsResourceType:](self->_resourcesToGenerateImageDerivatives, "containsResourceType:", v26))goto LABEL_41;
            if (-[CPLBeforeUploadCheckItem _serverResourcesMatches:](self, "_serverResourcesMatches:", v25))
            {
              resourcesToGenerateImageDerivatives = self->_resourcesToGenerateImageDerivatives;
              v29 = v27;
              goto LABEL_40;
            }
            goto LABEL_49;
          case 3:
          case 4:
          case 5:
            v21 = 1;
            goto LABEL_41;
          case 6:
          case 7:
          case 21:
          case 28:
            v22 = 1;
            goto LABEL_41;
          case 18:
            if (!self->_needsToGenerateVideoComplementDerivatives
              || !-[CPLResourceTypeSet containsResourceType:](self->_resourcesToGenerateVideoComplementDerivatives, "containsResourceType:", 18))
            {
              goto LABEL_41;
            }
            if (!-[CPLBeforeUploadCheckItem _serverResourcesMatches:](self, "_serverResourcesMatches:", v25))
              goto LABEL_49;
            resourcesToGenerateImageDerivatives = self->_resourcesToGenerateVideoComplementDerivatives;
            v29 = 18;
LABEL_40:
            -[CPLResourceTypeSet removeResourceType:](resourcesToGenerateImageDerivatives, "removeResourceType:", v29);
LABEL_41:
            if (v20 != ++v24)
              continue;
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            if (!v20)
              goto LABEL_49;
            goto LABEL_26;
          default:
            goto LABEL_41;
        }
      }
    }
    v21 = 0;
    v22 = 0;
LABEL_49:

    if (self->_needsToGenerateImageDerivatives
      && (-[CPLResourceTypeSet isEmpty](self->_resourcesToGenerateImageDerivatives, "isEmpty") & v21) == 1)
    {
      self->_needsToGenerateImageDerivatives = 0;
    }
    v5 = v43;
    if (self->_needsToGenerateVideoComplementDerivatives
      && (-[CPLResourceTypeSet isEmpty](self->_resourcesToGenerateVideoComplementDerivatives, "isEmpty") & v22) == 1)
    {
      self->_needsToGenerateVideoComplementDerivatives = 0;
    }
    goto LABEL_64;
  }
  -[CPLRecordChange adjustments](self->_change, "adjustments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(v7, "adjustments");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v6)
  {
    if (v8)
    {
      if (!_CPLSilentLogging)
      {
        __CPLCheckOSLogDomain();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          change = self->_change;
          *(_DWORD *)buf = 138412546;
          v55 = change;
          v56 = 2112;
          v57 = v7;
          v32 = "%@ has no adjustments while server record %@ has. Keeping server version";
          v33 = v30;
          v34 = 22;
LABEL_58:
          _os_log_impl(&dword_1B03C2000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
          goto LABEL_59;
        }
        goto LABEL_59;
      }
    }
    else if (!_CPLSilentLogging)
    {
      __CPLCheckOSLogDomain();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v35 = self->_change;
        *(_DWORD *)buf = 138412290;
        v55 = v35;
        v32 = "%@ has no adjustments. Keeping server version";
        v33 = v30;
        v34 = 12;
        goto LABEL_58;
      }
LABEL_59:

    }
    -[CPLBeforeUploadCheckItem dropResourceChangeWithReason:](self, "dropResourceChangeWithReason:", CFSTR("unadjusted asset with adjusted resources"));

    goto LABEL_67;
  }
  if (v8 && objc_msgSend(v6, "isEqual:", v8))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v7, "resources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v11)
    {
      v12 = v11;
      v40 = v6;
      v41 = v9;
      v42 = v7;
      v13 = 0;
      v44 = 0;
      v14 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v50 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "resourceType");
          if (v17 <= 0x1C)
          {
            if (((1 << v17) & 0x210E000) != 0)
            {
              if (-[CPLBeforeUploadCheckItem _serverResourcesMatches:](self, "_serverResourcesMatches:", v16))
              {

                v36 = v7;
                v38 = v40;
                v37 = v41;
                goto LABEL_61;
              }
            }
            else if (((1 << v17) & 0x102000C0) != 0)
            {
              v13 = 1;
            }
            else if (((1 << v17) & 0x38) != 0)
            {
              v44 = 1;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v12);

      v38 = v40;
      v37 = v41;
      if ((self->_needsToGenerateImageDerivatives & v44) == 1)
        self->_needsToGenerateImageDerivatives = 0;
      v36 = v42;
      if ((self->_needsToGenerateVideoComplementDerivatives & v13) == 1)
        self->_needsToGenerateVideoComplementDerivatives = 0;
LABEL_61:

      goto LABEL_64;
    }

  }
LABEL_64:
  if (!self->_needsToGenerateImageDerivatives && !self->_needsToGenerateVideoComplementDerivatives)
    -[CPLBeforeUploadCheckItem dropResourceChangeWithReason:](self, "dropResourceChangeWithReason:", CFSTR("record already exists on server with the proper derivatives"));
LABEL_67:

  return 1;
}

- (void)_bumpPushRepositoryPriority:(unint64_t)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  unint64_t pushRepositoryPriority;
  CPLRecordChange *change;
  id WeakRetained;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  CPLRecordChange *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_change && self->_pushRepositoryPriority < a3)
  {
    if (!_CPLSilentLogging)
    {
      __CPLCheckOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        pushRepositoryPriority = self->_pushRepositoryPriority;
        change = self->_change;
        v11 = 134218754;
        v12 = pushRepositoryPriority;
        v13 = 2048;
        v14 = a3;
        v15 = 2112;
        v16 = change;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Moving priority from %lu to %lu for %@ - reason: %@", (uint8_t *)&v11, 0x2Au);
      }

    }
    self->_pushRepositoryPriority = a3;
    -[CPLBeforeUploadCheckItem _dropChangeWithReason:](self, "_dropChangeWithReason:", CFSTR("bumping push priority of change"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    objc_msgSend(WeakRetained, "itemShouldBeReinjectedInPushRepository:", self);

  }
}

- (void)updatePushRepositoryPriorityWithRecordOnServer:(id)a3
{
  id v5;
  CPLRecordChange *change;
  void (**v7)(_QWORD, _QWORD);
  id WeakRetained;
  void *v9;
  void *v10;
  CPLRecordChange *v11;
  id v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  const __CFString *v16;
  unint64_t v17;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  BOOL v22;
  const __CFString *v23;
  NSObject *v24;
  CPLRecordChange *v25;
  void *v26;
  void *v27;
  void *v28;
  CPLRecordChange *v29;
  void *v30;
  _QWORD v31[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE buf[24];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  change = self->_change;
  if (change)
  {
    if (!-[CPLRecordChange isAssetChange](change, "isAssetChange"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = self->_change;
          NSStringFromSelector(a2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v26;
          _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "%@ should not participate in %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBeforeUploadCheckItems.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = self->_change;
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v28, 1079, CFSTR("%@ should not participate in %@"), v29, v30);

      abort();
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v37 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __75__CPLBeforeUploadCheckItem_updatePushRepositoryPriorityWithRecordOnServer___block_invoke;
    v31[3] = &unk_1E60DC558;
    v31[5] = &v32;
    v31[6] = buf;
    v31[4] = self;
    v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v31);
    WeakRetained = objc_loadWeakRetained((id *)&self->_items);
    objc_msgSend(WeakRetained, "sharingScopeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_20:
      if (!*((_BYTE *)v33 + 24))
      {
        if (-[CPLRecordChange isFullRecord](self->_change, "isFullRecord"))
        {
          v18 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
          v19 = CFSTR("uploading asset to sharing scope");
          v20 = CFSTR("uploading asset to scope");
LABEL_30:
          if (v18)
            v23 = v19;
          else
            v23 = v20;
          ((void (**)(_QWORD, const __CFString *))v7)[2](v7, v23);
          goto LABEL_34;
        }
        if (-[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 8))
        {
          -[CPLRecordChange resources](self->_change, "resources");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count") == 0;

          if (!v22)
          {
            v18 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
            v19 = CFSTR("uploading new resources for asset to sharing scope");
            v20 = CFSTR("uploading new resources for asset to scope");
            goto LABEL_30;
          }
        }
        if (-[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 2)
          && !-[CPLRecordChange inTrash](self->_change, "inTrash")
          && objc_msgSend(v5, "inTrash"))
        {
          v18 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
          v19 = CFSTR("removing asset from recently deleted in sharing scope");
          v20 = CFSTR("removing asset from recently deleted in scope");
          goto LABEL_30;
        }
      }
LABEL_34:

      _Block_object_dispose(&v32, 8);
      _Block_object_dispose(buf, 8);
      goto LABEL_35;
    }
    -[CPLBeforeUploadCheckItem target](self, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[objc_class supportsSharingScopedIdentifier](self->_changeClass, "supportsSharingScopedIdentifier")|| !-[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 64))
    {
      v17 = objc_msgSend(v10, "targetState");
      if (v17 <= 3)
        *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0x1010000u >> (8 * v17);
      goto LABEL_19;
    }
    v11 = self->_change;
    v12 = objc_loadWeakRetained((id *)&self->_items);
    objc_msgSend(v12, "sharingScopeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CPLRecordChange isSharedInScopeWithIdentifier:](v11, "isSharedInScopeWithIdentifier:", v13);
    *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = v14;

    v15 = objc_msgSend(v10, "targetState");
    if ((unint64_t)(v15 - 2) < 2)
    {
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
LABEL_19:

        goto LABEL_20;
      }
      v16 = CFSTR("moving record back from sharing scope");
    }
    else if (v15)
    {
      if (v15 != 1 || !*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        goto LABEL_19;
      v16 = CFSTR("moving record to sharing scope");
    }
    else if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v16 = CFSTR("uploading new record to sharing scope");
    }
    else
    {
      v16 = CFSTR("uploading new record to scope");
    }
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, v16);
    goto LABEL_19;
  }
LABEL_35:

}

- (CPLRecordTarget)target
{
  CPLBeforeUploadCheckItems **p_items;
  id WeakRetained;
  void *v5;
  CPLRecordTarget *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  CPLScopedIdentifier *v11;
  id v12;
  void *v13;
  void *v14;
  CPLScopedIdentifier *v15;

  p_items = &self->_items;
  WeakRetained = objc_loadWeakRetained((id *)&self->_items);
  objc_msgSend(WeakRetained, "targetMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetForRecordWithScopedIdentifier:", self->_scopedIdentifier);
  v6 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_loadWeakRetained((id *)p_items);
    objc_msgSend(v7, "sharingScopeIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = -[objc_class supportsSharing](self->_changeClass, "supportsSharing");

      if (v10)
      {
        v11 = [CPLScopedIdentifier alloc];
        v12 = objc_loadWeakRetained((id *)p_items);
        objc_msgSend(v12, "sharingScopeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLScopedIdentifier identifier](self->_scopedIdentifier, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v11, "initWithScopeIdentifier:identifier:", v13, v14);

        v6 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", self->_scopedIdentifier, v15, 0);
        return v6;
      }
    }
    else
    {

    }
    v6 = -[CPLRecordTarget initWithScopedIdentifier:]([CPLRecordTarget alloc], "initWithScopedIdentifier:", self->_scopedIdentifier);
  }
  return v6;
}

- (unint64_t)estimatedResourceUploadSize
{
  CPLRecordChange *change;

  change = self->_change;
  if (change
    && -[CPLRecordChange supportsResources](change, "supportsResources")
    && -[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 8))
  {
    return -[CPLRecordChange realUploadResourceSize](self->_change, "realUploadResourceSize");
  }
  else
  {
    return 0;
  }
}

- (id)description
{
  void *v3;
  CPLRecordChange *change;
  NSString *dropReason;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("[<%@ %@"), self->_changeClass, self->_scopedIdentifier);
  change = self->_change;
  dropReason = self->_dropReason;
  if (change)
  {
    +[CPLRecordChange descriptionForChangeType:](CPLRecordChange, "descriptionForChangeType:", -[CPLRecordChange changeType](change, "changeType"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (dropReason)
      objc_msgSend(v3, "appendFormat:", CFSTR(" [%@-R (%@)]"), v6, self->_dropReason);
    else
      objc_msgSend(v3, "appendFormat:", CFSTR(" [%@]"), v6, v13);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" [dropped (%@)]"), self->_dropReason);
  }
  if (-[NSMutableSet count](self->_rulesForRecordFetch, "count"))
  {
    -[NSMutableSet allObjects](self->_rulesForRecordFetch, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" [fetch: %@]"), v9);

  }
  if (-[NSMutableDictionary count](self->_rulesForOtherRecordFetches, "count"))
  {
    -[NSMutableDictionary allKeys](self->_rulesForOtherRecordFetches, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" [other: %@]"), v11);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)ruleGroups
{
  return self->_ruleGroups;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (CPLRecordChange)change
{
  return self->_change;
}

- (Class)changeClass
{
  return self->_changeClass;
}

- (BOOL)isAsset
{
  return self->_isAsset;
}

- (CPLBeforeUploadCheckItems)items
{
  return (CPLBeforeUploadCheckItems *)objc_loadWeakRetained((id *)&self->_items);
}

- (unint64_t)pushRepositoryPriority
{
  return self->_pushRepositoryPriority;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_items);
  objc_storeStrong((id *)&self->_changeClass, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
  objc_storeStrong((id *)&self->_resourcesToGenerateVideoComplementDerivatives, 0);
  objc_storeStrong((id *)&self->_resourcesToGenerateImageDerivatives, 0);
  objc_storeStrong((id *)&self->_dropReason, 0);
  objc_storeStrong((id *)&self->_recordOnServer, 0);
  objc_storeStrong((id *)&self->_rulesForOtherRecordFetches, 0);
  objc_storeStrong((id *)&self->_rulesForRecordFetch, 0);
}

uint64_t __75__CPLBeforeUploadCheckItem_updatePushRepositoryPriorityWithRecordOnServer___block_invoke(_QWORD *a1, uint64_t a2)
{
  int v2;
  void *v3;
  uint64_t v4;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  v3 = (void *)a1[4];
  if (v2)
    v4 = 3000;
  else
    v4 = 2000;
  return objc_msgSend(v3, "_bumpPushRepositoryPriority:reason:", v4, a2);
}

+ (void)setAllowsAssetsWithResourcesButNoAdjustments:(BOOL)a3
{
  _allowsAssetsWithResourcesButNoAdjustments = a3;
}

+ (BOOL)allowsAssetsWithResourcesButNoAdjustments
{
  return _allowsAssetsWithResourcesButNoAdjustments;
}

@end
