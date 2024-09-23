@implementation IMAVConferenceInterface

+ (BOOL)_useMultipleAVConference
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;

  objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_blockMultipleIncomingInvitations(v5, v6, v7, v8, v9))
  {
    objc_msgSend_sharedInstance(IMAVController, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_blockIncomingInvitationsDuringCall(v14, v15, v16, v17, v18))
    {
      objc_msgSend_sharedInstance(IMAVController, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_blockOutgoingInvitationsDuringCall(v23, v24, v25, v26, v27) ^ 1;

    }
    else
    {
      LOBYTE(v28) = 1;
    }

  }
  else
  {
    LOBYTE(v28) = 1;
  }

  return v28;
}

- (IMAVConferenceInterface)init
{
  IMAVConferenceInterface *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  void **v13;
  void *v14;
  void **v15;
  void *v16;
  void **v17;
  void *v18;
  void **v19;
  void *v20;
  void **v21;
  void *v22;
  void **v23;
  void *v24;
  void **v25;
  void *v26;
  void **v27;
  void *v28;
  void **v29;
  void *v30;
  void **v31;
  void *v32;
  void **v33;
  void *v34;
  void **v35;
  void *v36;
  void **v37;
  void *v38;
  void **v39;
  void *v40;
  void **v41;
  void *v42;
  void **v43;
  void *v44;
  void **v45;
  void *v46;
  void **v47;
  void *v48;
  void **v49;
  void *v50;
  void **v51;
  void *v52;
  void **v53;
  void *v54;
  void **v55;
  void *v56;
  void **v57;
  void *v58;
  void **v59;
  void *v60;
  void **v61;
  void *v62;
  void **v63;
  void *v64;
  void **v65;
  void *v66;
  void **v67;
  void *v68;
  void **v69;
  void *v70;
  void **v71;
  void *v72;
  void **v73;
  void *v74;
  void **v75;
  void *v76;
  void **v77;
  void *v78;
  void **v79;
  void *v80;
  void **v81;
  void *v82;
  void **v83;
  void *v84;
  void **v85;
  void *v86;
  NSLock *v87;
  NSLock *avConferencesLock;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  IMAVConferenceInterface *v102;
  objc_super v104;

  v104.receiver = self;
  v104.super_class = (Class)IMAVConferenceInterface;
  v2 = -[IMAVConferenceInterface init](&v104, sel_init);

  if (v2)
  {
    qword_253DE9310 = MEMORY[0x219A282EC](CFSTR("AVConference"), CFSTR("AVConference"));
    qword_253DE9458 = MEMORY[0x219A282EC](CFSTR("VCCapabilities"), CFSTR("AVConference"));
    if (!qword_253DE93B0)
    {
      v7 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_ClientData", CFSTR("AVConference"));
      if (v7)
        v8 = *v7;
      else
        v8 = 0;
      objc_storeStrong((id *)&qword_253DE93B0, v8);
    }
    if (!qword_253DE9418)
    {
      v9 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_SelfNatType", CFSTR("AVConference"));
      if (v9)
        v10 = *v9;
      else
        v10 = 0;
      objc_storeStrong((id *)&qword_253DE9418, v10);
    }
    if (!qword_253DE9408)
    {
      v11 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_SelfBlob", CFSTR("AVConference"));
      if (v11)
        v12 = *v11;
      else
        v12 = 0;
      objc_storeStrong((id *)&qword_253DE9408, v12);
    }
    if (!qword_253DE93D0)
    {
      v13 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_PeerID", CFSTR("AVConference"));
      if (v13)
        v14 = *v13;
      else
        v14 = 0;
      objc_storeStrong((id *)&qword_253DE93D0, v14);
    }
    if (!qword_253DE93D8)
    {
      v15 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_PeerNatType", CFSTR("AVConference"));
      if (v15)
        v16 = *v15;
      else
        v16 = 0;
      objc_storeStrong((id *)&qword_253DE93D8, v16);
    }
    if (!qword_253DE93C0)
    {
      v17 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_PeerBlob", CFSTR("AVConference"));
      if (v17)
        v18 = *v17;
      else
        v18 = 0;
      objc_storeStrong((id *)&qword_253DE93C0, v18);
    }
    if (!qword_253DE9450)
    {
      v19 = (void **)MEMORY[0x219A282F8]("GKSRelayType", CFSTR("AVConference"));
      if (v19)
        v20 = *v19;
      else
        v20 = 0;
      objc_storeStrong((id *)&qword_253DE9450, v20);
    }
    if (!qword_253DE93B8)
    {
      v21 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_ConnectionID", CFSTR("AVConference"));
      if (v21)
        v22 = *v21;
      else
        v22 = 0;
      objc_storeStrong((id *)&qword_253DE93B8, v22);
    }
    if (!qword_253DE9448)
    {
      v23 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_TransactionID", CFSTR("AVConference"));
      if (v23)
        v24 = *v23;
      else
        v24 = 0;
      objc_storeStrong((id *)&qword_253DE9448, v24);
    }
    if (!qword_253DE9440)
    {
      v25 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_Token", CFSTR("AVConference"));
      if (v25)
        v26 = *v25;
      else
        v26 = 0;
      objc_storeStrong((id *)&qword_253DE9440, v26);
    }
    if (!qword_253DE93E0)
    {
      v27 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_PeerRelayIP", CFSTR("AVConference"));
      if (v27)
        v28 = *v27;
      else
        v28 = 0;
      objc_storeStrong((id *)&qword_253DE93E0, v28);
    }
    if (!qword_253DE93F8)
    {
      v29 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_PeerRelayPort", CFSTR("AVConference"));
      if (v29)
        v30 = *v29;
      else
        v30 = 0;
      objc_storeStrong((id *)&qword_253DE93F8, v30);
    }
    if (!qword_253DE9420)
    {
      v31 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_SelfRelayIP", CFSTR("AVConference"));
      if (v31)
        v32 = *v31;
      else
        v32 = 0;
      objc_storeStrong((id *)&qword_253DE9420, v32);
    }
    if (!qword_253DE9438)
    {
      v33 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_SelfRelayPort", CFSTR("AVConference"));
      if (v33)
        v34 = *v33;
      else
        v34 = 0;
      objc_storeStrong((id *)&qword_253DE9438, v34);
    }
    if (!qword_253DE9428)
    {
      v35 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_SelfRelayNatIP", CFSTR("AVConference"));
      if (v35)
        v36 = *v35;
      else
        v36 = 0;
      objc_storeStrong((id *)&qword_253DE9428, v36);
    }
    if (!qword_253DE9430)
    {
      v37 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_SelfRelayNatPort", CFSTR("AVConference"));
      if (v37)
        v38 = *v37;
      else
        v38 = 0;
      objc_storeStrong((id *)&qword_253DE9430, v38);
    }
    if (!qword_253DE93E8)
    {
      v39 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_PeerRelayNatIP", CFSTR("AVConference"));
      if (v39)
        v40 = *v39;
      else
        v40 = 0;
      objc_storeStrong((id *)&qword_253DE93E8, v40);
    }
    if (!qword_253DE93F0)
    {
      v41 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_PeerRelayNatPort", CFSTR("AVConference"));
      if (v41)
        v42 = *v41;
      else
        v42 = 0;
      objc_storeStrong((id *)&qword_253DE93F0, v42);
    }
    if (!qword_253DE9400)
    {
      v43 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_RemotePrimaryId", CFSTR("AVConference"));
      if (v43)
        v44 = *v43;
      else
        v44 = 0;
      objc_storeStrong((id *)&qword_253DE9400, v44);
    }
    if (!qword_253DE9410)
    {
      v45 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_SelfExternalAddr", CFSTR("AVConference"));
      if (v45)
        v46 = *v45;
      else
        v46 = 0;
      objc_storeStrong((id *)&qword_253DE9410, v46);
    }
    if (!qword_253DE93C8)
    {
      v47 = (void **)MEMORY[0x219A282F8]("GKSRelayParameter_PeerExternalAddr", CFSTR("AVConference"));
      if (v47)
        v48 = *v47;
      else
        v48 = 0;
      objc_storeStrong((id *)&qword_253DE93C8, v48);
    }
    if (!qword_253DE9360)
    {
      v49 = (void **)MEMORY[0x219A282F8]("GKSDidStartParameter_ConnType", CFSTR("AVConference"));
      if (v49)
        v50 = *v49;
      else
        v50 = 0;
      objc_storeStrong((id *)&qword_253DE9360, v50);
    }
    if (!qword_253DE9368)
    {
      v51 = (void **)MEMORY[0x219A282F8]("GKSDidStartParameter_Error", CFSTR("AVConference"));
      if (v51)
        v52 = *v51;
      else
        v52 = 0;
      objc_storeStrong((id *)&qword_253DE9368, v52);
    }
    if (!qword_253DE9358)
    {
      v53 = (void **)MEMORY[0x219A282F8]("GKSDidStartParameter_CallID", CFSTR("AVConference"));
      if (v53)
        v54 = *v53;
      else
        v54 = 0;
      objc_storeStrong((id *)&qword_253DE9358, v54);
    }
    if (!qword_253DE9370)
    {
      v55 = (void **)MEMORY[0x219A282F8]("GKSDidStartParameter_localUseCell", CFSTR("AVConference"));
      if (v55)
        v56 = *v55;
      else
        v56 = 0;
      objc_storeStrong((id *)&qword_253DE9370, v56);
    }
    if (!qword_253DE9378)
    {
      v57 = (void **)MEMORY[0x219A282F8]("GKSDidStartParameter_remoteUseCell", CFSTR("AVConference"));
      if (v57)
        v58 = *v57;
      else
        v58 = 0;
      objc_storeStrong((id *)&qword_253DE9378, v58);
    }
    if (!qword_253DE9318)
    {
      v59 = (void **)MEMORY[0x219A282F8]("GKSCDXServerAddress", CFSTR("AVConference"));
      if (v59)
        v60 = *v59;
      else
        v60 = 0;
      objc_storeStrong((id *)&qword_253DE9318, v60);
    }
    if (!qword_253DE9320)
    {
      v61 = (void **)MEMORY[0x219A282F8]("GKSCommNATServerCohortAddress", CFSTR("AVConference"));
      if (v61)
        v62 = *v61;
      else
        v62 = 0;
      objc_storeStrong((id *)&qword_253DE9320, v62);
    }
    if (!qword_253DE9330)
    {
      v63 = (void **)MEMORY[0x219A282F8]("GKSCommNATServerMain0Address", CFSTR("AVConference"));
      if (v63)
        v64 = *v63;
      else
        v64 = 0;
      objc_storeStrong((id *)&qword_253DE9330, v64);
    }
    if (!qword_253DE9340)
    {
      v65 = (void **)MEMORY[0x219A282F8]("GKSCommNATServerMain1Address", CFSTR("AVConference"));
      if (v65)
        v66 = *v65;
      else
        v66 = 0;
      objc_storeStrong((id *)&qword_253DE9340, v66);
    }
    if (!qword_253DE9328)
    {
      v67 = (void **)MEMORY[0x219A282F8]("GKSCommNATServerCohortName", CFSTR("AVConference"));
      if (v67)
        v68 = *v67;
      else
        v68 = 0;
      objc_storeStrong((id *)&qword_253DE9328, v68);
    }
    if (!qword_253DE9338)
    {
      v69 = (void **)MEMORY[0x219A282F8]("GKSCommNATServerMain0Name", CFSTR("AVConference"));
      if (v69)
        v70 = *v69;
      else
        v70 = 0;
      objc_storeStrong((id *)&qword_253DE9338, v70);
    }
    if (!qword_253DE9348)
    {
      v71 = (void **)MEMORY[0x219A282F8]("GKSCommNATServerMain1Name", CFSTR("AVConference"));
      if (v71)
        v72 = *v71;
      else
        v72 = 0;
      objc_storeStrong((id *)&qword_253DE9348, v72);
    }
    if (!qword_253DE93A8)
    {
      v73 = (void **)MEMORY[0x219A282F8]("GKSPreEmptiveRelayTimeout", CFSTR("AVConference"));
      if (v73)
        v74 = *v73;
      else
        v74 = 0;
      objc_storeStrong((id *)&qword_253DE93A8, v74);
    }
    if (!qword_253DE9388)
    {
      v75 = (void **)MEMORY[0x219A282F8]("GKSMaxRelayBitrate", CFSTR("AVConference"));
      if (v75)
        v76 = *v75;
      else
        v76 = 0;
      objc_storeStrong((id *)&qword_253DE9388, v76);
    }
    if (!qword_253DE9380)
    {
      v77 = (void **)MEMORY[0x219A282F8]("GKSICETimeout", CFSTR("AVConference"));
      if (v77)
        v78 = *v77;
      else
        v78 = 0;
      objc_storeStrong((id *)&qword_253DE9380, v78);
    }
    if (!qword_253DE9390)
    {
      v79 = (void **)MEMORY[0x219A282F8]("GKSNATCheckTimeout", CFSTR("AVConference"));
      if (v79)
        v80 = *v79;
      else
        v80 = 0;
      objc_storeStrong((id *)&qword_253DE9390, v80);
    }
    if (!qword_253DE9350)
    {
      v81 = (void **)MEMORY[0x219A282F8]("GKSConnectionBlobMaxBytes", CFSTR("AVConference"));
      if (v81)
        v82 = *v81;
      else
        v82 = 0;
      objc_storeStrong((id *)&qword_253DE9350, v82);
    }
    if (!qword_253DE93A0)
    {
      v83 = (void **)MEMORY[0x219A282F8]("GKSNoRemotePacketsTimeout", CFSTR("AVConference"));
      if (v83)
        v84 = *v83;
      else
        v84 = 0;
      objc_storeStrong((id *)&qword_253DE93A0, v84);
    }
    if (!qword_253DE9398)
    {
      v85 = (void **)MEMORY[0x219A282F8]("GKSNetworkConditionsTimeout", CFSTR("AVConference"));
      if (v85)
        v86 = *v85;
      else
        v86 = 0;
      objc_storeStrong((id *)&qword_253DE9398, v86);
    }
    v2->_duringInit = 1;
    objc_msgSend_initAVInterface(v2, v3, v4, v5, v6);
    v2->_duringInit = 0;
    v87 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    avConferencesLock = v2->_avConferencesLock;
    v2->_avConferencesLock = v87;

    objc_msgSend_sharedInstance(MEMORY[0x24BE502D0], v89, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_listener(v93, v94, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addHandler_(v98, v99, (uint64_t)v2, v100, v101);

  }
  v102 = v2;

  return v102;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  objc_msgSend_stopPreview(self, a2, v2, v3, v4);
  objc_msgSend_makeObjectsPerformSelector_withObject_(self->_avConferencesToCleanup, v6, (uint64_t)sel_setDelegate_, 0, v7);
  objc_msgSend_lock(self->_avConferencesLock, v8, v9, v10, v11);
  objc_msgSend_allValues(self->_avConferences, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeObjectsPerformSelector_withObject_(v16, v17, (uint64_t)sel_setDelegate_, 0, v18);
  objc_msgSend_unlock(self->_avConferencesLock, v19, v20, v21, v22);

  v23.receiver = self;
  v23.super_class = (Class)IMAVConferenceInterface;
  -[IMAVInterface dealloc](&v23, sel_dealloc);
}

- (id)_faceTimeUUID
{
  if (qword_25503B958 != -1)
    dispatch_once(&qword_25503B958, &unk_24DA578B0);
  return (id)qword_25503B950;
}

- (void)_configureAVConference:(id)a3 forChat:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_nonWifiFaceTimeAvailable(v10, v11, v12, v13, v14);

  objc_msgSend_setRequiresWifi_(v5, v16, v15 ^ 1u, v17, v18);
  sub_2190076D0();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("YES");
    if (v15)
      v20 = CFSTR("NO");
    v24 = 138412290;
    v25 = v20;
    _os_log_impl(&dword_218FEA000, v19, OS_LOG_TYPE_DEFAULT, "Requires wifi: %@", (uint8_t *)&v24, 0xCu);
  }

  objc_msgSend_setDelegate_(v5, v21, (uint64_t)self, v22, v23);
}

- (BOOL)_hasAVConferenceObjectsForChatsOtherThan:(id)a3
{
  NSLock *avConferencesLock;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *avConferences;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;

  avConferencesLock = self->_avConferencesLock;
  v5 = a3;
  objc_msgSend_lock(avConferencesLock, v6, v7, v8, v9);
  avConferences = self->_avConferences;
  objc_msgSend_GUID(v5, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(avConferences, v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v19 && (unint64_t)objc_msgSend_count(self->_avConferences, v20, v21, v22, v23) > 1
     || objc_msgSend_count(self->_avConferences, v20, v21, v22, v23) != 0;
  objc_msgSend_unlock(self->_avConferencesLock, v20, v21, v22, v23);
  return v24;
}

- (id)_existingConferenceForAVChat:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableDictionary *avConferences;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_faceTimeSupported(v9, v10, v11, v12, v13);

  v19 = 0;
  if (v4)
  {
    if (v14)
    {
      objc_msgSend_GUID(v4, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend_lock(self->_avConferencesLock, v20, v21, v22, v23);
        avConferences = self->_avConferences;
        objc_msgSend_GUID(v4, v25, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(avConferences, v30, (uint64_t)v29, v31, v32);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_unlock(self->_avConferencesLock, v33, v34, v35, v36);
      }
    }
  }

  return v19;
}

- (id)_existingConferenceForAVChatGUID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_faceTimeSupported(v9, v10, v11, v12, v13);

  if (v14)
  {
    objc_msgSend_lock(self->_avConferencesLock, v15, v16, v17, v18);
    objc_msgSend_objectForKey_(self->_avConferences, v19, (uint64_t)v4, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(self->_avConferencesLock, v23, v24, v25, v26);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_conferenceForAVChat:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableDictionary *avConferences;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSMutableDictionary *v63;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD block[4];
  id v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_faceTimeSupported(v9, v10, v11, v12, v13);

  v19 = 0;
  if (v4 && v14)
  {
    objc_msgSend_GUID(v4, v15, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend_lock(self->_avConferencesLock, v21, v22, v23, v24);
      avConferences = self->_avConferences;
      objc_msgSend_GUID(v4, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(avConferences, v31, (uint64_t)v30, v32, v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_unlock(self->_avConferencesLock, v34, v35, v36, v37);
      if (!v19)
      {
        objc_msgSend__faceTimeUUID(self, v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2190076D0();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v42;
          _os_log_impl(&dword_218FEA000, v43, OS_LOG_TYPE_DEFAULT, "Initializing conference with UUID %@", buf, 0xCu);
        }

        v44 = objc_alloc((Class)qword_253DE9310);
        objc_msgSend__faceTimeUUID(self, v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend_initWithClientUUID_transportType_(v44, v50, (uint64_t)v49, 0, v51);

        sub_2190076D0();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v77 = v19;
          v78 = 2112;
          v79 = v4;
          _os_log_impl(&dword_218FEA000, v52, OS_LOG_TYPE_DEFAULT, "Created AVConference Instance: %@ for chat: %@", buf, 0x16u);
        }

        if (v19)
        {
          objc_msgSend__configureAVConference_forChat_(self, v53, (uint64_t)v19, (uint64_t)v4, v54);
          objc_msgSend_lock(self->_avConferencesLock, v55, v56, v57, v58);
          v63 = self->_avConferences;
          if (!v63)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v65 = self->_avConferences;
            self->_avConferences = Mutable;

            v63 = self->_avConferences;
          }
          objc_msgSend_GUID(v4, v59, v60, v61, v62);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v63, v67, (uint64_t)v19, (uint64_t)v66, v68);

          objc_msgSend_unlock(self->_avConferencesLock, v69, v70, v71, v72);
        }
        else
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = sub_2190116CC;
          block[3] = &unk_24DA57828;
          v75 = v4;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

        }
      }
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (id)_avChatForConference:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int isEqualToString;
  id v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  IMAVConferenceInterface *v45;
  void *v46;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_lock(self->_avConferencesLock, v5, v6, v7, v8);
  v45 = self;
  v46 = v4;
  objc_msgSend_allKeysForObject_(self->_avConferences, v9, (uint64_t)v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__avChatArray(IMAVChat, v13, v14, v15, v16);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v12;
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v55, (uint64_t)v60, 16);
  v18 = 0;
  if (v50)
  {
    v48 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v21 = v49;
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v51, (uint64_t)v59, 16);
        if (v23)
        {
          v28 = v23;
          v29 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v52 != v29)
                objc_enumerationMutation(v21);
              v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend_GUID(v31, v24, v25, v26, v27);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v32, v33, v20, v34, v35);

              if (isEqualToString)
              {
                v37 = v31;

                v18 = v37;
              }
            }
            v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v51, (uint64_t)v59, 16);
          }
          while (v28);
        }

      }
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v55, (uint64_t)v60, 16);
    }
    while (v50);
  }

  objc_msgSend_unlock(v45->_avConferencesLock, v39, v40, v41, v42);
  v43 = v18;

  return v43;
}

