@implementation RepairInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  void *v3;
  id v5;
  NSString *v6;
  NSString *FDRCAURL;
  uint64_t v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSString *v18;
  NSString *trustObjectURL;
  uint64_t v20;
  NSObject *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  NSString *v29;
  NSString *FDRDSURL;
  uint64_t v31;
  NSObject *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  NSString *v40;
  NSString *FDRSealingURL;
  uint64_t v42;
  NSObject *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  NSMutableSet *v59;
  NSMutableSet *partSPC;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  const __CFString *v65;
  uint64_t v66;
  NSObject *v67;
  const __CFString *v68;
  NSNumber *v69;
  NSNumber *timeoutPeriod;
  uint64_t v71;
  NSObject *v72;
  NSNumber *v73;
  NSDictionary *v74;
  NSDictionary *v75;
  NSDictionary *updateProperties;
  uint64_t v77;
  NSObject *v78;
  NSDictionary *v79;
  uint64_t v80;
  NSObject *v81;
  NSString *v82;
  NSString *KBBSerialNumber;
  uint64_t v84;
  NSObject *v85;
  NSString *v86;
  NSString *v87;
  NSString *KGBSerialNumber;
  uint64_t v89;
  NSObject *v90;
  NSString *v91;
  NSString *v92;
  NSString *mountPath;
  uint64_t v94;
  NSObject *v95;
  NSString *v96;
  NSNumber *v97;
  NSNumber *displayMaxDuration;
  uint64_t v99;
  NSObject *v100;
  NSNumber *v101;
  NSSet *v102;
  void *v103;
  NSArray *v104;
  NSArray *patchItems;
  uint64_t v106;
  NSObject *v107;
  NSArray *v108;
  NSString *v109;
  NSString *SOCKSHost;
  NSNumber *v111;
  NSNumber *SOCKSPort;
  uint64_t v113;
  NSObject *v114;
  NSString *v115;
  NSNumber *v116;
  uint64_t v117;
  NSObject *v118;
  const __CFString *v119;
  uint64_t v120;
  NSObject *v121;
  const __CFString *v122;
  uint64_t v123;
  NSObject *v124;
  const __CFString *v125;
  NSString *v126;
  NSString *keyBlob;
  uint64_t v128;
  NSObject *v129;
  NSString *v130;
  uint64_t v131;
  NSObject *v132;
  const __CFString *v133;
  uint64_t v134;
  NSObject *v135;
  const __CFString *v136;
  BOOL v137;
  char v139;
  uint8_t buf[4];
  void *v141;
  __int16 v142;
  NSNumber *v143;

  v5 = a3;
  v139 = 0;
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("CAURL"), CFSTR("https://gg.apple.com"), &v139));
  FDRCAURL = self->FDRCAURL;
  self->FDRCAURL = v6;

  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->FDRCAURL;
    *(_DWORD *)buf = 138412290;
    v141 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FDR CA URL: %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", self->FDRCAURL));
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
    v14 = objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("http"));
    if (v14
      || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme")),
          objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("https"))))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "host"));

      if (!v14)
      if (v15)
        goto LABEL_14;
    }
    else
    {

    }
  }
  v16 = handleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_100005B88();

  v139 = 1;
LABEL_14:
  v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("TrustObjectURL"), CFSTR("http://gg.apple.com/fdrtrustobject"), &v139));
  trustObjectURL = self->trustObjectURL;
  self->trustObjectURL = v18;

  v20 = handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = self->trustObjectURL;
    *(_DWORD *)buf = 138412290;
    v141 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "FDR Trust Object URL: %@", buf, 0xCu);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", self->trustObjectURL));
  if (!v23)
    goto LABEL_20;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scheme"));
  if (objc_msgSend(v24, "caseInsensitiveCompare:", CFSTR("http")))
  {

    goto LABEL_23;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scheme"));
  v26 = objc_msgSend(v25, "caseInsensitiveCompare:", CFSTR("https"));

  if (!v26)
  {
LABEL_20:
    v27 = handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100005B5C();

    v139 = 1;
  }
LABEL_23:
  v29 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("DSURL"), CFSTR("https://skl.apple.com"), &v139));
  FDRDSURL = self->FDRDSURL;
  self->FDRDSURL = v29;

  v31 = handleForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = self->FDRDSURL;
    *(_DWORD *)buf = 138412290;
    v141 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "FDR DS URL: %@", buf, 0xCu);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", self->FDRDSURL));
  if (!v34)
    goto LABEL_29;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "scheme"));
  if (!objc_msgSend(v35, "caseInsensitiveCompare:", CFSTR("http")))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "scheme"));
    v37 = objc_msgSend(v36, "caseInsensitiveCompare:", CFSTR("https"));

    if (v37)
      goto LABEL_32;
