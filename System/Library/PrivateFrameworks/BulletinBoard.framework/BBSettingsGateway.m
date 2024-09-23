@implementation BBSettingsGateway

void __35__BBSettingsGateway_allSectionInfo__block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v11 = 134218242;
    v12 = objc_msgSend(v5, "count");
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Got %ld section infos [ error: %{public}@ ]", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)allSectionInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Getting all section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_129);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__BBSettingsGateway_allSectionInfo__block_invoke_130;
    v9[3] = &unk_24C563AF0;
    v9[4] = &v11;
    objc_msgSend(v5, "allSortedSectionInfos:withHandler:", 0, v9);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_131);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __35__BBSettingsGateway_allSectionInfo__block_invoke_132;
    v8[3] = &unk_24C563AF0;
    v8[4] = &v11;
    objc_msgSend(v5, "getSectionInfoWithHandler:", v8);
  }

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)sectionInfoForSectionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Getting requested section info (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_160);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_161;
    v11[3] = &unk_24C563E60;
    v11[4] = &v13;
    objc_msgSend(v7, "sectionInfoForSectionID:effective:withHandler:", v4, 0, v11);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_162);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_163;
    v10[3] = &unk_24C563E88;
    v10[4] = &v13;
    objc_msgSend(v7, "getSectionInfoForSectionID:withHandler:", v4, v10);
  }

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)effectiveSectionInfoForSectionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Getting requested effective section info (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_146);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_147;
    v11[3] = &unk_24C563E60;
    v11[4] = &v13;
    objc_msgSend(v7, "sectionInfoForSectionID:effective:withHandler:", v4, 1, v11);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_149);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_150;
    v10[3] = &unk_24C563E88;
    v10[4] = &v13;
    objc_msgSend(v7, "getEffectiveSectionInfoForSectionID:withHandler:", v4, v10);
  }

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)_ensureBBServerSettingsConnection
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
  return self->_connectionQueue_bbServerConnection;
}

void __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.bulletinboard.settingsconnection"), 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v2;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend((id)objc_opt_class(), "serverInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend((id)objc_opt_class(), "clientInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInterruptionHandler:", &__block_literal_global_117);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke_118;
    v15 = &unk_24C562FE0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v9, "setInvalidationHandler:", &v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume", v12, v13, v14, v15);
    v10 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "BBSettingsGateway: Created BBServer connection %@", buf, 0xCu);
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __36__BBSettingsGateway_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v24;
  void *v25;
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
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[3];

  v61[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254998780);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface___interface;
  serverInterface___interface = v0;

  v2 = (void *)serverInterface___interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getSectionInfoWithHandler_, 0, 1);

  v6 = (void *)serverInterface___interface;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getEffectiveSectionInfoWithHandler_, 0, 1);

  v10 = (void *)serverInterface___interface;
  v11 = (void *)MEMORY[0x24BDBCF20];
  v59 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getSectionInfoForSectionID_withHandler_, 0, 1);

  v14 = (void *)serverInterface___interface;
  v15 = (void *)MEMORY[0x24BDBCF20];
  v58 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getEffectiveSectionInfoForSectionID_withHandler_, 0, 1);

  v18 = (void *)serverInterface___interface;
  v19 = (void *)MEMORY[0x24BDBCF20];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_getSectionInfoForSectionIDs_withHandler_, 0, 0);

  v22 = (void *)serverInterface___interface;
  v23 = (void *)MEMORY[0x24BDBCF20];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_getSectionInfoForSectionIDs_withHandler_, 0, 1);

  v26 = (void *)serverInterface___interface;
  v27 = (void *)MEMORY[0x24BDBCF20];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_getEffectiveSectionInfoForSectionIDs_withHandler_, 0, 1);

  v30 = (void *)serverInterface___interface;
  v31 = (void *)MEMORY[0x24BDBCF20];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_getSectionInfoForActiveSectionsWithHandler_, 0, 1);

  v34 = (void *)serverInterface___interface;
  v35 = (void *)MEMORY[0x24BDBCF20];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_getActiveSectionIDsWithHandler_, 0, 1);

  v38 = (void *)serverInterface___interface;
  v39 = (void *)MEMORY[0x24BDBCF20];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithArray:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_getSectionIDsWithHandler_, 0, 1);

  v42 = (void *)serverInterface___interface;
  v43 = (void *)MEMORY[0x24BDBCF20];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWithArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_getEffectiveGlobalScheduledDeliveryTimesWithHandler_, 0, 1);

  v46 = (void *)serverInterface___interface;
  v47 = (void *)MEMORY[0x24BDBCF20];
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setWithArray:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_setEffectiveGlobalScheduledDeliveryTimes_withHandler_, 0, 0);

}

