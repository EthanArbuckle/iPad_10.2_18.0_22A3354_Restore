@implementation CKDMapShareURLsToInstalledBundleIDsOperation

- (CKDMapShareURLsToInstalledBundleIDsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDMapShareURLsToInstalledBundleIDsOperation *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *shareURLs;
  uint64_t v15;
  NSMutableDictionary *shareMetadatasByURL;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKDMapShareURLsToInstalledBundleIDsOperation;
  v9 = -[CKDOperation initWithOperationInfo:container:](&v18, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_shareURLs(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    shareURLs = v9->_shareURLs;
    v9->_shareURLs = (NSMutableArray *)v13;

    v15 = objc_opt_new();
    shareMetadatasByURL = v9->_shareMetadatasByURL;
    v9->_shareMetadatasByURL = (NSMutableDictionary *)v15;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/map-share-urls-to-bundle-IDs", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 244;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__fetchRegisteredBundleIDs(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__fetchShareMetadata(self, v6, v7);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
    return CFSTR("Fetch Share Metadata");
  if (a3 == 3)
  {
    v5 = CFSTR("Fetch Registered bundleIDs");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDMapShareURLsToInstalledBundleIDsOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_performCallbackForURL:(id)a3 withAppBundleIDs:(id)a4 daemonBundleIDs:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_shareURLs(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v16);
  objc_msgSend_shareURLs(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v19, v20, (uint64_t)v10);

  objc_sync_exit(v16);
  objc_msgSend_bundleIDsFetchedBlock(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_callbackQueue(self, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA07C34;
    block[3] = &unk_1E782E490;
    block[4] = self;
    v28 = v10;
    v29 = v11;
    v30 = v12;
    v31 = v13;
    dispatch_async(v26, block);

  }
}

- (void)_fetchShareMetadata
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  CKDAppContainerTuple *v14;
  CKDApplicationID *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
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
  void *v45;
  void *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[5];

  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processScopedClientProxy(v4, v5, v6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logicalDeviceScopedClientProxy(v9, v10, v11);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0C94C40]);
  v56 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v12, v13, (uint64_t)CFSTR("com.apple.cloudkit"), 1);
  v14 = [CKDAppContainerTuple alloc];
  v15 = [CKDApplicationID alloc];
  v17 = (void *)objc_msgSend_initWithApplicationBundleIdentifier_(v15, v16, (uint64_t)CFSTR("com.apple.cloudd"));
  objc_msgSend_container(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaID(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v14, v24, (uint64_t)v17, v56, v23);

  objc_msgSend_container(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientConnection(v55, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedContainers(v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v44, (uint64_t)v25, v55, v57, v31, v37, v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)objc_opt_new();
  objc_msgSend_setOverwriteContainerPCSServiceIfManatee_(v46, v47, 1);
  objc_msgSend_setSkipShareDecryption_(v46, v48, 1);
  objc_msgSend_shareURLs(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareURLsToFetch_(v46, v52, (uint64_t)v51);

  v53 = objc_opt_class();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = sub_1BEA07EE8;
  v58[3] = &unk_1E782E508;
  v58[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v54, v53, v46, 0, v45, v58);

}

- (void)_fetchRegisteredBundleIDs
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  CKDAppContainerTuple *v21;
  CKDApplicationID *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  NSObject *v61;
  id obj;
  uint64_t v63;
  CKDMapShareURLsToInstalledBundleIDsOperation *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[6];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processScopedClientProxy(v4, v5, v6);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logicalDeviceScopedClientProxy(v9, v10, v11);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v64 = self;
  objc_msgSend_shareURLs(self, v12, v13);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v72, v76, 16);
  if (v67)
  {
    v63 = *(_QWORD *)v73;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v73 != v63)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v17);
        v69 = v18;
        objc_msgSend_shareMetadatasByURL(v64, v15, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v19, v20, v18);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = [CKDAppContainerTuple alloc];
        v22 = [CKDApplicationID alloc];
        v24 = (void *)objc_msgSend_initWithApplicationBundleIdentifier_(v22, v23, (uint64_t)CFSTR("com.apple.cloudd"));
        objc_msgSend_containerID(v70, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(v64, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_personaID(v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v17;
        v35 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v21, v34, (uint64_t)v24, v27, v33);

        objc_msgSend_container(v64, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_entitlements(v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(v64, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_options(v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clientConnection(v66, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharedContainers(v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v54, (uint64_t)v35, v66, v65, v41, v47, v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = objc_opt_class();
        v57 = (void *)objc_opt_new();
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = sub_1BEA08640;
        v71[3] = &unk_1E782E558;
        v71[4] = v69;
        v71[5] = v64;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(v64, v58, v56, v57, 0, v55, v71);

        objc_msgSend_stateTransitionGroup(v64, v59, v60);
        v61 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v61);

        v17 = v68 + 1;
      }
      while (v67 != v68 + 1);
      v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v72, v76, 16);
    }
    while (v67);
  }

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setBundleIDsFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDMapShareURLsToInstalledBundleIDsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)main
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  _BOOL8 v9;
  const char *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  CKDMapShareURLsToInstalledBundleIDsOperation *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v11 = v3;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v14, 1, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v19, 0, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544130;
    v25 = v13;
    v26 = 2048;
    v27 = self;
    v28 = 2114;
    v29 = v18;
    v30 = 2112;
    v31 = v23;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Starting mapping share urls to bundleIDs operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v24,
      0x2Au);

  }
  objc_msgSend_shareURLs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8) == 0;

  objc_msgSend_makeStateTransition_(self, v10, v9);
}

- (id)bundleIDsFetchedBlock
{
  return self->_bundleIDsFetchedBlock;
}

- (void)setBundleIDsFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSMutableArray)shareURLs
{
  return self->_shareURLs;
}

- (void)setShareURLs:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLs, a3);
}

- (NSMutableDictionary)shareMetadatasByURL
{
  return self->_shareMetadatasByURL;
}

- (void)setShareMetadatasByURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadatasByURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadatasByURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong(&self->_bundleIDsFetchedBlock, 0);
}

@end
