@implementation CoreRepairHelper

- (void)setupModuleChallengeCallBack:(__AMFDR *)a3
{
  AMFDRRegisterModuleChallengeCallback();
  AMFDRRegisterModuleChallengeCallback();
  AMFDRRegisterModuleChallengeCallback();
  AMFDRRegisterModuleChallengeCallback();
}

- (CoreRepairHelper)init
{
  CoreRepairHelper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CoreRepairHelper;
  result = -[CoreRepairHelper init](&v3, sel_init);
  if (result)
    result->_factoryServiceOn = 0;
  return result;
}

+ (id)sharedInstance
{
  if (qword_254D7B0B8 != -1)
    dispatch_once(&qword_254D7B0B8, &unk_24D1AA420);
  return (id)qword_254D7B0B0;
}

- (void)seal:(id)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  char v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  NSObject *v46;
  NSObject *v47;
  CRFDRSeal *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  id v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  id v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  id v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  void *v126;
  void *v127;
  const char *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void (**v164)(id, void *);
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  id v171;
  id v172;
  id v173;
  _QWORD v174[6];
  _QWORD v175[6];
  _QWORD v176[2];
  _QWORD v177[2];
  uint8_t buf[4];
  void *v179;
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v164 = (void (**)(id, void *))a4;
  v167 = (void *)os_transaction_create();
  v172 = 0;
  v173 = 0;
  v171 = 0;
  v7 = (void *)objc_opt_new();
  objc_msgSend_objectForKeyedSubscript_(v6, v8, (uint64_t)CFSTR("doSeal"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_BOOLValue(v10, v11, v12, v13);

  v18 = (void *)objc_msgSend_mutableCopy(v6, v15, v16, v17);
  objc_msgSend_objectForKeyedSubscript_(v6, v19, (uint64_t)CFSTR("keyBlob"), v20);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v25 = (void *)v21;
    objc_msgSend_objectForKeyedSubscript_(v6, v22, (uint64_t)CFSTR("keyBlob"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      handleForCategory(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v28, OS_LOG_TYPE_DEFAULT, "Use Key Blob", buf, 2u);
      }

      objc_msgSend_objectForKeyedSubscript_(v6, v29, (uint64_t)CFSTR("keyBlob"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v18, v32, (uint64_t)v31, (uint64_t)CFSTR("keyBlob"));

    }
  }
  objc_msgSend_sharedSingleton(CRFileSystemController, v22, v23, v24);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_setupAlternativeFDRPath_(v33, v34, (uint64_t)v6, v35);

  if ((v36 & 1) == 0)
  {
    handleForCategory(0);
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      sub_21456C154(v76, v130, v131, v132, v133, v134, v135, v136);
    goto LABEL_65;
  }
  objc_msgSend_sharedSingleton(CRFileSystemController, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setupFileSystemForRepair(v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
  {
    handleForCategory(0);
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      sub_21456BFF4(v76, v137, v138, v139, v140, v141, v142, v143);
LABEL_65:
    v83 = 0;
    v44 = 0;
    v67 = 0;
    v161 = 0;
    v66 = -16;
    goto LABEL_28;
  }
  objc_msgSend_setObject_forKey_(v18, v45, (uint64_t)v44, (uint64_t)CFSTR("datapath"));
  handleForCategory(0);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v179 = v44;
    _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "Temporary FDR Directory is %@", buf, 0xCu);
  }

  handleForCategory(0);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v47, OS_LOG_TYPE_DEFAULT, "Starting to seal FDR", buf, 2u);
  }

  if (!v14)
  {
    v55 = 0;
LABEL_25:
    handleForCategory(0);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v84, OS_LOG_TYPE_DEFAULT, "FDR Seal Successful", buf, 2u);
    }

    v161 = v55;
    objc_msgSend_handler(v55, v85, v86, v87);
    v76 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_warnings(v76, v88, v89, v90);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0;
    v66 = 0;
    goto LABEL_28;
  }
  v48 = [CRFDRSeal alloc];
  v51 = objc_msgSend_initWithParameters_(v48, v49, (uint64_t)v18, v50);
  if (!v51)
  {
    handleForCategory(0);
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      sub_21456C028((uint64_t)v6, v76, v144, v145, v146, v147, v148, v149);
    v83 = 0;
    v67 = 0;
    v161 = 0;
    goto LABEL_23;
  }
  v55 = (void *)v51;
  if (objc_msgSend_factoryServiceOn(self, v52, v53, v54))
  {
    handleForCategory(0);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v58, OS_LOG_TYPE_DEFAULT, "Enable service board support", buf, 2u);
    }

    objc_msgSend_handler(v55, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAllowFactoryReset_(v62, v63, 1, v64);

  }
  objc_msgSend_setDelegate_(v55, v56, (uint64_t)self, v57);
  v170 = 0;
  v66 = objc_msgSend_seal_oldSealingManifest_newSealingManifest_stats_(v55, v65, (uint64_t)&v170, (uint64_t)&v173, &v172, &v171);
  v67 = v170;
  objc_msgSend_convertDataToHexInDictionary_(v7, v68, (uint64_t)v173, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v173;
  v173 = v70;

  objc_msgSend_convertDataToHexInDictionary_(v7, v72, (uint64_t)v172, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v172;
  v172 = v74;

  if (!v66)
  {
    if (v67)
    {
      v161 = v55;
      handleForCategory(0);
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        sub_21456C08C((uint64_t)v67, v76, v77, v78, v79, v80, v81, v82);
      v83 = 0;
LABEL_23:
      v66 = -3;
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  v161 = v55;
  handleForCategory(0);
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    sub_21456C0F0(v66, v76, v150, v151, v152, v153, v154, v155);
  v83 = 0;
LABEL_28:

  objc_msgSend_sharedSingleton(CRFileSystemController, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend_cleanupFileSystemForRepair(v94, v95, v96, v97);

  v101 = -18;
  if (v66)
    v101 = v66;
  if (v98)
    v102 = v66;
  else
    v102 = v101;
  if (v67)
  {
    objc_msgSend_getInnermostNSError_(CRUtils, v99, (uint64_t)v67, v100);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (void *)MEMORY[0x24BDD16E0];
    v108 = objc_msgSend_code(v103, v105, v106, v107);
    objc_msgSend_numberWithInteger_(v104, v109, v108, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v103, v112, v113, v114);
    v169 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v111 = 0;
    v169 = 0;
  }
  v176[0] = CFSTR("statusCode");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v99, v102, v100);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = CFSTR("data");
  v177[0] = v162;
  v174[0] = CFSTR("fdrErrorCode");
  v118 = (uint64_t)v111;
  if (!v111)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v115, v116, v117);
    v118 = objc_claimAutoreleasedReturnValue();
  }
  v168 = v6;
  v160 = (void *)v118;
  v175[0] = v118;
  v174[1] = CFSTR("fdrErrorDescription");
  v119 = (uint64_t)v169;
  if (!v169)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v115, v116, v117);
    v119 = objc_claimAutoreleasedReturnValue();
  }
  v166 = v7;
  v175[1] = v119;
  v174[2] = CFSTR("oldSealingManifest");
  v120 = v173;
  v121 = v173;
  if (!v173)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v115, v116, v117);
    v121 = (id)objc_claimAutoreleasedReturnValue();
  }
  v158 = v121;
  v159 = (void *)v119;
  v175[2] = v121;
  v174[3] = CFSTR("newSealingManifest");
  v122 = v172;
  v123 = v172;
  if (!v172)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v115, v116, v117);
    v123 = (id)objc_claimAutoreleasedReturnValue();
  }
  v165 = v18;
  v156 = v123;
  v175[3] = v123;
  v174[4] = CFSTR("Stats");
  v124 = v171;
  v125 = v171;
  if (!v171)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v115, v116, v117, v123, v158, v159, v160);
    v125 = (id)objc_claimAutoreleasedReturnValue();
  }
  v163 = v67;
  v175[4] = v125;
  v174[5] = CFSTR("warnings");
  v126 = v83;
  if (!v83)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v115, v116, v117);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v175[5] = v126;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v115, (uint64_t)v175, (uint64_t)v174, 6, v156);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v177[1] = v127;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v128, (uint64_t)v177, (uint64_t)v176, 2);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v164[2](v164, v129);

  if (!v83)
  if (!v124)

  if (v122)
  {
    if (v120)
      goto LABEL_54;
  }
  else
  {

    if (v120)
      goto LABEL_54;
  }

