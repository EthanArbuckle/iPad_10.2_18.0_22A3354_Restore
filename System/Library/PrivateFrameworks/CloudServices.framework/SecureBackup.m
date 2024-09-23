@implementation SecureBackup

+ (unsigned)needPasscodeForHSA2EscrowRecordUpdate:(id *)a3
{
  uint32_t state;
  const char *v5;
  uint32_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  unsigned int v11;
  int v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  const char *v32;
  id v33;
  uint64_t state64;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (qword_253E78AF0 != -1)
    dispatch_once(&qword_253E78AF0, &unk_24C759AA0);
  if ((byte_253E78B01 & 1) == 0)
  {
    sub_20D67C0DC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "unable to fetch passcode_request token";
      v9 = v7;
      v10 = 2;
      goto LABEL_9;
    }
LABEL_10:

    return 0;
  }
  state64 = 0;
  state = notify_get_state(dword_253E78AFC, &state64);
  if (state)
  {
    v6 = state;
    sub_20D67C0DC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v6;
      v8 = "unable to fetch state of passcode_request token (%d)";
      v9 = v7;
      v10 = 8;
LABEL_9:
      _os_log_impl(&dword_20D67A000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!state64)
  {
    sub_20D67C0DC();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D67A000, v24, OS_LOG_TYPE_DEFAULT, "do initial state fetch in the background", buf, 2u);
    }

    objc_msgSend_asyncRequestEscrowRecordUpdate(a1, v25, v26);
    return 0;
  }
  if ((state64 & 4) == 0)
  {
    v33 = 0;
    v13 = objc_msgSend_daemonPasscodeRequestOpinion_(a1, v5, (uint64_t)&v33);
    v14 = v33;
    v17 = v14;
    if (v14)
    {
      objc_msgSend_domain(v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v18, v19, *MEMORY[0x24BDD1100]))
      {
        v22 = objc_msgSend_code(v17, v20, v21);

        if (v22 == -25308)
        {
          sub_20D67C0DC();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D67A000, v23, OS_LOG_TYPE_DEFAULT, "daemon unable to determine passcode status due to keybag lock; relying on dispatch state",
              buf,
              2u);
          }

          goto LABEL_28;
        }
      }
      else
      {

      }
      sub_20D67C0DC();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v17;
        _os_log_impl(&dword_20D67A000, v30, OS_LOG_TYPE_DEFAULT, "unable to ask daemon for confirmation of passcode request: %@", buf, 0xCu);
      }
      v11 = 0;
      goto LABEL_49;
    }
    if ((v13 & 0xFFFFFFFE) != 2)
    {
      sub_20D67C0DC();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D67A000, v30, OS_LOG_TYPE_DEFAULT, "daemon believes there's no need for a passcode", buf, 2u);
      }
      goto LABEL_39;
    }
LABEL_28:
    v28 = state64;
    if ((state64 & 2) != 0)
    {
      sub_20D67C0DC();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D67A000, v30, OS_LOG_TYPE_DEFAULT, "Need password on next unlock", buf, 2u);
      }
      v11 = 3;
      goto LABEL_49;
    }
    if ((state64 & 1) != 0)
    {
      sub_20D67C0DC();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "Desire password when available";
LABEL_47:
        v11 = 2;
        _os_log_impl(&dword_20D67A000, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
        goto LABEL_49;
      }
    }
    else
    {
      sub_20D67C0DC();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_20D696368((uint64_t *)&state64, v30, v31);
LABEL_39:
        v11 = 1;
LABEL_49:

        return v11;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "Dispatch doesn't have a state for us yet, opportunistically asking for the password";
        goto LABEL_47;
      }
    }
    v11 = 2;
    goto LABEL_49;
  }
  sub_20D67C0DC();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D67A000, v27, OS_LOG_TYPE_DEFAULT, "No need for passcode", buf, 2u);
  }

  return 1;
}

+ (void)asyncRequestEscrowRecordUpdate
{
  unsigned __int8 v3;
  NSObject *v4;
  _QWORD block[5];

  do
    v3 = __ldaxr(byte_253E78B08);
  while (__stlxr(1u, byte_253E78B08));
  if ((v3 & 1) == 0)
  {
    dispatch_get_global_queue(9, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20D67BDE8;
    block[3] = &unk_24C759E90;
    block[4] = a1;
    dispatch_async(v4, block);

  }
}

+ (unsigned)daemonPasscodeRequestOpinion:(id *)a3
{
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  _QWORD activity_block[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_20D6821B4;
  v30 = sub_20D67BB6C;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20D686EC0;
  v21[3] = &unk_24C759CE0;
  v21[4] = &v26;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_20D6963D4(v8, v9, v10);

  }
  activity_block[0] = v5;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D686F2C;
  activity_block[3] = &unk_24C759DF8;
  v19 = &v26;
  v20 = &v22;
  v17 = v7;
  v18 = v4;
  v11 = v4;
  v12 = v7;
  _os_activity_initiate(&dword_20D67A000, "calling daemonPasscodeRequestOpinion in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
  {
    v13 = (void *)v27[5];
    if (v13)
      *a3 = objc_retainAutorelease(v13);
  }
  v14 = *((_DWORD *)v23 + 6);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)_CreateSecureBackupConnection
{
  NSObject *v2;
  const char *v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_20D67C0DC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = getuid();
    v15 = 2080;
    v16 = getprogname();
    _os_log_impl(&dword_20D67A000, v2, OS_LOG_TYPE_DEFAULT, "creating connection to sbd: uid %d, progname %s", (uint8_t *)v14, 0x12u);
  }

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v3, (uint64_t)&unk_2549C72D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D68A4E8(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD1988]);
  v8 = (void *)objc_msgSend_initWithMachServiceName_options_(v6, v7, (uint64_t)CFSTR("com.apple.SecureBackupDaemon"), 0);
  objc_msgSend_setRemoteObjectInterface_(v8, v9, (uint64_t)v5);
  objc_msgSend_resume(v8, v10, v11);
  sub_20D67C0DC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_20D67A000, v12, OS_LOG_TYPE_DEFAULT, "sbd connection created", (uint8_t *)v14, 2u);
  }

  return v8;
}

+ (id)_ClassCreateSecureBackupConcurrentConnection
{
  NSObject *v2;
  const char *v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_20D67C0DC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = getuid();
    v15 = 2080;
    v16 = getprogname();
    _os_log_impl(&dword_20D67A000, v2, OS_LOG_TYPE_DEFAULT, "creating connection to sbd: uid %d, progname %s", (uint8_t *)v14, 0x12u);
  }

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v3, (uint64_t)&unk_2549C7338);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D68A864(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD1988]);
  v8 = (void *)objc_msgSend_initWithMachServiceName_options_(v6, v7, (uint64_t)CFSTR("com.apple.SecureBackupDaemon.concurrent"), 0);
  objc_msgSend_setRemoteObjectInterface_(v8, v9, (uint64_t)v5);
  objc_msgSend_resume(v8, v10, v11);
  sub_20D67C0DC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_20D67A000, v12, OS_LOG_TYPE_DEFAULT, "sbd connection created", (uint8_t *)v14, 2u);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecureBackup)initWithUserActivityLabel:(id)a3
{
  id v4;
  SecureBackup *v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSString *activityLabel;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSUUID *activityUUID;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SecureBackup;
  v5 = -[SecureBackup init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (qword_253E78B18 != -1)
      dispatch_once(&qword_253E78B18, &unk_24C759FA0);
    v7 = (id)qword_253E78B10;
    v9 = objc_msgSend_initWithFormat_(v6, v8, (uint64_t)CFSTR("%@: %@"), v7, v4);
    activityLabel = v5->_activityLabel;
    v5->_activityLabel = (NSString *)v9;

    objc_msgSend_UUID(MEMORY[0x24BDD1880], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    activityUUID = v5->_activityUUID;
    v5->_activityUUID = (NSUUID *)v13;

    sub_20D67C0DC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_UUIDString(v5->_activityUUID, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v5->_activityLabel;
      *(_DWORD *)buf = 138412546;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_20D67A000, v15, OS_LOG_TYPE_INFO, "New SecureBackup object: %@ %@", buf, 0x16u);

    }
  }

  return v5;
}

