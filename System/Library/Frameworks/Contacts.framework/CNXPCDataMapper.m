@implementation CNXPCDataMapper

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  CNXPCDataMapper *v14;

  v4 = a3;
  v5 = v4;
  if (!self || !self->_serviceConnection)
  {
    v8 = (void *)MEMORY[0x1E0D13AE8];
    v9 = 100;
LABEL_7:
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "observableWithError:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (!self->_serviceProxy)
  {
    v8 = (void *)MEMORY[0x1E0D13AE8];
    v9 = 1;
    goto LABEL_7;
  }
  ensureFetchRequestHasKeyboardState(v4, self->_keyboardStateMonitor);
  v6 = (void *)MEMORY[0x1E0D13AE8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke;
  v12[3] = &unk_1E29F8940;
  v13 = v5;
  v14 = self;
  objc_msgSend(v6, "observableWithBlock:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v7;
}

- (BOOL)shouldLogContactsAccess
{
  return 1;
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_authorization;
  return -[CNXPCDataMapper requestAccessForEntityType:error:](self, "requestAccessForEntityType:error:", 0, a4);
}

- (BOOL)shouldLogPrivacyAccountingAccessEvents
{
  return 0;
}

void __100__CNXPCDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contactMatchInfosFromABMatchInfos:contacts:", *(_QWORD *)(a1 + 40), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 48), "didFetchContacts:error:", v4, 0);
  }

}

void __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_3;
  v8[3] = &unk_1E29F88F0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "_cn_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v6);

}

- (id)meContactIdentifiers:(id *)a3
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:error:](self, "remoteResultForSelector:error:", sel_meContactIdentifiersWithReply_, a3);
}

void __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v11 = a2;
  v12 = a3;
  v13 = a6;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v13 == 0;
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v14 = (_QWORD *)a1[4];
    if (v14)
      v14 = (_QWORD *)v14[3];
    v15 = v14;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2;
    v20[3] = &unk_1E29F89E0;
    v21 = v15;
    v16 = v15;
    objc_msgSend(a4, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1[9] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    (*(void (**)(void))(a1[5] + 16))();
    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = a5;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a6);
  }

}

void __100__CNXPCDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id obj;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v9 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __100__CNXPCDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2;
    v13[3] = &unk_1E29F8990;
    v14 = v9;
    v15 = v8;
    v17 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v10 + 40);
    v11 = objc_msgSend(v14, "decodeContactsFromData:moreComing:replyHandler:error:", v7, a4 ^ 1u, v13, &obj);
    objc_storeStrong((id *)(v10 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;

  }
}

- (CNXPCDataMapper)initWithConfiguration:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  CNXPCDataMapper *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNXPCConnection *v13;
  CNXPCConnection *serviceConnection;
  uint64_t v15;
  CNXPCDataMapperService *serviceProxy;
  CNAuthorization *v17;
  void *v18;
  uint64_t v19;
  CNAuthorization *authorization;
  void *v21;
  uint64_t v22;
  CNKeyboardStateMonitor *keyboardStateMonitor;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  CNXPCDataMapper *v33;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CNXPCDataMapper;
  v8 = -[CNXPCDataMapper init](&v35, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactsLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v8->_logger, v11);
    +[CNXPCDataMapper serviceProtocolInterface](CNXPCDataMapper, "serviceProtocolInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CNXPCConnection initWithConnection:interface:logger:]([CNXPCConnection alloc], "initWithConnection:interface:logger:", v7, v12, v11);
    serviceConnection = v8->_serviceConnection;
    v8->_serviceConnection = v13;

    -[CNXPCConnection serviceProxy](v8->_serviceConnection, "serviceProxy");
    v15 = objc_claimAutoreleasedReturnValue();
    serviceProxy = v8->_serviceProxy;
    v8->_serviceProxy = (CNXPCDataMapperService *)v15;

    v17 = [CNAuthorization alloc];
    objc_msgSend(v6, "assumedIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CNAuthorization initWithAssumedIdentity:](v17, "initWithAssumedIdentity:", v18);
    authorization = v8->_authorization;
    v8->_authorization = (CNAuthorization *)v19;

    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "keyboardStateMonitor");
    v22 = objc_claimAutoreleasedReturnValue();
    keyboardStateMonitor = v8->_keyboardStateMonitor;
    v8->_keyboardStateMonitor = (CNKeyboardStateMonitor *)v22;

    v24 = (void *)objc_opt_new();
    objc_msgSend(v6, "environment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "useInMemoryStores");

    if (v26)
    {
      objc_msgSend(v24, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CNiOSAddressBookDataMapperUnitTestInMemoryStoreKey"));
    }
    else
    {
      objc_msgSend(v6, "environment");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNXPCDataMapper unitTestPathFromEnvironment:]((uint64_t)v8, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 && objc_msgSend(v28, "length"))
        objc_msgSend(v24, "setObject:forKey:", v28, CFSTR("CNiOSAddressBookDataMapperUnitTestPathKey"));

    }
    objc_msgSend(v6, "assumedIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = objc_alloc(getPABridgedTCCIdentityClass());
      objc_msgSend(v6, "assumedIdentity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithTCCIdentity:", v31);

      if (v32)
        objc_msgSend(v24, "setObject:forKey:", v32, CFSTR("CNAssumedIdentity"));

    }
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13820] + 16))() & 1) == 0)
      -[CNXPCDataMapperService configureServiceWithOptions:](v8->_serviceProxy, "configureServiceWithOptions:", v24);
    v33 = v8;

  }
  return v8;
}

