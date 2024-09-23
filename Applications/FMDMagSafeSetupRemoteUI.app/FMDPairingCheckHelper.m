@implementation FMDPairingCheckHelper

+ (void)pairingCheckForAccessory:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "pairingCheckForAccessory:useEraseKeyType:completion:", a3, 0, a4);
}

+ (void)pairingCheckForAccessory:(id)a3 useEraseKeyType:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  intptr_t v14;
  id v15;
  NSObject *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  _QWORD *v27;
  dispatch_time_t v28;
  intptr_t v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  NSObject *v39;
  dispatch_time_t v40;
  intptr_t v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  id v68;
  NSObject *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  _QWORD *v79;
  __CFString *v80;
  id v81;
  NSObject *v82;
  _QWORD *v83;
  dispatch_time_t v84;
  intptr_t v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  unsigned __int8 v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  __CFString *v103;
  dispatch_time_t v104;
  intptr_t v105;
  id v106;
  NSObject *v107;
  uint64_t v108;
  __CFString *v109;
  id v110;
  NSObject *v111;
  __CFString *v112;
  __CFString *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void *v119;
  id v120;
  uint64_t v121;
  id v122;
  __CFString *v124;
  unint64_t v125;
  _QWORD v126[7];
  _QWORD v127[7];
  _QWORD v128[6];
  _QWORD v129[6];
  _QWORD v130[4];
  NSObject *v131;
  uint8_t *v132;
  uint64_t *v133;
  uint8_t v134[8];
  uint8_t *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  _QWORD v140[7];
  _QWORD v141[7];
  _QWORD v142[4];
  NSObject *v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  uint8_t v158[4];
  const __CFString *v159;
  __int16 v160;
  uint64_t v161;
  __int16 v162;
  void *v163;
  __int16 v164;
  void *v165;
  _BYTE buf[24];
  uint64_t (*v167)(uint64_t, uint64_t);
  _BYTE v168[20];

  v7 = a3;
  v125 = (unint64_t)a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v9 = dispatch_group_create();
  v10 = sub_100005190();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "getting pairing data", buf, 2u);
  }

  dispatch_group_enter(v9);
  v152 = 0;
  v153 = &v152;
  v154 = 0x3032000000;
  v155 = sub_1000196AC;
  v156 = sub_1000196BC;
  v157 = 0;
  v146 = 0;
  v147 = &v146;
  v148 = 0x3032000000;
  v149 = sub_1000196AC;
  v150 = sub_1000196BC;
  v151 = 0;
  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472;
  v142[2] = sub_1000196C4;
  v142[3] = &unk_100035A28;
  v144 = &v152;
  v145 = &v146;
  v12 = v9;
  v143 = v12;
  objc_msgSend(v7, "getPairingDataWithCompletion:", v142);
  v13 = dispatch_time(0, 5000000000);
  v14 = dispatch_group_wait(v12, v13);
  if (!v147[5] && !v14)
  {
    v15 = sub_100005190();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v153[5], "data"));
      v122 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "fm_hexString"));
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v153[5], "pairingCheckToken"));
      v120 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "fm_hexString"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v153[5], "phoneNumber"));
      v118 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "fm_hexString"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v153[5], "keysUpdated"));
      v95 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "fm_hexString"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v153[5], "lostModePrivateKey"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "fm_hexString"));
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v122;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v120;
      *(_WORD *)&buf[22] = 2112;
      v167 = v118;
      *(_WORD *)v168 = 2112;
      *(_QWORD *)&v168[2] = v95;
      *(_WORD *)&v168[10] = 2112;
      *(_QWORD *)&v168[12] = v97;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "pairingCheckData = %@\npairingCheckToken = %@\nphoneNumber = %@\nkeysUpdated = %@\nlostModePrivateKey = %@", buf, 0x34u);

    }
    if (v125)
    {
      v17 = objc_msgSend((id)v125, "isEqualToString:", CFSTR("2"));
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v153[5], "keysUpdated"));
      if (v22)
        v17 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("userKeyEraseDisabled"), kFMDNotBackedUpPrefDomain) ^ 1;
      else
        v17 = 0;

    }
    v23 = sub_100005190();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "using userPrivateKeyErase = %d", buf, 8u);
    }

    v25 = sub_100005190();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "getting auth nonce", buf, 2u);
    }

    dispatch_group_enter(v12);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v167 = sub_1000196AC;
    *(_QWORD *)v168 = sub_1000196BC;
    *(_QWORD *)&v168[8] = 0;
    if (v17)
    {
      v141[0] = _NSConcreteStackBlock;
      v141[1] = 3221225472;
      v141[2] = sub_1000197D4;
      v141[3] = &unk_100034928;
      v141[5] = buf;
      v141[6] = &v146;
      v27 = v141;
      v141[4] = v12;
      objc_msgSend(v7, "beginUserKeyEraseWithCompletion:", v141);
    }
    else
    {
      v140[0] = _NSConcreteStackBlock;
      v140[1] = 3221225472;
      v140[2] = sub_1000198E4;
      v140[3] = &unk_100034928;
      v140[5] = buf;
      v140[6] = &v146;
      v27 = v140;
      v140[4] = v12;
      objc_msgSend(v7, "getAuthNonceWithCompletion:", v140);
    }

    v28 = dispatch_time(0, 5000000000);
    v29 = dispatch_group_wait(v12, v28);
    if (v147[5] || v29)
    {
      v48 = sub_100005190();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        sub_10001F898();

      v50 = v147[5];
      if (v50)
      {
        v8[2](v8, v50, 0);
LABEL_91:
        _Block_object_dispose(buf, 8);

        goto LABEL_92;
      }
      v32 = (id)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
      v8[2](v8, (uint64_t)v32, 0);
LABEL_90:

      goto LABEL_91;
    }
    v30 = sub_100005190();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v134 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "getting pairingCheckInfo", v134, 2u);
    }

    v32 = objc_alloc_init((Class)FMDPairingCheckCommandRequestInfo);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v153[5], "pairingCheckToken"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fm_hexString"));
    objc_msgSend(v32, "setPairingCheckToken:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "fm_hexString"));
    objc_msgSend(v32, "setAuthNonce:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryType"));
    objc_msgSend(v32, "setAccessoryType:", v36);

    if (v17)
      v37 = CFSTR("2");
    else
      v37 = CFSTR("1");
    objc_msgSend(v32, "setEraseKeyType:", v37);
    dispatch_group_enter(v12);
    *(_QWORD *)v134 = 0;
    v135 = v134;
    v136 = 0x3032000000;
    v137 = sub_1000196AC;
    v138 = sub_1000196BC;
    v139 = 0;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = sub_1000199F4;
    v130[3] = &unk_100035A50;
    v132 = v134;
    v133 = &v146;
    v39 = v12;
    v131 = v39;
    objc_msgSend(v38, "pairingCheckWith:completion:", v32, v130);

    v40 = dispatch_time(0, 5000000000);
    v41 = dispatch_group_wait(v39, v40);
    if (v147[5] || v41)
    {
      if (v17)
        objc_msgSend(v7, "cancelUserKeyEraseWithCompletion:", 0);
      else
        objc_msgSend(v7, "cancelVendorKeyEraseWithCompletion:", 0);
      v51 = sub_100005190();
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        sub_10001F898();

      v53 = v147[5];
      if (v53)
      {
        v8[2](v8, v53, 0);
LABEL_89:

        _Block_object_dispose(v134, 8);
        goto LABEL_90;
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
      v8[2](v8, (uint64_t)v54, 0);
LABEL_88:

      goto LABEL_89;
    }
    v42 = sub_100005190();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v158 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "getting lostModeInfo", v158, 2u);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "lostModeInfo"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithHexString:](NSData, "dataWithHexString:", v44));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v153[5], "lostModePrivateKey"));
    v121 = objc_claimAutoreleasedReturnValue(+[FMDCryptoUtil decryptData:privateKeyData:](FMDCryptoUtil, "decryptData:privateKeyData:", v45, v46));

    if (v121)
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v121, 0, 0));
    else
      v47 = 0;
    v55 = sub_100005190();
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      v109 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "lostModeInfo"));
      *(_DWORD *)v158 = 138412802;
      v159 = v109;
      v160 = 2112;
      v161 = v121;
      v162 = 2112;
      v163 = v47;
      _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "got lostModeInfo encrypted = %@ decrypted = %@ json = %@", v158, 0x20u);

    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("isLost")));
    if ((objc_opt_respondsToSelector(v57, "BOOLValue") & 1) != 0)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("isLost")));
      v59 = objc_msgSend(v58, "BOOLValue");

      if ((v59 & 1) != 0)
        goto LABEL_61;
    }
    else
    {

    }
    v60 = sub_100005190();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_10001F960((uint64_t)v47, v61, v62);

    v47 = 0;