- (SecureBackup)init
{
  return (SecureBackup *)objc_msgSend_initWithUserActivityLabel_(self, a2, (uint64_t)CFSTR("unknown activity"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  const char *v189;
  uint64_t v190;
  const char *v191;
  id v192;

  v4 = a3;
  objc_msgSend_appleID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, CFSTR("SecureBackupAuthenticationAppleID"));

  objc_msgSend_authToken(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, CFSTR("SecureBackupAuthenticationAuthToken"));

  objc_msgSend_backOffDate(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, CFSTR("SecureBackupBackOffDate"));

  objc_msgSend_countryDialCode(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, CFSTR("countryDialCode"));

  objc_msgSend_countryCode(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, CFSTR("countryISOCode"));

  v27 = objc_msgSend_deleteAll(self, v25, v26);
  objc_msgSend_encodeBool_forKey_(v4, v28, v27, CFSTR("SecureBackupiCloudDataProtectionDeleteAllRecords"));
  objc_msgSend_dsid(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, CFSTR("SecureBackupAuthenticationDSID"));

  objc_msgSend_emcsCred(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)v35, CFSTR("SecureBackupEMCSManagedCredential"));

  objc_msgSend_emcsDict(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v40, (uint64_t)v39, CFSTR("SecureBackupEMCSIDMSDict"));

  v43 = objc_msgSend_emcsMode(self, v41, v42);
  objc_msgSend_encodeBool_forKey_(v4, v44, v43, CFSTR("SecureBackupContainsEMCSData"));
  objc_msgSend_escrowProxyURL(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v48, (uint64_t)v47, CFSTR("SecureBackupAuthenticationEscrowProxyURL"));

  v51 = objc_msgSend_excludeiCDPRecords(self, v49, v50);
  objc_msgSend_encodeBool_forKey_(v4, v52, v51, CFSTR("SecureBackupExcludeiCDPRecords"));
  v55 = objc_msgSend_fmipRecovery(self, v53, v54);
  objc_msgSend_encodeBool_forKey_(v4, v56, v55, CFSTR("SecureBackupFMiPRecoveryKey"));
  objc_msgSend_fmipUUID(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v59, CFSTR("SecureBackupFMiPUUIDKey"));

  v63 = objc_msgSend_icdp(self, v61, v62);
  objc_msgSend_encodeBool_forKey_(v4, v64, v63, CFSTR("SecureBackupContainsiCDPData"));
  objc_msgSend_iCloudEnv(self, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v68, (uint64_t)v67, CFSTR("SecureBackupAuthenticationiCloudEnvironment"));

  objc_msgSend_iCloudIdentityData(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v72, (uint64_t)v71, CFSTR("SecureBackupiCloudIdentityData"));

  objc_msgSend_iCloudPassword(self, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v76, (uint64_t)v75, CFSTR("SecureBackupAuthenticationPassword"));

  objc_msgSend_idmsData(self, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v80, (uint64_t)v79, CFSTR("SecureBackupIDMSData"));

  v83 = objc_msgSend_idmsRecovery(self, v81, v82);
  objc_msgSend_encodeBool_forKey_(v4, v84, v83, CFSTR("SecureBackupIDMSRecovery"));
  objc_msgSend_metadata(self, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v88, (uint64_t)v87, CFSTR("SecureBackupMetadata"));

  objc_msgSend_metadataHash(self, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v92, (uint64_t)v91, CFSTR("SecureBackupStingrayMetadataHash"));

  objc_msgSend_oldEMCSCred(self, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v96, (uint64_t)v95, CFSTR("SecureBackupEMCSOldManagedCredential"));

  objc_msgSend_passphrase(self, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v100, (uint64_t)v99, CFSTR("SecureBackupPassphrase"));

  objc_msgSend_recordID(self, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v104, (uint64_t)v103, CFSTR("recordID"));

  objc_msgSend_recoveryKey(self, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v108, (uint64_t)v107, CFSTR("SecureBackupRecoveryKey"));

  objc_msgSend_smsTarget(self, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v112, (uint64_t)v111, CFSTR("phoneNumber"));

  v115 = objc_msgSend_silent(self, v113, v114);
  objc_msgSend_encodeBool_forKey_(v4, v116, v115, CFSTR("SecureBackupSilentRecoveryAttempt"));
  objc_msgSend_specifiedFederation(self, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v120, (uint64_t)v119, CFSTR("SecureBackupSpecifiedFederation"));

  v123 = objc_msgSend_stingray(self, v121, v122);
  objc_msgSend_encodeBool_forKey_(v4, v124, v123, CFSTR("SecureBackupContainsiCloudIdentity"));
  v127 = objc_msgSend_synchronize(self, v125, v126);
  objc_msgSend_encodeBool_forKey_(v4, v128, v127, CFSTR("SecureBackupSynchronize"));
  v131 = objc_msgSend_useCachedPassphrase(self, v129, v130);
  objc_msgSend_encodeBool_forKey_(v4, v132, v131, CFSTR("SecureBackupUseCachedPassphrase"));
  objc_msgSend_hsa2CachedPrerecordUUID(self, v133, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v136, (uint64_t)v135, CFSTR("SecureBackupHSA2CachedPrerecordUUID"));

  v139 = objc_msgSend_useRecoveryPET(self, v137, v138);
  objc_msgSend_encodeBool_forKey_(v4, v140, v139, CFSTR("SecureBackupIDMSRecovery"));
  v143 = objc_msgSend_usesMultipleiCSC(self, v141, v142);
  objc_msgSend_encodeBool_forKey_(v4, v144, v143, CFSTR("SecureBackupUsesMultipleiCSCs"));
  v147 = objc_msgSend_usesRandomPassphrase(self, v145, v146);
  objc_msgSend_encodeBool_forKey_(v4, v148, v147, CFSTR("SecureBackupUsesRandomPassphrase"));
  v151 = objc_msgSend_usesRecoveryKey(self, v149, v150);
  objc_msgSend_encodeBool_forKey_(v4, v152, v151, CFSTR("SecureBackupUsesRecoveryKey"));
  objc_msgSend_verificationToken(self, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v156, (uint64_t)v155, CFSTR("SecureBackupVerifcationToken"));

  objc_msgSend_activityLabel(self, v157, v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v160, (uint64_t)v159, CFSTR("activityLabel"));

  objc_msgSend_activityUUID(self, v161, v162);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v164, (uint64_t)v163, CFSTR("activityUUID"));

  v167 = objc_msgSend_suppressServerFiltering(self, v165, v166);
  objc_msgSend_encodeBool_forKey_(v4, v168, v167, CFSTR("SecureBackupSuppressServerFiltering"));
  v171 = objc_msgSend_silentDoubleRecovery(self, v169, v170);
  objc_msgSend_encodeBool_forKey_(v4, v172, v171, CFSTR("SecureBackupSilentDoubleRecovery"));
  v175 = objc_msgSend_deleteDoubleOnly(self, v173, v174);
  objc_msgSend_encodeBool_forKey_(v4, v176, v175, CFSTR("SecureBackupDeleteDoubleOnly"));
  v179 = objc_msgSend_nonViableRepair(self, v177, v178);
  objc_msgSend_encodeBool_forKey_(v4, v180, v179, CFSTR("SecureBackupNonViableRepairKey"));
  v183 = objc_msgSend_sosCompatibleEscrowSorting(self, v181, v182);
  objc_msgSend_encodeBool_forKey_(v4, v184, v183, CFSTR("SecureBackupSOSCompatibleEscrowSorting"));
  objc_msgSend_deviceSessionID(self, v185, v186);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v188, (uint64_t)v187, CFSTR("SecureBackupDeviceSessionIDKey"));

  objc_msgSend_flowID(self, v189, v190);
  v192 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v191, (uint64_t)v192, CFSTR("SecureBackupFlowIDKey"));

}

