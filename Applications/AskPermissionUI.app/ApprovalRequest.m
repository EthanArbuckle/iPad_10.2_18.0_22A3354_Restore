@implementation ApprovalRequest

- (ApprovalRequest)initWithDictionary:(id)a3
{
  id v4;
  ApprovalRequest *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  NSString *v47;
  void *v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  NSObject *v65;
  objc_class *v66;
  NSString *v67;
  void *v68;
  objc_class *v69;
  NSString *v70;
  void *v71;
  RequestLocalizations *v72;
  void *v73;
  uint64_t v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  void *v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  id v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  id v105;
  id v106;
  void *v107;
  uint64_t v108;
  id v109;
  id v110;
  void *v111;
  uint64_t v112;
  id v113;
  id v114;
  id v115;
  NSString *v116;
  NSString *ageRating;
  NSString *v118;
  NSString *approverDSID;
  NSDate *v120;
  NSDate *createdDate;
  __CFString *v122;
  __CFString *v123;
  __CFString *v124;
  __CFString *v125;
  __CFString *v126;
  __CFString *v127;
  NSString *v128;
  NSString *itemBundleID;
  NSString *v130;
  NSString *itemDescription;
  NSString *v132;
  NSString *itemTitle;
  __CFString *v134;
  __CFString *v135;
  __CFString *v136;
  NSString *v137;
  NSString *offerName;
  NSString *v139;
  NSString *productType;
  NSString *v141;
  NSString *productTypeName;
  NSString *v143;
  NSString *requesterDSID;
  NSString *v145;
  NSString *requesterName;
  void *v147;
  uint64_t v148;
  id v149;
  id v150;
  NSString *v151;
  NSString *requestString;
  void *v153;
  uint64_t v154;
  id v155;
  id v156;
  NSString *v157;
  NSString *requestSummary;
  void *v159;
  uint64_t v160;
  id v161;
  id v162;
  NSString *v163;
  NSString *priceSummary;
  ApprovalRequest *v165;
  id v167;
  unsigned __int8 v168;
  id v169;
  id v170;
  id obj;
  unsigned __int8 v172;
  id v173;
  void *v174;
  id v175;
  id v176;
  id v177;
  RequestLocalizations *v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  objc_super v187;
  uint8_t buf[4];
  const __CFString *v189;
  __int16 v190;
  void *v191;
  __int16 v192;
  void *v193;

  v4 = a3;
  v187.receiver = self;
  v187.super_class = (Class)ApprovalRequest;
  v5 = -[ApprovalRequest init](&v187, "init");

  if (!v5)
    goto LABEL_115;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ageRating")));
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v186 = v8;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("approverDSID")));
  v10 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v185 = v11;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canSendViaMessages")));
  v13 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  v172 = objc_msgSend(v15, "BOOLValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("createdTimeInterval")));
  v17 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
  {
    v18 = v16;
  }
  else
  {
    v19 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
    {
      objc_msgSend(v16, "doubleValue");
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
      if (!v20)
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "OSLogObject"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = (objc_class *)objc_opt_class(v16);
        v23 = NSStringFromClass(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)buf = 138543618;
        v189 = CFSTR("createdTimeInterval");
        v190 = 2114;
        v191 = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected NSDate or NSNumber, got %{public}@.", buf, 0x16u);

      }
      v18 = 0;
    }
  }
  v25 = v18;

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modifiedTimeInterval")));
  v27 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
  {
    v28 = v26;
  }
  else
  {
    v29 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v26, v29) & 1) != 0)
    {
      objc_msgSend(v26, "doubleValue");
      v28 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    }
    else
    {
      v28 = 0;
    }
  }
  obj = v28;
  v173 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier")));
  v31 = objc_opt_class(NSString);
  v174 = v25;
  if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
  {
    v32 = v30;
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    if (!v33)
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "OSLogObject"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      v35 = (objc_class *)objc_opt_class(NSString);
      v36 = NSStringFromClass(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (objc_class *)objc_opt_class(v30);
      v39 = NSStringFromClass(v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      *(_DWORD *)buf = 138543874;
      v189 = CFSTR("identifier");
      v190 = 2114;
      v191 = v37;
      v192 = 2114;
      v193 = v40;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);

      v25 = v174;
    }

    v32 = 0;
  }
  v184 = v32;

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier")));
  v42 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
  {
    v43 = v41;
  }
  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    if (!v44)
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "OSLogObject"));
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      v46 = (objc_class *)objc_opt_class(NSString);
      v47 = NSStringFromClass(v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      v49 = (objc_class *)objc_opt_class(v41);
      v50 = NSStringFromClass(v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      *(_DWORD *)buf = 138543874;
      v189 = CFSTR("uniqueIdentifier");
      v190 = 2114;
      v191 = v48;
      v192 = 2114;
      v193 = v51;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);

      v25 = v174;
    }

    v43 = 0;
  }
  v183 = v43;

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleID")));
  v53 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0)
    v54 = v52;
  else
    v54 = 0;
  v182 = v54;

  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemDescription")));
  v56 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v55, v56) & 1) != 0)
    v57 = v55;
  else
    v57 = 0;
  v181 = v57;

  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemTitle")));
  v59 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0)
    v60 = v58;
  else
    v60 = 0;
  v180 = v60;

  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemIdentifier")));
  v62 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v61, v62) & 1) != 0)
  {
    v63 = v61;
  }
  else
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    if (!v64)
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "OSLogObject"));
    if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
    {
      v66 = (objc_class *)objc_opt_class(NSString);
      v67 = NSStringFromClass(v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v69 = (objc_class *)objc_opt_class(v61);
      v70 = NSStringFromClass(v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
      *(_DWORD *)buf = 138543874;
      v189 = CFSTR("itemIdentifier");
      v190 = 2114;
      v191 = v68;
      v192 = 2114;
      v193 = v71;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_FAULT, "Unexpected type for key %{public}@. Expected %{public}@, got %{public}@.", buf, 0x20u);

      v25 = v174;
    }

    v63 = 0;
  }
  v179 = v63;

  v72 = [RequestLocalizations alloc];
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizations")));
  v74 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v73, v74) & 1) != 0)
    v75 = v73;
  else
    v75 = 0;
  v76 = v75;

  v178 = -[RequestLocalizations initWithDictionary:](v72, "initWithDictionary:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerName")));
  v78 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v77, v78) & 1) != 0)
    v79 = v77;
  else
    v79 = 0;
  v177 = v79;

  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mocked")));
  v81 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v80, v81) & 1) != 0)
    v82 = v80;
  else
    v82 = 0;
  v83 = v82;

  v168 = objc_msgSend(v83, "BOOLValue");
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previewURL")));
  v85 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v84, v85) & 1) != 0)
  {
    v86 = v84;
  }
  else
  {
    v87 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v84, v87) & 1) != 0)
      v86 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v84));
    else
      v86 = 0;
  }
  v167 = v86;
  v170 = v86;

  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productType")));
  v89 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v88, v89) & 1) != 0)
    v90 = v88;
  else
    v90 = 0;
  v176 = v90;

  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productTypeName")));
  v92 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v91, v92) & 1) != 0)
    v93 = v91;
  else
    v93 = 0;
  v175 = v93;

  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productURL")));
  v95 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v94, v95) & 1) != 0)
  {
    v96 = v94;
  }
  else
  {
    v97 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v94, v97) & 1) == 0)
    {
      v98 = 0;
      goto LABEL_81;
    }
    v96 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v94, v167));
  }
  v98 = v96;