uint64_t __64__BBSettingsGateway_setSectionInfo_forSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __36__BBSettingsGateway_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25499D490);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface___interface_0;
  clientInterface___interface_0 = v0;

}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (BBRefactorEnabled())
  {
    +[BBUNCoreConversion toUNCSectionInfo:parentSection:](BBUNCoreConversion, "toUNCSectionInfo:parentSection:", v8, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __64__BBSettingsGateway_setSectionInfo_forSectionID_withCompletion___block_invoke;
    v19[3] = &unk_24C5632A8;
    v20 = v9;
    v14 = v9;
    objc_msgSend(v13, "setSectionInfo:forSectionID:withHandler:", v11, v10, v19);

  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__BBSettingsGateway_setSectionInfo_forSectionID_withCompletion___block_invoke_2;
    v17[3] = &unk_24C5632A8;
    v18 = v9;
    v11 = v9;
    objc_msgSend(v16, "setSectionInfo:forSectionID:withHandler:", v8, v10, v17);

    v14 = v18;
  }

}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
  -[BBSettingsGateway setSectionInfo:forSectionID:withCompletion:](self, "setSectionInfo:forSectionID:withCompletion:", a3, a4, 0);
}

- (BBSettingsGateway)initWithQueue:(id)a3
{
  id v4;
  BBSettingsGateway *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *connectionQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BBSettingsGateway;
  v5 = -[BBSettingsGateway init](&v10, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v4 = (id)MEMORY[0x24BDAC9B8];
      v6 = MEMORY[0x24BDAC9B8];
    }
    objc_storeStrong((id *)&v5->_queue, v4);
    v7 = dispatch_queue_create("com.apple.bulletinboard.BBSettingsGateway.connectionQueue", 0);
    connectionQueue = v5->_connectionQueue;
    v5->_connectionQueue = (OS_dispatch_queue *)v7;

  }
  return v5;
}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1)
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_42);
  return (id)serverInterface___interface;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken_0 != -1)
    dispatch_once(&clientInterface_onceToken_0, &__block_literal_global_7);
  return (id)clientInterface___interface_0;
}

- (BBSettingsGateway)init
{
  return -[BBSettingsGateway initWithQueue:](self, "initWithQueue:", MEMORY[0x24BDAC9B8]);
}

- (void)dealloc
{
  objc_super v3;

  -[BBSettingsGateway invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BBSettingsGateway;
  -[BBSettingsGateway dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__BBSettingsGateway_invalidate__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

uint64_t __31__BBSettingsGateway_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
}

- (id)_settingsConnection
{
  if (BBRefactorEnabled())
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
  else
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20CCB9000, v0, OS_LOG_TYPE_DEFAULT, "BBServer connection interrupted", v1, 2u);
  }
}

void __54__BBSettingsGateway__ensureBBServerSettingsConnection__block_invoke_118(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBServer connection invalidated", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetBBServerSettingsConnection");

}

- (id)_ensureSettingsPersistenceConnection
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
  return self->_connectionQueue_unServerConnection;
}

void __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_alloc(MEMORY[0x24BDD1988]);
    v3 = objc_msgSend(v2, "initWithMachServiceName:options:", *MEMORY[0x24BEBF508], 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BEBF498], "serverInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BEBF498], "clientInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", &__block_literal_global_120);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke_121;
    v16 = &unk_24C562FE0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "setInvalidationHandler:", &v13);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume", v13, v14, v15, v16);
    v11 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "BBSettingsGateway: Created usernotificationsd connection %@", buf, 0xCu);
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20CCB9000, v0, OS_LOG_TYPE_DEFAULT, "BBSettingsGateway: usernotificationsd connection interrupted", v1, 2u);
  }
}

void __57__BBSettingsGateway__ensureSettingsPersistenceConnection__block_invoke_121(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "BBSettingsGateway: usernotificationsd connection invalidated", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetSettingsPersistenceConnection");

}