- (id)_imAVChatParticipantForConference:(id)a3 callID:(int64_t)a4 errorString:(id)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend__avChatForConference_callID_errorString_(self, a2, (uint64_t)a3, a4, (uint64_t)a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantWithAVConferenceCallID_(v6, v7, a4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_avChatForConference:(id)a3 callID:(int64_t)a4 errorString:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *i;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int AppBooleanValue;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  id v70;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  int v79;
  __int16 v80;
  int v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend__avChatForConference_(self, v9, (uint64_t)a3, v10, v11);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_25;
  objc_msgSend__chatListLock(IMAVChat, v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v17, v18, v19, v20, v21);

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend__chatList(IMAVChat, v22, v23, v24, v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v72, (uint64_t)v82, 16);
  if (v16)
  {
    v31 = *(_QWORD *)v73;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v31)
          objc_enumerationMutation(v26);
        v33 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        objc_msgSend_participantWithAVConferenceCallID_(v33, v28, a4, v29, v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v16 = v33;
          goto LABEL_12;
        }
      }
      v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v72, (uint64_t)v82, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_12:

  objc_msgSend__chatListLock(IMAVChat, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v39, v40, v41, v42, v43);

  if (a4)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("alwaysFixCallIDs"), CFSTR("com.apple.conference"), 0);
    if (v16 || !AppBooleanValue)
      goto LABEL_22;
