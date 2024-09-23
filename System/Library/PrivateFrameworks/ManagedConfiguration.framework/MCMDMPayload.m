@implementation MCMDMPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.mdm"));
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("MDM_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("MDM_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)_invalidRightsError
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  -[MCPayload friendlyName](self, "friendlyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MCErrorArray(CFSTR("MDM_ERROR_INVALID_RIGHTS_P_NAME"), v4, v5, v6, v7, v8, v9, v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCMDMErrorDomain"), 12000, v11, CFSTR("MCFatalError"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_invalidTopicError
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  -[MCPayload friendlyName](self, "friendlyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MCErrorArray(CFSTR("MDM_ERROR_INVALID_TOPIC_P_NAME"), v4, v5, v6, v7, v8, v9, v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCMDMErrorDomain"), 12022, v11, CFSTR("MCFatalError"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_nonHTTPSURLErrorForField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("MDM_ERROR_FIELD_NOT_HTTPS_P_FIELD"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCMDMErrorDomain"), 12034, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MCMDMPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCMDMPayload *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSData *identityPersistentID;
  uint64_t v16;
  uint64_t v17;
  NSString *serverURLString;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *serverPinningPersistentRefs;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *checkInPinningPersistentRefs;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSNumber *pollingIntervalMinutes;
  uint64_t v31;
  uint64_t v32;
  NSString *topic;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSNumber *requiredAppIDForMDM;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  NSString *enrollmentMode;
  uint64_t v43;
  NSString *personaID;
  uint64_t v45;
  NSString *enrollmentID;
  uint64_t v47;
  NSString *iCloudEnrollmentID;
  uint64_t v49;
  NSString *easEnrollmentID;
  uint64_t v51;
  uint64_t v52;
  NSString *identityUUID;
  uint64_t v54;
  NSString *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSArray *serverPinningUUIDs;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  NSArray *checkInPinningUUIDs;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSNumber *v68;
  uint64_t v69;
  uint64_t v70;
  NSString *v71;
  uint64_t v72;
  uint64_t v73;
  NSString *managedAppleID;
  uint64_t v75;
  uint64_t v76;
  NSString *assignedManagedAppleID;
  uint64_t v78;
  uint64_t v79;
  NSString *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSNumber *useDevelopmentAPNSNum;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  NSNumber *signMessageNum;
  uint64_t v91;
  uint64_t v92;
  NSNumber *checkOutWhenRemovedNum;
  uint64_t v94;
  NSString *checkInURLString;
  NSString **p_checkInURLString;
  uint64_t v97;
  uint64_t v98;
  NSArray *serverCapabilities;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSNumber *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  id v111;
  void *v112;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  NSString *v120;
  uint64_t v121;
  unint64_t accessRights;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  char v127;
  MCMDMPayload *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  char v142;
  id v143[2];
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  objc_super v173;
  uint8_t buf[4];
  void *v175;
  __int16 v176;
  id v177;
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v173.receiver = self;
  v173.super_class = (Class)MCMDMPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v173, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    if (objc_msgSend(v9, "isStub"))
    {
      v11 = objc_opt_class();
      v12 = *MEMORY[0x1E0D448C0];
      v172 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v11, v12, 0, &v172);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v172;
      identityPersistentID = v10->_identityPersistentID;
      v10->_identityPersistentID = (NSData *)v13;

      if (v14)
        goto LABEL_47;
      v16 = *MEMORY[0x1E0D44920];
      v171 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v16, 0, &v171);
      v17 = objc_claimAutoreleasedReturnValue();
      v14 = v171;
      serverURLString = v10->_serverURLString;
      v10->_serverURLString = (NSString *)v17;

      if (v14)
        goto LABEL_47;
      v19 = objc_opt_class();
      v20 = *MEMORY[0x1E0D44910];
      v170 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", v19, v20, 0, &v170);
      v21 = objc_claimAutoreleasedReturnValue();
      v14 = v170;
      serverPinningPersistentRefs = v10->_serverPinningPersistentRefs;
      v10->_serverPinningPersistentRefs = (NSArray *)v21;

      if (v14)
        goto LABEL_47;
      v23 = objc_opt_class();
      v24 = *MEMORY[0x1E0D44860];
      v169 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", v23, v24, 0, &v169);
      v25 = objc_claimAutoreleasedReturnValue();
      v14 = v169;
      checkInPinningPersistentRefs = v10->_checkInPinningPersistentRefs;
      v10->_checkInPinningPersistentRefs = (NSArray *)v25;

      if (v14)
        goto LABEL_47;
      v27 = objc_opt_class();
      v28 = *MEMORY[0x1E0D448F8];
      v168 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v27, v28, 0, &v168);
      v29 = objc_claimAutoreleasedReturnValue();
      v14 = v168;
      pollingIntervalMinutes = v10->_pollingIntervalMinutes;
      v10->_pollingIntervalMinutes = (NSNumber *)v29;

      if (v14)
        goto LABEL_47;
      v31 = *MEMORY[0x1E0D44938];
      v167 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v31, 0, &v167);
      v32 = objc_claimAutoreleasedReturnValue();
      v14 = v167;
      topic = v10->_topic;
      v10->_topic = (NSString *)v32;

      if (v14)
        goto LABEL_47;
      v34 = objc_opt_class();
      v35 = *MEMORY[0x1E0D44900];
      v166 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v34, v35, 0, &v166);
      v36 = objc_claimAutoreleasedReturnValue();
      v14 = v166;
      requiredAppIDForMDM = v10->_requiredAppIDForMDM;
      v10->_requiredAppIDForMDM = (NSNumber *)v36;

      if (v14)
        goto LABEL_47;
      v38 = objc_opt_class();
      v39 = *MEMORY[0x1E0D44958];
      v165 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v38, v39, 0, &v165);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v165;
      v10->_isUserEnrollment = objc_msgSend(v14, "BOOLValue");
      if (v40)
        goto LABEL_46;
      v41 = *MEMORY[0x1E0D448A0];
      v164 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v41, 0, &v164);
      v136 = objc_claimAutoreleasedReturnValue();
      v40 = v164;
      enrollmentMode = v10->_enrollmentMode;
      v10->_enrollmentMode = (NSString *)v136;

      if (v40)
        goto LABEL_46;
      v43 = *MEMORY[0x1E0D448E8];
      v163 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v43, 0, &v163);
      v137 = objc_claimAutoreleasedReturnValue();
      v40 = v163;
      personaID = v10->_personaID;
      v10->_personaID = (NSString *)v137;

      if (v40)
        goto LABEL_46;
      v45 = *MEMORY[0x1E0D44888];
      v162 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v45, 0, &v162);
      v138 = objc_claimAutoreleasedReturnValue();
      v40 = v162;
      enrollmentID = v10->_enrollmentID;
      v10->_enrollmentID = (NSString *)v138;

      if (v40)
        goto LABEL_46;
      v47 = *MEMORY[0x1E0D44960];
      v161 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v47, 0, &v161);
      v139 = objc_claimAutoreleasedReturnValue();
      v40 = v161;
      iCloudEnrollmentID = v10->_iCloudEnrollmentID;
      v10->_iCloudEnrollmentID = (NSString *)v139;

      if (v40)
        goto LABEL_46;
      v49 = *MEMORY[0x1E0D44880];
      v160 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v49, 0, &v160);
      v140 = objc_claimAutoreleasedReturnValue();
      v40 = v160;
      easEnrollmentID = v10->_easEnrollmentID;
      v10->_easEnrollmentID = (NSString *)v140;

      if (v40)
        goto LABEL_46;
      if (!v10->_isUserEnrollment)
      {
        v114 = objc_opt_class();
        v115 = *MEMORY[0x1E0D44850];
        v159 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v114, v115, 0, &v159);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = v159;
        if (v141)
        {

          v40 = v141;
          goto LABEL_46;
        }
        v10->_accessRights = objc_msgSend(v116, "unsignedIntValue");

      }
    }
    else
    {
      v51 = *MEMORY[0x1E0D448B8];
      v158 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v51, 1, &v158);
      v52 = objc_claimAutoreleasedReturnValue();
      v14 = v158;
      identityUUID = v10->_identityUUID;
      v10->_identityUUID = (NSString *)v52;

      if (v14)
        goto LABEL_47;
      v16 = *MEMORY[0x1E0D44920];
      v157 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v16, 1, &v157);
      v54 = objc_claimAutoreleasedReturnValue();
      v14 = v157;
      v55 = v10->_serverURLString;
      v10->_serverURLString = (NSString *)v54;

      if (v14)
        goto LABEL_47;
      v56 = objc_opt_class();
      v57 = *MEMORY[0x1E0D44918];
      v156 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", v56, v57, 0, &v156);
      v58 = objc_claimAutoreleasedReturnValue();
      v14 = v156;
      serverPinningUUIDs = v10->_serverPinningUUIDs;
      v10->_serverPinningUUIDs = (NSArray *)v58;

      if (v14)
        goto LABEL_47;
      v60 = objc_opt_class();
      v61 = *MEMORY[0x1E0D44868];
      v155 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", v60, v61, 0, &v155);
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = v155;
      checkInPinningUUIDs = v10->_checkInPinningUUIDs;
      v10->_checkInPinningUUIDs = (NSArray *)v62;

      v65 = objc_opt_class();
      v66 = *MEMORY[0x1E0D448F8];
      v154 = v63;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v65, v66, 0, &v154);
      v67 = objc_claimAutoreleasedReturnValue();
      v14 = v154;

      v68 = v10->_pollingIntervalMinutes;
      v10->_pollingIntervalMinutes = (NSNumber *)v67;

      if (v14)
        goto LABEL_47;
      v69 = *MEMORY[0x1E0D44938];
      v153 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v69, 0, &v153);
      v70 = objc_claimAutoreleasedReturnValue();
      v14 = v153;
      v71 = v10->_topic;
      v10->_topic = (NSString *)v70;

      if (v14)
        goto LABEL_47;
      v72 = *MEMORY[0x1E0D448C8];
      v152 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v72, 0, &v152);
      v73 = objc_claimAutoreleasedReturnValue();
      v14 = v152;
      managedAppleID = v10->_managedAppleID;
      v10->_managedAppleID = (NSString *)v73;

      if (v14)
        goto LABEL_47;
      v75 = *MEMORY[0x1E0D44858];
      v151 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v75, 0, &v151);
      v76 = objc_claimAutoreleasedReturnValue();
      v14 = v151;
      assignedManagedAppleID = v10->_assignedManagedAppleID;
      v10->_assignedManagedAppleID = (NSString *)v76;

      if (v14)
        goto LABEL_47;
      v78 = *MEMORY[0x1E0D448A0];
      v150 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", v78, 0, &v150);
      v79 = objc_claimAutoreleasedReturnValue();
      v14 = v150;
      v80 = v10->_enrollmentMode;
      v10->_enrollmentMode = (NSString *)v79;

      if (v14)
        goto LABEL_47;
      if (v10->_managedAppleID
        || -[NSString isEqualToString:](v10->_enrollmentMode, "isEqualToString:", *MEMORY[0x1E0D44898]))
      {
        v10->_isUserEnrollment = 1;
      }
      if (!v10->_managedAppleID
        && (-[NSString isEqualToString:](v10->_enrollmentMode, "isEqualToString:", *MEMORY[0x1E0D44898])
         || -[NSString isEqualToString:](v10->_enrollmentMode, "isEqualToString:", *MEMORY[0x1E0D44890])))
      {
        v100 = objc_opt_class();
        v101 = *MEMORY[0x1E0D44900];
        v149 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v100, v101, 0, &v149);
        v102 = objc_claimAutoreleasedReturnValue();
        v14 = v149;
        v103 = v10->_requiredAppIDForMDM;
        v10->_requiredAppIDForMDM = (NSNumber *)v102;

        if (v14)
          goto LABEL_47;
      }
      if (v10->_isUserEnrollment)
      {
LABEL_31:
        v81 = objc_opt_class();
        v82 = *MEMORY[0x1E0D44948];
        v147 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v81, v82, 0, &v147);
        v83 = objc_claimAutoreleasedReturnValue();
        v14 = v147;
        useDevelopmentAPNSNum = v10->_useDevelopmentAPNSNum;
        v10->_useDevelopmentAPNSNum = (NSNumber *)v83;

        if (v14)
        {
LABEL_47:
          v106 = (void *)objc_msgSend(v14, "MCCopyAsPrimaryError");
          -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v106);
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if (a5)
            *a5 = objc_retainAutorelease(v107);
          v108 = (void *)_MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
          {
            v109 = v108;
            v110 = (void *)objc_opt_class();
            v111 = v110;
            objc_msgSend(v107, "MCVerboseDescription");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v175 = v110;
            v176 = 2114;
            v177 = v112;
            _os_log_impl(&dword_19ECC4000, v109, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

          }
          v10 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v10->_useDevelopmentAPNS = -[NSNumber BOOLValue](v10->_useDevelopmentAPNSNum, "BOOLValue");
        v85 = objc_opt_class();
        v86 = *MEMORY[0x1E0D448F0];
        v146 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v85, v86, 0, &v146);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v87 = v146;
        if (!v87)
        {
          v10->_pinningRevocationCheckRequired = objc_msgSend(v14, "BOOLValue");
          v88 = objc_opt_class();
          v89 = *MEMORY[0x1E0D44930];
          v145 = 0;
          objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v88, v89, 0, &v145);
          v132 = objc_claimAutoreleasedReturnValue();
          v40 = v145;
          signMessageNum = v10->_signMessageNum;
          v10->_signMessageNum = (NSNumber *)v132;

          if (v40)
            goto LABEL_46;
          v10->_signMessage = -[NSNumber BOOLValue](v10->_signMessageNum, "BOOLValue");
          v91 = objc_opt_class();
          v92 = *MEMORY[0x1E0D44878];
          v144 = 0;
          objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v91, v92, 0, &v144);
          v133 = objc_claimAutoreleasedReturnValue();
          v40 = v144;
          checkOutWhenRemovedNum = v10->_checkOutWhenRemovedNum;
          v10->_checkOutWhenRemovedNum = (NSNumber *)v133;

          if (v40)
            goto LABEL_46;
          v10->_checkOutWhenRemoved = -[NSNumber BOOLValue](v10->_checkOutWhenRemovedNum, "BOOLValue");
          v94 = *MEMORY[0x1E0D44870];
          v143[1] = 0;
          v131 = v94;
          objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:");
          v134 = objc_claimAutoreleasedReturnValue();
          v40 = 0;
          checkInURLString = v10->_checkInURLString;
          p_checkInURLString = &v10->_checkInURLString;
          v10->_checkInURLString = (NSString *)v134;

          if (v40)
            goto LABEL_46;
          if (!*p_checkInURLString)
            objc_storeStrong((id *)&v10->_checkInURLString, v10->_serverURLString);
          v97 = objc_opt_class();
          v98 = *MEMORY[0x1E0D44908];
          v143[0] = 0;
          objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", v97, v98, 0, v143);
          v135 = objc_claimAutoreleasedReturnValue();
          v40 = v143[0];
          serverCapabilities = v10->_serverCapabilities;
          v10->_serverCapabilities = (NSArray *)v135;

          if (v40)
            goto LABEL_46;
          if ((objc_msgSend(v9, "isStub") & 1) != 0)
          {
LABEL_62:
            if (objc_msgSend(v8, "count"))
            {
              v117 = (void *)_MCLogObjects;
              if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
              {
                v118 = v117;
                -[MCPayload friendlyName](v10, "friendlyName");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v175 = v119;
                v176 = 2114;
                v177 = v8;
                _os_log_impl(&dword_19ECC4000, v118, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);

              }
            }
            goto LABEL_52;
          }
          if (!-[MCMDMPayload isUserEnrollment](v10, "isUserEnrollment"))
          {
            accessRights = v10->_accessRights;
            if (!accessRights
              || (v10->_accessRights & 3) == 2
              || accessRights >> 13
              || (v10->_accessRights & 0xC0) == 0x80)
            {
              goto LABEL_77;
            }
          }
          v120 = v10->_topic;
          if (v120)
          {
            if (-[NSString rangeOfString:options:](v120, "rangeOfString:options:", CFSTR("com.apple.mdm.limited."), 8) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (-[NSString rangeOfString:options:](v10->_topic, "rangeOfString:options:", CFSTR("com.apple.mgmt."), 8) == 0x7FFFFFFFFFFFFFFFLL)
              {
                -[MCMDMPayload _invalidTopicError](v10, "_invalidTopicError");
                v121 = objc_claimAutoreleasedReturnValue();
                goto LABEL_83;
              }
            }
            else if ((v10->_accessRights & 0xC) != 0)
            {
LABEL_77:
              -[MCMDMPayload _invalidRightsError](v10, "_invalidRightsError");
              v121 = objc_claimAutoreleasedReturnValue();
              goto LABEL_83;
            }
          }
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10->_serverURLString);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "scheme");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v142 = objc_msgSend(v124, "isEqualToString:", CFSTR("https"));

          if ((v142 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *p_checkInURLString);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "scheme");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = objc_msgSend(v126, "isEqualToString:", CFSTR("https"));

            if ((v127 & 1) != 0)
              goto LABEL_62;
            v128 = v10;
            v129 = v131;
          }
          else
          {
            v128 = v10;
            v129 = v16;
          }
          -[MCMDMPayload _nonHTTPSURLErrorForField:](v128, "_nonHTTPSURLErrorForField:", v129);
          v121 = objc_claimAutoreleasedReturnValue();
