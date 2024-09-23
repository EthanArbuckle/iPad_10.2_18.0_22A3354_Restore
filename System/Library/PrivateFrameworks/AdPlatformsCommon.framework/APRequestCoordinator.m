@implementation APRequestCoordinator

- (void)extendCollectionClassesForExportedInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  double v13;
  double v14;
  id v15;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend_setWithObjects_(v3, v7, v5, v8, v9, v10, v11, v6, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v12, (uint64_t)v15, (uint64_t)sel_contentResponses_requester_, 0, v13, v14, 0);

}

- (void)extendCollectionClassesForRemoteInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  double v13;
  double v14;
  id v15;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend_setWithObjects_(v3, v7, v5, v8, v9, v10, v11, v6, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v12, (uint64_t)v15, (uint64_t)sel_sendAndRankContent_forContext_placement_completionHandler_, 0, v13, v14, 1);

}

- (APRequestCoordinator)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  APRequestCoordinator *v6;
  double v7;
  double v8;
  uint64_t v9;
  NSMutableDictionary *managerToRetryBoxMap;
  APUnfairLock *v11;
  APUnfairLock *lock;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APRequestCoordinator;
  v6 = -[APXPCActionRequester init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v2, v3, v4, v5, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    managerToRetryBoxMap = v6->_managerToRetryBoxMap;
    v6->_managerToRetryBoxMap = (NSMutableDictionary *)v9;

    v11 = (APUnfairLock *)objc_alloc_init(MEMORY[0x24BDFD4C0]);
    lock = v6->_lock;
    v6->_lock = v11;

  }
  return v6;
}

- (void)requestPromotedContentWithContents:(id)a3 forRequester:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  APCoordinatedAdRequestBox *v11;
  const char *v12;
  double v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  NSObject *v33;
  uint8_t v34[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [APCoordinatedAdRequestBox alloc];
  v15 = (void *)objc_msgSend_initWithDelegate_contents_handler_(v11, v12, (uint64_t)v9, (uint64_t)v10, (uint64_t)v8, v13, v14);

  objc_msgSend__addBox_(self, v16, (uint64_t)v15, v17, v18, v19, v20);
  objc_msgSend_clientInfo(v10, v21, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    APLogForCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_21A211000, v33, OS_LOG_TYPE_DEFAULT, "No client info was available for an ad request.", v34, 2u);
    }

  }
  objc_msgSend_requestPromotedContentWithBox_(self, v28, (uint64_t)v15, v29, v30, v31, v32);

}

