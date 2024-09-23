@implementation ASFReceipt

+ (id)receiptFromBundleAtPath:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASFReceipt receiptFromBundleAtURL:](ASFReceipt, "receiptFromBundleAtURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)receiptFromBundleAtURL:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = a3;
  if (!objc_msgSend(v3, "isFileURL"))
  {
    v10 = 0;
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v4 = v3;
  objc_opt_self();
  v5 = v4;
  objc_opt_self();
  v14 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithURL:allowPlaceholder:error:", v5, 0, &v14);

  objc_msgSend(v6, "dataContainerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("StoreKit"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isProfileValidated"))
    v9 = CFSTR("sandboxReceipt");
  else
    v9 = CFSTR("receipt");
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_8;
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASFReceipt receiptWithContentsOfFile:](ASFReceipt, "receiptWithContentsOfFile:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

+ (id)receiptWithContentsOfFile:(id)a3
{
  id v3;
  ASFReceipt *v4;

  v3 = a3;
  v4 = -[ASFReceipt initWithContentsOfFile:]([ASFReceipt alloc], "initWithContentsOfFile:", v3);

  return v4;
}

+ (id)receiptWithData:(id)a3
{
  id v3;
  ASFReceipt *v4;

  v3 = a3;
  v4 = -[ASFReceipt initWithData:]([ASFReceipt alloc], "initWithData:", v3);

  return v4;
}

- (ASFReceipt)initWithContentsOfFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ASFReceipt *v11;
  NSObject *v13;
  NSString *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    v6 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v5, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      v10 = objc_msgSend(v8, "code");

      if (v10 == 260)
        goto LABEL_16;
    }
    else
    {

    }
    if (ASFLogHandleForCategory_onceToken != -1)
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    v13 = ASFLogHandleForCategory_logHandles_0;
    if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_error_impl(&dword_20D881000, v13, OS_LOG_TYPE_ERROR, "Error reading receipt: %{public}@", buf, 0xCu);
    }
  }
LABEL_16:

  if (!v6)
    goto LABEL_8;
  v11 = -[ASFReceipt initWithData:](self, "initWithData:", v6);
  if (!v11)
    goto LABEL_10;
  v14 = v5;
  self = (ASFReceipt *)v11->_path;
  v11->_path = v14;
LABEL_9:

LABEL_10:
  return v11;
}

