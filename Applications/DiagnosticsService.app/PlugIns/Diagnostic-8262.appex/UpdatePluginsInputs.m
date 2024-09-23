@implementation UpdatePluginsInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  NSString *v9;
  NSString *ast2RequestURL;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  uint64_t v14;
  NSObject *v15;
  NSURL *v16;
  NSURL *PDIURL;
  NSURL *v18;
  void *v19;
  id v20;
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
  NSString *v31;
  NSString *PDIDigest;
  uint64_t v33;
  NSObject *v34;
  NSString *v35;
  NSNumber *v36;
  NSNumber *timeoutPeriod;
  uint64_t v38;
  NSObject *v39;
  NSNumber *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  NSURL *v44;
  NSURL *tatsuURL;
  NSURL *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  const __CFString *v61;
  BOOL v62;
  char v64;
  uint8_t buf[4];
  void *v66;

  v5 = a3;
  v64 = 0;
  self->needRequestURL = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("needRequestURL"), 0, &v64);
  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self->needRequestURL)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v66 = (void *)v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Get repair update PDI URL & digest from AST2: %@", buf, 0xCu);
  }

  if (self->needRequestURL)
  {
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("ast2RequestURL"), CFSTR("https://diagnostics-mdn1.apple.com/api/v1/ast2-companion/public/services/assets/plugin"), &v64));
    ast2RequestURL = self->ast2RequestURL;
    self->ast2RequestURL = v9;

    v11 = handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->ast2RequestURL;
      *(_DWORD *)buf = 138412290;
      v66 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting repair update PDI URL and digest from: %@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromRequiredKey:maxLength:failed:", CFSTR("pdiURL"), 256, &v64));
  v14 = handleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PDIURL: %@", buf, 0xCu);
  }

  v16 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
  PDIURL = self->PDIURL;
  self->PDIURL = v16;

  v18 = self->PDIURL;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v18, "scheme"));
    v20 = objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("http"));
    if (v20
      || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self->PDIURL, "scheme")),
          objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("https"))))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self->PDIURL, "host"));

      if (!v20)
      if (v21)
        goto LABEL_22;
    }
    else
    {

    }
  }
  v22 = handleForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_1000059CC(v23, v24, v25, v26, v27, v28, v29, v30);

  v64 = 1;
LABEL_22:
  v31 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromRequiredKey:maxLength:failed:", CFSTR("pdiDigest"), 256, &v64));
  PDIDigest = self->PDIDigest;
  self->PDIDigest = v31;

  v33 = handleForCategory(0);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = self->PDIDigest;
    *(_DWORD *)buf = 138412290;
    v66 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "PDIDigest: %@", buf, 0xCu);
  }

LABEL_25:
  v36 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("timeoutPeriod"), &off_100008960, &off_100008978, &off_100008990, &v64));
  timeoutPeriod = self->timeoutPeriod;
  self->timeoutPeriod = v36;

  v38 = handleForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = self->timeoutPeriod;
    *(_DWORD *)buf = 138412290;
    v66 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Timeout period : %@ s", buf, 0xCu);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("tatsuURL"), CFSTR("https://gs.apple.com"), &v64));
  v42 = handleForCategory(0);
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v41;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "tatsuURL: %@", buf, 0xCu);
  }

  v44 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v41));
  tatsuURL = self->tatsuURL;
  self->tatsuURL = v44;

  v46 = self->tatsuURL;
  if (!v46)
    goto LABEL_37;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v46, "scheme"));
  v48 = objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("http"));
  if (!v48)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self->tatsuURL, "scheme"));
    if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("https")))
    {

LABEL_37:
      v50 = handleForCategory(0);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_100005998(v51, v52, v53, v54, v55, v56, v57, v58);

      v64 = 1;
      goto LABEL_40;
    }
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self->tatsuURL, "host"));

  if (!v48)
  if (!v49)
    goto LABEL_37;
LABEL_40:
  self->useAppleConnect = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("useAppleConnect"), 0, &v64);
  v59 = handleForCategory(0);
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    if (self->useAppleConnect)
      v61 = CFSTR("YES");
    else
      v61 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v66 = (void *)v61;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "useAppleConnect: %@", buf, 0xCu);
  }

  v62 = v64 == 0;
  return v62;
}

- (NSURL)PDIURL
{
  return self->PDIURL;
}

- (NSString)PDIDigest
{
  return self->PDIDigest;
}

- (NSNumber)timeoutPeriod
{
  return self->timeoutPeriod;
}

- (BOOL)useAppleConnect
{
  return self->useAppleConnect;
}

- (NSURL)tatsuURL
{
  return self->tatsuURL;
}

- (BOOL)needRequestURL
{
  return self->needRequestURL;
}

- (NSString)ast2RequestURL
{
  return self->ast2RequestURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ast2RequestURL, 0);
  objc_storeStrong((id *)&self->tatsuURL, 0);
  objc_storeStrong((id *)&self->timeoutPeriod, 0);
  objc_storeStrong((id *)&self->PDIDigest, 0);
  objc_storeStrong((id *)&self->PDIURL, 0);
}

@end
