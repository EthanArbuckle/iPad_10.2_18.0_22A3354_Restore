@implementation CKRecord

- (CKRecordType)recordType
{
  CKRecord *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_recordType;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)dealloc
{
  _PCSIdentityData *signingPCSIdentity;
  objc_super v4;

  signingPCSIdentity = self->_signingPCSIdentity;
  if (signingPCSIdentity)
  {
    CFRelease(signingPCSIdentity);
    self->_signingPCSIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKRecord;
  -[CKRecord dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_protectionData, 0);
  objc_storeStrong((id *)&self->_modifiedByDevice, 0);
  objc_storeStrong((id *)&self->_mutableURL, 0);
  objc_storeStrong((id *)&self->_pcsKeysToRemove, 0);
  objc_storeStrong((id *)&self->_chainParentPublicKeyID, 0);
  objc_storeStrong((id *)&self->_chainProtectionInfo, 0);
  objc_storeStrong((id *)&self->_chainPrivateKey, 0);
  objc_storeStrong((id *)&self->_previousParent, 0);
  objc_storeStrong((id *)&self->_previousShare, 0);
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
  objc_storeStrong((id *)&self->_previousProtectionEtagFromUnitTest, 0);
  objc_storeStrong((id *)&self->_shareEtag, 0);
  objc_storeStrong((id *)&self->_zoneProtectionEtag, 0);
  objc_storeStrong((id *)&self->_protectionEtag, 0);
  objc_storeStrong((id *)&self->_previousProtectionEtag, 0);
  objc_storeStrong((id *)&self->_zoneishKeyID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_updatedExpirationTimeInterval, 0);
  objc_storeStrong((id *)&self->_encryptedValueStore, 0);
  objc_storeStrong((id *)&self->_valueStore, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedUserRecordID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_creatorUserRecordID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_pluginFields, 0);
  objc_storeStrong((id *)&self->_tombstonedPublicKeyIDs, 0);
  objc_storeStrong((id *)&self->_allPCSKeyIDs, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_mutableEncryptedPSK, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void)setKnownToServer:(BOOL)a3
{
  self->_knownToServer = a3;
}

- (void)setEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSString)recordChangeTag
{
  CKRecord *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_etag;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  void (*MethodImplementation)(void);
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v7[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 0);

  MethodImplementation = class_getMethodImplementation((Class)a1, sel_initWithRecordType_recordID_);
  class_addMethod((Class)a1, sel__initSkippingValidationWithRecordType_recordID_, MethodImplementation, "@@:@@");
}

- (CKRecord)initWithRecordType:(CKRecordType)recordType recordID:(CKRecordID *)recordID
{
  NSString *v6;
  CKRecordID *v7;
  char v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  const char *v16;
  CKRecord *inited;
  CKException *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  id v30;
  id v31;

  v6 = recordType;
  v7 = recordID;
  v31 = 0;
  v8 = _CKCheckArgument((uint64_t)"recordType", v6, 1, 1, 0, &v31);
  v9 = v31;
  v10 = v9;
  if ((v8 & 1) == 0
    || (v9,
        objc_msgSend_recordName(v7, v11, v12, v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v30 = 0,
        v15 = _CKCheckArgument((uint64_t)"recordID.recordName", v14, 0, 1, 0, &v30),
        v10 = v30,
        v14,
        (v15 & 1) == 0))
  {
    v19 = [CKException alloc];
    v23 = objc_msgSend_code(v10, v20, v21, v22);
    objc_msgSend_localizedDescription(v10, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend_initWithCode_format_(v19, v28, v23, (uint64_t)CFSTR("%@"), v27);

    objc_exception_throw(v29);
  }

  inited = (CKRecord *)objc_msgSend_initInternalSkippingValidationWithRecordType_recordID_(self, v16, (uint64_t)v6, (uint64_t)v7);
  return inited;
}

- (CKRecord)initWithCoder:(id)a3
{
  id v4;
  CKRecord *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSString *recordType;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  CKRecordID *recordID;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CKRecordValueStore *valueStore;
  CKRecordValueStore **p_valueStore;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  CKEncryptedRecordValueStore *encryptedValueStore;
  CKEncryptedRecordValueStore *v26;
  CKRecordValueStore *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  CKRecordValueStore *v31;
  CKEncryptedRecordValueStore *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  CKEncryptedRecordValueStore *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  id v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  int v105;
  id *v106;
  id v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  NSDictionary *pluginFields;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  NSDate *creationDate;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  NSDate *modificationDate;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  CKRecordID *creatorUserRecordID;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  CKRecordID *lastModifiedUserRecordID;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  NSString *etag;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  NSArray *conflictLoserEtags;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  NSString *modifiedByDevice;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  NSData *zoneishKeyID;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  NSData *protectionData;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  NSString *protectionEtag;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  NSString *previousProtectionEtag;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  NSString *zoneProtectionEtag;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  NSString *shareEtag;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  CKReference *share;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  CKReference *previousShare;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  CKReference *parent;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  CKReference *previousParent;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  NSData *chainParentPublicKeyID;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  NSArray *tombstonedPublicKeyIDs;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  CKEncryptedData *chainPrivateKey;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  CKEncryptedData *mutableEncryptedPSK;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  NSData *chainProtectionInfo;
  const char *v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  NSString *routingKey;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  NSString *baseToken;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  NSString *displayedHostname;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  NSURL *mutableURL;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  NSString *previousProtectionEtagFromUnitTest;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  NSData *pcsKeyID;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  NSArray *allPCSKeyIDs;
  CKRecordValueStore *v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  NSDate *expirationDate;
  const char *v283;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  NSNumber *updatedExpirationTimeInterval;
  const char *v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  CKPCSKeysToRemove *pcsKeysToRemove;
  const char *v306;
  uint64_t v307;
  CKRecord *v308;
  CKRecord *v310;
  id v311;
  void *context;
  CKEncryptedRecordValueStore **p_encryptedValueStore;
  void *v314;
  void *v315;
  void *v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  objc_super v321;
  _QWORD v322[2];
  _BYTE v323[128];
  _QWORD v324[3];
  _QWORD v325[4];

  v325[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v321.receiver = self;
  v321.super_class = (Class)CKRecord;
  v5 = -[CKRecord init](&v321, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_opt_class();
      objc_msgSend_setClass_forClassName_(v4, v8, v7, (uint64_t)CFSTR("CKInternalEncryptedData"));
    }
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("RecordType"));
    v11 = objc_claimAutoreleasedReturnValue();
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v11;

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("RecordID"));
    v15 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v15;

    if (!v5->_recordType || !v5->_recordID)
    {
      objc_autoreleasePoolPop(v6);
      v308 = 0;
      goto LABEL_44;
    }
    context = v6;
    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("ValueStore"));
    v19 = objc_claimAutoreleasedReturnValue();
    p_valueStore = &v5->_valueStore;
    valueStore = v5->_valueStore;
    v5->_valueStore = (CKRecordValueStore *)v19;

    if (v5->_valueStore)
      objc_storeWeak((id *)&v5->_valueStore->_record, v5);
    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("EncryptedValueStore"));
    v24 = objc_claimAutoreleasedReturnValue();
    encryptedValueStore = v5->_encryptedValueStore;
    v5->_encryptedValueStore = (CKEncryptedRecordValueStore *)v24;

    p_encryptedValueStore = &v5->_encryptedValueStore;
    v26 = v5->_encryptedValueStore;
    if (v26)
      objc_storeWeak((id *)&v26->super._record, v5);
    if (!*p_valueStore)
    {
      v27 = [CKRecordValueStore alloc];
      v30 = objc_msgSend_initWithRecord_(v27, v28, (uint64_t)v5, v29);
      v31 = v5->_valueStore;
      v5->_valueStore = (CKRecordValueStore *)v30;

    }
    if (!*p_encryptedValueStore)
    {
      v32 = [CKEncryptedRecordValueStore alloc];
      v35 = objc_msgSend_initWithRecord_(v32, v33, (uint64_t)v5, v34);
      v36 = v5->_encryptedValueStore;
      v5->_encryptedValueStore = (CKEncryptedRecordValueStore *)v35;

    }
    if (*p_valueStore)
      (*p_valueStore)->_trackChanges = 0;
    if (*p_encryptedValueStore)
      (*p_encryptedValueStore)->super._trackChanges = 0;
    CKAcceptableValueClasses();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v325[0] = objc_opt_class();
    v325[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)v325, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setByAddingObjectsFromArray_(v37, v40, (uint64_t)v39, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v43, (uint64_t)v42, (uint64_t)CFSTR("RecordValues"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend_mutableCopy(v44, v45, v46, v47);

    CKAcceptableValueClasses();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v324[0] = objc_opt_class();
    v324[1] = objc_opt_class();
    v324[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v50, (uint64_t)v324, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setByAddingObjectsFromArray_(v49, v52, (uint64_t)v51, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v55, (uint64_t)v54, (uint64_t)CFSTR("OriginalValues"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v316 = (void *)objc_msgSend_mutableCopy(v56, v57, v58, v59);

    v60 = (void *)MEMORY[0x1E0C99E60];
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    objc_msgSend_setWithObjects_(v60, v63, v61, v64, v62, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v66, (uint64_t)v65, (uint64_t)CFSTR("ChangedKeys"));
    v314 = (void *)objc_claimAutoreleasedReturnValue();

    v315 = v48;
    if (objc_msgSend_count(v48, v67, v68, v69) || objc_msgSend_count(v316, v70, v71, v72))
    {
      v310 = v5;
      v311 = v4;
      v73 = (void *)objc_opt_new();
      objc_msgSend_allKeys(v48, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v73, v78, (uint64_t)v77, v79);

      objc_msgSend_allKeys(v316, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v73, v84, (uint64_t)v83, v85);

      objc_msgSend_allObjects(v314, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v73, v90, (uint64_t)v89, v91);

      v319 = 0u;
      v320 = 0u;
      v317 = 0u;
      v318 = 0u;
      v92 = v73;
      v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v317, (uint64_t)v323, 16);
      if (v94)
      {
        v97 = v94;
        v98 = *(_QWORD *)v318;
        do
        {
          for (i = 0; i != v97; ++i)
          {
            if (*(_QWORD *)v318 != v98)
              objc_enumerationMutation(v92);
            v100 = *(_QWORD *)(*((_QWORD *)&v317 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v315, v95, v100, v96);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v316, v102, v100, v103);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            if ((sub_18A741750(v101) & 1) != 0 || (v105 = sub_18A741750(v104), v106 = (id *)p_valueStore, v105))
              v106 = (id *)p_encryptedValueStore;
            v107 = *v106;
            v111 = v107;
            if (v101)
            {
              objc_msgSend_values(v107, v108, v109, v110);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v112, v113, (uint64_t)v101, v100);

            }
            if (v104)
            {
              objc_msgSend_originalValues(v111, v108, v109, v110);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v114, v115, (uint64_t)v104, v100);

            }
            if (objc_msgSend_containsObject_(v314, v108, v100, v110))
            {
              objc_msgSend_changedKeysSet(v111, v116, v117, v118);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v119, v120, v100, v121);

            }
          }
          v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v95, (uint64_t)&v317, (uint64_t)v323, 16);
        }
        while (v97);
      }

      v5 = v310;
      v4 = v311;
    }
    CKAcceptableValueClasses();
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v322[0] = objc_opt_class();
    v322[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v123, (uint64_t)v322, 2);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setByAddingObjectsFromArray_(v122, v125, (uint64_t)v124, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v128, (uint64_t)v127, (uint64_t)CFSTR("PluginFields"));
    v129 = objc_claimAutoreleasedReturnValue();
    pluginFields = v5->_pluginFields;
    v5->_pluginFields = (NSDictionary *)v129;

    v131 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v132, v131, (uint64_t)CFSTR("RecordCtime"));
    v133 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v133;

    v135 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v136, v135, (uint64_t)CFSTR("RecordMtime"));
    v137 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v137;

    v139 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v140, v139, (uint64_t)CFSTR("CreatorUserRecordID"));
    v141 = objc_claimAutoreleasedReturnValue();
    creatorUserRecordID = v5->_creatorUserRecordID;
    v5->_creatorUserRecordID = (CKRecordID *)v141;

    v143 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v144, v143, (uint64_t)CFSTR("LastModifiedUserRecordID"));
    v145 = objc_claimAutoreleasedReturnValue();
    lastModifiedUserRecordID = v5->_lastModifiedUserRecordID;
    v5->_lastModifiedUserRecordID = (CKRecordID *)v145;

    v147 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v148, v147, (uint64_t)CFSTR("ETag"));
    v149 = objc_claimAutoreleasedReturnValue();
    etag = v5->_etag;
    v5->_etag = (NSString *)v149;

    v151 = (void *)MEMORY[0x1E0C99E60];
    v152 = objc_opt_class();
    v153 = objc_opt_class();
    objc_msgSend_setWithObjects_(v151, v154, v152, v155, v153, 0);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v157, (uint64_t)v156, (uint64_t)CFSTR("ConflictLoserEtags"));
    v158 = objc_claimAutoreleasedReturnValue();
    conflictLoserEtags = v5->_conflictLoserEtags;
    v5->_conflictLoserEtags = (NSArray *)v158;

    v5->_knownToServer = objc_msgSend_decodeBoolForKey_(v4, v160, (uint64_t)CFSTR("KnownToServer"), v161);
    v162 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v163, v162, (uint64_t)CFSTR("ModifiedByDevice"));
    v164 = objc_claimAutoreleasedReturnValue();
    modifiedByDevice = v5->_modifiedByDevice;
    v5->_modifiedByDevice = (NSString *)v164;

    v5->_wasCached = objc_msgSend_decodeBoolForKey_(v4, v166, (uint64_t)CFSTR("WasCached"), v167);
    v168 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v169, v168, (uint64_t)CFSTR("ZoneishKeyID"));
    v170 = objc_claimAutoreleasedReturnValue();
    zoneishKeyID = v5->_zoneishKeyID;
    v5->_zoneishKeyID = (NSData *)v170;

    v172 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v173, v172, (uint64_t)CFSTR("ProtectionData"));
    v174 = objc_claimAutoreleasedReturnValue();
    protectionData = v5->_protectionData;
    v5->_protectionData = (NSData *)v174;

    v176 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v177, v176, (uint64_t)CFSTR("ProtectionDataEtag"));
    v178 = objc_claimAutoreleasedReturnValue();
    protectionEtag = v5->_protectionEtag;
    v5->_protectionEtag = (NSString *)v178;

    v180 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v181, v180, (uint64_t)CFSTR("PreviousProtectionDataEtag"));
    v182 = objc_claimAutoreleasedReturnValue();
    previousProtectionEtag = v5->_previousProtectionEtag;
    v5->_previousProtectionEtag = (NSString *)v182;

    v184 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v185, v184, (uint64_t)CFSTR("ZoneProtectionDataEtag"));
    v186 = objc_claimAutoreleasedReturnValue();
    zoneProtectionEtag = v5->_zoneProtectionEtag;
    v5->_zoneProtectionEtag = (NSString *)v186;

    v188 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v189, v188, (uint64_t)CFSTR("ShareEtag"));
    v190 = objc_claimAutoreleasedReturnValue();
    shareEtag = v5->_shareEtag;
    v5->_shareEtag = (NSString *)v190;

    v192 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v193, v192, (uint64_t)CFSTR("ShareReference"));
    v194 = objc_claimAutoreleasedReturnValue();
    share = v5->_share;
    v5->_share = (CKReference *)v194;

    v196 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v197, v196, (uint64_t)CFSTR("PreviousShareReference"));
    v198 = objc_claimAutoreleasedReturnValue();
    previousShare = v5->_previousShare;
    v5->_previousShare = (CKReference *)v198;

    v5->_hasUpdatedShare = objc_msgSend_decodeBoolForKey_(v4, v200, (uint64_t)CFSTR("HasUpdatedShareReference"), v201);
    v202 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v203, v202, (uint64_t)CFSTR("ParentReference"));
    v204 = objc_claimAutoreleasedReturnValue();
    parent = v5->_parent;
    v5->_parent = (CKReference *)v204;

    v206 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v207, v206, (uint64_t)CFSTR("PreviousParentReference"));
    v208 = objc_claimAutoreleasedReturnValue();
    previousParent = v5->_previousParent;
    v5->_previousParent = (CKReference *)v208;

    v5->_hasUpdatedParent = objc_msgSend_decodeBoolForKey_(v4, v210, (uint64_t)CFSTR("HasUpdatedParentReference"), v211);
    v212 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v213, v212, (uint64_t)CFSTR("ChainParentPublicKeyID"));
    v214 = objc_claimAutoreleasedReturnValue();
    chainParentPublicKeyID = v5->_chainParentPublicKeyID;
    v5->_chainParentPublicKeyID = (NSData *)v214;

    v216 = (void *)MEMORY[0x1E0C99E60];
    v217 = objc_opt_class();
    v218 = objc_opt_class();
    objc_msgSend_setWithObjects_(v216, v219, v217, v220, v218, 0);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v222, (uint64_t)v221, (uint64_t)CFSTR("TombstonedPublicKeyIDs"));
    v223 = objc_claimAutoreleasedReturnValue();
    tombstonedPublicKeyIDs = v5->_tombstonedPublicKeyIDs;
    v5->_tombstonedPublicKeyIDs = (NSArray *)v223;

    v225 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v226, v225, (uint64_t)CFSTR("ChainPrivateKey"));
    v227 = objc_claimAutoreleasedReturnValue();
    chainPrivateKey = v5->_chainPrivateKey;
    v5->_chainPrivateKey = (CKEncryptedData *)v227;

    v229 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v230, v229, (uint64_t)CFSTR("MutableEncryptedPublicSharingKey"));
    v231 = objc_claimAutoreleasedReturnValue();
    mutableEncryptedPSK = v5->_mutableEncryptedPSK;
    v5->_mutableEncryptedPSK = (CKEncryptedData *)v231;

    v233 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v234, v233, (uint64_t)CFSTR("ChainProtectionData"));
    v235 = objc_claimAutoreleasedReturnValue();
    chainProtectionInfo = v5->_chainProtectionInfo;
    v5->_chainProtectionInfo = (NSData *)v235;

    v5->_wantsChainPCS = objc_msgSend_decodeBoolForKey_(v4, v237, (uint64_t)CFSTR("WantsChainPCSKey"), v238);
    v5->_useLightweightPCS = objc_msgSend_decodeBoolForKey_(v4, v239, (uint64_t)CFSTR("UseLightweightPCS"), v240);
    v5->_permission = objc_msgSend_decodeIntegerForKey_(v4, v241, (uint64_t)CFSTR("Permission"), v242);
    v5->_wantsPublicSharingKey = objc_msgSend_decodeBoolForKey_(v4, v243, (uint64_t)CFSTR("WantsPublicSharingKey"), v244);
    v245 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v246, v245, (uint64_t)CFSTR("RoutingKey"));
    v247 = objc_claimAutoreleasedReturnValue();
    routingKey = v5->_routingKey;
    v5->_routingKey = (NSString *)v247;

    v249 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v250, v249, (uint64_t)CFSTR("BaseToken"));
    v251 = objc_claimAutoreleasedReturnValue();
    baseToken = v5->_baseToken;
    v5->_baseToken = (NSString *)v251;

    v253 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v254, v253, (uint64_t)CFSTR("DisplayedHostname"));
    v255 = objc_claimAutoreleasedReturnValue();
    displayedHostname = v5->_displayedHostname;
    v5->_displayedHostname = (NSString *)v255;

    v257 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v258, v257, (uint64_t)CFSTR("URL"));
    v259 = objc_claimAutoreleasedReturnValue();
    mutableURL = v5->_mutableURL;
    v5->_mutableURL = (NSURL *)v259;

    v261 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v262, v261, (uint64_t)CFSTR("PreviousProtectionDataEtagFromUnitTest"));
    v263 = objc_claimAutoreleasedReturnValue();
    previousProtectionEtagFromUnitTest = v5->_previousProtectionEtagFromUnitTest;
    v5->_previousProtectionEtagFromUnitTest = (NSString *)v263;

    v265 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v266, v265, (uint64_t)CFSTR("PCSKeyID"));
    v267 = objc_claimAutoreleasedReturnValue();
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSData *)v267;

    v269 = (void *)MEMORY[0x1E0C99E60];
    v270 = objc_opt_class();
    v271 = objc_opt_class();
    objc_msgSend_setWithObjects_(v269, v272, v270, v273, v271, 0);
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v275, (uint64_t)v274, (uint64_t)CFSTR("AllPCSKeyIDs"));
    v276 = objc_claimAutoreleasedReturnValue();
    allPCSKeyIDs = v5->_allPCSKeyIDs;
    v5->_allPCSKeyIDs = (NSArray *)v276;

    v5->_trackChanges = 1;
    v278 = v5->_valueStore;
    if (v278)
      v278->_trackChanges = 1;
    if (*p_encryptedValueStore)
      (*p_encryptedValueStore)->super._trackChanges = 1;
    v279 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v280, v279, (uint64_t)CFSTR("ExpirationDate"));
    v281 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v281;

    v5->_expired = objc_msgSend_decodeBoolForKey_(v4, v283, (uint64_t)CFSTR("Expired"), v284);
    v5->_hasUpdatedExpirationTimeInterval = objc_msgSend_decodeBoolForKey_(v4, v285, (uint64_t)CFSTR("HasUpdatedExpiration"), v286);
    v287 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v288, v287, (uint64_t)CFSTR("UpdatedExpiration"));
    v289 = objc_claimAutoreleasedReturnValue();
    updatedExpirationTimeInterval = v5->_updatedExpirationTimeInterval;
    v5->_updatedExpirationTimeInterval = (NSNumber *)v289;

    v5->_isMergeableValueDeltaRecord = objc_msgSend_decodeBoolForKey_(v4, v291, (uint64_t)CFSTR("MergeableValueDeltaRecord"), v292);
    v5->_needsRollAndCounterSign = objc_msgSend_decodeBoolForKey_(v4, v293, (uint64_t)CFSTR("NeedsRollAndCounterSignKey"), v294);
    v295 = (void *)MEMORY[0x1E0C99E60];
    v296 = objc_opt_class();
    v297 = objc_opt_class();
    v298 = objc_opt_class();
    v299 = objc_opt_class();
    objc_msgSend_setWithObjects_(v295, v300, v296, v301, v297, v298, v299, 0);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v303, (uint64_t)v302, (uint64_t)CFSTR("PCSKeysToRemove"));
    v304 = objc_claimAutoreleasedReturnValue();
    pcsKeysToRemove = v5->_pcsKeysToRemove;
    v5->_pcsKeysToRemove = (CKPCSKeysToRemove *)v304;

    v5->_applyPCSKeysToRemoveForTesting = objc_msgSend_decodeBoolForKey_(v4, v306, (uint64_t)CFSTR("ApplyPCSKeysToRemoveForTesting"), v307);
    objc_autoreleasePoolPop(context);
  }
  v308 = v5;