- (ASFReceipt)initWithData:(id)a3
{
  id v4;
  ASFReceipt *v5;
  uint64_t v6;
  NSMutableArray *mutableIAPs;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  _UNKNOWN *__ptr32 *v12;
  BOOL v13;
  uint64_t v14;
  NSArray *iaps;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  _QWORD *v28;
  NSObject *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  SEL v33;
  id v34;
  _QWORD *v35;
  const char *v36;
  uint64_t v37;
  NSString *receiptType;
  uint64_t v39;
  NSString *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  NSNumber *itemID;
  uint64_t v45;
  NSNumber *v46;
  id v47;
  const char *v48;
  void *v49;
  id Property;
  uint64_t v51;
  NSString *bundleID;
  uint64_t v53;
  NSString *v54;
  uint64_t v55;
  NSString *bundleVersion;
  uint64_t v57;
  NSString *v58;
  unint64_t v59;
  _UNKNOWN *__ptr32 *v60;
  const char *v61;
  id v62;
  const char *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSString *opaqueDSIDString;
  id v70;
  const char *v71;
  void *v72;
  NSData *v73;
  NSData *sha1;
  void *v75;
  NSData *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSDate *purchaseDate;
  uint64_t v82;
  NSDate *v83;
  uint64_t v84;
  NSNumber *frToolVersion;
  uint64_t v86;
  NSNumber *v87;
  uint64_t v88;
  NSString *parentalControls;
  uint64_t v90;
  NSString *v91;
  void *v92;
  uint64_t v93;
  NSString *developerID;
  uint64_t v95;
  NSString *v96;
  void *v97;
  uint64_t v98;
  NSDate *creationDate;
  uint64_t v100;
  NSDate *v101;
  uint64_t v102;
  NSString *frAppVersion;
  uint64_t v104;
  NSString *v105;
  void *v106;
  uint64_t v107;
  NSString *hwtype;
  uint64_t v109;
  NSString *v110;
  void *v111;
  uint64_t v112;
  NSString *downloadID;
  uint64_t v114;
  NSString *v115;
  void *v116;
  uint64_t v117;
  NSString *installerVersionID;
  uint64_t v119;
  NSString *v120;
  id v121;
  const char *v122;
  void *v123;
  id v124;
  id v125;
  _QWORD *v126;
  _QWORD *v127;
  void *v128;
  void *v129;
  void *v130;
  SEL v131;
  id v132;
  uint64_t v133;
  const char *v134;
  void *v135;
  void *v136;
  void *v137;
  ptrdiff_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  NSDate *expirationDate;
  uint64_t v145;
  NSDate *v146;
  void *v147;
  uint64_t v148;
  NSDate *renewalDate;
  uint64_t v150;
  NSDate *v151;
  uint64_t v152;
  NSString *organizationDisplayName;
  uint64_t v154;
  NSString *v155;
  uint64_t v156;
  NSString *cancellationReason;
  uint64_t v158;
  NSString *v159;
  id v160;
  const char *v161;
  void *v162;
  id v163;
  uint64_t v164;
  const char *v165;
  id v166;
  const char *v167;
  void *v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  NSString *v172;
  uint64_t v173;
  NSObject *v174;
  NSObject *v175;
  NSObject *v176;
  NSObject *v177;
  uint64_t v178;
  NSObject *v179;
  int v180;
  int v181;
  int i;
  const __CFDate *v183;
  uint64_t CertificateList;
  uint64_t *v185;
  __CFArray *Mutable;
  uint64_t v187;
  uint64_t *v188;
  const __CFData *v189;
  const __CFData *v190;
  SecCertificateRef v191;
  SecCertificateRef v192;
  uint64_t v193;
  NSObject *v194;
  const char *v195;
  NSObject *v196;
  uint64_t v197;
  __SecTrust *v198;
  CFMutableArrayRef v199;
  uint64_t v200;
  uint64_t v201;
  char v202;
  char v203;
  SecPolicyRef v204;
  __CFDictionary *v205;
  void *v206;
  SecPolicyRef v207;
  SecPolicyRef v208;
  OSStatus v209;
  BOOL v210;
  CFErrorRef v211;
  NSObject *v212;
  id v213;
  _QWORD *v214;
  _QWORD *v215;
  void *v216;
  void *v217;
  void *context;
  objc_super v219;
  CFErrorRef error;
  uint8_t buf[8];
  __int128 v222;
  uint64_t v223;

  v223 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v219.receiver = self;
  v219.super_class = (Class)ASFReceipt;
  v5 = -[ASFReceipt init](&v219, sel_init);
  if (!v5)
    goto LABEL_43;
  v6 = objc_opt_new();
  mutableIAPs = v5->_mutableIAPs;
  v5->_mutableIAPs = (NSMutableArray *)v6;

  if (!objc_msgSend(v4, "length"))
    goto LABEL_27;
  v8 = v4;
  *(_QWORD *)&v222 = 0;
  if (SecCmsDecoderCreate())
  {
    if (!v5->_verbose)
      goto LABEL_22;
    if (ASFLogHandleForCategory_onceToken != -1)
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    v9 = ASFLogHandleForCategory_logHandles_0;
    if (!os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v10 = "Could not create decoder";
LABEL_21:
    _os_log_error_impl(&dword_20D881000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
LABEL_22:
    SecCmsDecoderDestroy();

    goto LABEL_23;
  }
  v11 = objc_retainAutorelease(v8);
  v12 = (_UNKNOWN *__ptr32 *)objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");
  if (SecCmsDecoderUpdate())
  {
    if (!v5->_verbose)
      goto LABEL_22;
    if (ASFLogHandleForCategory_onceToken != -1)
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    v9 = ASFLogHandleForCategory_logHandles_0;
    if (!os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v10 = "Could not read data";
    goto LABEL_21;
  }
  if (SecCmsDecoderFinish())
  {
    if (!v5->_verbose)
      goto LABEL_22;
    if (ASFLogHandleForCategory_onceToken != -1)
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    v9 = ASFLogHandleForCategory_logHandles_0;
    if (!os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v10 = "Could not parse data";
    goto LABEL_21;
  }

  v24 = (_QWORD *)MEMORY[0x212BAAA5C](0);
  if (!v24 || !*v24)
  {
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v176 = ASFLogHandleForCategory_logHandles_0;
      v13 = 0;
      if (!os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      LOWORD(v222) = 0;
      _os_log_impl(&dword_20D881000, v176, OS_LOG_TYPE_DEFAULT, "No content", (uint8_t *)&v222, 2u);
    }
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v24[1], *v24);
  +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v25, 0);
  v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26 || v26[2] != 17)
  {
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v179 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        _os_log_error_impl(&dword_20D881000, v179, OS_LOG_TYPE_ERROR, "Failed to parse data", (uint8_t *)&v222, 2u);
      }
    }

    goto LABEL_23;
  }
  v216 = v25;
  v28 = v26;
  if (v5->_verbose)
  {
    if (ASFLogHandleForCategory_onceToken != -1)
      dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
    v29 = ASFLogHandleForCategory_logHandles_0;
    if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v222) = 0;
      _os_log_impl(&dword_20D881000, v29, OS_LOG_TYPE_DEFAULT, "Parsing receipt", (uint8_t *)&v222, 2u);
    }
  }
  -[ASFAsn1SetToken nextToken]((uint64_t)v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = 0x253ECD000uLL;
    v32 = 0x253ECD000uLL;
    v215 = v28;
    while (1)
    {
      context = (void *)MEMORY[0x212BAAB1C]();
      v34 = objc_getProperty(v30, v33, 24, 1);
      +[ASFAsn1ReceiptToken readFromBuffer:](v31 + 1472, v34);
      v35 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      if (v35)
        break;
LABEL_193:

      objc_autoreleasePoolPop(context);
      -[ASFAsn1SetToken nextToken]((uint64_t)v28);
      v173 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v173;
      if (!v173)
        goto LABEL_226;
    }
    switch(v35[1])
    {
      case 0:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v37 = objc_claimAutoreleasedReturnValue();
        receiptType = v5->_receiptType;
        v5->_receiptType = (NSString *)v37;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v39 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v5->_receiptType;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v40;
            v41 = v39;
            v42 = "Receipt type: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 1:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35));
        v43 = objc_claimAutoreleasedReturnValue();
        itemID = v5->_itemID;
        v5->_itemID = (NSNumber *)v43;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v45 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v46 = v5->_itemID;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v46;
            v41 = v45;
            v42 = "AdamID: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 2:
        v47 = objc_getProperty(v35, v36, 24, 1);
        v49 = v47;
        if (v47)
          Property = objc_getProperty(v47, v48, 24, 1);
        else
          Property = 0;
        objc_storeStrong((id *)&v5->_bundleIDData, Property);

        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v51 = objc_claimAutoreleasedReturnValue();
        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v51;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v53 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v54 = v5->_bundleID;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v54;
            v41 = v53;
            v42 = "BundleID: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 3:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v55 = objc_claimAutoreleasedReturnValue();
        bundleVersion = v5->_bundleVersion;
        v5->_bundleVersion = (NSString *)v55;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v57 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v58 = v5->_bundleVersion;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v58;
            v41 = v57;
            v42 = "Application version: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 4:
        v59 = v31;
        v60 = v12;
        if (!-[ASFAsn1ReceiptToken contentIsAnInteger]((uint64_t)v35))
          goto LABEL_180;
        v62 = objc_getProperty(v35, v61, 24, 1);
        v64 = v62;
        if (v62)
          v62 = objc_getProperty(v62, v63, 24, 1);
        v65 = v62;
        v66 = objc_msgSend(v65, "length");

        if (v66)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "stringValue");
          v68 = objc_claimAutoreleasedReturnValue();
          opaqueDSIDString = v5->_opaqueDSIDString;
          v5->_opaqueDSIDString = (NSString *)v68;

        }
        else
        {
LABEL_180:
          v160 = objc_getProperty(v35, v61, 24, 1);
          v162 = v160;
          if (v160)
            v160 = objc_getProperty(v160, v161, 24, 1);
          v163 = v160;
          v164 = objc_msgSend(v163, "length");

          if (!v164)
          {
LABEL_187:
            v12 = v60;
            v31 = v59;
            v32 = 0x253ECD000uLL;
            if (v5->_verbose)
            {
              if (ASFLogHandleForCategory_onceToken != -1)
                dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
              v171 = ASFLogHandleForCategory_logHandles_0;
              if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
              {
                v172 = v5->_opaqueDSIDString;
                LODWORD(v222) = 138543362;
                *(_QWORD *)((char *)&v222 + 4) = v172;
                v41 = v171;
                v42 = "DSID: %{public}@";
                goto LABEL_192;
              }
            }
            goto LABEL_193;
          }
          v166 = objc_getProperty(v35, v165, 24, 1);
          v168 = v166;
          if (v166)
            v169 = objc_getProperty(v166, v167, 24, 1);
          else
            v169 = 0;
          objc_storeStrong((id *)&v5->_opaqueDSIDData, v169);

          -[NSData base64EncodedStringWithOptions:](v5->_opaqueDSIDData, "base64EncodedStringWithOptions:", 0);
          v170 = objc_claimAutoreleasedReturnValue();
          v67 = v5->_opaqueDSIDString;
          v5->_opaqueDSIDString = (NSString *)v170;
        }

        goto LABEL_187;
      case 5:
        v70 = objc_getProperty(v35, v36, 24, 1);
        v72 = v70;
        if (v70)
          v70 = objc_getProperty(v70, v71, 24, 1);
        v73 = (NSData *)v70;

        sha1 = v5->_sha1;
        v5->_sha1 = v73;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v75 = (void *)ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v76 = v5->_sha1;
            v77 = v75;
            -[NSData base64EncodedStringWithOptions:](v76, "base64EncodedStringWithOptions:", 0);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v78;
            _os_log_impl(&dword_20D881000, v77, OS_LOG_TYPE_DEFAULT, "SHA1: %{public}@", (uint8_t *)&v222, 0xCu);

          }
        }
        goto LABEL_193;
      case 8:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        _readStringDate(v79);
        v80 = objc_claimAutoreleasedReturnValue();
        purchaseDate = v5->_purchaseDate;
        v5->_purchaseDate = (NSDate *)v80;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v82 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v83 = v5->_purchaseDate;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v83;
            v41 = v82;
            v42 = "Transaction date: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 9:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35));
        v84 = objc_claimAutoreleasedReturnValue();
        frToolVersion = v5->_frToolVersion;
        v5->_frToolVersion = (NSNumber *)v84;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v86 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v87 = v5->_frToolVersion;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v87;
            v41 = v86;
            v42 = "FR tool version: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0xALL:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v88 = objc_claimAutoreleasedReturnValue();
        parentalControls = v5->_parentalControls;
        v5->_parentalControls = (NSString *)v88;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v90 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v91 = v5->_parentalControls;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v91;
            v41 = v90;
            v42 = "Parental controls: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0xBLL:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "stringValue");
        v93 = objc_claimAutoreleasedReturnValue();
        developerID = v5->_developerID;
        v5->_developerID = (NSString *)v93;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v95 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v96 = v5->_developerID;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v96;
            v41 = v95;
            v42 = "DeveloperID: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0xCLL:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        _readStringDate(v97);
        v98 = objc_claimAutoreleasedReturnValue();
        creationDate = v5->_creationDate;
        v5->_creationDate = (NSDate *)v98;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v100 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v101 = v5->_creationDate;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v101;
            v41 = v100;
            v42 = "Receipt created: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0xDLL:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v102 = objc_claimAutoreleasedReturnValue();
        frAppVersion = v5->_frAppVersion;
        v5->_frAppVersion = (NSString *)v102;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v104 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v105 = v5->_frAppVersion;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v105;
            v41 = v104;
            v42 = "FR app version: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0xELL:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "stringValue");
        v107 = objc_claimAutoreleasedReturnValue();
        hwtype = v5->_hwtype;
        v5->_hwtype = (NSString *)v107;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v109 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v110 = v5->_hwtype;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v110;
            v41 = v109;
            v42 = "HW type: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0xFLL:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "stringValue");
        v112 = objc_claimAutoreleasedReturnValue();
        downloadID = v5->_downloadID;
        v5->_downloadID = (NSString *)v112;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v114 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v115 = v5->_downloadID;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v115;
            v41 = v114;
            v42 = "DownloadID: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0x10:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ASFAsn1ReceiptIAPToken integerValue]((uint64_t)v35));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "stringValue");
        v117 = objc_claimAutoreleasedReturnValue();
        installerVersionID = v5->_installerVersionID;
        v5->_installerVersionID = (NSString *)v117;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v119 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v120 = v5->_installerVersionID;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v120;
            v41 = v119;
            v42 = "Installer versionID: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0x11:
        v121 = objc_getProperty(v35, v36, 24, 1);
        v123 = v121;
        if (v121)
          v121 = objc_getProperty(v121, v122, 24, 1);
        v124 = v121;

        v125 = v124;
        if (!v125)
        {
          if (v5->_verbose)
          {
            if (*(_QWORD *)(v32 + 1904) != -1)
              dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
            v174 = ASFLogHandleForCategory_logHandles_0;
            if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v222) = 0;
              _os_log_error_impl(&dword_20D881000, v174, OS_LOG_TYPE_ERROR, "Failed to load data", (uint8_t *)&v222, 2u);
            }
          }
          goto LABEL_209;
        }
        +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v125, 0);
        v126 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v126 && v126[2] == 17)
        {
          v213 = v125;
          v214 = v126;
          v127 = v126;
          v128 = (void *)objc_opt_new();
          v217 = v127;
          -[ASFAsn1SetToken nextToken]((uint64_t)v127);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          if (v129)
          {
            do
            {
              v130 = (void *)MEMORY[0x212BAAB1C]();
              v132 = objc_getProperty(v129, v131, 24, 1);
              +[ASFAsn1ReceiptIAPToken readFromBuffer:]((uint64_t)ASFAsn1ReceiptIAPToken, v132);
              v133 = objc_claimAutoreleasedReturnValue();

              if (v133)
              {
                switch(*(_QWORD *)(v133 + 8))
                {
                  case 0x6A5:
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[ASFAsn1ReceiptIAPToken integerValue](v133));
                    v135 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v128)
                      goto LABEL_157;
                    v136 = v128;
                    v137 = v135;
                    v138 = 40;
                    break;
                  case 0x6A6:
                    -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v133);
                    v135 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v128)
                      goto LABEL_157;
                    v136 = v128;
                    v137 = v135;
                    v138 = 32;
                    break;
                  case 0x6A7:
                    -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v133);
                    v135 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v128)
                      goto LABEL_157;
                    v136 = v128;
                    v137 = v135;
                    v138 = 48;
                    break;
                  case 0x6A8:
                    -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v133);
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    _readStringDate(v139);
                    v135 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v128)
                      goto LABEL_157;
                    v136 = v128;
                    v137 = v135;
                    v138 = 24;
                    break;
                  case 0x6A9:
                    -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v133);
                    v135 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v128)
                      goto LABEL_157;
                    v136 = v128;
                    v137 = v135;
                    v138 = 16;
                    break;
                  case 0x6AALL:
                    -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v133);
                    v140 = (void *)objc_claimAutoreleasedReturnValue();
                    _readStringDate(v140);
                    v135 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v128)
                      goto LABEL_157;
                    v136 = v128;
                    v137 = v135;
                    v138 = 8;
                    break;
                  default:
                    goto LABEL_158;
                }
                objc_setProperty_atomic_copy(v136, v134, v137, v138);
