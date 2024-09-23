@implementation PearlPairerController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[PearlPairerController setupWithInputs:responder:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v12, 0x20u);
  }

  -[PearlPairerController setInputs:](self, "setInputs:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v11, "setStatusCode:", &off_100015690);

    -[PearlPairerController setFinished:](self, "setFinished:", 1);
  }

}

- (void)start
{
  uint64_t v2;
  NSObject *v3;
  const char *CStringPtr;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *savageSN;
  uint64_t v9;
  NSObject *v10;
  NSString *v11;
  NSString *v12;
  NSString *savageUID;
  uint64_t v14;
  NSObject *v15;
  NSString *v16;
  void *v17;
  __CFString *v18;
  const __CFURL *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  int v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSNumber *v57;
  NSNumber *v58;
  NSString *v59;
  NSString *v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  PearlPairerController *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  NSNumber *v69;
  NSNumber *PearlPairingErrorCode;
  NSString *v71;
  NSString *PearlPairingErrorDescription;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  PearlPairerController *v76;
  NSNumber *v77;
  NSNumber *v78;
  NSString *v79;
  NSString *v80;
  NSString *v81;
  NSString *v82;
  NSString *v83;
  NSString *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  void *v112;
  _QWORD *v113;
  void *v114;
  void *v115;
  CFErrorRef v116;
  id v118;
  _QWORD v119[4];
  id v120;
  _QWORD *v121;
  _QWORD v122[18];
  _QWORD v123[5];
  id v124;
  _QWORD v125[5];
  NSData *v126;
  _QWORD v127[5];
  id v128;
  _QWORD v129[3];
  char v130;
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[4];
  _QWORD v135[4];
  _QWORD v136[4];
  CFDataRef theData;
  CFTypeRef cf;
  CFErrorRef v139;
  _QWORD v140[4];
  _QWORD v141[4];
  uint8_t v142[4];
  void *v143;
  __int128 buf;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;

  v2 = handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PearlPairerController start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v139 = 0;
  cf = 0;
  theData = 0;
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x2020000000;
  v136[3] = 0;
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  v135[3] = 0;
  CStringPtr = CFStringGetCStringPtr(CFSTR("Savage"), 0x8000100u);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v145 = 0x3032000000;
  v146 = sub_1000068EC;
  v147 = sub_1000068FC;
  v148 = 0;
  v134[0] = 0;
  v134[1] = v134;
  v134[2] = 0x2020000000;
  v134[3] = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x2020000000;
  v133[3] = 0;
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x2020000000;
  v132[3] = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  v131[3] = 0;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x2020000000;
  v130 = 0;
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x3032000000;
  v127[3] = sub_1000068EC;
  v127[4] = sub_1000068FC;
  v128 = 0;
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x3032000000;
  v125[3] = sub_1000068EC;
  v125[4] = sub_1000068FC;
  v126 = objc_opt_new(NSData);
  v123[0] = 0;
  v123[1] = v123;
  v123[2] = 0x3032000000;
  v123[3] = sub_1000068EC;
  v123[4] = sub_1000068FC;
  v124 = 0;
  AMSupportLogSetHandler(&_logHandler);
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_100006904;
  v122[3] = &unk_100014590;
  v122[6] = v135;
  v122[7] = v134;
  v122[8] = v133;
  v122[9] = &buf;
  v122[16] = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v122[17] = CStringPtr;
  v122[10] = v123;
  v122[11] = v132;
  v122[12] = v131;
  v122[13] = v129;
  v122[14] = v127;
  v122[15] = v125;
  v122[5] = v136;
  v122[4] = self;
  v113 = objc_retainBlock(v122);
  v5 = (void *)MGCopyAnswer(CFSTR("LE2kQ7U1iM32AmlhYvlagg"), 0);
  v6 = v5;
  if (!v5)
  {
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v87, "setStatusCode:", &off_1000156A8);

    v88 = handleForCategory(0);
    v89 = objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_10000F2E0();
    goto LABEL_97;
  }
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "convertToHexString"));
  savageSN = self->_savageSN;
  self->_savageSN = v7;

  v9 = handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_savageSN;
    *(_DWORD *)v142 = 138412290;
    v143 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Savage Serial Number: %@", v142, 0xCu);
  }

  v114 = (void *)MGCopyAnswer(CFSTR("FNvQ6lBvJIUcYBzQ8ggOUQ"), 0);
  if (!v114)
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v90, "setStatusCode:", &off_1000156A8);

    v91 = handleForCategory(0);
    v89 = objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_10000F30C();