- (void)_resetBBServerSettingsConnection
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__BBSettingsGateway__resetBBServerSettingsConnection__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __53__BBSettingsGateway__resetBBServerSettingsConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)_resetSettingsPersistenceConnection
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__BBSettingsGateway__resetSettingsPersistenceConnection__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __56__BBSettingsGateway__resetSettingsPersistenceConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (id)allEffectiveSectionInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Getting all effective section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_123);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_124;
    v9[3] = &unk_24C563AF0;
    v9[4] = &v11;
    objc_msgSend(v5, "allSortedSectionInfos:withHandler:", 1, v9);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_127);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_128;
    v8[3] = &unk_24C563AF0;
    v8[4] = &v11;
    objc_msgSend(v5, "getEffectiveSectionInfoWithHandler:", v8);
  }

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_124(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v11 = 134218242;
    v12 = objc_msgSend(v5, "count");
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Got %ld effective section infos [ error: %{public}@ ]", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __35__BBSettingsGateway_allSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __35__BBSettingsGateway_allSectionInfo__block_invoke_130(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __35__BBSettingsGateway_allSectionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __35__BBSettingsGateway_allSectionInfo__block_invoke_2_cold_1();

}

- (void)getSectionInfoWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  void *v22;
  uint8_t buf[16];
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke;
  v24[3] = &unk_24C563D60;
  v24[4] = self;
  v6 = v4;
  v25 = v6;
  v7 = (void *)MEMORY[0x212B949C0](v24);
  v8 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Getting all section infos (async)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_135);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_136;
    v21[3] = &unk_24C563118;
    v11 = &v22;
    v22 = v7;
    v12 = v7;
    objc_msgSend(v10, "allSortedSectionInfos:withHandler:", 0, v21);

  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_2_137;
    v19[3] = &unk_24C563DA8;
    v11 = &v20;
    v14 = v7;
    v20 = v14;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_138;
    v17[3] = &unk_24C563118;
    v18 = v14;
    v16 = v14;
    objc_msgSend(v15, "getSectionInfoWithHandler:", v17);

    v9 = v18;
  }

}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_2;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_134(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_136(uint64_t a1, uint64_t a2)
{
  id v3;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_2_137(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __35__BBSettingsGateway_allSectionInfo__block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__BBSettingsGateway_getSectionInfoWithCompletion___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = 134218242;
    v10 = objc_msgSend(v5, "count");
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Got %ld section infos [ error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)sectionInfoForSectionIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Getting requested section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_139);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_140;
    v11[3] = &unk_24C563AF0;
    v11[4] = &v13;
    objc_msgSend(v7, "sectionInfosForSectionIDs:effective:withHandler:", v4, 0, v11);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_141);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_142;
    v10[3] = &unk_24C563E10;
    v10[4] = &v13;
    objc_msgSend(v7, "getSectionInfoForSectionIDs:withHandler:", v4, v10);
  }

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_140(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2_cold_1();

}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_142(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v8 = 134217984;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Got %ld section infos", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

- (void)getSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  void *v17;
  _QWORD v18[4];
  void *v19;
  _QWORD v20[5];
  id v21;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke;
  v20[3] = &unk_24C563D60;
  v20[4] = self;
  v8 = v6;
  v21 = v8;
  v9 = a3;
  v10 = (void *)MEMORY[0x212B949C0](v20);
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_143);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_144;
    v18[3] = &unk_24C563118;
    v13 = &v19;
    v19 = v10;
    v14 = v10;
    objc_msgSend(v12, "sectionInfosForSectionIDs:effective:withHandler:", v9, 0, v18);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_2_145;
    v16[3] = &unk_24C563E38;
    v13 = &v17;
    v17 = v10;
    v15 = v10;
    objc_msgSend(v12, "getSectionInfoForSectionIDs:withHandler:", v9, v16);
  }

}