LABEL_157:

              }
LABEL_158:

              objc_autoreleasePoolPop(v130);
              -[ASFAsn1SetToken nextToken]((uint64_t)v217);
              v141 = objc_claimAutoreleasedReturnValue();

              v129 = (void *)v141;
            }
            while (v141);
          }

          v12 = &jpt_20D8838EC;
          v31 = 0x253ECD000;
          v32 = 0x253ECD000;
          v125 = v213;
        }
        else
        {
          if (!v5->_verbose)
          {
            v128 = 0;
LABEL_207:

            if (v128)
            {
              -[NSMutableArray addObject:](v5->_mutableIAPs, "addObject:", v128);

LABEL_210:
              v28 = v215;

              goto LABEL_193;
            }
LABEL_209:
            NSLog(CFSTR("Decode iaps failed"), v213);
            goto LABEL_210;
          }
          v214 = v126;
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v175 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v222) = 0;
            _os_log_error_impl(&dword_20D881000, v175, OS_LOG_TYPE_ERROR, "Failed to parse data", (uint8_t *)&v222, 2u);
          }
          v128 = 0;
        }
        v126 = v214;
        goto LABEL_207;
      case 0x15:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        _readStringDate(v142);
        v143 = objc_claimAutoreleasedReturnValue();
        expirationDate = v5->_expirationDate;
        v5->_expirationDate = (NSDate *)v143;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v145 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v146 = v5->_expirationDate;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v146;
            v41 = v145;
            v42 = "Receipt expires: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0x16:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        _readStringDate(v147);
        v148 = objc_claimAutoreleasedReturnValue();
        renewalDate = v5->_renewalDate;
        v5->_renewalDate = (NSDate *)v148;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v150 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v151 = v5->_renewalDate;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v151;
            v41 = v150;
            v42 = "Receipt renewal: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0x17:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v152 = objc_claimAutoreleasedReturnValue();
        organizationDisplayName = v5->_organizationDisplayName;
        v5->_organizationDisplayName = (NSString *)v152;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v154 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v155 = v5->_organizationDisplayName;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v155;
            v41 = v154;
            v42 = "Organization display name: %{public}@";
            goto LABEL_192;
          }
        }
        goto LABEL_193;
      case 0x18:
        -[ASFAsn1ReceiptIAPToken stringValue]((_QWORD **)v35);
        v156 = objc_claimAutoreleasedReturnValue();
        cancellationReason = v5->_cancellationReason;
        v5->_cancellationReason = (NSString *)v156;

        if (v5->_verbose)
        {
          if (*(_QWORD *)(v32 + 1904) != -1)
            dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
          v158 = ASFLogHandleForCategory_logHandles_0;
          if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
          {
            v159 = v5->_cancellationReason;
            LODWORD(v222) = 138543362;
            *(_QWORD *)((char *)&v222 + 4) = v159;
            v41 = v158;
            v42 = "Cancellation reason: %{public}@";
LABEL_192:
            _os_log_impl(&dword_20D881000, v41, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v222, 0xCu);
          }
        }
        goto LABEL_193;
      default:
        goto LABEL_193;
    }
  }