- (id)unitTestPathFromEnvironment:(uint64_t)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a2, "baseURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (CNXPCDataMapper)initWithConfiguration:(id)a3
{
  __CFString *v5;
  id v6;
  __CFString *v7;
  void *v8;
  CNXPCDataMapper *v9;

  v5 = CFSTR("com.apple.contactsd");
  v6 = a3;
  if (objc_msgSend(v6, "isContactProvider"))
  {
    v7 = CFSTR("com.apple.contactsd.contact-provider");

    v5 = v7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v5, 0);
  v9 = -[CNXPCDataMapper initWithConfiguration:connection:](self, "initWithConfiguration:connection:", v6, v8);

  return v9;
}

+ (id)serviceProtocolInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v207;
  void *v208;
  void *v209;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1B1EA0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNXPCDataMapper cursorProtocolInterface]();
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "_cn_addNonNilObject:", getPABridgedTCCIdentityClass());
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v208, sel_configureServiceWithOptions_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_identifierWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_identifierWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_unifiedContactCountWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_unifiedContactCountWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_contactCountForFetchRequest_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_contactCountForFetchRequest_withReply_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_contactCountForFetchRequest_withReply_, 1, 1);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_sectionListOffsetsForSortOrder_reply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_sectionListOffsetsForSortOrder_reply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_contactsForFetchRequest_withMatchInfoReply_, 0, 0);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_contactsForFetchRequest_withMatchInfoReply_, 0, 1);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_contactsForFetchRequest_withMatchInfoReply_, 1, 1);

  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_contactsForFetchRequest_withMatchInfoReply_, 2, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_encodedContactsAndCursorForFetchRequest_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_encodedContactsAndCursorForFetchRequest_withReply_, 0, 1);

  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, v36, v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_encodedContactsAndCursorForFetchRequest_withReply_, 1, 1);

  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v209, sel_encodedContactsAndCursorForFetchRequest_withReply_, 2, 1);
  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_encodedContactsAndCursorForFetchRequest_withReply_, 4, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE18BB10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1B1F00);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_receiveProgressiveContacts_matchInfos_, 0, 0);

  v46 = (void *)MEMORY[0x1E0C99E60];
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_receiveProgressiveContacts_matchInfos_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_progressiveContactsForFetchRequest_progressHandler_reply_, 0, 0);

  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v42, sel_progressiveContactsForFetchRequest_progressHandler_reply_, 1, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v207, sel_progressiveContactsForFetchRequest_progressHandler_reply_, 0, 1);
  v51 = (void *)MEMORY[0x1E0C99E60];
  v52 = objc_opt_class();
  objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_meContactIdentifiersWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_meContactIdentifiersWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_executeSaveRequest_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_executeSaveRequest_withReply_, 1, 1);

  v57 = (void *)MEMORY[0x1E0C99E60];
  v58 = objc_opt_class();
  v59 = objc_opt_class();
  v60 = objc_opt_class();
  v61 = objc_opt_class();
  v62 = objc_opt_class();
  objc_msgSend(v57, "setWithObjects:", v58, v59, v60, v61, v62, objc_opt_class(), 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_executeSaveRequest_withReply_, 2, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_containersMatchingPredicate_withReply_, 0, 0);

  v65 = (void *)MEMORY[0x1E0C99E60];
  v66 = objc_opt_class();
  objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v67, sel_containersMatchingPredicate_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_containersMatchingPredicate_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_serverSearchContainersMatchingPredicate_withReply_, 0, 0);

  v70 = (void *)MEMORY[0x1E0C99E60];
  v71 = objc_opt_class();
  objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_serverSearchContainersMatchingPredicate_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v73, sel_serverSearchContainersMatchingPredicate_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_policyForContainerWithIdentifier_withReply_, 0, 0);

  v75 = (void *)MEMORY[0x1E0C99E60];
  v76 = objc_opt_class();
  objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_policyForContainerWithIdentifier_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_policyForContainerWithIdentifier_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v79, sel_accountsMatchingPredicate_withReply_, 0, 0);

  v80 = (void *)MEMORY[0x1E0C99E60];
  v81 = objc_opt_class();
  objc_msgSend(v80, "setWithObjects:", v81, objc_opt_class(), 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_accountsMatchingPredicate_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_accountsMatchingPredicate_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_groupsMatchingPredicate_withReply_, 0, 0);

  v85 = (void *)MEMORY[0x1E0C99E60];
  v86 = objc_opt_class();
  objc_msgSend(v85, "setWithObjects:", v86, objc_opt_class(), 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v87, sel_groupsMatchingPredicate_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v88, sel_groupsMatchingPredicate_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v89, sel_subgroupsOfGroupWithIdentifier_withReply_, 0, 0);

  v90 = (void *)MEMORY[0x1E0C99E60];
  v91 = objc_opt_class();
  objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v92, sel_subgroupsOfGroupWithIdentifier_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v93, sel_subgroupsOfGroupWithIdentifier_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v94, sel_defaultContainerIdentifierWithReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v95, sel_defaultContainerIdentifierWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v96, sel_defaultContainerIdentifierWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v97, sel_setDefaultAccountIdentifier_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v98, sel_setDefaultAccountIdentifier_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v99, sel_setDefaultAccountIdentifier_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v100, sel_setMeContact_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v101, sel_setMeContact_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v102, sel_setMeContact_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v103, sel_setMeContact_forContainer_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v104, sel_setMeContact_forContainer_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v105, sel_setMeContact_forContainer_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v106, sel_setMeContact_forContainer_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v107, sel_setBestMeIfNeededForGivenName_familyName_email_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v108, sel_setBestMeIfNeededForGivenName_familyName_email_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v109, sel_setBestMeIfNeededForGivenName_familyName_email_withReply_, 2, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v110, sel_setBestMeIfNeededForGivenName_familyName_email_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_setBestMeIfNeededForGivenName_familyName_email_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v112, sel_favoritesEntryDictionariesAtPath_withReply_, 0, 0);

  v113 = (void *)MEMORY[0x1E0C99E60];
  v114 = objc_opt_class();
  v115 = objc_opt_class();
  v116 = objc_opt_class();
  objc_msgSend(v113, "setWithObjects:", v114, v115, v116, objc_opt_class(), 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v117, sel_favoritesEntryDictionariesAtPath_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v118, sel_favoritesEntryDictionariesAtPath_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v119, sel_writeFavoritesPropertyListData_toPath_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v120, sel_writeFavoritesPropertyListData_toPath_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v121, sel_writeFavoritesPropertyListData_toPath_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v122, sel_writeFavoritesPropertyListData_toPath_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v123, sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v124, sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v125, sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v126, sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v127, sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v128, sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v129, sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v130, sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v131, sel_changeHistoryWithFetchRequest_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v132, sel_changeHistoryWithFetchRequest_withReply_, 0, 1);

  v133 = (void *)MEMORY[0x1E0C99E60];
  v134 = objc_opt_class();
  objc_msgSend(v133, "setWithObjects:", v134, objc_opt_class(), 0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v135, sel_changeHistoryWithFetchRequest_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v136, sel_currentHistoryTokenWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v137, sel_currentHistoryTokenWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v138, sel_currentHistoryAnchorWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v139, sel_currentHistoryAnchorWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v140, sel_executeChangeHistoryClearRequest_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v141, sel_executeChangeHistoryClearRequest_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v142, sel_executeChangeHistoryClearRequest_withReply_, 1, 1);

  v143 = (void *)MEMORY[0x1E0C99E60];
  v144 = objc_opt_class();
  objc_msgSend(v143, "setWithObjects:", v144, objc_opt_class(), 0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v145, sel_reindexSearchableItemsWithIdentifiers_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v146, sel_verifyIndexWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v147, sel_verifyIndexWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v148, sel_geminiResultForContact_substituteDefaultForDangling_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v149, sel_geminiResultForContact_substituteDefaultForDangling_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v150, sel_geminiResultForContact_substituteDefaultForDangling_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v151, sel_bestSenderIdentityForHandle_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", getTUSenderIdentityClass_0(), 0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v152, sel_bestSenderIdentityForHandle_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v153, sel_bestSenderIdentityForHandle_withReply_, 1, 1);

  +[CNSecureCodingClassSets keyDescriptorClasses](CNSecureCodingClassSets, "keyDescriptorClasses");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v154, sel_authorizedKeysForContactKeys_withReply_, 0, 0);

  +[CNSecureCodingClassSets keyDescriptorClasses](CNSecureCodingClassSets, "keyDescriptorClasses");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v155, sel_authorizedKeysForContactKeys_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v156, sel_authorizedKeysForContactKeys_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v157, sel_getBackgroundColorOnImageData_bitmapFormat_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v158, sel_getBackgroundColorOnImageData_bitmapFormat_withReply_, 1, 0);

  v159 = (void *)MEMORY[0x1E0C99E60];
  v160 = objc_opt_class();
  v161 = objc_opt_class();
  v162 = objc_opt_class();
  objc_msgSend(v159, "setWithObjects:", v160, v161, v162, objc_opt_class(), 0);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v163, sel_getBackgroundColorOnImageData_bitmapFormat_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v164, sel_addLimitedAccessForBundle_contactIdentifier_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v165, sel_addLimitedAccessForBundle_contactIdentifier_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v166, sel_addLimitedAccessForBundle_contactIdentifier_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v167, sel_addLimitedAccessForBundle_contactIdentifier_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v168, sel_getLimitedAccessContactsCountForBundle_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v169, sel_getLimitedAccessContactsCountForBundle_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v170, sel_removeLimitedAccessForBundle_contactIdentifier_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v171, sel_removeLimitedAccessForBundle_contactIdentifier_withReply_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v172, sel_removeLimitedAccessForBundle_contactIdentifier_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v173, sel_removeLimitedAccessForBundle_contactIdentifier_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v174, sel_fetchLimitedAccessContactIdentifiersForBundle_withReply_, 0, 0);

  v175 = (void *)MEMORY[0x1E0C99E60];
  v176 = objc_opt_class();
  objc_msgSend(v175, "setWithObjects:", v176, objc_opt_class(), 0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v177, sel_fetchLimitedAccessContactIdentifiersForBundle_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v178, sel_fetchLimitedAccessContactIdentifiersForBundle_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v179, sel_populateSyncTableForLimitedAccessAboveSequenceNumber_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v180, sel_populateSyncTableForLimitedAccessAboveSequenceNumber_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v181, sel_populateSyncTableForLimitedAccessAboveSequenceNumber_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v182, sel_updateLimitedAccessTable_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v183, sel_updateLimitedAccessTable_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v184, sel_updateLimitedAccessTable_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v185, sel_getLimitedAccessLastSyncSequenceNumberWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v186, sel_getLimitedAccessLastSyncSequenceNumberWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v187, sel_purgeLimitedAccessRecordsForBundle_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v188, sel_purgeLimitedAccessRecordsForBundle_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v189, sel_purgeLimitedAccessRecordsForBundle_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v190, sel_getWatchLimitedAccessSyncDataStartingAtSequenceNumber_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v191, sel_getWatchLimitedAccessSyncDataStartingAtSequenceNumber_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v192, sel_getWatchLimitedAccessSyncDataStartingAtSequenceNumber_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v193, sel_applyLimitedAccessSyncEvents_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v194, sel_applyLimitedAccessSyncEvents_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v195, sel_applyLimitedAccessSyncEvents_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v196, sel_dropAllLimitedAccessRowsWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v197, sel_dropAllLimitedAccessRowsWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v198, sel_dropAllLimitedAccessRowsAndSyncNotifyWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v199, sel_dropAllLimitedAccessRowsAndSyncNotifyWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v200, sel_setLimitedAccessTableCurrentSequenceNumber_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v201, sel_setLimitedAccessTableCurrentSequenceNumber_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v202, sel_setLimitedAccessTableCurrentSequenceNumber_withReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v203, sel_shouldAnalyzeDatabaseWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v204, sel_analyzeDatabaseWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v205, sel_analyzeDatabaseWithReply_, 1, 1);

  return v2;
}