LABEL_44:

  return v308;
}

- (id)initInternalSkippingValidationWithRecordType:(id)a3 recordID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKRecord *v11;
  uint64_t v12;
  NSString *recordType;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CKRecordID *recordID;
  CKRecordValueStore *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CKRecordValueStore *valueStore;
  CKEncryptedRecordValueStore *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  CKEncryptedRecordValueStore *encryptedValueStore;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)CKRecord;
  v11 = -[CKRecord init](&v30, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    recordType = v11->_recordType;
    v11->_recordType = (NSString *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    recordID = v11->_recordID;
    v11->_recordID = (CKRecordID *)v17;

    v19 = [CKRecordValueStore alloc];
    v22 = objc_msgSend_initWithRecord_(v19, v20, (uint64_t)v11, v21);
    valueStore = v11->_valueStore;
    v11->_valueStore = (CKRecordValueStore *)v22;

    v24 = [CKEncryptedRecordValueStore alloc];
    v27 = objc_msgSend_initWithRecord_(v24, v25, (uint64_t)v11, v26);
    encryptedValueStore = v11->_encryptedValueStore;
    v11->_encryptedValueStore = (CKEncryptedRecordValueStore *)v27;

    v11->_knownToServer = 0;
    v11->_trackChanges = 1;
    v11->_hasUpdatedExpirationTimeInterval = 0;
  }

  return v11;
}

- (void)setConflictLoserEtags:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *conflictLoserEtags;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  conflictLoserEtags = v4->_conflictLoserEtags;
  v4->_conflictLoserEtags = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (void)setObject:(id)object forKey:(CKRecordFieldKey)key
{
  NSString *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v6 = key;
  v7 = object;
  objc_msgSend_valueStore(self, v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v12, v11, (uint64_t)v7, (uint64_t)v6);

}

- (void)setTrackChanges:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  CKRecord *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_trackChanges = a3;
  objc_msgSend_valueStore(obj, v4, v5, v6);
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[8] = a3;

  objc_msgSend_encryptedValueStore(obj, v8, v9, v10);
  v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v11[8] = a3;

  objc_sync_exit(obj);
}

- (CKEncryptedRecordValueStore)encryptedValueStore
{
  return (CKEncryptedRecordValueStore *)objc_getProperty(self, a2, 176, 1);
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 128, 1);
}

- (id)objectForKeyedSubscript:(CKRecordFieldKey)key
{
  NSString *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  SEL v12;
  const char *v13;
  uint64_t v14;
  void (*v15)(CKRecord *, SEL);
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  v4 = key;
  sub_18A5E9588();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_containsObject_(v5, v6, (uint64_t)v4, v7);

  if (v8)
  {
    v12 = NSSelectorFromString(v4);
    v15 = (void (*)(CKRecord *, SEL))objc_msgSend_methodForSelector_(self, v13, (uint64_t)v12, v14);
    v15(self, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_valueStore(self, v9, v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v4, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)objectForKey:(CKRecordFieldKey)key
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = key;
  objc_msgSend_valueStore(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CKRecordValueStore)valueStore
{
  return (CKRecordValueStore *)objc_getProperty(self, a2, 168, 1);
}

- (CKRecord)initWithRecordTransport:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  CKRecord *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_contents(v4, v5, v6, v7) == 1)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3710]);
    objc_msgSend_localSerialization(v4, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v14 = (void *)objc_msgSend_initForReadingFromData_error_(v8, v13, (uint64_t)v12, (uint64_t)&v21);
    v15 = v21;

    if (v14)
    {
      self = (CKRecord *)(id)objc_msgSend_initWithCoder_(self, v16, (uint64_t)v14, v17);
      v18 = self;
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v19 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_error_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_ERROR, "Unable to create an unarchiver from record transport %@", buf, 0xCu);
      }
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (CKRecord)init
{
  CKException *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = [CKException alloc];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, (uint64_t)CFSTR("You must call -[%@ initWithRecordType:]"), v5);

  objc_exception_throw(v7);
}

- (CKRecord)initWithRecordType:(CKRecordType)recordType
{
  NSString *v4;
  CKRecordID *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  CKRecord *v11;

  v4 = recordType;
  v5 = [CKRecordID alloc];
  CKCreateGUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_initWithRecordName_(v5, v7, (uint64_t)v6, v8);

  v11 = (CKRecord *)objc_msgSend_initWithRecordType_recordID_(self, v10, (uint64_t)v4, (uint64_t)v9);
  return v11;
}

- (CKRecord)initWithRecordType:(CKRecordType)recordType zoneID:(CKRecordZoneID *)zoneID
{
  CKRecordZoneID *v6;
  NSString *v7;
  CKRecordID *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  CKRecord *v13;

  v6 = zoneID;
  v7 = recordType;
  v8 = [CKRecordID alloc];
  CKCreateGUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithRecordName_zoneID_(v8, v10, (uint64_t)v9, (uint64_t)v6);

  v13 = (CKRecord *)objc_msgSend_initWithRecordType_recordID_(self, v12, (uint64_t)v7, (uint64_t)v11);
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend_copyWithZone_userFields_(self, a2, (uint64_t)a3, 1);
}