- (SecureBackup)initWithCoder:(id)a3
{
  id v4;
  SecureBackup *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *appleID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *authToken;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSDate *backOffDate;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSString *countryDialCode;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSString *countryCode;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSString *dsid;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSString *emcsCred;
  const char *v35;
  uint64_t v36;
  NSDictionary *emcsDict;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  NSString *escrowProxyURL;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  NSString *fmipUUID;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSString *iCloudEnv;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  NSData *iCloudIdentityData;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  NSString *iCloudPassword;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  NSData *idmsData;
  const char *v66;
  const char *v67;
  uint64_t v68;
  NSDictionary *metadata;
  const char *v70;
  uint64_t v71;
  NSDictionary *metadataHash;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  NSString *oldEMCSCred;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  NSString *passphrase;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  NSString *recordID;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  NSString *recoveryKey;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  NSString *smsTarget;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  NSNumber *specifiedFederation;
  const char *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  NSString *hsa2CachedPrerecordUUID;
  const char *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  NSString *verificationToken;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  NSString *activityLabel;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  NSUUID *activityUUID;
  const char *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  NSString *deviceSessionID;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  NSString *flowID;
  NSObject *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  NSString *v138;
  objc_super v140;
  uint8_t buf[4];
  void *v142;
  __int16 v143;
  NSString *v144;
  uint64_t v145;

  v145 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v140.receiver = self;
  v140.super_class = (Class)SecureBackup;
  v5 = -[SecureBackup init](&v140, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("SecureBackupAuthenticationAppleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("SecureBackupAuthenticationAuthToken"));
    v12 = objc_claimAutoreleasedReturnValue();
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("SecureBackupBackOffDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    backOffDate = v5->_backOffDate;
    v5->_backOffDate = (NSDate *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("countryDialCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    countryDialCode = v5->_countryDialCode;
    v5->_countryDialCode = (NSString *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, CFSTR("countryISOCode"));
    v24 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v24;

    v5->_deleteAll = objc_msgSend_decodeBoolForKey_(v4, v26, (uint64_t)CFSTR("SecureBackupiCloudDataProtectionDeleteAllRecords"));
    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, CFSTR("SecureBackupAuthenticationDSID"));
    v29 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, CFSTR("SecureBackupEMCSManagedCredential"));
    v33 = objc_claimAutoreleasedReturnValue();
    emcsCred = v5->_emcsCred;
    v5->_emcsCred = (NSString *)v33;

    objc_msgSend_decodePropertyListForKey_(v4, v35, (uint64_t)CFSTR("SecureBackupEMCSIDMSDict"));
    v36 = objc_claimAutoreleasedReturnValue();
    emcsDict = v5->_emcsDict;
    v5->_emcsDict = (NSDictionary *)v36;

    v5->_emcsMode = objc_msgSend_decodeBoolForKey_(v4, v38, (uint64_t)CFSTR("SecureBackupContainsEMCSData"));
    v39 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, CFSTR("SecureBackupAuthenticationEscrowProxyURL"));
    v41 = objc_claimAutoreleasedReturnValue();
    escrowProxyURL = v5->_escrowProxyURL;
    v5->_escrowProxyURL = (NSString *)v41;

    v5->_excludeiCDPRecords = objc_msgSend_decodeBoolForKey_(v4, v43, (uint64_t)CFSTR("SecureBackupExcludeiCDPRecords"));
    v5->_fmipRecovery = objc_msgSend_decodeBoolForKey_(v4, v44, (uint64_t)CFSTR("SecureBackupFMiPRecoveryKey"));
    v45 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, CFSTR("SecureBackupFMiPUUIDKey"));
    v47 = objc_claimAutoreleasedReturnValue();
    fmipUUID = v5->_fmipUUID;
    v5->_fmipUUID = (NSString *)v47;

    v5->_icdp = objc_msgSend_decodeBoolForKey_(v4, v49, (uint64_t)CFSTR("SecureBackupContainsiCDPData"));
    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, CFSTR("SecureBackupAuthenticationiCloudEnvironment"));
    v52 = objc_claimAutoreleasedReturnValue();
    iCloudEnv = v5->_iCloudEnv;
    v5->_iCloudEnv = (NSString *)v52;

    v54 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, CFSTR("SecureBackupiCloudIdentityData"));
    v56 = objc_claimAutoreleasedReturnValue();
    iCloudIdentityData = v5->_iCloudIdentityData;
    v5->_iCloudIdentityData = (NSData *)v56;

    v58 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, CFSTR("SecureBackupAuthenticationPassword"));
    v60 = objc_claimAutoreleasedReturnValue();
    iCloudPassword = v5->_iCloudPassword;
    v5->_iCloudPassword = (NSString *)v60;

    v62 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, CFSTR("SecureBackupIDMSData"));
    v64 = objc_claimAutoreleasedReturnValue();
    idmsData = v5->_idmsData;
    v5->_idmsData = (NSData *)v64;

    v5->_idmsRecovery = objc_msgSend_decodeBoolForKey_(v4, v66, (uint64_t)CFSTR("SecureBackupIDMSRecovery"));
    objc_msgSend_decodePropertyListForKey_(v4, v67, (uint64_t)CFSTR("SecureBackupMetadata"));
    v68 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v68;

    objc_msgSend_decodePropertyListForKey_(v4, v70, (uint64_t)CFSTR("SecureBackupStingrayMetadataHash"));
    v71 = objc_claimAutoreleasedReturnValue();
    metadataHash = v5->_metadataHash;
    v5->_metadataHash = (NSDictionary *)v71;

    v73 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v74, v73, CFSTR("SecureBackupEMCSOldManagedCredential"));
    v75 = objc_claimAutoreleasedReturnValue();
    oldEMCSCred = v5->_oldEMCSCred;
    v5->_oldEMCSCred = (NSString *)v75;

    v77 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v78, v77, CFSTR("SecureBackupPassphrase"));
    v79 = objc_claimAutoreleasedReturnValue();
    passphrase = v5->_passphrase;
    v5->_passphrase = (NSString *)v79;

    v81 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, CFSTR("recordID"));
    v83 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v83;

    v85 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v85, CFSTR("SecureBackupRecoveryKey"));
    v87 = objc_claimAutoreleasedReturnValue();
    recoveryKey = v5->_recoveryKey;
    v5->_recoveryKey = (NSString *)v87;

    v89 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v90, v89, CFSTR("phoneNumber"));
    v91 = objc_claimAutoreleasedReturnValue();
    smsTarget = v5->_smsTarget;
    v5->_smsTarget = (NSString *)v91;

    v5->_silent = objc_msgSend_decodeBoolForKey_(v4, v93, (uint64_t)CFSTR("SecureBackupSilentRecoveryAttempt"));
    v94 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v95, v94, CFSTR("SecureBackupSpecifiedFederation"));
    v96 = objc_claimAutoreleasedReturnValue();
    specifiedFederation = v5->_specifiedFederation;
    v5->_specifiedFederation = (NSNumber *)v96;

    v5->_stingray = objc_msgSend_decodeBoolForKey_(v4, v98, (uint64_t)CFSTR("SecureBackupContainsiCloudIdentity"));
    v5->_synchronize = objc_msgSend_decodeBoolForKey_(v4, v99, (uint64_t)CFSTR("SecureBackupSynchronize"));
    v5->_useCachedPassphrase = objc_msgSend_decodeBoolForKey_(v4, v100, (uint64_t)CFSTR("SecureBackupUseCachedPassphrase"));
    v101 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v102, v101, CFSTR("SecureBackupHSA2CachedPrerecordUUID"));
    v103 = objc_claimAutoreleasedReturnValue();
    hsa2CachedPrerecordUUID = v5->_hsa2CachedPrerecordUUID;
    v5->_hsa2CachedPrerecordUUID = (NSString *)v103;

    v5->_useRecoveryPET = objc_msgSend_decodeBoolForKey_(v4, v105, (uint64_t)CFSTR("SecureBackupIDMSRecovery"));
    v5->_usesMultipleiCSC = objc_msgSend_decodeBoolForKey_(v4, v106, (uint64_t)CFSTR("SecureBackupUsesMultipleiCSCs"));
    v5->_usesRandomPassphrase = objc_msgSend_decodeBoolForKey_(v4, v107, (uint64_t)CFSTR("SecureBackupUsesRandomPassphrase"));
    v5->_usesRecoveryKey = objc_msgSend_decodeBoolForKey_(v4, v108, (uint64_t)CFSTR("SecureBackupUsesRecoveryKey"));
    v109 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v110, v109, CFSTR("SecureBackupVerifcationToken"));
    v111 = objc_claimAutoreleasedReturnValue();
    verificationToken = v5->_verificationToken;
    v5->_verificationToken = (NSString *)v111;

    v113 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v114, v113, CFSTR("activityLabel"));
    v115 = objc_claimAutoreleasedReturnValue();
    activityLabel = v5->_activityLabel;
    v5->_activityLabel = (NSString *)v115;

    v117 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v118, v117, CFSTR("activityUUID"));
    v119 = objc_claimAutoreleasedReturnValue();
    activityUUID = v5->_activityUUID;
    v5->_activityUUID = (NSUUID *)v119;

    v5->_suppressServerFiltering = objc_msgSend_decodeBoolForKey_(v4, v121, (uint64_t)CFSTR("SecureBackupSuppressServerFiltering"));
    v5->_silentDoubleRecovery = objc_msgSend_decodeBoolForKey_(v4, v122, (uint64_t)CFSTR("SecureBackupSilentDoubleRecovery"));
    v5->_deleteDoubleOnly = objc_msgSend_decodeBoolForKey_(v4, v123, (uint64_t)CFSTR("SecureBackupDeleteDoubleOnly"));
    v5->_nonViableRepair = objc_msgSend_decodeBoolForKey_(v4, v124, (uint64_t)CFSTR("SecureBackupNonViableRepairKey"));
    v5->_sosCompatibleEscrowSorting = objc_msgSend_decodeBoolForKey_(v4, v125, (uint64_t)CFSTR("SecureBackupSOSCompatibleEscrowSorting"));
    v126 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v127, v126, CFSTR("SecureBackupDeviceSessionIDKey"));
    v128 = objc_claimAutoreleasedReturnValue();
    deviceSessionID = v5->_deviceSessionID;
    v5->_deviceSessionID = (NSString *)v128;

    v130 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v131, v130, CFSTR("SecureBackupFlowIDKey"));
    v132 = objc_claimAutoreleasedReturnValue();
    flowID = v5->_flowID;
    v5->_flowID = (NSString *)v132;

    sub_20D67C0DC();
    v134 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_UUIDString(v5->_activityUUID, v135, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = v5->_activityLabel;
      *(_DWORD *)buf = 138412546;
      v142 = v137;
      v143 = 2112;
      v144 = v138;
      _os_log_impl(&dword_20D67A000, v134, OS_LOG_TYPE_INFO, "Deserialized SecureBackup object: %@ %@", buf, 0x16u);

    }
  }

  return v5;
}