LABEL_226:

  v180 = SecCmsMessageContentLevelCount();
  if (v180 >= 1)
  {
    v181 = v180;
    for (i = 0; i != v181; ++i)
    {
      SecCmsMessageContentLevel();
      if (SecCmsContentInfoGetContentTypeTag() == 26 && SecCmsContentInfoGetContent())
        break;
    }
  }
  v183 = v5->_creationDate;
  *(_QWORD *)buf = 0;
  CertificateList = SecCmsSignedDataGetCertificateList();
  if (!CertificateList)
    goto LABEL_300;
  v185 = (uint64_t *)CertificateList;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v187 = *v185;
  if (*v185)
  {
    v188 = v185 + 1;
    do
    {
      v189 = CFDataCreate(0, *(const UInt8 **)(v187 + 8), *(_QWORD *)v187);
      if (v189)
      {
        v190 = v189;
        v191 = SecCertificateCreateWithData(0, v189);
        if (v191)
        {
          v192 = v191;
          CFArrayAppendValue(Mutable, v191);
          CFRelease(v192);
        }
        CFRelease(v190);
      }
      v193 = *v188++;
      v187 = v193;
    }
    while (v193);
  }
  if (!Mutable)
  {
LABEL_300:
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v196 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        _os_log_error_impl(&dword_20D881000, v196, OS_LOG_TYPE_ERROR, "Could not read certificates", (uint8_t *)&v222, 2u);
      }
    }
    v197 = 0xFFFFLL;
    goto LABEL_276;
  }
  if (SecTrustCreateWithCertificates(Mutable, 0, (SecTrustRef *)buf))
  {
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v194 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        v195 = "Could not create trust";
LABEL_297:
        _os_log_error_impl(&dword_20D881000, v194, OS_LOG_TYPE_ERROR, v195, (uint8_t *)&v222, 2u);
      }
    }
    goto LABEL_274;
  }
  v198 = *(__SecTrust **)buf;
  v199 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 3, MEMORY[0x24BDBD690]);
  v200 = 0;
  v201 = *MEMORY[0x24BDE9450];
  *(_QWORD *)&v222 = *MEMORY[0x24BDE9448];
  *((_QWORD *)&v222 + 1) = v201;
  v202 = 1;
  do
  {
    v203 = v202;
    v204 = SecPolicyCreateWithProperties(*((CFTypeRef *)&v222 + v200), 0);
    if (!v204)
    {
      v205 = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!v205)
      {
LABEL_269:
        CFRelease(v199);
        goto LABEL_270;
      }
LABEL_258:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 3, v213);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(v205, (const void *)*MEMORY[0x24BDE9460], v206);
      v207 = SecPolicyCreateWithProperties((CFTypeRef)*MEMORY[0x24BDE9440], v205);
      if (v207)
      {
        v208 = v207;
        CFArrayAppendValue(v199, v207);
        CFRelease(v208);
        CFRelease(v205);

        if (v204)
          goto LABEL_260;
      }
      else
      {
        CFRelease(v205);

      }
      goto LABEL_269;
    }
    CFArrayAppendValue(v199, v204);
    CFRelease(v204);
    v202 = 0;
    v200 = 1;
  }
  while ((v203 & 1) != 0);
  v205 = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v205)
    goto LABEL_258;