- (id)copyWithZone:(_NSZone *)a3 userFields:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a4;
  objc_msgSend_recordID(self, a2, (uint64_t)a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_copyWithZone_recordID_userFields_(self, v8, (uint64_t)a3, (uint64_t)v7, v4);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3 recordID:(id)a4 userFields:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  const char *v9;
  void *v10;

  v5 = a5;
  objc_msgSend_recordID(self, a2, (uint64_t)a3, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copyWithZone_recordID_userFields_systemFields_(self, v9, (uint64_t)a3, (uint64_t)v8, v5, 1);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3 recordID:(id)a4 userFields:(BOOL)a5 systemFields:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t inited;
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
  uint64_t v29;
  void *v30;
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
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
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
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  void *v350;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  v10 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_recordType(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  inited = objc_msgSend_initInternalSkippingValidationWithRecordType_recordID_(v10, v15, (uint64_t)v14, (uint64_t)v9);

  if (v7)
  {
    objc_msgSend_valueStore(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_copy(v20, v21, v22, v23);
    v25 = *(void **)(inited + 168);
    *(_QWORD *)(inited + 168) = v24;

    v29 = *(_QWORD *)(inited + 168);
    if (v29)
      objc_storeWeak((id *)(v29 + 40), (id)inited);
    objc_msgSend_encryptedValueStore(self, v26, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_copy(v30, v31, v32, v33);
    v35 = *(void **)(inited + 176);
    *(_QWORD *)(inited + 176) = v34;

    v39 = *(_QWORD *)(inited + 176);
    if (v39)
      objc_storeWeak((id *)(v39 + 40), (id)inited);
    objc_msgSend_pluginFields(self, v36, v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPluginFields_((void *)inited, v41, (uint64_t)v40, v42);

  }
  if (v6)
  {
    objc_msgSend_creationDate(self, v17, v18, v19);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_copy(v43, v44, v45, v46);
    v48 = *(void **)(inited + 144);
    *(_QWORD *)(inited + 144) = v47;

    objc_msgSend_modificationDate(self, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_copy(v52, v53, v54, v55);
    v57 = *(void **)(inited + 160);
    *(_QWORD *)(inited + 160) = v56;

    objc_msgSend_creatorUserRecordID(self, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_copy(v61, v62, v63, v64);
    v66 = *(void **)(inited + 136);
    *(_QWORD *)(inited + 136) = v65;

    objc_msgSend_lastModifiedUserRecordID(self, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_copy(v70, v71, v72, v73);
    v75 = *(void **)(inited + 152);
    *(_QWORD *)(inited + 152) = v74;

    objc_msgSend_modifiedByDevice(self, v76, v77, v78);
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = *(void **)(inited + 320);
    *(_QWORD *)(inited + 320) = v79;

    objc_msgSend_etag(self, v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend_copy(v84, v85, v86, v87);
    v89 = *(void **)(inited + 16);
    *(_QWORD *)(inited + 16) = v88;

    objc_msgSend_conflictLoserEtags(self, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDeepCopy(v93, v94, v95, v96);
    v97 = objc_claimAutoreleasedReturnValue();
    v98 = *(void **)(inited + 120);
    *(_QWORD *)(inited + 120) = v97;

    *(_BYTE *)(inited + 34) = objc_msgSend_isKnownToServer(self, v99, v100, v101);
    *(_BYTE *)(inited + 35) = objc_msgSend_wasCached(self, v102, v103, v104);
    *(_BYTE *)(inited + 30) = objc_msgSend_serializeProtectionData(self, v105, v106, v107);
    objc_msgSend_protectionData(self, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_copy(v111, v112, v113, v114);
    v116 = *(void **)(inited + 328);
    *(_QWORD *)(inited + 328) = v115;

    objc_msgSend_previousProtectionEtag(self, v117, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_copy(v120, v121, v122, v123);
    v125 = *(void **)(inited + 208);
    *(_QWORD *)(inited + 208) = v124;

    objc_msgSend_protectionEtag(self, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend_copy(v129, v130, v131, v132);
    v134 = *(void **)(inited + 216);
    *(_QWORD *)(inited + 216) = v133;

    objc_msgSend_zoneProtectionEtag(self, v135, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend_copy(v138, v139, v140, v141);
    v143 = *(void **)(inited + 224);
    *(_QWORD *)(inited + 224) = v142;

    objc_msgSend_shareEtag(self, v144, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend_copy(v147, v148, v149, v150);
    v152 = *(void **)(inited + 232);
    *(_QWORD *)(inited + 232) = v151;

    objc_msgSend_zoneishKeyID(self, v153, v154, v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = objc_msgSend_copy(v156, v157, v158, v159);
    v161 = *(void **)(inited + 200);
    *(_QWORD *)(inited + 200) = v160;

    objc_msgSend_pcsKeyID(self, v162, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = objc_msgSend_copy(v165, v166, v167, v168);
    v170 = *(void **)(inited + 248);
    *(_QWORD *)(inited + 248) = v169;

    objc_msgSend_allPCSKeyIDs(self, v171, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDeepCopy(v174, v175, v176, v177);
    v178 = objc_claimAutoreleasedReturnValue();
    v179 = *(void **)(inited + 96);
    *(_QWORD *)(inited + 96) = v178;

    *(_BYTE *)(inited + 37) = objc_msgSend_useLightweightPCS(self, v180, v181, v182);
    *(_BYTE *)(inited + 38) = objc_msgSend_wantsPublicSharingKey(self, v183, v184, v185);
    objc_msgSend_routingKey(self, v186, v187, v188);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend_copy(v189, v190, v191, v192);
    v194 = *(void **)(inited + 336);
    *(_QWORD *)(inited + 336) = v193;

    objc_msgSend_baseToken(self, v195, v196, v197);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend_copy(v198, v199, v200, v201);
    v203 = *(void **)(inited + 64);
    *(_QWORD *)(inited + 64) = v202;

    objc_msgSend_mutableEncryptedPSK(self, v204, v205, v206);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = objc_msgSend_copy(v207, v208, v209, v210);
    v212 = *(void **)(inited + 72);
    *(_QWORD *)(inited + 72) = v211;

    objc_msgSend_displayedHostname(self, v213, v214, v215);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = objc_msgSend_copy(v216, v217, v218, v219);
    v221 = *(void **)(inited + 80);
    *(_QWORD *)(inited + 80) = v220;

    objc_msgSend_mutableURL(self, v222, v223, v224);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v229 = objc_msgSend_copy(v225, v226, v227, v228);
    v230 = *(void **)(inited + 304);
    *(_QWORD *)(inited + 304) = v229;

    objc_msgSend_share(self, v231, v232, v233);
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    v238 = objc_msgSend_copy(v234, v235, v236, v237);
    v239 = *(void **)(inited + 48);
    *(_QWORD *)(inited + 48) = v238;

    objc_msgSend_previousShare(self, v240, v241, v242);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    v247 = objc_msgSend_copy(v243, v244, v245, v246);
    v248 = *(void **)(inited + 256);
    *(_QWORD *)(inited + 256) = v247;

    *(_BYTE *)(inited + 32) = objc_msgSend_hasUpdatedShare(self, v249, v250, v251);
    objc_msgSend_parent(self, v252, v253, v254);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v259 = objc_msgSend_copy(v255, v256, v257, v258);
    v260 = *(void **)(inited + 56);
    *(_QWORD *)(inited + 56) = v259;

    objc_msgSend_previousParent(self, v261, v262, v263);
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = objc_msgSend_copy(v264, v265, v266, v267);
    v269 = *(void **)(inited + 264);
    *(_QWORD *)(inited + 264) = v268;

    *(_BYTE *)(inited + 33) = objc_msgSend_hasUpdatedParent(self, v270, v271, v272);
    objc_msgSend_chainPrivateKey(self, v273, v274, v275);
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    v280 = objc_msgSend_copy(v276, v277, v278, v279);
    v281 = *(void **)(inited + 272);
    *(_QWORD *)(inited + 272) = v280;

    objc_msgSend_chainProtectionInfo(self, v282, v283, v284);
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = objc_msgSend_copy(v285, v286, v287, v288);
    v290 = *(void **)(inited + 280);
    *(_QWORD *)(inited + 280) = v289;

    objc_msgSend_chainParentPublicKeyID(self, v291, v292, v293);
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    v298 = objc_msgSend_copy(v294, v295, v296, v297);
    v299 = *(void **)(inited + 288);
    *(_QWORD *)(inited + 288) = v298;

    *(_BYTE *)(inited + 36) = objc_msgSend_wantsChainPCS(self, v300, v301, v302);
    objc_msgSend_tombstonedPublicKeyIDs(self, v303, v304, v305);
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDeepCopy(v306, v307, v308, v309);
    v310 = objc_claimAutoreleasedReturnValue();
    v311 = *(void **)(inited + 104);
    *(_QWORD *)(inited + 104) = v310;

    *(_BYTE *)(inited + 24) = objc_msgSend_trackChanges(self, v312, v313, v314);
    objc_msgSend_expirationDate(self, v315, v316, v317);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    v322 = objc_msgSend_copy(v318, v319, v320, v321);
    v323 = *(void **)(inited + 192);
    *(_QWORD *)(inited + 192) = v322;

    *(_BYTE *)(inited + 28) = objc_msgSend_isExpired(self, v324, v325, v326);
    *(_BYTE *)(inited + 27) = objc_msgSend_hasUpdatedExpirationTimeInterval(self, v327, v328, v329);
    objc_msgSend_updatedExpirationTimeInterval(self, v330, v331, v332);
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    v337 = objc_msgSend_copy(v333, v334, v335, v336);
    v338 = *(void **)(inited + 184);
    *(_QWORD *)(inited + 184) = v337;

    *(_BYTE *)(inited + 25) = objc_msgSend_needsRollAndCounterSign(self, v339, v340, v341);
    objc_msgSend_pcsKeysToRemove(self, v342, v343, v344);
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    v349 = objc_msgSend_copy(v345, v346, v347, v348);
    v350 = *(void **)(inited + 296);
    *(_QWORD *)(inited + 296) = v349;

  }
  return (id)inited;
}

- (id)copyWithOriginalValues
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  id obj;
  id obja;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_copy(self, a2, v2, v3);
  objc_msgSend_setTrackChanges_(v4, v5, 0, v6);
  objc_msgSend_valueStore(v4, v7, v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend_valueStore(v4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalValues(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v85, (uint64_t)v90, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v86;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v86 != v23)
          objc_enumerationMutation(v17);
        v25 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v24);
        objc_msgSend_valueStore(v4, v19, v20, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_originalValues(v26, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v30, v31, v25, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_setObject_forKeyedSubscript_(v4, v34, 0, v25);
        else
          objc_msgSend_setObject_forKeyedSubscript_(v4, v34, (uint64_t)v33, v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v85, (uint64_t)v90, 16);
    }
    while (v22);
  }

  objc_sync_exit(obj);
  objc_msgSend_encryptedValueStore(v4, v35, v36, v37);
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obja);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend_encryptedValueStore(v4, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalValues(v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v81, (uint64_t)v89, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v82;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v82 != v51)
          objc_enumerationMutation(v45);
        v53 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v52);
        objc_msgSend_encryptedValueStore(v4, v47, v48, v49);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_originalValues(v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v58, v59, v53, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_encryptedValues(v4, v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v65, v66, 0, v53);
        }
        else
        {
          objc_msgSend_encryptedValueStore(v4, v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRawValue_forKey_(v65, v67, (uint64_t)v61, v53);
        }

        ++v52;
      }
      while (v50 != v52);
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v81, (uint64_t)v89, 16);
    }
    while (v50);
  }

  objc_sync_exit(obja);
  v71 = objc_msgSend_trackChanges(self, v68, v69, v70);
  objc_msgSend_setTrackChanges_(v4, v72, v71, v73);
  objc_msgSend_resetChangedKeys(v4, v74, v75, v76);
  return v4;
}

- (id)_copyWithOptions:(int64_t)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_recordID(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copyWithZone_recordID_userFields_systemFields_(self, v7, 0, (uint64_t)v6, ((unint64_t)a3 >> 1) & 1, a3 & 1);

  return v8;
}

+ (CKRecord)recordWithDuplicatedPackagesOfRecord:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  BOOL (*v31)(uint64_t, void *, uint64_t);
  void *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9 = (void *)objc_msgSend_copy(v5, v6, v7, v8);
  objc_msgSend_setTrackChanges_(v9, v10, 0, v11);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_18A73C9F4;
  v39 = sub_18A73CA04;
  v40 = 0;
  objc_msgSend_valueStore(v5, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v41, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = sub_18A73CA0C;
  v32 = &unk_1E1F637C8;
  v34 = &v35;
  v18 = v9;
  v33 = v18;
  v20 = objc_msgSend_containsValueOfClasses_passingTest_(v15, v19, (uint64_t)v17, (uint64_t)&v29);

  if (v20)
  {
    v24 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v36[5]);
  }
  else
  {
    v25 = objc_msgSend_trackChanges(v5, v21, v22, v23, v29, v30, v31, v32);
    objc_msgSend_setTrackChanges_(v18, v26, v25, v27);
    v24 = v18;
  }

  _Block_object_dispose(&v35, 8);
  return (CKRecord *)v24;
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
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)objc_opt_new();
  objc_msgSend_recordType(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, (uint64_t)CFSTR("recordType"));

  objc_msgSend_recordID(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, (uint64_t)CFSTR("recordID"));

  objc_msgSend_properties(v3, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v17;
}

- (void)setRecordType:(id)a3
{
  NSString *v4;
  NSString *recordType;
  CKRecord *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  recordType = obj->_recordType;
  obj->_recordType = v4;

  objc_sync_exit(obj);
}

- (void)updateWithSavedRecordXPCMetadata:(id)a3 shouldOnlySaveAssetContent:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;

  v6 = a3;
  v10 = v6;
  if (!a4)
  {
    objc_msgSend_etag(v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend_etag(v10, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEtag_(self, v16, (uint64_t)v15, v17);

    }
    objc_msgSend_creationDate(v10, v12, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_creationDate(v10, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCreationDate_(self, v23, (uint64_t)v22, v24);

    }
    objc_msgSend_modificationDate(v10, v19, v20, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend_modificationDate(v10, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setModificationDate_(self, v30, (uint64_t)v29, v31);

    }
    objc_msgSend_signingPCSIdentityData(v10, v26, v27, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend_signingPCSIdentityData(v10, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (const void *)PCSIdentityCreateFromRaw();

      if (v37)
      {
        objc_msgSend_setSigningPCSIdentity_(self, v33, (uint64_t)v37, v35);
        CFRelease(v37);
      }
    }
    objc_msgSend_serverRecord(v10, v33, v34, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expirationDate(v10, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExpirationDate_(self, v43, (uint64_t)v42, v44);

    objc_msgSend_setHasUpdatedExpirationTimeInterval_(self, v45, 0, v46);
    objc_msgSend_setUpdatedExpirationTimeInterval_(self, v47, 0, v48);
    objc_msgSend_pluginFields(v38, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPluginFields_(self, v53, (uint64_t)v52, v54);

    objc_msgSend_creatorUserRecordID(v38, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreatorUserRecordID_(self, v59, (uint64_t)v58, v60);

    objc_msgSend_lastModifiedUserRecordID(v38, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastModifiedUserRecordID_(self, v65, (uint64_t)v64, v66);

    objc_msgSend_modifiedByDevice(v38, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setModifiedByDevice_(self, v71, (uint64_t)v70, v72);

    objc_msgSend_routingKey(v38, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRoutingKey_(self, v77, (uint64_t)v76, v78);

    objc_msgSend_mutableEncryptedPSK(v38, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMutableEncryptedPSK_(self, v83, (uint64_t)v82, v84);

    objc_msgSend_displayedHostname(v38, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayedHostname_(self, v89, (uint64_t)v88, v90);

    objc_msgSend_chainParentPublicKeyID(v38, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChainParentPublicKeyID_(self, v95, (uint64_t)v94, v96);

    objc_msgSend_chainProtectionInfo(v38, v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChainProtectionInfo_(self, v101, (uint64_t)v100, v102);

    objc_msgSend_chainPrivateKey(v38, v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChainPrivateKey_(self, v107, (uint64_t)v106, v108);

    objc_msgSend_share(v38, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShare_(self, v113, (uint64_t)v112, v114);

    objc_msgSend_updateMergeablesForSuccessfulSave(self, v115, v116, v117);
    objc_msgSend_copyStreamingAssetServerFieldsFromServerRecord_(self, v118, (uint64_t)v38, v119);
    objc_msgSend_setKnownToServer_(self, v120, 1, v121);
    objc_msgSend_resetChangedKeys(self, v122, v123, v124);

  }
  objc_msgSend_protectionData(v10, v7, v8, v9);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtectionData_(self, v126, (uint64_t)v125, v127);

  objc_msgSend_pcsKeyID(v10, v128, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPcsKeyID_(self, v132, (uint64_t)v131, v133);

  objc_msgSend_allPCSKeyIDs(v10, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAllPCSKeyIDs_(self, v138, (uint64_t)v137, v139);

  objc_msgSend_zoneishKeyID(v10, v140, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneishKeyID_(self, v144, (uint64_t)v143, v145);

}

- (void)updateMergeablesForSuccessfulSave
{
  const char *v3;
  void *v4;
  const char *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v5, (uint64_t)v4, (uint64_t)&unk_1E1F63808);

}

- (void)copyStreamingAssetServerFieldsFromServerRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __objc2_class **v15;
  uint64_t v16;
  __objc2_class **v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char isKindOfClass;
  const char *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  CKRecord *v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend_allKeys(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v59, (uint64_t)v67, 16);
  if (v10)
  {
    v14 = v10;
    v56 = *(_QWORD *)v60;
    v15 = off_1E1F54000;
    *(_QWORD *)&v13 = 138543618;
    v53 = v13;
    v54 = self;
    v55 = v8;
    do
    {
      v16 = 0;
      do
      {
        v17 = v15;
        if (*(_QWORD *)v60 != v56)
          objc_enumerationMutation(v8);
        v18 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v16);
        objc_msgSend_objectForKeyedSubscript_(v4, v11, v18, v12, v53);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v19;
        if (v19)
        {
          v24 = v19;
        }
        else
        {
          objc_msgSend_encryptedValues(v4, v20, v21, v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v25, v26, v18, v27);
          v24 = (id)objc_claimAutoreleasedReturnValue();

        }
        v15 = v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_objectForKeyedSubscript_(self, v28, v18, v29);
          v30 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v47 = (void *)ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              v48 = v47;
              objc_msgSend_recordID(v4, v49, v50, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v53;
              v64 = v18;
              v65 = 2112;
              v66 = v52;
              _os_log_impl(&dword_18A5C5000, v48, OS_LOG_TYPE_INFO, "Trying to copy streaming asset info from %{public}@ on %@, but there is no local value", buf, 0x16u);

              v8 = v55;
            }
            goto LABEL_23;
          }
          objc_msgSend_copyServerFieldsFromStreamingAsset_(v30, v31, (uint64_t)v24, v32);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_25;
          objc_msgSend_objectForKeyedSubscript_(self, v33, v18, v34);
          v30 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = v24;
            v30 = v30;
            objc_msgSend_firstObject(v35, v36, v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_17;
            objc_msgSend_firstObject(v30, v40, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v8 = v55;
            if ((isKindOfClass & 1) != 0)
            {
              v57[0] = MEMORY[0x1E0C809B0];
              v57[1] = 3221225472;
              v57[2] = sub_18A73D414;
              v57[3] = &unk_1E1F63830;
              v58 = v30;
              objc_msgSend_enumerateObjectsUsingBlock_(v35, v45, (uint64_t)v57, v46);
              v39 = v58;
LABEL_17:

            }
            self = v54;
LABEL_23:
            v15 = v17;
          }
        }

LABEL_25:
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v59, (uint64_t)v67, 16);
    }
    while (v14);
  }

}

- (NSString)baseToken
{
  CKRecord *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_baseToken;
  objc_sync_exit(v2);

  return v3;
}

- (void)setBaseToken:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *baseToken;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((CKObjectsAreBothNilOrEqual(v4->_baseToken, v12) & 1) == 0)
  {
    v8 = objc_msgSend_copy(v12, v5, v6, v7);
    baseToken = v4->_baseToken;
    v4->_baseToken = (NSString *)v8;

    objc_msgSend_setMutableURL_(v4, v10, 0, v11);
  }
  objc_sync_exit(v4);

}

- (CKEncryptedData)mutableEncryptedPSK
{
  CKRecord *v2;
  CKEncryptedData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_mutableEncryptedPSK;
  objc_sync_exit(v2);

  return v3;
}

- (void)setMutableEncryptedPSK:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isEqualToData;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CKEncryptedData *mutableEncryptedPSK;
  const char *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_data(v23, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v4->_mutableEncryptedPSK, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToData = objc_msgSend_isEqualToData_(v8, v13, (uint64_t)v12, v14);

  if ((isEqualToData & 1) == 0)
  {
    v19 = objc_msgSend_copy(v23, v16, v17, v18);
    mutableEncryptedPSK = v4->_mutableEncryptedPSK;
    v4->_mutableEncryptedPSK = (CKEncryptedData *)v19;

    objc_msgSend_setMutableURL_(v4, v21, 0, v22);
  }
  objc_sync_exit(v4);

}

- (void)setMutableEncryptedPublicSharingKeyData:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKEncryptedData *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (objc_msgSend_length(v16, v5, v6, v7))
  {
    v10 = [CKEncryptedData alloc];
    v13 = (void *)objc_msgSend_initWithData_(v10, v11, (uint64_t)v16, v12);
    objc_msgSend_setMutableEncryptedPSK_(v4, v14, (uint64_t)v13, v15);

  }
  else
  {
    objc_msgSend_setMutableEncryptedPSK_(v4, v8, 0, v9);
  }
  objc_sync_exit(v4);

}

- (NSData)mutableEncryptedPublicSharingKeyData
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

+ (id)fullTokenFromBaseToken:(id)a3 privateToken:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v22;
  __int16 v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v8 = v6;
  if (v6)
  {
    if (v5)
    {
      v24[0] = v5;
      v24[1] = v6;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v24, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v9, v10, (uint64_t)&stru_1E1F66ED0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
      v22 = 16;
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v7, (uint64_t)&v22, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKBase64URLSafeString(v13, v14, v15, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v25[0] = v9;
      v25[1] = v8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v25, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v18, v19, (uint64_t)&stru_1E1F66ED0, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSData)encryptedPublicSharingKey
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);

  return (NSData *)v12;
}

- (NSString)privateToken
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKBase64URLSafeString(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)fullToken
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  objc_msgSend_baseToken(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateToken(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fullTokenFromBaseToken_privateToken_(CKRecord, v10, (uint64_t)v5, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSData)shortSharingTokenData
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  CC_LONG v12;
  const char *v13;
  void *v14;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fullToken(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    v9 = (const void *)objc_msgSend_UTF8String(v4, v5, v6, v7, 0, 0, 0, 0);
    v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v8, v10, 4, v11);
    CC_SHA256(v9, v12, (unsigned __int8 *)&v16);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)&v16, 16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return (NSData *)v14;
}

- (id)shortSharingToken
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_shortSharingTokenData(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKBase64URLSafeString(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)shortSharingTokenHashData
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  CC_LONG v12;
  const char *v13;
  void *v14;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shortSharingToken(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    v9 = (const void *)objc_msgSend_UTF8String(v4, v5, v6, v7, 0, 0, 0, 0);
    v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v8, v10, 4, v11);
    CC_SHA256(v9, v12, (unsigned __int8 *)&v16);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v13, (uint64_t)&v16, 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return (NSData *)v14;
}

- (NSData)encryptedFullTokenData
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  objc_msgSend_fullToken(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortSharingTokenData(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptFullToken_shortSharingTokenData_(CKRecord, v10, (uint64_t)v5, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v11;
}

+ (id)encryptFullToken:(id)a3 shortSharingTokenData:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9) && objc_msgSend_length(v6, v10, v11, v12) == 16)
  {
    objc_msgSend_dataUsingEncoding_(v5, v13, 4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)PCSCloudKitShareTokenCopyEncryptedData();
    if (v16)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v22 = 138543618;
        v23 = v16;
        v24 = 2114;
        v25 = v6;
        _os_log_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_INFO, "Successfully encrypted fullToken:%{public}@ with shortSharingTokenData:%{public}@", (uint8_t *)&v22, 0x16u);
      }
      v18 = v16;
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v20 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v22 = 138543618;
        v23 = v5;
        v24 = 2114;
        v25 = v6;
        _os_log_error_impl(&dword_18A5C5000, v20, OS_LOG_TYPE_ERROR, "Failed to encrypt fullToken:%{public}@ with shortSharingTokenData:%{public}@", (uint8_t *)&v22, 0x16u);
      }
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v19 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v22 = 138543618;
      v23 = v5;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_INFO, "Warn: Invalid arguments - fullToken:%{public}@, shortSharingTokenData:%{public}@", (uint8_t *)&v22, 0x16u);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)decryptFullToken:(id)a3 shortSharingTokenData:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9) && objc_msgSend_length(v6, v10, v11, v12) == 16)
  {
    v13 = (void *)PCSCloudKitShareTokenCopyDecryptedData();
    if (v13)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v14 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v19 = 138543618;
        v20 = v13;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_INFO, "Successfully decrypted fullToken:%{public}@ with shortSharingTokenData:%{public}@", (uint8_t *)&v19, 0x16u);
      }
      v15 = v13;
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v19 = 138543618;
        v20 = v5;
        v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_ERROR, "Failed to decrypt fullToken:%{public}@ with shortSharingTokenData:%{public}@", (uint8_t *)&v19, 0x16u);
      }
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v16 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v19 = 138543618;
      v20 = v5;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_18A5C5000, v16, OS_LOG_TYPE_INFO, "Warn: Invalid arguments - encryptedFullTokenData:%{public}@, shortSharingTokenData:%{public}@", (uint8_t *)&v19, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)decryptFullToken:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;

  v4 = a3;
  objc_msgSend_shortSharingTokenData(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decryptFullToken_shortSharingTokenData_(CKRecord, v9, (uint64_t)v4, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = objc_msgSend_bytes(v10, v12, v13, v14);
  v19 = objc_msgSend_length(v10, v16, v17, v18);
  v21 = (void *)objc_msgSend_initWithBytes_length_encoding_(v11, v20, v15, v19, 4);

  return v21;
}

- (NSString)shortToken
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[2];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shortSharingToken(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v23 = (void *)ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v24 = v23;
    objc_msgSend_recordID(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v28;
    _os_log_error_impl(&dword_18A5C5000, v24, OS_LOG_TYPE_ERROR, "Couldn't get a short sharing token for %@", buf, 0xCu);

    goto LABEL_14;
  }
  objc_msgSend_routingKey(self, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(v9, v10, v11, v12);

  if (v13 != 3)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = (void *)ck_log_facility_ck;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v24 = v29;
    objc_msgSend_routingKey(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v34;
    v42 = 2112;
    v43 = v38;
    _os_log_error_impl(&dword_18A5C5000, v24, OS_LOG_TYPE_ERROR, "Routing key is invalid: \"%{public}@\" for %@", buf, 0x16u);

LABEL_14:
LABEL_11:
    v22 = 0;
    goto LABEL_12;
  }
  objc_msgSend_routingKey(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v17;
  v39[1] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v39, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v19, v20, (uint64_t)&stru_1E1F66ED0, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return (NSString *)v22;
}

+ (id)shareURLWithShortToken:(id)a3 shareTitle:(id)a4 shareType:(id)a5 containerID:(id)a6 displayedHostname:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v44;
  const char *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  _QWORD v52[4];

  v52[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20 = a7;
  if (!v13)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, (uint64_t)a1, CFSTR("CKRecord.m"), 1508, CFSTR("ShareURL cannot be created without short token. Share: %@"), a1);

  }
  v46 = v16;
  v47 = v15;
  CKSharingContainerSlugForContainerID(v16, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMangledDocumentNameForURLFragment(v14, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = &stru_1E1F66ED0;
  v52[1] = v21;
  v52[2] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v52, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v27, v28, (uint64_t)CFSTR("/"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend_setScheme_(v31, v32, (uint64_t)CFSTR("https"), v33);
  if (v20)
    objc_msgSend_setHost_(v31, v34, (uint64_t)v20, v35);
  else
    objc_msgSend_setHost_(v31, v34, (uint64_t)CFSTR("www.icloud.com"), v35);
  objc_msgSend_setPercentEncodedPath_(v31, v36, (uint64_t)v30, v37);
  if (v25 && objc_msgSend_length(v25, v38, v39, v40))
    objc_msgSend_setPercentEncodedFragment_(v31, v38, (uint64_t)v25, v40);
  objc_msgSend_URL(v31, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v42 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v41;
    v50 = 2112;
    v51 = v31;
    _os_log_debug_impl(&dword_18A5C5000, v42, OS_LOG_TYPE_DEBUG, "Share URL: %@ (%@)", buf, 0x16u);
  }

  return v41;
}

- (NSURL)uncachedURL
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend_mutableEncryptedPSK(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v13 = (void *)v9;
    objc_msgSend_routingKey(self, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_length(v14, v15, v16, v17);

    if (v18)
    {
      objc_msgSend_shortToken(self, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSafeStringForURLPathComponent(v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = (void *)objc_opt_class();
        objc_msgSend_objectForKeyedSubscript_(self, v28, (uint64_t)CFSTR("cloudkit.title"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(self, v31, (uint64_t)CFSTR("cloudkit.type"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerID(self, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_displayedHostname(self, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shareURLWithShortToken_shareTitle_shareType_containerID_displayedHostname_(v27, v42, (uint64_t)v26, (uint64_t)v30, v33, v37, v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v46 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          v47 = v46;
          objc_msgSend_recordID(self, v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 138412290;
          v53 = v51;
          _os_log_error_impl(&dword_18A5C5000, v47, OS_LOG_TYPE_ERROR, "Failed to get the shortToken for %@", (uint8_t *)&v52, 0xCu);

        }
        v43 = 0;
      }

      return (NSURL *)v43;
    }
  }
  else
  {

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v44 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v52) = 0;
    _os_log_error_impl(&dword_18A5C5000, v44, OS_LOG_TYPE_ERROR, "You cannot get the URL of a share until it's been saved to the server", (uint8_t *)&v52, 2u);
  }
  return (NSURL *)0;
}

- (NSURL)URL
{
  CKRecord *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_mutableURL(v2, v3, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend_uncachedURL(v2, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMutableURL_(v2, v10, (uint64_t)v9, v11);
  }
  objc_sync_exit(v2);

  return (NSURL *)v9;
}

- (NSString)displayedHostname
{
  CKRecord *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_displayedHostname;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDisplayedHostname:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *displayedHostname;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((CKObjectsAreBothNilOrEqual(v4->_displayedHostname, v12) & 1) == 0)
  {
    v8 = objc_msgSend_copy(v12, v5, v6, v7);
    displayedHostname = v4->_displayedHostname;
    v4->_displayedHostname = (NSString *)v8;

    objc_msgSend_setMutableURL_(v4, v10, 0, v11);
  }
  objc_sync_exit(v4);

}

- (BOOL)canHostServerURLInfo
{
  return 1;
}

- (NSString)debugDescription
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int isExpired;
  const char *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  id v96;
  void (**v97)(void *, void *, _QWORD);
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  id v108;
  void *v110;
  _QWORD aBlock[4];
  id v112;

  v3 = (void *)objc_opt_new();
  objc_msgSend_description(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v3, v8, (uint64_t)v7, v9);

  objc_msgSend_appendString_(v3, v10, (uint64_t)CFSTR("\n{\n"), v11);
  if (objc_msgSend_permission(self, v12, v13, v14) == 2)
    objc_msgSend_appendFormat_(v3, v15, (uint64_t)CFSTR("\tREAD-ONLY\n"), v17);
  if (objc_msgSend_isMergeableValueDeltaRecord(self, v15, v16, v17))
    objc_msgSend_appendFormat_(v3, v18, (uint64_t)CFSTR("\tMERGEABLE DELTA PARTIAL RECORD\n"), v20);
  objc_msgSend_creatorUserRecordID(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v22, (uint64_t)CFSTR("\tcreatorUserRecordID -> %@\n"), v23, v21);

  objc_msgSend_lastModifiedUserRecordID(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v28, (uint64_t)CFSTR("\tlastModifiedUserRecordID -> %@\n"), v29, v27);

  objc_msgSend_creationDate(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v34, (uint64_t)CFSTR("\tcreationDate -> %@\n"), v35, v33);

  objc_msgSend_modificationDate(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v40, (uint64_t)CFSTR("\tmodificationDate -> %@\n"), v41, v39);

  objc_msgSend_expirationDate(self, v42, v43, v44);
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    isExpired = objc_msgSend_isExpired(self, v45, v46, v47);
    v52 = CFSTR(" (expired)");
    if (!isExpired)
      v52 = &stru_1E1F66ED0;
    objc_msgSend_appendFormat_(v3, v50, (uint64_t)CFSTR("\texpirationDate -> %@%@\n"), v51, v48, v52);
  }
  v110 = (void *)v48;
  objc_msgSend_protectionData(self, v45, v46, v47);
  v53 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)v53;
  if (v53)
    objc_msgSend_appendFormat_(v3, v54, (uint64_t)CFSTR("\tprotectionData -> %@\n"), v56, v53);
  objc_msgSend_pcsKeysToRemove(self, v54, v55, v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend_pcsKeysToRemove(self, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v63, (uint64_t)CFSTR("\tpcsKeysToRemove -> %@\n"), v64, v62);

  }
  objc_msgSend_modifiedByDevice(self, v59, v60, v61);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v65, v66, v67, v68))
    objc_msgSend_appendFormat_(v3, v69, (uint64_t)CFSTR("\tmodifiedByDevice -> %@\n"), v71, v65);
  objc_msgSend_conflictLoserEtags(self, v69, v70, v71);
  v72 = objc_claimAutoreleasedReturnValue();
  v76 = (void *)v72;
  if (v72)
    objc_msgSend_appendFormat_(v3, v73, (uint64_t)CFSTR("\tconflictLoserEtags -> %@\n"), v75, v72);
  objc_msgSend_tombstonedPublicKeyIDs(self, v73, v74, v75);
  v77 = objc_claimAutoreleasedReturnValue();
  v81 = (void *)v77;
  if (v77)
    objc_msgSend_appendFormat_(v3, v78, (uint64_t)CFSTR("\ttombstonedPublicKeyIDs -> %@\n"), v80, v77);
  objc_msgSend_share(self, v78, v79, v80);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    if (objc_msgSend_hasUpdatedShare(self, v82, v83, v84))
      objc_msgSend_appendFormat_(v3, v86, (uint64_t)CFSTR("\tshare -> %@%@\n"), v87, v85, CFSTR(" (updated)"));
    else
      objc_msgSend_appendFormat_(v3, v86, (uint64_t)CFSTR("\tshare -> %@%@\n"), v87, v85, &stru_1E1F66ED0);
  }
  objc_msgSend_parent(self, v82, v83, v84);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    if (objc_msgSend_hasUpdatedParent(self, v88, v89, v90))
      objc_msgSend_appendFormat_(v3, v92, (uint64_t)CFSTR("\tparent-> %@%@\n"), v93, v91, CFSTR(" (updated)"));
    else
      objc_msgSend_appendFormat_(v3, v92, (uint64_t)CFSTR("\tparent-> %@%@\n"), v93, v91, &stru_1E1F66ED0);
  }
  if (objc_msgSend_needsRollAndCounterSign(self, v88, v89, v90))
    objc_msgSend_appendFormat_(v3, v94, (uint64_t)CFSTR("\tneedsRollAndCounterSign -> YES\n"), v95);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A73EDA0;
  aBlock[3] = &unk_1E1F63858;
  v96 = v3;
  v112 = v96;
  v97 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend_valueStore(self, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2](v97, v101, 0);

  objc_msgSend_encryptedValueStore(self, v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(void *, void *, const __CFString *))v97)[2](v97, v105, CFSTR("encrypted"));

  objc_msgSend_appendString_(v96, v106, (uint64_t)CFSTR("}"), v107);
  v108 = v96;

  return (NSString *)v108;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t isMergeableValueDeltaRecord;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  id v85;

  v85 = a3;
  objc_msgSend_recordType(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v85, v8, (uint64_t)CFSTR("recordType"), (uint64_t)v7, 0);

  objc_msgSend_recordID(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v85, v13, (uint64_t)CFSTR("recordID"), (uint64_t)v12, 0);

  objc_msgSend_recordChangeTag(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v85, v18, (uint64_t)CFSTR("recordChangeTag"), (uint64_t)v17, 0);

  isMergeableValueDeltaRecord = objc_msgSend_isMergeableValueDeltaRecord(self, v19, v20, v21);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v85, v23, (uint64_t)CFSTR("isMergeableDeltaPartialRecord"), isMergeableValueDeltaRecord, 0);
  v27 = objc_msgSend_needsRollAndCounterSign(self, v24, v25, v26);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v85, v28, (uint64_t)CFSTR("needsRollAndCounterSign"), v27, 0);
  objc_msgSend_mutableEncryptedPSK(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v85, v33, (uint64_t)CFSTR("mutableEncryptedPSK"), (uint64_t)v32, 0);

  objc_msgSend_routingKey(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v85, v38, (uint64_t)CFSTR("routingKey"), (uint64_t)v37, 0);

  objc_msgSend_share(self, v39, v40, v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45 || objc_msgSend_hasUpdatedShare(self, v42, v43, v44))
    objc_msgSend_addProperty_value_shouldRedact_(v85, v42, (uint64_t)CFSTR("share"), (uint64_t)v45, 0);
  objc_msgSend_parent(self, v42, v46, v47);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51 || objc_msgSend_hasUpdatedParent(self, v48, v49, v50))
    objc_msgSend_addProperty_value_shouldRedact_(v85, v48, (uint64_t)CFSTR("parent"), (uint64_t)v51, 0);
  objc_msgSend_valueStore(self, v48, v52, v53);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v54);
  objc_msgSend_values(v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend_count(v58, v59, v60, v61);

  if (v62)
  {
    objc_msgSend_values(v54, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v85, v67, (uint64_t)CFSTR("values"), (uint64_t)v66, 1);

  }
  objc_sync_exit(v54);

  objc_msgSend_encryptedValueStore(self, v68, v69, v70);
  v71 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v71);
  objc_msgSend_values(v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend_count(v75, v76, v77, v78);

  if (v79)
  {
    objc_msgSend_values(v71, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v85, v84, (uint64_t)CFSTR("encryptedValues"), (uint64_t)v83, 1);

  }
  objc_sync_exit(v71);

}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  _BOOL8 v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  void *v71;
  const char *v72;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 5, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_recordType(self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v14, (uint64_t)CFSTR("recordType"), (uint64_t)v13);

    objc_msgSend_recordID(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v23, (uint64_t)CFSTR("recordID"), (uint64_t)v22);

    objc_msgSend_recordChangeTag(self, v24, v25, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v27, (uint64_t)CFSTR("recordChangeTag"), (uint64_t)v30);
    if (objc_msgSend_isMergeableValueDeltaRecord(self, v27, v28, v29))
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v31, (uint64_t)CFSTR("isMergeableDeltaPartialRecord"), (uint64_t)&unk_1E1FC4A90);
    objc_msgSend_share(self, v31, v32, v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37 || objc_msgSend_hasUpdatedShare(self, v34, v35, v36))
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v34, (uint64_t)CFSTR("share"), (uint64_t)v37);
    objc_msgSend_parent(self, v34, v38, v39);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43 || objc_msgSend_hasUpdatedParent(self, v40, v41, v42))
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v40, (uint64_t)CFSTR("parent"), (uint64_t)v43);
    objc_msgSend_valueStore(self, v40, v44, v45);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v46);
    objc_msgSend_values(v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_count(v50, v51, v52, v53);

    if (v54)
    {
      objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v46, v55, v7, 1, v5);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v57, (uint64_t)CFSTR("values"), (uint64_t)v56);

    }
    objc_sync_exit(v46);

    objc_msgSend_encryptedValueStore(self, v58, v59, v60);
    v61 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v61);
    objc_msgSend_values(v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend_count(v65, v66, v67, v68);

    if (v69)
    {
      objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v61, v70, v7, 1, v5);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v12, v72, (uint64_t)CFSTR("encryptedValues"), (uint64_t)v71);

    }
    objc_sync_exit(v61);

  }
  return v12;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecord *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecord *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (id)conciseDescription
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_recordType(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isMergeableValueDeltaRecord(self, v16, v17, v18))
    v22 = CFSTR(" isMergeableDeltaPartialRecord=1");
  else
    v22 = &stru_1E1F66ED0;
  objc_msgSend_recordChangeTag(self, v19, v20, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_recordChangeTag(self, v23, v24, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v27, v29, (uint64_t)CFSTR(" etag=%@"), v30, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend_initWithFormat_(v3, v32, (uint64_t)CFSTR("<CKRecord %@ %@%@%@>"), v33, v7, v15, v22, v31);

  }
  else
  {
    v34 = (void *)objc_msgSend_initWithFormat_(v3, v23, (uint64_t)CFSTR("<CKRecord %@ %@%@%@>"), v25, v7, v15, v22, &stru_1E1F66ED0);
  }

  return v34;
}

- (unint64_t)size
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  unint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  id obj;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  objc_msgSend_valueStore(self, a2, v2, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend_values(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v107, (uint64_t)v112, 16);
  obj = v5;
  if (v18)
  {
    v19 = *(_QWORD *)v108;
    v20 = 64;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v108 != v19)
          objc_enumerationMutation(v13);
        v22 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
        objc_msgSend_values(v5, v15, v16, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v22, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = sub_18A73F760((char *)self, v26, v22);
        v20 += (uint64_t)v27;
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v107, (uint64_t)v112, 16);
    }
    while (v18);
  }
  else
  {
    v20 = 64;
  }

  objc_sync_exit(v5);
  objc_msgSend_encryptedValueStore(self, v28, v29, v30);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v31);
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend_values(v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v103, (uint64_t)v111, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v104 != v45)
          objc_enumerationMutation(v39);
        v47 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
        objc_msgSend_values(v31, v41, v42, v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v48, v49, (uint64_t)v47, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = sub_18A73F760((char *)self, v51, v47);
        v20 += (uint64_t)v52;
      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v41, (uint64_t)&v103, (uint64_t)v111, 16);
    }
    while (v44);
  }

  objc_sync_exit(v31);
  objc_msgSend_recordID(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_size(v56, v57, v58, v59);

  if (qword_1ECD96C18 != -1)
    dispatch_once(&qword_1ECD96C18, &unk_1E1F63898);
  v64 = qword_1ECD96C10;
  objc_msgSend_recordType(self, v61, v62, v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend_length(v65, v66, v67, v68);
  v70 = v69 + 2;
  if (v69 >= 0x80)
  {
    do
    {
      ++v70;
      v71 = v69 >> 14;
      v69 >>= 7;
    }
    while (v71);
  }

  objc_msgSend_share(self, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v75;
  v80 = v60 + v20 + v64 + v70;
  if (v75)
  {
    objc_msgSend_recordID(v75, v76, v77, v78);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend_size(v81, v82, v83, v84);
    v86 = v85 + 2;
    if (v85 >= 0x80)
    {
      do
      {
        ++v86;
        v87 = v85 >> 14;
        v85 >>= 7;
      }
      while (v87);
    }

    v80 += v86;
  }
  objc_msgSend_parent(self, v76, v77, v78);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v88;
  if (v88)
  {
    objc_msgSend_recordID(v88, v89, v90, v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend_size(v93, v94, v95, v96);
    v98 = v97 + 2;
    if (v97 >= 0x80)
    {
      do
      {
        ++v98;
        v99 = v97 >> 14;
        v97 >>= 7;
      }
      while (v99);
    }

    v80 += v98;
  }
  if (objc_msgSend_hasPropertiesRequiringEncryption(self, v89, v90, v91))
    v100 = v80 + 503;
  else
    v100 = v80;

  return v100;
}

- (BOOL)hasChainPCS
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  objc_msgSend_chainProtectionInfo(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_chainPrivateKey(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isMoreRecentThanRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v31;
  CKRecord *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_creationDate(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modificationDate(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_creationDate(v4, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modificationDate(v4, v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v20;
  v24 = 1;
  if (v16)
  {
    if (v20)
    {
      v24 = 0;
      if (v8)
      {
        if (v12)
        {
          v25 = objc_msgSend_compare_(v8, v21, (uint64_t)v16, v22);
          v28 = objc_msgSend_compare_(v12, v26, (uint64_t)v23, v27);
          if (v25)
          {
            if (v25 == 1)
            {
              if (v28 == -1)
              {
                if (ck_log_initialization_predicate != -1)
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                v29 = ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
                {
                  v31 = 138412546;
                  v32 = self;
                  v33 = 2112;
                  v34 = v4;
                  _os_log_fault_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_FAULT, "Found a record with a later modification date, but an earlier creation date. self=%@ other=%@", (uint8_t *)&v31, 0x16u);
                }
              }
              v24 = 1;
            }
            else
            {
              v24 = 0;
            }
          }
          else
          {
            v24 = v28 == 1;
          }
        }
      }
    }
  }

  return v24;
}

- (NSDictionary)values
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_valueStore(self, a2, v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend_values(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);

  objc_sync_exit(v4);
  return (NSDictionary *)v12;
}

- (NSDictionary)originalValues
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_valueStore(self, a2, v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend_originalValues(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);

  objc_sync_exit(v4);
  return (NSDictionary *)v12;
}

- (NSSet)changedKeysSet
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_valueStore(self, a2, v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend_changedKeysSet(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);

  objc_sync_exit(v4);
  return (NSSet *)v12;
}

- (void)setChangedKeysSet:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  objc_msgSend_valueStore(self, v4, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  v11 = (void *)objc_msgSend_mutableCopy(v14, v8, v9, v10);
  objc_msgSend_setChangedKeysSet_(v7, v12, (uint64_t)v11, v13);

  objc_sync_exit(v7);
}

- (BOOL)trackChanges
{
  CKRecord *v2;
  BOOL trackChanges;

  v2 = self;
  objc_sync_enter(v2);
  trackChanges = v2->_trackChanges;
  objc_sync_exit(v2);

  return trackChanges;
}

- (NSArray)changedKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  objc_msgSend_valueStore(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changedKeys(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedValueStore(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changedKeys(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v9, v18, (uint64_t)v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v20;
}

- (void)resetChangedKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;

  objc_msgSend_valueStore(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetChangedKeys(v5, v6, v7, v8);

  objc_msgSend_encryptedValueStore(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetChangedKeys(v12, v13, v14, v15);

  objc_msgSend_share(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_copy(v19, v20, v21, v22);
  objc_msgSend_setPreviousShare_(self, v24, (uint64_t)v23, v25);

  objc_msgSend_setHasUpdatedShare_(self, v26, 0, v27);
  objc_msgSend_parent(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend_copy(v31, v32, v33, v34);
  objc_msgSend_setPreviousParent_(self, v36, (uint64_t)v35, v37);

  objc_msgSend_setHasUpdatedParent_(self, v38, 0, v39);
}

- (void)replaceRecordIDWith:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  char v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  char v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  id v80;

  v80 = a3;
  if (!v80)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2022, CFSTR("Must not be nil"));

  }
  objc_msgSend_recordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v80, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v12, v17, (uint64_t)v16, v18);

  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21, v22);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v74, v75, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2023, CFSTR("Must have the same record name"));

  }
  objc_msgSend_recordID(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v80, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_isEqualToString_(v31, v40, (uint64_t)v39, v41);

  if ((v42 & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v43, v44, v45);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v77, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2024, CFSTR("Must use the same zone name"));

  }
  objc_msgSend_recordID(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v80, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend_isEqualToString_(v54, v63, (uint64_t)v62, v64);

  if ((v65 & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v66, v67, v68);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v78, v79, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2025, CFSTR("Must use the same owner name"));

  }
  v69 = (void *)objc_msgSend_copy(v80, v66, v67, v68);
  objc_msgSend_setRecordID_(self, v70, (uint64_t)v69, v71);

}

- (NSArray)allPCSKeyIDs
{
  CKRecord *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_allPCSKeyIDs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAllPCSKeyIDs:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *allPCSKeyIDs;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  allPCSKeyIDs = v4->_allPCSKeyIDs;
  v4->_allPCSKeyIDs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)tombstonedPublicKeyIDs
{
  CKRecord *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_tombstonedPublicKeyIDs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setTombstonedPublicKeyIDs:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *tombstonedPublicKeyIDs;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  tombstonedPublicKeyIDs = v4->_tombstonedPublicKeyIDs;
  v4->_tombstonedPublicKeyIDs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSDictionary)pluginFields
{
  CKRecord *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_pluginFields;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPluginFields:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *pluginFields;
  id v13;

  v13 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKMapValues_(v13, v5, (uint64_t)&unk_1E1F638B8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_copy(v7, v8, v9, v10);
  pluginFields = v4->_pluginFields;
  v4->_pluginFields = (NSDictionary *)v11;

  objc_sync_exit(v4);
}

- (NSArray)conflictLoserEtags
{
  CKRecord *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_conflictLoserEtags;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRecordChangeTag:(id)a3
{
  CKRecord *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *etag;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_copy(v10, v5, v6, v7);
  etag = v4->_etag;
  v4->_etag = (NSString *)v8;

  objc_sync_exit(v4);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)setNilValueForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_valueStore(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNilValueForKey_(v10, v8, (uint64_t)v4, v9);

}

- (void)setObjectNoValidate:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_valueStore(self, v8, v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObjectNoValidate_forKey_(v12, v11, (uint64_t)v7, (uint64_t)v6);

}

- (NSArray)allKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  objc_msgSend_valueStore(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedValueStore(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v9, v18, (uint64_t)v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v20;
}

- (id)allValues
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  const char *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_valueStore(self, v4, v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend_allKeys(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v47, (uint64_t)v52, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v11);
        v19 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend_values(v7, v13, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v20, v21, v19, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, v19);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v47, (uint64_t)v52, 16);
    }
    while (v16);
  }

  objc_sync_exit(v7);
  objc_msgSend_encryptedValueStore(self, v25, v26, v27);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v28);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend_allKeys(v28, v29, v30, v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v43, (uint64_t)v51, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v44 != v37)
          objc_enumerationMutation(v32);
        v39 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend_objectForKeyedSubscript_(v28, v34, v39, v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v3, v41, (uint64_t)v40, v39);

      }
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v43, (uint64_t)v51, 16);
    }
    while (v36);
  }

  objc_sync_exit(v28);
  return v3;
}

- (id)_allStrings
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];

  objc_msgSend_valueStore(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A741188;
  v14[3] = &unk_1E1F638E0;
  v14[4] = self;
  objc_msgSend_CKCompactMap_(v9, v10, (uint64_t)v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSArray)allTokens
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (qword_1ECD96C28 != -1)
    dispatch_once(&qword_1ECD96C28, &unk_1E1F63900);
  objc_msgSend_expressionValueWithObject_context_((void *)qword_1ECD96C20, a2, (uint64_t)self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (BOOL)containsAssetValues
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_valueStore(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v19, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsValueOfClasses_passingTest_(v5, v8, (uint64_t)v7, (uint64_t)&unk_1E1F63980) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend_encryptedValueStore(self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)&v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_containsValueOfClasses_passingTest_(v13, v16, (uint64_t)v15, (uint64_t)&unk_1E1F595F8);

  }
  return v12;
}

- (BOOL)containsPackageValues
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  char v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_valueStore(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_containsValueOfClasses_passingTest_(v4, v7, (uint64_t)v6, (uint64_t)&unk_1E1F639A0);

  return v8;
}

- (BOOL)containsIndexedKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend_valueStore(self, a2, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend_length(v16, v10, v11, v12))
        {
          v17 = objc_msgSend_length(v16, v10, v11, v12);
          if (objc_msgSend_characterAtIndex_(v16, v18, v17 - 1, v19) == 93)
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v21, (uint64_t)v25, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_12:

  return v13;
}

- (BOOL)hasPropertiesRequiringEncryption
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend_mutableEncryptedPSK(self, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend_valueStore(self, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = objc_opt_class();
      v30[1] = objc_opt_class();
      v30[2] = objc_opt_class();
      v30[3] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v30, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsValueOfClasses_passingTest_(v14, v17, (uint64_t)v16, (uint64_t)&unk_1E1F639C0) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend_encryptedValueStore(self, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend_count(v25, v26, v27, v28) != 0;

      }
    }

  }
  return v9;
}

- (BOOL)hasModifiedPropertiesRequiringEncryption
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend_mutableEncryptedPSK(self, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend_valueStore(self, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = objc_opt_class();
      v30[1] = objc_opt_class();
      v30[2] = objc_opt_class();
      v30[3] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v30, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
      if ((objc_msgSend_containsValueOfClasses_options_passingTest_(v14, v17, (uint64_t)v16, 1, &unk_1E1F639E0) & 1) == 0)
      {
        objc_msgSend_encryptedValueStore(self, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_changedKeys(v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend_count(v25, v26, v27, v28) != 0;

      }
    }

  }
  return v9;
}

- (BOOL)hasPropertiesRequiringDecryption
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  _QWORD v32[2];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_needsDecryption(v5, v6, v7, v8) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend_mutableEncryptedPSK(self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_needsDecryption(v13, v14, v15, v16) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend_valueStore(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = objc_opt_class();
      v33[1] = objc_opt_class();
      v33[2] = objc_opt_class();
      v33[3] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v33, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsValueOfClasses_passingTest_(v20, v23, (uint64_t)v22, (uint64_t)&unk_1E1F63A00) & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        objc_msgSend_encryptedValueStore(self, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = objc_opt_class();
        v32[1] = objc_opt_class();
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v32, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend_containsValueOfClasses_passingTest_(v27, v30, (uint64_t)v29, (uint64_t)&unk_1E1F63A20);

      }
    }

  }
  return v12;
}

- (BOOL)hasEncryptedData
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend_mutableEncryptedPSK(self, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend_valueStore(self, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = objc_opt_class();
      v9 = 1;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v30, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsValueOfClasses_passingTest_(v14, v17, (uint64_t)v16, (uint64_t)&unk_1E1F63A40) & 1) == 0)
      {
        objc_msgSend_encryptedValueStore(self, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allKeys(v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend_count(v25, v26, v27, v28) != 0;

      }
    }

  }
  return v9;
}

- (BOOL)hasModifiedEncryptedData
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_chainPrivateKey(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend_mutableEncryptedPSK(self, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend_valueStore(self, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = objc_opt_class();
      v9 = 1;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v30, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsValueOfClasses_options_passingTest_(v14, v17, (uint64_t)v16, 1, &unk_1E1F63A60) & 1) == 0)
      {
        objc_msgSend_encryptedValueStore(self, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_changedKeys(v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend_count(v25, v26, v27, v28) != 0;

      }
    }

  }
  return v9;
}

- (void)setRecordChangeTag_modelMutation:(id)a3
{
  ((void (*)(CKRecord *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_setRecordChangeTag_, a3);
}

- (void)CKAssignToContainerWithID:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  char isEqual;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  char *v43;

  v43 = (char *)a3;
  objc_msgSend_containerID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v43;
  v11 = v8;
  if (v43 && v8 && (isEqual = objc_msgSend_isEqual_(v8, v43, (uint64_t)v43, v9), v10 = v43, (isEqual & 1) == 0))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v43, v13, v9);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2277, CFSTR("Cannot replace assigned container ID %@ with %@"), v11, v43);

    objc_msgSend_setContainerID_(self, v43, (uint64_t)v43, v42);
  }
  else
  {
    objc_msgSend_setContainerID_(self, v10, (uint64_t)v10, v9);
  }
  objc_msgSend_valueStore(self, v14, v15, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v17);
  objc_msgSend_values(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAssignToContainerWithID_(v21, v22, (uint64_t)v43, v23);

  objc_sync_exit(v17);
  objc_msgSend_encryptedValueStore(self, v24, v25, v26);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v27);
  objc_msgSend_values(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAssignToContainerWithID_(v31, v32, (uint64_t)v43, v33);

  objc_sync_exit(v27);
  objc_msgSend_pluginFields(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAssignToContainerWithID_(v37, v38, (uint64_t)v43, v39);

}

- (CKReference)share
{
  CKRecord *v2;
  CKReference *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_share;
  objc_sync_exit(v2);

  return v3;
}

- (void)setShare:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  char isEqualToString;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  CKRecord *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CKReference *share;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  id v64;

  v64 = a3;
  if (v64)
  {
    if (objc_msgSend_referenceAction(v64, v5, v6, v7))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v60, v61, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2303, CFSTR("Share references must be CKReferenceActionNone"));

    }
    objc_msgSend_recordID(v64, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneName(v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneName(v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v19, v32, (uint64_t)v31, v33);

    if ((isEqualToString & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v35, v36, v37);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v62, v63, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2306, CFSTR("Share must be in the same zone as the current record"));

    }
  }
  v38 = self;
  objc_sync_enter(v38);
  if ((objc_msgSend_isEqual_(v64, v39, (uint64_t)v38->_share, v40) & 1) == 0)
  {
    if (objc_msgSend_trackChanges(v38, v41, v42, v43))
    {
      objc_msgSend_previousShare(v38, v44, v45, v46);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_hasUpdatedShare(v38, v48, v49, v50)
        && (v47 == v64 || objc_msgSend_isEqual_(v64, v51, (uint64_t)v47, v52)))
      {
        objc_msgSend_setHasUpdatedShare_(v38, v51, 0, v52);
      }
      else
      {
        objc_msgSend_setHasUpdatedShare_(v38, v51, 1, v52);
      }
    }
    else
    {
      v47 = (id)objc_msgSend_copy(v64, v44, v45, v46);
      objc_msgSend_setPreviousShare_(v38, v53, (uint64_t)v47, v54);
    }

    v58 = objc_msgSend_copy(v64, v55, v56, v57);
    share = v38->_share;
    v38->_share = (CKReference *)v58;

  }
  objc_sync_exit(v38);

}

