@implementation IDSGroupSessionParticipantUpdate

- (IDSGroupSessionParticipantUpdate)initWithGroupUUID:(id)a3 isInitiator:(BOOL)a4 participantIdentifier:(unint64_t)a5 participantDestinationID:(id)a6 participantUpdateType:(unint64_t)a7 participantUpdateSubtype:(unint64_t)a8 fromServer:(BOOL)a9 serverDate:(id)a10 participantData:(id)a11 clientContextData:(id)a12 members:(id)a13 participantIDs:(id)a14 relaySessionID:(id)a15
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  IDSGroupSessionParticipantUpdate *isInitiator_participantIdentifier_participantDestinationURI_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID;
  _BOOL4 v33;

  v33 = a4;
  v17 = a15;
  v18 = a14;
  v19 = a13;
  v20 = a12;
  v21 = a11;
  v22 = a10;
  v23 = a3;
  objc_msgSend_URIWithPrefixedURI_(IDSURI, v24, (uint64_t)a6, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  isInitiator_participantIdentifier_participantDestinationURI_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID = (IDSGroupSessionParticipantUpdate *)objc_msgSend_initWithGroupUUID_isInitiator_participantIdentifier_participantDestinationURI_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID_(self, v27, (uint64_t)v23, v28, v33, a5, v26, a7, a8, a9, v22, v21, v20, v19, v18, v17);

  return isInitiator_participantIdentifier_participantDestinationURI_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID;
}

- (IDSGroupSessionParticipantUpdate)initWithGroupUUID:(id)a3 isInitiator:(BOOL)a4 participantIdentifier:(unint64_t)a5 participantDestinationURI:(id)a6 participantUpdateType:(unint64_t)a7 participantUpdateSubtype:(unint64_t)a8 fromServer:(BOOL)a9 serverDate:(id)a10 participantData:(id)a11 clientContextData:(id)a12 members:(id)a13 participantIDs:(id)a14 relaySessionID:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  IDSGroupSessionParticipantUpdate *v23;
  IDSGroupSessionParticipantUpdate *v24;
  id v28;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v31 = a3;
  v28 = a6;
  v18 = a6;
  v19 = a10;
  v33 = a11;
  v32 = a12;
  v20 = a13;
  v21 = a14;
  v22 = a15;
  v34.receiver = self;
  v34.super_class = (Class)IDSGroupSessionParticipantUpdate;
  v23 = -[IDSGroupSessionParticipantUpdate init](&v34, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_groupUUID, a3);
    v24->_isInitiator = a4;
    v24->_participantIdentifier = a5;
    objc_storeStrong((id *)&v24->_participantDestinationURI, v28);
    v24->_participantUpdateType = a7;
    v24->_participantUpdateSubtype = a8;
    v24->_fromServer = a9;
    objc_storeStrong((id *)&v24->_serverDate, a10);
    objc_storeStrong((id *)&v24->_participantData, a11);
    objc_storeStrong((id *)&v24->_clientContextData, a12);
    objc_storeStrong((id *)&v24->_members, a13);
    objc_storeStrong((id *)&v24->_participantIDs, a14);
    objc_storeStrong((id *)&v24->_relaySessionID, a15);
  }

  return v24;
}