void __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_2;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_144(uint64_t a1, uint64_t a2)
{
  id v3;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __64__BBSettingsGateway_getSectionInfoForSectionIDs_withCompletion___block_invoke_2_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_147(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[BBUNCoreConversion toBBSectionInfo:parentSection:](BBUNCoreConversion, "toBBSectionInfo:parentSection:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_2_cold_1();

}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_150(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got effective section info [ result: %ld ]", (uint8_t *)&v8, 0xCu);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

- (id)effectiveSectionInfoForSectionIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Getting requested effective section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_152);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_153;
    v11[3] = &unk_24C563AF0;
    v11[4] = &v13;
    objc_msgSend(v7, "sectionInfosForSectionIDs:effective:withHandler:", v4, 1, v11);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_154);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_155;
    v10[3] = &unk_24C563E10;
    v10[4] = &v13;
    objc_msgSend(v7, "getEffectiveSectionInfoForSectionIDs:withHandler:", v4, v10);
  }

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_153(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_2_cold_1();

}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_155(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v8 = 134217984;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Got %ld effective section infos", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

- (void)getEffectiveSectionInfoForSectionIDs:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke;
  v20[3] = &unk_24C563D60;
  v20[4] = self;
  v9 = v7;
  v21 = v9;
  v10 = (void *)MEMORY[0x212B949C0](v20);
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_156);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_157;
    v18[3] = &unk_24C563118;
    v19 = v10;
    objc_msgSend(v12, "allSortedSectionInfos:withHandler:", 0, v18);

    v13 = v19;
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_2_158;
    v16[3] = &unk_24C563D60;
    v16[4] = self;
    v17 = v9;
    objc_msgSend(v15, "getEffectiveSectionInfoForSectionIDs:withHandler:", v6, v16);

    v13 = v17;
  }

}

void __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_2;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_157(uint64_t a1, uint64_t a2)
{
  id v3;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_2_158(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_3_159;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __73__BBSettingsGateway_getEffectiveSectionInfoForSectionIDs_withCompletion___block_invoke_3_159(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_161(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[BBUNCoreConversion toBBSectionInfo:parentSection:](BBUNCoreConversion, "toBBSectionInfo:parentSection:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2_cold_1();

}

void __45__BBSettingsGateway_sectionInfoForSectionID___block_invoke_163(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got section infos [ result: %ld ]", (uint8_t *)&v8, 0xCu);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

- (void)getSectionInfoForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_164);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_165;
    v15[3] = &unk_24C563F30;
    v10 = &v16;
    v15[4] = self;
    v16 = v6;
    v11 = v6;
    objc_msgSend(v9, "sectionInfoForSectionID:effective:withHandler:", v7, 0, v15);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_3;
    v13[3] = &unk_24C563F58;
    v10 = &v14;
    v13[4] = self;
    v14 = v6;
    v12 = v6;
    objc_msgSend(v9, "getSectionInfoForSectionID:withHandler:", v7, v13);
  }

}

void __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_2;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[BBUNCoreConversion toBBSectionInfo:parentSection:](BBUNCoreConversion, "toBBSectionInfo:parentSection:", *(_QWORD *)(a1 + 32), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_4;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __63__BBSettingsGateway_getSectionInfoForSectionID_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getEffectiveSectionInfoForSectionID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_166);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_167;
    v15[3] = &unk_24C563F30;
    v10 = &v16;
    v15[4] = self;
    v16 = v6;
    v11 = v6;
    objc_msgSend(v9, "sectionInfoForSectionID:effective:withHandler:", v7, 1, v15);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_3;
    v13[3] = &unk_24C563F58;
    v10 = &v14;
    v13[4] = self;
    v14 = v6;
    v12 = v6;
    objc_msgSend(v9, "getEffectiveSectionInfoForSectionID:withHandler:", v7, v13);
  }

}

void __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_2;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[BBUNCoreConversion toBBSectionInfo:parentSection:](BBUNCoreConversion, "toBBSectionInfo:parentSection:", *(_QWORD *)(a1 + 32), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_4;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __72__BBSettingsGateway_getEffectiveSectionInfoForSectionID_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)activeSectionInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Getting active section infos (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_168);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__BBSettingsGateway_activeSectionInfo__block_invoke_169;
    v9[3] = &unk_24C563AF0;
    v9[4] = &v11;
    objc_msgSend(v5, "allSortedActiveSections:withHandler:", 0, v9);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_170);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __38__BBSettingsGateway_activeSectionInfo__block_invoke_171;
    v8[3] = &unk_24C563AF0;
    v8[4] = &v11;
    objc_msgSend(v5, "getSectionInfoForActiveSectionsWithHandler:", v8);
  }

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __38__BBSettingsGateway_activeSectionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __38__BBSettingsGateway_activeSectionInfo__block_invoke_169(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __38__BBSettingsGateway_activeSectionInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2_cold_1();

}