LABEL_61:
    v63 = (void *)*((_QWORD *)v135 + 5);
    if (v63)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "statusCode"));
      if ((objc_msgSend(v64, "isEqualToString:", CFSTR("409")) & 1) != 0
        || (v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "signature"))) == 0)
      {

      }
      else
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "serverNonce"));
        v67 = v66 == 0;

        if (!v67)
        {
          v68 = sub_100005190();
          v69 = objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v70 = CFSTR("vendorKeyErase");
            if (v17)
              v70 = CFSTR("userKeyErase");
            *(_DWORD *)v158 = 138412290;
            v159 = v70;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "calling erase Key API %@", v158, 0xCu);
          }

          dispatch_group_enter(v39);
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "serverNonce"));
          v124 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSData dataWithHexString:](NSData, "dataWithHexString:", v71));

          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "signature"));
          v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithHexString:](NSData, "dataWithHexString:", v72));

          if (v17)
          {
            v73 = sub_100005190();
            v74 = objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              v75 = *(void **)(*(_QWORD *)&buf[8] + 40);
              v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endPointUUID"));
              *(_DWORD *)v158 = 138413058;
              v159 = v124;
              v160 = 2112;
              v161 = (uint64_t)v119;
              v162 = 2112;
              v163 = v75;
              v164 = 2112;
              v165 = v76;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "continueUserKeyErase serverNonce = %@, signature  = %@, accessoryNonce = %@ endPointUUID = %@", v158, 0x2Au);

            }
            v77 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endPointUUID"));
            v127[0] = _NSConcreteStackBlock;
            v127[1] = 3221225472;
            v127[2] = sub_100019C20;
            v127[3] = &unk_100035A78;
            v79 = v127;
            v80 = v124;
            v127[4] = v80;
            v127[6] = &v146;
            v127[5] = v39;
            objc_msgSend(v7, "continueUserKeyErase:withSignature:andAccessoryNonce:forEndpoint:completion:", v80, v119, v77, v78, v127);
          }
          else
          {
            v98 = sub_100005190();
            v99 = objc_claimAutoreleasedReturnValue(v98);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              v100 = *(void **)(*(_QWORD *)&buf[8] + 40);
              v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endPointUUID"));
              *(_DWORD *)v158 = 138413058;
              v159 = v124;
              v160 = 2112;
              v161 = (uint64_t)v119;
              v162 = 2112;
              v163 = v100;
              v164 = 2112;
              v165 = v101;
              _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "vendorKeyErase serverNonce = %@, signature  = %@, accessoryNonce = %@ endPointUUID = %@", v158, 0x2Au);

            }
            v102 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endPointUUID"));
            v126[0] = _NSConcreteStackBlock;
            v126[1] = 3221225472;
            v126[2] = sub_100019D08;
            v126[3] = &unk_100035A78;
            v79 = v126;
            v103 = v124;
            v126[4] = v103;
            v126[6] = &v146;
            v126[5] = v39;
            objc_msgSend(v7, "vendorKeyErase:withSignature:andAccessoryNonce:forEndpoint:completion:", v103, v119, v102, v78, v126);
          }

          v104 = dispatch_time(0, 5000000000);
          v105 = dispatch_group_wait(v39, v104);
          if (v147[5] || v105)
          {
            v106 = sub_100005190();
            v107 = objc_claimAutoreleasedReturnValue(v106);
            if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              sub_10001F898();

            v108 = v147[5];
            if (v108)
            {
              ((void (**)(id, uint64_t, void *))v8)[2](v8, v108, v47);
            }
            else
            {
              v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
              ((void (**)(id, uint64_t, void *))v8)[2](v8, (uint64_t)v114, v47);

            }
          }
          else
          {
            ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v47);
          }

          v113 = v124;
