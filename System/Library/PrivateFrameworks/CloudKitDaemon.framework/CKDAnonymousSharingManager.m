@implementation CKDAnonymousSharingManager

- (CKDAnonymousSharingManager)initWithContainer:(id)a3
{
  id v4;
  CKDAnonymousSharingManager *v5;
  CKDAnonymousSharingManager *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *synchronizeQueue;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKDAnonymousSharingManager;
  v5 = -[CKDAnonymousSharingManager init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_container, v4);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerID(v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v7, v11, (uint64_t)CFSTR("%s.%@"), "com.apple.cloudkit.anonymousSharingManager.queue", v10);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    synchronizeQueue = v6->_synchronizeQueue;
    v6->_synchronizeQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_set_specific((dispatch_queue_t)v6->_synchronizeQueue, "com.apple.cloudkit.anonymousSharingManager.queue", (void *)1, 0);
  }

  return v6;
}

- (id)_generateHashIdentifierForAnonymousShareTuple:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
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
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const void *v41;
  const char *v42;
  CC_LONG v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  NSObject *v48;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  unsigned __int8 md[16];
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_zoneID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zoneID(v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zoneID(v4, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_anonymousCKUserID(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("%@-%@-%@"), v10, v16, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_length(v22, v25, v26) <= 0x41)
  {
    *(_OWORD *)md = 0u;
    v55 = 0u;
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v27, (uint64_t)md, 32, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (const void *)objc_msgSend_UTF8String(v24, v39, v40);
    v43 = objc_msgSend_lengthOfBytesUsingEncoding_(v24, v42, 4);
    CC_SHA256(v41, v43, md);
    objc_msgSend_CKLowercaseHexStringWithoutSpaces(v38, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(CFSTR("+"), v47, (uint64_t)v46);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v48 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v51 = v37;
      v52 = 2112;
      v53 = v22;
      _os_log_debug_impl(&dword_1BE990000, v48, OS_LOG_TYPE_DEBUG, "Generated anonymousShareTupleHash: %@ for anonymousUserID: %@", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend_zonePCSData(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPCS(v29, v30, v31);

    objc_msgSend_dataUsingEncoding_(v24, v32, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)PCSFPCreateDerivedDataFromMasterKey();
    objc_msgSend_CKLowercaseHexStringWithoutSpaces(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v37;
}

- (void)addAnonymousSharesToSharedDB:(id)a3 operation:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CKDAnonymousSharingManager *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_synchronizeQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEAFC320;
  v17[3] = &unk_1E7833580;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v14 = v9;
  v15 = v10;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)removeAnonymousSharesFromSharedDB:(id)a3 operation:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CKDAnonymousSharingManager *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_synchronizeQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEAFC880;
  v17[3] = &unk_1E7833580;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v14 = v9;
  v15 = v10;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)encryptShareTuples:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_synchronizeQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAFCEE8;
  block[3] = &unk_1E782F678;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)_locked_encryptShareTuples:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  void *v63;
  NSObject *v64;
  const char *v65;
  void *v66;
  void (**v67)(_QWORD, id, void *);
  id v68;
  id v69;
  uint64_t v70;
  id obj;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend_synchronizeQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend_zonePCSData(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v67 = (void (**)(_QWORD, id, void *))v7;
    v69 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v68 = v6;
    obj = v6;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v74, v80, 16);
    if (!v15)
      goto LABEL_23;
    v17 = v15;
    v18 = *(_QWORD *)v75;
    v70 = *MEMORY[0x1E0C947D8];
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v75 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v19);
        objc_msgSend__generateHashIdentifierForAnonymousShareTuple_(self, v16, (uint64_t)v20, v67);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCkAnonymousShareHashIdentifier_(v20, v22, (uint64_t)v21);

        objc_msgSend_ckAnonymousShareHashIdentifier(v20, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v73 = 0;
          objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v26, (uint64_t)v20, 1, &v73);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v73;
          objc_msgSend_dataUsingEncoding_(CFSTR("CKDAnonymousShareTuple"), v29, 4);
          objc_msgSend_zonePCSData(self, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneishPCS(v32, v33, v34);
          v35 = (void *)PCSFPCopyEncryptedData();

          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v44 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v49 = v44;
            objc_msgSend_zonePCSData(self, v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend_pcs(v52, v53, v54);
            *(_DWORD *)buf = 138412290;
            v79 = v55;
            _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, "Encrypted data with zone PCS %@:", buf, 0xCu);

          }
          objc_msgSend_ckAnonymousShareHashIdentifier(v20, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v69, v48, (uint64_t)v35, v47);

          goto LABEL_20;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v36 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Error generating ckAnonymousShareHashIdentifier for CKDAnonymousShareTuple", buf, 2u);
        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v37, v70, 1000, CFSTR("Error generating ckAnonymousShareHashIdentifier for CKDAnonymousShareTuple."));
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shareID(v20, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend_shareID(v20, v41, v42);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v72, v43, (uint64_t)v28, v27);
LABEL_20:

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v74, v80, 16);
      if (!v17)
      {
LABEL_23:

        if (objc_msgSend_count(v72, v56, v57))
        {
          objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v60, v61, (uint64_t)v72, *MEMORY[0x1E0C94940]);
          objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v62, *MEMORY[0x1E0C94B20], 1011, v60, CFSTR("Failed to encrypt some anonymous share tuples."));
          v63 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v63 = 0;
        }
        v7 = (void (**)(id, _QWORD, void *))v67;
        v6 = v68;
        v66 = v69;
        if (v67)
          v67[2](v67, v69, v63);

        goto LABEL_35;
      }
    }
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v64 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE990000, v64, OS_LOG_TYPE_DEBUG, "_encryptShareTuple zonePCSData is still not available. Terminating without additional retry.", buf, 2u);
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v65, *MEMORY[0x1E0C947D8], 1000, CFSTR("_locked_encryptShareTuples zonePCSData is still not available. Terminating without additional retry."));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, 0, v66);
LABEL_35:

}

