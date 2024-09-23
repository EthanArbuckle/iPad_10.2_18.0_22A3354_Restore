@implementation APControllerRequesterCoordinator

- (void)proxyURLForRequester:(id)a3 withCompletionHandler:(id)a4
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
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  id v30;

  v6 = a4;
  v7 = a3;
  objc_msgSend_requesterID(v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addDelegate_withID_(self, v15, (uint64_t)v7, (uint64_t)v14, v16, v17, v18);

  objc_msgSend_remoteObjectProxy(self, v19, v20, v21, v22, v23, v24);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_proxyURLWithCompletionHandler_(v30, v25, (uint64_t)v6, v26, v27, v28, v29);

}

- (APControllerRequesterCoordinator)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  APControllerRequesterCoordinator *v6;
  double v7;
  double v8;
  uint64_t v9;
  NSMutableDictionary *requestDelegates;
  APUnfairRecursiveLock *v11;
  APUnfairRecursiveLock *lock;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)APControllerRequesterCoordinator;
  v6 = -[APXPCActionRequester init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v2, v3, v4, v5, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    requestDelegates = v6->_requestDelegates;
    v6->_requestDelegates = (NSMutableDictionary *)v9;

    v11 = (APUnfairRecursiveLock *)objc_alloc_init(MEMORY[0x24BDFD4C8]);
    lock = v6->_lock;
    v6->_lock = v11;

  }
  return v6;
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
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  int v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_lock(self, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v14, v15, v16, v17, v18, v19, v20);
  objc_msgSend_requestDelegates(self, v21, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v27, v28, (uint64_t)v7, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_unlock(v14, v34, v35, v36, v37, v38, v39);
  if (v33)
  {
    objc_msgSend_contentResponses_(v33, v40, (uint64_t)v6, v41, v42, v43, v44);
  }
  else
  {
    APLogForCategory();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138412546;
      v49 = v47;
      v50 = 2112;
      v51 = v7;
      _os_log_impl(&dword_21A211000, v45, OS_LOG_TYPE_DEFAULT, "[%@] The requester for %@ is no longer stored. Dropping response.", (uint8_t *)&v48, 0x16u);

    }
  }

}

- (void)preWarm:(id)a3 forRequester:(id)a4
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
  double v27;
  double v28;
  id v29;

  v6 = a4;
  v7 = a3;
  objc_msgSend_requesterID(v6, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addDelegate_withID_(self, v15, (uint64_t)v6, (uint64_t)v14, v16, v17, v18);

  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v19, (uint64_t)&unk_24DC807C8, v20, v21, v22, v23);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preWarm_(v29, v24, (uint64_t)v7, v25, v26, v27, v28);

}