LABEL_108:

          goto LABEL_87;
        }
      }
    }
    v81 = sub_100005190();
    v82 = objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v158 = 0;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "phone is locked", v158, 2u);
    }

    dispatch_group_enter(v39);
    if (v17)
    {
      v129[0] = _NSConcreteStackBlock;
      v129[1] = 3221225472;
      v129[2] = sub_100019B88;
      v129[3] = &unk_100034888;
      v129[5] = &v146;
      v83 = v129;
      v129[4] = v39;
      objc_msgSend(v7, "cancelUserKeyEraseWithCompletion:", v129);
    }
    else
    {
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_100019BD4;
      v128[3] = &unk_100034888;
      v128[5] = &v146;
      v83 = v128;
      v128[4] = v39;
      objc_msgSend(v7, "cancelVendorKeyEraseWithCompletion:", v128);
    }

    v84 = dispatch_time(0, 5000000000);
    v85 = dispatch_group_wait(v39, v84);
    if (v85)
    {
      v86 = v85;
      v87 = sub_100005190();
      v88 = objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        sub_10001F8F8(v86, v88, v89);

    }
    else if (!(v125 | v147[5]))
    {
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "useEraseKeyType"));
      if (v90)
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "useEraseKeyType"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "eraseKeyType"));
        v93 = objc_msgSend(v91, "isEqualToString:", v92);

        if ((v93 & 1) == 0)
        {
          v110 = sub_100005190();
          v111 = objc_claimAutoreleasedReturnValue(v110);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            v112 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "useEraseKeyType"));
            *(_DWORD *)v158 = 138412290;
            v159 = v112;
            _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Performing pairing check again with eraseKeyType = %@", v158, 0xCu);

          }
          v113 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v135 + 5), "useEraseKeyType"));
          objc_msgSend(a1, "pairingCheckForAccessory:useEraseKeyType:completion:", v7, v113, v8);
          goto LABEL_108;
        }
      }
    }
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v47);
LABEL_87:

    v54 = (void *)v121;
    goto LABEL_88;
  }
  v18 = sub_100005190();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_10001F898();

  v20 = v147[5];
  if (v20)
  {
    v8[2](v8, v20, 0);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError"));
    v8[2](v8, (uint64_t)v21, 0);

  }