LABEL_17:
    sub_2190076D0();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v77 = v8;
      v78 = 1024;
      v79 = a4;
      _os_log_impl(&dword_218FEA000, v45, OS_LOG_TYPE_DEFAULT, "%@: Found no conference for CallID: %d  fixing this...", buf, 0x12u);
    }

    objc_msgSend__connectedChat(IMAVChat, v46, v47, v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v50;
    if (!v50)
    {
      objc_msgSend__activeChat(IMAVChat, v51, v52, v53, v54);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend__avChatArray(IMAVChat, v55, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v59, v60, v61, v62, v63);
        v16 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    goto LABEL_22;
  }
  if (!v16)
    goto LABEL_17;
LABEL_22:
  sub_2190076D0();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v69 = objc_msgSend__bustedCallID(v16, v65, v66, v67, v68);
    *(_DWORD *)buf = 138412802;
    v77 = v16;
    v78 = 1024;
    v79 = v69;
    v80 = 1024;
    v81 = a4;
    _os_log_impl(&dword_218FEA000, v64, OS_LOG_TYPE_DEFAULT, "_avChatForConference Found chat: %@ (%d) for callID: %d", buf, 0x18u);
  }

LABEL_25:
  v70 = v16;

  return v70;
}

- (int)_deviceRoleForAVChat:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (objc_msgSend_isRelayed(a3, a2, (uint64_t)a3, v3, v4))
    return 3;
  else
    return 0;
}

- (void)_cleanupAVInterface
{
  NSObject *v3;
  const char *v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  NSMutableArray *avConferencesToCleanup;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  NSMutableArray *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Cleanup AV Interfaces", buf, 2u);
  }

  self->_pendingCleanup = 0;
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x24BEDCDF0], v4, (uint64_t)self, (uint64_t)sel__cleanupAVInterface, 0);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_avConferencesToCleanup;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v28, (uint64_t)v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v11 = *(NSMutableArray **)(*((_QWORD *)&v28 + 1) + 8 * i);
        sub_2190076D0();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v11;
          _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "Unsetting delegate for AVConference: %@", buf, 0xCu);
        }

        objc_msgSend_setDelegate_(v11, v13, 0, v14, v15);
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v28, (uint64_t)v34, 16);
    }
    while (v8);
  }

  sub_2190076D0();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    avConferencesToCleanup = self->_avConferencesToCleanup;
    *(_DWORD *)buf = 138412290;
    v33 = avConferencesToCleanup;
    _os_log_impl(&dword_218FEA000, v17, OS_LOG_TYPE_DEFAULT, "Releasing AVConferences: %@", buf, 0xCu);
  }

  objc_msgSend_removeAllObjects(self->_avConferencesToCleanup, v19, v20, v21, v22);
  if (!objc_msgSend_count(self->_avConferencesToCleanup, v23, v24, v25, v26))
  {
    v27 = self->_avConferencesToCleanup;
    self->_avConferencesToCleanup = 0;

  }
}

- (void)_queueAVConferenceForCleanup:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *avConferencesToCleanup;
  NSMutableArray *v15;
  NSMutableArray *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSMutableDictionary *avConferences;
  int v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = objc_msgSend__useMultipleAVConference(IMAVConferenceInterface, v5, v6, v7, v8);
  if (v4 && v9)
  {
    sub_2190076D0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v48 = 138412290;
      v49 = v4;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Queue AVConference for cleanup: %@", (uint8_t *)&v48, 0xCu);
    }

    avConferencesToCleanup = self->_avConferencesToCleanup;
    if (!avConferencesToCleanup)
    {
      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v16 = self->_avConferencesToCleanup;
      self->_avConferencesToCleanup = v15;

      avConferencesToCleanup = self->_avConferencesToCleanup;
    }
    objc_msgSend_addObject_(avConferencesToCleanup, v11, (uint64_t)v4, v12, v13);
    objc_msgSend_setDelegate_(v4, v17, 0, v18, v19);
    self->_pendingCleanup = 1;
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x24BEDCDF0], v20, (uint64_t)self, (uint64_t)sel__cleanupAVInterface, 0);
    objc_msgSend_performSelector_withObject_afterDelay_(self, v21, (uint64_t)sel__cleanupAVInterface, 0, v22, 5.0);
    objc_msgSend_lock(self->_avConferencesLock, v23, v24, v25, v26);
    objc_msgSend_allKeysForObject_(self->_avConferences, v27, (uint64_t)v4, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v30, v31, v32, v33, v34))
    {
      sub_2190076D0();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v48 = 138412290;
        v49 = v4;
        _os_log_impl(&dword_218FEA000, v39, OS_LOG_TYPE_DEFAULT, "Removing AVConference from available conference sets: %@", (uint8_t *)&v48, 0xCu);
      }

      objc_msgSend_removeObjectsForKeys_(self->_avConferences, v40, (uint64_t)v30, v41, v42);
    }
    if (!objc_msgSend_count(self->_avConferences, v35, v36, v37, v38))
    {
      avConferences = self->_avConferences;
      self->_avConferences = 0;

    }
    objc_msgSend_unlock(self->_avConferencesLock, v43, v44, v45, v46);

  }
}

- (void)initAVInterface
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  objc_super v21;
  uint8_t buf[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Init AV Interface", buf, 2u);
  }

  v21.receiver = self;
  v21.super_class = (Class)IMAVConferenceInterface;
  -[IMAVInterface initAVInterface](&v21, sel_initAVInterface);
  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_faceTimeSupported(v8, v9, v10, v11, v12);

  if ((v13 & 1) != 0)
  {
    if (self->_duringInit)
      return;
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v18, v19, (uint64_t)CFSTR("__kIMAVInterfaceReadyNotification"), 0, v20);
  }
  else
  {
    sub_2190076D0();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v18, OS_LOG_TYPE_DEFAULT, "Unsupported on this device, not initing", buf, 2u);
    }
  }

}

- (BOOL)isAVInterfaceReady
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_faceTimeSupported(v5, v6, v7, v8, v9);

  return 1;
}

- (void)_conferenceEnded:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "chat: %@", buf, 0xCu);
  }

  objc_msgSend_avChat_endConferenceForUserID_(self, v6, (uint64_t)v4, 0, v7);
  v15.receiver = self;
  v15.super_class = (Class)IMAVConferenceInterface;
  -[IMAVInterface _conferenceEnded:](&v15, sel__conferenceEnded_, v4);
  objc_msgSend__existingConferenceForAVChat_(self, v8, (uint64_t)v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__queueAVConferenceForCleanup_(self, v12, (uint64_t)v11, v13, v14);

}

- (BOOL)isMuteForAVChat:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char isMicrophoneMuted;
  NSObject *v24;
  uint8_t v26[16];

  v4 = a3;
  v9 = v4;
  if (!v4)
  {
    sub_2190076D0();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "No avChat", v26, 2u);
    }

    goto LABEL_9;
  }
  if (objc_msgSend__bustedCallID(v4, v5, v6, v7, v8) < 1)
  {
LABEL_9:
    isMicrophoneMuted = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend_isAVInterfaceReady(self, v10, v11, v12, v13) & 1) == 0)
    objc_msgSend_initAVInterface(self, v14, v15, v16, v17);
  objc_msgSend__existingConferenceForAVChat_(self, v14, (uint64_t)v9, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isMicrophoneMuted = objc_msgSend_isMicrophoneMuted(v18, v19, v20, v21, v22);

LABEL_10:
  return isMicrophoneMuted;
}

- (void)avChat:(id)a3 setMute:(BOOL)a4
{
  _BOOL8 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (v10)
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v6, v7, v8, v9) & 1) == 0)
      objc_msgSend_initAVInterface(self, v11, v12, v13, v14);
    sub_2190076D0();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("NO");
      if (v4)
        v16 = CFSTR("YES");
      v28 = 138412546;
      v29 = v10;
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "Setting %@ to muted: %@", (uint8_t *)&v28, 0x16u);
    }

    if (objc_msgSend_state(v10, v17, v18, v19, v20) >= 5)
      objc_msgSend__conferenceForAVChat_(self, v21, 0, v22, v23);
    else
      objc_msgSend__conferenceForAVChat_(self, v21, (uint64_t)v10, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMicrophoneMuted_(v24, v25, v4, v26, v27);
  }
  else
  {
    sub_2190076D0();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "No avChat", (uint8_t *)&v28, 2u);
    }
  }

}