LABEL_29:
    v38 = handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_100005B30();

    v139 = 1;
    goto LABEL_32;
  }

LABEL_32:
  v40 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("SealingURL"), CFSTR("https://ig.apple.com"), &v139));
  FDRSealingURL = self->FDRSealingURL;
  self->FDRSealingURL = v40;

  v42 = handleForCategory(0);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = self->FDRSealingURL;
    *(_DWORD *)buf = 138412290;
    v141 = v44;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "FDR Sealing URL: %@", buf, 0xCu);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", self->FDRSealingURL));
  if (!v45)
    goto LABEL_38;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "scheme"));
  if (objc_msgSend(v46, "caseInsensitiveCompare:", CFSTR("http")))
  {

    goto LABEL_41;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "scheme"));
  v48 = objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("https"));

  if (!v48)
  {
LABEL_38:
    v49 = handleForCategory(0);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_100005B04();

    v139 = 1;
  }
LABEL_41:
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromRequiredKey:maxLength:failed:", CFSTR("partSPC"), 128, &v139));
  v52 = handleForCategory(0);
  v53 = objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v141 = v51;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "partSPC is %@", buf, 0xCu);
  }

  if ((unint64_t)objc_msgSend(v51, "length") <= 2)
  {
    v54 = handleForCategory(0);
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_100005A8C(v51, v55);

    v139 = 1;
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet characterSetWithCharactersInString:](NSMutableCharacterSet, "characterSetWithCharactersInString:", CFSTR(",")));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByTrimmingCharactersInSet:", v56));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "componentsSeparatedByString:", CFSTR(",")));
  v59 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v58));
  partSPC = self->partSPC;
  self->partSPC = v59;

  if (!-[NSMutableSet count](self->partSPC, "count"))
  {
    v61 = handleForCategory(0);
    v62 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_100005A10((id *)&self->partSPC, v62);

    v139 = 1;
  }
  self->doSeal = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("doSeal"), 1, &v139);
  v63 = handleForCategory(0);
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    if (self->doSeal)
      v65 = CFSTR("YES");
    else
      v65 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v141 = (void *)v65;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Do seal: %@", buf, 0xCu);
  }

  self->enableProxy = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("enableProxy"), 0, &v139);
  v66 = handleForCategory(0);
  v67 = objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    if (self->enableProxy)
      v68 = CFSTR("YES");
    else
      v68 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v141 = (void *)v68;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Enable Proxy : %@", buf, 0xCu);
  }

  v69 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("timeoutPeriod"), &off_100008A40, &off_100008A58, &off_100008A70, &v139));
  timeoutPeriod = self->timeoutPeriod;
  self->timeoutPeriod = v69;

  v71 = handleForCategory(0);
  v72 = objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    v73 = self->timeoutPeriod;
    *(_DWORD *)buf = 138412290;
    v141 = v73;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Timeout period : %@ s", buf, 0xCu);
  }

  v74 = objc_opt_new(NSDictionary);
  v75 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSDictionaryFromKey:defaultValue:failed:", CFSTR("updateProperties"), v74, &v139));
  updateProperties = self->updateProperties;
  self->updateProperties = v75;

  v77 = handleForCategory(0);
  v78 = objc_claimAutoreleasedReturnValue(v77);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    v79 = self->updateProperties;
    *(_DWORD *)buf = 138412290;
    v141 = v79;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "UpdateProperties:%@", buf, 0xCu);
  }

  if (!-[RepairInputs validateUpdateProperties:](self, "validateUpdateProperties:", self->updateProperties))
  {
    v80 = handleForCategory(0);
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      sub_1000059E4();

    v139 = 1;
  }
  v82 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("KBBSerialNumber"), 0, 0));
  KBBSerialNumber = self->KBBSerialNumber;
  self->KBBSerialNumber = v82;

  v84 = handleForCategory(0);
  v85 = objc_claimAutoreleasedReturnValue(v84);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    v86 = self->KBBSerialNumber;
    *(_DWORD *)buf = 138412290;
    v141 = v86;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "KBBSerialNumber is %@", buf, 0xCu);
  }

  v87 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("KGBSerialNumber"), 0, 0));
  KGBSerialNumber = self->KGBSerialNumber;
  self->KGBSerialNumber = v87;

  v89 = handleForCategory(0);
  v90 = objc_claimAutoreleasedReturnValue(v89);
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    v91 = self->KGBSerialNumber;
    *(_DWORD *)buf = 138412290;
    v141 = v91;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "KGBSerialNumber is %@", buf, 0xCu);
  }

  v92 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("MountPath"), 0, 0));
  mountPath = self->mountPath;
  self->mountPath = v92;

  v94 = handleForCategory(0);
  v95 = objc_claimAutoreleasedReturnValue(v94);
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    v96 = self->mountPath;
    *(_DWORD *)buf = 138412290;
    v141 = v96;
    _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "PDI mountPath is %@", buf, 0xCu);
  }

  v97 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("displayMaxDuration"), &off_100008A88, &off_100008AA0, &off_100008AB8, &v139));
  displayMaxDuration = self->displayMaxDuration;
  self->displayMaxDuration = v97;

  v99 = handleForCategory(0);
  v100 = objc_claimAutoreleasedReturnValue(v99);
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    v101 = self->displayMaxDuration;
    *(_DWORD *)buf = 138412290;
    v141 = v101;
    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Display max duration : %@ days", buf, 0xCu);
  }

  v102 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
  v104 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSArrayFromKey:types:maxLength:defaultValue:failed:", CFSTR("patchItems"), v103, 32, 0, &v139));
  patchItems = self->patchItems;
  self->patchItems = v104;

  v106 = handleForCategory(0);
  v107 = objc_claimAutoreleasedReturnValue(v106);
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    v108 = self->patchItems;
    *(_DWORD *)buf = 138412290;
    v141 = v108;
    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "patchItems is %@", buf, 0xCu);
  }

  v109 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("SOCKSHost"), 0, &v139));
  SOCKSHost = self->SOCKSHost;
  self->SOCKSHost = v109;

  v111 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("SOCKSPort"), &off_100008AD0, &off_100008AE8, 0, &v139));
  SOCKSPort = self->SOCKSPort;
  self->SOCKSPort = v111;

  v113 = handleForCategory(0);
  v114 = objc_claimAutoreleasedReturnValue(v113);
  if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
  {
    v115 = self->SOCKSHost;
    v116 = self->SOCKSPort;
    *(_DWORD *)buf = 138412546;
    v141 = v115;
    v142 = 2112;
    v143 = v116;
    _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "SOCKS Host: %@, SOCKS Port: %@", buf, 0x16u);
  }

  self->enableStagedSeal = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("enableStagedSeal"), 0, 0);
  v117 = handleForCategory(0);
  v118 = objc_claimAutoreleasedReturnValue(v117);
  if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
  {
    if (self->enableStagedSeal)
      v119 = CFSTR("YES");
    else
      v119 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v141 = (void *)v119;
    _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "enableStagedSeal is %@", buf, 0xCu);
  }

  self->ignoreStagedData = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("ignoreStagedData"), 0, 0);
  v120 = handleForCategory(0);
  v121 = objc_claimAutoreleasedReturnValue(v120);
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    if (self->ignoreStagedData)
      v122 = CFSTR("YES");
    else
      v122 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v141 = (void *)v122;
    _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "ignoreStagedData is %@", buf, 0xCu);
  }

  self->skipStageEAN = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("skipStageEAN"), 0, 0);
  v123 = handleForCategory(0);
  v124 = objc_claimAutoreleasedReturnValue(v123);
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    if (self->skipStageEAN)
      v125 = CFSTR("YES");
    else
      v125 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v141 = (void *)v125;
    _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "skipStageEAN is %@", buf, 0xCu);
  }

  v126 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("keyBlob"), 0, 0));
  keyBlob = self->keyBlob;
  self->keyBlob = v126;

  v128 = handleForCategory(0);
  v129 = objc_claimAutoreleasedReturnValue(v128);
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    v130 = self->keyBlob;
    *(_DWORD *)buf = 138412290;
    v141 = v130;
    _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "keyBlob: %@", buf, 0xCu);
  }

  self->allowSelfService = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("allowSelfService"), 0, 0);
  v131 = handleForCategory(0);
  v132 = objc_claimAutoreleasedReturnValue(v131);
  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
  {
    if (self->allowSelfService)
      v133 = CFSTR("YES");
    else
      v133 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v141 = (void *)v133;
    _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "allowSelfService: %@", buf, 0xCu);
  }

  self->allowUsedPart = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("allowUsedPart"), 0, 0);
  v134 = handleForCategory(0);
  v135 = objc_claimAutoreleasedReturnValue(v134);
  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
  {
    if (self->allowUsedPart)
      v136 = CFSTR("YES");
    else
      v136 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v141 = (void *)v136;
    _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "allowUsedPart: %@", buf, 0xCu);
  }

  v137 = v139 == 0;
  return v137;
}