LABEL_92:

  _Block_object_dispose(&v146, 8);
  _Block_object_dispose(&v152, 8);

}

+ (void)checkAndHealPairingKeys:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint8_t buf[4];
  _BYTE v82[10];
  _BYTE v83[10];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_msgSend((id)objc_opt_class(a1), "getPairingData:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = sub_100005190();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fm_hexString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keysUpdated"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v82 = v13;
    *(_WORD *)&v82[8] = 2112;
    *(_QWORD *)v83 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "pairing data = %@ keys Updated = %@", buf, 0x16u);

  }
  v15 = sub_100005190();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_10001FB14(v9, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pairingCheckToken"));
  v18 = v17 == 0;

  if (v17)
  {
LABEL_8:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "readLostModeAccessoriesList"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceIDFromAddress:](FMDExtHelper, "deviceIDFromAddress:", v26));

    v28 = objc_msgSend(v25, "containsObject:", v27);
    v29 = sub_100005190();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "device is in lost Mode", buf, 2u);
    }

    if (v28 && (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keysUpdated"))) != 0)
    {

    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lostModePrivateKey"));

      if (v32)
      {
        v73 = a1;
        v33 = 0;
        goto LABEL_20;
      }
    }
    v79 = 0;
    v80 = 0;
    +[FMDCryptoUtil generatePublicPrivateKeyPair:privateKey:](FMDCryptoUtil, "generatePublicPrivateKeyPair:privateKey:", &v80, &v79);
    v34 = v80;
    v35 = v79;
    v36 = sub_100005190();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      sub_10001FA54(v34, v35, v37);

    if (!v34 || !v35)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", CFSTR("lost mode key generation failed")));
      v7[2](v7, v48);

LABEL_49:
      goto LABEL_50;
    }
    v73 = a1;
    objc_msgSend(v9, "setLostModePrivateKey:", v35);

    v33 = 1;
    v18 = 1;
LABEL_20:
    v38 = sub_100005190();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v82 = v33;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v18;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "### updateServerInfo = %d, updateMulderInfo = %d", buf, 0xEu);
    }

    v74 = v27;
    if (v33)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keysUpdated"));

      if (v40)
      {
        objc_msgSend(v9, "setKeysUpdated:", 0);
        v18 = 1;
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
      +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", v41, kFMDNotBackedUpMagSafePrefDomain);

      v42 = 0;
      v43 = 1;
    }
    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
      v45 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", v44, kFMDNotBackedUpMagSafePrefDomain);

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keysUpdated"));
      if (v46 || !v45)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keysUpdated"));

        v42 = 0;
        if (v49)
          v43 = 0;
        else
          v43 = v45 ^ 1;
      }
      else
      {
        v42 = 1;
        buf[0] = 1;
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 1));
        objc_msgSend(v9, "setKeysUpdated:", v47);

        v43 = 0;
        v18 = 1;
      }
    }
    v50 = sub_100005190();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keysUpdated"));
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v82 = v43;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v18;
      *(_WORD *)v83 = 2112;
      *(_QWORD *)&v83[2] = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "### updateServerInfo = %d, updateMulderInfo = %d %@", buf, 0x18u);

    }
    if (!v18)
      goto LABEL_46;
    v53 = objc_msgSend((id)objc_opt_class(v73), "updatePairingData:pairingData:", v6, v9);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    if (v54)
    {
      v55 = sub_100005190();
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_10001F9C8(v6, v56);
    }
    else
    {
      if (v42)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
        +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", v57, kFMDNotBackedUpMagSafePrefDomain);

      }
      if (!v28)
        goto LABEL_45;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v58, "fm_epoch")));

      v60 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10001A688;
      v75[3] = &unk_100035AA0;
      v76 = v74;
      v77 = v59;
      v78 = v25;
      v56 = v59;
      objc_msgSend(v60, "updateLostModeKeyRollTimeFor:lastLostModeKeyRollTime:withCompletion:", v76, v56, v75);

    }