- (BOOL)isPausedForAVChat:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_isSendingVideoForAVChat_(self, a2, (uint64_t)a3, v3, v4) ^ 1;
}

- (void)avChat:(id)a3 setPaused:(BOOL)a4
{
  uint64_t v4;

  objc_msgSend_avChat_setSendingVideo_(self, a2, (uint64_t)a3, !a4, v4);
}

- (BOOL)isSendingAudioForAVChat:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  char v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  BOOL v34;
  id v36;
  char v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = v4;
  if (v4)
  {
    if (objc_msgSend__bustedCallID(v4, v5, v6, v7, v8) < 1)
    {
      v34 = 1;
      goto LABEL_17;
    }
    if ((objc_msgSend_isAVInterfaceReady(self, v10, v11, v12, v13) & 1) == 0)
      objc_msgSend_initAVInterface(self, v14, v15, v16, v17);
    objc_msgSend__existingConferenceForAVChat_(self, v14, (uint64_t)v9, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v23 = objc_msgSend__bustedCallID(v9, v19, v20, v21, v22);
    v36 = 0;
    v25 = objc_msgSend_getIsAudioPaused_callID_error_(v18, v24, (uint64_t)&v37, v23, (uint64_t)&v36);
    v26 = v36;
    if ((v25 & 1) == 0)
    {
      sub_2190076D0();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v26;
        _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to get audio sending state: %@", buf, 0xCu);
      }

      v37 = 0;
    }
    sub_2190076D0();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend__bustedCallID(v9, v29, v30, v31, v32);
      *(_DWORD *)buf = 138412802;
      v39 = v9;
      v40 = 1024;
      v41 = v33;
      v42 = 1024;
      v43 = v37 == 0;
      _os_log_impl(&dword_218FEA000, v28, OS_LOG_TYPE_DEFAULT, "isSendingAudioFor: %@   callID: %d returning %d", buf, 0x18u);
    }

    v34 = v37 == 0;
  }
  else
  {
    sub_2190076D0();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v18, OS_LOG_TYPE_DEFAULT, "No avChat", buf, 2u);
    }
    v34 = 0;
  }

LABEL_17:
  return v34;
}

- (void)avChat:(id)a3 setSendingAudio:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  char v35;
  id v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v4 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (v10)
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v6, v7, v8, v9) & 1) == 0)
      objc_msgSend_initAVInterface(self, v11, v12, v13, v14);
    sub_2190076D0();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v46 = v10;
      v47 = 2112;
      v48 = v20;
      v49 = 1024;
      v50 = objc_msgSend__bustedCallID(v10, v16, v17, v18, v19);
      _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "Setting %@ to sending audio: %@  callID: %d", buf, 0x1Cu);
    }

    if (objc_msgSend_state(v10, v21, v22, v23, v24) >= 5)
      objc_msgSend__conferenceForAVChat_(self, v25, 0, v26, v27);
    else
      objc_msgSend__conferenceForAVChat_(self, v25, (uint64_t)v10, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend__bustedCallID(v10, v29, v30, v31, v32);
    v44 = 0;
    v35 = objc_msgSend_setPauseAudio_callID_error_(v28, v34, !v4, v33, (uint64_t)&v44);
    v36 = v44;
    if ((v35 & 1) == 0)
    {
      sub_2190076D0();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v42 = objc_msgSend__bustedCallID(v10, v38, v39, v40, v41);
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v42;
        _os_log_impl(&dword_218FEA000, v37, OS_LOG_TYPE_DEFAULT, "[WARN] Could not pause video for callID: %d", buf, 8u);
      }

    }
    if (v36)
    {
      sub_2190076D0();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v36;
        _os_log_impl(&dword_218FEA000, v43, OS_LOG_TYPE_DEFAULT, "[WARN] Error pausing video: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    sub_2190076D0();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v28, OS_LOG_TYPE_DEFAULT, "No avChat", buf, 2u);
    }
  }

}

- (BOOL)isSendingVideoForAVChat:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  int v37;
  id v38;
  BOOL v39;
  NSObject *v40;
  id v42;
  char v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = v4;
  if (!v4)
  {
    sub_2190076D0();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v30, OS_LOG_TYPE_DEFAULT, "No avChat", buf, 2u);
    }
    v39 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend__bustedCallID(v4, v5, v6, v7, v8) < 1)
  {
    v39 = 1;
  }
  else
  {
    if (objc_msgSend_isVideo(v9, v10, v11, v12, v13))
    {
      if ((objc_msgSend_isAVInterfaceReady(self, v14, v15, v16, v17) & 1) == 0)
        objc_msgSend_initAVInterface(self, v18, v19, v20, v21);
      sub_2190076D0();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v45 = v9;
        v46 = 1024;
        v47 = objc_msgSend__bustedCallID(v9, v23, v24, v25, v26);
        _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "isSendingVideoFor: %@   callID: %d", buf, 0x12u);
      }

      objc_msgSend__existingConferenceForAVChat_(self, v27, (uint64_t)v9, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v35 = objc_msgSend__bustedCallID(v9, v31, v32, v33, v34);
      v42 = 0;
      v37 = objc_msgSend_getIsVideoPaused_callID_error_(v30, v36, (uint64_t)&v43, v35, (uint64_t)&v42);
      v38 = v42;
      if (v37)
      {
        v39 = v43 == 0;
      }
      else
      {
        sub_2190076D0();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v38;
          _os_log_impl(&dword_218FEA000, v40, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to get video sending state: %@", buf, 0xCu);
        }

        v39 = 1;
      }

LABEL_19:
      goto LABEL_20;
    }
    v39 = 0;
  }
LABEL_20:

  return v39;
}

- (void)avChat:(id)a3 setSendingVideo:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  int v53;
  void *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v4 = a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v11 = v6;
  if (!v6)
  {
    sub_2190076D0();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_218FEA000, v33, OS_LOG_TYPE_DEFAULT, "No avChat", (uint8_t *)&v53, 2u);
    }
    goto LABEL_23;
  }
  if (objc_msgSend_isVideo(v6, v7, v8, v9, v10))
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v12, v13, v14, v15) & 1) == 0)
      objc_msgSend_initAVInterface(self, v16, v17, v18, v19);
    sub_2190076D0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v53 = 138412802;
      v54 = v11;
      v55 = 2112;
      v56 = v25;
      v57 = 1024;
      v58 = objc_msgSend__bustedCallID(v11, v21, v22, v23, v24);
      _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "Setting %@ to sending video: %@  callID: %d", (uint8_t *)&v53, 0x1Cu);
    }

    if (objc_msgSend_state(v11, v26, v27, v28, v29) >= 5)
      objc_msgSend__conferenceForAVChat_(self, v30, 0, v31, v32);
    else
      objc_msgSend__conferenceForAVChat_(self, v30, (uint64_t)v11, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_state(v11, v34, v35, v36, v37) <= 3)
    {
      if (v4)
      {
        objc_msgSend_isSendingVideoExpected(self, v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
          objc_msgSend_setSendingVideoExpected_(self, v38, 0, v40, v41);
      }
      else
      {
        sub_2190076D0();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v53 = 67109120;
          LODWORD(v54) = 0;
          _os_log_impl(&dword_218FEA000, v43, OS_LOG_TYPE_DEFAULT, "Attempted to pause AVConference's video before being connected, setting sendingVideoExpected to %d", (uint8_t *)&v53, 8u);
        }

        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v44, 0, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSendingVideoExpected_(self, v48, (uint64_t)v47, v49, v50);

      }
    }
    v51 = objc_msgSend__bustedCallID(v11, v38, v39, v40, v41);
    objc_msgSend_conference_callID_setPauseVideo_(self, v52, (uint64_t)v33, v51, !v4);
LABEL_23:

  }
}

- (void)conference:(id)a3 callID:(int64_t)a4 setPauseVideo:(BOOL)a5
{
  int v5;
  char v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v5 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v6 = objc_msgSend_setPauseVideo_callID_error_(a3, a2, a5, a4, (uint64_t)&v10);
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v5;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not pause video for callID: %d", buf, 8u);
    }

  }
  if (v7)
  {
    sub_2190076D0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Error pausing video: %@", buf, 0xCu);
    }

  }
}

- (unint64_t)capabilities
{
  return 917504;
}

- (BOOL)startPreviewWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_faceTimeSupported(v6, v7, v8, v9, v10);

  if (v11)
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v12, v13, v14, v15) & 1) == 0)
      objc_msgSend_initAVInterface(self, v16, v17, v18, v19);
    objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startPreview(v20, v21, v22, v23, v24);

  }
  return v11;
}

- (BOOL)stopPreview
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopPreview(v5, v6, v7, v8, v9);

  return 1;
}

- (int)endConferenceForAVChat:(id)a3
{
  uint64_t v3;

  return objc_msgSend_avChat_endConferenceForUserID_(self, a2, (uint64_t)a3, 0, v3);
}

- (void)endAVConferenceWithChat:(id)a3 callID:(int64_t)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_msgSend_GUID(a3, a2, (uint64_t)a3, a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__existingConferenceForAVChatGUID_(self, v8, (uint64_t)v7, v9, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stopCallID_(v14, v11, a4, v12, v13);
}

- (void)_avChatDealloc:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  int v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend__conferenceQueue(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      sub_2190076D0();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_GUID(v9, v12, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v76 = v16;
        v77 = 1024;
        v78 = objc_msgSend__bustedCallID(v9, v17, v18, v19, v20);
        _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "DEALLOC AVChat with guid: %@  callID: %d", buf, 0x12u);

      }
      sub_2190076D0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v76 = v9;
        _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "chat: %@", buf, 0xCu);
      }

      objc_msgSend_GUID(v9, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__existingConferenceForAVChatGUID_(self, v27, (uint64_t)v26, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v64 = v9;
      objc_msgSend_remoteParticipants(v9, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v69, (uint64_t)v74, 16);
      if (v37)
      {
        v42 = v37;
        v43 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v70 != v43)
              objc_enumerationMutation(v35);
            v45 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            objc_msgSend__participantsCallInfo(v45, v38, v39, v40, v41);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v65, (uint64_t)v73, 16);
            if (v48)
            {
              v52 = v48;
              v53 = *(_QWORD *)v66;
              do
              {
                for (j = 0; j != v52; ++j)
                {
                  if (*(_QWORD *)v66 != v53)
                    objc_enumerationMutation(v46);
                  v55 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
                  objc_msgSend_setState_(v55, v49, 4, v50, v51);
                  v60 = objc_msgSend_callID(v55, v56, v57, v58, v59);
                  objc_msgSend_stopCallID_(v30, v61, v60, v62, v63);
                }
                v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v65, (uint64_t)v73, 16);
              }
              while (v52);
            }

          }
          v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v69, (uint64_t)v74, 16);
        }
        while (v42);
      }

      v9 = v64;
    }
  }

}