LABEL_97:

    v111 = 0;
    v114 = 0;
    v115 = 0;
    v116 = 0;
    goto LABEL_68;
  }
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "convertToHexString"));
  savageUID = self->_savageUID;
  self->_savageUID = v12;

  v14 = handleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_savageUID;
    *(_DWORD *)v142 = 138412290;
    v143 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Savage UID: %@", v142, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "SCPairURL"));
  v19 = CFURLCreateWithString(kCFAllocatorDefault, v18, 0);

  v20 = handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v142 = 138412290;
    v143 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Seacookie Pairing URL: %@", v142, 0xCu);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rikKeyBlob"));

  if (v23)
  {
    v24 = objc_alloc((Class)NSData);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "rikKeyBlob"));
    v27 = objc_msgSend(v24, "initWithBase64EncodedString:options:", v26, 0);

    if (!v27)
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
      objc_msgSend(v92, "setStatusCode:", &off_1000156C0);

      v93 = handleForCategory(0);
      v63 = objc_claimAutoreleasedReturnValue(v93);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        sub_10000F608();
      v111 = 0;
      goto LABEL_103;
    }
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_1000072EC;
    v119[3] = &unk_1000145B8;
    v120 = v27;
    v121 = v131;
    v28 = v27;
    v110 = objc_retainBlock(v119);

  }
  else
  {
    v110 = 0;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs", v110));
  v30 = objc_msgSend(v29, "skipScPairingTicket");

  if ((v30 & 1) != 0)
  {
    v31 = 0;
    goto LABEL_33;
  }
  v31 = +[CRPersonalizationManager getDefaultAMAuthInstallRef](CRPersonalizationManager, "getDefaultAMAuthInstallRef");
  if (!v31)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v94, "setStatusCode:", &off_1000156D8);

    v95 = handleForCategory(0);
    v63 = objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      sub_10000F428();
LABEL_103:
    v115 = 0;
    v116 = 0;
    v31 = 0;
    goto LABEL_64;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tatsuURL"));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tatsuURL"));
    v36 = AMAuthInstallSetSigningServerURL(v31, +[NSURL URLWithString:](NSURL, "URLWithString:", v35));

    v37 = handleForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "tatsuURL"));
      *(_DWORD *)v142 = 138412290;
      v143 = v40;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Setting custom TATSU server URL: %@", v142, 0xCu);

    }
    if (v36)
    {
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
      objc_msgSend(v108, "setStatusCode:", &off_1000156D8);

      v109 = handleForCategory(0);
      v63 = objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        sub_10000F5A8();
      goto LABEL_116;
    }
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
  if ((objc_msgSend(v41, "useAppleConnect") & 1) != 0)
  {

  }
  else
  {
    v42 = +[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault");

    if ((v42 & 1) == 0)
      goto LABEL_26;
  }
  if (+[CRPersonalizationManager enableSSO:](CRPersonalizationManager, "enableSSO:", v31))
  {
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v106, "setStatusCode:", &off_1000156F0);

    v107 = handleForCategory(0);
    v63 = objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      sub_10000F57C();
    goto LABEL_116;
  }
LABEL_26:
  if (HSCGetPearlNonce((CFDataRef *)&cf, &v139) != 1 || !cf)
  {
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v96, "setStatusCode:", &off_100015708);

    v116 = v139;
    v97 = handleForCategory(0);
    v63 = objc_claimAutoreleasedReturnValue(v97);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      sub_10000F454((uint64_t)v116, v63, v98, v99, v100, v101, v102, v103);
    goto LABEL_63;
  }
  if (AMAuthInstallApImg4SetSepNonce(v31))
  {
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v104, "setStatusCode:", &off_100015708);

    v105 = handleForCategory(0);
    v63 = objc_claimAutoreleasedReturnValue(v105);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      sub_10000F51C();