- (CKReference)parent
{
  CKRecord *v2;
  CKReference *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_parent;
  objc_sync_exit(v2);

  return v3;
}

- (void)setParent:(CKReference *)parent
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  char isEqualToString;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  CKRecord *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  CKReference *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CKReference *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  CKReference *v64;

  v64 = parent;
  if (v64)
  {
    if (objc_msgSend_referenceAction(v64, v5, v6, v7))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v60, v61, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2335, CFSTR("Parent references must be CKReferenceActionNone"));

    }
    objc_msgSend_recordID(v64, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneName(v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneName(v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v19, v32, (uint64_t)v31, v33);

    if ((isEqualToString & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v35, v36, v37);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v62, v63, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2338, CFSTR("Parent record must be in the same zone as the current record"));

    }
  }
  v38 = self;
  objc_sync_enter(v38);
  if ((objc_msgSend_isEqual_(v64, v39, (uint64_t)v38->_parent, v40) & 1) == 0)
  {
    if (objc_msgSend_trackChanges(v38, v41, v42, v43))
    {
      objc_msgSend_previousParent(v38, v44, v45, v46);
      v47 = (CKReference *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_hasUpdatedParent(v38, v48, v49, v50)
        && (v47 == v64 || objc_msgSend_isEqual_(v64, v51, (uint64_t)v47, v52)))
      {
        objc_msgSend_setHasUpdatedParent_(v38, v51, 0, v52);
      }
      else
      {
        objc_msgSend_setHasUpdatedParent_(v38, v51, 1, v52);
      }
    }
    else
    {
      v47 = (CKReference *)objc_msgSend_copy(v64, v44, v45, v46);
      objc_msgSend_setPreviousParent_(v38, v53, (uint64_t)v47, v54);
    }

    v58 = objc_msgSend_copy(v64, v55, v56, v57);
    v59 = v38->_parent;
    v38->_parent = (CKReference *)v58;

  }
  objc_sync_exit(v38);

}

