@implementation CKRecordZone

- (CKRecordZoneID)zoneID
{
  CKRecordZone *v2;
  CKRecordZoneID *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_zoneID;
  objc_sync_exit(v2);

  return v3;
}

+ (CKRecordZone)defaultRecordZone
{
  if (qword_1ECD96F30 != -1)
    dispatch_once(&qword_1ECD96F30, &unk_1E1F58B78);
  return (CKRecordZone *)(id)qword_1ECD96F28;
}

- (CKRecordZone)initWithZoneName:(NSString *)zoneName
{
  NSString *v4;
  char v5;
  id v6;
  CKRecordZoneID *v7;
  const char *v8;
  void *v9;
  CKRecordZone *v10;
  void *v12;
  CKException *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;
  id v24;

  v4 = zoneName;
  v24 = 0;
  v5 = _CKCheckArgument((uint64_t)"zoneName", v4, 0, 1, 0, &v24);
  v6 = v24;
  if ((v5 & 1) == 0)
  {
    v12 = v6;
    v13 = [CKException alloc];
    v17 = objc_msgSend_code(v12, v14, v15, v16);
    objc_msgSend_localizedDescription(v12, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend_initWithCode_format_(v13, v22, v17, (uint64_t)CFSTR("%@"), v21);

    objc_exception_throw(v23);
  }

  v7 = [CKRecordZoneID alloc];
  v9 = (void *)objc_msgSend_initWithZoneName_ownerName_(v7, v8, (uint64_t)v4, (uint64_t)CFSTR("__defaultOwner__"));
  v10 = (CKRecordZone *)sub_18A5F8D5C(self, v9, 0);

  return v10;
}

- (CKRecordZone)initWithZoneID:(CKRecordZoneID *)zoneID
{
  CKRecordZoneID *v4;
  char v5;
  id v6;
  CKRecordZone *v7;
  void *v9;
  CKException *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  id v21;

  v4 = zoneID;
  v21 = 0;
  v5 = _CKCheckArgument((uint64_t)"zoneID", v4, 0, 1, 0, &v21);
  v6 = v21;
  if ((v5 & 1) == 0)
  {
    v9 = v6;
    v10 = [CKException alloc];
    v14 = objc_msgSend_code(v9, v11, v12, v13);
    objc_msgSend_localizedDescription(v9, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend_initWithCode_format_(v10, v19, v14, (uint64_t)CFSTR("%@"), v18);

    objc_exception_throw(v20);
  }

  v7 = (CKRecordZone *)sub_18A5F8D5C(self, v4, 0);
  return v7;
}

- (CKRecordZoneCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v4 = a3;
  objc_msgSend_zoneID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("zoneID"), (uint64_t)v8, 0);

  v13 = objc_msgSend_capabilities(self, v10, v11, v12);
  CKStringFromCapabilities(v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("capabilities"), (uint64_t)v15, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFeatures, 0);
  objc_storeStrong((id *)&self->_zonePCSModificationDate, 0);
  objc_storeStrong((id *)&self->_previousProtectionEtag, 0);
  objc_storeStrong((id *)&self->_zonePCSLastModifierDevice, 0);
  objc_storeStrong((id *)&self->_originalRequiredFeatures, 0);
  objc_storeStrong((id *)&self->_zoneishPCSKeysToRemove, 0);
  objc_storeStrong((id *)&self->_zonePCSKeysToRemove, 0);
  objc_storeStrong((id *)&self->_zoneishKeyID, 0);
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
  objc_storeStrong((id *)&self->_zoneishProtectionData, 0);
  objc_storeStrong((id *)&self->_protectionEtag, 0);
  objc_storeStrong((id *)&self->_protectionData, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_currentServerChangeToken, 0);
  objc_storeStrong((id *)&self->_updatedExpirationTimeInterval, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_invitedKeysToRemove, 0);
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

+ (id)systemRecordZone
{
  if (qword_1ECD96F40 != -1)
    dispatch_once(&qword_1ECD96F40, &unk_1E1F59938);
  return (id)qword_1ECD96F38;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKRecordZone *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
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
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;

  v4 = [CKRecordZone alloc];
  objc_msgSend_zoneID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_capabilities(self, v9, v10, v11);
  v13 = sub_18A5F8D5C(v4, v8, v12);

  v13[4] = objc_msgSend_deviceCount(self, v14, v15, v16);
  objc_msgSend_clientChangeToken(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_copy(v20, v21, v22, v23);
  v25 = (void *)*((_QWORD *)v13 + 11);
  *((_QWORD *)v13 + 11) = v24;

  objc_msgSend_currentServerChangeToken(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_copy(v29, v30, v31, v32);
  v34 = (void *)*((_QWORD *)v13 + 10);
  *((_QWORD *)v13 + 10) = v33;

  objc_msgSend_previousProtectionEtag(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_copy(v38, v39, v40, v41);
  v43 = (void *)*((_QWORD *)v13 + 21);
  *((_QWORD *)v13 + 21) = v42;

  *((_QWORD *)v13 + 22) = objc_msgSend_assetQuotaUsage(self, v44, v45, v46);
  *((_QWORD *)v13 + 23) = objc_msgSend_metadataQuotaUsage(self, v47, v48, v49);
  objc_msgSend_zonePCSModificationDate(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_copy(v53, v54, v55, v56);
  v58 = (void *)*((_QWORD *)v13 + 24);
  *((_QWORD *)v13 + 24) = v57;

  objc_msgSend_pcsKeyID(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_copy(v62, v63, v64, v65);
  v67 = (void *)*((_QWORD *)v13 + 15);
  *((_QWORD *)v13 + 15) = v66;

  objc_msgSend_zoneishKeyID(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend_copy(v71, v72, v73, v74);
  v76 = (void *)*((_QWORD *)v13 + 16);
  *((_QWORD *)v13 + 16) = v75;

  *((_BYTE *)v13 + 13) = objc_msgSend_serializeProtectionData(self, v77, v78, v79);
  objc_msgSend_protectionData(self, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend_copy(v83, v84, v85, v86);
  v88 = (void *)*((_QWORD *)v13 + 12);
  *((_QWORD *)v13 + 12) = v87;

  objc_msgSend_protectionEtag(self, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend_copy(v92, v93, v94, v95);
  v97 = (void *)*((_QWORD *)v13 + 13);
  *((_QWORD *)v13 + 13) = v96;

  objc_msgSend_zoneishProtectionData(self, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend_copy(v101, v102, v103, v104);
  v106 = (void *)*((_QWORD *)v13 + 14);
  *((_QWORD *)v13 + 14) = v105;

  *((_BYTE *)v13 + 12) = objc_msgSend_zoneKeyRollAllowed(self, v107, v108, v109);
  objc_msgSend_share(self, v110, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend_copy(v113, v114, v115, v116);
  v118 = (void *)*((_QWORD *)v13 + 6);
  *((_QWORD *)v13 + 6) = v117;

  objc_msgSend_invitedKeysToRemove(self, v119, v120, v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v122, v123, v124, v125);
  v126 = objc_claimAutoreleasedReturnValue();
  v127 = (void *)*((_QWORD *)v13 + 3);
  *((_QWORD *)v13 + 3) = v126;

  objc_msgSend_expirationDate(self, v128, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = objc_msgSend_copy(v131, v132, v133, v134);
  v136 = (void *)*((_QWORD *)v13 + 8);
  *((_QWORD *)v13 + 8) = v135;

  *((_BYTE *)v13 + 9) = objc_msgSend_isExpired(self, v137, v138, v139);
  *((_BYTE *)v13 + 10) = objc_msgSend_hasUpdatedExpirationTimeInterval(self, v140, v141, v142);
  objc_msgSend_updatedExpirationTimeInterval(self, v143, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = objc_msgSend_copy(v146, v147, v148, v149);
  v151 = (void *)*((_QWORD *)v13 + 9);
  *((_QWORD *)v13 + 9) = v150;

  objc_msgSend_requiredFeatures(self, v152, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend_copy(v155, v156, v157, v158);
  v160 = (void *)*((_QWORD *)v13 + 25);
  *((_QWORD *)v13 + 25) = v159;

  objc_msgSend_originalRequiredFeatures(self, v161, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = objc_msgSend_copy(v164, v165, v166, v167);
  v169 = (void *)*((_QWORD *)v13 + 19);
  *((_QWORD *)v13 + 19) = v168;

  objc_msgSend_zonePCSKeysToRemove(self, v170, v171, v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = objc_msgSend_copy(v173, v174, v175, v176);
  v178 = (void *)*((_QWORD *)v13 + 17);
  *((_QWORD *)v13 + 17) = v177;

  objc_msgSend_zoneishPCSKeysToRemove(self, v179, v180, v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = objc_msgSend_copy(v182, v183, v184, v185);
  v187 = (void *)*((_QWORD *)v13 + 18);
  *((_QWORD *)v13 + 18) = v186;

  return v13;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend_zoneID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, (uint64_t)CFSTR("zoneID"));

  objc_msgSend_properties(v3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v12;
}

- (NSArray)invitedKeysToRemove
{
  CKRecordZone *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_invitedKeysToRemove;
  objc_sync_exit(v2);

  return v3;
}

- (void)setInvitedKeysToRemove:(id)a3
{
  CKRecordZone *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *invitedKeysToRemove;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  invitedKeysToRemove = v4->_invitedKeysToRemove;
  v4->_invitedKeysToRemove = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (void)setZoneID:(id)a3
{
  CKRecordZone *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKRecordZoneID *zoneID;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_copy(v10, v5, v6, v7);
  zoneID = v4->_zoneID;
  v4->_zoneID = (CKRecordZoneID *)v8;

  objc_sync_exit(v4);
}

- (void)replaceZoneIDWith:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKRecordZone *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char isEqualToString;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  char v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CKRecordZoneID *zoneID;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  id v42;

  v42 = a3;
  if (!v42)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecordZone.m"), 186, CFSTR("Must not be nil"));

  }
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend_zoneName(v8->_zoneID, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v42, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v12, v17, (uint64_t)v16, v18);

  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21, v22);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, (uint64_t)v8, CFSTR("CKRecordZone.m"), 188, CFSTR("Must use the same zone name"));

  }
  objc_msgSend_ownerName(v8->_zoneID, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v42, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_isEqualToString_(v23, v28, (uint64_t)v27, v29);

  if ((v30 & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v31, v32, v33);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, (uint64_t)v8, CFSTR("CKRecordZone.m"), 189, CFSTR("Must use the same owner name"));

  }
  v34 = objc_msgSend_copy(v42, v31, v32, v33);
  zoneID = v8->_zoneID;
  v8->_zoneID = (CKRecordZoneID *)v34;

  objc_sync_exit(v8);
}

- (void)CKAssignToContainerWithID:(id)a3
{
  const char *v5;
  id Property;
  id v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  char *newValue;

  newValue = (char *)a3;
  if (self)
    Property = objc_getProperty(self, v5, 56, 1);
  else
    Property = 0;
  v7 = Property;
  v9 = v7;
  v10 = newValue;
  if (newValue && v7 && (objc_msgSend_isEqual_(v7, newValue, (uint64_t)newValue, v8) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecordZone.m"), 201, CFSTR("Cannot replace assigned container ID %@ with %@"), v9, newValue);

    if (!self)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (self)
LABEL_7:
    objc_setProperty_atomic_copy(self, v10, newValue, 56);
LABEL_8:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKRecordZone)initWithCoder:(id)a3
{
  id v4;
  CKRecordZone *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKRecordZoneID *zoneID;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSData *clientChangeToken;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  CKServerChangeToken *currentServerChangeToken;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSString *previousProtectionEtag;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSDate *zonePCSModificationDate;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSData *pcsKeyID;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSData *zoneishKeyID;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  NSData *protectionData;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSString *protectionEtag;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  NSData *zoneishProtectionData;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  CKReference *share;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  NSArray *invitedKeysToRemove;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  NSDate *expirationDate;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  NSNumber *updatedExpirationTimeInterval;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  CKRequiredFeatureSet *requiredFeatures;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  CKRequiredFeatureSet *originalRequiredFeatures;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  CKPCSKeysToRemove *zonePCSKeysToRemove;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  CKPCSKeysToRemove *zoneishPCSKeysToRemove;
  const char *v131;
  uint64_t v132;
  void *context;
  objc_super v135;

  v4 = a3;
  v135.receiver = self;
  v135.super_class = (Class)CKRecordZone;
  v5 = -[CKRecordZone init](&v135, sel_init);
  if (v5)
  {
    context = (void *)MEMORY[0x18D76DE4C]();
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("ZoneID"));
    v8 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("Capabilities"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_capabilities = objc_msgSend_unsignedIntegerValue(v12, v13, v14, v15);

    v5->_deviceCount = objc_msgSend_decodeInt32ForKey_(v4, v16, (uint64_t)CFSTR("DeviceCount"), v17);
    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("ClientChangeToken"));
    v20 = objc_claimAutoreleasedReturnValue();
    clientChangeToken = v5->_clientChangeToken;
    v5->_clientChangeToken = (NSData *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("CurrentServerChangeToken"));
    v24 = objc_claimAutoreleasedReturnValue();
    currentServerChangeToken = v5->_currentServerChangeToken;
    v5->_currentServerChangeToken = (CKServerChangeToken *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("PreviousProtectionEtag"));
    v28 = objc_claimAutoreleasedReturnValue();
    previousProtectionEtag = v5->_previousProtectionEtag;
    v5->_previousProtectionEtag = (NSString *)v28;

    v5->_assetQuotaUsage = objc_msgSend_decodeInt64ForKey_(v4, v30, (uint64_t)CFSTR("AssetQuotaUsage"), v31);
    v5->_metadataQuotaUsage = objc_msgSend_decodeInt64ForKey_(v4, v32, (uint64_t)CFSTR("MetadataQuotaUsage"), v33);
    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("PCSModificationDate"));
    v36 = objc_claimAutoreleasedReturnValue();
    zonePCSModificationDate = v5->_zonePCSModificationDate;
    v5->_zonePCSModificationDate = (NSDate *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)CFSTR("PCSKeyID"));
    v40 = objc_claimAutoreleasedReturnValue();
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSData *)v40;

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("ZoneishKeyID"));
    v44 = objc_claimAutoreleasedReturnValue();
    zoneishKeyID = v5->_zoneishKeyID;
    v5->_zoneishKeyID = (NSData *)v44;

    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, (uint64_t)CFSTR("ProtectionData"));
    v48 = objc_claimAutoreleasedReturnValue();
    protectionData = v5->_protectionData;
    v5->_protectionData = (NSData *)v48;

    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, (uint64_t)CFSTR("ProtectionEtag"));
    v52 = objc_claimAutoreleasedReturnValue();
    protectionEtag = v5->_protectionEtag;
    v5->_protectionEtag = (NSString *)v52;

    v54 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, (uint64_t)CFSTR("ZoneishProtectionData"));
    v56 = objc_claimAutoreleasedReturnValue();
    zoneishProtectionData = v5->_zoneishProtectionData;
    v5->_zoneishProtectionData = (NSData *)v56;

    v58 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, (uint64_t)CFSTR("ShareReference"));
    v60 = objc_claimAutoreleasedReturnValue();
    share = v5->_share;
    v5->_share = (CKReference *)v60;

    v62 = (void *)MEMORY[0x1E0C99E60];
    v63 = objc_opt_class();
    v64 = objc_opt_class();
    objc_msgSend_setWithObjects_(v62, v65, v63, v66, v64, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v68, (uint64_t)v67, (uint64_t)CFSTR("InvitedKeysToRemove"));
    v69 = objc_claimAutoreleasedReturnValue();
    invitedKeysToRemove = v5->_invitedKeysToRemove;
    v5->_invitedKeysToRemove = (NSArray *)v69;

    v71 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, (uint64_t)CFSTR("ExpirationDate"));
    v73 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v73;

    v5->_expired = objc_msgSend_decodeBoolForKey_(v4, v75, (uint64_t)CFSTR("Expired"), v76);
    v5->_hasUpdatedExpirationTimeInterval = objc_msgSend_decodeBoolForKey_(v4, v77, (uint64_t)CFSTR("HasUpdatedExpiration"), v78);
    v79 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v80, v79, (uint64_t)CFSTR("UpdatedExpiration"));
    v81 = objc_claimAutoreleasedReturnValue();
    updatedExpirationTimeInterval = v5->_updatedExpirationTimeInterval;
    v5->_updatedExpirationTimeInterval = (NSNumber *)v81;

    v83 = (void *)MEMORY[0x1E0C99E60];
    v84 = objc_opt_class();
    v85 = objc_opt_class();
    v86 = objc_opt_class();
    v87 = objc_opt_class();
    v88 = objc_opt_class();
    v89 = objc_opt_class();
    objc_msgSend_setWithObjects_(v83, v90, v84, v91, v85, v86, v87, v88, v89, 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v93, (uint64_t)v92, (uint64_t)CFSTR("RequiredFeaturesKey"));
    v94 = objc_claimAutoreleasedReturnValue();
    requiredFeatures = v5->_requiredFeatures;
    v5->_requiredFeatures = (CKRequiredFeatureSet *)v94;

    v96 = (void *)MEMORY[0x1E0C99E60];
    v97 = objc_opt_class();
    v98 = objc_opt_class();
    v99 = objc_opt_class();
    v100 = objc_opt_class();
    v101 = objc_opt_class();
    v102 = objc_opt_class();
    objc_msgSend_setWithObjects_(v96, v103, v97, v104, v98, v99, v100, v101, v102, 0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v106, (uint64_t)v105, (uint64_t)CFSTR("OriginalRequiredFeaturesKey"));
    v107 = objc_claimAutoreleasedReturnValue();
    originalRequiredFeatures = v5->_originalRequiredFeatures;
    v5->_originalRequiredFeatures = (CKRequiredFeatureSet *)v107;

    v109 = (void *)MEMORY[0x1E0C99E60];
    v110 = objc_opt_class();
    v111 = objc_opt_class();
    v112 = objc_opt_class();
    v113 = objc_opt_class();
    objc_msgSend_setWithObjects_(v109, v114, v110, v115, v111, v112, v113, 0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v117, (uint64_t)v116, (uint64_t)CFSTR("ZonePCSKeysToRemove"));
    v118 = objc_claimAutoreleasedReturnValue();
    zonePCSKeysToRemove = v5->_zonePCSKeysToRemove;
    v5->_zonePCSKeysToRemove = (CKPCSKeysToRemove *)v118;

    v120 = (void *)MEMORY[0x1E0C99E60];
    v121 = objc_opt_class();
    v122 = objc_opt_class();
    v123 = objc_opt_class();
    v124 = objc_opt_class();
    objc_msgSend_setWithObjects_(v120, v125, v121, v126, v122, v123, v124, 0);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v128, (uint64_t)v127, (uint64_t)CFSTR("ZoneishPCSKeysToRemove"));
    v129 = objc_claimAutoreleasedReturnValue();
    zoneishPCSKeysToRemove = v5->_zoneishPCSKeysToRemove;
    v5->_zoneishPCSKeysToRemove = (CKPCSKeysToRemove *)v129;

    v5->_applyPCSKeysToRemoveForTesting = objc_msgSend_decodeBoolForKey_(v4, v131, (uint64_t)CFSTR("ApplyPCSKeysToRemoveForTesting"), v132);
    objc_autoreleasePoolPop(context);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t isExpired;
  const char *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t hasUpdatedExpirationTimeInterval;
  const char *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  id v135;

  v135 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_zoneID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v9, (uint64_t)v8, (uint64_t)CFSTR("ZoneID"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend_capabilities(self, v11, v12, v13);
  objc_msgSend_numberWithUnsignedInteger_(v10, v15, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v18, (uint64_t)v17, (uint64_t)CFSTR("Capabilities"));

  v22 = objc_msgSend_deviceCount(self, v19, v20, v21);
  objc_msgSend_encodeInt32_forKey_(v135, v23, v22, (uint64_t)CFSTR("DeviceCount"));
  objc_msgSend_clientChangeToken(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v28, (uint64_t)v27, (uint64_t)CFSTR("ClientChangeToken"));

  objc_msgSend_currentServerChangeToken(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v33, (uint64_t)v32, (uint64_t)CFSTR("CurrentServerChangeToken"));

  objc_msgSend_previousProtectionEtag(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v38, (uint64_t)v37, (uint64_t)CFSTR("PreviousProtectionEtag"));

  v42 = objc_msgSend_assetQuotaUsage(self, v39, v40, v41);
  objc_msgSend_encodeInt64_forKey_(v135, v43, v42, (uint64_t)CFSTR("AssetQuotaUsage"));
  v47 = objc_msgSend_metadataQuotaUsage(self, v44, v45, v46);
  objc_msgSend_encodeInt64_forKey_(v135, v48, v47, (uint64_t)CFSTR("MetadataQuotaUsage"));
  objc_msgSend_zonePCSModificationDate(self, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v53, (uint64_t)v52, (uint64_t)CFSTR("PCSModificationDate"));

  objc_msgSend_pcsKeyID(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v58, (uint64_t)v57, (uint64_t)CFSTR("PCSKeyID"));

  objc_msgSend_zoneishKeyID(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v63, (uint64_t)v62, (uint64_t)CFSTR("ZoneishKeyID"));

  objc_msgSend_share(self, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v68, (uint64_t)v67, (uint64_t)CFSTR("ShareReference"));

  objc_msgSend_invitedKeysToRemove(self, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v73, (uint64_t)v72, (uint64_t)CFSTR("InvitedKeysToRemove"));

  if (!byte_1EDF6A0E0 && objc_msgSend_serializeProtectionData(self, v74, v75, v76))
  {
    objc_msgSend_protectionData(self, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v135, v78, (uint64_t)v77, (uint64_t)CFSTR("ProtectionData"));

    objc_msgSend_protectionEtag(self, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v135, v83, (uint64_t)v82, (uint64_t)CFSTR("ProtectionEtag"));

    objc_msgSend_zoneishProtectionData(self, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v135, v88, (uint64_t)v87, (uint64_t)CFSTR("ZoneishProtectionData"));

    if (!__sTestOverridesAvailable)
      goto LABEL_8;
    objc_msgSend_zonePCSKeysToRemove(self, v74, v75, v76);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v135, v90, (uint64_t)v89, (uint64_t)CFSTR("ZonePCSKeysToRemove"));

    objc_msgSend_zoneishPCSKeysToRemove(self, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v135, v95, (uint64_t)v94, (uint64_t)CFSTR("ZoneishPCSKeysToRemove"));

  }
  if (__sTestOverridesAvailable && objc_msgSend_applyPCSKeysToRemoveForTesting(self, v74, v75, v76))
  {
    v96 = objc_msgSend_applyPCSKeysToRemoveForTesting(self, v74, v75, v76);
    objc_msgSend_encodeBool_forKey_(v135, v97, v96, (uint64_t)CFSTR("ApplyPCSKeysToRemoveForTesting"));
    objc_msgSend_zonePCSKeysToRemove(self, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v135, v102, (uint64_t)v101, (uint64_t)CFSTR("ZonePCSKeysToRemove"));

    objc_msgSend_zoneishPCSKeysToRemove(self, v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v135, v107, (uint64_t)v106, (uint64_t)CFSTR("ZoneishPCSKeysToRemove"));

  }
LABEL_8:
  objc_msgSend_expirationDate(self, v74, v75, v76);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v109, (uint64_t)v108, (uint64_t)CFSTR("ExpirationDate"));

  isExpired = objc_msgSend_isExpired(self, v110, v111, v112);
  objc_msgSend_encodeBool_forKey_(v135, v114, isExpired, (uint64_t)CFSTR("Expired"));
  hasUpdatedExpirationTimeInterval = objc_msgSend_hasUpdatedExpirationTimeInterval(self, v115, v116, v117);
  objc_msgSend_encodeBool_forKey_(v135, v119, hasUpdatedExpirationTimeInterval, (uint64_t)CFSTR("HasUpdatedExpiration"));
  objc_msgSend_updatedExpirationTimeInterval(self, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v124, (uint64_t)v123, (uint64_t)CFSTR("UpdatedExpiration"));

  objc_msgSend_requiredFeatures(self, v125, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v129, (uint64_t)v128, (uint64_t)CFSTR("RequiredFeaturesKey"));

  objc_msgSend_originalRequiredFeatures(self, v130, v131, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v135, v134, (uint64_t)v133, (uint64_t)CFSTR("OriginalRequiredFeaturesKey"));

  objc_autoreleasePoolPop(v4);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordZone *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecordZone *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)setExpirationAfterTimeInterval:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend_setHasUpdatedExpirationTimeInterval_(self, v4, 1, v5);
  objc_msgSend_setUpdatedExpirationTimeInterval_(self, v6, (uint64_t)v8, v7);

}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (CKReference)share
{
  return (CKReference *)objc_getProperty(self, a2, 48, 1);
}

- (void)setShare:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (BOOL)applyPCSKeysToRemoveForTesting
{
  return self->_applyPCSKeysToRemoveForTesting;
}

- (void)setApplyPCSKeysToRemoveForTesting:(BOOL)a3
{
  self->_applyPCSKeysToRemoveForTesting = a3;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)isExpired
{
  return self->_expired;
}

- (void)setExpired:(BOOL)a3
{
  self->_expired = a3;
}

- (BOOL)hasUpdatedExpirationTimeInterval
{
  return self->_hasUpdatedExpirationTimeInterval;
}

- (void)setHasUpdatedExpirationTimeInterval:(BOOL)a3
{
  self->_hasUpdatedExpirationTimeInterval = a3;
}

- (NSNumber)updatedExpirationTimeInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUpdatedExpirationTimeInterval:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (int)deviceCount
{
  return self->_deviceCount;
}

- (void)setDeviceCount:(int)a3
{
  self->_deviceCount = a3;
}

- (CKServerChangeToken)currentServerChangeToken
{
  return (CKServerChangeToken *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCurrentServerChangeToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSData)clientChangeToken
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClientChangeToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSData)protectionData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setProtectionData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSString)protectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProtectionEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSData)zoneishProtectionData
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setZoneishProtectionData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSData)pcsKeyID
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPcsKeyID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSData)zoneishKeyID
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setZoneishKeyID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (CKPCSKeysToRemove)zonePCSKeysToRemove
{
  return (CKPCSKeysToRemove *)objc_getProperty(self, a2, 136, 1);
}