LABEL_116:
    v115 = 0;
    v116 = 0;
    goto LABEL_64;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[CRPersonalizationManager initWithAuthInstallObj:](CRPersonalizationManager, "initWithAuthInstallObj:", v31));
  v118 = 0;
  v44 = objc_msgSend(v43, "getApTicketForSeaCookiePairingWithOptions:pairingTicket:error:", 0, &theData, &v118);
  v116 = (CFErrorRef)v118;

  if (v116)
    v45 = 0;
  else
    v45 = v44;
  if ((v45 & 1) == 0)
  {
    v47 = handleForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_10000F4B8((uint64_t)v116, v48, v49, v50, v51, v52, v53, v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "rikKeyBlob"));

    if (!v56)
    {
      v63 = objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
      -[NSObject setStatusCode:](v63, "setStatusCode:", &off_1000156D8);
      goto LABEL_63;
    }
    if (v116)
      goto LABEL_41;
LABEL_45:
    v116 = 0;
    goto LABEL_46;
  }
LABEL_33:
  v46 = HSCSecurePairPearl(v19, theData, &v139, (uint64_t)v113, v111);
  v116 = v139;
  if (!v139)
    goto LABEL_45;
  v44 = v46;
  if (!v46)
  {
    if (-[__CFError code](v139, "code") != (id)6)
    {
      v69 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[__CFError code](v116, "code")));
      PearlPairingErrorCode = self->_PearlPairingErrorCode;
      self->_PearlPairingErrorCode = v69;

      v71 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFError description](v116, "description"));
      PearlPairingErrorDescription = self->_PearlPairingErrorDescription;
      self->_PearlPairingErrorDescription = v71;

      v73 = handleForCategory(0);
      v74 = objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        sub_10000F3B4((uint64_t)v116, v74, v75);

      if (-[__CFError code](v116, "code") == (id)8
        || -[__CFError code](v116, "code") == (id)4
        || -[__CFError code](v116, "code") == (id)5
        || -[__CFError code](v116, "code") == (id)9
        || -[__CFError code](v116, "code") == (id)16
        || -[__CFError code](v116, "code") == (id)15)
      {
        v63 = objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
        -[NSObject setStatusCode:](v63, "setStatusCode:", &off_100015720);
      }
      else if (-[__CFError code](v116, "code") == (id)12
             || -[__CFError code](v116, "code") == (id)13
             || -[__CFError code](v116, "code") == (id)14)
      {
        v63 = objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
        -[NSObject setStatusCode:](v63, "setStatusCode:", &off_100015738);
      }
      else if (-[__CFError code](v116, "code") == (id)3
             || -[__CFError code](v116, "code") == (id)7
             || -[__CFError code](v116, "code") == (id)10)
      {
        v63 = objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
        -[NSObject setStatusCode:](v63, "setStatusCode:", &off_100015750);
      }
      else
      {
        v63 = objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
        -[NSObject setStatusCode:](v63, "setStatusCode:", &off_100015768);
      }
      goto LABEL_63;
    }
    v44 = 0;
  }
LABEL_41:
  v57 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[__CFError code](v116, "code")));
  v58 = self->_PearlPairingErrorCode;
  self->_PearlPairingErrorCode = v57;

  v59 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFError description](v116, "description"));
  v60 = self->_PearlPairingErrorDescription;
  self->_PearlPairingErrorDescription = v59;

  v61 = handleForCategory(0);
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    sub_10000F338(v44, (uint64_t)v116, v62);

  if (!-[PearlPairerController isRetest:](self, "isRetest:", v116))
  {
    v63 = objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    -[NSObject setStatusCode:](v63, "setStatusCode:", &off_100015780);
LABEL_63:
    v115 = 0;
    goto LABEL_64;
  }
LABEL_46:
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[PearlPairerController verifyPSD2](self, "verifyPSD2")));
  if (objc_msgSend(v115, "isEqual:", &off_100015798))
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v64, "setStatusCode:", &off_100015798);

    v65 = self;
    v63 = self->_PearlPairingErrorDescription;
    v66 = CFSTR("Unprovisioned sensor");
  }
  else if (objc_msgSend(v115, "isEqual:", &off_1000157B0))
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v67, "setStatusCode:", &off_1000157B0);

    v65 = self;
    v63 = self->_PearlPairingErrorDescription;
    v66 = CFSTR("Failed to request FDR permission");
  }
  else
  {
    if (!objc_msgSend(v115, "isEqual:", &off_1000157C8))
    {
      v63 = objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
      -[NSObject setStatusCode:](v63, "setStatusCode:", &off_1000157E0);
      goto LABEL_64;
    }
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
    objc_msgSend(v68, "setStatusCode:", &off_1000157C8);

    v65 = self;
    v63 = self->_PearlPairingErrorDescription;
    v66 = CFSTR("Failed to create FDR permission string");
  }
  v65->_PearlPairingErrorDescription = &v66->isa;