void __38__BBSettingsGateway_activeSectionInfo__block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v8 = 134217984;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Got %ld section infos", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

- (id)allActiveSectionIDs
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_172);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_173;
  v7[3] = &unk_24C563FE0;
  v7[4] = &v8;
  objc_msgSend(v4, "getActiveSectionIDsWithHandler:", v7);
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __40__BBSettingsGateway_allActiveSectionIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_cold_1();

}

void __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7 && os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_173_cold_1();

}

- (id)allSectionIDs
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[16];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Getting all section IDs (sync)", buf, 2u);
  }
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_175);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __34__BBSettingsGateway_allSectionIDs__block_invoke_176;
    v9[3] = &unk_24C563AF0;
    v9[4] = &v11;
    objc_msgSend(v5, "allSectionIDsWithHandler:", v9);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_177);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __34__BBSettingsGateway_allSectionIDs__block_invoke_178;
    v8[3] = &unk_24C563AF0;
    v8[4] = &v11;
    objc_msgSend(v5, "getSectionIDsWithHandler:", v8);
  }

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __34__BBSettingsGateway_allSectionIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __34__BBSettingsGateway_allSectionIDs__block_invoke_176(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __34__BBSettingsGateway_allSectionIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __34__BBSettingsGateway_allSectionIDs__block_invoke_2_cold_1();

}

void __34__BBSettingsGateway_allSectionIDs__block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v11 = 134218242;
    v12 = objc_msgSend(v5, "count");
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Got %ld section IDs [ error: %{public}@ ]", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)getSectionInfoForActiveSectionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_179);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_180;
    v12[3] = &unk_24C564048;
    v7 = &v13;
    v12[4] = self;
    v13 = v4;
    v8 = v4;
    objc_msgSend(v6, "allSortedActiveSections:withHandler:", 0, v12);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_3;
    v10[3] = &unk_24C564048;
    v7 = &v11;
    v10[4] = self;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v6, "getSectionInfoForActiveSectionsWithHandler:", v10);
  }

}

void __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1();

}

void __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_180(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  +[BBUNCoreConversion toBBSectionInfos:parentSection:](BBUNCoreConversion, "toBBSectionInfos:parentSection:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_2;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_4;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __67__BBSettingsGateway_getSectionInfoForActiveSectionsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __64__BBSettingsGateway_setSectionInfo_forSectionID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateSectionInfoForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  void *v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  if (BBRefactorEnabled())
  {
    -[BBSettingsGateway _ensureSettingsPersistenceConnection](self, "_ensureSettingsPersistenceConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __63__BBSettingsGateway_updateSectionInfoForSectionID_withHandler___block_invoke;
    v23[3] = &unk_24C564070;
    v10 = &v26;
    v25 = v6;
    v26 = v7;
    v11 = &v24;
    v12 = &v25;
    v24 = v9;
    v13 = v6;
    v14 = v7;
    v15 = v9;
    objc_msgSend(v15, "sectionInfoForSectionID:effective:withHandler:", v13, 0, v23);
  }
  else
  {
    -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteObjectProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __63__BBSettingsGateway_updateSectionInfoForSectionID_withHandler___block_invoke_3;
    v19[3] = &unk_24C564098;
    v10 = &v22;
    v21 = v6;
    v22 = v7;
    v11 = &v20;
    v12 = &v21;
    v20 = v17;
    v18 = v6;
    v14 = v17;
    v15 = v7;
    objc_msgSend(v14, "getSectionInfoForSectionID:withHandler:", v18, v19);
  }

}

void __63__BBSettingsGateway_updateSectionInfoForSectionID_withHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a1[6];
  +[BBUNCoreConversion toBBSectionInfo:parentSection:](BBUNCoreConversion, "toBBSectionInfo:parentSection:", a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)a1[4];
  +[BBUNCoreConversion toUNCSectionInfo:parentSection:](BBUNCoreConversion, "toUNCSectionInfo:parentSection:", v7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionInfo:forSectionID:withHandler:", v6, a1[5], &__block_literal_global_181);

}

void __63__BBSettingsGateway_updateSectionInfoForSectionID_withHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSectionInfo:forSectionID:", v2, *(_QWORD *)(a1 + 40));

}

- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_182);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalContentPreviewsSetting:withHandler:", a3, &__block_literal_global_184);

}