LABEL_260:
  v209 = SecTrustSetPolicies(v198, v199);
  CFRelease(v199);
  if (v209)
  {
LABEL_270:
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v194 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        v195 = "Failed to update policies";
        goto LABEL_297;
      }
    }
    goto LABEL_274;
  }
  if (v183 && SecTrustSetVerifyDate(*(SecTrustRef *)buf, v183))
  {
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v194 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        v195 = "Could not set verification date";
        goto LABEL_297;
      }
    }
  }
  else
  {
    error = 0;
    v210 = SecTrustEvaluateWithError(*(SecTrustRef *)buf, &error);
    v211 = error;
    if (error)
    {
      if (v5->_verbose)
      {
        if (ASFLogHandleForCategory_onceToken != -1)
          dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
        v212 = ASFLogHandleForCategory_logHandles_0;
        if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v222) = 138543362;
          *(_QWORD *)((char *)&v222 + 4) = error;
          _os_log_impl(&dword_20D881000, v212, OS_LOG_TYPE_DEFAULT, "Error evaluating trust: %{public}@", (uint8_t *)&v222, 0xCu);
        }
        v211 = error;
      }
      CFRelease(v211);
    }
    if (v210)
    {
      if (error)
        v197 = 0xFFFFLL;
      else
        v197 = 0;
      goto LABEL_275;
    }
    if (v5->_verbose)
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v194 = ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v222) = 0;
        v195 = "Failed to evaluate trust";
        goto LABEL_297;
      }
    }
  }
