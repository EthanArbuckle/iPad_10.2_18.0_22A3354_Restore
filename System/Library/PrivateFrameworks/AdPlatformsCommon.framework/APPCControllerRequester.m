@implementation APPCControllerRequester

- (void)proxyURLWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  id v15;

  v4 = a3;
  objc_msgSend_requestCoordinator(self, v5, v6, v7, v8, v9, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_proxyURLForRequester_withCompletionHandler_(v15, v11, (uint64_t)self, (uint64_t)v4, v12, v13, v14);

}

- (void)handleCompletionOfRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void (**v30)(_QWORD, _QWORD);
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend_requestCompletionBlockByRequestID(self, v18, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v24, v25, (uint64_t)v4, v26, v27, v28, v29);
  v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend_requestCompletionBlockByRequestID(self, v31, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v37, v38, (uint64_t)v4, v39, v40, v41, v42);

  objc_msgSend_lock(self, v43, v44, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v49, v50, v51, v52, v53, v54, v55);

  if (v30)
  {
    v30[2](v30, 0);
  }
  else
  {
    APLogForCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_lastError(self, v57, v58, v59, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138543362;
      v65 = v63;
      _os_log_impl(&dword_21A211000, v56, OS_LOG_TYPE_ERROR, "Request completion block was triggered due to %{public}@.", (uint8_t *)&v64, 0xCu);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCoordinator, 0);
  objc_storeStrong((id *)&self->_requesterID, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_requestCompletionBlockByRequestID, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong(&self->_newPromotedContentsDeliveryBlock, 0);
}

- (void)preWarm:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  id v15;

  v4 = a3;
  objc_msgSend_requestCoordinator(self, v5, v6, v7, v8, v9, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preWarm_forRequester_(v15, v11, (uint64_t)v4, (uint64_t)self, v12, v13, v14);

}

- (void)requestPromotedContentOfTypes:(id)a3 forContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  double v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend__preprocessHandler_(self, v11, (uint64_t)v10, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_initWeak(&location, self);
    objc_msgSend_requestCoordinator(self, v17, v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = sub_21A2180CC;
    v27[3] = &unk_24DC807F0;
    objc_copyWeak(&v29, &location);
    v28 = v16;
    objc_msgSend_requestPromotedContentOfTypes_forRequester_forContext_completionHandler_(v23, v24, (uint64_t)v8, (uint64_t)self, (uint64_t)v9, v25, v26, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

}

- (void)endRequests
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  id v49;

  objc_msgSend__invalidateAndfulfillAllRequestsWithError_(self, a2, 0, v2, v3, v4, v5);
  objc_msgSend_lock(self, v7, v8, v9, v10, v11, v12);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v49, v13, v14, v15, v16, v17, v18);
  objc_msgSend_setInvalid_(self, v19, 1, v20, v21, v22, v23);
  objc_msgSend_unlock(v49, v24, v25, v26, v27, v28, v29);
  objc_msgSend_requestCoordinator(self, v30, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requesterID(self, v37, v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishedWithRequestsForID_(v36, v44, (uint64_t)v43, v45, v46, v47, v48);

}

- (APControllerRequesterCoordinator)requestCoordinator
{
  return self->_requestCoordinator;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (id)_preprocessHandler:(id)a3
{
  void (**v4)(id, void *);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  NSObject *v30;
  uint64_t v31;
  const char *v32;
  double v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  double v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  double v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  uint8_t v80[8];
  _QWORD v81[3];
  _QWORD v82[4];

  v82[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend_lock(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14, v15, v16, v17);

  if (objc_msgSend_invalid(self, v18, v19, v20, v21, v22, v23))
  {
    APLogForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_21A211000, v30, OS_LOG_TYPE_ERROR, "Invalid requester cannot request promoted content.", v80, 2u);
    }

    v31 = *MEMORY[0x24BDD0FD8];
    v81[0] = *MEMORY[0x24BDD0FC8];
    v81[1] = v31;
    v82[0] = CFSTR("PCController requester was invalidated.");
    v82[1] = CFSTR("The user asked to invalidate the requester.");
    v81[2] = *MEMORY[0x24BDD0FF0];
    v82[2] = CFSTR("Create a new PCController requester and try again.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)v82, (uint64_t)v81, 3, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v36, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), 5003, (uint64_t)v35, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v39);

    objc_msgSend_lock(self, v40, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v46, v47, v48, v49, v50, v51, v52);

    return 0;
  }
  else
  {
    objc_msgSend_UUID(MEMORY[0x24BDD1880], v24, v25, v26, v27, v28, v29);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestCompletionBlockByRequestID(self, v55, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)MEMORY[0x22073D7EC](v4);

    objc_msgSend_setObject_forKey_(v61, v63, (uint64_t)v62, (uint64_t)v54, v64, v65, v66);
    objc_msgSend_lock(self, v67, v68, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v73, v74, v75, v76, v77, v78, v79);

    return v54;
  }
}

- (void)_invalidateAndfulfillAllRequestsWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  id v63;
  const char *v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  double v72;
  double v73;
  NSObject *v74;
  uint8_t v75[16];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend_setLastError_(self, v18, (uint64_t)v4, v19, v20, v21, v22);
  objc_msgSend_requestCompletionBlockByRequestID(self, v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v29, v30, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_requestCompletionBlockByRequestID(self, v37, v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v43, v44, v45, v46, v47, v48, v49);

  objc_msgSend_lock(self, v50, v51, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v56, v57, v58, v59, v60, v61, v62);

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v63 = v36;
  v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v76, (uint64_t)v80, 16, v65, v66);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v77;
    do
    {
      v70 = 0;
      do
      {
        if (*(_QWORD *)v77 != v69)
          objc_enumerationMutation(v63);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v70++) + 16))();
      }
      while (v68 != v70);
      v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v71, (uint64_t)&v76, (uint64_t)v80, 16, v72, v73);
    }
    while (v68);
  }

  APLogForCategory();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl(&dword_21A211000, v74, OS_LOG_TYPE_INFO, "XPC connection is closed.", v75, 2u);
  }

}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (NSMutableDictionary)requestCompletionBlockByRequestID
{
  return self->_requestCompletionBlockByRequestID;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (NSUUID)requesterID
{
  return self->_requesterID;
}

- (void)contentResponses:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  char v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  void (**v46)(_QWORD, _QWORD);
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  NSObject *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  int v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend_newPromotedContentsDeliveryBlock(self, v18, v19, v20, v21, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v31 = (void *)v24;
    v32 = objc_msgSend_invalid(self, v25, v26, v27, v28, v29, v30);

    if ((v32 & 1) == 0)
    {
      APLogForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v69 = 134217984;
        v70 = objc_msgSend_count(v4, v34, v35, v36, v37, v38, v39);
        _os_log_impl(&dword_21A211000, v33, OS_LOG_TYPE_INFO, "Received promoted contents: %lu", (uint8_t *)&v69, 0xCu);
      }

      objc_msgSend_newPromotedContentsDeliveryBlock(self, v40, v41, v42, v43, v44, v45);
      v46 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v46)[2](v46, v4);

    }
  }
  objc_msgSend_newPromotedContentsDeliveryBlock(self, v25, v26, v27, v28, v29, v30);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
    APLogForCategory();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v69) = 0;
      _os_log_impl(&dword_21A211000, v54, OS_LOG_TYPE_ERROR, "Promoted contents are discarded due to missing delivery block.", (uint8_t *)&v69, 2u);
    }

  }
  if (objc_msgSend_invalid(self, v48, v49, v50, v51, v52, v53))
  {
    APLogForCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v69) = 0;
      _os_log_impl(&dword_21A211000, v61, OS_LOG_TYPE_ERROR, "Promoted contents are discarded because the requester is invalid.", (uint8_t *)&v69, 2u);
    }

  }
  objc_msgSend_lock(self, v55, v56, v57, v58, v59, v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v62, v63, v64, v65, v66, v67, v68);

}