LABEL_45:

LABEL_46:
    if (v43)
    {
      v61 = objc_alloc_init((Class)FMDPairingLockUpdateRequestInfo);
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pairingCheckToken"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "fm_hexString"));
      objc_msgSend(v61, "setPairingCheckToken:", v63);

      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lostModePrivateKey"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCryptoUtil publicKeyFromPrivateKey:](FMDCryptoUtil, "publicKeyFromPrivateKey:", v64));

      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "fm_hexString"));
      objc_msgSend(v61, "setLostModePubKey:", v66);

      v67 = objc_msgSend((id)objc_opt_class(v73), "getUserPrivateKey:", v6);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      objc_msgSend(v61, "setUserPrivateKey:", v68);

      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
      objc_msgSend(v61, "setSerialNumber:", v69);

      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v70, "fm_epoch")));
      objc_msgSend(v61, "setTimeStamp:", v71);

      v72 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
      objc_msgSend(v72, "updatePairingLockInfo:completion:", v61, &stru_100035AC0);

    }
    v7[2](v7, 0);
    v27 = v74;
    goto LABEL_49;
  }
  v19 = objc_msgSend((id)objc_opt_class(a1), "registerDevice:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (v20)
  {
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pairingToken"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithHexString:](NSData, "dataWithHexString:", v22));
    objc_msgSend(v9, "setPairingCheckToken:", v23);

    goto LABEL_8;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", CFSTR("Unable to register device")));
  v7[2](v7, v25);
LABEL_50:

}

+ (id)getUserPrivateKey:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  v4 = sub_100005190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getting user private key", buf, 2u);
  }

  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = sub_1000196AC;
  v28 = sub_1000196BC;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000196AC;
  v22 = sub_1000196BC;
  v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001AA74;
  v14[3] = &unk_100034928;
  v16 = buf;
  v17 = &v18;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v3, "copyUserPrivateKeyWithCompletion:", v14);
  v8 = dispatch_time(0, 5000000000);
  v9 = dispatch_group_wait(v7, v8);
  if (*((_QWORD *)v25 + 5) || v9)
  {
    v11 = sub_100005190();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10001F1E4();

    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19[5], "fm_hexString"));
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(buf, 8);

  return v10;
}