- (void)requestPromotedContentOfTypes:(id)a3 forRequester:(id)a4 forContext:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  const char *v21;
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
  NSObject *v32;
  NSObject *v33;
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
  void *v54;
  const char *v55;
  double v56;
  double v57;
  int v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend_requesterID(v10, v14, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addDelegate_withID_(self, v21, (uint64_t)v10, (uint64_t)v20, v22, v23, v24);

  objc_msgSend_activeClientInfo(MEMORY[0x24BDFD480], v25, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    APLogForCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v58) = 0;
      _os_log_impl(&dword_21A211000, v32, OS_LOG_TYPE_DEFAULT, "No client info was available for an ad request.", (uint8_t *)&v58, 2u);
    }

  }
  APLogForCategory();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_identifier(v11, v34, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 138543362;
    v59 = v40;
    _os_log_impl(&dword_21A211000, v33, OS_LOG_TYPE_INFO, "Requesting ad from promotedcontentd for context %{public}@", (uint8_t *)&v58, 0xCu);

  }
  objc_msgSend_remoteObjectProxy(self, v41, v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requesterID(v10, v48, v49, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestPromotedContentOfTypes_forRequester_forContext_withClientInfo_deliverEntireBatch_completionHandler_(v47, v55, (uint64_t)v13, (uint64_t)v54, (uint64_t)v11, v56, v57, v31, 0, v12);

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
  objc_msgSend_requestDelegates(self, v29, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v35, v36, (uint64_t)v4, v37, v38, v39, v40);

  objc_msgSend_requestDelegates(self, v41, v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_count(v47, v48, v49, v50, v51, v52, v53);

  objc_msgSend_unlock(v67, v55, v56, v57, v58, v59, v60);
  if (!v54)
    objc_msgSend_finished(self, v61, v62, v63, v64, v65, v66);

}

- (void)_addDelegate:(id)a3 withID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
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
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  double v43;
  id v44;

  v44 = a3;
  v6 = a4;
  objc_msgSend_lock(self, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v13, v14, v15, v16, v17, v18, v19);
  objc_msgSend_requestDelegates(self, v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v26, v27, (uint64_t)v6, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    objc_msgSend_requestDelegates(self, v33, v34, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v39, v40, (uint64_t)v44, (uint64_t)v6, v41, v42, v43);

  }
  objc_msgSend_unlock(v13, v33, v34, v35, v36, v37, v38);

}

- (NSMutableDictionary)requestDelegates
{
  return self->_requestDelegates;
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
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

+ (id)requestCoordinator
{
  if (qword_253D8AFC0 != -1)
    dispatch_once(&qword_253D8AFC0, &unk_24DC80600);
  return (id)qword_253D8AFC8;
}

- (id)exportedInterface
{
  return &unk_2550D3968;
}

+ (id)machService
{
  return CFSTR("com.apple.ap.promotedcontent.pcinterface");
}

- (id)remoteObjectInterface
{
  return &unk_2550D5BC0;
}

+ (BOOL)canShareConnection
{
  return 0;
}

- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  const char *v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend_remoteObjectProxy(self, v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_21A21AC60;
  v24[3] = &unk_24DC80740;
  v25 = v10;
  v20 = v10;
  objc_msgSend_sendAndRankContent_forContext_placement_completionHandler_(v19, v21, (uint64_t)v12, (uint64_t)v11, a5, v22, v23, v24);

}

- (id)proxyURLForRequester:(id)a3
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
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  id v25;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  objc_msgSend_requesterID(v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addDelegate_withID_(self, v12, (uint64_t)v4, (uint64_t)v11, v13, v14, v15);

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_21A21AD8C;
  v32 = sub_21A21AD9C;
  v33 = 0;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)&unk_24DC80780, v17, v18, COERCE_DOUBLE(0x3032000000), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_21A21ADF0;
  v27[3] = &unk_24DC807A8;
  v27[4] = &v28;
  objc_msgSend_proxyURLWithCompletionHandler_(v20, v21, (uint64_t)v27, v22, v23, COERCE_DOUBLE(3221225472), v24);
  v25 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v25;
}

- (void)connectionInterrupted
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_lock(self, a2, v2, v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11, v12, v13, v14);
  objc_msgSend_requestDelegates(self, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend_copy(v21, v22, v23, v24, v25, v26, v27);

  objc_msgSend_requestDelegates(self, v29, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v35, v36, v37, v38, v39, v40, v41);

  objc_msgSend_unlock(v8, v42, v43, v44, v45, v46, v47);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v48 = v28;
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v68, (uint64_t)v72, 16, v50, v51);
  if (v52)
  {
    v58 = v52;
    v59 = *(_QWORD *)v69;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v69 != v59)
          objc_enumerationMutation(v48);
        objc_msgSend_objectForKey_(v48, v53, *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v60), v54, v55, v56, v57, (_QWORD)v68);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_connectionSevered(v61, v62, v63, v64, v65, v66, v67);

        ++v60;
      }
      while (v58 != v60);
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v53, (uint64_t)&v68, (uint64_t)v72, 16, v56, v57);
    }
    while (v58);
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
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  id v41;
  const char *v42;
  double v43;
  double v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_lock(self, a2, v2, v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11, v12, v13, v14);
  objc_msgSend_requestDelegates(self, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestDelegates(self, v22, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v28, v29, v30, v31, v32, v33, v34);

  objc_msgSend_unlock(v8, v35, v36, v37, v38, v39, v40);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v41 = v21;
  v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v61, (uint64_t)v65, 16, v43, v44);
  if (v45)
  {
    v51 = v45;
    v52 = *(_QWORD *)v62;
    do
    {
      v53 = 0;
      do
      {
        if (*(_QWORD *)v62 != v52)
          objc_enumerationMutation(v41);
        objc_msgSend_objectForKey_(v41, v46, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v53), v47, v48, v49, v50, (_QWORD)v61);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_connectionSevered(v54, v55, v56, v57, v58, v59, v60);

        ++v53;
      }
      while (v51 != v53);
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v46, (uint64_t)&v61, (uint64_t)v65, 16, v49, v50);
    }
    while (v51);
  }

}

- (void)setRequestDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_requestDelegates, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_requestDelegates, 0);
}

@end