- (BOOL)validateUpdateProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v21;
  NSObject *v22;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PrCL")));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PrCL")));
      v7 = objc_opt_class(NSString);
      isKindOfClass = objc_opt_isKindOfClass(v6, v7);

      if ((isKindOfClass & 1) != 0)
      {
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PrCL")));
        v10 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("^[a-fA-F0-9]{512}+$"), 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstMatchInString:options:range:", v9, 0, 0, -[NSObject length](v9, "length")));
        v12 = handleForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        v14 = v13;
        if (v11)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v21 = 138412290;
            v22 = v9;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "matched property:%@", (uint8_t *)&v21, 0xCu);
          }

          v15 = 1;
          goto LABEL_15;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_100005BB4((uint64_t)v9, v14, v19);

      }
      else
      {
        v16 = handleForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_100005C20(v9, v17, v18);
      }
      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  v15 = 1;
LABEL_16:

  return v15;
}

- (NSString)FDRCAURL
{
  return self->FDRCAURL;
}

- (NSString)trustObjectURL
{
  return self->trustObjectURL;
}

- (NSString)FDRDSURL
{
  return self->FDRDSURL;
}

- (NSString)FDRSealingURL
{
  return self->FDRSealingURL;
}

- (NSString)KGBSerialNumber
{
  return self->KGBSerialNumber;
}