- (int)avChat:(id)a3 endConferenceForUserID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int shouldRunACConferences;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  id v97;
  __int16 v98;
  id v99;
  __int16 v100;
  int v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v11 = a4;
  if (!v6)
    goto LABEL_25;
  objc_msgSend_sharedInstance(IMAVController, v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend__shouldRunConferences(v12, v13, v14, v15, v16))
  {
    objc_msgSend_sharedInstance(IMAVController, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v21, v22, v23, v24, v25);

    if (shouldRunACConferences)
      goto LABEL_5;
LABEL_25:
    v82 = 0;
    goto LABEL_28;
  }

LABEL_5:
  sub_2190076D0();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v97 = v6;
    v98 = 2112;
    v99 = v11;
    _os_log_impl(&dword_218FEA000, v27, OS_LOG_TYPE_DEFAULT, "chat: %@  userID: %@", buf, 0x16u);
  }

  objc_msgSend__existingConferenceForAVChat_(self, v28, (uint64_t)v6, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v84 = v11;
    sub_2190076D0();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_otherIMHandle(v6, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ID(v37, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend__bustedCallID(v6, v43, v44, v45, v46);
      *(_DWORD *)buf = 138412802;
      v97 = v42;
      v98 = 2112;
      v99 = v31;
      v100 = 1024;
      v101 = v47;
      _os_log_impl(&dword_218FEA000, v32, OS_LOG_TYPE_DEFAULT, "Stopping AVConference with: %@ (%@)  callID: %d", buf, 0x1Cu);

    }
    objc_msgSend_updateAVChat_withCallMetadata_isFinalUpdate_(self, v48, (uint64_t)v6, 0, 1);
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v85 = v6;
    objc_msgSend_remoteParticipants(v6, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v90, (uint64_t)v95, 16);
    if (v55)
    {
      v60 = v55;
      v61 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v91 != v61)
            objc_enumerationMutation(v53);
          v63 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          objc_msgSend__participantsCallInfo(v63, v56, v57, v58, v59, v84);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v86, (uint64_t)v94, 16);
          if (v66)
          {
            v70 = v66;
            v71 = *(_QWORD *)v87;
            do
            {
              for (j = 0; j != v70; ++j)
              {
                if (*(_QWORD *)v87 != v71)
                  objc_enumerationMutation(v64);
                v73 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
                objc_msgSend_setState_(v73, v67, 4, v68, v69);
                v78 = objc_msgSend_callID(v73, v74, v75, v76, v77);
                objc_msgSend_stopCallID_(v31, v79, v78, v80, v81);
              }
              v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v86, (uint64_t)v94, 16);
            }
            while (v70);
          }

        }
        v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v90, (uint64_t)v95, 16);
      }
      while (v60);
    }

    v82 = 1;
    v11 = v84;
    v6 = v85;
  }
  else
  {
    v82 = 0;
  }

LABEL_28:
  return v82;
}

- (void)cancelConferenceForAVChat:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int shouldRunACConferences;
  NSObject *v28;
  NSObject *v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  id v91;
  __int16 v92;
  NSObject *v93;
  __int16 v94;
  int v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v91 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "chat: %@", buf, 0xCu);
  }

  if (v4)
  {
    objc_msgSend_sharedInstance(IMAVController, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__shouldRunConferences(v10, v11, v12, v13, v14))
    {

LABEL_7:
      objc_msgSend__existingConferenceForAVChat_(self, v19, (uint64_t)v4, v20, v21);
      v28 = objc_claimAutoreleasedReturnValue();
      sub_2190076D0();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v30)
        {
          objc_msgSend_otherIMHandle(v4, v31, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ID(v35, v36, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend__bustedCallID(v4, v41, v42, v43, v44);
          *(_DWORD *)buf = 138412802;
          v91 = v40;
          v92 = 2112;
          v93 = v28;
          v94 = 1024;
          v95 = v45;
          _os_log_impl(&dword_218FEA000, v29, OS_LOG_TYPE_DEFAULT, "Canceling AVConference with: %@ (%@)  callID: %d", buf, 0x1Cu);

        }
        objc_msgSend_updateAVChat_withCallMetadata_isFinalUpdate_(self, v46, (uint64_t)v4, 0, 1);
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        objc_msgSend_remoteParticipants(v4, v47, v48, v49, v50);
        v29 = objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v51, (uint64_t)&v84, (uint64_t)v89, 16);
        if (v52)
        {
          v57 = v52;
          v79 = v4;
          v58 = *(_QWORD *)v85;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v85 != v58)
                objc_enumerationMutation(v29);
              v60 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
              v80 = 0u;
              v81 = 0u;
              v82 = 0u;
              v83 = 0u;
              objc_msgSend__participantsCallInfo(v60, v53, v54, v55, v56);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v80, (uint64_t)v88, 16);
              if (v63)
              {
                v67 = v63;
                v68 = *(_QWORD *)v81;
                do
                {
                  for (j = 0; j != v67; ++j)
                  {
                    if (*(_QWORD *)v81 != v68)
                      objc_enumerationMutation(v61);
                    v70 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
                    objc_msgSend_setState_(v70, v64, 4, v65, v66);
                    v75 = objc_msgSend_callID(v70, v71, v72, v73, v74);
                    objc_msgSend_cancelCallID_(v28, v76, v75, v77, v78);
                  }
                  v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v64, (uint64_t)&v80, (uint64_t)v88, 16);
                }
                while (v67);
              }

            }
            v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v53, (uint64_t)&v84, (uint64_t)v89, 16);
          }
          while (v57);
          v4 = v79;
        }
      }
      else if (v30)
      {
        *(_DWORD *)buf = 138412290;
        v91 = v4;
        _os_log_impl(&dword_218FEA000, v29, OS_LOG_TYPE_DEFAULT, "Not conference found to cancel for chat: %@", buf, 0xCu);
      }

      goto LABEL_30;
    }
    objc_msgSend_sharedInstance(IMAVController, v15, v16, v17, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v22, v23, v24, v25, v26);

    if (shouldRunACConferences)
      goto LABEL_7;
  }
  sub_2190076D0();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v28, OS_LOG_TYPE_DEFAULT, "Not canceling conference for chat because chat is nil or this process doesn't run conferences", buf, 2u);
  }
LABEL_30:

}

- (void)_notifyAboutPotentialCallForChat:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMAVConferenceInterface;
  -[IMAVInterface _notifyAboutPotentialCallForChat:](&v14, sel__notifyAboutPotentialCallForChat_, v4);
  if (v4)
  {
    objc_msgSend__conferenceForAVChat_(self, v5, (uint64_t)v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "Warming up conference %@", buf, 0xCu);
    }

    objc_msgSend_warmupForCall(v8, v10, v11, v12, v13);
  }

}

- (id)getNatIPFromICEData:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v3;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "Data: %@", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE30338], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_faceTimeSupported(v9, v10, v11, v12, v13);

  v18 = 0;
  if (v3 && v14)
  {
    objc_msgSend_externalAddressForSelfConnectionBlob_((void *)qword_253DE9310, v15, (uint64_t)v3, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2190076D0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v18;
      _os_log_impl(&dword_218FEA000, v19, OS_LOG_TYPE_DEFAULT, "returned result: %@", (uint8_t *)&v22, 0xCu);
    }

    if (!v18)
    {
      sub_2190076D0();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] No nat-ip returned for data blob", (uint8_t *)&v22, 2u);
      }

    }
  }

  return v18;
}

- (id)natTypeForAVChat:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    objc_msgSend__existingConferenceForAVChat_(self, v4, (uint64_t)v7, v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend__timings(v7, v8, v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_startTimingForKey_(v13, v14, (uint64_t)CFSTR("connection-data-nat-type-time"), v15, v16);

      v21 = objc_msgSend_natType(v12, v17, v18, v19, v20);
      objc_msgSend__timings(v7, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stopTimingForKey_(v26, v27, (uint64_t)CFSTR("connection-data-nat-type-time"), v28, v29);

      sub_2190076D0();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v41 = 67109120;
        v42 = v21;
        _os_log_impl(&dword_218FEA000, v30, OS_LOG_TYPE_DEFAULT, "natType: %u", (uint8_t *)&v41, 8u);
      }

      if (CFPreferencesGetAppBooleanValue(CFSTR("UseCustomNatType"), CFSTR("com.apple.conference"), 0))
      {
        v21 = IMGetDomainIntForKey();
        sub_2190076D0();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v41 = 67109120;
          v42 = v21;
          _os_log_impl(&dword_218FEA000, v34, OS_LOG_TYPE_DEFAULT, "overriding natType: %u", (uint8_t *)&v41, 8u);
        }

      }
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v31, v21, v32, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    sub_2190076D0();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl(&dword_218FEA000, v36, OS_LOG_TYPE_DEFAULT, "No avChat", (uint8_t *)&v41, 2u);
    }

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v37, 0, v38, v39);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v35;
}