LABEL_64:

  if (v19)
    CFRelease(v19);
  if (v31)
    CFRelease(v31);
LABEL_68:
  if (cf)
    CFRelease(cf);
  v140[0] = CFSTR("pearlPairingErrorCode");
  v76 = self;
  v77 = self->_PearlPairingErrorCode;
  v78 = v77;
  if (!v77)
  {
    v78 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v76 = self;
  }
  v141[0] = v78;
  v140[1] = CFSTR("pearlPairingErrorDescription");
  v79 = v76->_PearlPairingErrorDescription;
  v80 = v79;
  if (!v79)
  {
    v80 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v76 = self;
  }
  v141[1] = v80;
  v140[2] = CFSTR("pearlSavageSerialNumber");
  v81 = v76->_savageSN;
  v82 = v81;
  if (!v81)
  {
    v82 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v76 = self;
  }
  v141[2] = v82;
  v140[3] = CFSTR("pearlSavageUID");
  v83 = v76->_savageUID;
  if (v83)
    v84 = v76->_savageUID;
  else
    v84 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v141[3] = v84;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v141, v140, 4, v111));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController result](self, "result"));
  objc_msgSend(v86, "setData:", v85);

  if (!v83)
  if (!v81)

  if (!v79)
  if (!v77)

  -[PearlPairerController setFinished:](self, "setFinished:", 1);
  _Block_object_dispose(v123, 8);

  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v127, 8);

  _Block_object_dispose(v129, 8);
  _Block_object_dispose(v131, 8);
  _Block_object_dispose(v132, 8);
  _Block_object_dispose(v133, 8);
  _Block_object_dispose(v134, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v135, 8);
  _Block_object_dispose(v136, 8);

}

- (void)cancel
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PearlPairerController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)teardown
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PearlPairerController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)parseSeaCookieServerError:(id)a3 errorCode:(id *)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v27;
  const char *v28;

  v5 = a3;
  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315138;
    v28 = "-[PearlPairerController parseSeaCookieServerError:errorCode:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v27, 0xCu);
  }

  v8 = 0;
  if (v5 && a4)
  {
    if (objc_msgSend(v5, "code") == (id)6
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription")), v9, v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
      v11 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("errorCode: (-?\\d+)"), 0, 0);
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstMatchInString:options:range:", v10, 0, 0, objc_msgSend(v10, "length")));
      v8 = v12 != 0;
      if (v12)
      {
        v13 = v12;
        v14 = -[NSObject rangeAtIndex:](v12, "rangeAtIndex:", 1);
        *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v14, v15));
        v16 = handleForCategory(0);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (const char *)*a4;
          v27 = 138412290;
          v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "serverErrorCode: %@", (uint8_t *)&v27, 0xCu);
        }

      }
      else
      {
        v19 = handleForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_10000F960((uint64_t)v10, v13, v20, v21, v22, v23, v24, v25);
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isRetest:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  uint8_t buf[4];
  const char *v26;

  v4 = a3;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[PearlPairerController isRetest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rikKeyBlob"));
  v9 = v8;
  if (!v4 || !v8)
  {

LABEL_10:
    v24 = 0;
    v13 = -[PearlPairerController parseSeaCookieServerError:errorCode:](self, "parseSeaCookieServerError:errorCode:", v4, &v24);
    v12 = v24;
    if (!v13)
    {
      v21 = handleForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10000F9C4();
      goto LABEL_22;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rikKeyBlob"));
    if (v15)
    {
      v16 = (void *)v15;
      v17 = -[NSObject isEqual:](v12, "isEqual:", CFSTR("5010"));

      if (v17)
      {
        v18 = handleForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
LABEL_22:

          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
        v20 = "Server error is 5010.";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
        goto LABEL_22;
      }
    }
    else
    {

    }
    if (!-[NSObject isEqual:](v12, "isEqual:", CFSTR("6006")))
    {
      v13 = 0;
      goto LABEL_23;
    }
    v22 = handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v20 = "Server error is 6006 (PSDT not found).";
    goto LABEL_21;
  }
  v10 = objc_msgSend(v4, "code");

  if (v10 != (id)3194)
    goto LABEL_10;
  v11 = handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AuthInstall error is 3194.", buf, 2u);
  }
  v13 = 1;
LABEL_23:

  return v13;
}

- (id)_createFDROptions
{
  uint64_t v3;
  NSObject *v4;
  id v5;
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
  uint64_t v18;
  NSObject *v19;
  int v21;
  const char *v22;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[PearlPairerController _createFDROptions]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v21, 0xCu);
  }

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("VerifyData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "FDRCAURL"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "FDRCAURL"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("CAURL"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "FDRDSURL"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "FDRDSURL"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("DSURL"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trustObjectURL"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController inputs](self, "inputs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trustObjectURL"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("TrustObjectURL"));

  }
  v18 = handleForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = (const char *)v5;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AMFDR options: %@", (uint8_t *)&v21, 0xCu);
  }

  return v5;
}

