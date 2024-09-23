@implementation BCAssetReview

- (id)mutableCopy
{
  BCMutableAssetReview *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableAssetReview alloc];
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
    objc_msgSend__configureFromAssetReview_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5B0D4();

  }
}

- (void)_configureFromAssetReview:(id)a3 withMergers:(id)a4
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
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  NSObject *v61;
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
  objc_super v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BCAssetReview;
  -[BCCloudData configureFromCloudData:withMergers:](&v77, sel_configureFromCloudData_withMergers_, v6, a4);
  objc_msgSend_assetReviewID(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userIDFromAssetReviewID_(BCAssetReview, v12, (uint64_t)v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setDifferentString_forKey_(self, v16, (uint64_t)v15, (uint64_t)CFSTR("userID"), v17);
  objc_msgSend_assetReviewID(v6, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v23, (uint64_t)v22, (uint64_t)CFSTR("assetReviewID"), v24);

  v25 = (void *)MEMORY[0x24BDD16E0];
  v30 = objc_msgSend_starRating(v6, v26, v27, v28, v29);
  objc_msgSend_numberWithShort_(v25, v31, v30, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v35, (uint64_t)v34, (uint64_t)CFSTR("starRating"), v36);

  objc_msgSend_reviewTitle(v6, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v42, (uint64_t)v41, (uint64_t)CFSTR("reviewTitle"), v43);

  objc_msgSend_reviewBody(v6, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v49, (uint64_t)v48, (uint64_t)CFSTR("reviewBody"), v50);

  objc_msgSend_shared(MEMORY[0x24BE0FC08], v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_verboseLoggingEnabled(v55, v56, v57, v58, v59);

  if (v60)
  {
    BDSCloudKitDevelopmentLog();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_assetReviewID(self, v62, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetReviewID(v6, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v79 = v66;
      v80 = 2112;
      v81 = v71;
      v82 = 2112;
      v83 = v76;
      _os_log_impl(&dword_227D4F000, v61, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetReview configured: %@ %@ from assetReview:%@\\\"\", buf, 0x20u);

    }
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
  char isEqualToString;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
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
  char v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char v71;
  char v72;
  unsigned __int8 v74;
  objc_super v75;

  v5 = a4;
  v7 = a3;
  BUProtocolCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v75.receiver = self;
  v75.super_class = (Class)BCAssetReview;
  v74 = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v75, sel_isEqualExceptForDate_ignoringEmptySalt_, v7, v5);

  objc_msgSend_assetReviewID(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetReviewID(v8, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v19, (uint64_t)v18, v20, v21);

  v27 = objc_msgSend_starRating(self, v23, v24, v25, v26);
  v32 = objc_msgSend_starRating(v8, v28, v29, v30, v31);
  objc_msgSend_reviewTitle(self, v33, v34, v35, v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend_reviewTitle(v8, v37, v38, v39, v40);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v51 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend_reviewTitle(self, v37, v38, v39, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reviewTitle(v8, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_isEqualToString_(v42, v48, (uint64_t)v47, v49, v50);

  if (!v41)
    goto LABEL_6;
LABEL_7:

  objc_msgSend_reviewBody(self, v52, v53, v54, v55);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60
    || (objc_msgSend_reviewBody(v8, v56, v57, v58, v59), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_reviewBody(self, v56, v57, v58, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_reviewBody(v8, v62, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_isEqualToString_(v61, v67, (uint64_t)v66, v68, v69);

    if (v60)
      goto LABEL_13;
  }
  else
  {
    v70 = 1;
  }

LABEL_13:
  v71 = v74 & isEqualToString;
  if (v27 != v32)
    v71 = 0;
  v72 = v71 & v51 & v70;

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
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
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
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  NSObject *v60;
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
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  double v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const __CFString *v96;
  double v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int hasChanges;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  NSObject *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  __CFString *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
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
  void *v179;
  objc_super v180;
  uint8_t buf[4];
  void *v182;
  __int16 v183;
  void *v184;
  __int16 v185;
  const __CFString *v186;
  uint64_t v187;

  v187 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v180.receiver = self;
  v180.super_class = (Class)BCAssetReview;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v180, sel_resolveConflictsFromRecord_withResolvers_, v6, a4);
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetReviewID(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v10, v17, v18);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_227E5B194(self, v10, v24, v25, v26);

      objc_msgSend_setAssetReviewID_(self, v27, (uint64_t)v10, v28, v29);
      objc_msgSend_userIDFromAssetReviewID_(BCAssetReview, v30, (uint64_t)v10, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDifferentString_forKey_(self, v34, (uint64_t)v33, (uint64_t)CFSTR("userID"), v35);

    }
    objc_msgSend_modificationDate(self, v20, v21, v22, v23);
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v41 = (void *)v36;
      objc_msgSend_modificationDate(self, v37, v38, v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v42, v43, v44, v45, v46);
      v48 = v47;
      objc_msgSend_modificationDate(v6, v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v53, v54, v55, v56, v57);
      v59 = v58;

      if (v48 > v59)
      {
        BDSCloudKitLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_assetReviewID(self, v61, v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v66, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v70, v71, v72, v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_modificationDate(self, v76, v77, v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v80, v81, v82, v83, v84);
          v86 = v85;
          objc_msgSend_modificationDate(v6, v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v91, v92, v93, v94, v95);
          v96 = CFSTR("newer");
          *(_DWORD *)buf = 138412802;
          v182 = v65;
          if (v86 == v97)
            v96 = CFSTR("the same");
          v183 = 2112;
          v184 = v75;
          v185 = 2114;
          v186 = v96;
          _os_log_impl(&dword_227D4F000, v60, OS_LOG_TYPE_INFO, "BCAssetReview %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);

        }
        objc_msgSend_incrementEditGeneration(self, v98, v99, v100, v101);
        goto LABEL_25;
      }
    }
    objc_msgSend_objectForKey_(v6, v37, (uint64_t)CFSTR("starRating"), v39, v40);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentNumber_forKey_(self, v103, (uint64_t)v102, (uint64_t)CFSTR("starRating"), v104);
    objc_msgSend_objectForKey_(v6, v105, (uint64_t)CFSTR("reviewTitle"), v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentString_forKey_(self, v109, (uint64_t)v108, (uint64_t)CFSTR("reviewTitle"), v110);
    objc_msgSend_objectForKey_(v6, v111, (uint64_t)CFSTR("reviewBody"), v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentString_forKey_(self, v115, (uint64_t)v114, (uint64_t)CFSTR("reviewBody"), v116);
    objc_msgSend_modificationDate(v6, v117, v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDifferentDate_forKey_(self, v122, (uint64_t)v121, (uint64_t)CFSTR("modificationDate"), v123);
    hasChanges = objc_msgSend_hasChanges(self, v124, v125, v126, v127);
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v129, v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend_verboseLoggingEnabled(v133, v134, v135, v136, v137);

    if (hasChanges)
    {
      if (v138)
      {
        BDSCloudKitDevelopmentLog();
        v139 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_assetReviewID(self, v140, v141, v142, v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v6, v145, v146, v147, v148);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordName(v179, v149, v150, v151, v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_debugDescription(self, v154, v155, v156, v157);
          v158 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v182 = v144;
          v183 = 2112;
          v184 = v153;
          v185 = 2112;
          v186 = v158;
          v159 = "\"\\\"BCAssetReview %@ Resolving: Adopted properties from record: %@ %@\\\"\";
LABEL_22:
          _os_log_impl(&dword_227D4F000, v139, OS_LOG_TYPE_DEFAULT, v159, buf, 0x20u);

          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if (v138)
    {
      BDSCloudKitDevelopmentLog();
      v139 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_assetReviewID(self, v163, v164, v165, v166);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v6, v167, v168, v169, v170);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v179, v171, v172, v173, v174);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_debugDescription(self, v175, v176, v177, v178);
        v158 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v182 = v144;
        v183 = 2112;
        v184 = v153;
        v185 = 2112;
        v186 = v158;
        v159 = "\"\\\"BCAssetReview %@ Resolving: Identical properties from record: %@ %@\\\"\";
        goto LABEL_22;
      }
LABEL_23:

    }
    goto LABEL_25;
  }
  BDSCloudKitLog();
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    sub_227E5B100(self, v10, v160, v161, v162);
LABEL_25:

}

- (id)recordType
{
  return CFSTR("assetReview");
}

+ (id)propertyIDKey
{
  return CFSTR("assetReviewID");
}

- (double)normalizedStarRating
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  double v16;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = objc_msgSend_starRating(self, a2, v2, v3, v4);
  objc_msgSend_numberWithShort_(v5, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v10, v11, v12, v13, v14);
  v16 = v15 / 5.0;

  return v16;
}

- (void)setNormalizedStarRating:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, v3, v4, v5, floor(a3 * 5.0));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_integerValue(v15, v7, v8, v9, v10);
  objc_msgSend_setStarRating_(self, v12, v11, v13, v14);

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
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  objc_msgSend_assetReviewID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_starRating(self, v8, v9, v10, v11);
  objc_msgSend_reviewTitle(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reviewBody(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v23, (uint64_t)CFSTR("assetReviewID: %@, starRating: %hd, reviewTitle: %@, reviewBody: %@"), v24, v25, v7, v12, v17, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

+ (id)assetReviewIDWithUserID:(id)a3 assetID:(id)a4
{
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@|%@"), (uint64_t)a4, v4, a3, a4);
}

+ (id)assetIDFromAssetReviewID:(id)a3
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

+ (id)userIDFromAssetReviewID:(id)a3
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
