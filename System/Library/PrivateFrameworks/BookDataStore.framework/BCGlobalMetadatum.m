@implementation BCGlobalMetadatum

- (id)mutableCopy
{
  BCMutableGlobalMetadatum *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableGlobalMetadatum alloc];
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
    objc_msgSend__configureFromMetadatum_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5E79C();

  }
}

- (void)_configureFromMetadatum:(id)a3 withMergers:(id)a4
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
  v47.super_class = (Class)BCGlobalMetadatum;
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
      _os_log_impl(&dword_227D4F000, v31, OS_LOG_TYPE_DEFAULT, "\"\\\"BCGlobalMetadatum configured: %@ %@ from metadatum:%@\\\"\", buf, 0x20u);

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
  v35.super_class = (Class)BCGlobalMetadatum;
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
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
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
  double v80;
  double v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const __CFString *v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int hasChanges;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  void *v138;
  NSObject *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  __CFString *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  objc_super v183;
  uint8_t buf[4];
  void *v185;
  __int16 v186;
  void *v187;
  __int16 v188;
  const __CFString *v189;
  uint64_t v190;

  v190 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v183.receiver = self;
  v183.super_class = (Class)BCGlobalMetadatum;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v183, sel_resolveConflictsFromRecord_withResolvers_, v6, v7);
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v8, (uint64_t)v6, v9, v10);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_key(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v11, v18, v19);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_227E5E85C(self, v11, v25, v26, v27);

      objc_msgSend_setKey_(self, v28, (uint64_t)v11, v29, v30);
    }
    objc_msgSend_modificationDate(self, v21, v22, v23, v24);
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v36 = (void *)v31;
      objc_msgSend_modificationDate(self, v32, v33, v34, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v37, v38, v39, v40, v41);
      v43 = v42;
      objc_msgSend_modificationDate(v6, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v48, v49, v50, v51, v52);
      v54 = v53;

      if (v43 > v54)
      {
        BDSCloudKitLog();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_key(self, v56, v57, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v61, v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v65, v66, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_modificationDate(self, v71, v72, v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v75, v76, v77, v78, v79);
          v81 = v80;
          objc_msgSend_modificationDate(v6, v82, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v86, v87, v88, v89, v90);
          v91 = CFSTR("newer");
          *(_DWORD *)buf = 138412802;
          v185 = v60;
          if (v81 == v92)
            v91 = CFSTR("the same");
          v186 = 2112;
          v187 = v70;
          v188 = 2114;
          v189 = v91;
          _os_log_impl(&dword_227D4F000, v55, OS_LOG_TYPE_INFO, "BCGlobalMetadatum %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);

        }
        objc_msgSend_incrementEditGeneration(self, v93, v94, v95, v96);
        goto LABEL_27;
      }
    }
    objc_msgSend_objectForKey_(v6, v32, (uint64_t)CFSTR("value"), v34, v35);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_value(self, v98, v99, v100, v101);
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = v97;
    objc_msgSend_key(self, v104, v105, v106, v107);
    v108 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v109, v108, v110, v111);
    v112 = objc_claimAutoreleasedReturnValue();
    v115 = (void *)v112;
    v116 = v103;
    if (v112)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v112 + 16))(v112, v108, v102, v103);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v181 = (void *)v108;
    v182 = (void *)v102;
    objc_msgSend_setDifferentString_forKey_(self, v113, (uint64_t)v116, (uint64_t)CFSTR("value"), v114);
    objc_msgSend_modificationDate(v6, v117, v118, v119, v120);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentDate_forKey_(self, v121, (uint64_t)v180, (uint64_t)CFSTR("modificationDate"), v122);
    hasChanges = objc_msgSend_hasChanges(self, v123, v124, v125, v126);
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v128, v129, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend_verboseLoggingEnabled(v132, v133, v134, v135, v136);

    if (hasChanges)
    {
      v138 = v182;
      if (v137)
      {
        BDSCloudKitDevelopmentLog();
        v139 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_key(self, v140, v141, v142, v143);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v144, v145, v146, v147);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v179, v148, v149, v150, v151);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_debugDescription(self, v153, v154, v155, v156);
          v157 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v185 = v178;
          v186 = 2112;
          v187 = v152;
          v188 = 2112;
          v189 = v157;
          v158 = "\"\\\"BCGlobalMetadatum %@ Resolving: Adopted properties from record: %@ %@\\\"\";
LABEL_24:
          _os_log_impl(&dword_227D4F000, v139, OS_LOG_TYPE_DEFAULT, v158, buf, 0x20u);

          v138 = v182;
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else
    {
      v138 = v182;
      if (v137)
      {
        BDSCloudKitDevelopmentLog();
        v139 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_key(self, v162, v163, v164, v165);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v166, v167, v168, v169);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v179, v170, v171, v172, v173);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_debugDescription(self, v174, v175, v176, v177);
          v157 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v185 = v178;
          v186 = 2112;
          v187 = v152;
          v188 = 2112;
          v189 = v157;
          v158 = "\"\\\"BCGlobalMetadatum %@ Resolving: Identical properties from record: %@ %@\\\"\";
          goto LABEL_24;
        }
LABEL_25:

      }
    }

    goto LABEL_27;
  }
  BDSCloudKitLog();
  v11 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    sub_227E5E7C8(self, v11, v159, v160, v161);
LABEL_27:

}

- (id)recordType
{
  return CFSTR("globalMetadata");
}

+ (id)propertyIDKey
{
  return CFSTR("key");
}

- (id)zoneName
{
  return CFSTR("GlobalMetadata");
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