- (void)contentResponses:(id)a3 requester:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  NSObject *v59;
  objc_class *v60;
  void *v61;
  int v62;
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_lock(self, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v14, v15, v16, v17, v18, v19, v20);
  objc_msgSend_managerToRetryBoxMap(self, v21, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v27, v28, (uint64_t)v7, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_firstObject(v33, v34, v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestDelegate(v40, v41, v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_unlock(v14, v48, v49, v50, v51, v52, v53);
  if (v47)
  {
    objc_msgSend_contentResponses_(v47, v54, (uint64_t)v6, v55, v56, v57, v58);
  }
  else
  {
    APLogForCategory();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 138478083;
      v63 = v61;
      v64 = 2114;
      v65 = v7;
      _os_log_impl(&dword_21A211000, v59, OS_LOG_TYPE_DEFAULT, "[%{private}@] The requester for %{public}@ is no longer stored. Dropping response.", (uint8_t *)&v62, 0x16u);

    }
  }

}

- (void)requestPromotedContentWithBox:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
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
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  uint64_t v70;
  id v71;
  const char *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[4];
  id v79;
  _QWORD *v80;
  id v81;
  _QWORD v82[4];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x2020000000;
  v82[3] = 0;
  objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, COERCE_DOUBLE(0x2020000000), v9);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestContents(v4, v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentTypes(v16, v17, v18, v19, v20, v21, v22);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requesterID(v4, v23, v24, v25, v26, v27, v28);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestContents(v4, v29, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apContext(v35, v36, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestContents(v4, v43, v44, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientInfo(v49, v50, v51, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestContents(v4, v57, v58, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_deliverEntireBatch(v63, v64, v65, v66, v67, v68, v69);
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = sub_21A213404;
  v78[3] = &unk_24DC808F8;
  v80 = v82;
  objc_copyWeak(&v81, &location);
  v71 = v4;
  v79 = v71;
  objc_msgSend_requestPromotedContentOfTypes_forRequester_forContext_withClientInfo_deliverEntireBatch_completionHandler_(v77, v72, (uint64_t)v76, (uint64_t)v75, (uint64_t)v42, v73, v74, v56, v70, v78);

  objc_destroyWeak(&v81);
  _Block_object_dispose(v82, 8);
  objc_destroyWeak(&location);

}

- (void)_addBox:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  id v73;

  v73 = a3;
  objc_msgSend_lock(self, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend_managerToRetryBoxMap(self, v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requesterID(v73, v24, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v23, v31, (uint64_t)v30, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    if ((objc_msgSend_containsObject_(v36, v37, (uint64_t)v73, v38, v39, v40, v41) & 1) == 0)
      objc_msgSend_addObject_(v36, v42, (uint64_t)v73, v44, v45, v46, v47);
  }
  else
  {
    objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCEB8], v37, (uint64_t)v73, v38, v39, v40, v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_managerToRetryBoxMap(self, v42, v43, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requesterID(v73, v49, v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v48, v56, (uint64_t)v36, (uint64_t)v55, v57, v58, v59);

  objc_msgSend_lock(self, v60, v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v66, v67, v68, v69, v70, v71, v72);

}

- (void)_removeBox:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  const char *v31;
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
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  id v74;

  v74 = a3;
  objc_msgSend_lock(self, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend_managerToRetryBoxMap(self, v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requesterID(v74, v24, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v23, v31, (uint64_t)v30, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_removeObject_(v36, v37, (uint64_t)v74, v39, v40, v41, v42);
    objc_msgSend_managerToRetryBoxMap(self, v43, v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requesterID(v74, v50, v51, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v49, v57, (uint64_t)v36, (uint64_t)v56, v58, v59, v60);

  }
  else
  {
    objc_msgSend_diagnosticReportPayload(v74, v37, v38, v39, v40, v41, v42);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    CreateDiagnosticReport();
  }

  objc_msgSend_lock(self, v61, v62, v63, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v67, v68, v69, v70, v71, v72, v73);

}

- (void)finishedWithRequestsForID:(id)a3
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
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
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
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  id v67;

  v4 = a3;
  objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishedWithRequestsForRequester_(v11, v12, (uint64_t)v4, v13, v14, v15, v16);

  objc_msgSend_lock(self, v17, v18, v19, v20, v21, v22);
  v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v67, v23, v24, v25, v26, v27, v28);
  objc_msgSend_managerToRetryBoxMap(self, v29, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v35, v36, (uint64_t)v4, v37, v38, v39, v40);

  objc_msgSend_managerToRetryBoxMap(self, v41, v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_count(v47, v48, v49, v50, v51, v52, v53);

  objc_msgSend_unlock(v67, v55, v56, v57, v58, v59, v60);
  if (!v54)
    objc_msgSend_finished(self, v61, v62, v63, v64, v65, v66);

}

- (NSMutableDictionary)managerToRetryBoxMap
{
  return self->_managerToRetryBoxMap;
}

- (void)beginSessionForID:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  id v49;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend_array(v4, v6, v7, v8, v9, v10, v11);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v18, v19, v20, v21, v22, v23, v24);

  objc_msgSend_managerToRetryBoxMap(self, v25, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v31, v32, (uint64_t)v49, (uint64_t)v5, v33, v34, v35);

  objc_msgSend_lock(self, v36, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v42, v43, v44, v45, v46, v47, v48);

}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (id)exportedInterface
{
  return &unk_2550D3968;
}

- (id)remoteObjectInterface
{
  return &unk_2550D5BC0;
}

+ (id)sharedCoordinator
{
  if (qword_253D8AEB0 != -1)
    dispatch_once(&qword_253D8AEB0, &unk_24DC80640);
  return (id)qword_253D8AEB8;
}

+ (id)machService
{
  return CFSTR("com.apple.ap.promotedcontent.pcinterface");
}

+ (BOOL)canShareConnection
{
  return 0;
}

- (void)sendAndRankContent:(id)a3 forRequester:(id)a4 forContext:(id)a5 placement:(unint64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  APCoordinatedRankRequestBox *v14;
  const char *v15;
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
  double v26;
  double v27;
  id v28;

  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = [APCoordinatedRankRequestBox alloc];
  v28 = (id)objc_msgSend_initWithDelegate_contents_placement_handler_(v14, v15, (uint64_t)v12, (uint64_t)v13, a6, v16, v17, v11);

  objc_msgSend__addBox_(self, v18, (uint64_t)v28, v19, v20, v21, v22);
  objc_msgSend_requestRankingWithBox_(self, v23, (uint64_t)v28, v24, v25, v26, v27);

}

- (id)proxyURLForRequester:(id)a3
{
  id v4;
  APCoordinatedRetryBox *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  id v35;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v4 = a3;
  v5 = [APCoordinatedRetryBox alloc];
  v10 = (void *)objc_msgSend_initWithType_delegate_(v5, v6, -1, (uint64_t)v4, v7, v8, v9);
  objc_msgSend_setCanRetry_(v10, v11, 0, v12, v13, v14, v15);
  objc_msgSend__addBox_(self, v16, (uint64_t)v10, v17, v18, v19, v20);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_21A21CF04;
  v42 = sub_21A21CF14;
  v43 = 0;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v21, (uint64_t)&unk_24DC80680, v22, v23, COERCE_DOUBLE(0x3032000000), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = sub_21A21CF68;
  v37[3] = &unk_24DC807A8;
  v37[4] = &v38;
  objc_msgSend_proxyURLWithCompletionHandler_(v25, v26, (uint64_t)v37, v27, v28, COERCE_DOUBLE(3221225472), v29);
  objc_msgSend__removeBox_(self, v30, (uint64_t)v10, v31, v32, v33, v34);
  v35 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  return v35;
}

- (void)proxyURLForRequester:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  APCoordinatedProxyUrlRequestBox *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  id v23;

  v6 = a4;
  v7 = a3;
  v8 = [APCoordinatedProxyUrlRequestBox alloc];
  v23 = (id)objc_msgSend_initWithDelegate_handler_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10, v11, v12);

  objc_msgSend__addBox_(self, v13, (uint64_t)v23, v14, v15, v16, v17);
  objc_msgSend_requestProxyWithBox_(self, v18, (uint64_t)v23, v19, v20, v21, v22);

}

- (void)preWarm:(id)a3 forRequester:(id)a4
{
  id v6;
  id v7;
  APCoordinatedRetryBox *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
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
  double v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  id v39;

  v6 = a4;
  v7 = a3;
  v8 = [APCoordinatedRetryBox alloc];
  v39 = (id)objc_msgSend_initWithType_delegate_(v8, v9, -1, (uint64_t)v6, v10, v11, v12);

  objc_msgSend_setCanRetry_(v39, v13, 0, v14, v15, v16, v17);
  objc_msgSend__addBox_(self, v18, (uint64_t)v39, v19, v20, v21, v22);
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v23, (uint64_t)&unk_24DC808D0, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preWarm_(v28, v29, (uint64_t)v7, v30, v31, v32, v33);

  objc_msgSend__removeBox_(self, v34, (uint64_t)v39, v35, v36, v37, v38);
}

- (void)requestRankingWithBox:(id)a3
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  id v33;
  const char *v34;
  double v35;
  double v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentDatas(v4, v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_context(v4, v19, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_placement(v4, v26, v27, v28, v29, v30, v31);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = sub_21A21D230;
  v37[3] = &unk_24DC80920;
  objc_copyWeak(&v39, &location);
  v33 = v4;
  v38 = v33;
  objc_msgSend_sendAndRankContent_forContext_placement_completionHandler_(v11, v34, (uint64_t)v18, (uint64_t)v25, v32, v35, v36, v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

- (void)requestProxyWithBox:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_21A21D39C;
  v18[3] = &unk_24DC80948;
  objc_copyWeak(&v20, &location);
  v12 = v4;
  v19 = v12;
  objc_msgSend_proxyURLWithCompletionHandler_(v11, v13, (uint64_t)v18, v14, v15, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)connectionInterrupted
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
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
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  const char *v50;
  double v51;
  double v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  double v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  int v78;
  NSObject *v79;
  NSObject *v80;
  objc_class *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  void *v103;
  objc_class *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  double v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  double v125;
  uint64_t v126;
  APRequestCoordinator *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  id obj;
  uint64_t v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t buf[4];
  void *v145;
  __int16 v146;
  void *v147;
  __int16 v148;
  uint64_t v149;
  __int16 v150;
  void *v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A211000, v3, OS_LOG_TYPE_ERROR, "XPC Connection interrupted", buf, 2u);
  }

  objc_msgSend_lock(self, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13, v14, v15, v16);
  objc_msgSend_managerToRetryBoxMap(self, v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_copy(v23, v24, v25, v26, v27, v28, v29);

  objc_msgSend_managerToRetryBoxMap(self, v31, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v37, v38, v39, v40, v41, v42, v43);

  v130 = v10;
  objc_msgSend_unlock(v10, v44, v45, v46, v47, v48, v49);
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  obj = v30;
  v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v140, (uint64_t)v153, 16, v51, v52);
  if (v132)
  {
    v131 = *(_QWORD *)v141;
    v57 = 138478595;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v141 != v131)
          objc_enumerationMutation(obj);
        v134 = v58;
        objc_msgSend_objectForKey_(obj, v53, *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v58), v54, v55, *(double *)&v57, v56);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = 0u;
        v137 = 0u;
        v138 = 0u;
        v139 = 0u;
        v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v136, (uint64_t)v152, 16, 0.0, v61);
        if (v62)
        {
          v69 = v62;
          v70 = *(_QWORD *)v137;
          do
          {
            v71 = 0;
            v135 = v69;
            do
            {
              if (*(_QWORD *)v137 != v70)
                objc_enumerationMutation(v59);
              v72 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v71);
              if (objc_msgSend_requestType(v72, v63, v64, v65, v66, v67, v68) == -1)
                goto LABEL_21;
              v78 = objc_msgSend_attemptRetryMessageForBox_(self, v73, (uint64_t)v72, v74, v75, v76, v77);
              APLogForCategory();
              v79 = objc_claimAutoreleasedReturnValue();
              v80 = v79;
              if (!v78)
              {
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                {
                  v104 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v104);
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_requestID(v72, v106, v107, v108, v109, v110, v111);
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  v119 = objc_msgSend_requestType(v72, v113, v114, v115, v116, v117, v118);
                  objc_msgSend_requesterID(v72, v120, v121, v122, v123, v124, v125);
                  v126 = v70;
                  v127 = self;
                  v128 = v59;
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138478595;
                  v145 = v105;
                  v146 = 2114;
                  v147 = v112;
                  v148 = 2050;
                  v149 = v119;
                  v150 = 2114;
                  v151 = v129;
                  _os_log_impl(&dword_21A211000, v80, OS_LOG_TYPE_ERROR, "[%{private}@] Unable to retry request %{public}@ of type %{public}ld for requester %{public}@", buf, 0x2Au);

                  v59 = v128;
                  self = v127;
                  v70 = v126;
                  v69 = v135;

                }
LABEL_21:
                objc_msgSend_connectionSeveredForBox_(self, v73, (uint64_t)v72, v74, v75, v76, v77);
                goto LABEL_22;
              }
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                v81 = (objc_class *)objc_opt_class();
                NSStringFromClass(v81);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_requestID(v72, v83, v84, v85, v86, v87, v88);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = objc_msgSend_requestType(v72, v90, v91, v92, v93, v94, v95);
                objc_msgSend_requesterID(v72, v97, v98, v99, v100, v101, v102);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138478595;
                v145 = v82;
                v146 = 2114;
                v147 = v89;
                v148 = 2050;
                v149 = v96;
                v150 = 2114;
                v151 = v103;
                _os_log_impl(&dword_21A211000, v80, OS_LOG_TYPE_DEFAULT, "[%{private}@] Request %{public}@ of type %{public}ld is attempting to retry for requester %{public}@", buf, 0x2Au);

              }
LABEL_22:
              ++v71;
            }
            while (v69 != v71);
            v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v63, (uint64_t)&v136, (uint64_t)v152, 16, v67, v68);
          }
          while (v69);
        }

        v58 = v134 + 1;
      }
      while (v134 + 1 != v132);
      v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v140, (uint64_t)v153, 16, *(double *)&v57, v56);
    }
    while (v132);
  }

}