- (int64_t)verifyPSD2
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t PermissionsString;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t v37[4];
  uint64_t v38;
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[PearlPairerController verifyPSD2]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v35 = 0;
  v36 = 0;
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v67 = 0;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  *(_OWORD *)buf = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PearlPairerController _createFDROptions](self, "_createFDROptions"));
  v6 = AMFDRSealingMapCopyInstanceForClass(CFSTR("psd2"), &v36);
  if (!v6 || v36)
  {
    v25 = handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10000F9F0();
    goto LABEL_41;
  }
  v7 = AMFDRCreateTypeWithOptions(kCFAllocatorDefault, CFSTR("Remote"), v5);
  if (!v7)
  {
    v27 = handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10000FA50();
LABEL_41:

    v15 = 0;
    PermissionsString = 0;
    v18 = 12;
    goto LABEL_28;
  }
  v8 = v7;
  v9 = AMFDRCreateTypeWithOptions(kCFAllocatorDefault, CFSTR("Local"), 0);
  AMFDRDataCopyTrustObject(v9, 0, &v35, 0);
  AMFDRSetOption(v8, CFSTR("TrustObject"), v35);
  PermissionsString = AMFDRDataCreatePermissionsString(v8, 0, CFSTR("psd2"), v6);
  v11 = handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!PermissionsString)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10000FA7C();
    v15 = 0;
    v18 = -84;
    goto LABEL_25;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v37 = 138412290;
    v38 = PermissionsString;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Request FDR permissionStr: %@", v37, 0xCu);
  }

  AMFDRSetOption(v8, CFSTR("Permissions"), PermissionsString);
  if (!AMFDRPermissionsRequest(v8, &v36) || v36)
  {
    v28 = handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000FBC8();
    v15 = 0;
    v18 = -83;
    goto LABEL_25;
  }
  v14 = (void *)AMFDRDataCopy(v8, CFSTR("psd2"), v6, &v36);
  v15 = v14;
  if (!v14 || v36)
  {
    v29 = handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000FAA8();
  }
  else
  {
    v15 = objc_retainAutorelease(v14);
    if (AMFDRDecodeFDR2Data(objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), &v34, &v33, &v32, &v31))
    {
      v16 = objc_retainAutorelease(v15);
      if (Img4DecodeInit(objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), buf))
      {
        v17 = handleForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_10000FB68();
        v18 = 12;
        v15 = v16;
        goto LABEL_25;
      }
      goto LABEL_21;
    }
    v19 = handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Decoded FDR2 format", v37, 2u);
    }

    if (!Img4DecodeInit(v34, v33, buf))
    {
LABEL_21:
      v21 = verifyFDRData(*((const char **)&v47 + 1), v48);
      v22 = handleForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v13 = v23;
      if (!v21)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Verify PSD2 successfully", v37, 2u);
        }
        v18 = 0;
        goto LABEL_25;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10000FB08();
      goto LABEL_54;
    }
    v30 = handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000FB68();
  }