+ (id)cursorProtocolInterface
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE190A90);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_fetchNextBatchWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_fetchNextBatchWithReply_, 2, 1);

  return v0;
}

id __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_2;
  aBlock[3] = &unk_1E29F8918;
  v5 = v3;
  v21 = v5;
  v6 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "effectivePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "cn_supportsEncodedFetching"))
  {
    v9 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v19 = 0;
    v10 = -[CNXPCDataMapper fetchAndDecodeEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:](v8, v9, &v19, v4, v6);
    v11 = v19;
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v18 = 0;
    v10 = -[CNXPCDataMapper fetchContactsForFetchRequest:error:batchHandler:](v12, v13, &v18, v6);
    v11 = v18;
  }
  v14 = v11;
  v15 = v14;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v5, "observerDidComplete");
  }
  else
  {
    if (!v14)
    {
      v16 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_cold_1(v16);

      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 2, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "observerDidFailWithError:", v15);
  }

  return v4;
}

- (uint64_t)fetchAndDecodeEncodedContactsForFetchRequest:(_QWORD *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_12;
  }
  +[CNXPCDataMapper contactBuffersDecoderForFetchRequest:](CNXPCDataMapper, "contactBuffersDecoderForFetchRequest:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  v13 = *(id *)(a1 + 24);
  v14 = *(id *)(a1 + 40);
  ensureFetchRequestHasKeyboardState(v9, v14);

  v27 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __100__CNXPCDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke;
  v21[3] = &unk_1E29F89B8;
  v25 = &v34;
  v15 = v12;
  v22 = v15;
  v24 = v11;
  v16 = v13;
  v23 = v16;
  v26 = &v28;
  LOBYTE(v14) = -[CNXPCDataMapper fetchEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:](a1, v9, &v27, v10, v21);
  v17 = v27;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(v16, "didFetchContacts:error:", 0, v17);
    v19 = v17;
    if (a3)
    {
LABEL_9:
      v18 = 0;
      *a3 = objc_retainAutorelease(v19);
      goto LABEL_11;
    }
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  if (!*((_BYTE *)v35 + 24))
  {
    objc_msgSend(v16, "didFetchContacts:error:", 0, v29[5]);
    if (a3)
    {
      v19 = (void *)v29[5];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v18 = 1;
LABEL_11:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

LABEL_12:
  return v18;
}

- (BOOL)fetchEncodedContactsForFetchRequest:(_QWORD *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v20;
  void *v21;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;

  v8 = a2;
  v24 = a4;
  v23 = a5;
  if (a1)
  {
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__5;
    v56 = __Block_byref_object_dispose__5;
    v57 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__5;
    v46 = __Block_byref_object_dispose__5;
    v47 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v9 = *(id *)(a1 + 40);
    v10 = v8;
    ensureFetchRequestHasKeyboardState(v8, v9);

    v11 = *(id *)(a1 + 16);
    v12 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke;
    v31[3] = &unk_1E29F8A08;
    v34 = &v58;
    v35 = &v52;
    v33 = &v48;
    v31[4] = a1;
    v36 = &v42;
    v13 = v23;
    v32 = v13;
    v37 = &v38;
    objc_msgSend(v11, "encodedContactsAndCursorForFetchRequest:withReply:", v10, v31);

    v14 = v10;
    while (!*((_BYTE *)v39 + 24))
    {
      if (v53[5] || (objc_msgSend(v24, "isCanceled") & 1) != 0)
        break;
      *((_BYTE *)v49 + 24) = 0;
      v20 = (void *)v43[5];
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_3;
      v25[3] = &unk_1E29F8A30;
      v27 = &v48;
      v28 = &v58;
      v29 = &v52;
      v26 = v13;
      v30 = &v38;
      v21 = v20;
      v14 = v10;
      objc_msgSend(v21, "fetchNextBatchWithReply:", v25);
      if (!*((_BYTE *)v49 + 24))
        *((_BYTE *)v39 + 24) = 1;

    }
    if (!*((_BYTE *)v49 + 24))
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 1, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v53[5];
      v53[5] = v15;

      *((_BYTE *)v59 + 24) = 0;
      v14 = v10;
    }
    if (a3)
    {
      v17 = (void *)v53[5];
      if (v17)
        *a3 = objc_retainAutorelease(v17);
    }
    v18 = *((_BYTE *)v59 + 24) != 0;

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);

    _Block_object_dispose(&v58, 8);
  }
  else
  {
    v18 = 0;
    v14 = v8;
  }

  return v18;
}