- (NSString)KBBSerialNumber
{
  return self->KBBSerialNumber;
}

- (NSArray)patchItems
{
  return self->patchItems;
}

- (NSString)SOCKSHost
{
  return self->SOCKSHost;
}

- (NSNumber)SOCKSPort
{
  return self->SOCKSPort;
}

- (NSMutableSet)partSPC
{
  return self->partSPC;
}

- (NSDictionary)updateProperties
{
  return self->updateProperties;
}

- (BOOL)doSeal
{
  return self->doSeal;
}

- (NSString)mountPath
{
  return self->mountPath;
}

- (NSNumber)timeoutPeriod
{
  return self->timeoutPeriod;
}

- (BOOL)enableProxy
{
  return self->enableProxy;
}

- (NSNumber)displayMaxDuration
{
  return self->displayMaxDuration;
}

- (BOOL)enableStagedSeal
{
  return self->enableStagedSeal;
}

- (BOOL)ignoreStagedData
{
  return self->ignoreStagedData;
}

- (BOOL)skipStageEAN
{
  return self->skipStageEAN;
}

- (NSString)keyBlob
{
  return self->keyBlob;
}

- (BOOL)allowSelfService
{
  return self->allowSelfService;
}

- (BOOL)allowUsedPart
{
  return self->allowUsedPart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keyBlob, 0);
  objc_storeStrong((id *)&self->displayMaxDuration, 0);
  objc_storeStrong((id *)&self->timeoutPeriod, 0);
  objc_storeStrong((id *)&self->mountPath, 0);
  objc_storeStrong((id *)&self->updateProperties, 0);
  objc_storeStrong((id *)&self->partSPC, 0);
  objc_storeStrong((id *)&self->SOCKSPort, 0);
  objc_storeStrong((id *)&self->SOCKSHost, 0);
  objc_storeStrong((id *)&self->patchItems, 0);
  objc_storeStrong((id *)&self->KBBSerialNumber, 0);
  objc_storeStrong((id *)&self->KGBSerialNumber, 0);
  objc_storeStrong((id *)&self->FDRSealingURL, 0);
  objc_storeStrong((id *)&self->FDRDSURL, 0);
  objc_storeStrong((id *)&self->trustObjectURL, 0);
  objc_storeStrong((id *)&self->FDRCAURL, 0);
}

@end