+ (id)updatePairingData:(id)a3 pairingData:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  intptr_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  NSObject *v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a3;
  v6 = a4;
  v7 = sub_100005190();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setting up pairing data", buf, 2u);
  }

  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x3032000000;
  v28 = sub_1000196AC;
  v29 = sub_1000196BC;
  v30 = 0;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10001AD60;
  v22 = &unk_100034888;
  v24 = buf;
  v10 = v9;
  v23 = v10;
  objc_msgSend(v5, "setPairingData:withCompletion:", v6, &v19);
  v11 = dispatch_time(0, 5000000000);
  v12 = dispatch_group_wait(v10, v11);
  if (*((_QWORD *)v26 + 5) || (v13 = 0, v12))
  {
    v14 = sub_100005190();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10001F1E4();

    v16 = (void *)*((_QWORD *)v26 + 5);
    if (v16)
      v17 = v16;
    else
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError fm_timeoutError](NSError, "fm_timeoutError", v19, v20, v21, v22));
    v13 = v17;
  }

  _Block_object_dispose(buf, 8);
  return v13;
}

+ (id)registerDevice:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  intptr_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  __int128 *p_buf;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t v37[32];
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v3 = a3;
  v4 = objc_alloc_init((Class)FMDPairingLockRegisterRequestInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serialNumber"));
  objc_msgSend(v4, "setSerialNumber:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessoryType"));
  objc_msgSend(v4, "setAccessoryType:", v6);

  v7 = dispatch_group_create();
  v8 = sub_100005190();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Doing register to server for accessory with serial number = %@", (uint8_t *)&buf, 0xCu);

  }
  dispatch_group_enter(v7);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x3032000000;
  v40 = sub_1000196AC;
  v41 = sub_1000196BC;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1000196AC;
  v35 = sub_1000196BC;
  v36 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001B198;
  v27[3] = &unk_100034900;
  v29 = &v31;
  p_buf = &buf;
  v12 = v7;
  v28 = v12;
  objc_msgSend(v11, "registerDeviceForPairingLock:completion:", v4, v27);

  v13 = dispatch_time(0, 5000000000);
  v14 = dispatch_group_wait(v12, v13);
  if (v32[5] || v14)
  {
    v20 = sub_100005190();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10001F1E4();

    goto LABEL_15;
  }
  v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (!v15
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pairingToken"))) == 0
    || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "serialNumber")),
        v18 = v17 == 0,
        v17,
        v16,
        v18))
  {
    v22 = sub_100005190();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "pairingToken"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "serialNumber"));
      sub_10001FC64(v24, v25, v37, v23);
    }

LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  v19 = *(id *)(*((_QWORD *)&buf + 1) + 40);
LABEL_16:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&buf, 8);

  return v19;
}

+ (id)getPairingData:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  v4 = dispatch_group_create();
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "getting pairing data", buf, 2u);
  }

  dispatch_group_enter(v4);
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = sub_1000196AC;
  v28 = sub_1000196BC;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000196AC;
  v22 = sub_1000196BC;
  v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001B49C;
  v14[3] = &unk_100035A28;
  v16 = buf;
  v17 = &v18;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v3, "getPairingDataWithCompletion:", v14);
  v8 = dispatch_time(0, 5000000000);
  v9 = dispatch_group_wait(v7, v8);
  if (v19[5] || v9)
  {
    v11 = sub_100005190();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10001FCD0();

    v10 = 0;
  }
  else
  {
    v10 = *((id *)v25 + 5);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(buf, 8);

  return v10;
}

@end