+ (id)contactBuffersDecoderForFetchRequest:(id)a3
{
  id v3;
  CNiOSABContactBuffersDecoder *v4;

  v3 = a3;
  v4 = -[CNiOSABContactBuffersDecoder initWithFetchRequest:]([CNiOSABContactBuffersDecoder alloc], "initWithFetchRequest:", v3);

  return v4;
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  if (self)
    self = (CNXPCDataMapper *)self->_authorization;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CNXPCDataMapper_requestAccessForEntityType_completionHandler___block_invoke;
  v8[3] = &unk_1E29F8AF8;
  v9 = v6;
  v7 = v6;
  -[CNXPCDataMapper requestAccessForEntityType:completionHandler:](self, "requestAccessForEntityType:completionHandler:", a3, v8);

}

uint64_t __64__CNXPCDataMapper_requestAccessForEntityType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0D13AF8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairWithFirst:second:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardStateMonitor, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

+ (id)os_log
{
  objc_opt_self();
  if (os_log_cn_once_token_2_1 != -1)
    dispatch_once(&os_log_cn_once_token_2_1, &__block_literal_global_22);
  return (id)os_log_cn_once_object_2_1;
}

void __25__CNXPCDataMapper_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNXPCDataMapper");
  v1 = (void *)os_log_cn_once_object_2_1;
  os_log_cn_once_object_2_1 = (uint64_t)v0;

}