- (IDSGroupSessionParticipantUpdate)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  char v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  void *v55;
  id v56;
  const char *v57;
  double v58;
  void *v59;
  const char *v60;
  double v61;
  void *v62;
  const char *v63;
  double v64;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  unsigned int v71;
  IDSGroupSessionParticipantUpdate *isInitiator_participantIdentifier_participantDestinationID_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateMembersKey"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v7;
  if (v7)
  {
    objc_msgSend___imArrayByApplyingBlock_(v7, v8, (uint64_t)&unk_1E3C1B630, v9);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = 0;
  }
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateGroupUUIDKey"), v12);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend_initWithUUIDString_(v10, v13, (uint64_t)v77, v14);
  objc_msgSend_objectForKeyedSubscript_(v4, v15, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateIsInitiatorKey"), v16);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend_BOOLValue(v76, v17, v18, v19);
  objc_msgSend_objectForKeyedSubscript_(v4, v20, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateParticipantIdentifierKey"), v21);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend_unsignedLongLongValue(v75, v22, v23, v24);
  objc_msgSend_objectForKeyedSubscript_(v4, v25, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateParticipantDestinationIDKey"), v26);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v27, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateMemberUpdateTypeKey"), v28);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_unsignedIntegerValue(v74, v29, v30, v31);
  objc_msgSend_objectForKeyedSubscript_(v4, v32, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateMemberUpdateSubtypeKey"), v33);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_unsignedIntegerValue(v70, v34, v35, v36);
  objc_msgSend_objectForKeyedSubscript_(v4, v37, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateFromServerKey"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_BOOLValue(v39, v40, v41, v42);
  objc_msgSend_objectForKeyedSubscript_(v4, v44, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateServerDateKey"), v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v47, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateParticipantDataKey"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v50, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateClientContextDataKey"), v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v53, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateParticipantIDsKey"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend_objectForKeyedSubscript_(v4, v57, (uint64_t)CFSTR("IDSGroupSessionParticipantUpdateRelaySessionUUIDKey"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = (void *)objc_msgSend_initWithUUIDString_(v56, v60, (uint64_t)v59, v61);
  isInitiator_participantIdentifier_participantDestinationID_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID = (IDSGroupSessionParticipantUpdate *)objc_msgSend_initWithGroupUUID_isInitiator_participantIdentifier_participantDestinationID_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID_(self, v63, (uint64_t)v73, v64, v71, v69, v68, v67, v66, v43, v46, v49, v52, v78, v55, v62);

  return isInitiator_participantIdentifier_participantDestinationID_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID;
}

- (id)dictionaryRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t isInitiator;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  uint64_t updated;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  const char *v55;
  double v56;
  void *v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  const char *v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  const char *v70;
  uint64_t v71;
  double v72;
  void *v73;
  const char *v74;
  double v75;
  const char *v76;
  uint64_t v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  const char *v82;
  uint64_t v83;
  double v84;
  void *v85;
  const char *v86;
  double v87;
  const char *v88;
  uint64_t v89;
  double v90;
  void *v91;
  const char *v92;
  double v93;
  void *v94;
  const char *v95;
  double v96;
  const char *v97;
  uint64_t v98;
  double v99;
  void *v100;
  const char *v101;
  double v102;
  const char *v103;
  uint64_t v104;
  double v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  double v109;
  void *v110;
  const char *v111;
  double v112;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_groupUUID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, v13, CFSTR("IDSGroupSessionParticipantUpdateGroupUUIDKey"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  isInitiator = objc_msgSend_isInitiator(self, v15, v16, v17);
  objc_msgSend_numberWithBool_(v14, v19, isInitiator, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, v23, CFSTR("IDSGroupSessionParticipantUpdateIsInitiatorKey"));

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_participantIdentifier(self, v25, v26, v27);
  objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)v31, v33, CFSTR("IDSGroupSessionParticipantUpdateParticipantIdentifierKey"));

  objc_msgSend_participantDestinationID(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, v39, CFSTR("IDSGroupSessionParticipantUpdateParticipantDestinationIDKey"));

  v40 = (void *)MEMORY[0x1E0CB37E8];
  updated = objc_msgSend_participantUpdateType(self, v41, v42, v43);
  objc_msgSend_numberWithUnsignedInteger_(v40, v45, updated, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v48, (uint64_t)v47, v49, CFSTR("IDSGroupSessionParticipantUpdateMemberUpdateTypeKey"));

  v50 = (void *)MEMORY[0x1E0CB37E8];
  v54 = objc_msgSend_participantUpdateSubtype(self, v51, v52, v53);
  objc_msgSend_numberWithUnsignedInteger_(v50, v55, v54, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v58, (uint64_t)v57, v59, CFSTR("IDSGroupSessionParticipantUpdateMemberUpdateSubtypeKey"));

  v60 = (void *)MEMORY[0x1E0CB37E8];
  v64 = objc_msgSend_fromServer(self, v61, v62, v63);
  objc_msgSend_numberWithBool_(v60, v65, v64, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v67, v69, CFSTR("IDSGroupSessionParticipantUpdateFromServerKey"));

  objc_msgSend_serverDate(self, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, v75, CFSTR("IDSGroupSessionParticipantUpdateServerDateKey"));

  objc_msgSend_participantData(self, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v80, (uint64_t)v79, v81, CFSTR("IDSGroupSessionParticipantUpdateParticipantDataKey"));

  objc_msgSend_clientContextData(self, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v86, (uint64_t)v85, v87, CFSTR("IDSGroupSessionParticipantUpdateClientContextDataKey"));

  objc_msgSend_members(self, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___imArrayByApplyingBlock_(v91, v92, (uint64_t)&unk_1E3C1C6C0, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v95, (uint64_t)v94, v96, CFSTR("IDSGroupSessionParticipantUpdateMembersKey"));

  objc_msgSend_participantIDs(self, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v101, (uint64_t)v100, v102, CFSTR("IDSGroupSessionParticipantUpdateParticipantIDsKey"));

  objc_msgSend_relaySessionID(self, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v106, v107, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v111, (uint64_t)v110, v112, CFSTR("IDSGroupSessionParticipantUpdateRelaySessionUUIDKey"));

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const __CFString *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t updated;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_groupUUID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isInitiator(self, v9, v10, v11))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = objc_msgSend_participantIdentifier(self, v12, v13, v14);
  objc_msgSend_participantDestinationURI(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  updated = objc_msgSend_participantUpdateType(self, v21, v22, v23);
  v28 = objc_msgSend_participantUpdateSubtype(self, v25, v26, v27);
  objc_msgSend_stringWithFormat_(v3, v29, (uint64_t)CFSTR("<%@: %p groupUUID: %@, isInitiator: %@, participantIdentifier: %llu, participantDestinationID: %@, participantUpdateType: %lu, participantUpdateSubype: %lu>"), v30, v4, self, v8, v15, v16, v20, updated, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)debugDescription
{
  const char *v3;
  uint64_t v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  int isInitiator;
  const char *v13;
  uint64_t v14;
  double v15;
  const __CFString *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t updated;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  unsigned int v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  void *v55;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;

  v62 = (void *)MEMORY[0x1E0CB3940];
  v61 = objc_opt_class();
  objc_msgSend_groupUUID(self, v3, v4, v5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relaySessionID(self, v6, v7, v8);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  isInitiator = objc_msgSend_isInitiator(self, v9, v10, v11);
  v16 = CFSTR("NO");
  if (isInitiator)
    v16 = CFSTR("YES");
  v58 = v16;
  v57 = objc_msgSend_participantIdentifier(self, v13, v14, v15);
  objc_msgSend_participantDestinationURI(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  updated = objc_msgSend_participantUpdateType(self, v21, v22, v23);
  v28 = objc_msgSend_participantUpdateSubtype(self, v25, v26, v27);
  v32 = objc_msgSend_fromServer(self, v29, v30, v31);
  objc_msgSend_serverDate(self, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantData(self, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientContextData(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_members(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantIDs(self, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v62, v53, (uint64_t)CFSTR("%@: %p {\n\tgroupUUID: %@ (relaySessionID: %@)\n\tIsInitiator: %@\n\tparticipantIdentifier: %llu\n\tparticipantDestinationID: %@\n\tparticipantUpdateType: %lu\n\tparticipantUpdateSubtype: %lu\n\tfromServer: %d\n\tserverDate: %@\n\tparticipantData: %@\n\tclientContextData: %@\n\tmembers: %@\n\tparticipantIDs: %@\n}"), v54, v61, self, v60, v59, v58, v57, v20, updated, v28, v32, v36, v40, v44, v48, v52);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (NSString)participantDestinationID
{
  uint64_t v2;
  double v3;

  return (NSString *)objc_msgSend_prefixedURI(self->_participantDestinationURI, a2, v2, v3);
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (unint64_t)participantUpdateType
{
  return self->_participantUpdateType;
}

- (NSData)participantData
{
  return self->_participantData;
}

- (NSData)clientContextData
{
  return self->_clientContextData;
}

- (NSDictionary)participantIDs
{
  return self->_participantIDs;
}

- (NSUUID)relaySessionID
{
  return self->_relaySessionID;
}

- (IDSURI)participantDestinationURI
{
  return self->_participantDestinationURI;
}

- (unint64_t)participantUpdateSubtype
{
  return self->_participantUpdateSubtype;
}

- (BOOL)fromServer
{
  return self->_fromServer;
}

- (NSDate)serverDate
{
  return self->_serverDate;
}

- (NSArray)members
{
  return self->_members;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantDestinationID, 0);
  objc_storeStrong((id *)&self->_relaySessionID, 0);
  objc_storeStrong((id *)&self->_participantIDs, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_clientContextData, 0);
  objc_storeStrong((id *)&self->_participantData, 0);
  objc_storeStrong((id *)&self->_serverDate, 0);
  objc_storeStrong((id *)&self->_participantDestinationURI, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
}

@end