LABEL_81:
  v169 = v98;

  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requesterDSID")));
  v100 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v99, v100) & 1) != 0)
    v101 = v99;
  else
    v101 = 0;
  v102 = v101;

  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requesterName")));
  v104 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v103, v104) & 1) != 0)
    v105 = v103;
  else
    v105 = 0;
  v106 = v105;

  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("starRating")));
  v108 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v107, v108) & 1) != 0)
    v109 = v107;
  else
    v109 = 0;
  v110 = v109;

  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status")));
  v112 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v111, v112) & 1) != 0)
    v113 = v111;
  else
    v113 = 0;
  v114 = v113;

  v115 = objc_msgSend(v114, "integerValue");
  v116 = (NSString *)objc_msgSend(v186, "copy");
  ageRating = v5->_ageRating;
  v5->_ageRating = v116;

  v118 = (NSString *)objc_msgSend(v185, "copy");
  approverDSID = v5->_approverDSID;
  v5->_approverDSID = v118;

  v5->_canSendViaMessages = v172;
  if (v25)
  {
    v120 = (NSDate *)v25;
    createdDate = v5->_createdDate;
    v5->_createdDate = v120;
  }
  else
  {
    createdDate = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_storeStrong((id *)&v5->_createdDate, createdDate);
  }

  objc_storeStrong((id *)&v5->_modifiedDate, obj);
  v122 = (__CFString *)objc_msgSend(v184, "copy");
  v123 = v122;
  if (v122)
    v124 = v122;
  else
    v124 = &stru_1000150A0;
  objc_storeStrong((id *)&v5->_requestIdentifier, v124);

  v125 = (__CFString *)objc_msgSend(v183, "copy");
  v126 = v125;
  if (v125)
    v127 = v125;
  else
    v127 = &stru_1000150A0;
  objc_storeStrong((id *)&v5->_uniqueIdentifier, v127);

  v128 = (NSString *)objc_msgSend(v182, "copy");
  itemBundleID = v5->_itemBundleID;
  v5->_itemBundleID = v128;

  v130 = (NSString *)objc_msgSend(v181, "copy");
  itemDescription = v5->_itemDescription;
  v5->_itemDescription = v130;

  v132 = (NSString *)objc_msgSend(v180, "copy");
  itemTitle = v5->_itemTitle;
  v5->_itemTitle = v132;

  v134 = (__CFString *)objc_msgSend(v179, "copy");
  v135 = v134;
  if (v134)
    v136 = v134;
  else
    v136 = &stru_1000150A0;
  objc_storeStrong((id *)&v5->_itemIdentifier, v136);

  objc_storeStrong((id *)&v5->_localizations, v178);
  v5->_mocked = v168;
  v137 = (NSString *)objc_msgSend(v177, "copy");
  offerName = v5->_offerName;
  v5->_offerName = v137;

  objc_storeStrong((id *)&v5->_previewURL, v167);
  v139 = (NSString *)objc_msgSend(v176, "copy");
  productType = v5->_productType;
  v5->_productType = v139;

  v141 = (NSString *)objc_msgSend(v175, "copy");
  productTypeName = v5->_productTypeName;
  v5->_productTypeName = v141;

  objc_storeStrong((id *)&v5->_productURL, v98);
  v143 = (NSString *)objc_msgSend(v102, "copy");
  requesterDSID = v5->_requesterDSID;
  v5->_requesterDSID = v143;

  v145 = (NSString *)objc_msgSend(v106, "copy");
  requesterName = v5->_requesterName;
  v5->_requesterName = v145;

  objc_storeStrong((id *)&v5->_starRating, v109);
  v5->_status = (int64_t)v115;
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestString")));
  v148 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v147, v148) & 1) != 0)
    v149 = v147;
  else
    v149 = 0;
  v150 = v149;

  v151 = (NSString *)objc_msgSend(v150, "copy");
  requestString = v5->_requestString;
  v5->_requestString = v151;

  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestSummary")));
  v154 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v153, v154) & 1) != 0)
    v155 = v153;
  else
    v155 = 0;
  v156 = v155;

  v157 = (NSString *)objc_msgSend(v156, "copy");
  requestSummary = v5->_requestSummary;
  v5->_requestSummary = v157;

  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("priceSummary")));
  v160 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v159, v160) & 1) != 0)
    v161 = v159;
  else
    v161 = 0;
  v162 = v161;

  v163 = (NSString *)objc_msgSend(v162, "copy");
  priceSummary = v5->_priceSummary;
  v5->_priceSummary = v163;

LABEL_115:
  v165 = v5;

  return v165;
}