- (void)setParentReferenceFromRecord:(CKRecord *)parentRecord
{
  uint64_t v3;
  CKRecord *v5;
  CKReference *v6;
  const char *v7;
  id v8;

  if (parentRecord)
  {
    v5 = parentRecord;
    v6 = [CKReference alloc];
    v8 = (id)objc_msgSend_initWithRecord_action_(v6, v7, (uint64_t)v5, 0);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend_setParent_(self, a2, (uint64_t)v8, v3);

}

- (void)setParentReferenceFromRecordID:(CKRecordID *)parentRecordID
{
  uint64_t v3;
  CKRecordID *v5;
  CKReference *v6;
  const char *v7;
  id v8;

  if (parentRecordID)
  {
    v5 = parentRecordID;
    v6 = [CKReference alloc];
    v8 = (id)objc_msgSend_initWithRecordID_action_(v6, v7, (uint64_t)v5, 0);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend_setParent_(self, a2, (uint64_t)v8, v3);

}

- (_PCSIdentityData)signingPCSIdentity
{
  CKRecord *v2;
  _PCSIdentityData *signingPCSIdentity;

  v2 = self;
  objc_sync_enter(v2);
  signingPCSIdentity = v2->_signingPCSIdentity;
  objc_sync_exit(v2);

  return signingPCSIdentity;
}

- (void)setSigningPCSIdentity:(_PCSIdentityData *)a3
{
  _PCSIdentityData *signingPCSIdentity;
  CKRecord *v5;
  CKRecord *obj;

  obj = self;
  objc_sync_enter(obj);
  signingPCSIdentity = obj->_signingPCSIdentity;
  if (signingPCSIdentity != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      v5 = obj;
      signingPCSIdentity = obj->_signingPCSIdentity;
    }
    else
    {
      v5 = obj;
    }
    v5->_signingPCSIdentity = a3;
    if (signingPCSIdentity)
      CFRelease(signingPCSIdentity);
  }
  objc_sync_exit(obj);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeSystemFieldsWithCoder:(NSCoder *)coder
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSCoder *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t isKnownToServer;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t hasUpdatedShare;
  const char *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t hasUpdatedParent;
  const char *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t isExpired;
  const char *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t hasUpdatedExpirationTimeInterval;
  const char *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t isMergeableValueDeltaRecord;
  const char *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint8_t v236[16];

  v7 = coder;
  if (byte_1EDF6A0E0 && objc_msgSend_isMergeableValueDeltaRecord(self, v4, v5, v6))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v8 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v236 = 0;
      _os_log_fault_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: Tried to encode system fields for a record without system fields. You'll receive a record like this when fetching changes from the server if the only mergeable fields have changed. In this case, the record will not contain any system fields, so you should not encode it. Check to make sure recordChangeTag is non-nil before encoding system fields for this record.", v236, 2u);
    }
  }
  v9 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_recordType(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v14, (uint64_t)v13, (uint64_t)CFSTR("RecordType"));

  objc_msgSend_recordID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v19, (uint64_t)v18, (uint64_t)CFSTR("RecordID"));

  objc_msgSend_creationDate(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v24, (uint64_t)v23, (uint64_t)CFSTR("RecordCtime"));

  objc_msgSend_modificationDate(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v29, (uint64_t)v28, (uint64_t)CFSTR("RecordMtime"));

  objc_msgSend_creatorUserRecordID(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v34, (uint64_t)v33, (uint64_t)CFSTR("CreatorUserRecordID"));

  objc_msgSend_lastModifiedUserRecordID(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v39, (uint64_t)v38, (uint64_t)CFSTR("LastModifiedUserRecordID"));

  objc_msgSend_modifiedByDevice(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v44, (uint64_t)v43, (uint64_t)CFSTR("ModifiedByDevice"));

  objc_msgSend_etag(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v49, (uint64_t)v48, (uint64_t)CFSTR("ETag"));

  objc_msgSend_conflictLoserEtags(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v54, (uint64_t)v53, (uint64_t)CFSTR("ConflictLoserEtags"));

  isKnownToServer = objc_msgSend_isKnownToServer(self, v55, v56, v57);
  objc_msgSend_encodeBool_forKey_(v7, v59, isKnownToServer, (uint64_t)CFSTR("KnownToServer"));
  v63 = objc_msgSend_wasCached(self, v60, v61, v62);
  objc_msgSend_encodeBool_forKey_(v7, v64, v63, (uint64_t)CFSTR("WasCached"));
  if (byte_1EDF6A0E0 || objc_msgSend_serializeProtectionData(self, v65, v66, v67))
  {
    objc_msgSend_protectionData(self, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v7, v69, (uint64_t)v68, (uint64_t)CFSTR("ProtectionData"));

    objc_msgSend_protectionEtag(self, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v7, v74, (uint64_t)v73, (uint64_t)CFSTR("ProtectionDataEtag"));

    objc_msgSend_chainProtectionInfo(self, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v7, v79, (uint64_t)v78, (uint64_t)CFSTR("ChainProtectionData"));

    objc_msgSend_chainPrivateKey(self, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v7, v84, (uint64_t)v83, (uint64_t)CFSTR("ChainPrivateKey"));

    if (!__sTestOverridesAvailable)
      goto LABEL_14;
    objc_msgSend_pcsKeysToRemove(self, v65, v66, v67);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v7, v86, (uint64_t)v85, (uint64_t)CFSTR("PCSKeysToRemove"));

  }
  if (__sTestOverridesAvailable && objc_msgSend_applyPCSKeysToRemoveForTesting(self, v65, v66, v67))
  {
    v87 = objc_msgSend_applyPCSKeysToRemoveForTesting(self, v65, v66, v67);
    objc_msgSend_encodeBool_forKey_(v7, v88, v87, (uint64_t)CFSTR("ApplyPCSKeysToRemoveForTesting"));
  }