- (BOOL)invalid
{
  return self->_invalid;
}

- (id)newPromotedContentsDeliveryBlock
{
  return self->_newPromotedContentsDeliveryBlock;
}

- (APPCControllerRequester)initWithDeliveryBlock:(id)a3
{
  id v4;
  APPCControllerRequester *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  APPCControllerRequester *v12;
  uint64_t v13;
  NSMutableDictionary *requestCompletionBlockByRequestID;
  uint64_t v15;
  id newPromotedContentsDeliveryBlock;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  APUnfairLock *lock;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  NSUUID *requesterID;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  APControllerRequesterCoordinator *requestCoordinator;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)APPCControllerRequester;
  v5 = -[APPCControllerRequester init](&v42, sel_init);
  v12 = v5;
  if (v5)
  {
    v5->_invalid = 0;
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v6, v7, v8, v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    requestCompletionBlockByRequestID = v12->_requestCompletionBlockByRequestID;
    v12->_requestCompletionBlockByRequestID = (NSMutableDictionary *)v13;

    v15 = MEMORY[0x22073D7EC](v4);
    newPromotedContentsDeliveryBlock = v12->_newPromotedContentsDeliveryBlock;
    v12->_newPromotedContentsDeliveryBlock = (id)v15;

    v17 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v23 = objc_msgSend_initWithOptions_(v17, v18, 1, v19, v20, v21, v22);
    lock = v12->_lock;
    v12->_lock = (APUnfairLock *)v23;

    objc_msgSend_UUID(MEMORY[0x24BDD1880], v25, v26, v27, v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    requesterID = v12->_requesterID;
    v12->_requesterID = (NSUUID *)v31;

    objc_msgSend_requestCoordinator(APControllerRequesterCoordinator, v33, v34, v35, v36, v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    requestCoordinator = v12->_requestCoordinator;
    v12->_requestCoordinator = (APControllerRequesterCoordinator *)v39;

  }
  return v12;
}

- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 responseHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  double v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend__preprocessHandler_(self, v16, (uint64_t)v15, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_initWeak(&location, self);
    objc_msgSend_requestCoordinator(self, v22, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = sub_21A21B2D8;
    v32[3] = &unk_24DC80818;
    v34 = v14;
    objc_copyWeak(&v35, &location);
    v33 = v21;
    objc_msgSend_sendAndRankContent_forContext_placement_completionHandler_(v28, v29, (uint64_t)v12, (uint64_t)v13, a5, v30, v31, v32);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  else if (v14)
  {
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }

}

- (void)connectionSevered
{
  double v2;
  double v3;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDD0FD8];
  v16[0] = *MEMORY[0x24BDD0FC8];
  v16[1] = v5;
  v17[0] = CFSTR("PCController requester was invalidated.");
  v17[1] = CFSTR("The user asked to invalidate the requester.");
  v16[2] = *MEMORY[0x24BDD0FF0];
  v17[2] = CFSTR("Create a new PCController requester and try again.");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v17, (uint64_t)v16, 3, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), 5003, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__invalidateAndfulfillAllRequestsWithError_(self, v11, (uint64_t)v10, v12, v13, v14, v15);

}

- (id)proxyURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;

  objc_msgSend_requestCoordinator(self, a2, v2, v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_proxyURLForRequester_(v8, v9, (uint64_t)self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setNewPromotedContentsDeliveryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setRequestCompletionBlockByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestCompletionBlockByRequestID, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void)setRequesterID:(id)a3
{
  objc_storeStrong((id *)&self->_requesterID, a3);
}

- (void)setRequestCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_requestCoordinator, a3);
}

@end