- (void)avChat:(id)a3 prepareConnectionWithCallInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char shouldRunACConferences;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  id v48;
  _QWORD block[4];
  id v50;
  IMAVConferenceInterface *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v56 = v6;
    v57 = 2112;
    v58 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "avChat: %@  callInfo: %@", buf, 0x16u);
  }

  if (v6)
  {
    objc_msgSend_sharedInstance(IMAVController, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__shouldRunConferences(v13, v14, v15, v16, v17))
    {

LABEL_9:
      objc_msgSend_otherIMHandle(v6, v22, v23, v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_participantMatchingIMHandle_(v6, v34, (uint64_t)v26, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__conferenceForAVChat_(self, v38, (uint64_t)v6, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__conferenceQueue(v6, v42, v43, v44, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_219014234;
      block[3] = &unk_24DA57900;
      v50 = v6;
      v51 = self;
      v52 = v7;
      v53 = v41;
      v54 = v37;
      v47 = v37;
      v48 = v41;
      dispatch_async(v46, block);

      goto LABEL_13;
    }
    objc_msgSend_sharedInstance(IMAVController, v18, v19, v20, v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

    if ((shouldRunACConferences & 1) != 0)
      goto LABEL_9;
    sub_2190076D0();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v27 = "Returning because we are not the VC host";
LABEL_12:
    _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_13;
  }
  sub_2190076D0();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v27 = "No avChat";
    goto LABEL_12;
  }
LABEL_13:

}

- (BOOL)avChat:(id)a3 generateCallInfoForID:(id)a4 service:(id)a5 usingRelay:(BOOL)a6 callInfo:(id)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _QWORD block[4];
  id v64;
  IMAVConferenceInterface *v65;
  id v66;
  id v67;
  id v68;
  _BYTE *v69;
  _QWORD *v70;
  _QWORD v71[5];
  id v72;
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18 = a7;
  if (v11 && objc_msgSend_state(v11, v14, v15, v16, v17) != 5)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v74 = sub_2190155D8;
    v75 = sub_2190155E8;
    v76 = 0;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = sub_2190155D8;
    v71[4] = sub_2190155E8;
    v72 = 0;
    objc_msgSend__conferenceForAVChat_(self, v19, (uint64_t)v11, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__timings(v11, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTimingForKey_(v29, v30, (uint64_t)CFSTR("time-to-query-for-connection-data-gathering"), v31, v32);

    objc_msgSend__timings(v11, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimingForKey_(v37, v38, (uint64_t)CFSTR("full-connection-data-gather"), v39, v40);

    objc_msgSend__conferenceQueue(v11, v41, v42, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2190155F0;
    block[3] = &unk_24DA57950;
    v46 = v11;
    v64 = v46;
    v65 = self;
    v47 = v24;
    v66 = v47;
    v48 = v18;
    v67 = v48;
    v68 = v12;
    v69 = buf;
    v70 = v71;
    dispatch_sync(v45, block);

    objc_msgSend__timings(v46, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTimingForKey_(v53, v54, (uint64_t)CFSTR("full-connection-data-gather"), v55, v56);

    objc_msgSend_localICEData(v48, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v61 != 0;

    _Block_object_dispose(v71, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    sub_2190076D0();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_218FEA000, v22, OS_LOG_TYPE_DEFAULT, "Tried to get connection data for: %@  in a dead call: %@   => returning nil", buf, 0x16u);
    }

    v23 = 0;
  }

  return v23;
}

- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  IMAVConferenceInterface *v25;
  BOOL v26;
  uint8_t buf[4];
  const __CFString *v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v28 = v11;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Informed that conference did start: %@", buf, 0xCu);
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_219016264;
  v22[3] = &unk_24DA57978;
  v26 = v6;
  v23 = v8;
  v24 = v9;
  v25 = self;
  v17 = v9;
  v18 = v8;
  objc_msgSend___im_performBlock_(v16, v19, (uint64_t)v22, v20, v21);

}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5 callMetadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  IMAVConferenceInterface *v29;
  int64_t v30;
  uint8_t buf[4];
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  sub_2190076D0();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = a4;
    _os_log_impl(&dword_218FEA000, v13, OS_LOG_TYPE_DEFAULT, "Informed that conference did stop with callID: %ld", buf, 0xCu);
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_2190169C4;
  v25[3] = &unk_24DA579A0;
  v29 = self;
  v30 = a4;
  v26 = v10;
  v27 = v11;
  v28 = v12;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  objc_msgSend___im_performBlock_(v18, v22, (uint64_t)v25, v23, v24);

}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_conference_didStopWithCallID_error_callMetadata_, a3, a4, a5);
}

- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_219016C9C;
  v18[3] = &unk_24DA57850;
  v18[4] = self;
  v19 = v6;
  v20 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend___im_performBlock_(v12, v15, (uint64_t)v18, v16, v17);

}

- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_219016DBC;
  v18[3] = &unk_24DA57850;
  v18[4] = self;
  v19 = v6;
  v20 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend___im_performBlock_(v12, v15, (uint64_t)v18, v16, v17);

}

- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  IMAVConferenceInterface *v19;
  int64_t v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v22 = a4;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Informed about first remote frame for call ID: %d", buf, 8u);
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_219016F3C;
  v17[3] = &unk_24DA579C8;
  v19 = self;
  v20 = a4;
  v18 = v6;
  v13 = v6;
  objc_msgSend___im_performBlock_(v12, v14, (uint64_t)v17, v15, v16);

}

+ (void)_postParticipantMediaChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 contentRectChanged:(BOOL)a7 cameraWillSwitch:(BOOL)a8 camera:(unsigned int)a9 orentation:(unsigned int)a10 aspect:(CGSize)a11 contentRect:(CGRect)a12
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v16;
  CGFloat v17;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  unsigned int v41;
  unsigned int v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;

  height = a12.size.height;
  width = a12.size.width;
  y = a12.origin.y;
  x = a12.origin.x;
  v16 = a11.height;
  v17 = a11.width;
  v23 = a3;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_2190172B0;
  v33[3] = &unk_24DA579F0;
  v43 = a4;
  v44 = a5;
  v45 = a6;
  v46 = a8;
  v47 = a7;
  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  v41 = a9;
  v42 = a10;
  v39 = v17;
  v40 = v16;
  v34 = v23;
  v29 = v23;
  objc_msgSend___im_performBlock_(v28, v30, (uint64_t)v33, v31, v32);

}

+ (void)_postParticipantScreenAttributesChangeNotification:(id)a3 cameraChanged:(BOOL)a4 orientationChanged:(BOOL)a5 aspectChanged:(BOOL)a6 cameraWillSwitch:(BOOL)a7 camera:(unsigned int)a8 orentation:(unsigned int)a9 aspect:(CGSize)a10
{
  CGFloat height;
  CGFloat width;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  CGFloat v28;
  CGFloat v29;
  unsigned int v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;

  height = a10.height;
  width = a10.width;
  v16 = a3;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_219017568;
  v26[3] = &unk_24DA57A18;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v34 = a7;
  v30 = a9;
  v28 = width;
  v29 = height;
  v27 = v16;
  v22 = v16;
  objc_msgSend___im_performBlock_(v21, v23, (uint64_t)v26, v24, v25);

}

- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  IMAVConferenceInterface *v23;
  int64_t v24;

  v8 = a3;
  v9 = a4;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_219017740;
  v20[3] = &unk_24DA57A40;
  v21 = v8;
  v22 = v9;
  v23 = self;
  v24 = a5;
  v15 = v9;
  v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);

}

- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  IMAVConferenceInterface *v22;
  id v23;
  int64_t v24;

  v8 = a3;
  v9 = a4;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_219017CD0;
  v20[3] = &unk_24DA57A40;
  v21 = v8;
  v22 = self;
  v23 = v9;
  v24 = a5;
  v15 = v9;
  v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);

}

- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  IMAVConferenceInterface *v23;
  int64_t v24;

  v8 = a3;
  v9 = a5;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_2190182A0;
  v20[3] = &unk_24DA57A40;
  v21 = v8;
  v22 = v9;
  v23 = self;
  v24 = a4;
  v15 = v9;
  v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);

}

- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  IMAVConferenceInterface *v23;
  int64_t v24;

  v8 = a3;
  v9 = a5;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_219018D6C;
  v20[3] = &unk_24DA57A40;
  v21 = v8;
  v22 = v9;
  v23 = self;
  v24 = a4;
  v15 = v9;
  v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);

}

- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  IMAVConferenceInterface *v23;
  int64_t v24;

  v8 = a3;
  v9 = a5;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_219019064;
  v20[3] = &unk_24DA57A40;
  v21 = v8;
  v22 = v9;
  v23 = self;
  v24 = a4;
  v15 = v9;
  v16 = v8;
  objc_msgSend___im_performBlock_(v14, v17, (uint64_t)v20, v18, v19);

}

- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  IMAVConferenceInterface *v20;
  int64_t v21;
  BOOL v22;

  v8 = a3;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_219019344;
  v18[3] = &unk_24DA57A68;
  v20 = self;
  v21 = a4;
  v22 = a5;
  v19 = v8;
  v14 = v8;
  objc_msgSend___im_performBlock_(v13, v15, (uint64_t)v18, v16, v17);

}

- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  IMAVConferenceInterface *v22;
  int64_t v23;
  BOOL v24;
  BOOL v25;

  v10 = a3;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_2190194FC;
  v20[3] = &unk_24DA57A90;
  v22 = self;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v21 = v10;
  v16 = v10;
  objc_msgSend___im_performBlock_(v15, v17, (uint64_t)v20, v18, v19);

}

- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  IMAVConferenceInterface *v20;
  int64_t v21;
  BOOL v22;

  v8 = a3;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_219019778;
  v18[3] = &unk_24DA57A68;
  v20 = self;
  v21 = a4;
  v22 = a5;
  v19 = v8;
  v14 = v8;
  objc_msgSend___im_performBlock_(v13, v15, (uint64_t)v18, v16, v17);

}

- (void)conference:(id)a3 reinitializeCallForCallID:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  unsigned int v19;
  uint8_t buf[4];
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v21 = a4;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Told to reinitialize call for callID %d", buf, 8u);
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_219019A50;
  v17[3] = &unk_24DA57AB8;
  v17[4] = self;
  v18 = v6;
  v19 = a4;
  v13 = v6;
  objc_msgSend___im_performBlock_(v12, v14, (uint64_t)v17, v15, v16);

}

- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseAudio:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  int64_t v24;
  BOOL v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  sub_2190076D0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v27 = v10;
    v28 = 1024;
    v29 = v7;
    v30 = 1024;
    v31 = a4;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "vc: %@  didPauseAudio: %d callID: %d error: %@", buf, 0x22u);
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_219019CC4;
  v22[3] = &unk_24DA57A68;
  v22[4] = self;
  v23 = v10;
  v24 = a4;
  v25 = v7;
  v18 = v10;
  objc_msgSend___im_performBlock_(v17, v19, (uint64_t)v22, v20, v21);

}

- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  int64_t v24;
  BOOL v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v8;
    v28 = 1024;
    v29 = v6;
    v30 = 1024;
    v31 = a5;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "vc: %@  remoteAudioPaused: %d callID: %d", buf, 0x18u);
  }

  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = a5;
      v12 = "Informed about remote audio muted for call ID: %d";
LABEL_8:
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 8u);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a5;
    v12 = "Informed about remote audio unmuted for call ID: %d";
    goto LABEL_8;
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_219019ED4;
  v22[3] = &unk_24DA57A68;
  v22[4] = self;
  v23 = v8;
  v24 = a5;
  v25 = v6;
  v18 = v8;
  objc_msgSend___im_performBlock_(v17, v19, (uint64_t)v22, v20, v21);

}

- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  int64_t v24;
  BOOL v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v8;
    v28 = 1024;
    v29 = v6;
    v30 = 1024;
    v31 = a5;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "vc: %@  videoPaused: %d callID: %d", buf, 0x18u);
  }

  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = a5;
      v12 = "Informed about remote video paused for call ID: %d";
LABEL_8:
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 8u);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a5;
    v12 = "Informed about remote video unpaused for call ID: %d";
    goto LABEL_8;
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_21901A17C;
  v22[3] = &unk_24DA57A68;
  v22[4] = self;
  v23 = v8;
  v24 = a5;
  v25 = v6;
  v18 = v8;
  objc_msgSend___im_performBlock_(v17, v19, (uint64_t)v22, v20, v21);

}

- (void)conference:(id)a3 localIPChange:(id)a4 withCallID:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  int64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    v30 = 1024;
    v31 = a5;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "vc: %@  newBlob: %@ callID: %d", buf, 0x1Cu);
  }

  sub_2190076D0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a5;
    _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "Informed about local IP changing for call ID: %d", buf, 8u);
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_21901A424;
  v22[3] = &unk_24DA57A40;
  v22[4] = self;
  v23 = v8;
  v24 = v9;
  v25 = a5;
  v17 = v9;
  v18 = v8;
  objc_msgSend___im_performBlock_(v16, v19, (uint64_t)v22, v20, v21);

}

- (void)conference:(id)a3 didChangeLocalVariablesForCallID:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  int64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 1024;
    v23 = a4;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d", buf, 0x12u);
  }

  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_21901A5E4;
  v17[3] = &unk_24DA579C8;
  v17[4] = self;
  v18 = v6;
  v19 = a4;
  v13 = v6;
  objc_msgSend___im_performBlock_(v12, v14, (uint64_t)v17, v15, v16);

}

- (void)serverDiedForConference:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  IMAVConferenceInterface *v16;

  v4 = a3;
  objc_msgSend_mainThread(MEMORY[0x24BDD17F0], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_21901A6E4;
  v14[3] = &unk_24DA572E0;
  v15 = v4;
  v16 = self;
  v10 = v4;
  objc_msgSend___im_performBlock_(v9, v11, (uint64_t)v14, v12, v13);

}

- (BOOL)supportsLayers
{
  return 1;
}

- (void)localVideoLayer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if ((objc_msgSend_isAVInterfaceReady(self, a2, v2, v3, v4) & 1) == 0)
    objc_msgSend_initAVInterface(self, v6, v7, v8, v9);
  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_localVideoLayer(v10, v11, v12, v13, v14);

  return v15;
}

- (void)setLocalVideoLayer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if ((objc_msgSend_isAVInterfaceReady(self, a2, (uint64_t)a3, v3, v4) & 1) == 0)
    objc_msgSend_initAVInterface(self, v7, v8, v9, v10);
  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v7, v8, v9, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoLayer_(v14, v11, (uint64_t)a3, v12, v13);

}

- (void)setRemoteVideoPresentationSize:(CGSize)a3 forChat:(id)a4
{
  double height;
  double width;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  height = a3.height;
  width = a3.width;
  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (objc_msgSend_isVideo(v7, v8, v9, v10, v11))
  {
    if (v7)
    {
      if ((objc_msgSend_isAVInterfaceReady(self, v12, v13, v14, v15) & 1) == 0)
        objc_msgSend_initAVInterface(self, v16, v17, v18, v19);
      objc_msgSend__existingConferenceForAVChat_(self, v16, (uint64_t)v7, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        sub_2190076D0();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v30 = 134218240;
          v31 = width;
          v32 = 2048;
          v33 = height;
          _os_log_impl(&dword_218FEA000, v21, OS_LOG_TYPE_DEFAULT, "Setting remote video presented size to %f, %f", (uint8_t *)&v30, 0x16u);
        }

        v26 = objc_msgSend__bustedCallID(v7, v22, v23, v24, v25);
        objc_msgSend_setConferenceVisualRectangle_forCallID_(v20, v27, v26, v28, v29, 0.0, 0.0, width, height);
      }
    }
    else
    {
      sub_2190076D0();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "No avChat when asked to set presentation size", (uint8_t *)&v30, 2u);
      }
    }

  }
}

- (void)setRemoteVideoPresentationState:(unsigned int)a3 forChat:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  _DWORD v29[2];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (objc_msgSend_isVideo(v6, v7, v8, v9, v10))
  {
    if (v6)
    {
      if ((objc_msgSend_isAVInterfaceReady(self, v11, v12, v13, v14) & 1) == 0)
        objc_msgSend_initAVInterface(self, v15, v16, v17, v18);
      objc_msgSend__existingConferenceForAVChat_(self, v15, (uint64_t)v6, v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        sub_2190076D0();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v29[0] = 67109120;
          v29[1] = a3;
          _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "Setting remote video presentation state to %d", (uint8_t *)v29, 8u);
        }

        if (a3 == 2)
          v25 = 2;
        else
          v25 = a3 == 1;
        v26 = objc_msgSend__bustedCallID(v6, v21, v22, v23, v24);
        objc_msgSend_setConferenceState_forCallID_(v19, v27, v25, v26, v28);
      }
    }
    else
    {
      sub_2190076D0();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29[0]) = 0;
        _os_log_impl(&dword_218FEA000, v19, OS_LOG_TYPE_DEFAULT, "No avChat when asked to set presentation state", (uint8_t *)v29, 2u);
      }
    }

  }
}

- (void)localVideoBackLayer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if ((objc_msgSend_isAVInterfaceReady(self, a2, v2, v3, v4) & 1) == 0)
    objc_msgSend_initAVInterface(self, v6, v7, v8, v9);
  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_localVideoBackLayer(v10, v11, v12, v13, v14);

  return v15;
}

- (void)setLocalVideoBackLayer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if ((objc_msgSend_isAVInterfaceReady(self, a2, (uint64_t)a3, v3, v4) & 1) == 0)
    objc_msgSend_initAVInterface(self, v7, v8, v9, v10);
  objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v7, v8, v9, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoBackLayer_(v14, v11, (uint64_t)a3, v12, v13);

}

- (BOOL)supportsRelay
{
  return 1;
}