- (CNXPCDataMapper)init
{
  CNDataMapperConfiguration *v3;
  void *v4;
  CNXPCDataMapper *v5;

  v3 = objc_alloc_init(CNDataMapperConfiguration);
  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDataMapperConfiguration setEnvironment:](v3, "setEnvironment:", v4);

  v5 = -[CNXPCDataMapper initWithConfiguration:](self, "initWithConfiguration:", v3);
  return v5;
}

- (id)unifiedContactCountWithError:(id *)a3
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:error:](self, "remoteResultForSelector:error:", sel_unifiedContactCountWithReply_, a3);
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  CNXPCConnection *serviceConnection;
  void *v8;

  if (self)
  {
    ensureFetchRequestHasKeyboardState(a3, self->_keyboardStateMonitor);
    serviceConnection = self->_serviceConnection;
  }
  else
  {
    ensureFetchRequestHasKeyboardState(a3, 0);
    serviceConnection = 0;
  }
  -[CNXPCConnection remoteResultForSelector:param1:error:](serviceConnection, "remoteResultForSelector:param1:error:", sel_contactCountForFetchRequest_withReply_, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  CNXPCDataMapperService *serviceProxy;
  CNXPCDataMapperService *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
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

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  if (self)
    serviceProxy = self->_serviceProxy;
  else
    serviceProxy = 0;
  v7 = serviceProxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__CNXPCDataMapper_sectionListOffsetsForSortOrder_error___block_invoke;
  v11[3] = &unk_1E29F88C8;
  v11[4] = &v18;
  v11[5] = &v12;
  -[CNXPCDataMapperService sectionListOffsetsForSortOrder:reply:](v7, "sectionListOffsetsForSortOrder:reply:", a3, v11);

  v8 = (void *)v19[5];
  if (a4 && !v8)
  {
    *a4 = objc_retainAutorelease((id)v13[5]);
    v8 = (void *)v19[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __56__CNXPCDataMapper_sectionListOffsetsForSortOrder_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (uint64_t)fetchContactsForFetchRequest:(_QWORD *)a3 error:(void *)a4 batchHandler:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__5;
    v27 = __Block_byref_object_dispose__5;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v9 = *(id *)(a1 + 40);
    ensureFetchRequestHasKeyboardState(v7, v9);

    v10 = *(id *)(a1 + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__CNXPCDataMapper_fetchContactsForFetchRequest_error_batchHandler___block_invoke;
    v15[3] = &unk_1E29F8968;
    v17 = &v19;
    v18 = &v23;
    v16 = v8;
    objc_msgSend(v10, "contactsForFetchRequest:withMatchInfoReply:", v7, v15);

    if (!*((_BYTE *)v20 + 24))
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 1, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v24[5];
      v24[5] = v11;

    }
    v13 = (void *)v24[5];
    a1 = v13 == 0;
    if (a3 && v13)
      *a3 = objc_retainAutorelease(v13);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);

  }
  return a1;
}

