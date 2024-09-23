@implementation MesaPairer

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v9 = handleForCategory(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[MesaPairer setupWithInputs:responder:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v13, 0x20u);
  }

  -[MesaPairer setInputs:](self, "setInputs:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer inputs](self, "inputs"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
    objc_msgSend(v12, "setStatusCode:", &off_100011298);

    -[MesaPairer setFinished:](self, "setFinished:", 1);
  }

}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;
  id v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  const void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  unsigned __int8 v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  unsigned int v57;
  CFErrorRef v58;
  void *v59;
  const __CFURL *v60;
  int v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  const __CFString *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  void *v130;
  void *v131;
  _QWORD *v132;
  void *v133;
  void *v134;
  MesaPairer *v135;
  id v136;
  _QWORD v137[5];
  CFDataRef theData;
  CFDataRef v139;
  CFErrorRef v140;
  uint64_t v141;
  uint64_t v142;
  _QWORD v143[6];
  _QWORD v144[6];
  uint8_t v145[4];
  id v146;
  uint8_t buf[4];
  const char *v148;

  v141 = 128;
  v142 = 0;
  v140 = 0;
  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "-[MesaPairer start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  AMSupportLogSetHandler(&_logHandler);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", &off_1000112B0);

  v135 = self;
  if (sub_10000B79C((int *)&v142 + 1))
  {
    v7 = handleForCategory(0, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000D084();

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
    v10 = v9;
    v11 = &off_1000112C8;
LABEL_7:
    objc_msgSend(v9, "setStatusCode:", v11);

    v12 = 0;
    v13 = 0;
    v132 = 0;
    v14 = 0;
    HIDWORD(v142) = 0;
LABEL_8:
    v131 = 0;
    v143[0] = CFSTR("mesaPairingErrorCode");
    v15 = (uint64_t)v14;
LABEL_9:
    v16 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v17 = 0;
    v129 = 1;
    goto LABEL_10;
  }
  if (sub_10000BE48((char *)buf, &v141))
  {
    if (HIDWORD(v142) != 7)
    {
      v50 = handleForCategory(0, v30);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_10000D058();

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
      v10 = v9;
      v11 = &off_1000112E0;
      goto LABEL_7;
    }
    v31 = 0;
LABEL_39:
    v134 = v31;
    theData = 0;
    v139 = 0;
    if (HSCGetMesaNonce(&v139, &v140) != 1 || !v139)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
      objc_msgSend(v76, "setStatusCode:", &off_1000112F8);

      v58 = v140;
      v78 = handleForCategory(0, v77);
      v79 = objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        sub_10000CDF4((uint64_t)v58, v79, v80, v81, v82, v83, v84, v85);

      v132 = 0;
      v14 = 0;
      v37 = 0;
      goto LABEL_71;
    }
    v36 = +[CRPersonalizationManager getDefaultAMAuthInstallRef](CRPersonalizationManager, "getDefaultAMAuthInstallRef");
    if (!v36)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
      objc_msgSend(v86, "setStatusCode:", &off_100011310);

      v88 = handleForCategory(0, v87);
      v89 = objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        sub_10000CE58();

      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get default AMAuthInstallRef")));
      v132 = 0;
      v37 = 0;
      goto LABEL_100;
    }
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer inputs](self, "inputs"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "TatsuURL"));

    if (!v39)
      goto LABEL_46;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer inputs](self, "inputs"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "TatsuURL"));
    v42 = AMAuthInstallSetSigningServerURL(v37, v41);

    v44 = handleForCategory(0, v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer inputs](self, "inputs"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "TatsuURL"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "absoluteString"));
      *(_DWORD *)v145 = 138412290;
      v146 = v48;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Setting custom tatsu server URL: %@", v145, 0xCu);

      self = v135;
    }

    if ((_DWORD)v42)
    {
      v115 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
      objc_msgSend(v115, "setStatusCode:", &off_100011310);

      v117 = handleForCategory(0, v116);
      v118 = objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        sub_10000CFF4(v42, v118, v119, v120, v121, v122, v123, v124);

      v125 = v42;
      v114 = CFSTR("Failed to set TATSU server URL with error %d");
    }
    else
    {
LABEL_46:
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer inputs](self, "inputs"));
      if ((objc_msgSend(v49, "useAppleConnect") & 1) != 0)
      {

      }
      else
      {
        v52 = +[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault");

        if ((v52 & 1) == 0)
        {
LABEL_53:
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer inputs](self, "inputs"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "signingKeyBlob"));

          if (v54)
          {
            v137[0] = _NSConcreteStackBlock;
            v137[1] = 3221225472;
            v137[2] = sub_10000561C;
            v137[3] = &unk_100010478;
            v137[4] = self;
            v132 = objc_retainBlock(v137);
          }
          else
          {
            v132 = 0;
          }
          v55 = AMAuthInstallApImg4SetSepNonce(v37, v139);
          if (!(_DWORD)v55)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[CRPersonalizationManager initWithAuthInstallObj:](CRPersonalizationManager, "initWithAuthInstallObj:", v37));
            v136 = 0;
            v57 = objc_msgSend(v56, "getApTicketForSeaCookiePairingWithOptions:pairingTicket:error:", 0, &theData, &v136);
            v58 = (CFErrorRef)v136;

            if (!v57 || v58)
            {
              v101 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
              objc_msgSend(v101, "setStatusCode:", &off_100011310);

              v103 = handleForCategory(0, v102);
              v71 = objc_claimAutoreleasedReturnValue(v103);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                sub_10000CF00((uint64_t)v58, v71, v104, v105, v106, v107, v108, v109);
            }
            else
            {
              v59 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer inputs](self, "inputs"));
              v60 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "SCPairURL"));
              v61 = HSCSecureProvisionMesaWithUID(v60, theData, &v140, (uint64_t)v132);

              if (v61)
              {

                goto LABEL_62;
              }
              v58 = v140;
              v68 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
              objc_msgSend(v68, "setStatusCode:", &off_100011340);

              v70 = handleForCategory(0, v69);
              v71 = objc_claimAutoreleasedReturnValue(v70);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                sub_10000CE84((uint64_t)v58, v71);
            }

            v14 = 0;