LABEL_14:
  v89 = objc_msgSend_wantsChainPCS(self, v65, v66, v67);
  objc_msgSend_encodeBool_forKey_(v7, v90, v89, (uint64_t)CFSTR("WantsChainPCSKey"));
  objc_msgSend_chainParentPublicKeyID(self, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v95, (uint64_t)v94, (uint64_t)CFSTR("ChainParentPublicKeyID"));

  objc_msgSend_previousProtectionEtag(self, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v100, (uint64_t)v99, (uint64_t)CFSTR("PreviousProtectionDataEtag"));

  objc_msgSend_zoneProtectionEtag(self, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v105, (uint64_t)v104, (uint64_t)CFSTR("ZoneProtectionDataEtag"));

  objc_msgSend_shareEtag(self, v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v110, (uint64_t)v109, (uint64_t)CFSTR("ShareEtag"));

  objc_msgSend_tombstonedPublicKeyIDs(self, v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v115, (uint64_t)v114, (uint64_t)CFSTR("TombstonedPublicKeyIDs"));

  v119 = objc_msgSend_useLightweightPCS(self, v116, v117, v118);
  objc_msgSend_encodeBool_forKey_(v7, v120, v119, (uint64_t)CFSTR("UseLightweightPCS"));
  objc_msgSend_share(self, v121, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v125, (uint64_t)v124, (uint64_t)CFSTR("ShareReference"));

  objc_msgSend_previousShare(self, v126, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v130, (uint64_t)v129, (uint64_t)CFSTR("PreviousShareReference"));

  hasUpdatedShare = objc_msgSend_hasUpdatedShare(self, v131, v132, v133);
  objc_msgSend_encodeBool_forKey_(v7, v135, hasUpdatedShare, (uint64_t)CFSTR("HasUpdatedShareReference"));
  objc_msgSend_parent(self, v136, v137, v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v140, (uint64_t)v139, (uint64_t)CFSTR("ParentReference"));

  objc_msgSend_previousParent(self, v141, v142, v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v145, (uint64_t)v144, (uint64_t)CFSTR("PreviousParentReference"));

  hasUpdatedParent = objc_msgSend_hasUpdatedParent(self, v146, v147, v148);
  objc_msgSend_encodeBool_forKey_(v7, v150, hasUpdatedParent, (uint64_t)CFSTR("HasUpdatedParentReference"));
  v154 = objc_msgSend_permission(self, v151, v152, v153);
  objc_msgSend_encodeInteger_forKey_(v7, v155, v154, (uint64_t)CFSTR("Permission"));
  v159 = objc_msgSend_wantsPublicSharingKey(self, v156, v157, v158);
  objc_msgSend_encodeBool_forKey_(v7, v160, v159, (uint64_t)CFSTR("WantsPublicSharingKey"));
  objc_msgSend_routingKey(self, v161, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v165, (uint64_t)v164, (uint64_t)CFSTR("RoutingKey"));

  objc_msgSend_baseToken(self, v166, v167, v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v170, (uint64_t)v169, (uint64_t)CFSTR("BaseToken"));

  objc_msgSend_displayedHostname(self, v171, v172, v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v175, (uint64_t)v174, (uint64_t)CFSTR("DisplayedHostname"));

  objc_msgSend_mutableEncryptedPSK(self, v176, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v180, (uint64_t)v179, (uint64_t)CFSTR("MutableEncryptedPublicSharingKey"));

  objc_msgSend_mutableURL(self, v181, v182, v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v185, (uint64_t)v184, (uint64_t)CFSTR("URL"));

  objc_msgSend_previousProtectionEtagFromUnitTest(self, v186, v187, v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v190, (uint64_t)v189, (uint64_t)CFSTR("PreviousProtectionDataEtagFromUnitTest"));

  objc_msgSend_pcsKeyID(self, v191, v192, v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v195, (uint64_t)v194, (uint64_t)CFSTR("PCSKeyID"));

  objc_msgSend_allPCSKeyIDs(self, v196, v197, v198);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v200, (uint64_t)v199, (uint64_t)CFSTR("AllPCSKeyIDs"));

  objc_msgSend_zoneishKeyID(self, v201, v202, v203);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v205, (uint64_t)v204, (uint64_t)CFSTR("ZoneishKeyID"));

  objc_msgSend_expirationDate(self, v206, v207, v208);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v210, (uint64_t)v209, (uint64_t)CFSTR("ExpirationDate"));

  isExpired = objc_msgSend_isExpired(self, v211, v212, v213);
  objc_msgSend_encodeBool_forKey_(v7, v215, isExpired, (uint64_t)CFSTR("Expired"));
  hasUpdatedExpirationTimeInterval = objc_msgSend_hasUpdatedExpirationTimeInterval(self, v216, v217, v218);
  objc_msgSend_encodeBool_forKey_(v7, v220, hasUpdatedExpirationTimeInterval, (uint64_t)CFSTR("HasUpdatedExpiration"));
  objc_msgSend_updatedExpirationTimeInterval(self, v221, v222, v223);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v7, v225, (uint64_t)v224, (uint64_t)CFSTR("UpdatedExpiration"));

  isMergeableValueDeltaRecord = objc_msgSend_isMergeableValueDeltaRecord(self, v226, v227, v228);
  objc_msgSend_encodeBool_forKey_(v7, v230, isMergeableValueDeltaRecord, (uint64_t)CFSTR("MergeableValueDeltaRecord"));
  v234 = objc_msgSend_needsRollAndCounterSign(self, v231, v232, v233);
  objc_msgSend_encodeBool_forKey_(v7, v235, v234, (uint64_t)CFSTR("NeedsRollAndCounterSignKey"));
  objc_autoreleasePoolPop(v9);

}