- (ApprovalRequest)initWithApproverDSID:(id)a3 createdDate:(id)a4 modifiedDate:(id)a5 requestIdentifier:(id)a6 uniqueIdentifier:(id)a7 canSendViaMessages:(BOOL)a8 itemBundleID:(id)a9 itemDescription:(id)a10 itemIdentifier:(id)a11 itemTitle:(id)a12 localizations:(id)a13 offerName:(id)a14 mocked:(BOOL)a15 previewURL:(id)a16 productType:(id)a17 productTypeName:(id)a18 productURL:(id)a19 requesterName:(id)a20 requesterDSID:(id)a21 requestInfo:(id)a22 requestString:(id)a23 requestSummary:(id)a24 priceSummary:(id)a25 status:(int64_t)a26
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  ApprovalRequest *v37;
  ApprovalRequest *v38;
  id v41;
  id v42;
  id v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;

  v56 = a3;
  v41 = a4;
  v54 = a4;
  v42 = a5;
  v52 = a5;
  v50 = a6;
  v44 = a7;
  v59 = a7;
  v58 = a9;
  v57 = a10;
  v55 = a11;
  v53 = a12;
  v51 = a13;
  v49 = a14;
  v48 = a16;
  v47 = a17;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v34 = a22;
  v35 = a23;
  v36 = a24;
  v46 = a25;
  v60.receiver = self;
  v60.super_class = (Class)ApprovalRequest;
  v37 = -[ApprovalRequest init](&v60, "init");
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_approverDSID, a3);
    objc_storeStrong((id *)&v38->_createdDate, v41);
    objc_storeStrong((id *)&v38->_modifiedDate, v42);
    v38->_canSendViaMessages = a8;
    objc_storeStrong((id *)&v38->_requestIdentifier, a6);
    objc_storeStrong((id *)&v38->_uniqueIdentifier, v44);
    objc_storeStrong((id *)&v38->_itemBundleID, a9);
    objc_storeStrong((id *)&v38->_itemDescription, a10);
    objc_storeStrong((id *)&v38->_itemTitle, a12);
    objc_storeStrong((id *)&v38->_itemIdentifier, a11);
    objc_storeStrong((id *)&v38->_localizations, a13);
    objc_storeStrong((id *)&v38->_offerName, a14);
    v38->_mocked = a15;
    objc_storeStrong((id *)&v38->_previewURL, a16);
    objc_storeStrong((id *)&v38->_productType, a17);
    objc_storeStrong((id *)&v38->_productTypeName, a18);
    objc_storeStrong((id *)&v38->_productURL, a19);
    objc_storeStrong((id *)&v38->_requesterDSID, a21);
    objc_storeStrong((id *)&v38->_requesterName, a20);
    objc_storeStrong((id *)&v38->_requestInfo, a22);
    objc_storeStrong((id *)&v38->_requestString, a23);
    objc_storeStrong((id *)&v38->_requestSummary, a24);
    objc_storeStrong((id *)&v38->_priceSummary, a25);
    v38->_status = a26;
  }

  return v38;
}

- (ApprovalRequest)initWithApproverStorageItem:(id)a3
{
  id v4;
  ApprovalRequest *v5;
  uint64_t v6;
  NSString *ageRating;
  uint64_t v8;
  NSString *approverDSID;
  uint64_t v10;
  NSDate *createdDate;
  uint64_t v12;
  NSDate *modifiedDate;
  uint64_t v14;
  NSString *requestIdentifier;
  uint64_t v16;
  NSString *uniqueIdentifier;
  uint64_t v18;
  NSString *itemDescription;
  uint64_t v20;
  NSString *itemTitle;
  uint64_t v22;
  NSString *itemIdentifier;
  uint64_t v24;
  RequestLocalizations *localizations;
  uint64_t v26;
  NSString *localizedPrice;
  uint64_t v28;
  NSString *offerName;
  uint64_t v30;
  NSURL *previewURL;
  uint64_t v32;
  NSString *productType;
  uint64_t v34;
  NSString *requesterDSID;
  uint64_t v36;
  NSNumber *starRating;
  uint64_t v38;
  NSString *requestString;
  uint64_t v40;
  NSString *requestSummary;
  uint64_t v42;
  NSString *priceSummary;
  uint64_t v44;
  NSString *thumbnailURLString;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ApprovalRequest;
  v5 = -[ApprovalRequest init](&v47, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ageRating"));
    ageRating = v5->_ageRating;
    v5->_ageRating = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "approverDSID"));
    approverDSID = v5->_approverDSID;
    v5->_approverDSID = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createdDate"));
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modifiedDate"));
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestIdentifier"));
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemDescription"));
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemTitle"));
    itemTitle = v5->_itemTitle;
    v5->_itemTitle = (NSString *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifier"));
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizations"));
    localizations = v5->_localizations;
    v5->_localizations = (RequestLocalizations *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedPrice"));
    localizedPrice = v5->_localizedPrice;
    v5->_localizedPrice = (NSString *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "offerName"));
    offerName = v5->_offerName;
    v5->_offerName = (NSString *)v28;

    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previewURL"));
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v30;

    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productType"));
    productType = v5->_productType;
    v5->_productType = (NSString *)v32;

    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requesterDSID"));
    requesterDSID = v5->_requesterDSID;
    v5->_requesterDSID = (NSString *)v34;

    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "starRating"));
    starRating = v5->_starRating;
    v5->_starRating = (NSNumber *)v36;

    v5->_status = (int64_t)objc_msgSend(v4, "status");
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestString"));
    requestString = v5->_requestString;
    v5->_requestString = (NSString *)v38;

    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestSummary"));
    requestSummary = v5->_requestSummary;
    v5->_requestSummary = (NSString *)v40;

    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "priceSummary"));
    priceSummary = v5->_priceSummary;
    v5->_priceSummary = (NSString *)v42;

    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "thumbnailURLString"));
    thumbnailURLString = v5->_thumbnailURLString;
    v5->_thumbnailURLString = (NSString *)v44;

  }
  return v5;
}