LABEL_83:
          v130 = (void *)v121;

          v14 = v130;
          if (!v130)
            goto LABEL_53;
          goto LABEL_47;
        }
        goto LABEL_45;
      }
      v104 = objc_opt_class();
      v105 = *MEMORY[0x1E0D44850];
      v148 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v104, v105, 0, &v148);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v87 = v148;
      if (v87
        || v14
        && -[NSString isEqualToString:](v10->_enrollmentMode, "isEqualToString:", *MEMORY[0x1E0D44898])
        && (-[MCMDMPayload _invalidRightsError](v10, "_invalidRightsError"),
            (v87 = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {
LABEL_45:
        v40 = v87;
LABEL_46:

        v14 = v40;
        goto LABEL_47;
      }
      v10->_accessRights = objc_msgSend(v14, "unsignedIntValue");
    }

    goto LABEL_31;
  }
LABEL_53:

  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCMDMPayload;
  -[MCPayload stubDictionary](&v11, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_identityPersistentID, *MEMORY[0x1E0D448C0]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_serverURLString, *MEMORY[0x1E0D44920]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_serverPinningPersistentRefs, *MEMORY[0x1E0D44910]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_checkInURLString, *MEMORY[0x1E0D44870]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_checkInPinningPersistentRefs, *MEMORY[0x1E0D44860]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_topic, *MEMORY[0x1E0D44938]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_pollingIntervalMinutes, *MEMORY[0x1E0D448F8]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_serverCapabilities, *MEMORY[0x1E0D44908]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_personaID, *MEMORY[0x1E0D448E8]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_enrollmentID, *MEMORY[0x1E0D44888]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_iCloudEnrollmentID, *MEMORY[0x1E0D44960]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_easEnrollmentID, *MEMORY[0x1E0D44880]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_requiredAppIDForMDM, *MEMORY[0x1E0D44900]);
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_enrollmentMode, *MEMORY[0x1E0D448A0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_accessRights);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0D44850]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useDevelopmentAPNS);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0D44948]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_checkOutWhenRemoved);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0D44878]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_signMessage);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0D44930]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_pinningRevocationCheckRequired);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x1E0D448F0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUserEnrollment);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x1E0D44958]);

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  NSData *identityPersistentID;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *serverPinningUUIDs;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  const __CFString *v18;
  NSArray *serverPinningPersistentRefs;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  NSArray *checkInPinningUUIDs;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t k;
  const __CFString *v36;
  NSArray *checkInPinningPersistentRefs;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t m;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  unint64_t accessRights;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v67.receiver = self;
  v67.super_class = (Class)MCMDMPayload;
  -[MCPayload verboseDescription](&v67, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_identityUUID)
    objc_msgSend(v5, "appendFormat:", CFSTR("Cert UUID   : %@\n"), self->_identityUUID);
  identityPersistentID = self->_identityPersistentID;
  if (identityPersistentID)
  {
    -[NSData MCHexString](identityPersistentID, "MCHexString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Persist ID  : %@\n"), v7);

  }
  if (self->_topic)
    objc_msgSend(v5, "appendFormat:", CFSTR("Topic           : %@\n"), self->_topic);
  objc_msgSend(v5, "appendFormat:", CFSTR("Polling Interval: %@\n"), self->_pollingIntervalMinutes);
  if (self->_serverURLString)
    objc_msgSend(v5, "appendFormat:", CFSTR("Server URL      : %@\n"), self->_serverURLString);
  MCStringForBool(self->_useDevelopmentAPNS);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Dev APNS        : %@\n"), v8);

  if (self->_checkInURLString)
    objc_msgSend(v5, "appendFormat:", CFSTR("Check-in URL    : %@\n"), self->_checkInURLString);
  objc_msgSend(v5, "appendFormat:", CFSTR("Required App ID: %@\n"), self->_requiredAppIDForMDM);
  MCStringForBool(self->_signMessage);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Sign message    : %@\n"), v9);

  MCStringForBool(self->_checkOutWhenRemoved);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Check out       : %@\n"), v10);

  if (self->_serverCapabilities)
    objc_msgSend(v5, "appendFormat:", CFSTR("Capabilities    : %@\n"), self->_serverCapabilities);
  serverPinningUUIDs = self->_serverPinningUUIDs;
  if (serverPinningUUIDs)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v12 = serverPinningUUIDs;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v64;
      v16 = 1;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v64 != v15)
            objc_enumerationMutation(v12);
          if ((v16 & 1) != 0)
            v18 = CFSTR("Server Pinning UUIDs : %@\n");
          else
            v18 = CFSTR("                     : %@\n");
          objc_msgSend(v5, "appendFormat:", v18, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
          v16 = 0;
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
        v16 = 0;
      }
      while (v14);
    }

  }
  serverPinningPersistentRefs = self->_serverPinningPersistentRefs;
  if (serverPinningPersistentRefs)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v20 = serverPinningPersistentRefs;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v60;
      v24 = 1;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v60 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "MCHexString");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if ((v24 & 1) != 0)
            v28 = CFSTR("Server Pinning Refs  : %@\n");
          else
            v28 = CFSTR("                     : %@\n");
          objc_msgSend(v5, "appendFormat:", v28, v26);

          v24 = 0;
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        v24 = 0;
      }
      while (v22);
    }

  }
  checkInPinningUUIDs = self->_checkInPinningUUIDs;
  if (checkInPinningUUIDs)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v30 = checkInPinningUUIDs;
    v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v56;
      v34 = 1;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v56 != v33)
            objc_enumerationMutation(v30);
          if ((v34 & 1) != 0)
            v36 = CFSTR("CheckIn Pinning UUIDs: %@\n");
          else
            v36 = CFSTR("                     : %@\n");
          objc_msgSend(v5, "appendFormat:", v36, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k));
          v34 = 0;
        }
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        v34 = 0;
      }
      while (v32);
    }

  }
  checkInPinningPersistentRefs = self->_checkInPinningPersistentRefs;
  if (checkInPinningPersistentRefs)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v38 = checkInPinningPersistentRefs;
    v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v52;
      v42 = 1;
      do
      {
        for (m = 0; m != v40; ++m)
        {
          if (*(_QWORD *)v52 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * m), "MCHexString");
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = (void *)v44;
          if ((v42 & 1) != 0)
            v46 = CFSTR("CheckIn Pinning Refs : %@\n");
          else
            v46 = CFSTR("                     : %@\n");
          objc_msgSend(v5, "appendFormat:", v46, v44);

          v42 = 0;
        }
        v40 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
        v42 = 0;
      }
      while (v40);
    }

  }
  MCStringForBool(self->_pinningRevocationCheckRequired);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Hard revocation check: %@\n"), v47);

  objc_msgSend(v5, "appendFormat:", CFSTR("Access Rights:\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 1) != 0)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("  Profile Inspection\n"));
    accessRights = self->_accessRights;
    if ((accessRights & 2) == 0)
    {
LABEL_63:
      if ((accessRights & 4) == 0)
        goto LABEL_64;
      goto LABEL_80;
    }
  }
  else if ((accessRights & 2) == 0)
  {
    goto LABEL_63;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("  Profile Installation and removal\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 4) == 0)
  {
LABEL_64:
    if ((accessRights & 8) == 0)
      goto LABEL_65;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Passcode change\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 8) == 0)
  {
LABEL_65:
    if ((accessRights & 0x10) == 0)
      goto LABEL_66;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Device erase\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 0x10) == 0)
  {
LABEL_66:
    if ((accessRights & 0x20) == 0)
      goto LABEL_67;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Device information\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 0x20) == 0)
  {
LABEL_67:
    if ((accessRights & 0x40) == 0)
      goto LABEL_68;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Network information\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 0x40) == 0)
  {
LABEL_68:
    if ((accessRights & 0x80) == 0)
      goto LABEL_69;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Provisioning profile inspection\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 0x80) == 0)
  {
LABEL_69:
    if ((accessRights & 0x100) == 0)
      goto LABEL_70;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Provisioning profile installation and removal\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 0x100) == 0)
  {
LABEL_70:
    if ((accessRights & 0x200) == 0)
      goto LABEL_71;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(v5, "appendFormat:", CFSTR("  List installed applications\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 0x200) == 0)
  {
LABEL_71:
    if ((accessRights & 0x400) == 0)
      goto LABEL_72;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Query restriction-related information\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 0x400) == 0)
  {
LABEL_72:
    if ((accessRights & 0x800) == 0)
      goto LABEL_73;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Query security-related information\n"));
  accessRights = self->_accessRights;
  if ((accessRights & 0x800) == 0)
  {
LABEL_73:
    if ((accessRights & 0x1000) == 0)
      goto LABEL_75;
    goto LABEL_74;
  }
LABEL_89:
  objc_msgSend(v5, "appendFormat:", CFSTR("  Apply settings\n"));
  if ((self->_accessRights & 0x1000) != 0)
LABEL_74:
    objc_msgSend(v5, "appendFormat:", CFSTR("  Install apps\n"));
LABEL_75:
  if (-[MCMDMPayload isUserEnrollment](self, "isUserEnrollment"))
  {
    -[MCMDMPayload managedAppleIDName](self, "managedAppleIDName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("MAID        : %@\n"), v49);

  }
  return v5;
}

- (NSArray)localizedAccessRightDescriptions
{
  void *v3;
  unint64_t accessRights;
  void *v5;
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessRights = self->_accessRights;
  if ((accessRights & 8) != 0)
  {
    MCLocalizedString(CFSTR("MDM_ERASE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

    accessRights = self->_accessRights;
    if ((accessRights & 4) == 0)
    {
LABEL_3:
      if ((accessRights & 1) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((accessRights & 4) == 0)
  {
    goto LABEL_3;
  }
  MCLocalizedString(CFSTR("MDM_REMOVE_PASSCODE_LOCK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  accessRights = self->_accessRights;
  if ((accessRights & 1) == 0)
  {
LABEL_4:
    if ((accessRights & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  MCLocalizedString(CFSTR("MDM_INSPECT_PROFILE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  accessRights = self->_accessRights;
  if ((accessRights & 2) == 0)
  {
LABEL_5:
    if ((accessRights & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  MCLocalizedString(CFSTR("MDM_INSTALL_REMOVE_PROFILE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  accessRights = self->_accessRights;
  if ((accessRights & 0x40) == 0)
  {
LABEL_6:
    if ((accessRights & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  MCLocalizedString(CFSTR("MDM_LIST_PROV"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  accessRights = self->_accessRights;
  if ((accessRights & 0x80) == 0)
  {
LABEL_7:
    if ((accessRights & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  MCLocalizedString(CFSTR("MDM_INSTALL_REMOVE_PROV"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  accessRights = self->_accessRights;
  if ((accessRights & 0x10) == 0)
  {
LABEL_8:
    if ((accessRights & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  MCLocalizedString(CFSTR("MDM_QUERY_INFO"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  accessRights = self->_accessRights;
  if ((accessRights & 0x20) == 0)
  {
LABEL_9:
    if ((accessRights & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  MCLocalizedString(CFSTR("MDM_QUERY_INFO_NETWORK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  accessRights = self->_accessRights;
  if ((accessRights & 0x100) == 0)
  {
LABEL_10:
    if ((accessRights & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  MCLocalizedString(CFSTR("MDM_LIST_APP"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  accessRights = self->_accessRights;
  if ((accessRights & 0x200) == 0)
  {
LABEL_11:
    if ((accessRights & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  MCLocalizedString(CFSTR("MDM_QUERY_RESTRICTIONS"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  accessRights = self->_accessRights;
  if ((accessRights & 0x400) == 0)
  {
LABEL_12:
    if ((accessRights & 0x800) == 0)
      goto LABEL_13;
LABEL_27:
    MCLocalizedString(CFSTR("MDM_APPLY_SETTINGS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

    if ((self->_accessRights & 0x1000) == 0)
      return (NSArray *)v3;
    goto LABEL_14;
  }
LABEL_26:
  MCLocalizedString(CFSTR("MDM_QUERY_SECURITY"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  accessRights = self->_accessRights;
  if ((accessRights & 0x800) != 0)
    goto LABEL_27;
LABEL_13:
  if ((accessRights & 0x1000) != 0)
  {
LABEL_14:
    MCLocalizedString(CFSTR("MDM_APP_INSTALL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return (NSArray *)v3;
}

- (id)installationWarnings
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t accessRights;
  BOOL v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  if (-[MCMDMPayload isUserEnrollment](self, "isUserEnrollment"))
  {
    if (+[MCFeatureOverrides allowVPNInUserEnrollment](MCFeatureOverrides, "allowVPNInUserEnrollment"))
    {
      MCLocalizedAppleInternalString(CFSTR("INSTALL_WARNING_APPLE_INTERNAL_VPN_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedAppleInternalStringByDevice(CFSTR("INSTALL_WARNING_APPLE_INTERNAL_VPN"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v10, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    v16 = 0;
  }
  else
  {
    accessRights = self->_accessRights;
    v14 = (accessRights & 0x82) == 0;
    if ((accessRights & 8) == 0)
      v14 = 1;
    if ((accessRights & 0x1000) != 0)
    {
      if (v14)
      {
        if ((accessRights & 0x82) != 0)
        {
          v15 = CFSTR("INSTALL_WARNING_APP_INSPECT_INSTALL");
        }
        else if ((accessRights & 8) != 0)
        {
          v15 = CFSTR("INSTALL_WARNING_APP_INSPECT_ERASE");
        }
        else
        {
          v15 = CFSTR("INSTALL_WARNING_APP_INSPECT");
        }
      }
      else
      {
        v15 = CFSTR("INSTALL_WARNING_APP_INSPECT_INSTALL_ERASE");
      }
    }
    else if (v14)
    {
      if ((accessRights & 0x82) != 0)
      {
        v15 = CFSTR("INSTALL_WARNING_INSPECT_INSTALL");
      }
      else if ((accessRights & 8) != 0)
      {
        v15 = CFSTR("INSTALL_WARNING_INSPECT_ERASE");
      }
      else
      {
        v15 = CFSTR("INSTALL_WARNING_INSPECT");
      }
    }
    else
    {
      v15 = CFSTR("INSTALL_WARNING_INSPECT_INSTALL_ERASE");
    }
    MCLocalizedStringByDevice(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }
  MCLocalizedFormatByDevice(CFSTR("INSTALL_WARNING_MDM_P_URL"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)self->_serverURLString);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v17, v16);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v17;
  }
  v20 = v19;
  MCLocalizedString(CFSTR("INSTALL_WARNING_MDM_TITLE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v21, v20, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v12)
    objc_msgSend(v23, "addObject:", v12);

  return v24;
}

- (id)subtitle1Label
{
  __CFString *v2;

  if (self->_serverURLString)
    v2 = CFSTR("MDM_URL_COLON");
  else
    v2 = CFSTR("MDM_URL_MISSING");
  MCLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)subtitle1Description
{
  return self->_serverURLString;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  NSString *serverURLString;
  void *v7;
  MCKeyValue *v8;
  MCKeyValue *v9;
  NSString *topic;
  void *v11;
  MCKeyValue *v12;
  NSNumber *pollingIntervalMinutes;
  void *v14;
  MCKeyValue *v15;
  void *v16;
  MCKeyValue *v17;
  MCKeyValue *v18;
  void *v19;
  void *v20;
  MCKeyValue *v21;
  MCKeyValue *v22;
  NSString *checkInURLString;
  void *v24;
  MCKeyValue *v25;
  MCKeyValue *v26;
  void *v27;
  void *v28;
  MCKeyValue *v29;
  MCKeyValue *v30;
  void *v31;
  void *v32;
  MCKeyValue *v33;
  MCKeyValue *v34;
  void *v35;
  void *v36;
  MCKeyValue *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  MCKeyValue *v41;
  void *v42;
  MCKeyValue *v43;
  MCKeyValue *v44;
  NSString *enrollmentID;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSString *identityUUID;
  void *v52;
  void *v53;
  void *v54;
  MCKeyValueSection *v55;
  void *v56;
  MCKeyValueSection *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  MCKeyValue *v62;
  void *v63;
  void *v64;
  MCKeyValue *v65;
  void *v66;
  MCKeyValueSection *v67;
  void *v68;
  MCKeyValueSection *v69;
  NSData *identityPersistentID;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (self->_serverURLString)
  {
    v5 = [MCKeyValue alloc];
    serverURLString = self->_serverURLString;
    MCLocalizedString(CFSTR("MDM_SERVER_URL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", serverURLString, v7);

    objc_msgSend(v4, "addObject:", v8);
  }
  if (self->_topic)
  {
    v9 = [MCKeyValue alloc];
    topic = self->_topic;
    MCLocalizedString(CFSTR("MDM_TOPIC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MCKeyValue initWithLocalizedString:localizedKey:](v9, "initWithLocalizedString:localizedKey:", topic, v11);

    objc_msgSend(v4, "addObject:", v12);
  }
  pollingIntervalMinutes = self->_pollingIntervalMinutes;
  if (pollingIntervalMinutes)
  {
    MCFormattedStringForTimeInterval((double)(60 * -[NSNumber intValue](pollingIntervalMinutes, "intValue")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("MDM_POLLING_INTERVAL_MINUTES"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MCKeyValue initWithLocalizedString:localizedKey:](v15, "initWithLocalizedString:localizedKey:", v14, v16);

    objc_msgSend(v4, "addObject:", v17);
  }
  if (self->_useDevelopmentAPNSNum)
  {
    v18 = [MCKeyValue alloc];
    MCStringForBool(-[NSNumber BOOLValue](self->_useDevelopmentAPNSNum, "BOOLValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MDM_DEV_APNS"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MCKeyValue initWithLocalizedString:localizedKey:](v18, "initWithLocalizedString:localizedKey:", v19, v20);

    objc_msgSend(v4, "addObject:", v21);
  }
  if (self->_checkInURLString)
  {
    v22 = [MCKeyValue alloc];
    checkInURLString = self->_checkInURLString;
    MCLocalizedString(CFSTR("MDM_CHECK_IN_URL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MCKeyValue initWithLocalizedString:localizedKey:](v22, "initWithLocalizedString:localizedKey:", checkInURLString, v24);

    objc_msgSend(v4, "addObject:", v25);
  }
  if (self->_signMessageNum)
  {
    v26 = [MCKeyValue alloc];
    MCStringForBool(-[NSNumber BOOLValue](self->_signMessageNum, "BOOLValue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MDM_SIGN_MESSAGE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[MCKeyValue initWithLocalizedString:localizedKey:](v26, "initWithLocalizedString:localizedKey:", v27, v28);

    objc_msgSend(v4, "addObject:", v29);
  }
  if (self->_checkOutWhenRemovedNum)
  {
    v30 = [MCKeyValue alloc];
    MCStringForBool(-[NSNumber BOOLValue](self->_checkOutWhenRemovedNum, "BOOLValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MDM_CHECK_OUT"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[MCKeyValue initWithLocalizedString:localizedKey:](v30, "initWithLocalizedString:localizedKey:", v31, v32);

    objc_msgSend(v4, "addObject:", v33);
  }
  if (self->_requiredAppIDForMDM)
  {
    v34 = [MCKeyValue alloc];
    -[NSNumber stringValue](self->_requiredAppIDForMDM, "stringValue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MDM_REQUIRED_APP_ID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[MCKeyValue initWithLocalizedString:localizedKey:](v34, "initWithLocalizedString:localizedKey:", v35, v36);

    objc_msgSend(v4, "addObject:", v37);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v38);

  }
  if (self->_personaID)
  {
    if (_os_feature_enabled_impl())
      v39 = CFSTR("MDM_MANAGED_APPLE_ACCOUNT");
    else
      v39 = CFSTR("MDM_MANAGED_APPLEID");
    MCLocalizedString(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = [MCKeyValue alloc];
    -[MCMDMPayload managedAppleIDName](self, "managedAppleIDName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[MCKeyValue initWithLocalizedString:localizedKey:](v41, "initWithLocalizedString:localizedKey:", v42, v40);

    objc_msgSend(v4, "addObject:", v43);
    if (-[NSString length](self->_enrollmentID, "length"))
    {
      v44 = [MCKeyValue alloc];
      enrollmentID = self->_enrollmentID;
      MCLocalizedString(CFSTR("MDM_ENROLLMENT_ID"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[MCKeyValue initWithLocalizedString:localizedKey:](v44, "initWithLocalizedString:localizedKey:", enrollmentID, v46);

      objc_msgSend(v4, "addObject:", v47);
      v43 = (MCKeyValue *)v47;
    }

  }
  if (!-[MCMDMPayload isUserEnrollment](self, "isUserEnrollment"))
  {
    -[MCMDMPayload localizedAccessRightDescriptions](self, "localizedAccessRightDescriptions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MDM_ACCESS_RIGHTS"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v48, v49, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v50);
  }
  identityUUID = self->_identityUUID;
  if (identityUUID)
  {
    v72[0] = self->_identityUUID;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = 0;
  }
  if (self->_identityPersistentID)
  {
    identityPersistentID = self->_identityPersistentID;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &identityPersistentID, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMDMPayload kvsForCertUUIDs:persistentRefs:labelKey:](self, "kvsForCertUUIDs:persistentRefs:labelKey:", v52, v53, CFSTR("MDM_CERTIFICATE"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!identityUUID)
      goto LABEL_34;
    goto LABEL_33;
  }
  -[MCMDMPayload kvsForCertUUIDs:persistentRefs:labelKey:](self, "kvsForCertUUIDs:persistentRefs:labelKey:", v52, 0, CFSTR("MDM_CERTIFICATE"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (identityUUID)
LABEL_33:

LABEL_34:
  if (objc_msgSend(v54, "count"))
  {
    v55 = [MCKeyValueSection alloc];
    MCLocalizedString(CFSTR("MDM_CERTIFICATE"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[MCKeyValueSection initWithSectionTitle:footer:keyValues:](v55, "initWithSectionTitle:footer:keyValues:", v56, 0, v54);

    objc_msgSend(v3, "addObject:", v57);
  }
  -[MCMDMPayload kvsForCertUUIDs:persistentRefs:labelKey:](self, "kvsForCertUUIDs:persistentRefs:labelKey:", self->_serverPinningUUIDs, self->_serverPinningPersistentRefs, CFSTR("MDM_SERVER_PINNING_CERTS"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDMPayload kvsForCertUUIDs:persistentRefs:labelKey:](self, "kvsForCertUUIDs:persistentRefs:labelKey:", self->_checkInPinningUUIDs, self->_checkInPinningPersistentRefs, CFSTR("MDM_CHECKIN_PINNING_CERTS"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v58, "count");
  v61 = objc_msgSend(v59, "count") + v60;
  if (v61)
  {
    v62 = [MCKeyValue alloc];
    MCStringForBool(self->_pinningRevocationCheckRequired);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MDM_PINNING_REVOCATION_CHECK_REQUIRED"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[MCKeyValue initWithLocalizedString:localizedKey:](v62, "initWithLocalizedString:localizedKey:", v63, v64);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v61 + 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObject:", v65);
    objc_msgSend(v66, "addObjectsFromArray:", v58);
    objc_msgSend(v66, "addObjectsFromArray:", v59);
    v67 = [MCKeyValueSection alloc];
    MCLocalizedString(CFSTR("MDM_PINNING"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = -[MCKeyValueSection initWithSectionTitle:footer:keyValues:](v67, "initWithSectionTitle:footer:keyValues:", v68, 0, v66);

    objc_msgSend(v3, "addObject:", v69);
  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (id)kvsForCertUUIDs:(id)a3 persistentRefs:(id)a4 labelKey:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  MCKeyValue *v22;
  MCKeyValue *v23;
  void *v24;
  MCKeyValue *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  MCKeyValue *v34;
  MCKeyValue *v35;
  void *v36;
  MCKeyValue *v37;
  id v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v41 = a5;
  v10 = objc_msgSend(v8, "count");
  v11 = objc_msgSend(v9, "count") + v10;
  if (v11)
  {
    v40 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v39 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v47;
      v17 = 1;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          -[MCPayload profile](self, "profile");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "subjectSummaryFromCertificatePayloadWithUUID:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v22 = [MCKeyValue alloc];
            v23 = v22;
            if ((v17 & 1) != 0)
            {
              MCLocalizedString(v41);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[MCKeyValue initWithLocalizedString:localizedKey:](v23, "initWithLocalizedString:localizedKey:", v21, v24);

            }
            else
            {
              v25 = -[MCKeyValue initWithLocalizedString:localizedKey:](v22, "initWithLocalizedString:localizedKey:", v21, &stru_1E41E70C8);
            }
            objc_msgSend(v12, "addObject:", v25);

            v17 = 0;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v15);
    }
    else
    {
      v17 = 1;
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v26 = v40;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
          -[MCPayload profile](self, "profile");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "subjectSummaryFromCertificateWithPersistentID:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            v34 = [MCKeyValue alloc];
            v35 = v34;
            if ((v17 & 1) != 0)
            {
              MCLocalizedString(v41);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = -[MCKeyValue initWithLocalizedString:localizedKey:](v35, "initWithLocalizedString:localizedKey:", v33, v36);

            }
            else
            {
              v37 = -[MCKeyValue initWithLocalizedString:localizedKey:](v34, "initWithLocalizedString:localizedKey:", v33, &stru_1E41E70C8);
            }
            objc_msgSend(v12, "addObject:", v37);

            v17 = 0;
          }

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v28);
    }

    v8 = v39;
    v9 = v40;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isUserEnrollment
{
  NSObject *v3;
  _BOOL4 isUserEnrollment;
  NSString *managedAppleID;
  NSString *enrollmentMode;
  _DWORD v8[2];
  __int16 v9;
  NSString *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    isUserEnrollment = self->_isUserEnrollment;
    managedAppleID = self->_managedAppleID;
    enrollmentMode = self->_enrollmentMode;
    v8[0] = 67109634;
    v8[1] = isUserEnrollment;
    v9 = 2112;
    v10 = managedAppleID;
    v11 = 2112;
    v12 = enrollmentMode;
    _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEBUG, "isUserEnrollment iVar: %d, _managedAppleID: %@, _enrollmentMode: %@", (uint8_t *)v8, 0x1Cu);
  }
  return self->_isUserEnrollment
      || self->_managedAppleID
      || -[NSString isEqualToString:](self->_enrollmentMode, "isEqualToString:", *MEMORY[0x1E0D44898]);
}

- (void)setIsUserEnrollment:(BOOL)a3
{
  self->_isUserEnrollment = a3;
}

- (NSString)managedAppleIDName
{
  int *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = &OBJC_IVAR___MCMDMPayload__assignedManagedAppleID;
  if (!-[NSString isEqualToString:](self->_enrollmentMode, "isEqualToString:", *MEMORY[0x1E0D44898])
    && !-[NSString isEqualToString:](self->_enrollmentMode, "isEqualToString:", *MEMORY[0x1E0D44890]))
  {
    v3 = &OBJC_IVAR___MCMDMPayload__managedAppleID;
  }
  v4 = *(id *)((char *)&self->super.super.isa + *v3);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    if (!self->_personaID)
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0D1C190], "managedAppleIDNameWithPersonaID:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_9:

  return (NSString *)v7;
}

- (BOOL)supportUserChannel
{
  return -[NSArray containsObject:](self->_serverCapabilities, "containsObject:", *MEMORY[0x1E0D44950]);
}

- (NSString)identityUUID
{
  return self->_identityUUID;
}

- (NSData)identityPersistentID
{
  return self->_identityPersistentID;
}

- (void)setIdentityPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_identityPersistentID, a3);
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)serverURLString
{
  return self->_serverURLString;
}

- (NSArray)serverPinningUUIDs
{
  return self->_serverPinningUUIDs;
}

- (NSArray)serverPinningPersistentRefs
{
  return self->_serverPinningPersistentRefs;
}

- (void)setServerPinningPersistentRefs:(id)a3
{
  objc_storeStrong((id *)&self->_serverPinningPersistentRefs, a3);
}

- (BOOL)useDevelopmentAPNS
{
  return self->_useDevelopmentAPNS;
}

- (NSString)checkInURLString
{
  return self->_checkInURLString;
}

- (NSArray)checkInPinningUUIDs
{
  return self->_checkInPinningUUIDs;
}

- (NSArray)checkInPinningPersistentRefs
{
  return self->_checkInPinningPersistentRefs;
}

- (void)setCheckInPinningPersistentRefs:(id)a3
{
  objc_storeStrong((id *)&self->_checkInPinningPersistentRefs, a3);
}

- (BOOL)pinningRevocationCheckRequired
{
  return self->_pinningRevocationCheckRequired;
}

- (unint64_t)accessRights
{
  return self->_accessRights;
}

- (BOOL)signMessage
{
  return self->_signMessage;
}

- (BOOL)checkOutWhenRemoved
{
  return self->_checkOutWhenRemoved;
}

- (NSArray)serverCapabilities
{
  return self->_serverCapabilities;
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (NSString)assignedManagedAppleID
{
  return self->_assignedManagedAppleID;
}

- (NSString)enrollmentMode
{
  return self->_enrollmentMode;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_storeStrong((id *)&self->_personaID, a3);
}

- (NSString)enrollmentID
{
  return self->_enrollmentID;
}

- (void)setEnrollmentID:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentID, a3);
}

- (NSString)iCloudEnrollmentID
{
  return self->_iCloudEnrollmentID;
}

- (void)setICloudEnrollmentID:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudEnrollmentID, a3);
}

- (NSString)easEnrollmentID
{
  return self->_easEnrollmentID;
}

- (void)setEasEnrollmentID:(id)a3
{
  objc_storeStrong((id *)&self->_easEnrollmentID, a3);
}

- (NSNumber)pollingIntervalMinutes
{
  return self->_pollingIntervalMinutes;
}

- (NSNumber)requiredAppIDForMDM
{
  return self->_requiredAppIDForMDM;
}

- (void)setRequiredAppIDForMDM:(id)a3
{
  objc_storeStrong((id *)&self->_requiredAppIDForMDM, a3);
}

- (NSNumber)useDevelopmentAPNSNum
{
  return self->_useDevelopmentAPNSNum;
}

- (NSNumber)signMessageNum
{
  return self->_signMessageNum;
}

- (NSNumber)checkOutWhenRemovedNum
{
  return self->_checkOutWhenRemovedNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkOutWhenRemovedNum, 0);
  objc_storeStrong((id *)&self->_signMessageNum, 0);
  objc_storeStrong((id *)&self->_useDevelopmentAPNSNum, 0);
  objc_storeStrong((id *)&self->_requiredAppIDForMDM, 0);
  objc_storeStrong((id *)&self->_pollingIntervalMinutes, 0);
  objc_storeStrong((id *)&self->_easEnrollmentID, 0);
  objc_storeStrong((id *)&self->_iCloudEnrollmentID, 0);
  objc_storeStrong((id *)&self->_enrollmentID, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_enrollmentMode, 0);
  objc_storeStrong((id *)&self->_assignedManagedAppleID, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_serverCapabilities, 0);
  objc_storeStrong((id *)&self->_checkInPinningPersistentRefs, 0);
  objc_storeStrong((id *)&self->_checkInPinningUUIDs, 0);
  objc_storeStrong((id *)&self->_checkInURLString, 0);
  objc_storeStrong((id *)&self->_serverPinningPersistentRefs, 0);
  objc_storeStrong((id *)&self->_serverPinningUUIDs, 0);
  objc_storeStrong((id *)&self->_serverURLString, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_identityPersistentID, 0);
  objc_storeStrong((id *)&self->_identityUUID, 0);
}

@end