LABEL_54:
  if (!v169)

  if (!v111)
}

- (void)daemonControl:(id)a3 withReply:(id)a4
{
  MEMORY[0x24BEDD108](CRDaemonController, sel_controlWithParameters_withReply_, a3, a4);
}

- (void)queryRepairDeltaWithReply:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v3 = (void *)objc_opt_new();
  v6 = v3;
  if (v3)
  {
    objc_msgSend_queryRepairDeltaWithReply_(v3, v4, (uint64_t)v8, v5);
  }
  else if (v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v4, (uint64_t)CFSTR("com.apple.corerepair"), -81, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v7);

  }
}

- (void)issueRepairCert:(id)a3 withReply:(id)a4
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v8 = v6;
  if (v6)
  {
    objc_msgSend_issueRepairCert_withReply_(v6, v7, (uint64_t)v10, (uint64_t)v5);
  }
  else if (v5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("com.apple.corerepair"), -81, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, 0, v9);

  }
}

- (void)challengeStrongComponents:(id)a3 withReply:(id)a4
{
  id v6;
  CoreRepairHelper *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_opt_new();
  v10 = v8;
  if (v8)
  {
    objc_msgSend_challengeStrongComponents_withReply_(v8, v9, (uint64_t)v12, (uint64_t)v6);
  }
  else if (v6)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v9, (uint64_t)CFSTR("com.apple.corerepair"), -81, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v11);

  }
  objc_sync_exit(v7);

}