- (void)decryptShareTuple:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_synchronizeQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAFD73C;
  block[3] = &unk_1E782F678;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)_locked_decryptShareTuple:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  _QWORD *v15;
  os_log_t *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  dispatch_block_t *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  os_log_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  CFTypeRef v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend_synchronizeQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend_zonePCSData(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (_QWORD *)MEMORY[0x1E0C95300];
  v16 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (v13)
  {
    cf = 0;
    objc_msgSend_dataUsingEncoding_(CFSTR("CKDAnonymousShareTuple"), v14, 4);
    v19 = (void *)PCSFPCopyTruncatedKeyIDFromEncryptedData();
    v20 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
    if (!v19)
    {
      if (*v15 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v21 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v45 = (uint64_t)v6;
        v46 = 2112;
        v47 = cf;
        _os_log_error_impl(&dword_1BE990000, v21, OS_LOG_TYPE_ERROR, "Failed to get keyID from encrypted data %@. PCS error: %@.", buf, 0x16u);
      }
    }
    objc_msgSend_zonePCSData(self, v17, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPCS(v22, v23, v24);
    v25 = (void *)PCSFPCopyDecryptedData();

    if (*v15 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v20);
    v28 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      v35 = v28;
      objc_msgSend_zonePCSData(self, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend_pcs(v38, v39, v40);
      *(_DWORD *)buf = 138412290;
      v45 = v41;
      _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Decrypted data with zone PCS %@:", buf, 0xCu);

    }
    if (v25)
    {
      v29 = (void *)MEMORY[0x1E0CB3710];
      v30 = objc_opt_class();
      v42 = 0;
      objc_msgSend_unarchivedObjectOfClass_fromData_error_(v29, v31, v30, v25, &v42);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v7[2](v7, v32, 0);
    }
    else
    {
      if (*v15 != -1)
        dispatch_once(MEMORY[0x1E0C95300], *v20);
      v33 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEBUG, "_locked_decryptShareTuple Unable to decrypt share tuple data.", buf, 2u);
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v34, *MEMORY[0x1E0C947D8], 1000, CFSTR("_locked_decryptShareTuple Unable to decrypt share tuple data."));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v32);
    }

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "_locked_decryptShareTuple zonePCSData is still not available. Terminating without additional retry.", buf, 2u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, *MEMORY[0x1E0C947D8], 1000, CFSTR("_locked_decryptShareTuple zonePCSData is still not available. Terminating without additional retry."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v19);
  }

}

- (id)pcsCache
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_container(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsCache(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_lockedFetchSystemZonePCSDataWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  CKDDatabaseOperation *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  const char *v44;
  const __CFString *v45;
  _QWORD v46[4];
  id v47;
  CKDAnonymousSharingManager *v48;
  id v49;
  id v50;
  _QWORD *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id location;
  uint8_t buf[4];
  const __CFString *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_synchronizeQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_initWeak(&location, self);
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_1BE9BB048;
  v53[4] = sub_1BE9BADD8;
  v54 = 0;
  objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E0C94F80], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend_setRequestOriginator_(v11, v12, 1);
  objc_msgSend_setResolvedConfiguration_(v11, v13, (uint64_t)v10);
  objc_msgSend_setDatabaseScope_(v11, v14, 2);
  v15 = [CKDDatabaseOperation alloc];
  objc_msgSend_container(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_initWithOperationInfo_container_(v15, v19, (uint64_t)v11, v18);

  objc_msgSend_systemRecordZone(MEMORY[0x1E0C95088], v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(v20, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_useZoneWidePCS(v32, v33, v34);

  if (v35)
    v36 = 8;
  else
    v36 = 0;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v37 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v45 = &stru_1E7838F48;
    if (v35)
      v45 = CFSTR("zoneish ");
    *(_DWORD *)buf = 138543618;
    v57 = v45;
    v58 = 2112;
    v59 = v26;
    _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "Fetching %{public}@PCS data for zone %@", buf, 0x16u);
  }
  objc_msgSend_pcsCache(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = sub_1BEAFE12C;
  v46[3] = &unk_1E78335F8;
  objc_copyWeak(&v52, &location);
  v41 = v20;
  v47 = v41;
  v48 = self;
  v42 = v26;
  v49 = v42;
  v51 = v53;
  v43 = v4;
  v50 = v43;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v40, v44, (uint64_t)v42, v41, v36, v46);

  objc_destroyWeak(&v52);
  _Block_object_dispose(v53, 8);

  objc_destroyWeak(&location);
}

- (CKDContainer)container
{
  return (CKDContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (CKDZonePCSData)zonePCSData
{
  return self->_zonePCSData;
}

- (void)setZonePCSData:(id)a3
{
  objc_storeStrong((id *)&self->_zonePCSData, a3);
}

- (OS_dispatch_queue)synchronizeQueue
{
  return self->_synchronizeQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizeQueue, 0);
  objc_storeStrong((id *)&self->_zonePCSData, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end
