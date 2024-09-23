@implementation MesaPairerInputs

- (id)_filterSeaCookieServerUrl:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  const __CFString *v12;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (MGGetBoolAnswer(CFSTR("CertificateProductionStatus")))
  {
    v5 = (void *)objc_opt_new(CRUtils);
    v6 = objc_msgSend(v5, "hasEntitlementBoolForTag:inAPTicket:", 1633776739, 0);

    v4 = v3;
    if ((v6 & 1) == 0)
    {

      v8 = handleForCategory(0, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = CFSTR("https://shps.apple.com/hps/processor");
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Prod fused device, force to set SeaCookie server as %@", (uint8_t *)&v11, 0xCu);
      }

      v4 = CFSTR("https://shps.apple.com/hps/processor");
    }
  }

  return v4;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  void *v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSURL *v15;
  NSURL *SCPairURL;
  NSURL *v17;
  uint64_t v18;
  NSURL *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const __CFString *v34;
  uint64_t v35;
  __CFString *v36;
  __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  NSURL *v40;
  NSURL *TatsuURL;
  NSURL *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  NSData *v60;
  NSData *signingKeyBlob;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  BOOL v66;
  unsigned __int8 v68;
  uint8_t buf[4];
  const char *v70;

  v6 = a3;
  v68 = 0;
  v8 = handleForCategory(0, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v70 = "-[MesaPairerInputs validateAndInitializeParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_stringFromKey:maxLength:defaultValue:failed:", CFSTR("SCPairURL"), 256, CFSTR("https://shps.apple.com/hps/processor"), &v68));
  v11 = (char *)objc_claimAutoreleasedReturnValue(-[MesaPairerInputs _filterSeaCookieServerUrl:](self, "_filterSeaCookieServerUrl:", v10));

  v13 = handleForCategory(0, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v70 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SC Pairing URL: %@", buf, 0xCu);
  }

  v15 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
  SCPairURL = self->_SCPairURL;
  self->_SCPairURL = v15;

  v17 = self->_SCPairURL;
  v19 = v17;
  if (!v17)
    goto LABEL_13;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v17, "scheme"));
  v4 = objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("http"));
  if (!v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v19, "scheme"));
    if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("https")))
    {

LABEL_13:
      v22 = handleForCategory(0, v18);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_10000CD94(v23, v24, v25, v26, v27, v28, v29, v30);

      v68 = 1;
      goto LABEL_16;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](v19, "host"));

  if (!v4)
  if (!v21)
    goto LABEL_13;
LABEL_16:
  self->_useAppleConnect = objc_msgSend(v6, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("UseAppleConnect"), 0, &v68);
  v32 = handleForCategory(0, v31);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = CFSTR("YES");
    if (!self->_useAppleConnect)
      v34 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v70 = (const char *)v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Use AppleConnect: %@", buf, 0xCu);
  }

  v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_stringFromKey:maxLength:defaultValue:failed:", CFSTR("TatsuURL"), 256, 0, &v68));
  if (!v36)
  {
    if (self->_useAppleConnect)
      v37 = CFSTR("https://gs.apple.com:443");
    else
      v37 = CFSTR("https://ac-gs.apple.com:443");
    v36 = v37;
  }
  v38 = handleForCategory(0, v35);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v70 = (const char *)v36;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "TATSU server URL: %@", buf, 0xCu);
  }

  v40 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v36));
  TatsuURL = self->_TatsuURL;
  self->_TatsuURL = v40;

  v42 = self->_TatsuURL;
  if (!v42)
    goto LABEL_35;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v42, "scheme"));
  v45 = objc_msgSend(v44, "caseInsensitiveCompare:", CFSTR("http"));
  if (!v45)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v42, "scheme"));
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("https")))
    {

LABEL_35:
      v47 = handleForCategory(0, v43);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        sub_10000CD94(v48, v49, v50, v51, v52, v53, v54, v55);

      v68 = 1;
      goto LABEL_38;
    }
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](v42, "host"));

  if (!v45)
  if (!v46)
    goto LABEL_35;
LABEL_38:
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_stringFromKey:maxLength:defaultValue:failed:", CFSTR("keyBlob"), 1024, 0, &v68));
  if (v57)
  {
    v58 = handleForCategory(0, v56);
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Parsing RIK", buf, 2u);
    }

    v60 = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v57, 0);
    signingKeyBlob = self->_signingKeyBlob;
    self->_signingKeyBlob = v60;

  }
  if (!self->_signingKeyBlob)
  {
    v62 = handleForCategory(0, v56);
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "No RIK", buf, 2u);
    }

  }
  v64 = handleForCategory(0, v56);
  v65 = objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v70) = v68;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "validationFailed is %d", buf, 8u);
  }

  v66 = v68 == 0;
  return v66;
}

- (NSURL)SCPairURL
{
  return self->_SCPairURL;
}

- (NSURL)TatsuURL
{
  return self->_TatsuURL;
}

- (BOOL)useAppleConnect
{
  return self->_useAppleConnect;
}

- (NSData)signingKeyBlob
{
  return self->_signingKeyBlob;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKeyBlob, 0);
  objc_storeStrong((id *)&self->_TatsuURL, 0);
  objc_storeStrong((id *)&self->_SCPairURL, 0);
}

@end