- (ApprovalRequest)initWithRequestStorageItem:(id)a3
{
  id v4;
  ApprovalRequest *v5;
  uint64_t v6;
  NSString *ageRating;
  uint64_t v8;
  NSString *approverDSID;
  uint64_t v10;
  NSDate *createdDate;
  uint64_t v12;
  NSDate *modifiedDate;
  uint64_t v14;
  NSString *requestIdentifier;
  uint64_t v16;
  NSString *uniqueIdentifier;
  uint64_t v18;
  NSString *itemDescription;
  uint64_t v20;
  NSString *itemTitle;
  uint64_t v22;
  NSString *itemIdentifier;
  uint64_t v24;
  RequestLocalizations *localizations;
  uint64_t v26;
  NSString *localizedPrice;
  uint64_t v28;
  NSString *offerName;
  uint64_t v30;
  NSURL *previewURL;
  uint64_t v32;
  NSString *productType;
  uint64_t v34;
  NSString *productTypeName;
  uint64_t v36;
  NSURL *productURL;
  uint64_t v38;
  NSString *requesterDSID;
  uint64_t v40;
  NSNumber *starRating;
  uint64_t v42;
  NSString *requestString;
  uint64_t v44;
  NSString *requestSummary;
  uint64_t v46;
  NSString *priceSummary;
  uint64_t v48;
  NSString *thumbnailURLString;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ApprovalRequest;
  v5 = -[ApprovalRequest init](&v51, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ageRating"));
    ageRating = v5->_ageRating;
    v5->_ageRating = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "approverDSID"));
    approverDSID = v5->_approverDSID;
    v5->_approverDSID = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createdDate"));
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modifiedDate"));
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestIdentifier"));
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemDescription"));
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemTitle"));
    itemTitle = v5->_itemTitle;
    v5->_itemTitle = (NSString *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifier"));
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizations"));
    localizations = v5->_localizations;
    v5->_localizations = (RequestLocalizations *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedPrice"));
    localizedPrice = v5->_localizedPrice;
    v5->_localizedPrice = (NSString *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "offerName"));
    offerName = v5->_offerName;
    v5->_offerName = (NSString *)v28;

    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previewURL"));
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v30;

    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productType"));
    productType = v5->_productType;
    v5->_productType = (NSString *)v32;

    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productTypeName"));
    productTypeName = v5->_productTypeName;
    v5->_productTypeName = (NSString *)v34;

    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productURL"));
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v36;

    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requesterDSID"));
    requesterDSID = v5->_requesterDSID;
    v5->_requesterDSID = (NSString *)v38;

    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "starRating"));
    starRating = v5->_starRating;
    v5->_starRating = (NSNumber *)v40;

    v5->_status = (int64_t)objc_msgSend(v4, "status");
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestString"));
    requestString = v5->_requestString;
    v5->_requestString = (NSString *)v42;

    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestSummary"));
    requestSummary = v5->_requestSummary;
    v5->_requestSummary = (NSString *)v44;

    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "priceSummary"));
    priceSummary = v5->_priceSummary;
    v5->_priceSummary = (NSString *)v46;

    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "thumbnailURLString"));
    thumbnailURLString = v5->_thumbnailURLString;
    v5->_thumbnailURLString = (NSString *)v48;

  }
  return v5;
}

- (ApprovalRequest)initWithCloudPushDictionary:(id)a3
{
  id v4;
  void *v5;
  ApprovalRequest *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](AMSBag, "sharedBag"));
  v6 = -[ApprovalRequest initWithCloudPushDictionary:bag:](self, "initWithCloudPushDictionary:bag:", v4, v5);

  return v6;
}

