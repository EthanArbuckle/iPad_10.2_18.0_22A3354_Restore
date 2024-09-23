@implementation BAAgentClientProxy

- (id)initWithApplicationIdentifier:(void *)a3 downloadManager:
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  id v9;
  SEL v10;
  const char *v11;
  objc_super v13;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BAAgentClientProxy;
    a1 = (id *)objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      objc_msgSend(v5, "_baassets_validUTI");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v5))
      {
        objc_setProperty_atomic(a1, v8, v5, 16);
        objc_storeWeak(a1 + 4, v6);
        v9 = objc_alloc_init(MEMORY[0x24BDD1648]);
        objc_setProperty_atomic(a1, v10, v9, 24);

        -[BAAgentClientProxy _setupConnection](a1, v11);
      }
      else
      {

        v7 = a1;
        a1 = 0;
      }

    }
  }

  return a1;
}

- (uint64_t)_setupConnection
{
  SEL v3;
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  SEL v8;
  SEL v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SEL v24;
  id WeakRetained;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  SEL v63;
  SEL v64;
  id v65;
  id v66;
  SEL v67;
  id v68;
  uint64_t v69;
  SEL v70;
  id v71;
  SEL v72;
  id v73;
  SEL v74;
  id v75;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  id location;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];
  _QWORD v94[2];
  _QWORD v95[2];
  uint64_t v96;
  _QWORD v97[6];

  v97[4] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_msgSend(objc_getProperty(a1, a2, 24, 1), "lock");
  if (objc_getProperty(a1, v3, 8, 1))
  {
    v5 = 1;
    objc_msgSend(objc_getProperty(a1, v4, 24, 1), "unlock");
    return v5;
  }
  v6 = objc_alloc(MEMORY[0x24BDD1988]);
  v7 = (void *)objc_msgSend(v6, "initWithMachServiceName:options:", kBackgroundAssetsAgentMachServiceName, 0);
  objc_setProperty_atomic(a1, v8, v7, 8);

  if (!objc_getProperty(a1, v9, 8, 1))
  {
    objc_msgSend(objc_getProperty(a1, v10, 24, 1), "unlock");
    return 0;
  }
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2551156D0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCF20];
  v97[0] = objc_opt_class();
  v97[1] = objc_opt_class();
  v97[2] = objc_opt_class();
  v97[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, NSSelectorFromString(CFSTR("currentDownloads:")), 0, 1);

  v15 = (void *)MEMORY[0x24BDBCF20];
  v96 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v96, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v17, NSSelectorFromString(CFSTR("performWithExclusiveControlBeforeDate:handler:")), 0, 0);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v95[0] = objc_opt_class();
  v95[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v20, NSSelectorFromString(CFSTR("scheduleDownload:reply:")), 0, 0);

  v21 = (void *)MEMORY[0x24BDBCF20];
  v94[0] = objc_opt_class();
  v94[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v23, NSSelectorFromString(CFSTR("startForegroundDownload:reply:")), 0, 0);

  objc_msgSend(objc_getProperty(a1, v24, 8, 1), "setRemoteObjectInterface:", v11);
  WeakRetained = objc_loadWeakRetained(a1 + 4);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255114160);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDBCF20];
    v93[0] = objc_opt_class();
    v93[1] = objc_opt_class();
    v93[2] = objc_opt_class();
    v93[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_syncDownloads_, 0, 0);

    v30 = (void *)MEMORY[0x24BDBCF20];
    v92 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_removeDownloadIdentifier_, 0, 0);

    v33 = (void *)MEMORY[0x24BDBCF20];
    v91 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_downloadIdentifierDidBegin_, 0, 0);

    v36 = (void *)MEMORY[0x24BDBCF20];
    v90 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v90, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_downloadIdentifierDidPause_, 0, 0);

    v39 = (void *)MEMORY[0x24BDBCF20];
    v89 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_downloadIdentifier_didWriteBytes_totalBytesWritten_totalBytesExpectedToWrite_, 0, 0);

    v42 = (void *)MEMORY[0x24BDBCF20];
    v88 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_downloadIdentifier_didReceiveChallenge_authChallengeHandler_, 0, 0);

    v45 = (void *)MEMORY[0x24BDBCF20];
    v87 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setWithArray:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_downloadIdentifier_didReceiveChallenge_authChallengeHandler_, 1, 0);

    v48 = (void *)MEMORY[0x24BDBCF20];
    v86 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setWithArray:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_downloadIdentifier_didReceiveChallenge_authChallengeHandler_, 1, 1);

    v51 = (void *)MEMORY[0x24BDBCF20];
    v85 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setWithArray:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_downloadIdentifier_didFailWithError_wasHandled_, 0, 0);

    v54 = (void *)MEMORY[0x24BDBCF20];
    v84 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setWithArray:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_downloadIdentifier_didFailWithError_wasHandled_, 1, 0);

    v57 = (void *)MEMORY[0x24BDBCF20];
    v83 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setWithArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled_, 0, 0);

    v60 = (void *)MEMORY[0x24BDBCF20];
    v82 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setWithArray:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled_, 1, 0);

    objc_msgSend(objc_getProperty(a1, v63, 8, 1), "setExportedInterface:", v26);
    v65 = objc_getProperty(a1, v64, 8, 1);
    v66 = objc_loadWeakRetained(a1 + 4);
    objc_msgSend(v65, "setExportedObject:", v66);

  }
  objc_initWeak(&location, a1);
  v68 = objc_getProperty(a1, v67, 8, 1);
  v69 = MEMORY[0x24BDAC760];
  v79[0] = MEMORY[0x24BDAC760];
  v79[1] = 3221225472;
  v79[2] = __38__BAAgentClientProxy__setupConnection__block_invoke;
  v79[3] = &unk_24DDBEF98;
  objc_copyWeak(&v80, &location);
  objc_msgSend(v68, "setInterruptionHandler:", v79);

  v71 = objc_getProperty(a1, v70, 8, 1);
  v77[0] = v69;
  v77[1] = 3221225472;
  v77[2] = __38__BAAgentClientProxy__setupConnection__block_invoke_2;
  v77[3] = &unk_24DDBEF98;
  objc_copyWeak(&v78, &location);
  objc_msgSend(v71, "setInvalidationHandler:", v77);

  v73 = objc_getProperty(a1, v72, 8, 1);
  objc_msgSend(v73, "resume");

  v75 = objc_getProperty(a1, v74, 24, 1);
  objc_msgSend(v75, "unlock");

  objc_destroyWeak(&v78);
  objc_destroyWeak(&v80);
  objc_destroyWeak(&location);

  return 1;
}