- (void)connectionInvalidated
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
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  id v48;
  const char *v49;
  double v50;
  double v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  double v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_lock(self, a2, v2, v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11, v12, v13, v14);
  objc_msgSend_managerToRetryBoxMap(self, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend_copy(v21, v22, v23, v24, v25, v26, v27);

  objc_msgSend_managerToRetryBoxMap(self, v29, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v35, v36, v37, v38, v39, v40, v41);

  objc_msgSend_unlock(v8, v42, v43, v44, v45, v46, v47);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v48 = v28;
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v77, (uint64_t)v82, 16, v50, v51);
  if (v52)
  {
    v58 = v52;
    v59 = *(_QWORD *)v78;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v78 != v59)
          objc_enumerationMutation(v48);
        objc_msgSend_objectForKey_(v48, v53, *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v60), v54, v55, v56, v57);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v73, (uint64_t)v81, 16, 0.0, v63);
        if (v64)
        {
          v70 = v64;
          v71 = *(_QWORD *)v74;
          do
          {
            v72 = 0;
            do
            {
              if (*(_QWORD *)v74 != v71)
                objc_enumerationMutation(v61);
              objc_msgSend_connectionSeveredForBox_(self, v65, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v72++), v66, v67, v68, v69);
            }
            while (v70 != v72);
            v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v65, (uint64_t)&v73, (uint64_t)v81, 16, v68, v69);
          }
          while (v70);
        }

        ++v60;
      }
      while (v60 != v58);
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v53, (uint64_t)&v77, (uint64_t)v82, 16, v56, v57);
    }
    while (v58);
  }

}

