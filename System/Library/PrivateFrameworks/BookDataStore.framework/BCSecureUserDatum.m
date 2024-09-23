@implementation BCSecureUserDatum

- (id)mutableCopy
{
  BCMutableSecureUserDatum *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableSecureUserDatum alloc];
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
    objc_msgSend__configureFromUserDatum_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5CFF8();

  }
}

- (void)_configureFromUserDatum:(id)a3 withMergers:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  objc_super v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BCSecureUserDatum;
  -[BCCloudData configureFromCloudData:withMergers:](&v47, sel_configureFromCloudData_withMergers_, v6, a4);
  objc_msgSend_key(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v12, (uint64_t)v11, (uint64_t)CFSTR("key"), v13);

  objc_msgSend_value(v6, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v19, (uint64_t)v18, (uint64_t)CFSTR("value"), v20);

  objc_msgSend_shared(MEMORY[0x24BE0FC08], v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_verboseLoggingEnabled(v25, v26, v27, v28, v29);

  if (v30)
  {
    BDSCloudKitDevelopmentLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_key(self, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_key(v6, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v36;
      v50 = 2112;
      v51 = v41;
      v52 = 2112;
      v53 = v46;
      _os_log_impl(&dword_227D4F000, v31, OS_LOG_TYPE_DEFAULT, "\"\\\"BCSecureUserDatum configured: %@ %@ from userDatum:%@\\\"\", buf, 0x20u);

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
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char isEqualToString;
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
  objc_super v35;

  v4 = a4;
  BUProtocolCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)BCSecureUserDatum;
  LOBYTE(v4) = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v35, sel_isEqualExceptForDate_ignoringEmptySalt_, v6, v4);
  objc_msgSend_key(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_key(v6, v12, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v11, v17, v16, v18, v19);

  objc_msgSend_value(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(v6, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend_isEqualToString_(v25, v31, (uint64_t)v30, v32, v33);

  return v4 & isEqualToString & v16;
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
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int hasChanges;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  NSObject *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
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
  uint64_t v140;
  __CFString *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  objc_super v162;
  uint8_t buf[4];
  void *v164;
  __int16 v165;
  void *v166;
  __int16 v167;
  const __CFString *v168;
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v162.receiver = self;
  v162.super_class = (Class)BCSecureUserDatum;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v162, sel_resolveConflictsFromRecord_withResolvers_, v6, a4);
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_key(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v10, v17, v18);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_227E5D0B8(self, v10, v24, v25, v26);

      objc_msgSend_setKey_(self, v27, (uint64_t)v10, v28, v29);
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
          objc_msgSend_key(self, v55, v56, v57, v58);
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
          v164 = v59;
          if (v80 == v91)
            v90 = CFSTR("the same");
          v165 = 2112;
          v166 = v69;
          v167 = 2114;
          v168 = v90;
          _os_log_impl(&dword_227D4F000, v54, OS_LOG_TYPE_INFO, "BCSecureUserDatum %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);

        }
        objc_msgSend_incrementEditGeneration(self, v92, v93, v94, v95);
        goto LABEL_25;
      }
    }
    objc_msgSend_objectForKey_(v6, v31, (uint64_t)CFSTR("value"), v33, v34);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentString_forKey_(self, v97, (uint64_t)v96, (uint64_t)CFSTR("value"), v98);
    objc_msgSend_modificationDate(v6, v99, v100, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentDate_forKey_(self, v104, (uint64_t)v103, (uint64_t)CFSTR("modificationDate"), v105);
    hasChanges = objc_msgSend_hasChanges(self, v106, v107, v108, v109);
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v111, v112, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend_verboseLoggingEnabled(v115, v116, v117, v118, v119);

    if (hasChanges)
    {
      if (v120)
      {
        BDSCloudKitDevelopmentLog();
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_key(self, v122, v123, v124, v125);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v127, v128, v129, v130);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v131, v132, v133, v134, v135);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_debugDescription(self, v137, v138, v139, v140);
          v141 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v164 = v126;
          v165 = 2112;
          v166 = v136;
          v167 = 2112;
          v168 = v141;
          v142 = "\"\\\"BCSecureUserDatum %@ Resolving: Adopted properties from record: %@ %@\\\"\";
LABEL_22:
          _os_log_impl(&dword_227D4F000, v121, OS_LOG_TYPE_DEFAULT, v142, buf, 0x20u);

          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if (v120)
    {
      BDSCloudKitDevelopmentLog();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_key(self, v146, v147, v148, v149);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v150, v151, v152, v153);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v131, v154, v155, v156, v157);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_debugDescription(self, v158, v159, v160, v161);
        v141 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v164 = v126;
        v165 = 2112;
        v166 = v136;
        v167 = 2112;
        v168 = v141;
        v142 = "\"\\\"BCSecureUserDatum %@ Resolving: Identical properties from record: %@ %@\\\"\";
        goto LABEL_22;
      }
LABEL_23:

    }
    goto LABEL_25;
  }
  BDSCloudKitLog();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    sub_227E5D024(self, v10, v143, v144, v145);
LABEL_25:

}

- (id)recordType
{
  return CFSTR("SecureUserData");
}

+ (id)propertyIDKey
{
  return CFSTR("key");
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_key(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("key: %@, value: %@"), v14, v15, v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

@end