- (ApprovalRequest)initWithCloudPushDictionary:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  ApprovalRequest *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *i;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  id v81;
  void *v82;
  uint64_t v83;
  id v84;
  id v85;
  void *v86;
  uint64_t v87;
  id v88;
  id v89;
  const __CFString *v90;
  NSString *ageRating;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  uint64_t v96;
  NSString *approverDSID;
  id v98;
  uint64_t v99;
  void *v100;
  void *v101;
  NSObject *v102;
  id v103;
  const char *v104;
  NSObject *v105;
  uint32_t v106;
  uint64_t v107;
  NSDate *v108;
  NSDate *v109;
  NSDate *v110;
  NSDate *modifiedDate;
  uint64_t v112;
  uint64_t v113;
  NSString *uniqueIdentifier;
  void *v115;
  uint64_t v116;
  id v117;
  id v118;
  NSString *v119;
  __CFString *itemBundleID;
  void *v121;
  uint64_t v122;
  id v123;
  __CFString *v124;
  void *v125;
  uint64_t v126;
  id v127;
  id v128;
  NSString *v129;
  NSString *itemTitle;
  id v131;
  void *v132;
  uint64_t v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  void *v139;
  uint64_t v140;
  id v141;
  __CFString *v142;
  __CFString *v143;
  void *v144;
  void *v145;
  id v146;
  RequestLocalizations *v147;
  void *v148;
  uint64_t v149;
  id v150;
  void *v151;
  __CFString *v152;
  __CFString *v153;
  void *v154;
  uint64_t v155;
  id v156;
  __CFString *v157;
  __CFString *v158;
  void *v159;
  uint64_t v160;
  id v161;
  id v162;
  NSURL *previewURL;
  void **p_productType;
  void *v165;
  uint64_t v166;
  id v167;
  __CFString *v168;
  __CFString *v169;
  __CFString *v170;
  const __CFString *v171;
  _UNKNOWN **v172;
  void *v173;
  void *v174;
  uint64_t v175;
  id v176;
  id v177;
  NSURL *productURL;
  void *v179;
  uint64_t v180;
  id v181;
  id v182;
  uint64_t v183;
  NSString *requesterDSID;
  void *v185;
  uint64_t v186;
  id v187;
  id v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  id v192;
  id v193;
  id v194;
  void *v195;
  uint64_t v196;
  id v197;
  id v198;
  void *v199;
  uint64_t v200;
  id v201;
  id v202;
  _UNKNOWN **v203;
  int64_t status;
  const __CFString *v205;
  id v206;
  uint64_t v207;
  id v208;
  void *v209;
  uint64_t v210;
  id v211;
  __CFString *v212;
  __CFString *v213;
  __CFString *v214;
  __CFString *v215;
  void *v216;
  uint64_t v217;
  id v218;
  id v219;
  __CFString *v220;
  void *v221;
  uint64_t v222;
  id v223;
  id v224;
  __CFString *v225;
  ApprovalRequest *v226;
  id v228;
  void *v229;
  uint64_t v230;
  id v231;
  id v232;
  void *v233;
  uint64_t v234;
  id v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  __CFString *v240;
  RequestLocalizations *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  id v246;
  void *v247;
  id v248;
  id v249;
  void *v250;
  void *v251;
  id v252;
  void *v253;
  void *v254;
  id obj;
  __CFString *obja;
  id v257;
  id v258;
  void *v259;
  void *v260;
  id v261;
  id v262;
  void *v263;
  id v264;
  id v265;
  void *v266;
  void *v267;
  void *v268;
  id v269;
  void *v270;
  void *v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  objc_super v276;
  uint8_t v277[128];
  uint8_t buf[4];
  id v279;
  __int16 v280;
  void *v281;

  v6 = a3;
  v7 = a4;
  v276.receiver = self;
  v276.super_class = (Class)ApprovalRequest;
  v8 = -[ApprovalRequest init](&v276, "init");

  if (!v8)
    goto LABEL_237;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestInfo")));
  v10 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v257 = v11;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("salables")));
  v14 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  v271 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("lockupData")));
  v18 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    v19 = v17;
  else
    v19 = 0;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("productType")));
  v22 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
    v23 = v21;
  else
    v23 = 0;
  obj = v23;
  v24 = v23;

  if (objc_msgSend(v24, "isEqualToString:", CFSTR("A")))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("parentSalables")));
    v26 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
      v27 = v25;
    else
      v27 = 0;
    v28 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
    v30 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
      v31 = v29;
    else
      v31 = 0;
    v32 = v31;

    v270 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("lockupData")));
    v34 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
      v35 = v33;
    else
      v35 = 0;
    v269 = v35;

  }
  else
  {
    v269 = 0;
    v270 = 0;
  }
  v36 = v6;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("requestId")));
  v38 = objc_opt_class(NSString);
  v39 = v7;
  if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
    v40 = v37;
  else
    v40 = 0;
  v41 = v40;

  v268 = v41;
  if (!v41)
  {
    v55 = 1;
    v7 = v39;
    v6 = v36;
    v56 = v271;
    goto LABEL_235;
  }
  objc_storeStrong((id *)&v8->_requestIdentifier, v40);
  v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("clientInfo")));
  v43 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
  v44 = (void *)v43;
  v265 = v24;
  v266 = v20;
  v267 = (void *)v42;
  v7 = v39;
  if (v42)
  {
    if (!v43)
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "OSLogObject"));
    v6 = v36;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (id)objc_opt_class(v8);
      *(_DWORD *)buf = 138543618;
      v279 = v46;
      v280 = 2112;
      v281 = v267;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: clientInfo: %@", buf, 0x16u);

    }
    v272 = 0u;
    v273 = 0u;
    v274 = 0u;
    v275 = 0u;
    v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v267, "componentsSeparatedByString:", CFSTR("-")));
    v48 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v272, v277, 16);
    if (v48)
    {
      v49 = v48;
      v252 = v12;
      v261 = v7;
      v263 = v36;
      v50 = *(_QWORD *)v273;
      do
      {
        for (i = 0; i != v49; i = (char *)i + 1)
        {
          if (*(_QWORD *)v273 != v50)
            objc_enumerationMutation(v47);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v272 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR(":")));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "firstObject"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastObject"));
          if (objc_msgSend(v53, "isEqualToString:", CFSTR("canSendViaMessages")))
            v8->_canSendViaMessages = objc_msgSend(v54, "BOOLValue");

        }
        v49 = -[NSObject countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v272, v277, 16);
      }
      while (v49);
      v44 = v47;
      v7 = v261;
      v6 = v263;
      v12 = v252;
    }
    else
    {
      v44 = v47;
    }
  }
  else
  {
    if (!v43)
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "OSLogObject"));
    v6 = v36;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v57 = (id)objc_opt_class(v8);
      *(_DWORD *)buf = 138543362;
      v279 = v57;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Server Response - No clientInfo passed from child device", buf, 0xCu);

    }
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("adamId")));
  v59 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v58, v59) & 1) != 0)
    v60 = v58;
  else
    v60 = 0;
  v24 = v265;
  v61 = v60;

  v260 = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stringValue"));
  v63 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v62, v63) & 1) != 0)
    v64 = v62;
  else
    v64 = 0;
  v65 = v64;

  v259 = v65;
  if (v65)
  {
    objc_storeStrong((id *)&v8->_itemIdentifier, v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("approveButton")));
    v67 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v66, v67) & 1) != 0)
      v68 = v66;
    else
      v68 = 0;
    v264 = v68;

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("declineButton")));
    v70 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0)
      v71 = v69;
    else
      v71 = 0;
    v262 = v71;

    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("requestString")));
    v73 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v72, v73) & 1) != 0)
      v74 = v72;
    else
      v74 = 0;
    v75 = v74;

    v254 = v75;
    if (!v75)
    {
      v55 = 1;
      v20 = v266;
LABEL_233:

      goto LABEL_234;
    }
    objc_storeStrong((id *)&v8->_requestString, v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("requestSummary")));
    v77 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v76, v77) & 1) != 0)
      v78 = v76;
    else
      v78 = 0;
    v249 = v78;

    objc_storeStrong((id *)&v8->_requestSummary, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("priceSummary")));
    v80 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v79, v80) & 1) != 0)
      v81 = v79;
    else
      v81 = 0;
    v248 = v81;

    objc_storeStrong((id *)&v8->_priceSummary, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v266, "objectForKeyedSubscript:", CFSTR("contentRating")));
    v83 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v82, v83) & 1) != 0)
      v84 = v82;
    else
      v84 = 0;
    v85 = v84;

    v247 = v85;
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("name")));
    v87 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v86, v87) & 1) != 0)
      v88 = v86;
    else
      v88 = 0;
    v89 = v88;

    if (objc_msgSend(v89, "length"))
      v90 = (const __CFString *)v89;
    else
      v90 = CFSTR("0");
    ageRating = v8->_ageRating;
    v8->_ageRating = &v90->isa;

    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("approverDsId")));
    v93 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v92, v93) & 1) != 0)
      v94 = v92;
    else
      v94 = 0;
    v95 = v94;

    v245 = v95;
    v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "stringValue"));
    approverDSID = v8->_approverDSID;
    v8->_approverDSID = (NSString *)v96;

    v98 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v98, "setDateFormat:", CFSTR("YYYY-MM-dd'T'HH:mm:ss.SZZZ"));
    v99 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("requestCreatedUtc")));
    v250 = (void *)v99;
    if (v99)
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "dateFromString:", v99));
      if (v100)
        goto LABEL_100;
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
      if (!v101)
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
      v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "OSLogObject"));
      if (!os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
      {
LABEL_99:

        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v24 = v265;
LABEL_100:
        objc_storeStrong((id *)&v8->_createdDate, v100);
        v107 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("approvalStatusUpdatedUtc")));
        v251 = v100;
        v246 = v89;
        v243 = (void *)v107;
        if (v107)
        {
          v108 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "dateFromString:", v107));
          v109 = v108;
          if (v108)
          {
            v110 = v108;
            modifiedDate = v8->_modifiedDate;
            v8->_modifiedDate = v110;
          }
          else
          {
            modifiedDate = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            objc_storeStrong((id *)&v8->_modifiedDate, modifiedDate);
          }

          v100 = v251;
        }
        else
        {
          v112 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v109 = v8->_modifiedDate;
          v8->_modifiedDate = (NSDate *)v112;
        }

        v113 = objc_claimAutoreleasedReturnValue(+[ApprovalRequest createUniqueIDFromRequestID:andCreatedDate:](ApprovalRequest, "createUniqueIDFromRequestID:andCreatedDate:", v8->_requestIdentifier, v100));
        uniqueIdentifier = v8->_uniqueIdentifier;
        v8->_uniqueIdentifier = (NSString *)v113;

        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
        v116 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v115, v116) & 1) != 0)
          v117 = v115;
        else
          v117 = 0;
        v118 = v117;

        if (v118)
        {
          v119 = (NSString *)v118;
          itemBundleID = (__CFString *)v8->_itemBundleID;
          v8->_itemBundleID = v119;
        }
        else
        {
          v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "objectForKeyedSubscript:", CFSTR("bundleIdentifier")));
          v122 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v121, v122) & 1) != 0)
            v123 = v121;
          else
            v123 = 0;
          itemBundleID = (__CFString *)v123;

          if (itemBundleID)
            v124 = itemBundleID;
          else
            v124 = CFSTR("Unknown");
          objc_storeStrong((id *)&v8->_itemBundleID, v124);
        }

        v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "objectForKeyedSubscript:", CFSTR("localizedName")));
        v126 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v125, v126) & 1) != 0)
          v127 = v125;
        else
          v127 = 0;
        v128 = v127;

        if (v128)
        {
          v129 = (NSString *)v128;
          itemTitle = v8->_itemTitle;
          v8->_itemTitle = v129;
        }
        else
        {
          v131 = v12;
          v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "objectForKeyedSubscript:", CFSTR("localizedName")));
          v133 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v132, v133) & 1) != 0)
            v134 = v132;
          else
            v134 = 0;
          itemTitle = (NSString *)v134;

          objc_storeStrong((id *)&v8->_itemTitle, v134);
          v12 = v131;
          v24 = v265;
        }
        v244 = v98;

        if (v264)
          v135 = v264;
        else
          v135 = (id)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", CFSTR("ACTION_APPROVE")));
        v136 = v135;

        if (v262)
          v137 = v262;
        else
          v137 = (id)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", CFSTR("ACTION_DECLINE")));
        v138 = v137;

        v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("requesterFirstName")));
        v140 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v139, v140) & 1) != 0)
          v141 = v139;
        else
          v141 = 0;
        v142 = (__CFString *)v141;

        if (v142)
          v143 = v142;
        else
          v143 = CFSTR("Unknown");
        objc_storeStrong((id *)&v8->_requesterName, v143);

        v144 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:bag:](Localizations, "stringWithKey:bag:", CFSTR("NOTIFICATION_TITLE_APPROVER"), v7));
        v145 = v144;
        if (v144)
          v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v144, CFSTR("%@"), 0, v8->_requesterName));
        v146 = v144;

        v262 = v138;
        v264 = v136;
        v242 = v146;
        if (!v146)
        {
          v55 = 1;
          v20 = v266;
          v151 = v246;
LABEL_232:

          goto LABEL_233;
        }
        v147 = -[RequestLocalizations initWithApprove:body:decline:title:]([RequestLocalizations alloc], "initWithApprove:body:decline:title:", v136, v254, v138, v146);
        if (!v147)
        {
          v55 = 1;
          v20 = v266;
          v151 = v246;
LABEL_231:

          goto LABEL_232;
        }
        v241 = v147;
        objc_storeStrong((id *)&v8->_localizations, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("priceString")));
        v149 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v148, v149) & 1) != 0)
          v150 = v148;
        else
          v150 = 0;
        v152 = (__CFString *)v150;

        if (v152)
          v153 = v152;
        else
          v153 = CFSTR("Unknown");
        objc_storeStrong((id *)&v8->_localizedPrice, v153);

        v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v266, "objectForKeyedSubscript:", CFSTR("offerName")));
        v155 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v154, v155) & 1) != 0)
          v156 = v154;
        else
          v156 = 0;
        v157 = (__CFString *)v156;

        if (v157)
          v158 = v157;
        else
          v158 = CFSTR("Unknown");
        v240 = v158;

        objc_storeStrong((id *)&v8->_offerName, v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("previewURL")));
        v160 = objc_opt_class(NSString);
        v253 = v12;
        if ((objc_opt_isKindOfClass(v159, v160) & 1) != 0)
          v161 = v159;
        else
          v161 = 0;
        v162 = v161;

        v239 = v162;
        if (v162)
        {
          previewURL = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v162));
          objc_storeStrong((id *)&v8->_previewURL, previewURL);
        }
        else
        {
          previewURL = v8->_previewURL;
          v8->_previewURL = 0;
        }

        p_productType = (void **)&v8->_productType;
        objc_storeStrong((id *)&v8->_productType, obj);
        v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "objectForKeyedSubscript:", CFSTR("productTypeName")));
        v166 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v165, v166) & 1) != 0)
          v167 = v165;
        else
          v167 = 0;
        v168 = (__CFString *)v167;

        if (v168)
          v169 = v168;
        else
          v169 = CFSTR("Unknown");
        v170 = v169;

        objc_storeStrong((id *)&v8->_productTypeName, v169);
        obja = v170;
        if ((-[__CFString isEqualToString:](v170, "isEqualToString:", CFSTR("Subscription")) & 1) != 0)
        {
          v171 = CFSTR("SUB");
          v172 = &AKAuthenticationDSIDKey_ptr;
        }
        else
        {
          v172 = &AKAuthenticationDSIDKey_ptr;
          if (!-[__CFString isEqualToString:](v170, "isEqualToString:", CFSTR("AudioBook")))
            goto LABEL_174;
          v171 = CFSTR("PUB");
        }
        v173 = *p_productType;
        *p_productType = (void *)v171;