LABEL_71:

            v12 = 0;
            goto LABEL_72;
          }
          v90 = v55;
          v91 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
          objc_msgSend(v91, "setStatusCode:", &off_1000112F8);

          v93 = handleForCategory(0, v92);
          v94 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            sub_10000CF64(v90, v94, v95, v96, v97, v98, v99, v100);

          v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set SEP nonce with error %d"), v90));
LABEL_100:
          v58 = 0;
          goto LABEL_71;
        }
      }
      if (!+[CRPersonalizationManager enableSSO:](CRPersonalizationManager, "enableSSO:", v37))goto LABEL_53;
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
      objc_msgSend(v110, "setStatusCode:", &off_100011328);

      v112 = handleForCategory(0, v111);
      v113 = objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        sub_10000CFC8();

      v114 = CFSTR("Failed to enable single sign on");
    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v114, v125));
    v132 = 0;
    goto LABEL_100;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, v141));
  v33 = handleForCategory(0, v32);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "description"));
    *(_DWORD *)v145 = 138412290;
    v146 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Mesa sensor serial number: %@", v145, 0xCu);

  }
  if ((HIDWORD(v142) - 6) <= 0xFFFFFFFD)
    goto LABEL_39;
  v132 = 0;
  v134 = v31;
  v37 = 0;
LABEL_62:
  v141 = 128;
  if (sub_10000BABC((char *)buf, &v141))
  {
    v12 = 0;
  }
  else
  {
    v62 = objc_alloc((Class)NSString);
    v63 = objc_msgSend(v62, "initWithBytes:length:encoding:", buf, v141, 4);
    v65 = handleForCategory(0, v64);
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v145 = 138412290;
      v146 = v63;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Mesa Module serial number: %@", v145, 0xCu);
    }

    v12 = v63;
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](self, "result"));
  objc_msgSend(v67, "setStatusCode:", &off_100011358);

  v58 = 0;
  v14 = CFSTR("No Error");
LABEL_72:
  if (sub_10000B79C((int *)&v142))
  {
    v73 = handleForCategory(0, v72);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      sub_10000CDC8();

    LODWORD(v142) = 0;
  }
  if (v37)
    CFRelease(v37);
  if (!v58)
  {
    v13 = v134;
    goto LABEL_8;
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[CRUtils getInnermostNSError:](CRUtils, "getInnermostNSError:", v58));

  v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v75, "code")));
  v131 = v75;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "localizedDescription"));

  v143[0] = CFSTR("mesaPairingErrorCode");
  v13 = v134;
  if (!v17)
    goto LABEL_9;
  v129 = 0;
  v16 = v17;
LABEL_10:
  v128 = (void *)v16;
  v144[0] = v16;
  v143[1] = CFSTR("mesaPairingErrorDescription");
  v18 = v15;
  v130 = (void *)v15;
  if (!v15)
    v18 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v127 = (void *)v18;
  v144[1] = v18;
  v143[2] = CFSTR("mesaSensorPreviousState");
  v19 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v142)));
  v20 = (void *)v19;
  if (!v19)
    v19 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v126 = (void *)v19;
  v144[2] = v19;
  v143[3] = CFSTR("mesaSensorProvisioningState");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v142));
  v22 = v21;
  if (!v21)
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v23 = (void *)v17;
  v144[3] = v22;
  v143[4] = CFSTR("mesaSensorSerialNumber");
  v133 = v13;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
  v25 = v24;
  if (!v24)
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v144[4] = v25;
  v143[5] = CFSTR("mesaModuleSerialNumber");
  v26 = v12;
  v27 = v12;
  if (!v12)
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v144[5] = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v144, v143, 6));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MesaPairer result](v135, "result"));
  objc_msgSend(v29, "setData:", v28);

  if (v27)
  {
    if (v24)
      goto LABEL_22;
  }
  else
  {

    if (v24)
      goto LABEL_22;
  }

LABEL_22:
  if (!v21)

  if (!v20)
  if (!v130)

  if (v129)
  -[MesaPairer setFinished:](v135, "setFinished:", 1);

}

- (void)cancel
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[MesaPairer cancel]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)teardown
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[MesaPairer teardown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (MesaPairerInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
