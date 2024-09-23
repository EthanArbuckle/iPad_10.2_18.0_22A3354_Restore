@implementation BCReadingNowDetail

- (id)mutableCopy
{
  BCMutableReadingNowDetail *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableReadingNowDetail alloc];
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
    objc_msgSend__configureFromReadingNowDetail_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5DF7C();

  }
}

- (void)_configureFromReadingNowDetail:(id)a3 withMergers:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t isTrackedAsRecent;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];
  objc_super v48;

  v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BCReadingNowDetail;
  v7 = a4;
  -[BCCloudData configureFromCloudData:withMergers:](&v48, sel_configureFromCloudData_withMergers_, v6, v7);
  objc_msgSend_assetID(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v13, (uint64_t)v12, (uint64_t)CFSTR("assetID"), v14);

  v15 = (void *)MEMORY[0x24BDD16E0];
  isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(v6, v16, v17, v18, v19);
  objc_msgSend_numberWithBool_(v15, v21, isTrackedAsRecent, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v25, (uint64_t)v24, (uint64_t)CFSTR("isTrackedAsRecent"), v26);

  objc_msgSend_lastEngagedDate(v6, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentDate_forKey_(self, v32, (uint64_t)v31, (uint64_t)CFSTR("lastEngagedDate"), v33);

  objc_msgSend_cloudAssetType(v6, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v39, (uint64_t)v38, (uint64_t)CFSTR("cloudAssetType"), v40);

  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = sub_227DB8994;
  v47[3] = &unk_24F08B8C8;
  v47[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v41, (uint64_t)v47, v42, v43);

  BDSCloudKitLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    sub_227E5DFA8(self, (char *)v6, v44, v45, v46);

}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  void *v4;
  _BOOL8 v5;
  id v7;
  void *v8;
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
  int isEqualToString;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int isTrackedAsRecent;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  int isEqualToDate;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  NSObject *v73;
  unsigned int v75;
  objc_super v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  BCReadingNowDetail *v80;
  __int16 v81;
  int v82;
  uint64_t v83;

  v5 = a4;
  v83 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  BUProtocolCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v76.receiver = self;
  v76.super_class = (Class)BCReadingNowDetail;
  v75 = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v76, sel_isEqualExceptForDate_ignoringEmptySalt_, v7, v5);

  objc_msgSend_assetID(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetID(v8, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v19, (uint64_t)v18, v20, v21);

  isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v23, v24, v25, v26);
  v32 = objc_msgSend_isTrackedAsRecent(v8, v28, v29, v30, v31);
  objc_msgSend_lastEngagedDate(self, v33, v34, v35, v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend_lastEngagedDate(v8, v37, v38, v39, v40);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      isEqualToDate = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend_lastEngagedDate(self, v37, v38, v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastEngagedDate(v8, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToDate = objc_msgSend_isEqualToDate_(v42, v48, (uint64_t)v47, v49, v50);

  if (!v41)
    goto LABEL_6;
LABEL_7:
  v52 = isTrackedAsRecent ^ v32;

  objc_msgSend_cloudAssetType(self, v53, v54, v55, v56);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61 || (objc_msgSend_cloudAssetType(v8, v57, v58, v59, v60), (v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_cloudAssetType(self, v57, v58, v59, v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloudAssetType(v8, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_isEqualToString_(v62, v68, (uint64_t)v67, v69, v70);

    if (v61)
      goto LABEL_13;
  }
  else
  {
    v71 = 1;
  }

LABEL_13:
  v72 = v75 & isEqualToString & ~v52 & isEqualToDate & v71;
  BDSCloudKitLog();
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v78 = v8;
    v79 = 2112;
    v80 = self;
    v81 = 1024;
    v82 = v72;
    _os_log_debug_impl(&dword_227D4F000, v73, OS_LOG_TYPE_DEBUG, "BCReadingNowDetail compare %@ to self:%@ SAME:%{BOOL}d", buf, 0x1Cu);
  }

  return v72;
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
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
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
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
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
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  int hasChanges;
  NSObject *v126;
  NSObject *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  __CFString *v147;
  uint64_t v148;
  uint64_t v149;
  objc_super v150;
  uint8_t buf[4];
  void *v152;
  __int16 v153;
  void *v154;
  __int16 v155;
  const __CFString *v156;
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v150.receiver = self;
  v150.super_class = (Class)BCReadingNowDetail;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v150, sel_resolveConflictsFromRecord_withResolvers_, v6, a4);
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetID(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v10, v17, v18);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_227E5E2A4(self, v10, v23, v24, v25);

      objc_msgSend_setAssetID_(self, v26, (uint64_t)v10, v27, v28);
    }
    objc_msgSend_objectForKey_(v6, v20, (uint64_t)CFSTR("lastEngagedDate"), v21, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modificationDate(self, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {

    }
    else
    {
      objc_msgSend_lastEngagedDate(self, v35, v36, v37, v38);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (v101)
      {
        if (!v29)
          goto LABEL_9;
        objc_msgSend_lastEngagedDate(self, v39, v40, v41, v42);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend_compare_(v102, v103, (uint64_t)v29, v104, v105);

        if (v106 == 1)
          goto LABEL_9;
        goto LABEL_19;
      }
    }
    objc_msgSend_modificationDate(self, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modificationDate(v6, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_compare_(v43, v49, (uint64_t)v48, v50, v51);

    if (v52 == 1)
    {
LABEL_9:
      BDSCloudKitLog();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_assetID(self, v57, v58, v59, v60);
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
        v152 = v61;
        if (v82 == v93)
          v92 = CFSTR("the same");
        v153 = 2112;
        v154 = v71;
        v155 = 2114;
        v156 = v92;
        _os_log_impl(&dword_227D4F000, v56, OS_LOG_TYPE_INFO, "BCReadingNowDetail %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);

      }
      objc_msgSend_incrementEditGeneration(self, v94, v95, v96, v97);
LABEL_29:

      goto LABEL_30;
    }
LABEL_19:
    objc_msgSend_objectForKey_(v6, v53, (uint64_t)CFSTR("isTrackedAsRecent"), v54, v55);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentNumber_forKey_(self, v108, (uint64_t)v107, (uint64_t)CFSTR("isTrackedAsRecent"), v109);
    objc_msgSend_setDifferentDate_forKey_(self, v110, (uint64_t)v29, (uint64_t)CFSTR("lastEngagedDate"), v111);
    objc_msgSend_objectForKey_(v6, v112, (uint64_t)CFSTR("cloudAssetType"), v113, v114);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      BDSCloudKitLog();
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
        sub_227E5E1DC(self, (char *)v6, v120, v121, v122);

      objc_msgSend_setDifferentString_forKey_(self, v123, (uint64_t)v119, (uint64_t)CFSTR("cloudAssetType"), v124);
    }
    hasChanges = objc_msgSend_hasChanges(self, v115, v116, v117, v118);
    BDSCloudKitLog();
    v126 = objc_claimAutoreleasedReturnValue();
    v127 = v126;
    if (hasChanges)
    {
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_assetID(self, v128, v129, v130, v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v133, v134, v135, v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v137, v138, v139, v140, v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_debugDescription(self, v143, v144, v145, v146);
        v147 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v152 = v132;
        v153 = 2112;
        v154 = v142;
        v155 = 2112;
        v156 = v147;
        _os_log_impl(&dword_227D4F000, v127, OS_LOG_TYPE_INFO, "BCReadingNowDetail %@ Resolving: Adopted properties from record: %@ %@", buf, 0x20u);

      }
    }
    else if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
    {
      sub_227E5E114(self, (char *)v6, v127, v148, v149);
    }

    goto LABEL_29;
  }
  BDSCloudKitLog();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    sub_227E5E080(self, v10, v98, v99, v100);
LABEL_30:

}

- (id)recordType
{
  return CFSTR("readingNowDetail");
}

+ (id)propertyIDKey
{
  return CFSTR("assetID");
}

- (id)zoneName
{
  return CFSTR("AssetZone");
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
  const __CFString *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_assetID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isTrackedAsRecent(self, v8, v9, v10, v11))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend_lastEngagedDate(self, v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudAssetType(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v23, (uint64_t)CFSTR("assetID: %@, isTrackedAsRecent: %@, lastEngagedDate: %@ , cloudAssetType:%@"), v24, v25, v7, v16, v17, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

@end