LABEL_174:
        v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "objectForKeyedSubscript:", CFSTR("url")));
        v175 = objc_opt_class(v172[31]);
        if ((objc_opt_isKindOfClass(v174, v175) & 1) != 0)
          v176 = v174;
        else
          v176 = 0;
        v177 = v176;

        v238 = v177;
        if (v177)
        {
          productURL = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v177));
          objc_storeStrong((id *)&v8->_productURL, productURL);
        }
        else
        {
          productURL = v8->_productURL;
          v8->_productURL = 0;
        }

        v12 = v253;
        v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("requesterDsId")));
        v180 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v179, v180) & 1) != 0)
          v181 = v179;
        else
          v181 = 0;
        v182 = v181;

        v183 = objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "stringValue"));
        requesterDSID = v8->_requesterDSID;
        v8->_requesterDSID = (NSString *)v183;

        objc_storeStrong((id *)&v8->_requestInfo, v257);
        v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("approvalStatus")));
        v186 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v185, v186) & 1) != 0)
          v187 = v185;
        else
          v187 = 0;
        v188 = v187;

        v258 = v188;
        if (v188)
          v189 = (uint64_t)objc_msgSend(v188, "integerValue");
        else
          v189 = -2;
        v8->_status = v189;
        v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v266, "objectForKeyedSubscript:", CFSTR("userRating")));
        v191 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v190, v191) & 1) != 0)
          v192 = v190;
        else
          v192 = 0;
        v193 = v192;

        if (v193)
        {
          v194 = v193;
        }
        else
        {
          v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "objectForKeyedSubscript:", CFSTR("userRating")));
          v196 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v195, v196) & 1) != 0)
            v197 = v195;
          else
            v197 = 0;
          v198 = v197;

          v194 = v198;
        }

        v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "objectForKeyedSubscript:", CFSTR("value")));
        v200 = objc_opt_class(NSNumber);
        v236 = v194;
        if ((objc_opt_isKindOfClass(v199, v200) & 1) != 0)
          v201 = v199;
        else
          v201 = 0;
        v20 = v266;
        v202 = v201;

        if (v202)
          v203 = (_UNKNOWN **)v202;
        else
          v203 = &off_1000159E8;
        objc_storeStrong((id *)&v8->_starRating, v203);

        status = v8->_status;
        v237 = v182;
        if (!status)
        {
          v205 = CFSTR("declinedString");
          goto LABEL_208;
        }
        if (status == 1)
        {
          v205 = CFSTR("approvalString");
LABEL_208:
          v206 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "objectForKeyedSubscript:", v205));
          v207 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v206, v207) & 1) != 0)
            v208 = v206;
          else
            v208 = 0;
          v212 = (__CFString *)v208;
          v213 = v212;