- (BOOL)attemptRetryMessageForBox:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;

  v4 = a3;
  if (objc_msgSend_canRetry(v4, v5, v6, v7, v8, v9, v10))
  {
    objc_msgSend_requestDelegate(v4, v11, v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend_setCanRetry_(v4, v18, 0, v19, v20, v21, v22);
      objc_msgSend__addBox_(self, v23, (uint64_t)v4, v24, v25, v26, v27);
      v34 = objc_msgSend_requestType(v4, v28, v29, v30, v31, v32, v33);
      if (v34 == 2)
      {
        objc_msgSend_requestProxyWithBox_(self, v35, (uint64_t)v4, v36, v37, v38, v39);
        goto LABEL_10;
      }
      if (v34 == 1)
      {
        objc_msgSend_requestRankingWithBox_(self, v35, (uint64_t)v4, v36, v37, v38, v39);
        goto LABEL_10;
      }
      LOBYTE(v17) = 0;
      if (!v34)
      {
        objc_msgSend_requestPromotedContentWithBox_(self, v35, (uint64_t)v4, v36, v37, v38, v39);
LABEL_10:
        LOBYTE(v17) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return (char)v17;
}

- (void)connectionSeveredForBox:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  double v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  void (**v39)(void);
  _QWORD v40[3];
  _QWORD v41[4];

  v41[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDD0FD8];
  v40[0] = *MEMORY[0x24BDD0FC8];
  v40[1] = v4;
  v41[0] = CFSTR("APRequestCoordinator was invalidated.");
  v41[1] = CFSTR("The user asked to invalidate the requester, or connection was interrupted.");
  v40[2] = *MEMORY[0x24BDD0FF0];
  v41[2] = CFSTR("Retry failed request again.");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v5, (uint64_t)v41, (uint64_t)v40, 3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v9, (uint64_t)CFSTR("APPCControllerRequesterErrorDomain"), 5003, (uint64_t)v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestDelegate(v3, v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_requestDelegate(v3, v20, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connectionSeveredWithError_(v26, v27, (uint64_t)v12, v28, v29, v30, v31);

  }
  v32 = objc_msgSend_requestType(v3, v20, v21, v22, v23, v24, v25);
  if (v32 == 2)
  {
    if (v3)
    {
LABEL_9:
      objc_msgSend_completionHandler(v3, v33, v34, v35, v36, v37, v38);
      v39 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v39[2]();
LABEL_12:

    }
  }
  else if (v32 == 1)
  {
    if (v3)
    {
      objc_msgSend_completionHandler(v3, v33, v34, v35, v36, v37, v38);
      v39 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void), _QWORD, void *))v39[2])(v39, 0, v12);
      goto LABEL_12;
    }
  }
  else if (!v32 && v3)
  {
    goto LABEL_9;
  }

}

- (void)setManagerToRetryBoxMap:(id)a3
{
  objc_storeStrong((id *)&self->_managerToRetryBoxMap, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_managerToRetryBoxMap, 0);
}

@end