- (void)preTiboEncodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  id v37;

  v37 = a3;
  if (!__sTestOverridesAvailable)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecord.m"), 2475, CFSTR("Only suitable for testing"));

  }
  v8 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_encodeSystemFieldsWithCoder_(self, v9, (uint64_t)v37, v10);
  objc_msgSend_valueStore(self, v11, v12, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  objc_msgSend_values(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v19, (uint64_t)v18, (uint64_t)CFSTR("RecordValues"));

  objc_msgSend_originalValues(v14, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v24, (uint64_t)v23, (uint64_t)CFSTR("OriginalValues"));

  objc_msgSend_changedKeysSet(v14, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v29, (uint64_t)v28, (uint64_t)CFSTR("ChangedKeys"));

  objc_sync_exit(v14);
  objc_msgSend_pluginFields(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v34, (uint64_t)v33, (uint64_t)CFSTR("PluginFields"));

  objc_autoreleasePoolPop(v8);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  v22 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_encodeSystemFieldsWithCoder_(self, v5, (uint64_t)v22, v6);
  objc_msgSend_valueStore(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v22, v11, (uint64_t)v10, (uint64_t)CFSTR("ValueStore"));

  objc_msgSend_encryptedValueStore(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v22, v16, (uint64_t)v15, (uint64_t)CFSTR("EncryptedValueStore"));

  objc_msgSend_pluginFields(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v22, v21, (uint64_t)v20, (uint64_t)CFSTR("PluginFields"));

  objc_autoreleasePoolPop(v4);
}

