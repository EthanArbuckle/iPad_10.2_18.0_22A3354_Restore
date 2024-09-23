@implementation CKDDiscoverAllUserIdentitiesOperation

- (CKDDiscoverAllUserIdentitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDDiscoverAllUserIdentitiesOperation;
  return -[CKDDiscoverUserIdentitiesOperation initWithOperationInfo:container:](&v5, sel_initWithOperationInfo_container_, a3, a4);
}

+ (BOOL)adopterProvidedLookupInfos
{
  return 0;
}

- (void)_discoverIdentitiesBatched:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  id v19;
  const char *v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v7 = objc_msgSend_count(v4, v5, v6);
  if (v7 >= 0x15E)
  {
    v9 = 350;
    objc_msgSend_subarrayWithRange_(v4, v8, 0, 350);
  }
  else
  {
    v9 = v7;
    objc_msgSend_subarrayWithRange_(v4, v8, 0, v7);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v4, v11, v12);
  v16 = 0;
  if (v9 < v15)
  {
    v17 = objc_msgSend_count(v4, v13, v14);
    objc_msgSend_subarrayWithRange_(v4, v18, v9, v17 - v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1BEA8BDE4;
  v21[3] = &unk_1E782EB38;
  v21[4] = self;
  v22 = v16;
  v19 = v16;
  objc_msgSend__discoverIdentitiesWithLookupInfos_completionBlock_(self, v20, (uint64_t)v10, v21);

}

- (void)_populateFakeUnitTestLookupInfos:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lookupInfosWithEmails_(MEMORY[0x1E0C95218], a2, (uint64_t)a3);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v28, v32, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0C99E20];
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_emailAddress(v11, v6, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("FakeContactIdentifier-%@"), v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithObject_(v12, v17, (uint64_t)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contactIdentifiersByLookupInfo(self, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v21, v22, (uint64_t)v18, v11);

      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v28, v32, 16);
    }
    while (v8);
  }
  objc_msgSend_setUserIdentityLookupInfos_(self, v6, (uint64_t)obj);
  objc_msgSend_userIdentityLookupInfos(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__discoverIdentitiesBatched_(self, v26, (uint64_t)v25);

}

- (void)_populateRealUserIdentityLookupInfos
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  char Request_error_usingBlock;
  id v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  _QWORD v25[4];
  id v26;
  CKDDiscoverAllUserIdentitiesOperation *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0C97210]);
  v6 = *MEMORY[0x1E0C967C0];
  v31[0] = *MEMORY[0x1E0C966A8];
  v31[1] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v31, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithKeysToFetch_(v5, v9, (uint64_t)v8);

  objc_msgSend_setUnifyResults_(v10, v11, 0);
  v28 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BEA8C210;
  v25[3] = &unk_1E7831F58;
  v12 = v3;
  v26 = v12;
  v27 = self;
  Request_error_usingBlock = objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(v4, v13, (uint64_t)v10, &v28, v25);
  v15 = v28;
  if ((Request_error_usingBlock & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v15;
      _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "Error fetching contacts: %@", buf, 0xCu);
    }
  }

  objc_msgSend_allObjects(v12, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserIdentityLookupInfos_(self, v20, (uint64_t)v19);

  objc_msgSend_userIdentityLookupInfos(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__discoverIdentitiesBatched_(self, v24, (uint64_t)v23);

}

- (void)_populateUserIdentityLookupInfos
{
  void *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = (void *)objc_opt_new();
  objc_msgSend_setContactIdentifiersByLookupInfo_(self, v4, (uint64_t)v3);

  if ((CKIsRunningInSyncBubble() & 1) != 0)
  {
    objc_msgSend_userIdentityLookupInfos(self, v5, v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__discoverIdentitiesBatched_(self, v7, (uint64_t)v13);
  }
  else
  {
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("ContactsDatabaseEmails"));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v14;
    }
    else
    {
      v10 = 0;
    }
    v13 = v10;
    if (objc_msgSend_count(v10, v5, v6))
      objc_msgSend__populateFakeUnitTestLookupInfos_(self, v11, (uint64_t)v13);
    else
      objc_msgSend__populateRealUserIdentityLookupInfos(self, v11, v12);
  }

}

- (void)main
{
  ((void (*)(CKDDiscoverAllUserIdentitiesOperation *, char *))MEMORY[0x1E0DE7D20])(self, sel__populateUserIdentityLookupInfos);
}

- (void)_handleDiscoveredIdentity:(id)a3 lookupInfo:(id)a4 responseCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v8;
    _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Found user identity %@", buf, 0xCu);
  }
  if (objc_msgSend_code(v10, v12, v13) == 1)
  {
    if (v8)
    {
      objc_msgSend_setLookupInfo_(v8, v14, 0);
      objc_msgSend_contactIdentifiersByLookupInfo(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setContactIdentifiers_(v8, v23, (uint64_t)v22);

      objc_msgSend_callbackQueue(self, v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = sub_1BEA8C844;
      v42[3] = &unk_1E782EE20;
      v42[4] = self;
      v43 = v8;
      dispatch_async(v26, v42);

    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0C94FF8];
    v28 = *MEMORY[0x1E0C94B20];
    v29 = sub_1BEB10D5C(v10);
    objc_msgSend_request(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v32, v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v27, v34, v28, v29, v33, CFSTR("Error discovering user identities"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v36, (uint64_t)v35);

    objc_msgSend_request(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancel(v39, v40, v41);

  }
}

- (NSMutableDictionary)contactIdentifiersByLookupInfo
{
  return self->_contactIdentifiersByLookupInfo;
}

- (void)setContactIdentifiersByLookupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifiersByLookupInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiersByLookupInfo, 0);
}

@end