LABEL_214:
          v214 = v212;

          v213 = v214;
LABEL_215:
          if (v213)
            v215 = v213;
          else
            v215 = &stru_1000150A0;
          objc_storeStrong((id *)&v8->_itemDescription, v215);
          v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "objectForKeyedSubscript:", CFSTR("coverArtImageUrl")));
          v217 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v216, v217) & 1) != 0)
            v218 = v216;
          else
            v218 = 0;
          v219 = v218;

          if (v219)
          {
            v220 = (__CFString *)v219;
          }
          else
          {
            v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v270, "objectForKeyedSubscript:", CFSTR("coverArtImageUrl")));
            v222 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v221, v222) & 1) != 0)
              v223 = v221;
            else
              v223 = 0;
            v224 = v223;

            v220 = (__CFString *)v224;
          }

          if (v220)
            v225 = v220;
          else
            v225 = CFSTR("Unknown");
          objc_storeStrong((id *)&v8->_thumbnailURLString, v225);

          v55 = 0;
          v24 = v265;
          v151 = v246;
          v147 = v241;
          goto LABEL_231;
        }
        v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v266, "objectForKeyedSubscript:", CFSTR("subtitle")));
        v210 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v209, v210) & 1) != 0)
          v211 = v209;
        else
          v211 = 0;
        v228 = v211;

        if (v228)
        {
          v213 = (__CFString *)v228;

        }
        else
        {
          v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "objectForKeyedSubscript:", CFSTR("subtitle")));
          v230 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v229, v230) & 1) != 0)
            v231 = v229;
          else
            v231 = 0;
          v232 = v231;

          v213 = (__CFString *)v232;
          if (!v213)
          {
LABEL_247:
            v233 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v266, "objectForKeyedSubscript:", CFSTR("artistName")));
            v234 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v233, v234) & 1) != 0)
              v235 = v233;
            else
              v235 = 0;
            v206 = v235;

            v212 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&amp;"),
                                     CFSTR("&")));
            goto LABEL_214;
          }
        }
        if (-[__CFString length](v213, "length"))
          goto LABEL_215;
        goto LABEL_247;
      }
      v103 = (id)objc_opt_class(v8);
      *(_DWORD *)buf = 138543618;
      v279 = v103;
      v280 = 2112;
      v281 = v250;
      v104 = "%{public}@: Failed To Parse Created Date. String Value: \"%@\";
      v105 = v102;
      v106 = 22;
    }
    else
    {
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
      if (!v101)
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
      v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "OSLogObject"));
      if (!os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
        goto LABEL_99;
      v103 = (id)objc_opt_class(v8);
      *(_DWORD *)buf = 138543362;
      v279 = v103;
      v104 = "%{public}@: Server Response Missing Created Date";
      v105 = v102;
      v106 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_FAULT, v104, buf, v106);

    goto LABEL_99;
  }
  v55 = 1;
  v20 = v266;
LABEL_234:
  v56 = v271;

LABEL_235:
  if (!v55)
  {
LABEL_237:
    v226 = v8;
    goto LABEL_238;
  }
  v226 = 0;
LABEL_238:

  return v226;
}

+ (id)createUniqueIDFromRequestID:(id)a3 andCreatedDate:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  v6 = a3;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld_%@"), (uint64_t)v7, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OSLogObject"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = (id)objc_opt_class(a1);
    v15 = 2112;
    v16 = v8;
    v11 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Generated UniqueID from request: %@", buf, 0x16u);

  }
  return v8;
}

- (void)updateStatus:(int64_t)a3 withApproverDSID:(id)a4
{
  self->_status = a3;
  objc_storeStrong((id *)&self->_approverDSID, a4);
}

- (BOOL)isSubscription
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productTypeName](self, "productTypeName"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Subscription"));

  return v3;
}

- (id)metricsApp
{
  void *v3;
  unint64_t v4;
  __CFString **v5;
  void *v6;
  int64_t v7;

  if (-[ApprovalRequest isSubscription](self, "isSubscription"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemBundleID](self, "itemBundleID"));
    v4 = +[ApprovalRequest lobForSubscription:](ApprovalRequest, "lobForSubscription:", v3);

    if (v4 < 9)
    {
      v5 = &off_100014608[v4];
      return *v5;
    }
    return CFSTR("xp_its_main");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productType](self, "productType"));
    v7 = +[ApprovalRequest lobForProductType:](ApprovalRequest, "lobForProductType:", v6);

    if ((unint64_t)(v7 - 1) < 3)
    {
      v5 = &off_100014650 + v7 - 1;
      return *v5;
    }
    return CFSTR("unknown");
  }
}