- (unint64_t)assetCount
{
  const char *v3;
  void *v4;
  const char *v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v13, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A743510;
  v8[3] = &unk_1E1F63A88;
  v8[4] = &v9;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v5, (uint64_t)v4, (uint64_t)v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (unint64_t)assetDiskSize
{
  const char *v3;
  void *v4;
  const char *v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v13, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A7438BC;
  v8[3] = &unk_1E1F63A88;
  v8[4] = &v9;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v5, (uint64_t)v4, (uint64_t)v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)setStreamingAssetRequestOptions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_valueStore(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A743C58;
  v13[3] = &unk_1E1F63AB0;
  v14 = v4;
  v11 = v4;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v8, v12, (uint64_t)v10, (uint64_t)v13);

}

- (void)releasePackages
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_valueStore(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v4, v7, (uint64_t)v6, (uint64_t)&unk_1E1F63AF0);

}

- (void)removePackages
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_valueStore(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v4, v7, (uint64_t)v6, (uint64_t)&unk_1E1F63B10);

}

- (void)claimPackagesWithSuccessBlock:(id)a3 failureBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id, id);
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id, id))a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  objc_msgSend_valueStore(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_18A743FB0;
  v24[3] = &unk_1E1F63B38;
  v19 = v11;
  v25 = v19;
  v20 = v8;
  v27 = v20;
  v29 = &v30;
  v21 = v12;
  v26 = v21;
  v22 = v9;
  v28 = v22;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v16, v23, (uint64_t)v18, (uint64_t)v24);

  if (v10)
    v10[2](v10, *((unsigned __int8 *)v31 + 24), v19, v21);

  _Block_object_dispose(&v30, 8);
}

+ (id)keyForListField:(id)a3 withIndexRange:(_NSRange)a4
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@[%ld..<%ld]"), a4.location, a3, a4.location, a4.location + a4.length);
}

+ (id)keyForInsertingIntoListField:(id)a3 atIndex:(int64_t)a4
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@[%ld..<%ld]"), a4, a3, a4, a4);
}

+ (id)keyForAppendingToListField:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@[%ld..<%ld]"), v3, a3, -1, 0);
}

+ (id)keyForFetchingItems:(unint64_t)a3 atEndOfListField:(id)a4
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@[%ld..<%ld]"), (uint64_t)a4, a4, ~a3, 0);
}

- (BOOL)containsMergeableValues
{
  const char *v3;
  void *v4;
  const char *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_containsValueOfClasses_passingTest_(self, v5, (uint64_t)v4, (uint64_t)&unk_1E1F55AA8);

  return (char)self;
}

- (BOOL)containsAssetBackedMergeableDeltas
{
  const char *v3;
  void *v4;
  const char *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_containsValueOfClasses_passingTest_(self, v5, (uint64_t)v4, (uint64_t)&unk_1E1F63B78);

  return (char)self;
}

- (BOOL)canSkipRecordSaveForMergeables
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_isKnownToServer(self, a2, v2, v3))
    return 0;
  objc_msgSend_etag(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  if ((objc_msgSend_hasUpdatedExpirationTimeInterval(self, v9, v10, v11) & 1) != 0)
    return 0;
  if ((objc_msgSend_hasUpdatedShare(self, v12, v13, v14) & 1) != 0)
    return 0;
  if ((objc_msgSend_hasUpdatedParent(self, v15, v16, v17) & 1) != 0)
    return 0;
  if ((objc_msgSend_requiresRecordSaveForMergeableDeltas(self, v18, v19, v20) & 1) != 0)
    return 0;
  objc_msgSend_changedKeys(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_count(v24, v25, v26, v27);

  if (!v28)
    return 0;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend_changedKeys(self, v29, v30, v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v34)
  {
    v37 = v34;
    v38 = *(_QWORD *)v56;
    while (2)
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v56 != v38)
          objc_enumerationMutation(v32);
        v40 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self, v35, v40, v36);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v41;
        if (v41)
        {
          v46 = v41;
        }
        else
        {
          objc_msgSend_encryptedValues(self, v42, v43, v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v47, v48, v40, v49);
          v46 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend_isValueIDKnownToServer(v46, v50, v51, v52) & 1) == 0)
        {

          v53 = 0;
          goto LABEL_25;
        }

      }
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v55, (uint64_t)v59, 16);
      v53 = 1;
      if (v37)
        continue;
      break;
    }
  }
  else
  {
    v53 = 1;
  }
LABEL_25:

  return v53;
}

- (BOOL)containsMergeableValuesWithDeltasToSave
{
  const char *v3;
  void *v4;
  const char *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_containsValueOfClasses_options_passingTest_(self, v5, (uint64_t)v4, 1, &unk_1E1F63B98);

  return (char)self;
}

- (BOOL)prepareMergeablesForUploadInContainer:(id)a3 useAssetsIfNecessary:(BOOL)a4 error:(id *)a5
{
  const char *v8;
  void *v9;
  const char *v10;
  _QWORD v12[4];
  BOOL v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v14[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A7446B0;
  v12[3] = &unk_1E1F63BB8;
  v13 = a4;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v10, (uint64_t)v9, (uint64_t)v12);

  if (a5)
    *a5 = 0;
  return 1;
}

- (void)countMergeableValueMetrics:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, uint64_t);
  const char *v5;
  void *v6;
  const char *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v21[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A744B64;
  v8[3] = &unk_1E1F63BE0;
  v8[4] = &v17;
  v8[5] = &v13;
  v8[6] = &v9;
  objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(self, v7, (uint64_t)v6, (uint64_t)v8);

  v4[2](v4, v18[3], v14[3], v10[3]);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

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

- (BOOL)containsValueOfClasses:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  const char *v20;

  v8 = a3;
  v9 = a5;
  objc_msgSend_valueStore(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsValueOfClasses_options_passingTest_(v13, v14, (uint64_t)v8, a4, v9) & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend_encryptedValueStore(self, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_containsValueOfClasses_options_passingTest_(v19, v20, (uint64_t)v8, a4, v9);

  }
  return v18;
}

- (BOOL)containsValueOfClasses:(id)a3 passingTest:(id)a4
{
  return objc_msgSend_containsValueOfClasses_options_passingTest_(self, a2, (uint64_t)a3, 0, a4);
}

- (BOOL)containsValuePassingTest:(id)a3
{
  return objc_msgSend_containsValueOfClasses_options_passingTest_(self, a2, 0, 0, a3);
}

- (void)enumerateKeysAndValuesOfClasses:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend_valueStore(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = sub_18A744EFC;
  v24 = &unk_1E1F63C08;
  v14 = v9;
  v25 = v14;
  v26 = &v27;
  objc_msgSend_enumerateKeysAndValuesOfClasses_options_usingBlock_(v13, v15, (uint64_t)v8, a4, &v21);

  if (!*((_BYTE *)v28 + 24))
  {
    objc_msgSend_encryptedValueStore(self, v16, v17, v18, v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enumerateKeysAndValuesOfClasses_options_usingBlock_(v19, v20, (uint64_t)v8, a4, v14);

  }
  _Block_object_dispose(&v27, 8);

}

- (void)enumerateKeysAndValuesOfClasses:(id)a3 usingBlock:(id)a4
{
  objc_msgSend_enumerateKeysAndValuesOfClasses_options_usingBlock_(self, a2, (uint64_t)a3, 0, a4);
}

- (void)enumerateKeysAndValuesUsingBlock:(id)a3
{
  objc_msgSend_enumerateKeysAndValuesOfClasses_options_usingBlock_(self, a2, 0, 0, a3);
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (CKRecordID)creatorUserRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCreatorUserRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (CKRecordID)lastModifiedUserRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastModifiedUserRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (CKContainerID)containerID
{
  return (CKContainerID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainerID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)setValueStore:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (void)setEncryptedValueStore:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (BOOL)needsRollAndCounterSign
{
  return self->_needsRollAndCounterSign;
}

- (void)setNeedsRollAndCounterSign:(BOOL)a3
{
  self->_needsRollAndCounterSign = a3;
}

- (BOOL)applyPCSKeysToRemoveForTesting
{
  return self->_applyPCSKeysToRemoveForTesting;
}

- (void)setApplyPCSKeysToRemoveForTesting:(BOOL)a3
{
  self->_applyPCSKeysToRemoveForTesting = a3;
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
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setUpdatedExpirationTimeInterval:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (BOOL)isExpired
{
  return self->_expired;
}

- (void)setExpired:(BOOL)a3
{
  self->_expired = a3;
}

- (BOOL)requiresRecordSaveForMergeableDeltas
{
  return self->_requiresRecordSaveForMergeableDeltas;
}

- (void)setRequiresRecordSaveForMergeableDeltas:(BOOL)a3
{
  self->_requiresRecordSaveForMergeableDeltas = a3;
}

- (BOOL)serializeProtectionData
{
  return self->_serializeProtectionData;
}

- (void)setSerializeProtectionData:(BOOL)a3
{
  self->_serializeProtectionData = a3;
}

- (NSData)zoneishKeyID
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (void)setZoneishKeyID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSString)previousProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPreviousProtectionEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSString)protectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProtectionEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSString)zoneProtectionEtag
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setZoneProtectionEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSString)shareEtag
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setShareEtag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (BOOL)isMergeableValueDeltaRecord
{
  return self->_isMergeableValueDeltaRecord;
}

- (void)setIsMergeableValueDeltaRecord:(BOOL)a3
{
  self->_isMergeableValueDeltaRecord = a3;
}

- (NSString)previousProtectionEtagFromUnitTest
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPreviousProtectionEtagFromUnitTest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSData)pcsKeyID
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPcsKeyID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (CKReference)previousShare
{
  return (CKReference *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPreviousShare:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (BOOL)hasUpdatedShare
{
  return self->_hasUpdatedShare;
}

- (void)setHasUpdatedShare:(BOOL)a3
{
  self->_hasUpdatedShare = a3;
}

- (CKReference)previousParent
{
  return (CKReference *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPreviousParent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)hasUpdatedParent
{
  return self->_hasUpdatedParent;
}

- (void)setHasUpdatedParent:(BOOL)a3
{
  self->_hasUpdatedParent = a3;
}

- (CKEncryptedData)chainPrivateKey
{
  return (CKEncryptedData *)objc_getProperty(self, a2, 272, 1);
}

- (void)setChainPrivateKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (NSData)chainProtectionInfo
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setChainProtectionInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (NSData)chainParentPublicKeyID
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setChainParentPublicKeyID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 288);
}

- (CKPCSKeysToRemove)pcsKeysToRemove
{
  return (CKPCSKeysToRemove *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPcsKeysToRemove:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (NSURL)mutableURL
{
  return (NSURL *)objc_getProperty(self, a2, 304, 1);
}

- (void)setMutableURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (BOOL)isKnownToServer
{
  return self->_knownToServer;
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (void)setWasCached:(BOOL)a3
{
  self->_wasCached = a3;
}

- (int64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(int64_t)a3
{
  self->_permission = a3;
}

- (NSString)etag
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)modifiedByDevice
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setModifiedByDevice:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (NSData)protectionData
{
  return (NSData *)objc_getProperty(self, a2, 328, 1);
}

- (void)setProtectionData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (BOOL)wantsChainPCS
{
  return self->_wantsChainPCS;
}

- (void)setWantsChainPCS:(BOOL)a3
{
  self->_wantsChainPCS = a3;
}

- (BOOL)useLightweightPCS
{
  return self->_useLightweightPCS;
}

- (void)setUseLightweightPCS:(BOOL)a3
{
  self->_useLightweightPCS = a3;
}

- (NSString)routingKey
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setRoutingKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (BOOL)wantsPublicSharingKey
{
  return self->_wantsPublicSharingKey;
}

- (void)setWantsPublicSharingKey:(BOOL)a3
{
  self->_wantsPublicSharingKey = a3;
}

@end