- (void)handleRelayInitate:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char shouldRunACConferences;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  id v103;
  id v104;
  _QWORD v105[4];
  id v106;
  id v107;
  id v108;
  id v109;
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  id v113;
  __int16 v114;
  id v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v15, v16, v17, v18, v19))
  {

  }
  else
  {
    objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

    if ((shouldRunACConferences & 1) == 0)
    {
      sub_2190076D0();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v62, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", buf, 2u);
      }
      goto LABEL_15;
    }
  }
  objc_msgSend_avChat(v9, v24, v25, v26, v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__conferenceQueue(v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_avChat(v9, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__existingConferenceForAVChat_(self, v45, (uint64_t)v44, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_alloc(MEMORY[0x24BDBCED8]);
    v53 = (void *)objc_msgSend_initWithDictionary_(v49, v50, (uint64_t)v8, v51, v52);
    v54 = *MEMORY[0x24BE4FF50];
    objc_msgSend_objectForKey_(v8, v55, *MEMORY[0x24BE4FF50], v56, v57);
    v62 = objc_claimAutoreleasedReturnValue();
    if (!v62)
    {
      objc_msgSend_avChat(v9, v58, v59, v60, v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__relayRemotePrimaryIdentifier(v63, v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
      {
        objc_msgSend_avChat(v9, v69, v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__relayRemotePrimaryIdentifier(v73, v74, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v53, v79, (uint64_t)v78, v54, v80);

      }
    }
    sub_2190076D0();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_vcPartyID(v9, v82, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v111 = v86;
      _os_log_impl(&dword_218FEA000, v81, OS_LOG_TYPE_DEFAULT, "Processing relay request response from: %@", buf, 0xCu);

    }
    sub_2190076D0();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_avChat(v9, v88, v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v111 = v92;
      v112 = 2112;
      v113 = v9;
      v114 = 2112;
      v115 = v8;
      _os_log_impl(&dword_218FEA000, v87, OS_LOG_TYPE_DEFAULT, "handleRelayInitate AVChat: %@    participant: %@    properties: %@", buf, 0x20u);

    }
    objc_msgSend_avChat(v9, v93, v94, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__conferenceQueue(v97, v98, v99, v100, v101);
    v102 = objc_claimAutoreleasedReturnValue();
    v105[0] = MEMORY[0x24BDAC760];
    v105[1] = 3221225472;
    v105[2] = sub_21901AFE8;
    v105[3] = &unk_24DA57AE0;
    v106 = v48;
    v107 = v10;
    v108 = v53;
    v109 = v9;
    v103 = v53;
    v104 = v48;
    dispatch_async(v102, v105);

LABEL_15:
  }

}

- (void)handleRelayUpdate:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char shouldRunACConferences;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v15, v16, v17, v18, v19))
  {

  }
  else
  {
    objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

    if ((shouldRunACConferences & 1) == 0)
    {
      sub_2190076D0();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v71, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", buf, 2u);
      }
      goto LABEL_12;
    }
  }
  objc_msgSend_avChat(v9, v24, v25, v26, v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__conferenceQueue(v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_avChat(v9, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__existingConferenceForAVChat_(self, v45, (uint64_t)v44, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    sub_2190076D0();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_vcPartyID(v9, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v78 = v54;
      _os_log_impl(&dword_218FEA000, v49, OS_LOG_TYPE_DEFAULT, "Processing relay update from: %@", buf, 0xCu);

    }
    sub_2190076D0();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_avChat(v9, v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v78 = v60;
      v79 = 2112;
      v80 = v9;
      v81 = 2112;
      v82 = v8;
      _os_log_impl(&dword_218FEA000, v55, OS_LOG_TYPE_DEFAULT, "handleRelayUpdate AVChat: %@    participant: %@    properties: %@", buf, 0x20u);

    }
    objc_msgSend_avChat(v9, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__conferenceQueue(v65, v66, v67, v68, v69);
    v70 = objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = sub_21901B340;
    v72[3] = &unk_24DA57AE0;
    v73 = v48;
    v74 = v10;
    v75 = v8;
    v76 = v9;
    v71 = v48;
    dispatch_async(v70, v72);

LABEL_12:
  }

}

- (void)handleRelayCancel:(id)a3 fromParticipant:(id)a4 callInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char shouldRunACConferences;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v15, v16, v17, v18, v19))
  {

  }
  else
  {
    objc_msgSend_sharedInstance(IMAVController, v20, v21, v22, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v28, v29, v30, v31, v32);

    if ((shouldRunACConferences & 1) == 0)
    {
      sub_2190076D0();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v71, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", buf, 2u);
      }
      goto LABEL_12;
    }
  }
  objc_msgSend_avChat(v9, v24, v25, v26, v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__conferenceQueue(v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_avChat(v9, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__existingConferenceForAVChat_(self, v45, (uint64_t)v44, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    sub_2190076D0();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_vcPartyID(v9, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v78 = v54;
      _os_log_impl(&dword_218FEA000, v49, OS_LOG_TYPE_DEFAULT, "Processing relay cancel from: %@", buf, 0xCu);

    }
    sub_2190076D0();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_avChat(v9, v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v78 = v60;
      v79 = 2112;
      v80 = v9;
      v81 = 2112;
      v82 = v8;
      _os_log_impl(&dword_218FEA000, v55, OS_LOG_TYPE_DEFAULT, "handleRelayCancel AVChat: %@    participant: %@    properties: %@", buf, 0x20u);

    }
    objc_msgSend_avChat(v9, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__conferenceQueue(v65, v66, v67, v68, v69);
    v70 = objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = sub_21901B698;
    v72[3] = &unk_24DA57AE0;
    v73 = v48;
    v74 = v10;
    v75 = v8;
    v76 = v9;
    v71 = v48;
    dispatch_async(v70, v72);

LABEL_12:
  }

}

- (void)processRemoteIPChanged:(id)a3 fromParticipant:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  id v54;
  _QWORD block[4];
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Processing remote IP change from: %@", buf, 0xCu);
  }

  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_avChat(v7, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v60 = v14;
    v61 = 2112;
    v62 = v7;
    v63 = 2112;
    v64 = v6;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "remoteIPChangedWithBlob AVChat: %@    participant: %@    properties: %@", buf, 0x20u);

  }
  objc_msgSend_avChat(v7, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__conferenceQueue(v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_avChat(v7, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__existingConferenceForAVChat_(self, v30, (uint64_t)v29, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(v6, v34, (uint64_t)CFSTR("LocalIPChangeNewBlob"), v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__FTDataFromBase64String(v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_avChat(v7, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__conferenceQueue(v47, v48, v49, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21901B960;
    block[3] = &unk_24DA57850;
    v56 = v33;
    v57 = v42;
    v58 = v7;
    v53 = v42;
    v54 = v33;
    dispatch_async(v52, block);

  }
}

- (AVConference)controller
{
  return (AVConference *)((uint64_t (*)(IMAVConferenceInterface *, char *))MEMORY[0x24BEDD108])(self, sel__controller);
}

- (id)_controller
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend__activeChat(IMAVChat, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__conferenceForAVChat_(self, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)chatStateUpdated
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  objc_msgSend__nonFinalChat(IMAVChat, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(IMAVDaemonController, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  if (v6)
    objc_msgSend_addListenerID_(v11, v12, (uint64_t)CFSTR("com.apple.IMAVConferenceAVAgentListener"), v13, v14);
  else
    objc_msgSend_removeListenerID_(v11, v12, (uint64_t)CFSTR("com.apple.IMAVConferenceAVAgentListener"), v13, v14);

  v16.receiver = self;
  v16.super_class = (Class)IMAVConferenceInterface;
  -[IMAVInterface chatStateUpdated](&v16, sel_chatStateUpdated);
}

- (void)chatRelayedStatusChanged:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend__conferenceForAVChat_(self, v5, (uint64_t)v4, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend__conferenceQueue(v4, v8, v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21901BB50;
    block[3] = &unk_24DA57850;
    block[4] = self;
    v15 = v4;
    v16 = v12;
    dispatch_async(v13, block);

  }
}

- (void)avChat:(id)a3 setLocalLandscapeAspectRatio:(CGSize)a4 localPortraitAspectRatio:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;
  NSSize v43;
  NSSize v44;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v15 = v10;
  if (!v10)
  {
    sub_2190076D0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      v32 = "No avChat";
      goto LABEL_13;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend_isVideo(v10, v11, v12, v13, v14))
  {
    if ((objc_msgSend_isAVInterfaceReady(self, v16, v17, v18, v19) & 1) == 0)
      objc_msgSend_initAVInterface(self, v20, v21, v22, v23);
    sub_2190076D0();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v43.width = v8;
      v43.height = v7;
      NSStringFromSize(v43);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v44.width = width;
      v44.height = height;
      NSStringFromSize(v44);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412802;
      v37 = v15;
      v38 = 2112;
      v39 = v25;
      v40 = 2112;
      v41 = v26;
      _os_log_impl(&dword_218FEA000, v24, OS_LOG_TYPE_DEFAULT, "Chat: %@ Setting setLocalLandscapeAspectRatio: %@   localPortraitAspectRatio: %@", (uint8_t *)&v36, 0x20u);

    }
    if (v8 == 0.0 && v7 == 0.0)
    {
      sub_2190076D0();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        v32 = "       ** someone hasn't configured this localLandscapeAspectRatio, it's CGSizeZero, skipping";
LABEL_13:
        _os_log_impl(&dword_218FEA000, v31, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v36, 2u);
        goto LABEL_19;
      }
    }
    else
    {
      if (width != 0.0 || height != 0.0)
      {
        objc_msgSend_sharedInstance(IMAVLocalPreviewClient, v27, v28, v29, v30);
        v31 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_avChat_setLocalPortraitRatio_localLandscapeRatio_(v31, v33, (uint64_t)v15, v34, v35, width, height, v8, v7);
        goto LABEL_19;
      }
      sub_2190076D0();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        v32 = "       ** someone hasn't configured this localPortraitAspectRatio, it's CGSizeZero, skipping";
        goto LABEL_13;
      }
    }
    goto LABEL_19;
  }
LABEL_20:

}

- (BOOL)_submitLoggingInformation:(id)a3 forChat:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412546;
    v28 = v5;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "Will submit logging info: %@   for chat: %@", (uint8_t *)&v27, 0x16u);
  }

  v8 = objc_alloc_init((Class)qword_253DE9310);
  sub_2190076D0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v8;
    _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "   => Found conference: %@", (uint8_t *)&v27, 0xCu);
  }

  v10 = objc_opt_respondsToSelector();
  sub_2190076D0();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v12)
    {
      NSStringFromSelector(sel_setCallReport_withReport_);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "%@ responds to %@", (uint8_t *)&v27, 0x16u);

    }
    v18 = objc_msgSend__bustedCallID(v6, v14, v15, v16, v17);
    objc_msgSend_descriptionInStringsFileFormat(v5, v19, v20, v21, v22);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCallReport_withReport_(v8, v23, v18, (uint64_t)v11, v24);
  }
  else if (v12)
  {
    NSStringFromSelector(sel_setCallReport_withReport_);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412546;
    v28 = v8;
    v29 = 2112;
    v30 = v25;
    _os_log_impl(&dword_218FEA000, v11, OS_LOG_TYPE_DEFAULT, "%@ DOES NOT respond to %@", (uint8_t *)&v27, 0x16u);

  }
  return 1;
}

- (BOOL)_submitEndCallMetric:(id)a3 forCallID:(int64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sub_2190076D0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v5;
    v18 = 1024;
    LODWORD(v19) = a4;
    _os_log_impl(&dword_218FEA000, v6, OS_LOG_TYPE_DEFAULT, "Will submit end call metric: %@   for callID: %d", (uint8_t *)&v16, 0x12u);
  }

  v7 = objc_alloc_init((Class)qword_253DE9310);
  sub_2190076D0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "   => Found conference: %@", (uint8_t *)&v16, 0xCu);
  }

  v9 = objc_opt_respondsToSelector();
  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      NSStringFromSelector(sel_sendProtobuf_withType_forCallID_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "%@ responds to %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend_sendProtobuf_withType_forCallID_(v7, v13, (uint64_t)v5, 5312515, a4);
  }
  else
  {
    if (v11)
    {
      NSStringFromSelector(sel_sendProtobuf_withType_forCallID_);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "%@ DOES NOT respond to %@", (uint8_t *)&v16, 0x16u);

    }
  }

  return 1;
}

- (void)updateAVChat:(id)a3 withCallMetadata:(id)a4 isFinalUpdate:(BOOL)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  BOOL v35;

  v8 = a3;
  v13 = a4;
  if (v8)
  {
    objc_msgSend__conferenceQueue(v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v19 = objc_msgSend__bustedCallID(v8, v15, v16, v17, v18);
      objc_msgSend__existingConferenceForAVChat_(self, v20, (uint64_t)v8, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__conferenceQueue(v8, v24, v25, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_21901C42C;
      block[3] = &unk_24DA57B30;
      v31 = v13;
      v32 = v23;
      v34 = v19;
      v33 = v8;
      v35 = a5;
      v29 = v23;
      dispatch_async(v28, block);

    }
  }

}

- (NSNumber)isSendingVideoExpected
{
  return self->_sendingVideoExpected;
}

- (void)setSendingVideoExpected:(id)a3
{
  objc_storeStrong((id *)&self->_sendingVideoExpected, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingVideoExpected, 0);
  objc_storeStrong((id *)&self->_avConferencesLock, 0);
  objc_storeStrong((id *)&self->_avConferences, 0);
  objc_storeStrong((id *)&self->_avConferencesToCleanup, 0);
}

@end