- (id)metricsTopic
{
  void *v3;
  int64_t v4;
  void *v6;
  int64_t v7;
  const __CFString *v8;

  if (-[ApprovalRequest isSubscription](self, "isSubscription"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemBundleID](self, "itemBundleID"));
    v4 = +[ApprovalRequest lobForSubscription:](ApprovalRequest, "lobForSubscription:", v3);

    if ((unint64_t)(v4 - 3) >= 6)
      return CFSTR("xp_its_main");
    else
      return *(&off_100014668 + v4 - 3);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productType](self, "productType"));
    v7 = +[ApprovalRequest lobForProductType:](ApprovalRequest, "lobForProductType:", v6);

    v8 = CFSTR("xp_its_main");
    if (v7 == 3)
      v8 = CFSTR("xp_its_music_main");
    if (v7 == 1)
      return CFSTR("xp_ase_appstore_ue");
    else
      return (id)v8;
  }
}

- (int64_t)lineOfBusiness
{
  void *v3;
  int64_t v4;
  int64_t v5;

  if (-[ApprovalRequest isSubscription](self, "isSubscription"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemBundleID](self, "itemBundleID"));
    v4 = +[ApprovalRequest lobForSubscription:](ApprovalRequest, "lobForSubscription:", v3);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productType](self, "productType"));
    v4 = +[ApprovalRequest lobForProductType:](ApprovalRequest, "lobForProductType:", v3);
  }
  v5 = v4;

  return v5;
}

+ (int64_t)lobForSubscription:(id)a3
{
  void *v3;
  int64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.tv")) & 1) != 0)
  {
    v4 = 8;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.music")) & 1) != 0)
      goto LABEL_4;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.appleone")) & 1) != 0)
    {
      v4 = 6;
      goto LABEL_15;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.fitness")) & 1) != 0)
    {
      v4 = 7;
      goto LABEL_15;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0)
    {
      v4 = 4;
      goto LABEL_15;
    }
    if (!v3)
    {
LABEL_4:
      v4 = 3;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")))
    {
      v4 = 3;
    }
    else
    {
      v4 = 0;
    }
  }
LABEL_15:

  return v4;
}

+ (int64_t)lobForProductType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("A")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ASB")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("C")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("G")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("P")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Q")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("S")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("V")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("B")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("W")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("PUB")) & 1) == 0)
    {
      objc_msgSend(v3, "isEqualToString:", CFSTR("PC"));
    }
    v4 = 0;
  }

  return v4;
}

- (id)compile
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest createdDate](self, "createdDate"));
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, CFSTR("createdTimeInterval"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest modifiedDate](self, "modifiedDate"));
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, CFSTR("modifiedTimeInterval"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requestIdentifier](self, "requestIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v8, CFSTR("identifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest uniqueIdentifier](self, "uniqueIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v9, CFSTR("uniqueIdentifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemIdentifier](self, "itemIdentifier"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v10, CFSTR("itemIdentifier"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest ageRating](self, "ageRating"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v11, CFSTR("ageRating"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest approverDSID](self, "approverDSID"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v12, CFSTR("approverDSID"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemBundleID](self, "itemBundleID"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v13, CFSTR("bundleID"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ApprovalRequest canSendViaMessages](self, "canSendViaMessages")));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v14, CFSTR("canSendViaMessages"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemTitle](self, "itemTitle"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v15, CFSTR("itemTitle"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest itemDescription](self, "itemDescription"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v16, CFSTR("itemDescription"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest localizations](self, "localizations"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "compile"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v18, CFSTR("localizations"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest offerName](self, "offerName"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v19, CFSTR("offerName"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ApprovalRequest isMocked](self, "isMocked")));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v20, CFSTR("mocked"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest localizedPrice](self, "localizedPrice"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v21, CFSTR("localizedPrice"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest previewURL](self, "previewURL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "absoluteString"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v23, CFSTR("previewURL"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productType](self, "productType"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v24, CFSTR("productType"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productTypeName](self, "productTypeName"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v25, CFSTR("productTypeName"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest productURL](self, "productURL"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "absoluteString"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v27, CFSTR("productURL"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest thumbnailURLString](self, "thumbnailURLString"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v28, CFSTR("thumbnailURL"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requesterDSID](self, "requesterDSID"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v29, CFSTR("requesterDSID"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requesterName](self, "requesterName"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v30, CFSTR("requesterName"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest starRating](self, "starRating"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v31, CFSTR("starRating"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ApprovalRequest status](self, "status")));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v32, CFSTR("status"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requestString](self, "requestString"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v33, CFSTR("requestString"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest requestSummary](self, "requestSummary"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v34, CFSTR("requestSummary"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest priceSummary](self, "priceSummary"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v35, CFSTR("priceSummary"));

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest compile](self, "compile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApprovalRequest ap_generateDescriptionWithSubObjects:](self, "ap_generateDescriptionWithSubObjects:", v3));

  return (NSString *)v4;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (RequestLocalizations)localizations
{
  return self->_localizations;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (NSString)approverDSID
{
  return self->_approverDSID;
}

- (BOOL)canSendViaMessages
{
  return self->_canSendViaMessages;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSString)localizedPrice
{
  return self->_localizedPrice;
}

- (NSString)itemBundleID
{
  return self->_itemBundleID;
}

- (BOOL)isMocked
{
  return self->_mocked;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (NSString)thumbnailURLString
{
  return self->_thumbnailURLString;
}

- (NSString)requesterName
{
  return self->_requesterName;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (NSNumber)starRating
{
  return self->_starRating;
}

- (NSString)requestString
{
  return self->_requestString;
}

- (NSString)requestSummary
{
  return self->_requestSummary;
}

- (NSString)priceSummary
{
  return self->_priceSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceSummary, 0);
  objc_storeStrong((id *)&self->_requestSummary, 0);
  objc_storeStrong((id *)&self->_requestString, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requesterName, 0);
  objc_storeStrong((id *)&self->_thumbnailURLString, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_itemBundleID, 0);
  objc_storeStrong((id *)&self->_localizedPrice, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_approverDSID, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