void __62__BBSettingsGateway_setEffectiveGlobalContentPreviewsSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __62__BBSettingsGateway_setEffectiveGlobalContentPreviewsSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalContentPreviewsSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_185);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke_186;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalContentPreviewsSettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke_cold_1();

}

void __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke_186(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBContentPreviewSetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalContentPreviewSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalContentPreviewsSettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__BBSettingsGateway_getEffectiveGlobalContentPreviewsSettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalContentPreviewsSettingWithHandler:", v8);

}

void __76__BBSettingsGateway_getEffectiveGlobalContentPreviewsSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__BBSettingsGateway_getEffectiveGlobalContentPreviewsSettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __76__BBSettingsGateway_getEffectiveGlobalContentPreviewsSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setEffectiveGlobalSpokenNotificationSetting:(int64_t)a3
{
  -[BBSettingsGateway setEffectiveGlobalAnnounceSetting:](self, "setEffectiveGlobalAnnounceSetting:", BBAnnounceSettingForSpokenNotificationSetting(a3));
}

- (int64_t)effectiveGlobalSpokenNotificationSetting
{
  return BBSpokenNotificationSettingForAnnounceSetting(-[BBSettingsGateway effectiveGlobalAnnounceSetting](self, "effectiveGlobalAnnounceSetting"));
}

- (void)getEffectiveGlobalSpokenNotificationSettingWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__BBSettingsGateway_getEffectiveGlobalSpokenNotificationSettingWithCompletion___block_invoke;
  v6[3] = &unk_24C564178;
  v7 = v4;
  v5 = v4;
  -[BBSettingsGateway getEffectiveGlobalAnnounceSettingWithCompletion:](self, "getEffectiveGlobalAnnounceSettingWithCompletion:", v6);

}

uint64_t __79__BBSettingsGateway_getEffectiveGlobalSpokenNotificationSettingWithCompletion___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = BBSpokenNotificationSettingForAnnounceSetting(a2);
  return (*(uint64_t (**)(uint64_t, unint64_t))(v2 + 16))(v2, v3);
}

- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_189);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalAnnounceSetting:withHandler:", a3, &__block_literal_global_191);

}

void __55__BBSettingsGateway_setEffectiveGlobalAnnounceSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __55__BBSettingsGateway_setEffectiveGlobalAnnounceSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalAnnounceSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_192);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke_193;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalAnnounceSettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke_cold_1();

}

void __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke_193(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBAnnounceSetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalAnnounceSettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__BBSettingsGateway_getEffectiveGlobalAnnounceSettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalAnnounceSettingWithHandler:", v8);

}

void __69__BBSettingsGateway_getEffectiveGlobalAnnounceSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__BBSettingsGateway_getEffectiveGlobalAnnounceSettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __69__BBSettingsGateway_getEffectiveGlobalAnnounceSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_194);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalAnnounceHeadphonesSetting:withHandler:", a3, &__block_literal_global_196);

}

void __65__BBSettingsGateway_setEffectiveGlobalAnnounceHeadphonesSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __65__BBSettingsGateway_setEffectiveGlobalAnnounceHeadphonesSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalAnnounceHeadphonesSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_197);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_198;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_cold_1();

}

void __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_198(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBAnnounceSetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceHeadphonesSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__BBSettingsGateway_getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:", v8);

}

void __79__BBSettingsGateway_getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__BBSettingsGateway_getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __79__BBSettingsGateway_getEffectiveGlobalAnnounceHeadphonesSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_199);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalAnnounceCarPlaySetting:withHandler:", a3, &__block_literal_global_201);

}

void __62__BBSettingsGateway_setEffectiveGlobalAnnounceCarPlaySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __62__BBSettingsGateway_setEffectiveGlobalAnnounceCarPlaySetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_202);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke_203;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalAnnounceCarPlaySettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke_cold_1();

}

void __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke_203(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBAnnounceCarPlaySetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceCarPlaySetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalAnnounceCarPlaySettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__BBSettingsGateway_getEffectiveGlobalAnnounceCarPlaySettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalAnnounceCarPlaySettingWithHandler:", v8);

}

void __76__BBSettingsGateway_getEffectiveGlobalAnnounceCarPlaySettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__BBSettingsGateway_getEffectiveGlobalAnnounceCarPlaySettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __76__BBSettingsGateway_getEffectiveGlobalAnnounceCarPlaySettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_204);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalScheduledDeliverySetting:withHandler:", a3, &__block_literal_global_206);

}