void __38__BAAgentClientProxy__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_setProperty_atomic(WeakRetained, v2, 0, 8);
    WeakRetained = v3;
  }

}

void __38__BAAgentClientProxy__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_setProperty_atomic(WeakRetained, v2, 0, 8);
    WeakRetained = v3;
  }

}

- (void)currentDownloadsWithCompletion:(id *)a1
{
  const char *v3;
  id v4;
  SEL v5;
  id Property;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a2;
  if (a1)
  {
    -[BAAgentClientProxy _setupConnection](a1, v3);
    Property = objc_getProperty(a1, v5, 8, 1);
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke;
    v12[3] = &unk_24DDBEFC0;
    v8 = v4;
    v13 = v8;
    objc_msgSend(Property, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke_105;
    v10[3] = &unk_24DDBEFE8;
    v11 = v8;
    objc_msgSend(v9, "currentDownloads:", v10);

  }
}

void __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  BAClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)currentDownloads:(id *)a1
{
  SEL v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  if (a1)
  {
    -[BAAgentClientProxy _setupConnection](a1, a2);
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__0;
    v22 = __Block_byref_object_dispose__0;
    v23 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = 0;
    v5 = objc_getProperty(a1, v4, 8, 1);
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__BAAgentClientProxy_currentDownloads___block_invoke;
    v11[3] = &unk_24DDBF010;
    v11[4] = &v18;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __39__BAAgentClientProxy_currentDownloads___block_invoke_107;
    v10[3] = &unk_24DDBF038;
    v10[4] = &v18;
    v10[5] = &v12;
    objc_msgSend(v7, "currentDownloads:", v10);

    if (a2)
      *(_QWORD *)a2 = objc_retainAutorelease((id)v19[5]);
    v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void __39__BAAgentClientProxy_currentDownloads___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  BAClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__BAAgentClientProxy_currentDownloads___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __39__BAAgentClientProxy_currentDownloads___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (BOOL)scheduleDownload:(_QWORD *)a3 error:
{
  const char *v5;
  id v6;
  SEL v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a2;
  if (a1)
  {
    -[BAAgentClientProxy _setupConnection](a1, v5);
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__0;
    v23 = __Block_byref_object_dispose__0;
    v24 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v8 = objc_getProperty(a1, v7, 8, 1);
    v9 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __45__BAAgentClientProxy_scheduleDownload_error___block_invoke;
    v14[3] = &unk_24DDBF010;
    v14[4] = &v19;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __45__BAAgentClientProxy_scheduleDownload_error___block_invoke_108;
    v13[3] = &unk_24DDBEF20;
    v13[4] = &v15;
    v13[5] = &v19;
    objc_msgSend(v10, "scheduleDownload:reply:", v6, v13);

    if (a3)
      *a3 = objc_retainAutorelease((id)v20[5]);
    v11 = *((_BYTE *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __45__BAAgentClientProxy_scheduleDownload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  BAClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__BAAgentClientProxy_scheduleDownload_error___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __45__BAAgentClientProxy_scheduleDownload_error___block_invoke_108(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)acquireExclusiveControlWithHandler:(id *)a1
{
  const char *v3;
  id v4;
  SEL v5;
  id Property;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a2;
  if (a1)
  {
    -[BAAgentClientProxy _setupConnection](a1, v3);
    Property = objc_getProperty(a1, v5, 8, 1);
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke;
    v12[3] = &unk_24DDBEFC0;
    v8 = v4;
    v13 = v8;
    objc_msgSend(Property, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke_110;
    v10[3] = &unk_24DDBF060;
    v10[4] = a1;
    v11 = v8;
    objc_msgSend(v9, "performWithExclusiveControlWithHandler:", v10);

  }
}

void __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  BAClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke_110(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v6 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = v6;
  if (v6)
  {
    -[BAAgentClientProxy _exclusiveControlEndedWithToken:](*(id **)(a1 + 32), v6);
    v5 = v6;
  }

}

- (void)_exclusiveControlEndedWithToken:(id *)a1
{
  id v3;
  const char *v4;
  SEL v5;
  id v6;

  if (a1)
  {
    v3 = a2;
    -[BAAgentClientProxy _setupConnection](a1, v4);
    objc_msgSend(objc_getProperty(a1, v5, 8, 1), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exclusiveControlExitedWithToken:", v3);

  }
}

- (void)acquireExclusiveControlBeforeDate:(void *)a3 handler:
{
  id v5;
  id v6;
  const char *v7;
  SEL v8;
  id Property;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    -[BAAgentClientProxy _setupConnection](a1, v7);
    Property = objc_getProperty(a1, v8, 8, 1);
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke;
    v15[3] = &unk_24DDBEFC0;
    v11 = v5;
    v16 = v11;
    objc_msgSend(Property, "remoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke_112;
    v13[3] = &unk_24DDBF060;
    v13[4] = a1;
    v14 = v11;
    objc_msgSend(v12, "performWithExclusiveControlBeforeDate:handler:", v6, v13);

  }
}

void __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  BAClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke_112(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v6 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = v6;
  if (v6)
  {
    -[BAAgentClientProxy _exclusiveControlEndedWithToken:](*(id **)(a1 + 32), v6);
    v5 = v6;
  }

}

void __54__BAAgentClientProxy__exclusiveControlEndedWithToken___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  BAClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__BAAgentClientProxy__exclusiveControlEndedWithToken___block_invoke_cold_1(v2);

}

- (BOOL)startForegroundDownload:(_QWORD *)a3 error:
{
  const char *v5;
  id v6;
  SEL v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a2;
  if (a1)
  {
    -[BAAgentClientProxy _setupConnection](a1, v5);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__0;
    v19 = __Block_byref_object_dispose__0;
    v20 = 0;
    v8 = objc_getProperty(a1, v7, 8, 1);
    v9 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke;
    v14[3] = &unk_24DDBF010;
    v14[4] = &v15;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke_113;
    v13[3] = &unk_24DDBEF20;
    v13[4] = &v15;
    v13[5] = &v21;
    objc_msgSend(v10, "startForegroundDownload:reply:", v6, v13);

    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
    v11 = *((_BYTE *)v22 + 24) != 0;
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  BAClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke_113(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)cancelDownload:(_QWORD *)a3 error:
{
  const char *v5;
  id v6;
  SEL v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a2;
  if (a1)
  {
    -[BAAgentClientProxy _setupConnection](a1, v5);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    v21 = 0;
    v8 = objc_getProperty(a1, v7, 8, 1);
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __43__BAAgentClientProxy_cancelDownload_error___block_invoke;
    v15[3] = &unk_24DDBF010;
    v15[4] = &v16;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __43__BAAgentClientProxy_cancelDownload_error___block_invoke_114;
    v14[3] = &unk_24DDBEF20;
    v14[4] = &v22;
    v14[5] = &v16;
    objc_msgSend(v10, "cancelDownload:reply:", v11, v14);

    if (a3)
      *a3 = objc_retainAutorelease((id)v17[5]);
    v12 = *((_BYTE *)v23 + 24) != 0;
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __43__BAAgentClientProxy_cancelDownload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  BAClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__BAAgentClientProxy_cancelDownload_error___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __43__BAAgentClientProxy_cancelDownload_error___block_invoke_114(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)markPurgeableWithFileURL:(_QWORD *)a3 error:
{
  const char *v5;
  id v6;
  id v7;
  SEL v8;
  id Property;
  void *v10;
  void *v11;
  SEL v12;
  id v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[6];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (!a1)
    goto LABEL_13;
  -[BAAgentClientProxy _setupConnection](a1, v5);
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "fileSystemRepresentation");
  Property = objc_getProperty(a1, v8, 8, 1);
  if (Property)
  {
    objc_msgSend(Property, "auditToken");
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
  }
  v10 = (void *)sandbox_extension_issue_file_to_process();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    free(v10);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    v28 = 0;
    v13 = objc_getProperty(a1, v12, 8, 1);
    v14 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke;
    v22[3] = &unk_24DDBF010;
    v22[4] = &v23;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke_118;
    v21[3] = &unk_24DDBEF20;
    v21[4] = &v29;
    v21[5] = &v23;
    objc_msgSend(v15, "markPurgeableWithFileURL:sandboxToken:reply:", v7, v11, v21);

    if (a3)
      *a3 = objc_retainAutorelease((id)v24[5]);
    v16 = *((_BYTE *)v30 + 24) != 0;
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_13:
    v16 = 0;
    goto LABEL_12;
  }
  v17 = (void *)MEMORY[0x24BDD1540];
  v18 = *__error();
  v35 = CFSTR("FileURL");
  v36[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v18, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NSErrorWithBAErrorDomainCodeUnderlying(CFSTR("BAErrorDomain"), -107, v11);
  v16 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v16;
}

void __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  BAClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke_118(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionGuard, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __53__BAAgentClientProxy_currentDownloadsWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __39__BAAgentClientProxy_currentDownloads___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __45__BAAgentClientProxy_scheduleDownload_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __57__BAAgentClientProxy_acquireExclusiveControlWithHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __64__BAAgentClientProxy_acquireExclusiveControlBeforeDate_handler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __54__BAAgentClientProxy__exclusiveControlEndedWithToken___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __52__BAAgentClientProxy_startForegroundDownload_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __43__BAAgentClientProxy_cancelDownload_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __53__BAAgentClientProxy_markPurgeableWithFileURL_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v2, v3, "Message failed: %{public}s error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

@end
