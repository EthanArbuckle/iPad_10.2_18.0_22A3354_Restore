@implementation BCCollectionDetail

- (id)mutableCopy
{
  BCMutableCollectionDetail *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableCollectionDetail alloc];
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
    objc_msgSend__configureFromCollectionDetail_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5A2E8();

  }
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
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  BOOL v86;
  unsigned int v89;
  objc_super v90;

  v5 = a4;
  v7 = a3;
  BUProtocolCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90.receiver = self;
  v90.super_class = (Class)BCCollectionDetail;
  v89 = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v90, sel_isEqualExceptForDate_ignoringEmptySalt_, v7, v5);

  objc_msgSend_name(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v8, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_collectionID(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionID(v8, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_isEqualToString_(v27, v33, (uint64_t)v32, v34, v35);

  objc_msgSend_collectionDescription(self, v37, v38, v39, v40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45)
  {
    objc_msgSend_collectionDescription(v8, v41, v42, v43, v44);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v55 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend_collectionDescription(self, v41, v42, v43, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionDescription(v8, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend_isEqualToString_(v46, v52, (uint64_t)v51, v53, v54);

  if (!v45)
    goto LABEL_6;
LABEL_7:

  v60 = objc_msgSend_hidden(self, v56, v57, v58, v59);
  v65 = objc_msgSend_hidden(v8, v61, v62, v63, v64);
  v70 = objc_msgSend_sortOrder(self, v66, v67, v68, v69);
  v75 = objc_msgSend_sortOrder(v8, v71, v72, v73, v74);
  v80 = objc_msgSend_sortMode(self, v76, v77, v78, v79);
  v85 = objc_msgSend_sortMode(v8, v81, v82, v83, v84);
  v86 = 0;
  if ((v89 & isEqualToString & v36) == 1 && v55 && ((v60 ^ v65) & 1) == 0)
    v86 = v70 == v75 && v80 == v85;

  return v86;
}

- (void)_configureFromCollectionDetail:(id)a3 withMergers:(id)a4
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
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
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
  uint64_t v93;
  void *v94;
  objc_super v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v95.receiver = self;
  v95.super_class = (Class)BCCollectionDetail;
  -[BCCloudData configureFromCloudData:withMergers:](&v95, sel_configureFromCloudData_withMergers_, v6, a4);
  objc_msgSend_collectionID(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v12, (uint64_t)v11, (uint64_t)CFSTR("collectionID"), v13);

  objc_msgSend_name(v6, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_name(v6, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentString_forKey_(self, v24, (uint64_t)v23, (uint64_t)CFSTR("name"), v25);

  }
  else
  {
    objc_msgSend_setDifferentString_forKey_(self, v19, (uint64_t)&stru_24F091B90, (uint64_t)CFSTR("name"), v22);
  }
  objc_msgSend_collectionDescription(v6, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v31, (uint64_t)v30, (uint64_t)CFSTR("collectionDescription"), v32);

  v33 = (void *)MEMORY[0x24BDD16E0];
  v38 = objc_msgSend_hidden(v6, v34, v35, v36, v37);
  objc_msgSend_numberWithBool_(v33, v39, v38, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v43, (uint64_t)v42, (uint64_t)CFSTR("hidden"), v44);

  v45 = (void *)MEMORY[0x24BDD16E0];
  v50 = objc_msgSend_sortOrder(v6, v46, v47, v48, v49);
  objc_msgSend_numberWithInteger_(v45, v51, v50, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v55, (uint64_t)v54, (uint64_t)CFSTR("sortOrder"), v56);

  v57 = (void *)MEMORY[0x24BDD16E0];
  v62 = objc_msgSend_sortMode(v6, v58, v59, v60, v61);
  objc_msgSend_numberWithInteger_(v57, v63, v62, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v67, (uint64_t)v66, (uint64_t)CFSTR("sortMode"), v68);

  objc_msgSend_shared(MEMORY[0x24BE0FC08], v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend_verboseLoggingEnabled(v73, v74, v75, v76, v77);

  if (v78)
  {
    BDSCloudKitDevelopmentLog();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_collectionID(self, v80, v81, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_collectionID(v6, v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v97 = v84;
      v98 = 2112;
      v99 = v89;
      v100 = 2114;
      v101 = v94;
      _os_log_impl(&dword_227D4F000, v79, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCollectionDetail configured: %{public}@ %@ from assetDetail:%{public}@\\\"\", buf, 0x20u);

    }
  }

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
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
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
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int hasChanges;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  NSObject *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  __CFString *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  objc_super v190;
  uint8_t buf[4];
  void *v192;
  __int16 v193;
  void *v194;
  __int16 v195;
  const __CFString *v196;
  uint64_t v197;

  v197 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v190.receiver = self;
  v190.super_class = (Class)BCCollectionDetail;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v190, sel_resolveConflictsFromRecord_withResolvers_, v6, a4);
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_collectionID(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v10, v17, v18);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_227E5A390(self, v10, v24, v25, v26);

      objc_msgSend_setCollectionID_(self, v27, (uint64_t)v10, v28, v29);
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
          objc_msgSend_collectionID(self, v55, v56, v57, v58);
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
          *(_DWORD *)buf = 138543874;
          v192 = v59;
          v193 = 2114;
          if (v80 == v91)
            v90 = CFSTR("the same");
          v194 = v69;
          v195 = 2114;
          v196 = v90;
          _os_log_impl(&dword_227D4F000, v54, OS_LOG_TYPE_INFO, "BCCollectionDetail %{public}@ Resolving conflicts from record %{public}@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);

        }
        objc_msgSend_incrementEditGeneration(self, v92, v93, v94, v95);
        goto LABEL_32;
      }
    }
    objc_msgSend_objectForKey_(v6, v31, (uint64_t)CFSTR("hidden"), v33, v34);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentNumber_forKey_(self, v96, (uint64_t)v189, (uint64_t)CFSTR("hidden"), v97);
    objc_msgSend_objectForKey_(v6, v98, (uint64_t)CFSTR("sortOrder"), v99, v100);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentNumber_forKey_(self, v101, (uint64_t)v188, (uint64_t)CFSTR("sortOrder"), v102);
    objc_msgSend_objectForKey_(v6, v103, (uint64_t)CFSTR("sortMode"), v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentNumber_forKey_(self, v107, (uint64_t)v106, (uint64_t)CFSTR("sortMode"), v108);
    objc_msgSend_objectForKey_(v6, v109, (uint64_t)CFSTR("name"), v110, v111);
    v112 = objc_claimAutoreleasedReturnValue();
    v115 = (void *)v112;
    if (v112)
      objc_msgSend_setDifferentString_forKey_(self, v113, v112, (uint64_t)CFSTR("name"), v114);
    else
      objc_msgSend_setDifferentString_forKey_(self, v113, (uint64_t)&stru_24F091B90, (uint64_t)CFSTR("name"), v114);
    objc_msgSend_name(self, v116, v117, v118, v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v120)
      objc_msgSend_setName_(self, v121, (uint64_t)&stru_24F091B90, v122, v123);
    objc_msgSend_objectForKey_(v6, v121, (uint64_t)CFSTR("collectionDescription"), v122, v123);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (v128)
      objc_msgSend_setDifferentString_forKey_(self, v124, (uint64_t)v128, (uint64_t)CFSTR("collectionDescription"), v127);
    objc_msgSend_modificationDate(v6, v124, v125, v126, v127);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentDate_forKey_(self, v130, (uint64_t)v129, (uint64_t)CFSTR("modificationDate"), v131);
    hasChanges = objc_msgSend_hasChanges(self, v132, v133, v134, v135);
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v137, v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend_verboseLoggingEnabled(v141, v142, v143, v144, v145);

    if (hasChanges)
    {
      if (v146)
      {
        BDSCloudKitDevelopmentLog();
        v147 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_collectionID(self, v148, v149, v150, v151);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v153, v154, v155, v156);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v187, v157, v158, v159, v160);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_debugDescription(self, v162, v163, v164, v165);
          v166 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v192 = v152;
          v193 = 2112;
          v194 = v161;
          v195 = 2112;
          v196 = v166;
          v167 = "\"\\\"BCCollectionDetail %{public}@ Resolving: Adopted properties from record: %@ %@\\\"\";
LABEL_29:
          _os_log_impl(&dword_227D4F000, v147, OS_LOG_TYPE_DEFAULT, v167, buf, 0x20u);

          goto LABEL_30;
        }
        goto LABEL_30;
      }
    }
    else if (v146)
    {
      BDSCloudKitDevelopmentLog();
      v147 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_collectionID(self, v171, v172, v173, v174);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v175, v176, v177, v178);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v187, v179, v180, v181, v182);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_debugDescription(self, v183, v184, v185, v186);
        v166 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v192 = v152;
        v193 = 2112;
        v194 = v161;
        v195 = 2112;
        v196 = v166;
        v167 = "\"\\\"BCCollectionDetail %{public}@ Resolving: Identical properties from record: %@ %@\\\"\";
        goto LABEL_29;
      }
LABEL_30:

    }
    goto LABEL_32;
  }
  BDSCloudKitLog();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    sub_227E5A314(self, v10, v168, v169, v170);
LABEL_32:

}

- (id)recordType
{
  return CFSTR("collectionDetail");
}

+ (id)propertyIDKey
{
  return CFSTR("collectionID");
}

- (id)zoneName
{
  return CFSTR("CollectionZone");
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
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_collectionID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionDescription(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hidden(self, v18, v19, v20, v21))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  v27 = objc_msgSend_sortOrder(self, v22, v23, v24, v25);
  v32 = objc_msgSend_sortMode(self, v28, v29, v30, v31);
  objc_msgSend_stringWithFormat_(v6, v33, (uint64_t)CFSTR("collectionID: %@, Name: %@, Description: %@ hidden:%@ sortOrder:%d sortMode %d"), v34, v35, v7, v12, v17, v26, v27, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v36;
}

@end