void __64__BBSettingsGateway_setEffectiveGlobalScheduledDeliverySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __64__BBSettingsGateway_setEffectiveGlobalScheduledDeliverySetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_207);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke_208;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalScheduledDeliverySettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke_cold_1();

}

void __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke_208(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBScheduledDeliverySetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliverySetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalScheduledDeliverySettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__BBSettingsGateway_getEffectiveGlobalScheduledDeliverySettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalScheduledDeliverySettingWithHandler:", v8);

}

void __78__BBSettingsGateway_getEffectiveGlobalScheduledDeliverySettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__BBSettingsGateway_getEffectiveGlobalScheduledDeliverySettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __78__BBSettingsGateway_getEffectiveGlobalScheduledDeliverySettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_209);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffectiveGlobalScheduledDeliveryTimes:withHandler:", v4, &__block_literal_global_211);

}

void __62__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryTimes___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __62__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryTimes___block_invoke_cold_1();

}

- (id)effectiveGlobalScheduledDeliveryTimes
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_212);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke_213;
  v7[3] = &unk_24C563AF0;
  v7[4] = &v8;
  objc_msgSend(v4, "getEffectiveGlobalScheduledDeliveryTimesWithHandler:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke_cold_1();

}

void __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke_213(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliveryTimes (sync) [ error: %{public}@ ]", (uint8_t *)&v10, 0xCu);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (void)getEffectiveGlobalScheduledDeliveryTimesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryTimesWithCompletion___block_invoke;
  v8[3] = &unk_24C564048;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalScheduledDeliveryTimesWithHandler:", v8);

}

void __76__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryTimesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryTimesWithCompletion___block_invoke_2;
  v7[3] = &unk_24C5631E0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __76__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryTimesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_214);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:withHandler:", a3, &__block_literal_global_216);

}

void __79__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __79__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_217);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_218;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_cold_1();

}

void __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_218(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBSystemSetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliveryShowNextSummarySetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:", v8);

}

void __93__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __93__BBSettingsGateway_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_219);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalNotificationListDisplayStyleSetting:withHandler:", a3, &__block_literal_global_221);

}

void __75__BBSettingsGateway_setEffectiveGlobalNotificationListDisplayStyleSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __75__BBSettingsGateway_setEffectiveGlobalNotificationListDisplayStyleSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_222);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_223;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_cold_1();

}

void __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_223(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBNotificationListDisplayStyleSetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalNotificationListDisplayStyleSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__BBSettingsGateway_getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:", v8);

}

void __89__BBSettingsGateway_getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __89__BBSettingsGateway_getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __89__BBSettingsGateway_getEffectiveGlobalNotificationListDisplayStyleSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_224);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalSummarizationSetting:withHandler:", a3, &__block_literal_global_226);

}

void __60__BBSettingsGateway_setEffectiveGlobalSummarizationSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __60__BBSettingsGateway_setEffectiveGlobalSummarizationSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalSummarizationSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_227);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke_228;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalSummarizationSettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke_cold_1();

}

void __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke_228(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBSystemSetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalSummarizationSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalSummarizationSettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__BBSettingsGateway_getEffectiveGlobalSummarizationSettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalSummarizationSettingWithHandler:", v8);

}

void __74__BBSettingsGateway_getEffectiveGlobalSummarizationSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__BBSettingsGateway_getEffectiveGlobalSummarizationSettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __74__BBSettingsGateway_getEffectiveGlobalSummarizationSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setEffectiveGlobalHighlightsSetting:(int64_t)a3
{
  void *v4;
  id v5;

  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_229);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffectiveGlobalHighlightsSetting:withHandler:", a3, &__block_literal_global_231);

}

void __57__BBSettingsGateway_setEffectiveGlobalHighlightsSetting___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __57__BBSettingsGateway_setEffectiveGlobalHighlightsSetting___block_invoke_cold_1();

}

- (int64_t)effectiveGlobalHighlightsSetting
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_232);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke_233;
  v6[3] = &unk_24C564100;
  v6[4] = &v7;
  objc_msgSend(v3, "getEffectiveGlobalHighlightsSettingWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
    __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke_cold_1();

}

