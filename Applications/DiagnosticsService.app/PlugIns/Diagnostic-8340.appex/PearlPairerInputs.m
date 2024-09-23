@implementation PearlPairerInputs

- (void)_validateURL:(id)a3 failed:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
    v7 = v6;
    if (v6 && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host")), v8, v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
      if (!objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("http")))
      {

        goto LABEL_11;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
      v11 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("https"));

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      v12 = handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10000F238((uint64_t)v5, v13, v14, v15, v16, v17, v18, v19);
    }
    else
    {
      v20 = handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10000F1D0((uint64_t)v5, v13, v21, v22, v23, v24, v25, v26);
    }

    *a4 = 1;
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  NSString *v10;
  NSString *SCPairURL;
  uint64_t v12;
  NSObject *v13;
  NSString *v14;
  NSString *v15;
  NSString *FDRCAURL;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  NSString *v20;
  NSString *FDRDSURL;
  uint64_t v22;
  NSObject *v23;
  NSString *v24;
  NSString *v25;
  NSString *trustObjectURL;
  uint64_t v27;
  NSObject *v28;
  NSString *v29;
  NSString *v30;
  NSString *tatsuURL;
  __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  NSString *v35;
  NSString *v36;
  NSString *rikKeyBlob;
  uint64_t v38;
  NSObject *v39;
  NSString *v40;
  uint64_t v41;
  NSObject *v42;
  const __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  BOOL v46;
  unsigned __int8 v48;
  uint8_t buf[4];
  const char *v50;

  v4 = a3;
  v48 = 0;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[PearlPairerInputs validateAndInitializeParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  self->_useAppleConnect = objc_msgSend(v4, "BOOLFromKey:defaultValue:failed:", CFSTR("UseAppleConnect"), 0, &v48);
  v7 = handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_useAppleConnect)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Use AppleConnect: %@", buf, 0xCu);
  }

  v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NSStringFromKey:defaultValue:failed:", CFSTR("SCPairURL"), CFSTR("https://shps.apple.com/hps/pearl"), &v48));
  SCPairURL = self->_SCPairURL;
  self->_SCPairURL = v10;

  v12 = handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_SCPairURL;
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SC Pairing URL: %@", buf, 0xCu);
  }

  -[PearlPairerInputs _validateURL:failed:](self, "_validateURL:failed:", self->_SCPairURL, &v48);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NSStringFromKey:defaultValue:failed:", CFSTR("CAURL"), 0, &v48));
  FDRCAURL = self->_FDRCAURL;
  self->_FDRCAURL = v15;

  v17 = handleForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_FDRCAURL;
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FDR CA URL: %@", buf, 0xCu);
  }

  -[PearlPairerInputs _validateURL:failed:](self, "_validateURL:failed:", self->_FDRCAURL, &v48);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NSStringFromKey:defaultValue:failed:", CFSTR("DSURL"), 0, &v48));
  FDRDSURL = self->_FDRDSURL;
  self->_FDRDSURL = v20;

  v22 = handleForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_FDRDSURL;
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "FDR DS URL: %@", buf, 0xCu);
  }

  -[PearlPairerInputs _validateURL:failed:](self, "_validateURL:failed:", self->_FDRDSURL, &v48);
  v25 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NSStringFromKey:defaultValue:failed:", CFSTR("TrustObjectURL"), 0, &v48));
  trustObjectURL = self->_trustObjectURL;
  self->_trustObjectURL = v25;

  v27 = handleForCategory(0);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_trustObjectURL;
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "FDR Trust Object URL: %@", buf, 0xCu);
  }

  -[PearlPairerInputs _validateURL:failed:](self, "_validateURL:failed:", self->_trustObjectURL, &v48);
  v30 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NSStringFromKey:defaultValue:failed:", CFSTR("TatsuURL"), 0, &v48));
  tatsuURL = self->_tatsuURL;
  self->_tatsuURL = v30;

  if (!self->_tatsuURL)
  {
    if (self->_useAppleConnect)
      v32 = CFSTR("https://gs.apple.com:443");
    else
      v32 = CFSTR("https://ac-gs.apple.com:443");
    objc_storeStrong((id *)&self->_tatsuURL, v32);
  }
  v33 = handleForCategory(0);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = self->_tatsuURL;
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "TATSU URL: %@", buf, 0xCu);
  }

  -[PearlPairerInputs _validateURL:failed:](self, "_validateURL:failed:", self->_tatsuURL, &v48);
  v36 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NSStringFromKey:defaultValue:failed:", CFSTR("keyBlob"), 0, 0));
  rikKeyBlob = self->_rikKeyBlob;
  self->_rikKeyBlob = v36;

  v38 = handleForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = self->_rikKeyBlob;
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "keyBlob: %@", buf, 0xCu);
  }

  self->_skipScPairingTicket = objc_msgSend(v4, "BOOLFromKey:defaultValue:failed:", CFSTR("SkipScPairingTicket"), 0, &v48);
  v41 = handleForCategory(0);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_skipScPairingTicket)
      v43 = CFSTR("YES");
    else
      v43 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v50 = (const char *)v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Skip SC pairing ticket: %@", buf, 0xCu);
  }

  v44 = handleForCategory(0);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v50) = v48;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "validationFailed is %d", buf, 8u);
  }

  v46 = v48 == 0;
  return v46;
}

- (NSString)SCPairURL
{
  return self->_SCPairURL;
}

- (NSString)FDRCAURL
{
  return self->_FDRCAURL;
}

- (NSString)FDRDSURL
{
  return self->_FDRDSURL;
}

- (NSString)trustObjectURL
{
  return self->_trustObjectURL;
}

- (NSString)tatsuURL
{
  return self->_tatsuURL;
}

- (NSString)rikKeyBlob
{
  return self->_rikKeyBlob;
}

- (BOOL)useAppleConnect
{
  return self->_useAppleConnect;
}

- (BOOL)skipScPairingTicket
{
  return self->_skipScPairingTicket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rikKeyBlob, 0);
  objc_storeStrong((id *)&self->_tatsuURL, 0);
  objc_storeStrong((id *)&self->_trustObjectURL, 0);
  objc_storeStrong((id *)&self->_FDRDSURL, 0);
  objc_storeStrong((id *)&self->_FDRCAURL, 0);
  objc_storeStrong((id *)&self->_SCPairURL, 0);
}

@end
