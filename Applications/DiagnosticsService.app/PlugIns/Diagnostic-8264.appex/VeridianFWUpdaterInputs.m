@implementation VeridianFWUpdaterInputs

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
  NSURL *FWURL;
  NSURL *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSString *v24;
  NSString *FWDigest;
  uint64_t v26;
  NSObject *v27;
  NSString *v28;
  NSNumber *v29;
  NSNumber *timeoutPeriod;
  uint64_t v31;
  NSObject *v32;
  NSNumber *v33;
  NSString *v34;
  NSString *mountPath;
  uint64_t v36;
  NSObject *v37;
  NSString *v38;
  uint64_t v39;
  NSObject *v40;
  const __CFString *v41;
  BOOL v42;
  char v44;
  uint8_t buf[4];
  void *v46;

  v5 = a3;
  v44 = 0;
  self->needRequestURL = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("needRequestURL"), 0, &v44);
  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self->needRequestURL)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v46 = (void *)v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Need to request FWURL from AST2: %@", buf, 0xCu);
  }

  if (self->needRequestURL)
  {
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("ast2RequestURL"), CFSTR("https://diagnostics-mdn1.apple.com/api/v1/ast2-companion/public/services/firmware/batteries"), &v44));
    ast2RequestURL = self->ast2RequestURL;
    self->ast2RequestURL = v9;

    v11 = handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->ast2RequestURL;
      *(_DWORD *)buf = 138412290;
      v46 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting Veridian FW URL and digest from: %@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("fwURL"), 0, &v44));
  v14 = handleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FWURL: %@", buf, 0xCu);
  }

  v16 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
  FWURL = self->FWURL;
  self->FWURL = v16;

  v18 = self->FWURL;
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v18, "scheme"));
    v20 = objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("http"));
    if (v20
      || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](self->FWURL, "scheme")),
          objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("https"))))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self->FWURL, "host"));

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
    sub_100005BA4(v23);

  v44 = 1;
LABEL_22:
  v24 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("fwDigest"), 0, &v44));
  FWDigest = self->FWDigest;
  self->FWDigest = v24;

  v26 = handleForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self->FWDigest;
    *(_DWORD *)buf = 138412290;
    v46 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "fwDigest: %@", buf, 0xCu);
  }

LABEL_25:
  v29 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("timeoutPeriod"), &off_1000088A8, &off_1000088C0, &off_1000088A8, &v44));
  timeoutPeriod = self->timeoutPeriod;
  self->timeoutPeriod = v29;

  v31 = handleForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = self->timeoutPeriod;
    *(_DWORD *)buf = 138412290;
    v46 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Timeout period : %@ s", buf, 0xCu);
  }

  v34 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "NSStringFromKey:defaultValue:failed:", CFSTR("MountPath"), 0, 0));
  mountPath = self->mountPath;
  self->mountPath = v34;

  v36 = handleForCategory(0);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = self->mountPath;
    *(_DWORD *)buf = 138412290;
    v46 = v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PDI mountPath is %@", buf, 0xCu);
  }

  self->useAppleConnect = objc_msgSend(v5, "BOOLFromKey:defaultValue:failed:", CFSTR("UseAppleConnect"), 0, &v44);
  v39 = handleForCategory(0);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    if (self->useAppleConnect)
      v41 = CFSTR("YES");
    else
      v41 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v46 = (void *)v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "useAppleConnect: %@", buf, 0xCu);
  }

  v42 = v44 == 0;
  return v42;
}

- (NSURL)FWURL
{
  return self->FWURL;
}

- (NSString)FWDigest
{
  return self->FWDigest;
}

- (NSNumber)timeoutPeriod
{
  return self->timeoutPeriod;
}

- (NSString)mountPath
{
  return self->mountPath;
}

- (BOOL)useAppleConnect
{
  return self->useAppleConnect;
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
  objc_storeStrong((id *)&self->mountPath, 0);
  objc_storeStrong((id *)&self->timeoutPeriod, 0);
  objc_storeStrong((id *)&self->FWDigest, 0);
  objc_storeStrong((id *)&self->FWURL, 0);
}

@end