LABEL_274:
  v197 = 0xFFFFLL;
LABEL_275:
  CFRelease(Mutable);
LABEL_276:
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);

  v13 = v197 != 0xFFFF;
LABEL_24:
  if (-[NSMutableArray count](v5->_mutableIAPs, "count", v213))
  {
    v14 = -[NSMutableArray copy](v5->_mutableIAPs, "copy");
    iaps = v5->_iaps;
    v5->_iaps = (NSArray *)v14;

  }
  if (!v13)
  {
LABEL_27:
    if (-[NSString hasSuffix:](v5->_receiptType, "hasSuffix:", CFSTR("Stub")))
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v16 = (void *)ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        v18 = objc_msgSend(v4, "length");
        LODWORD(v222) = 134217984;
        *(_QWORD *)((char *)&v222 + 4) = v18;
        v19 = "Allowing invalid receipt because it is a stub receipt [%{iec-bytes}ld]";
        goto LABEL_37;
      }
    }
    else if (-[NSString isEqualToString:](v5->_receiptType, "isEqualToString:", CFSTR("Xcode")))
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v20 = (void *)ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        v17 = v20;
        v21 = objc_msgSend(v4, "length");
        LODWORD(v222) = 134217984;
        *(_QWORD *)((char *)&v222 + 4) = v21;
        v19 = "Allowing invalid receipt because it is an StoreKit testing receipt [%{iec-bytes}ld]";