void __67__CNXPCDataMapper_fetchContactsForFetchRequest_error_batchHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  else
    (*(void (**)(void))(a1[4] + 16))();

}

uint64_t __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceError:", a2);
}

void __91__CNXPCDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a4;
  v8 = v7;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = v7;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else
  {
    v12 = a1[4];
    objc_msgSend(v14, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "matchInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, uint64_t))(v12 + 16))(v12, v11, v13, a3);

  }
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = a3;

}

- (id)identifierWithError:(id *)a3
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:error:](self, "remoteResultForSelector:error:", sel_identifierWithReply_, a3);
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return -[CNXPCDataMapper executeSaveRequest:response:authorizationContext:error:](self, "executeSaveRequest:response:authorizationContext:error:", a3, 0, 0, a4);
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  CNXPCDataMapperService *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v9 = a3;
  v10 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  if (self && self->_serviceConnection)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__CNXPCDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke;
    v18[3] = &unk_1E29F8A58;
    v18[4] = &v35;
    v18[5] = &v31;
    v18[6] = &v25;
    v18[7] = &v19;
    v11 = _Block_copy(v18);
    v12 = self->_serviceProxy;
    -[CNXPCDataMapperService executeSaveRequest:withReply:](v12, "executeSaveRequest:withReply:", v9, v11);

    if (*((_BYTE *)v32 + 24))
    {
      if (*((_BYTE *)v36 + 24))
        objc_msgSend((id)v20[5], "applySnapshotsToSaveRequest:", v9);
    }
    else
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v26[5];
      v26[5] = v13;

      *((_BYTE *)v36 + 24) = 0;
    }
  }
  else
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 100, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v26[5];
    v26[5] = v15;
  }

  v16 = *((unsigned __int8 *)v36 + 24);
  if (a6 && !*((_BYTE *)v36 + 24))
    *a6 = objc_retainAutorelease((id)v26[5]);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v16 != 0;
}

void __74__CNXPCDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  v10 = a4;
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  CNKeyboardStateMonitor *keyboardStateMonitor;
  CNXPCDataMapperProgressiveHandler *v13;
  CNXPCDataMapperService *serviceProxy;
  CNXPCDataMapperService *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  CNXPCDataMapperProgressiveHandler *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!self || !self->_serviceConnection)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 100, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11);

  }
  if (self)
    keyboardStateMonitor = self->_keyboardStateMonitor;
  else
    keyboardStateMonitor = 0;
  ensureFetchRequestHasKeyboardState(v8, keyboardStateMonitor);
  v13 = -[CNXPCDataMapperProgressiveHandler initWithProgressBlock:completionBlock:]([CNXPCDataMapperProgressiveHandler alloc], "initWithProgressBlock:completionBlock:", v9, v10);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  if (self)
    serviceProxy = self->_serviceProxy;
  else
    serviceProxy = 0;
  v15 = serviceProxy;
  v16 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__CNXPCDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke;
  v22[3] = &unk_1E29F8A80;
  v22[4] = &v23;
  -[CNXPCDataMapperService progressiveContactsForFetchRequest:progressHandler:reply:](v15, "progressiveContactsForFetchRequest:progressHandler:reply:", v8, v13, v22);

  if (v24[5])
  {
    objc_msgSend(MEMORY[0x1E0D139B8], "tokenWrappingCancelable:");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __69__CNXPCDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_2;
    v20[3] = &unk_1E29F8508;
    v21 = v13;
    objc_msgSend(v17, "addCancelationBlock:", v20);

  }
  else
  {
    if (v10)
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v18);

    }
    v17 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  }
  _Block_object_dispose(&v23, 8);

  return v17;
}

void __69__CNXPCDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_containersMatchingPredicate_withReply_, a3, a4);
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_serverSearchContainersMatchingPredicate_withReply_, a3, a4);
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  CNPolicyDescription *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(CNPolicyDescription);
  -[CNPolicyDescription setContainerIdentifier:](v7, "setContainerIdentifier:", v6);

  -[CNXPCDataMapper policyWithDescription:error:](self, "policyWithDescription:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v7;
  void *v8;
  void *v9;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v7 = serviceConnection;
  objc_msgSend(a3, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNXPCConnection remoteResultForSelector:param1:error:](v7, "remoteResultForSelector:param1:error:", sel_policyForContainerWithIdentifier_withReply_, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_accountsMatchingPredicate_withReply_, a3, a4);
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_groupsMatchingPredicate_withReply_, a3, a4);
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_subgroupsOfGroupWithIdentifier_withReply_, a3, a4);
}