- (void)sign:(id)a3 keyBlob:(id)a4 withReply:(id)a5
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend_sign_keyBlob_(v9, v10, (uint64_t)v8, (uint64_t)v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v12[2](v12, v11);

}

- (void)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5 withReply:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  v14 = objc_msgSend_verify_signature_keyBlob_(v12, v13, (uint64_t)v11, (uint64_t)v10, v9);

  v15 = v16;
  if (v16)
  {
    (*((void (**)(id, uint64_t))v16 + 2))(v16, v14);
    v15 = v16;
  }

}

- (BOOL)_mount:(const char *)a3 withFlag:(int)a4
{
  fstab *v6;
  NSObject *v7;
  int *v8;
  char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  char *fs_spec;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v16 = 0u;
  v15 = 0u;
  v6 = getfsfile(a3);
  if (!v6)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = a3;
      v10 = "get fs file failed for mount %s";
      v11 = v7;
      v12 = 12;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  fs_spec = v6->fs_spec;
  if (mount(v6->fs_vfstype, a3, a4, &fs_spec))
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = __error();
      v9 = strerror(*v8);
      *(_DWORD *)buf = 136315394;
      v19 = a3;
      v20 = 2080;
      v21 = v9;
      v10 = "mount failed for %s filesystem: %s\n";
      v11 = v7;
      v12 = 22;
LABEL_7:
      _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (void)decompressPearlFramesWithReply:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend_decompressPearlFrames(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v8[2](v8, v7);

}

- (void)updateSavageDATFirmwareWithReply:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend_updateSavageDATFirmware(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v8[2](v8, v7);

}

- (void)updateBrunorDATFirmwareWithReply:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend_updateBrunorDATFirmware(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v8[2](v8, v7);

}

- (void)verifyPSD3WithReply:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend_verifyPSD3(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v8[2](v8, v7);

}

- (BOOL)factoryServiceOn
{
  return self->_factoryServiceOn;
}

- (void)setFactoryServiceOn:(BOOL)a3
{
  self->_factoryServiceOn = a3;
}

@end