LABEL_54:
  v18 = 12;
LABEL_25:

  if (v9)
    AMSupportSafeRelease(v9);
  AMSupportSafeRelease(v8);
LABEL_28:
  if (v35)
    AMSupportSafeRelease(v35);
  if (v6)
    AMSupportSafeRelease(v6);
  if (PermissionsString)
    AMSupportSafeRelease(PermissionsString);
  if (v36)
    AMSupportSafeRelease(v36);

  return v18;
}

- (int64_t)detectCamera
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  uint64_t v4;
  NSObject *v5;
  int64_t v6;
  const __CFDictionary *v8;
  io_service_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  io_service_t v12;
  uint64_t v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v2 = IOServiceMatching("AppleH10CamIn");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    IOObjectRelease(MatchingService);
    v4 = handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "h10 device", buf, 2u);
    }
    v6 = 1;
  }
  else
  {
    v8 = IOServiceMatching("AppleH13CamIn");
    v9 = IOServiceGetMatchingService(kIOMainPortDefault, v8);
    if (v9)
    {
      IOObjectRelease(v9);
      v10 = handleForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        v6 = 2;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "h13 device", v15, 2u);
      }
      else
      {
        v6 = 2;
      }
    }
    else
    {
      v11 = IOServiceMatching("AppleH16CamIn");
      v12 = IOServiceGetMatchingService(kIOMainPortDefault, v11);
      if (!v12)
        return 0;
      IOObjectRelease(v12);
      v13 = handleForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "h16 device", v14, 2u);
      }
      v6 = 3;
    }
  }

  return v6;
}

- (id)getPatchDataWithDigest:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  __int128 v15;
  id v16;
  uint64_t v17;
  void *i;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  uint8_t buf[4];
  NSObject *v41;
  _BYTE v42[128];

  v33 = a3;
  v3 = (void *)objc_opt_new(CRUtils);
  v39 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getPathForSavageFirmwareWithError:", &v39));
  v5 = v39;

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000FC28();
LABEL_14:
    v13 = 0;
    goto LABEL_40;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v38 = 0;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v4, &v38));
  v8 = v38;

  if (v5)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (!v10)
  {
    v11 = handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10000FC54();

    goto LABEL_14;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v5;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v35;
    *(_QWORD *)&v15 = 138412290;
    v32 = v15;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v8);
        v19 = *(NSObject **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v19, v32));
        if (v20)
        {
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v20));
          if (v22)
          {
            v13 = v22;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "SHA256DigestData"));
            if (!v23)
            {
              v24 = handleForCategory(0);
              v25 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v32;
                v41 = v19;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to get digest for file: %@", buf, 0xCu);
              }

            }
            if (objc_msgSend(v23, "isEqualToData:", v33))
            {
              v29 = handleForCategory(0);
              v30 = objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v32;
                v41 = v19;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Expected patch data found: %@", buf, 0xCu);
              }

              goto LABEL_39;
            }

          }
          else
          {
            v27 = handleForCategory(0);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              v41 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to get content in path: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          v26 = handleForCategory(0);
          v21 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            v41 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to get path for file: %@", buf, 0xCu);
          }
        }

      }
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v16)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_39:
  v5 = v8;
LABEL_40:

  return v13;
}

- (PearlPairerInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (NSNumber)PearlPairingErrorCode
{
  return self->_PearlPairingErrorCode;
}

- (void)setPearlPairingErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_PearlPairingErrorCode, a3);
}

- (NSString)PearlPairingErrorDescription
{
  return self->_PearlPairingErrorDescription;
}

- (void)setPearlPairingErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_PearlPairingErrorDescription, a3);
}

- (NSString)savageSN
{
  return self->_savageSN;
}

- (void)setSavageSN:(id)a3
{
  objc_storeStrong((id *)&self->_savageSN, a3);
}

- (NSString)savageUID
{
  return self->_savageUID;
}

- (void)setSavageUID:(id)a3
{
  objc_storeStrong((id *)&self->_savageUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savageUID, 0);
  objc_storeStrong((id *)&self->_savageSN, 0);
  objc_storeStrong((id *)&self->_PearlPairingErrorDescription, 0);
  objc_storeStrong((id *)&self->_PearlPairingErrorCode, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