void __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke_233(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BBStringFromBBSystemSetting(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalHighlightsSetting (sync) [ result: %@, error: %{public}@ ]", (uint8_t *)&v9, 0x16u);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)getEffectiveGlobalHighlightsSettingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[BBSettingsGateway _settingsConnection](self, "_settingsConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__BBSettingsGateway_getEffectiveGlobalHighlightsSettingWithCompletion___block_invoke;
  v8[3] = &unk_24C564150;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getEffectiveGlobalHighlightsSettingWithHandler:", v8);

}

void __71__BBSettingsGateway_getEffectiveGlobalHighlightsSettingWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__BBSettingsGateway_getEffectiveGlobalHighlightsSettingWithCompletion___block_invoke_2;
  v5[3] = &unk_24C564128;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __71__BBSettingsGateway_getEffectiveGlobalHighlightsSettingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)refreshAnnounceSettings
{
  void *v2;
  id v3;

  -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAnnounceSettings");

}

- (void)refreshGlobalSettings
{
  void *v2;
  id v3;

  -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshGlobalSettings");

}

- (void)refreshSectionInfo
{
  void *v2;
  id v3;

  -[BBSettingsGateway _ensureBBServerSettingsConnection](self, "_ensureBBServerSettingsConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshSectionInfo");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue_unServerConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue_bbServerConnection, 0);
}

void __44__BBSettingsGateway_allEffectiveSectionInfo__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting all effective section infos failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35__BBSettingsGateway_allSectionInfo__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting all section infos failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __46__BBSettingsGateway_sectionInfoForSectionIDs___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting requested section infos failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__BBSettingsGateway_effectiveSectionInfoForSectionID___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting requested effective section info failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__BBSettingsGateway_effectiveSectionInfoForSectionIDs___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting requested effective section infos failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting all active section IDs failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__BBSettingsGateway_allActiveSectionIDs__block_invoke_173_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error getting active section IDs: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __34__BBSettingsGateway_allSectionIDs__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting requested all section IDs failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__BBSettingsGateway_setEffectiveGlobalContentPreviewsSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Setting effectiveGlobalContentPreviewSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__BBSettingsGateway_effectiveGlobalContentPreviewsSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalContentPreviewSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__BBSettingsGateway_setEffectiveGlobalAnnounceSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set setEffectiveGlobalAnnounceSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BBSettingsGateway_effectiveGlobalAnnounceSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalAnnounceSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __65__BBSettingsGateway_setEffectiveGlobalAnnounceHeadphonesSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set effectiveGlobalAnnounceHeadphonesSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BBSettingsGateway_effectiveGlobalAnnounceHeadphonesSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalAnnounceHeadphonesSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__BBSettingsGateway_setEffectiveGlobalAnnounceCarPlaySetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set effectiveGlobalAnnounceCarPlaySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__BBSettingsGateway_effectiveGlobalAnnounceCarPlaySetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalAnnounceCarPlaySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__BBSettingsGateway_setEffectiveGlobalScheduledDeliverySetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set effectiveGlobalScheduledDeliverySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BBSettingsGateway_effectiveGlobalScheduledDeliverySetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalScheduledDeliverySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryTimes___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set effectiveGlobalScheduledDeliveryTimes (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__BBSettingsGateway_effectiveGlobalScheduledDeliveryTimes__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalScheduledDeliveryTimes (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __79__BBSettingsGateway_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set effectiveGlobalScheduledDeliveryShowNextSummarySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __75__BBSettingsGateway_effectiveGlobalScheduledDeliveryShowNextSummarySetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalScheduledDeliveryShowNextSummarySetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __75__BBSettingsGateway_setEffectiveGlobalNotificationListDisplayStyleSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set effectiveGlobalNotificationListDisplayStyleSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__BBSettingsGateway_effectiveGlobalNotificationListDisplayStyleSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalNotificationListDisplayStyleSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BBSettingsGateway_setEffectiveGlobalSummarizationSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set setEffectiveGlobalSummarizationSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BBSettingsGateway_effectiveGlobalSummarizationSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalSummarizationSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__BBSettingsGateway_setEffectiveGlobalHighlightsSetting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Set setEffectiveGlobalHighlightsSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__BBSettingsGateway_effectiveGlobalHighlightsSetting__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Getting effectiveGlobalHighlightsSetting (sync) failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
