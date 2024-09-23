@implementation BCCollectionMember

- (id)mutableCopy
{
  BCMutableCollectionMember *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableCollectionMember alloc];
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
    objc_msgSend__configureFromCollectionMember_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5E3F8();

  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char isEqualToString;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  objc_super v34;

  v4 = a4;
  v6 = a3;
  BUProtocolCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34.receiver = self;
  v34.super_class = (Class)BCCollectionMember;
  v8 = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v34, sel_isEqualExceptForDate_ignoringEmptySalt_, v6, v4);

  objc_msgSend_collectionMemberID(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionMemberID(v7, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v19, (uint64_t)v18, v20, v21);

  LODWORD(self) = objc_msgSend_sortOrder(self, v23, v24, v25, v26);
  if ((_DWORD)self == objc_msgSend_sortOrder(v7, v27, v28, v29, v30))
    v31 = isEqualToString;
  else
    v31 = 0;
  if (v8)
    v32 = v31;
  else
    v32 = 0;

  return v32;
}

- (void)_configureFromCollectionMember:(id)a3 withMergers:(id)a4
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
  int v19;
  const char *v20;
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
  int v35;
  NSObject *v36;
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
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)BCCollectionMember;
  -[BCCloudData configureFromCloudData:withMergers:](&v52, sel_configureFromCloudData_withMergers_, v6, a4);
  objc_msgSend_collectionMemberID(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v12, (uint64_t)v11, (uint64_t)CFSTR("collectionMemberID"), v13);

  v14 = (void *)MEMORY[0x24BDD16E0];
  v19 = objc_msgSend_sortOrder(v6, v15, v16, v17, v18);
  objc_msgSend_numberWithInteger_(v14, v20, v19, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v24, (uint64_t)v23, (uint64_t)CFSTR("sortOrder"), v25);

  objc_msgSend_shared(MEMORY[0x24BE0FC08], v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_verboseLoggingEnabled(v30, v31, v32, v33, v34);

  if (v35)
  {
    BDSCloudKitDevelopmentLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_collectionMemberID(self, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_collectionMemberID(v6, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v54 = v41;
      v55 = 2112;
      v56 = v46;
      v57 = 2112;
      v58 = v51;
      _os_log_impl(&dword_227D4F000, v36, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCollectionMember configured: %@ %@ from collectionMember:%@\\\"\", buf, 0x20u);

    }
  }

}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char isEqualToString;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
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
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const __CFString *v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int hasChanges;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  NSObject *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  __CFString *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  objc_super v161;
  uint8_t buf[4];
  void *v163;
  __int16 v164;
  void *v165;
  __int16 v166;
  const __CFString *v167;
  uint64_t v168;

  v168 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10 = a4;
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9);
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend_collectionMemberID(self, v11, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v15, v18, v19);

      if ((isEqualToString & 1) == 0)
      {
        BDSCloudKitLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_227E5E450(self, v15, v21, v22, v23);

        objc_msgSend_setCollectionMemberID_(self, v24, (uint64_t)v15, v25, v26);
      }
    }
    else
    {
      BDSCloudKitLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_227E5E424();

    }
    v161.receiver = self;
    v161.super_class = (Class)BCCollectionMember;
    -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v161, sel_resolveConflictsFromRecord_withResolvers_, v6, v10);
    objc_msgSend_modificationDate(self, v28, v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v37 = (void *)v32;
      objc_msgSend_modificationDate(self, v33, v34, v35, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v38, v39, v40, v41, v42);
      v44 = v43;
      objc_msgSend_modificationDate(v6, v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v49, v50, v51, v52, v53);
      v55 = v54;

      if (v44 > v55)
      {
        BDSCloudKitLog();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_collectionMemberID(self, v57, v58, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v62, v63, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v66, v67, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_modificationDate(self, v72, v73, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v76, v77, v78, v79, v80);
          v82 = v81;
          objc_msgSend_modificationDate(v6, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v87, v88, v89, v90, v91);
          v92 = CFSTR("newer");
          *(_DWORD *)buf = 138412802;
          v163 = v61;
          v164 = 2114;
          if (v82 == v93)
            v92 = CFSTR("the same");
          v165 = v71;
          v166 = 2114;
          v167 = v92;
          _os_log_impl(&dword_227D4F000, v56, OS_LOG_TYPE_INFO, "BCCollectionMember %@ Resolving conflicts from record %{public}@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);

        }
        objc_msgSend_incrementEditGeneration(self, v94, v95, v96, v97);
        goto LABEL_27;
      }
    }
    objc_msgSend_objectForKey_(v6, v33, (uint64_t)CFSTR("sortOrder"), v35, v36);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentNumber_forKey_(self, v99, (uint64_t)v98, (uint64_t)CFSTR("sortOrder"), v100);
    objc_msgSend_modificationDate(v6, v101, v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentDate_forKey_(self, v106, (uint64_t)v105, (uint64_t)CFSTR("modificationDate"), v107);
    hasChanges = objc_msgSend_hasChanges(self, v108, v109, v110, v111);
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v113, v114, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend_verboseLoggingEnabled(v117, v118, v119, v120, v121);

    if (hasChanges)
    {
      if (v122)
      {
        BDSCloudKitDevelopmentLog();
        v123 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_collectionMemberID(self, v124, v125, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v129, v130, v131, v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v133, v134, v135, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_debugDescription(self, v139, v140, v141, v142);
          v143 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v163 = v128;
          v164 = 2112;
          v165 = v138;
          v166 = 2112;
          v167 = v143;
          v144 = "\"\\\"BCCollectionMember %@ Resolving: Adopted properties from record: %@ %@\\\"\";
LABEL_24:
          _os_log_impl(&dword_227D4F000, v123, OS_LOG_TYPE_DEFAULT, v144, buf, 0x20u);

          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else if (v122)
    {
      BDSCloudKitDevelopmentLog();
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_collectionMemberID(self, v145, v146, v147, v148);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v149, v150, v151, v152);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v133, v153, v154, v155, v156);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_debugDescription(self, v157, v158, v159, v160);
        v143 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v163 = v128;
        v164 = 2112;
        v165 = v138;
        v166 = 2112;
        v167 = v143;
        v144 = "\"\\\"BCCollectionMember %@ Resolving: Identical properties from record: %@ %@\\\"\";
        goto LABEL_24;
      }
LABEL_25:

    }
LABEL_27:

  }
}

- (id)recordType
{
  return CFSTR("collectionMember");
}

+ (id)propertyIDKey
{
  return CFSTR("collectionMemberID");
}

- (id)zoneName
{
  return CFSTR("CollectionZone");
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
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
  void *v24;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionMemberID(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_sortOrder(self, v11, v12, v13, v14);
  objc_msgSend_modificationDate(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v21, (uint64_t)CFSTR("<%@: %p> collectionMemberID: %@, sortOrder:%d modificationDate:%@"), v22, v23, v5, self, v10, v15, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

+ (id)collectionMemberIDWithCollectionID:(id)a3 assetID:(id)a4
{
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@|%@"), (uint64_t)a4, v4, a3, a4);
}

+ (id)assetIDFromCollectionMemberID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v7 = objc_msgSend_rangeOfString_(v3, v4, (uint64_t)CFSTR("|"), v5, v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_substringFromIndex_(v3, v8, (uint64_t)&v8[v7], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)collectionIDFromCollectionMemberID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v7 = objc_msgSend_rangeOfString_(v3, v4, (uint64_t)CFSTR("|"), v5, v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_substringToIndex_(v3, v8, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
