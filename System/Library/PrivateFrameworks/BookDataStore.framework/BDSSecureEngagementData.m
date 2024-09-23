@implementation BDSSecureEngagementData

- (id)mutableCopy
{
  BDSMutableSecureEngagementData *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BDSMutableSecureEngagementData alloc];
  return (id)MEMORY[0x24BEDD108](v3, sel_initWithCloudData_, self, v4, v5);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a4;
  BUProtocolCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend__configureFromEngagementData_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5AB8C();

  }
}

- (void)_configureFromEngagementData:(id)a3 withMergers:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
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
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
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
  uint64_t v70;
  void *v71;
  objc_super v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v72.receiver = self;
  v72.super_class = (Class)BDSSecureEngagementData;
  -[BCCloudData configureFromCloudData:withMergers:](&v72, sel_configureFromCloudData_withMergers_, v6, a4);
  objc_msgSend_startTimestampString(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v12, (uint64_t)v11, (uint64_t)CFSTR("startTimestampString"), v13);

  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_durationInterval(v6, v15, v16, v17, v18);
  objc_msgSend_numberWithDouble_(v14, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v24, (uint64_t)v23, (uint64_t)CFSTR("durationInterval"), v25);

  objc_msgSend_value(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(v6, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergedTimeSliceDataLocal_remote_(BDSSecureEngagementDataHelper, v36, (uint64_t)v30, (uint64_t)v35, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
    objc_msgSend_setDifferentObject_forKey_(self, v39, (uint64_t)v38, (uint64_t)CFSTR("value"), v42);
  objc_msgSend_value(v6, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentObject_forKey_(self, v44, (uint64_t)v43, (uint64_t)CFSTR("value"), v45);

  objc_msgSend_shared(MEMORY[0x24BE0FC08], v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_verboseLoggingEnabled(v50, v51, v52, v53, v54);

  if (v55)
  {
    BDSCloudKitDevelopmentLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_startTimestampString(self, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v62, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_startTimestampString(v6, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v74 = v61;
      v75 = 2112;
      v76 = v66;
      v77 = 2112;
      v78 = v71;
      _os_log_impl(&dword_227D4F000, v56, OS_LOG_TYPE_DEFAULT, "\"\\\"BDSSecureEngagementData configured: %@ %@ from engagementData:%@\\\"\", buf, 0x20u);

    }
  }

}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char isEqualToString;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
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
  char isEqual;
  BOOL v47;
  BOOL v48;
  objc_super v50;

  v4 = a4;
  BUProtocolCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50.receiver = self;
  v50.super_class = (Class)BDSSecureEngagementData;
  LOBYTE(v4) = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v50, sel_isEqualExceptForDate_ignoringEmptySalt_, v6, v4);
  objc_msgSend_startTimestampString(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTimestampString(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v11, v17, (uint64_t)v16, v18, v19);

  objc_msgSend_durationInterval(self, v21, v22, v23, v24);
  v26 = v25;
  objc_msgSend_durationInterval(v6, v27, v28, v29, v30);
  v32 = v31;
  objc_msgSend_value(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(v6, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v37, v43, (uint64_t)v42, v44, v45);

  v47 = v4 & isEqualToString;
  if (v26 != v32)
    v47 = 0;
  v48 = v47 & isEqual;

  return v48;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char isEqualToString;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
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
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const __CFString *v90;
  double v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int hasChanges;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  NSObject *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  __CFString *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  objc_super v174;
  uint8_t buf[4];
  void *v176;
  __int16 v177;
  void *v178;
  __int16 v179;
  const __CFString *v180;
  uint64_t v181;

  v181 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v174.receiver = self;
  v174.super_class = (Class)BDSSecureEngagementData;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v174, sel_resolveConflictsFromRecord_withResolvers_, v6, a4);
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimestampString(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v10, v17, v18);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_227E5AC4C(self, v10, v24, v25, v26);

      objc_msgSend_setStartTimestampString_(self, v27, (uint64_t)v10, v28, v29);
    }
    objc_msgSend_modificationDate(self, v20, v21, v22, v23);
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v35 = (void *)v30;
      objc_msgSend_modificationDate(self, v31, v32, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v36, v37, v38, v39, v40);
      v42 = v41;
      objc_msgSend_modificationDate(v6, v43, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v47, v48, v49, v50, v51);
      v53 = v52;

      if (v42 > v53)
      {
        BDSCloudKitLog();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_startTimestampString(self, v55, v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v60, v61, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v64, v65, v66, v67, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_modificationDate(self, v70, v71, v72, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v74, v75, v76, v77, v78);
          v80 = v79;
          objc_msgSend_modificationDate(v6, v81, v82, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v85, v86, v87, v88, v89);
          v90 = CFSTR("newer");
          *(_DWORD *)buf = 138412802;
          v176 = v59;
          if (v80 == v91)
            v90 = CFSTR("the same");
          v177 = 2112;
          v178 = v69;
          v179 = 2114;
          v180 = v90;
          _os_log_impl(&dword_227D4F000, v54, OS_LOG_TYPE_INFO, "BDSSecureEngagementData %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);

        }
        objc_msgSend_incrementEditGeneration(self, v92, v93, v94, v95);
        goto LABEL_27;
      }
    }
    objc_msgSend_objectForKey_(v6, v31, (uint64_t)CFSTR("durationInterval"), v33, v34);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentNumber_forKey_(self, v97, (uint64_t)v96, (uint64_t)CFSTR("durationInterval"), v98);
    objc_msgSend_objectForKey_(v6, v99, (uint64_t)CFSTR("value"), v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_value(self, v103, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergedTimeSliceDataLocal_remote_(BDSSecureEngagementDataHelper, v108, (uint64_t)v107, (uint64_t)v102, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v110)
      objc_msgSend_setDifferentObject_forKey_(self, v111, (uint64_t)v110, (uint64_t)CFSTR("value"), v114);
    objc_msgSend_modificationDate(v6, v111, v112, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentDate_forKey_(self, v116, (uint64_t)v115, (uint64_t)CFSTR("modificationDate"), v117);
    hasChanges = objc_msgSend_hasChanges(self, v118, v119, v120, v121);
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v123, v124, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend_verboseLoggingEnabled(v127, v128, v129, v130, v131);

    if (hasChanges)
    {
      if (v132)
      {
        BDSCloudKitDevelopmentLog();
        v133 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_startTimestampString(self, v134, v135, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v139, v140, v141, v142);
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v173, v143, v144, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_debugDescription(self, v148, v149, v150, v151);
          v152 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v176 = v138;
          v177 = 2112;
          v178 = v147;
          v179 = 2112;
          v180 = v152;
          v153 = "\"\\\"BDSSecureEngagementData %@ Resolving: Adopted properties from record: %@ %@\\\"\";
LABEL_24:
          _os_log_impl(&dword_227D4F000, v133, OS_LOG_TYPE_DEFAULT, v153, buf, 0x20u);

          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else if (v132)
    {
      BDSCloudKitDevelopmentLog();
      v133 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_startTimestampString(self, v157, v158, v159, v160);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v161, v162, v163, v164);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v173, v165, v166, v167, v168);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_debugDescription(self, v169, v170, v171, v172);
        v152 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v176 = v138;
        v177 = 2112;
        v178 = v147;
        v179 = 2112;
        v180 = v152;
        v153 = "\"\\\"BDSSecureEngagementData %@ Resolving: Identical properties from record: %@ %@\\\"\";
        goto LABEL_24;
      }
LABEL_25:

    }
    goto LABEL_27;
  }
  BDSCloudKitLog();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    sub_227E5ABB8(self, v10, v154, v155, v156);
LABEL_27:

}

- (id)recordType
{
  return CFSTR("SecureEngagement");
}

+ (id)propertyIDKey
{
  return CFSTR("startTimestampString");
}

- (id)zoneName
{
  return CFSTR("SecureUserDataZone");
}

- (NSString)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_startTimestampString(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_durationInterval(self, v8, v9, v10, v11);
  objc_msgSend_stringWithFormat_(v6, v12, (uint64_t)CFSTR("start timestamp: %@, duration: %.1lf"), v13, v14, v7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

@end