- (void)setZonePCSKeysToRemove:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (CKPCSKeysToRemove)zoneishPCSKeysToRemove
{
  return (CKPCSKeysToRemove *)objc_getProperty(self, a2, 144, 1);
}

- (void)setZoneishPCSKeysToRemove:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (CKRequiredFeatureSet)originalRequiredFeatures
{
  return (CKRequiredFeatureSet *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOriginalRequiredFeatures:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (BOOL)needsZoneishPCSRolled
{
  return self->_needsZoneishPCSRolled;
}

- (void)setNeedsZoneishPCSRolled:(BOOL)a3
{
  self->_needsZoneishPCSRolled = a3;
}

- (BOOL)zoneKeyRollAllowed
{
  return self->_zoneKeyRollAllowed;
}

- (void)setZoneKeyRollAllowed:(BOOL)a3
{
  self->_zoneKeyRollAllowed = a3;
}

- (NSString)zonePCSLastModifierDevice
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setZonePCSLastModifierDevice:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSString)previousProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPreviousProtectionEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (int64_t)assetQuotaUsage
{
  return self->_assetQuotaUsage;
}

- (void)setAssetQuotaUsage:(int64_t)a3
{
  self->_assetQuotaUsage = a3;
}

- (int64_t)metadataQuotaUsage
{
  return self->_metadataQuotaUsage;
}

- (void)setMetadataQuotaUsage:(int64_t)a3
{
  self->_metadataQuotaUsage = a3;
}

- (NSDate)zonePCSModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setZonePCSModificationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (BOOL)serializeProtectionData
{
  return self->_serializeProtectionData;
}

- (void)setSerializeProtectionData:(BOOL)a3
{
  self->_serializeProtectionData = a3;
}

- (CKRequiredFeatureSet)requiredFeatures
{
  return (CKRequiredFeatureSet *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRequiredFeatures:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

@end