LABEL_37:
        _os_log_error_impl(&dword_20D881000, v17, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v222, 0xCu);

      }
    }
    else
    {
      if (ASFLogHandleForCategory_onceToken != -1)
        dispatch_once(&ASFLogHandleForCategory_onceToken, &__block_literal_global);
      v22 = (void *)ASFLogHandleForCategory_logHandles_0;
      if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0, OS_LOG_TYPE_ERROR))
      {
        v177 = v22;
        v178 = objc_msgSend(v4, "length");
        LODWORD(v222) = 134217984;
        *(_QWORD *)((char *)&v222 + 4) = v178;
        _os_log_error_impl(&dword_20D881000, v177, OS_LOG_TYPE_ERROR, "Invalid receipt [%{iec-bytes}ld]", (uint8_t *)&v222, 0xCu);

      }
      v5 = 0;
    }
  }
LABEL_43:

  return v5;
}

- (BOOL)isDSIDless
{
  NSString *downloadID;
  NSUInteger v4;

  downloadID = self->_downloadID;
  if (!downloadID
    || (LODWORD(v4) = -[NSString isEqualToString:](downloadID, "isEqualToString:", CFSTR("0")), (_DWORD)v4))
  {
    v4 = -[NSString length](self->_opaqueDSIDString, "length");
    if (v4)
    {
      if (-[NSString isEqualToString:](self->_opaqueDSIDString, "isEqualToString:", CFSTR("0")))
        LOBYTE(v4) = 0;
      else
        LOBYTE(v4) = !-[NSString isEqualToString:](self->_receiptType, "isEqualToString:", CFSTR("ProductionSandbox"));
    }
  }
  return v4;
}

- (BOOL)isRevoked
{
  return -[NSString length](self->_cancellationReason, "length") != 0;
}

- (BOOL)isVPPLicensed
{
  return self->_renewalDate != 0;
}

- (NSData)receiptData
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", self->_path);
}

- (NSString)receiptDataString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", self->_path);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)bundleIDData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)cancellationReason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)developerID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)downloadID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)frAppVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)frToolVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)hwtype
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)installerVersionID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)iaps
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSData)opaqueDSIDData
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)opaqueDSIDString
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)organizationDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)parentalControls
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)receiptType
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (NSDate)renewalDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (NSData)sha1
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sha1, 0);
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_receiptType, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_parentalControls, 0);
  objc_storeStrong((id *)&self->_organizationDisplayName, 0);
  objc_storeStrong((id *)&self->_opaqueDSIDString, 0);
  objc_storeStrong((id *)&self->_opaqueDSIDData, 0);
  objc_storeStrong((id *)&self->_iaps, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_installerVersionID, 0);
  objc_storeStrong((id *)&self->_hwtype, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_frToolVersion, 0);
  objc_storeStrong((id *)&self->_frAppVersion, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_developerID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_cancellationReason, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIDData, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_mutableIAPs, 0);
}

@end
