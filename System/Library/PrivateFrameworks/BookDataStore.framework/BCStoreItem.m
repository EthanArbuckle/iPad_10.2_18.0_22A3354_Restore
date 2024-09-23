@implementation BCStoreItem

- (id)mutableCopy
{
  BCMutableStoreItem *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableStoreItem alloc];
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
    objc_msgSend__configureFromStoreItem_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5AD7C();

  }
}

- (void)_configureFromStoreItem:(id)a3 withMergers:(id)a4
{
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
  int v16;
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
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BCStoreItem;
  -[BCCloudData configureFromCloudData:withMergers:](&v35, sel_configureFromCloudData_withMergers_, v6, a4);
  objc_msgSend_shared(MEMORY[0x24BE0FC08], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_verboseLoggingEnabled(v11, v12, v13, v14, v15);

  if (v16)
  {
    BDSCloudKitDevelopmentLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_storeID(self, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_storeID(v6, v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v26;
      v38 = 2112;
      v39 = v31;
      _os_log_impl(&dword_227D4F000, v21, OS_LOG_TYPE_DEFAULT, "\"\\\"Configuring storeItem:%@ from storeItem:%@\\\"\", buf, 0x16u);

    }
  }
  objc_msgSend_storeID(v6, v17, v18, v19, v20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v33, (uint64_t)v32, (uint64_t)CFSTR("storeID"), v34);

}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char isEqualToString;
  objc_super v23;

  v4 = a4;
  v6 = a3;
  BUProtocolCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)BCStoreItem;
  LOBYTE(v4) = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v23, sel_isEqualExceptForDate_ignoringEmptySalt_, v6, v4);

  objc_msgSend_storeID(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_storeID(v7, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v12, v18, (uint64_t)v17, v19, v20);

  return v4 & isEqualToString;
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
  uint64_t v99;
  uint64_t v100;
  int v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
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
  uint64_t v120;
  void *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  objc_super v135;
  uint8_t buf[4];
  void *v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  const __CFString *v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v135.receiver = self;
  v135.super_class = (Class)BCStoreItem;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v135, sel_resolveConflictsFromRecord_withResolvers_, v6, a4);
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_storeID(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v10, v17, v18);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_227E5AE3C(self, v10, v24, v25, v26);

      objc_msgSend_setStoreID_(self, v27, (uint64_t)v10, v28, v29);
    }
    objc_msgSend_modificationDate(self, v20, v21, v22, v23);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
      goto LABEL_13;
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
        objc_msgSend_storeID(self, v55, v56, v57, v58);
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
        v137 = v59;
        if (v80 == v91)
          v90 = CFSTR("the same");
        v138 = 2112;
        v139 = v69;
        v140 = 2114;
        v141 = v90;
        _os_log_impl(&dword_227D4F000, v54, OS_LOG_TYPE_INFO, "BCStoreItem %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);

      }
      objc_msgSend_incrementEditGeneration(self, v92, v93, v94, v95);
    }
    else
    {
LABEL_13:
      objc_msgSend_shared(MEMORY[0x24BE0FC08], v31, v32, v33, v34);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_msgSend_verboseLoggingEnabled(v96, v97, v98, v99, v100);

      if (v101)
      {
        BDSCloudKitDevelopmentLog();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_storeID(self, v107, v108, v109, v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v112, v113, v114, v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v116, v117, v118, v119, v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v137 = v111;
          v138 = 2114;
          v139 = v121;
          _os_log_impl(&dword_227D4F000, v106, OS_LOG_TYPE_DEFAULT, "\"\\\"BCStoreItem %@ Resolving conflicts from record %{public}@\\\"\", buf, 0x16u);

        }
      }
      objc_msgSend_storeID(self, v102, v103, v104, v105);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v123, (uint64_t)v122, (uint64_t)CFSTR("storeID"), v124);

      objc_msgSend_modificationDate(v6, v125, v126, v127, v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentDate_forKey_(self, v130, (uint64_t)v129, (uint64_t)CFSTR("modificationDate"), v131);

    }
  }
  else
  {
    BDSCloudKitLog();
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      sub_227E5ADA8(self, v10, v132, v133, v134);
  }

}

- (id)recordType
{
  return CFSTR("storeItem");
}

+ (id)propertyIDKey
{
  return CFSTR("storeID");
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
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_storeID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("storeID: %@, "), v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

@end