- (void)populateWithInfo:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t isEqualToNumber;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  void *v64;
  const char *v65;
  const char *v66;
  void *v67;
  const char *v68;
  const char *v69;
  void *v70;
  const char *v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  void *v78;
  const char *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  void *v84;
  const char *v85;
  const char *v86;
  void *v87;
  const char *v88;
  const char *v89;
  void *v90;
  const char *v91;
  const char *v92;
  void *v93;
  const char *v94;
  const char *v95;
  void *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  const char *v103;
  void *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  const char *v109;
  void *v110;
  const char *v111;
  const char *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  const char *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  const char *v127;
  void *v128;
  const char *v129;
  const char *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  const char *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  const char *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  const char *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  const char *v150;
  void *v151;
  const char *v152;
  const char *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  const char *v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  const char *v162;
  const char *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  const char *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  const char *v172;
  const char *v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  const char *v178;
  void *v179;
  const char *v180;
  const char *v181;
  void *v182;
  const char *v183;
  id v184;

  v184 = a3;
  objc_msgSend_objectForKeyedSubscript_(v184, v4, (uint64_t)CFSTR("SecureBackupAuthenticationAppleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppleID_(self, v6, (uint64_t)v5);

  objc_msgSend_objectForKeyedSubscript_(v184, v7, (uint64_t)CFSTR("SecureBackupAuthenticationAuthToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAuthToken_(self, v9, (uint64_t)v8);

  objc_msgSend_objectForKeyedSubscript_(v184, v10, (uint64_t)CFSTR("SecureBackupBackOffDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackOffDate_(self, v12, (uint64_t)v11);

  objc_msgSend_objectForKeyedSubscript_(v184, v13, (uint64_t)CFSTR("countryDialCode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCountryDialCode_(self, v15, (uint64_t)v14);

  objc_msgSend_objectForKeyedSubscript_(v184, v16, (uint64_t)CFSTR("countryISOCode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCountryCode_(self, v18, (uint64_t)v17);

  objc_msgSend_objectForKeyedSubscript_(v184, v19, (uint64_t)CFSTR("SecureBackupiCloudDataProtectionDeleteAllRecords"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDBD1C8];
  isEqualToNumber = objc_msgSend_isEqualToNumber_(v20, v22, MEMORY[0x24BDBD1C8]);
  objc_msgSend_setDeleteAll_(self, v24, isEqualToNumber);

  objc_msgSend_objectForKeyedSubscript_(v184, v25, (uint64_t)CFSTR("SecureBackupAuthenticationDSID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDsid_(self, v27, (uint64_t)v26);

  objc_msgSend_objectForKeyedSubscript_(v184, v28, (uint64_t)CFSTR("SecureBackupEMCSManagedCredential"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEmcsCred_(self, v30, (uint64_t)v29);

  objc_msgSend_objectForKeyedSubscript_(v184, v31, (uint64_t)CFSTR("SecureBackupEMCSIDMSDict"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEmcsDict_(self, v33, (uint64_t)v32);

  objc_msgSend_objectForKeyedSubscript_(v184, v34, (uint64_t)CFSTR("SecureBackupContainsEMCSData"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_isEqualToNumber_(v35, v36, v21);
  objc_msgSend_setEmcsMode_(self, v38, v37);

  objc_msgSend_objectForKeyedSubscript_(v184, v39, (uint64_t)CFSTR("SecureBackupAuthenticationEscrowProxyURL"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEscrowProxyURL_(self, v41, (uint64_t)v40);

  objc_msgSend_objectForKeyedSubscript_(v184, v42, (uint64_t)CFSTR("SecureBackupExcludeiCDPRecords"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_isEqualToNumber_(v43, v44, v21);
  objc_msgSend_setExcludeiCDPRecords_(self, v46, v45);

  objc_msgSend_objectForKeyedSubscript_(v184, v47, (uint64_t)CFSTR("SecureBackupFMiPRecoveryKey"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_isEqualToNumber_(v48, v49, v21);
  objc_msgSend_setFmipRecovery_(self, v51, v50);

  objc_msgSend_objectForKeyedSubscript_(v184, v52, (uint64_t)CFSTR("SecureBackupFMiPUUIDKey"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFmipUUID_(self, v54, (uint64_t)v53);

  objc_msgSend_objectForKeyedSubscript_(v184, v55, (uint64_t)CFSTR("SecureBackupContainsiCDPData"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend_isEqualToNumber_(v56, v57, v21);
  objc_msgSend_setIcdp_(self, v59, v58);

  objc_msgSend_objectForKeyedSubscript_(v184, v60, (uint64_t)CFSTR("SecureBackupAuthenticationiCloudEnvironment"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setICloudEnv_(self, v62, (uint64_t)v61);

  objc_msgSend_objectForKeyedSubscript_(v184, v63, (uint64_t)CFSTR("SecureBackupiCloudIdentityData"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setICloudIdentityData_(self, v65, (uint64_t)v64);

  objc_msgSend_objectForKeyedSubscript_(v184, v66, (uint64_t)CFSTR("SecureBackupAuthenticationPassword"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setICloudPassword_(self, v68, (uint64_t)v67);

  objc_msgSend_objectForKeyedSubscript_(v184, v69, (uint64_t)CFSTR("SecureBackupIDMSData"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdmsData_(self, v71, (uint64_t)v70);

  objc_msgSend_objectForKeyedSubscript_(v184, v72, (uint64_t)CFSTR("SecureBackupIDMSRecovery"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend_isEqualToNumber_(v73, v74, v21);
  objc_msgSend_setIdmsRecovery_(self, v76, v75);

  objc_msgSend_objectForKeyedSubscript_(v184, v77, (uint64_t)CFSTR("SecureBackupMetadata"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetadata_(self, v79, (uint64_t)v78);

  objc_msgSend_objectForKeyedSubscript_(v184, v80, (uint64_t)CFSTR("SecureBackupStingrayMetadataHash"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetadataHash_(self, v82, (uint64_t)v81);

  objc_msgSend_objectForKeyedSubscript_(v184, v83, (uint64_t)CFSTR("SecureBackupEMCSOldManagedCredential"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOldEMCSCred_(self, v85, (uint64_t)v84);

  objc_msgSend_objectForKeyedSubscript_(v184, v86, (uint64_t)CFSTR("SecureBackupPassphrase"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPassphrase_(self, v88, (uint64_t)v87);

  objc_msgSend_objectForKeyedSubscript_(v184, v89, (uint64_t)CFSTR("recordID"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordID_(self, v91, (uint64_t)v90);

  objc_msgSend_objectForKeyedSubscript_(v184, v92, (uint64_t)CFSTR("SecureBackupRecoveryKey"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecoveryKey_(self, v94, (uint64_t)v93);

  objc_msgSend_objectForKeyedSubscript_(v184, v95, (uint64_t)CFSTR("phoneNumber"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSmsTarget_(self, v97, (uint64_t)v96);

  objc_msgSend_smsTarget(self, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v100)
  {
    objc_msgSend_objectForKeyedSubscript_(v184, v101, (uint64_t)CFSTR("SecureBackupSMSTarget"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSmsTarget_(self, v103, (uint64_t)v102);

  }
  objc_msgSend_objectForKeyedSubscript_(v184, v101, (uint64_t)CFSTR("SecureBackupSilentRecoveryAttempt"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = MEMORY[0x24BDBD1C8];
  v107 = objc_msgSend_isEqualToNumber_(v104, v106, MEMORY[0x24BDBD1C8]);
  objc_msgSend_setSilent_(self, v108, v107);

  objc_msgSend_objectForKeyedSubscript_(v184, v109, (uint64_t)CFSTR("SecureBackupSpecifiedFederation"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSpecifiedFederation_(self, v111, (uint64_t)v110);

  objc_msgSend_objectForKeyedSubscript_(v184, v112, (uint64_t)CFSTR("SecureBackupContainsiCloudIdentity"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend_isEqualToNumber_(v113, v114, v105);
  objc_msgSend_setStingray_(self, v116, v115);

  objc_msgSend_objectForKeyedSubscript_(v184, v117, (uint64_t)CFSTR("SecureBackupSynchronize"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend_isEqualToNumber_(v118, v119, v105);
  objc_msgSend_setSynchronize_(self, v121, v120);

  objc_msgSend_objectForKeyedSubscript_(v184, v122, (uint64_t)CFSTR("SecureBackupUseCachedPassphrase"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend_isEqualToNumber_(v123, v124, v105);
  objc_msgSend_setUseCachedPassphrase_(self, v126, v125);

  objc_msgSend_objectForKeyedSubscript_(v184, v127, (uint64_t)CFSTR("SecureBackupHSA2CachedPrerecordUUID"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHsa2CachedPrerecordUUID_(self, v129, (uint64_t)v128);

  objc_msgSend_objectForKeyedSubscript_(v184, v130, (uint64_t)CFSTR("SecureBackupIDMSRecovery"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = objc_msgSend_isEqualToNumber_(v131, v132, v105);
  objc_msgSend_setUseRecoveryPET_(self, v134, v133);

  objc_msgSend_objectForKeyedSubscript_(v184, v135, (uint64_t)CFSTR("SecureBackupUsesMultipleiCSCs"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend_isEqualToNumber_(v136, v137, v105);
  objc_msgSend_setUsesMultipleiCSC_(self, v139, v138);

  objc_msgSend_objectForKeyedSubscript_(v184, v140, (uint64_t)CFSTR("SecureBackupUsesRandomPassphrase"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend_isEqualToNumber_(v141, v142, v105);
  objc_msgSend_setUsesRandomPassphrase_(self, v144, v143);

  objc_msgSend_objectForKeyedSubscript_(v184, v145, (uint64_t)CFSTR("SecureBackupUsesRecoveryKey"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend_isEqualToNumber_(v146, v147, v105);
  objc_msgSend_setUsesRecoveryKey_(self, v149, v148);

  objc_msgSend_objectForKeyedSubscript_(v184, v150, (uint64_t)CFSTR("SecureBackupVerifcationToken"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVerificationToken_(self, v152, (uint64_t)v151);

  objc_msgSend_objectForKeyedSubscript_(v184, v153, (uint64_t)CFSTR("SecureBackupSuppressServerFiltering"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = objc_msgSend_isEqualToNumber_(v154, v155, v105);
  objc_msgSend_setSuppressServerFiltering_(self, v157, v156);

  objc_msgSend_objectForKeyedSubscript_(v184, v158, (uint64_t)CFSTR("SecureBackupSilentDoubleRecovery"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend_isEqualToNumber_(v159, v160, v105);
  objc_msgSend_setSilentDoubleRecovery_(self, v162, v161);

  objc_msgSend_objectForKeyedSubscript_(v184, v163, (uint64_t)CFSTR("SecureBackupDeleteDoubleOnly"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend_isEqualToNumber_(v164, v165, v105);
  objc_msgSend_setDeleteDoubleOnly_(self, v167, v166);

  objc_msgSend_objectForKeyedSubscript_(v184, v168, (uint64_t)CFSTR("SecureBackupNonViableRepairKey"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = objc_msgSend_isEqualToNumber_(v169, v170, v105);
  objc_msgSend_setNonViableRepair_(self, v172, v171);

  objc_msgSend_objectForKeyedSubscript_(v184, v173, (uint64_t)CFSTR("SecureBackupSOSCompatibleEscrowSorting"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend_isEqualToNumber_(v174, v175, v105);
  objc_msgSend_setSosCompatibleEscrowSorting_(self, v177, v176);

  objc_msgSend_objectForKeyedSubscript_(v184, v178, (uint64_t)CFSTR("SecureBackupDeviceSessionIDKey"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceSessionID_(self, v180, (uint64_t)v179);

  objc_msgSend_objectForKeyedSubscript_(v184, v181, (uint64_t)CFSTR("SecureBackupFlowIDKey"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFlowID_(self, v183, (uint64_t)v182);

}

- (void)getAccountInfoWithResults:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D67E0CC;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67E13C;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling getAccountInfoWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)enableWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD activity_block[4];
  id v23;
  SecureBackup *v24;
  id v25;
  id v26;
  os_signpost_id_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  os_signpost_id_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_20D67E4E4;
  v29[3] = &unk_24C759B50;
  v9 = v4;
  v30 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _CloudServicesSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = _CloudServicesSignpostCreate(v12);
  v15 = v14;

  _CloudServicesSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D67A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EnableWithRequest", " enableTelemetry=YES ", buf, 2u);
  }

  _CloudServicesSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = v13;
    _os_log_impl(&dword_20D67A000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EnableWithRequest  enableTelemetry=YES ", buf, 0xCu);
  }

  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67E550;
  activity_block[3] = &unk_24C759BF0;
  v23 = v11;
  v24 = self;
  v27 = v13;
  v28 = v15;
  v25 = v7;
  v26 = v9;
  v19 = v9;
  v20 = v7;
  v21 = v11;
  _os_activity_initiate(&dword_20D67A000, "calling enableWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)recoverWithResults:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D67E8F4;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67E964;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling recoverWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)recoverRecordContents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D67EC0C;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67EC7C;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling recoverRecordContents in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)createICDPRecordWithContents:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SecureBackup *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend__CreateSecureBackupConnection(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20D67EF48;
  v24[3] = &unk_24C759B50;
  v12 = v7;
  v25 = v12;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v13, (uint64_t)v24);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = sub_20D67EFB4;
  v18[3] = &unk_24C759C40;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = self;
  v21 = v6;
  v22 = v10;
  v23 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v6;
  v17 = v19;
  _os_activity_initiate(&dword_20D67A000, "calling createICDPRecord in daemon", OS_ACTIVITY_FLAG_DEFAULT, v18);

}

- (void)disableWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D67F24C;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67F2B8;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling disableWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)stashRecoveryDataWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D67F54C;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67F5B8;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling stashRecoveryDataWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)updateMetadataWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D67F84C;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67F8B8;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling updateMetadata in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)cachePassphrase
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  _QWORD activity_block[4];
  id v13;
  SecureBackup *v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend__CreateSecureBackupConnection(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_20D67FB20;
  v15[3] = &unk_24C759C68;
  v16 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x212BA6D30](v15);
  objc_msgSend_remoteObjectProxy(v6, v8, v9);
  activity_block[0] = v5;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67FB90;
  activity_block[3] = &unk_24C759C90;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = self;
  v10 = v13;
  _os_activity_initiate(&dword_20D67A000, "calling cachePassphraseWithRequestAsync in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_msgSend_addBarrierBlock_(v6, v11, (uint64_t)v7);
}

- (void)cachePassphraseWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D67FCC0;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67FD2C;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling cachePassphraseWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)uncachePassphraseWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D67FF30;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D67FF9C;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling uncachePassphraseWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)cacheRecoveryKeyWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D6801A0;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D68020C;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling cacheRecoveryKeyWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)uncacheRecoveryKeyWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D680410;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D68047C;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling cacheRecoveryKeyWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)uncachePassphrase
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  _QWORD activity_block[4];
  id v13;
  SecureBackup *v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend__CreateSecureBackupConnection(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_20D680654;
  v15[3] = &unk_24C759C68;
  v16 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x212BA6D30](v15);
  objc_msgSend_remoteObjectProxy(v6, v8, v9);
  activity_block[0] = v5;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6806C4;
  activity_block[3] = &unk_24C759C90;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = self;
  v10 = v13;
  _os_activity_initiate(&dword_20D67A000, "calling uncachePassphraseWithRequestAsync in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_msgSend_addBarrierBlock_(v6, v11, (uint64_t)v7);
}

- (void)startSMSChallengeWithResults:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D6807F4;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D680864;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling startSMSChallengeWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)getCountrySMSCodesWithResults:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D680B0C;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D680B7C;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling getCountrySMSCodesWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)changeSMSTargetWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D680E24;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D680E90;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling changeSMSTargetWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (SecureBackup)backupWithInfo:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SecureBackup *result;
  _QWORD activity_block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend__CreateSecureBackupConnection(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20D681144;
  v24[3] = &unk_24C759B50;
  v12 = v7;
  v25 = v12;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v13, (uint64_t)v24);
  activity_block[0] = v11;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6811B0;
  activity_block[3] = &unk_24C759BA0;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v22 = v10;
  v23 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v6;
  v17 = v20;
  _os_activity_initiate(&dword_20D67A000, "calling backupWithInfo in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  return result;
}

- (void)backOffDateWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D681444;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6814B4;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling backOffDateWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)setBackOffDateWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D68175C;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6817C8;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling setBackOffDateWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)notificationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D67A000, v8, OS_LOG_TYPE_DEFAULT, "calling notificationInfo in daemon", buf, 2u);
  }

  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D681A98;
  v19[3] = &unk_24C759B50;
  v10 = v4;
  v20 = v10;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v11, (uint64_t)v19);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = sub_20D681B08;
  v15[3] = &unk_24C759CB8;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v18 = v10;
  v12 = v10;
  v13 = v7;
  v14 = v16;
  _os_activity_initiate(&dword_20D67A000, "calling notificationInfo in daemon", OS_ACTIVITY_FLAG_DEFAULT, v15);

}

- (void)stateCaptureWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D67A000, v8, OS_LOG_TYPE_DEFAULT, "calling stateCapture in daemon", buf, 2u);
  }

  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D681DDC;
  v19[3] = &unk_24C759B50;
  v10 = v4;
  v20 = v10;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v11, (uint64_t)v19);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = sub_20D681E4C;
  v15[3] = &unk_24C759CB8;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v18 = v10;
  v12 = v10;
  v13 = v7;
  v14 = v16;
  _os_activity_initiate(&dword_20D67A000, "calling stateCapture in daemon", OS_ACTIVITY_FLAG_DEFAULT, v15);

}

- (id)getAccountInfoWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  SecureBackup *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_20D6821B4;
  v33 = sub_20D67BB6C;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_20D6821B4;
  v27 = sub_20D67BB6C;
  v28 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_20D6821C4;
  v22[3] = &unk_24C759CE0;
  v22[4] = &v29;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D6957A8(v9, v10, v11);

  }
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = sub_20D682230;
  v16[3] = &unk_24C759D30;
  v17 = v8;
  v18 = self;
  v20 = &v29;
  v21 = &v23;
  v19 = v5;
  v12 = v5;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling getAccountInfoWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, v16);

  if (a3)
    *a3 = objc_retainAutorelease((id)v30[5]);
  v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

- (id)getAccountInfoWithInfo:(id)a3 results:(id *)a4
{
  const char *v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  v10 = 0;
  objc_msgSend_getAccountInfoWithError_(self, v6, (uint64_t)&v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v8;
}

- (void)getAccountInfoWithInfo:(id)a3 completionBlockWithResults:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_getAccountInfoWithResults_(self, v7, (uint64_t)v8);

}

- (void)getAccountInfoWithInfo:(id)a3 completionBlock:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_getAccountInfoWithInfo_completionBlockWithResults_, a3);
}

- (BOOL)updateMetadataWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD activity_block[4];
  id v17;
  SecureBackup *v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_20D6821B4;
  v26 = sub_20D67BB6C;
  v27 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20D68263C;
  v21[3] = &unk_24C759CE0;
  v21[4] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D69581C(v9, v10, v11);

  }
  activity_block[0] = v6;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6826A8;
  activity_block[3] = &unk_24C759D80;
  v17 = v8;
  v18 = self;
  v19 = v5;
  v20 = &v22;
  v12 = v5;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling updateMetadataWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v23[5]);
  v14 = v23[5];

  _Block_object_dispose(&v22, 8);
  return v14 == 0;
}

- (id)updateMetadataWithInfo:(id)a3
{
  const char *v4;
  char updated;
  id v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  v10 = 0;
  updated = objc_msgSend_updateMetadataWithError_(self, v4, (uint64_t)&v10);
  v6 = v10;
  v7 = v6;
  v8 = 0;
  if ((updated & 1) == 0)
    v8 = v6;

  return v8;
}

- (void)updateMetadataWithInfo:(id)a3 completionBlock:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_updateMetadataWithCompletionBlock_(self, v7, (uint64_t)v8);

}

- (BOOL)enableWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD activity_block[4];
  id v17;
  SecureBackup *v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_20D6821B4;
  v26 = sub_20D67BB6C;
  v27 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20D682A74;
  v21[3] = &unk_24C759CE0;
  v21[4] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D6958F8(v9, v10, v11);

  }
  activity_block[0] = v6;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D682AE0;
  activity_block[3] = &unk_24C759D80;
  v17 = v8;
  v18 = self;
  v19 = v5;
  v20 = &v22;
  v12 = v5;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling enableWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v23[5]);
  v14 = v23[5];

  _Block_object_dispose(&v22, 8);
  return v14 == 0;
}

- (id)enableWithInfo:(id)a3
{
  const char *v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  v10 = 0;
  v5 = objc_msgSend_enableWithError_(self, v4, (uint64_t)&v10);
  v6 = v10;
  v7 = v6;
  v8 = 0;
  if ((v5 & 1) == 0)
    v8 = v6;

  return v8;
}

- (void)enableWithInfo:(id)a3 completionBlock:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_enableWithCompletionBlock_(self, v7, (uint64_t)v8);

}

- (id)recoverWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  SecureBackup *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_20D6821B4;
  v33 = sub_20D67BB6C;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_20D6821B4;
  v27 = sub_20D67BB6C;
  v28 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_20D682EF0;
  v22[3] = &unk_24C759CE0;
  v22[4] = &v29;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D69596C(v9, v10, v11);

  }
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = sub_20D682F5C;
  v16[3] = &unk_24C759D30;
  v17 = v8;
  v18 = self;
  v20 = &v29;
  v21 = &v23;
  v19 = v5;
  v12 = v5;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling recoverWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, v16);

  if (a3)
    *a3 = objc_retainAutorelease((id)v30[5]);
  v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

- (id)recoverWithCDPContext:(id)a3 escrowRecord:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD activity_block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_20D6821B4;
  v44 = sub_20D67BB6C;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_20D6821B4;
  v38 = sub_20D67BB6C;
  v39 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v9;
    _os_log_impl(&dword_20D67A000, v13, OS_LOG_TYPE_DEFAULT, "recoverWithCDPContext: invoked escrow recovery with escrowRecord: %@", buf, 0xCu);
  }

  v14 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_20D6833CC;
  v33[3] = &unk_24C759CE0;
  v33[4] = &v40;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v15, (uint64_t)v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_20D6959E0(v17, v18, v19);

  }
  activity_block[0] = v14;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D683438;
  activity_block[3] = &unk_24C759DA8;
  v27 = v16;
  v20 = v8;
  v28 = v20;
  v21 = v9;
  v31 = &v40;
  v32 = &v34;
  v29 = v21;
  v30 = v12;
  v22 = v12;
  v23 = v16;
  _os_activity_initiate(&dword_20D67A000, "calling recoverWithCDPContextInDaemon in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a5)
    *a5 = objc_retainAutorelease((id)v41[5]);
  v24 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

- (id)recoverSilentWithCDPContext:(id)a3 allRecords:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD activity_block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_20D6821B4;
  v44 = sub_20D67BB6C;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_20D6821B4;
  v38 = sub_20D67BB6C;
  v39 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v9;
    _os_log_impl(&dword_20D67A000, v13, OS_LOG_TYPE_DEFAULT, "recoverSilentWithCDPContext: invoked silent escrow recovery with records: %@", buf, 0xCu);
  }

  v14 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_20D6838B8;
  v33[3] = &unk_24C759CE0;
  v33[4] = &v40;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v15, (uint64_t)v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_20D695ABC(v17, v18, v19);

  }
  activity_block[0] = v14;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D683924;
  activity_block[3] = &unk_24C759DA8;
  v27 = v16;
  v20 = v8;
  v28 = v20;
  v21 = v9;
  v31 = &v40;
  v32 = &v34;
  v29 = v21;
  v30 = v12;
  v22 = v12;
  v23 = v16;
  _os_activity_initiate(&dword_20D67A000, "calling recoverSilentWithCDPContextInDaemon in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a5)
    *a5 = objc_retainAutorelease((id)v41[5]);
  v24 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

- (BOOL)isRecoveryKeySet:(id *)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;
  _QWORD activity_block[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint8_t buf[16];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_20D6821B4;
  v31 = sub_20D67BB6C;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "isRecoveryKeySet: invoked", buf, 2u);
  }

  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20D683CF8;
  v21[3] = &unk_24C759CE0;
  v21[4] = &v27;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v7, (uint64_t)v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D695B98(v9, v10, v11);

  }
  activity_block[0] = v6;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D683D64;
  activity_block[3] = &unk_24C759DF8;
  v19 = &v27;
  v20 = &v23;
  v17 = v8;
  v18 = v4;
  v12 = v4;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling isRecoveryKeySetInDaemon in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v28[5]);
  v14 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (void)restoreKeychainAsyncWithPassword:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  BOOL v37;
  _QWORD v38[5];
  uint8_t buf[16];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_20D6821B4;
  v44 = sub_20D67BB6C;
  v45 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D67A000, v18, OS_LOG_TYPE_DEFAULT, "restoreKeychainAsyncWithPassword: invoked", buf, 2u);
  }

  v19 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = sub_20D684160;
  v38[3] = &unk_24C759CE0;
  v38[4] = &v40;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v20, (uint64_t)v38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_20D695C74(v22, v23, v24);

  }
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = sub_20D6841CC;
  v30[3] = &unk_24C759E20;
  v25 = v21;
  v31 = v25;
  v26 = v12;
  v32 = v26;
  v27 = v13;
  v33 = v27;
  v37 = a5;
  v28 = v14;
  v34 = v28;
  v36 = &v40;
  v29 = v17;
  v35 = v29;
  _os_activity_initiate(&dword_20D67A000, "calling restoreKeychainAsyncWithPassword in daemon", OS_ACTIVITY_FLAG_DEFAULT, v30);

  if (a7)
    *a7 = objc_retainAutorelease((id)v41[5]);

  _Block_object_dispose(&v40, 8);
}

- (BOOL)restoreKeychainWithBackupPassword:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  char v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD v28[5];
  uint8_t buf[16];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_20D6821B4;
  v38 = sub_20D67BB6C;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D67A000, v10, OS_LOG_TYPE_DEFAULT, "restoreKeychainWithBackupPassword: invoked", buf, 2u);
  }

  v11 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_20D6845B0;
  v28[3] = &unk_24C759CE0;
  v28[4] = &v34;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v12, (uint64_t)v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_20D695D50(v14, v15, v16);

  }
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = sub_20D68461C;
  v22[3] = &unk_24C759D30;
  v23 = v13;
  v17 = v6;
  v26 = &v34;
  v27 = &v30;
  v24 = v17;
  v25 = v9;
  v18 = v9;
  v19 = v13;
  _os_activity_initiate(&dword_20D67A000, "calling restoreKeychainWithBackupPassword in daemon", OS_ACTIVITY_FLAG_DEFAULT, v22);

  if (a4)
    *a4 = objc_retainAutorelease((id)v35[5]);
  v20 = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  char v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD v28[5];
  uint8_t buf[16];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_20D6821B4;
  v38 = sub_20D67BB6C;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D67A000, v10, OS_LOG_TYPE_DEFAULT, "verifyRecoveryKey: invoked", buf, 2u);
  }

  v11 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_20D684A00;
  v28[3] = &unk_24C759CE0;
  v28[4] = &v34;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v12, (uint64_t)v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_20D695E2C(v14, v15, v16);

  }
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = sub_20D684A6C;
  v22[3] = &unk_24C759D30;
  v23 = v13;
  v17 = v6;
  v26 = &v34;
  v27 = &v30;
  v24 = v17;
  v25 = v9;
  v18 = v9;
  v19 = v13;
  _os_activity_initiate(&dword_20D67A000, "calling verifyRecoveryKey in daemon", OS_ACTIVITY_FLAG_DEFAULT, v22);

  if (a4)
    *a4 = objc_retainAutorelease((id)v35[5]);
  v20 = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

- (BOOL)removeRecoveryKeyFromBackup:(id *)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;
  _QWORD activity_block[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint8_t buf[16];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_20D6821B4;
  v31 = sub_20D67BB6C;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20D67C0DC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D67A000, v5, OS_LOG_TYPE_DEFAULT, "removeRecoveryKeyFromBackup: invoked", buf, 2u);
  }

  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20D684E20;
  v21[3] = &unk_24C759CE0;
  v21[4] = &v27;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v7, (uint64_t)v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D695F08(v9, v10, v11);

  }
  activity_block[0] = v6;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D684E8C;
  activity_block[3] = &unk_24C759DF8;
  v19 = &v27;
  v20 = &v23;
  v17 = v8;
  v18 = v4;
  v12 = v4;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling removeRecoveryKeyFromBackup in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v28[5]);
  v14 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (id)recoverWithInfo:(id)a3 results:(id *)a4
{
  const char *v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  v10 = 0;
  objc_msgSend_recoverWithError_(self, v6, (uint64_t)&v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v8;
}

- (void)recoverWithInfo:(id)a3 completionBlockWithResults:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  kdebug_trace();
  objc_msgSend_populateWithInfo_(self, v8, (uint64_t)v7);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_20D685140;
  v11[3] = &unk_24C759E48;
  v12 = v6;
  v9 = v6;
  objc_msgSend_recoverWithResults_(self, v10, (uint64_t)v11);

}

- (void)recoverWithInfo:(id)a3 completionBlock:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_recoverWithInfo_completionBlockWithResults_, a3);
}

- (BOOL)disableWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD activity_block[4];
  id v17;
  SecureBackup *v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_20D6821B4;
  v26 = sub_20D67BB6C;
  v27 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20D68536C;
  v21[3] = &unk_24C759CE0;
  v21[4] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D695FE4(v9, v10, v11);

  }
  activity_block[0] = v6;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6853D8;
  activity_block[3] = &unk_24C759D80;
  v17 = v8;
  v18 = self;
  v19 = v5;
  v20 = &v22;
  v12 = v5;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling disableWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v23[5]);
  v14 = v23[5];

  _Block_object_dispose(&v22, 8);
  return v14 == 0;
}

- (id)disableWithInfo:(id)a3
{
  const char *v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  v10 = 0;
  v5 = objc_msgSend_disableWithError_(self, v4, (uint64_t)&v10);
  v6 = v10;
  v7 = v6;
  v8 = 0;
  if ((v5 & 1) == 0)
    v8 = v6;

  return v8;
}

- (void)disableWithInfo:(id)a3 completionBlock:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_disableWithCompletionBlock_(self, v7, (uint64_t)v8);

}

- (void)stashRecoveryDataWithInfo:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  kdebug_trace();
  objc_msgSend_populateWithInfo_(self, v8, (uint64_t)v7);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_20D6856B0;
  v11[3] = &unk_24C759B50;
  v12 = v6;
  v9 = v6;
  objc_msgSend_stashRecoveryDataWithCompletionBlock_(self, v10, (uint64_t)v11);

}

- (id)cachePassphraseWithInfo:(id)a3
{
  const char *v4;
  uint64_t v5;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  objc_msgSend_cachePassphrase(self, v4, v5);
  return 0;
}

- (void)cachePassphraseWithInfo:(id)a3 completionBlock:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_cachePassphraseWithCompletionBlock_(self, v7, (uint64_t)v8);

}

- (id)uncachePassphraseWithInfo:(id)a3
{
  const char *v4;
  uint64_t v5;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  objc_msgSend_uncachePassphrase(self, v4, v5);
  return 0;
}

- (void)uncachePassphraseWithInfo:(id)a3 completionBlock:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_uncachePassphraseWithCompletionBlock_(self, v7, (uint64_t)v8);

}

- (id)startSMSChallengeWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  SecureBackup *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_20D6821B4;
  v33 = sub_20D67BB6C;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_20D6821B4;
  v27 = sub_20D67BB6C;
  v28 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_20D6859F0;
  v22[3] = &unk_24C759CE0;
  v22[4] = &v29;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D696058(v9, v10, v11);

  }
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = sub_20D685A5C;
  v16[3] = &unk_24C759D30;
  v17 = v8;
  v18 = self;
  v20 = &v29;
  v21 = &v23;
  v19 = v5;
  v12 = v5;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling startSMSChallengeWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, v16);

  if (a3)
    *a3 = objc_retainAutorelease((id)v30[5]);
  v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

- (id)startSMSChallengeWithInfo:(id)a3 results:(id *)a4
{
  const char *v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  v10 = 0;
  objc_msgSend_startSMSChallengeWithError_(self, v6, (uint64_t)&v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v8;
}

- (void)startSMSChallengeWithInfo:(id)a3 completionBlockWithResults:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_startSMSChallengeWithResults_(self, v7, (uint64_t)v8);

}

- (void)startSMSChallengeWithInfo:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_20D685D3C;
  v9[3] = &unk_24C759E48;
  v10 = v6;
  v7 = v6;
  objc_msgSend_startSMSChallengeWithInfo_completionBlockWithResults_(self, v8, (uint64_t)a3, v9);

}

- (void)getCountrySMSCodesWithInfo:(id)a3 completionBlockWithResults:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_getCountrySMSCodesWithResults_(self, v7, (uint64_t)v8);

}

- (BOOL)changeSMSTargetWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD activity_block[4];
  id v17;
  SecureBackup *v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_20D6821B4;
  v26 = sub_20D67BB6C;
  v27 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20D685F48;
  v21[3] = &unk_24C759CE0;
  v21[4] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_20D6960CC(v9, v10, v11);

  }
  activity_block[0] = v6;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D685FB4;
  activity_block[3] = &unk_24C759D80;
  v17 = v8;
  v18 = self;
  v19 = v5;
  v20 = &v22;
  v12 = v5;
  v13 = v8;
  _os_activity_initiate(&dword_20D67A000, "calling changeSMSTargetWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v23[5]);
  v14 = v23[5];

  _Block_object_dispose(&v22, 8);
  return v14 == 0;
}

- (id)changeSMSTargetWithInfo:(id)a3
{
  const char *v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  v10 = 0;
  v5 = objc_msgSend_changeSMSTargetWithError_(self, v4, (uint64_t)&v10);
  v6 = v10;
  v7 = v6;
  v8 = 0;
  if ((v5 & 1) == 0)
    v8 = v6;

  return v8;
}

- (void)changeSMSTargetWithInfo:(id)a3 completionBlock:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_changeSMSTargetWithCompletionBlock_(self, v7, (uint64_t)v8);

}

- (id)backupForRecoveryKeyWithInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD activity_block[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_20D6821B4;
  v29 = sub_20D67BB6C;
  v30 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20D686388;
  v24[3] = &unk_24C759CE0;
  v24[4] = &v25;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_20D696140(v11, v12, v13);

  }
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6863F4;
  activity_block[3] = &unk_24C759D80;
  v20 = v10;
  v21 = v4;
  v22 = v7;
  v23 = &v25;
  v14 = v7;
  v15 = v4;
  v16 = v10;
  _os_activity_initiate(&dword_20D67A000, "calling backupForRecoveryKeyWithInfoInDaemon in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  v17 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (SecureBackup)backupWithInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD activity_block[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_20D6821B4;
  v29 = sub_20D67BB6C;
  v30 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20D686714;
  v24[3] = &unk_24C759CE0;
  v24[4] = &v25;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_20D696218(v11, v12, v13);

  }
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D686780;
  activity_block[3] = &unk_24C759D80;
  v20 = v10;
  v21 = v4;
  v22 = v7;
  v23 = &v25;
  v14 = v7;
  v15 = v4;
  v16 = v10;
  _os_activity_initiate(&dword_20D67A000, "calling backupWithInfo in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  v17 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return (SecureBackup *)v17;
}

- (void)backOffDateWithInfo:(id)a3 completionBlock:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_backOffDateWithCompletionBlock_(self, v7, (uint64_t)v8);

}

- (void)setBackOffDateWithInfo:(id)a3 completionBlock:(id)a4
{
  const char *v6;
  const char *v7;
  id v8;

  v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_setBackOffDateWithCompletionBlock_(self, v7, (uint64_t)v8);

}

- (id)srpInitNonce
{
  SRPInit *v3;
  const char *v4;
  void *v5;
  SESWrapper *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v3 = [SRPInit alloc];
  v5 = (void *)objc_msgSend_initWithSecureBackup_(v3, v4, (uint64_t)self);
  v6 = [SESWrapper alloc];
  v8 = (void *)objc_msgSend_initWithRequest_(v6, v7, (uint64_t)v5);
  objc_msgSend_setSes_(self, v9, (uint64_t)v8);

  objc_msgSend_ses(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_srpInitBlob(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)srpRecoveryUpdateDSID:(id)a3 recoveryPassphrase:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend_ses(self, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_srpRecoveryUpdateDSID_recoveryPassphrase_(v11, v10, (uint64_t)v7, v6);

}

- (id)srpRecoveryBlobFromSRPInitResponse:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;

  v6 = a3;
  objc_msgSend_ses(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_srpRecoveryBlobFromData_error_(v9, v10, (uint64_t)v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setSes_(self, v12, 0);
  return v11;
}

- (id)srpRecoveryBlobFromSRPInitResponse:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_srpRecoveryBlobFromSRPInitResponse_error_, a3);
}

- (void)prepareHSA2EscrowRecordContents:(BOOL)a3 reply:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SecureBackup *v22;
  id v23;
  id v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;

  v6 = a4;
  objc_msgSend__CreateSecureBackupConnection(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_20D686C4C;
  v26[3] = &unk_24C759B50;
  v11 = v6;
  v27 = v11;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v12, (uint64_t)v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_20D69628C(v14, v15, v16);

  }
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = sub_20D686CB8;
  v20[3] = &unk_24C759E70;
  v21 = v13;
  v22 = self;
  v25 = a3;
  v23 = v9;
  v24 = v11;
  v17 = v11;
  v18 = v9;
  v19 = v13;
  _os_activity_initiate(&dword_20D67A000, "calling prepareHSA2EscrowRecordContents in daemon", OS_ACTIVITY_FLAG_DEFAULT, v20);

}

- (id)beginHSA2PasscodeRequest:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v5 = a3;
  objc_msgSend_UUID(MEMORY[0x24BDD1880], a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beginHSA2PasscodeRequest_uuid_reason_error_(self, v11, v5, v10, 0, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)beginHSA2PasscodeRequest:(BOOL)a3 uuid:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend_beginHSA2PasscodeRequest_uuid_reason_error_(self, a2, a3, a4, 0, a5);
}

- (id)beginHSA2PasscodeRequest:(BOOL)a3 uuid:(id)a4 reason:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD activity_block[4];
  id v29;
  SecureBackup *v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  BOOL v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v10 = a4;
  v11 = a5;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_20D6821B4;
  v48 = sub_20D67BB6C;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_20D6821B4;
  v42 = sub_20D67BB6C;
  v43 = 0;
  objc_msgSend__CreateSecureBackupConnection(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = sub_20D687288;
  v37[3] = &unk_24C759CE0;
  v37[4] = &v44;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v14, v16, (uint64_t)v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np())
  {
    sub_20D67C0DC();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_20D6964B0(v18, v19, v20);

  }
  activity_block[0] = v15;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6872F4;
  activity_block[3] = &unk_24C759F08;
  v29 = v17;
  v30 = self;
  v36 = a3;
  v21 = v10;
  v31 = v21;
  v22 = v11;
  v34 = &v44;
  v35 = &v38;
  v32 = v22;
  v33 = v14;
  v23 = v14;
  v24 = v17;
  _os_activity_initiate(&dword_20D67A000, "calling beginHSA2PasscodeRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a6)
  {
    v25 = (void *)v45[5];
    if (v25)
      *a6 = objc_retainAutorelease(v25);
  }
  v26 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v26;
}

- (void)getCertificates:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SecureBackup *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_20D6875DC;
  v19[3] = &unk_24C759B50;
  v9 = v4;
  v20 = v9;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D687654;
  activity_block[3] = &unk_24C759BA0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v17 = v7;
  v18 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v15;
  _os_activity_initiate(&dword_20D67A000, "calling getCertificatesWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (BOOL)requiresDoubleEnrollment
{
  int v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = _os_feature_enabled_impl();
    if (v3)
    {
      if ((objc_msgSend_icdp(self, v4, v5) & 1) != 0)
        LOBYTE(v3) = 1;
      else
        LOBYTE(v3) = objc_msgSend_stingray(self, v6, v7);
    }
  }
  return v3;
}

+ (void)saveTermsAcceptance:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD activity_block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_20D687938;
  v23[3] = &unk_24C759B50;
  v12 = v7;
  v24 = v12;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v13, (uint64_t)v23);
  activity_block[0] = v11;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6879A4;
  activity_block[3] = &unk_24C759BA0;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  v21 = v10;
  v22 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v6;
  v17 = v19;
  _os_activity_initiate(&dword_20D67A000, "calling saveTermsAcceptance in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

+ (void)getAcceptedTermsForAltDSID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD activity_block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_20D687C58;
  v23[3] = &unk_24C759B50;
  v12 = v7;
  v24 = v12;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v13, (uint64_t)v23);
  activity_block[0] = v11;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D687CC8;
  activity_block[3] = &unk_24C759BA0;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  v21 = v10;
  v22 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v6;
  v17 = v19;
  _os_activity_initiate(&dword_20D67A000, "calling getAcceptedTermsForAltDSID in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

+ (id)_getAcceptedTermsForAltDSID:(id)a3 withError:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_20D6821B4;
  v35 = sub_20D67BB6C;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_20D6821B4;
  v29 = sub_20D67BB6C;
  v30 = 0;
  objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20D688068;
  v24[3] = &unk_24C759CE0;
  v24[4] = &v31;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v24);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = sub_20D6880D4;
  v18[3] = &unk_24C759D30;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v22 = &v31;
  v23 = &v25;
  v20 = v12;
  v21 = v9;
  v13 = v9;
  v14 = v19;
  _os_activity_initiate(&dword_20D67A000, "calling getAcceptedTermsForAltDSID in daemon", OS_ACTIVITY_FLAG_DEFAULT, v18);

  if (a4)
  {
    v15 = (void *)v32[5];
    if (v15)
      *a4 = objc_retainAutorelease(v15);
  }
  v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

+ (id)getAllAcceptedTermsWithError:(id *)a3
{
  return (id)objc_msgSend__getAcceptedTermsForAltDSID_withError_(a1, a2, 0, a3);
}

+ (id)getAcceptedTermsForAltDSID:(id)a3 withError:(id *)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;

  objc_msgSend__getAcceptedTermsForAltDSID_withError_(a1, a2, (uint64_t)a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)moveToFederationAllowed:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  _QWORD activity_block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v8 = a3;
  v9 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_20D6821B4;
  v38 = sub_20D67BB6C;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_20D6884CC;
  v29[3] = &unk_24C759CE0;
  v29[4] = &v34;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v29);
  activity_block[0] = v13;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D688538;
  activity_block[3] = &unk_24C759DA8;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v24 = v15;
  v16 = v9;
  v27 = &v30;
  v28 = &v34;
  v25 = v16;
  v26 = v12;
  v17 = v12;
  v18 = v23;
  _os_activity_initiate(&dword_20D67A000, "calling moveToFederationAllowed in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a5)
  {
    v19 = (void *)v35[5];
    if (v19)
      *a5 = objc_retainAutorelease(v19);
  }
  v20 = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

+ (id)knownICDPFederations:(id *)a3
{
  void *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD activity_block[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_20D6821B4;
  v28 = sub_20D67BB6C;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_20D6821B4;
  v22 = sub_20D67BB6C;
  v23 = 0;
  objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_20D688884;
  v17[3] = &unk_24C759CE0;
  v17[4] = &v24;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v17);
  activity_block[0] = v5;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_20D6888F0;
  activity_block[3] = &unk_24C759DF8;
  v15 = &v18;
  v16 = &v24;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  v7 = v4;
  v8 = v13;
  _os_activity_initiate(&dword_20D67A000, "calling knownICDPFederations in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
  {
    v9 = (void *)v25[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)backOffDate
{
  return self->_backOffDate;
}

- (void)setBackOffDate:(id)a3
{
  objc_storeStrong((id *)&self->_backOffDate, a3);
}

- (NSData)certData
{
  return self->_certData;
}

- (void)setCertData:(id)a3
{
  objc_storeStrong((id *)&self->_certData, a3);
}

- (NSString)countryDialCode
{
  return self->_countryDialCode;
}

- (void)setCountryDialCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)deleteAll
{
  return self->_deleteAll;
}

- (void)setDeleteAll:(BOOL)a3
{
  self->_deleteAll = a3;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)emcsCred
{
  return self->_emcsCred;
}

- (void)setEmcsCred:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)emcsDict
{
  return self->_emcsDict;
}

- (void)setEmcsDict:(id)a3
{
  objc_storeStrong((id *)&self->_emcsDict, a3);
}

- (BOOL)emcsMode
{
  return self->_emcsMode;
}

- (void)setEmcsMode:(BOOL)a3
{
  self->_emcsMode = a3;
}

- (NSString)encodedMetadata
{
  return self->_encodedMetadata;
}

- (void)setEncodedMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)duplicateEncodedMetadata
{
  return self->_duplicateEncodedMetadata;
}

- (void)setDuplicateEncodedMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)escrowRecord
{
  return self->_escrowRecord;
}

- (void)setEscrowRecord:(id)a3
{
  objc_storeStrong((id *)&self->_escrowRecord, a3);
}

- (NSString)escrowProxyURL
{
  return self->_escrowProxyURL;
}

- (void)setEscrowProxyURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)excludeiCDPRecords
{
  return self->_excludeiCDPRecords;
}

- (void)setExcludeiCDPRecords:(BOOL)a3
{
  self->_excludeiCDPRecords = a3;
}

- (BOOL)fmipRecovery
{
  return self->_fmipRecovery;
}

- (void)setFmipRecovery:(BOOL)a3
{
  self->_fmipRecovery = a3;
}

- (NSString)fmipUUID
{
  return self->_fmipUUID;
}

- (void)setFmipUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)icdp
{
  return self->_icdp;
}

- (void)setIcdp:(BOOL)a3
{
  self->_icdp = a3;
}

- (NSString)iCloudEnv
{
  return self->_iCloudEnv;
}

- (void)setICloudEnv:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSData)iCloudIdentityData
{
  return self->_iCloudIdentityData;
}

- (void)setICloudIdentityData:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudIdentityData, a3);
}

- (NSString)iCloudPassword
{
  return self->_iCloudPassword;
}

- (void)setICloudPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSData)idmsData
{
  return self->_idmsData;
}

- (void)setIdmsData:(id)a3
{
  objc_storeStrong((id *)&self->_idmsData, a3);
}

- (BOOL)idmsRecovery
{
  return self->_idmsRecovery;
}

- (void)setIdmsRecovery:(BOOL)a3
{
  self->_idmsRecovery = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSDictionary)metadataHash
{
  return self->_metadataHash;
}

- (void)setMetadataHash:(id)a3
{
  objc_storeStrong((id *)&self->_metadataHash, a3);
}

- (NSString)oldEMCSCred
{
  return self->_oldEMCSCred;
}

- (void)setOldEMCSCred:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)smsTarget
{
  return self->_smsTarget;
}

- (void)setSmsTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)silent
{
  return self->_silent;
}

- (void)setSilent:(BOOL)a3
{
  self->_silent = a3;
}

- (NSNumber)specifiedFederation
{
  return self->_specifiedFederation;
}

- (void)setSpecifiedFederation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)stingray
{
  return self->_stingray;
}

- (void)setStingray:(BOOL)a3
{
  self->_stingray = a3;
}

- (BOOL)synchronize
{
  return self->_synchronize;
}

- (void)setSynchronize:(BOOL)a3
{
  self->_synchronize = a3;
}

- (BOOL)useCachedPassphrase
{
  return self->_useCachedPassphrase;
}

- (void)setUseCachedPassphrase:(BOOL)a3
{
  self->_useCachedPassphrase = a3;
}

- (BOOL)useRecoveryPET
{
  return self->_useRecoveryPET;
}

- (void)setUseRecoveryPET:(BOOL)a3
{
  self->_useRecoveryPET = a3;
}

- (BOOL)usesMultipleiCSC
{
  return self->_usesMultipleiCSC;
}

- (void)setUsesMultipleiCSC:(BOOL)a3
{
  self->_usesMultipleiCSC = a3;
}

- (BOOL)usesRandomPassphrase
{
  return self->_usesRandomPassphrase;
}

- (void)setUsesRandomPassphrase:(BOOL)a3
{
  self->_usesRandomPassphrase = a3;
}

- (BOOL)usesRecoveryKey
{
  return self->_usesRecoveryKey;
}

- (void)setUsesRecoveryKey:(BOOL)a3
{
  self->_usesRecoveryKey = a3;
}

- (NSString)verificationToken
{
  return self->_verificationToken;
}

- (void)setVerificationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (BOOL)suppressServerFiltering
{
  return self->_suppressServerFiltering;
}

- (void)setSuppressServerFiltering:(BOOL)a3
{
  self->_suppressServerFiltering = a3;
}

- (BOOL)deleteDoubleOnly
{
  return self->_deleteDoubleOnly;
}

- (void)setDeleteDoubleOnly:(BOOL)a3
{
  self->_deleteDoubleOnly = a3;
}

- (BOOL)nonViableRepair
{
  return self->_nonViableRepair;
}

- (void)setNonViableRepair:(BOOL)a3
{
  self->_nonViableRepair = a3;
}

- (BOOL)sosCompatibleEscrowSorting
{
  return self->_sosCompatibleEscrowSorting;
}

- (void)setSosCompatibleEscrowSorting:(BOOL)a3
{
  self->_sosCompatibleEscrowSorting = a3;
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (void)setDeviceSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSessionID, a3);
}

- (NSString)flowID
{
  return self->_flowID;
}

- (void)setFlowID:(id)a3
{
  objc_storeStrong((id *)&self->_flowID, a3);
}

- (NSString)recoveryUUID
{
  return self->_recoveryUUID;
}

- (void)setRecoveryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryUUID, a3);
}

- (NSString)doubleRecoveryUUID
{
  return self->_doubleRecoveryUUID;
}

- (void)setDoubleRecoveryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_doubleRecoveryUUID, a3);
}

- (BOOL)recoveryResult
{
  return self->_recoveryResult;
}

- (void)setRecoveryResult:(BOOL)a3
{
  self->_recoveryResult = a3;
}

- (BOOL)silentDoubleRecovery
{
  return self->_silentDoubleRecovery;
}

- (void)setSilentDoubleRecovery:(BOOL)a3
{
  self->_silentDoubleRecovery = a3;
}

- (NSString)hsa2CachedPrerecordUUID
{
  return self->_hsa2CachedPrerecordUUID;
}

- (void)setHsa2CachedPrerecordUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (EscrowPrerecord)prerecord
{
  return self->_prerecord;
}

- (void)setPrerecord:(id)a3
{
  objc_storeStrong((id *)&self->_prerecord, a3);
}

- (SESWrapper)ses
{
  return self->_ses;
}

- (void)setSes:(id)a3
{
  objc_storeStrong((id *)&self->_ses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ses, 0);
  objc_storeStrong((id *)&self->_prerecord, 0);
  objc_storeStrong((id *)&self->_hsa2CachedPrerecordUUID, 0);
  objc_storeStrong((id *)&self->_doubleRecoveryUUID, 0);
  objc_storeStrong((id *)&self->_recoveryUUID, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_activityLabel, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_verificationToken, 0);
  objc_storeStrong((id *)&self->_specifiedFederation, 0);
  objc_storeStrong((id *)&self->_smsTarget, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_oldEMCSCred, 0);
  objc_storeStrong((id *)&self->_metadataHash, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_idmsData, 0);
  objc_storeStrong((id *)&self->_iCloudPassword, 0);
  objc_storeStrong((id *)&self->_iCloudIdentityData, 0);
  objc_storeStrong((id *)&self->_iCloudEnv, 0);
  objc_storeStrong((id *)&self->_fmipUUID, 0);
  objc_storeStrong((id *)&self->_escrowProxyURL, 0);
  objc_storeStrong((id *)&self->_escrowRecord, 0);
  objc_storeStrong((id *)&self->_duplicateEncodedMetadata, 0);
  objc_storeStrong((id *)&self->_encodedMetadata, 0);
  objc_storeStrong((id *)&self->_emcsDict, 0);
  objc_storeStrong((id *)&self->_emcsCred, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryDialCode, 0);
  objc_storeStrong((id *)&self->_certData, 0);
  objc_storeStrong((id *)&self->_backOffDate, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

@end