- (id)defaultContainerIdentifier
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:error:](self, "remoteResultForSelector:error:", sel_defaultContainerIdentifierWithReply_, 0);
}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  void *v4;
  char v5;

  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  -[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_setMeContact_withReply_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  void *v5;
  char v6;

  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  -[CNXPCDataMapper remoteResultForSelector:param1:param2:error:](self, "remoteResultForSelector:param1:param2:error:", sel_setMeContact_forContainer_withReply_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CNXPCConnection *serviceConnection;
  void *v16;
  char v17;

  v10 = (void *)MEMORY[0x1E0CB3868];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "weakObjectsPointerArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addPointer:", v13);

  objc_msgSend(v14, "addPointer:", v12);
  objc_msgSend(v14, "addPointer:", v11);

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  -[CNXPCConnection remoteResultForSelector:parameters:error:](serviceConnection, "remoteResultForSelector:parameters:error:", sel_setBestMeIfNeededForGivenName_familyName_email_withReply_, v14, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  return v17;
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  CNXPCDataMapperService *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  if (self && self->_serviceConnection)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    v17 = 0;
    v8 = self->_serviceProxy;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__CNXPCDataMapper_contactWithUserActivityUserInfo_keysToFetch___block_invoke;
    v11[3] = &unk_1E29F8AA8;
    v11[4] = &v12;
    -[CNXPCDataMapperService contactWithUserActivityUserInfo:keysToFetch:withReply:](v8, "contactWithUserActivityUserInfo:keysToFetch:withReply:", v6, v7, v11);

    v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __63__CNXPCDataMapper_contactWithUserActivityUserInfo_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)userActivityUserInfoForContact:(id)a3
{
  id v4;
  CNXPCDataMapperService *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  if (self && self->_serviceConnection)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__5;
    v13 = __Block_byref_object_dispose__5;
    v14 = 0;
    v5 = self->_serviceProxy;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__CNXPCDataMapper_userActivityUserInfoForContact___block_invoke;
    v8[3] = &unk_1E29F8AD0;
    v8[4] = &v9;
    -[CNXPCDataMapperService userActivityForContact:withReply:](v5, "userActivityForContact:withReply:", v4, v8);

    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __50__CNXPCDataMapper_userActivityUserInfoForContact___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  void *v5;
  char v6;

  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  -[CNXPCDataMapper remoteResultForSelector:param1:param2:error:](self, "remoteResultForSelector:param1:param2:error:", sel_registerChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  void *v5;
  char v6;

  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  -[CNXPCDataMapper remoteResultForSelector:param1:param2:error:](self, "remoteResultForSelector:param1:param2:error:", sel_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_withReply_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_changeHistoryWithFetchRequest_withReply_, a3, a4);
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  void *v4;
  char v5;

  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  -[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_executeChangeHistoryClearRequest_withReply_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)currentHistoryToken
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v8 = 0;
  v3 = serviceConnection;
  -[CNXPCConnection remoteResultForSelector:error:](v3, "remoteResultForSelector:error:", sel_currentHistoryTokenWithReply_, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentHistoryAnchor
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v8 = 0;
  v3 = serviceConnection;
  -[CNXPCConnection remoteResultForSelector:error:](v3, "remoteResultForSelector:error:", sel_currentHistoryAnchorWithReply_, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  objc_msgSend(MEMORY[0x1E0D13B60], "resultWithValue:orError:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)favoritesEntryDictionariesAtPath:(id)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_favoritesEntryDictionariesAtPath_withReply_, a3, a4);
}

- (BOOL)writeFavoritesPropertyListData:(id)a3 toPath:(id)a4 error:(id *)a5
{
  void *v5;
  char v6;

  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  -[CNXPCDataMapper remoteResultForSelector:param1:param2:error:](self, "remoteResultForSelector:param1:param2:error:", sel_writeFavoritesPropertyListData_toPath_withReply_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:error:](self, "remoteResultForSelector:param1:error:", sel_authorizedKeysForContactKeys_withReply_, a3, a4);
}

- (id)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 error:(id *)a5
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:param1:param2:error:](self, "remoteResultForSelector:param1:param2:error:", sel_getBackgroundColorOnImageData_bitmapFormat_withReply_, a3, a4, a5);
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v5;
  void *v6;
  id v7;
  id v9;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v9 = 0;
  v5 = serviceConnection;
  -[CNXPCConnection remoteResultForSelector:param1:error:](v5, "remoteResultForSelector:param1:error:", sel_fetchLimitedAccessContactIdentifiersForBundle_withReply_, a3, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  return v6;
}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v17 = 0;
  v7 = serviceConnection;
  v8 = -[CNXPCConnection remoteResultForSelector:param1:param2:error:](v7, "remoteResultForSelector:param1:param2:error:", sel_addLimitedAccessForBundle_contactIdentifier_withReply_, a3, a4, &v17);
  v9 = v17;

  if (v9)
  {
    objc_opt_class();
    +[CNXPCDataMapper os_log]();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CNXPCDataMapper addLimitedAccessForBundle:contactIdentifier:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v17 = 0;
  v7 = serviceConnection;
  v8 = -[CNXPCConnection remoteResultForSelector:param1:param2:error:](v7, "remoteResultForSelector:param1:param2:error:", sel_removeLimitedAccessForBundle_contactIdentifier_withReply_, a3, a4, &v17);
  v9 = v17;

  if (v9)
  {
    objc_opt_class();
    +[CNXPCDataMapper os_log]();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CNXPCDataMapper removeLimitedAccessForBundle:contactIdentifier:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v15 = 0;
  v5 = serviceConnection;
  v6 = -[CNXPCConnection remoteResultForSelector:param1:error:](v5, "remoteResultForSelector:param1:error:", sel_purgeLimitedAccessRecordsForBundle_withReply_, a3, &v15);
  v7 = v15;

  if (v7)
  {
    objc_opt_class();
    +[CNXPCDataMapper os_log]();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNXPCDataMapper purgeLimitedAccessRecordsForBundle:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v5;
  void *v6;
  id v7;
  id v9;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v9 = 0;
  v5 = serviceConnection;
  -[CNXPCConnection remoteResultForSelector:param1:error:](v5, "remoteResultForSelector:param1:error:", sel_populateSyncTableForLimitedAccessAboveSequenceNumber_withReply_, a3, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  return v6;
}

- (void)updateLimitedAccessTable:(id)a3
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v5;
  id v6;
  id v7;
  id v8;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v8 = 0;
  v5 = serviceConnection;
  v6 = -[CNXPCConnection remoteResultForSelector:param1:error:](v5, "remoteResultForSelector:param1:error:", sel_updateLimitedAccessTable_withReply_, a3, &v8);
  v7 = v8;

}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  return (id)-[CNXPCDataMapper remoteResultForSelector:error:](self, "remoteResultForSelector:error:", sel_getLimitedAccessLastSyncSequenceNumber_, a3);
}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(id)a3
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v5;
  void *v6;
  id v7;
  id v9;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v9 = 0;
  v5 = serviceConnection;
  -[CNXPCConnection remoteResultForSelector:param1:error:](v5, "remoteResultForSelector:param1:error:", sel_getWatchLimitedAccessSyncDataStartingAtSequenceNumber_withReply_, a3, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  return v6;
}

- (void)applyLimitedAccessSyncEvents:(id)a3
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v5;
  id v6;
  id v7;
  id v8;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v8 = 0;
  v5 = serviceConnection;
  v6 = -[CNXPCConnection remoteResultForSelector:param1:error:](v5, "remoteResultForSelector:param1:error:", sel_applyLimitedAccessSyncEvents_withReply_, a3, &v8);
  v7 = v8;

}

- (void)dropAllLimitedAccessRows
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v3;
  id v4;
  id v5;
  id v6;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v6 = 0;
  v3 = serviceConnection;
  v4 = -[CNXPCConnection remoteResultForSelector:error:](v3, "remoteResultForSelector:error:", sel_dropAllLimitedAccessRowsWithReply_, &v6);
  v5 = v6;

}

- (void)dropAllLimitedAccessRowsAndSyncNotify
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v3;
  id v4;
  id v5;
  id v6;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v6 = 0;
  v3 = serviceConnection;
  v4 = -[CNXPCConnection remoteResultForSelector:error:](v3, "remoteResultForSelector:error:", sel_dropAllLimitedAccessRowsAndSyncNotifyWithReply_, &v6);
  v5 = v6;

}

- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3
{
  CNXPCConnection *serviceConnection;
  CNXPCConnection *v5;
  id v6;
  id v7;
  id v8;

  if (self)
    serviceConnection = self->_serviceConnection;
  else
    serviceConnection = 0;
  v8 = 0;
  v5 = serviceConnection;
  v6 = -[CNXPCConnection remoteResultForSelector:param1:error:](v5, "remoteResultForSelector:param1:error:", sel_setLimitedAccessTableCurrentSequenceNumber_withReply_, a3, &v8);
  v7 = v8;

}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  void *v3;
  char v4;

  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  -[CNXPCDataMapper remoteResultForSelector:error:](self, "remoteResultForSelector:error:", sel_shouldAnalyzeDatabaseWithReply_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  void *v3;
  char v4;

  if (self)
    self = (CNXPCDataMapper *)self->_serviceConnection;
  -[CNXPCDataMapper remoteResultForSelector:error:](self, "remoteResultForSelector:error:", sel_analyzeDatabaseWithReply_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

void __52__CNXPCDataMapper_contactObservableForFetchRequest___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Fetch error", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)addLimitedAccessForBundle:(uint64_t)a3 contactIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "addLimitedAccessForBundle error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)removeLimitedAccessForBundle:(uint64_t)a3 contactIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "removeLimitedAccessForBundle error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)purgeLimitedAccessRecordsForBundle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "purgeLimitedAccessRecordsForBundle error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
