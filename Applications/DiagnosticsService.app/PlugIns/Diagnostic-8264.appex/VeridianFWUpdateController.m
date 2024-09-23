@implementation VeridianFWUpdateController

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
    v13 = "-[VeridianFWUpdateController setupWithInputs:responder:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v12, 0x20u);
  }

  -[VeridianFWUpdateController setInputs:](self, "setInputs:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController inputs](self, "inputs"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController result](self, "result"));
    objc_msgSend(v11, "setStatusCode:", &off_100008890);

    -[VeridianFWUpdateController setFinished:](self, "setFinished:", 1);
  }

}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  int64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  VeridianFWUpdateController *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  _QWORD v59[5];
  uint8_t buf[4];
  const char *v61;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v61 = "-[VeridianFWUpdateController start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ((+[CRRepairStatus isVeridianFWUpdateRequiredLite](CRRepairStatus, "isVeridianFWUpdateRequiredLite") & 1) == 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[CRRepairStatus getVeridianFWVersionInfo](CRRepairStatus, "getVeridianFWVersionInfo"));
    v12 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    v50 = v11;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No need to update Veridian FW", buf, 2u);
    }
    v7 = 0;
    v8 = 0;
    v13 = v11;
    goto LABEL_22;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController inputs](self, "inputs"));
  v6 = objc_msgSend(v5, "needRequestURL");

  if (v6)
  {
    v57 = 0;
    v7 = -[VeridianFWUpdateController _requestFWURLAndDigestFromAST2WithError:](self, "_requestFWURLAndDigestFromAST2WithError:", &v57);
    v8 = v57;
    if (v7)
    {
      v9 = handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sub_1000059F8();
LABEL_44:
        v50 = 0;
        v13 = 0;
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController inputs](self, "inputs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "FWURL"));
    -[VeridianFWUpdateController setFwURL:](self, "setFwURL:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController inputs](self, "inputs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "FWDigest"));
    -[VeridianFWUpdateController setFwDigest:](self, "setFwDigest:", v17);

    v8 = 0;
    v7 = -24;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwURL](self, "fwURL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
  if ((unint64_t)objc_msgSend(v19, "length") >= 0x101)
  {

LABEL_20:
    v24 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_1000059C8();
      goto LABEL_44;
    }
LABEL_21:
    v13 = 0;
    v50 = 0;
    goto LABEL_22;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwDigest](self, "fwDigest"));
  v21 = objc_msgSend(v20, "length");

  if ((unint64_t)v21 >= 0x101)
    goto LABEL_20;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[CRRepairStatus getVeridianFWVersionInfo](CRRepairStatus, "getVeridianFWVersionInfo"));
  v56 = v8;
  v7 = -[VeridianFWUpdateController _validateDeviceWithError:](self, "_validateDeviceWithError:", &v56);
  v23 = v56;

  if (v7)
  {
    v39 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100005998();
    goto LABEL_52;
  }
  v55 = v23;
  v7 = -[VeridianFWUpdateController _downloadVeridianFirmwareWithError:](self, "_downloadVeridianFirmwareWithError:", &v55);
  v8 = v55;

  if (!v7)
  {
    v54 = v8;
    v7 = -[VeridianFWUpdateController _updateVeridianFirmwareWithError:](self, "_updateVeridianFirmwareWithError:", &v54);
    v23 = v54;

    if (!v7)
    {
      v50 = objc_claimAutoreleasedReturnValue(+[CRRepairStatus getVeridianFWVersionInfo](CRRepairStatus, "getVeridianFWVersionInfo"));
      v13 = v22;
      v10 = v22;
LABEL_18:
      v8 = v23;
      goto LABEL_22;
    }
    v41 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100005904((uint64_t)v23, v10, v42, v43, v44, v45, v46, v47);
LABEL_52:
    v13 = v22;
    v50 = v22;
    goto LABEL_18;
  }
  v40 = handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100005968();
  v13 = v22;
  v50 = v22;
LABEL_22:

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRUtils getInnermostNSError:](CRUtils, "getInnermostNSError:", v8));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v53 = self;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController result](self, "result"));
  objc_msgSend(v27, "setStatusCode:", v26);

  v58[0] = CFSTR("pluginVersion");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));
  v29 = (void *)v28;
  if (!v28)
    v28 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v49 = (void *)v28;
  v59[0] = v28;
  v58[1] = CFSTR("error");
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));
  v31 = (void *)v30;
  if (!v30)
    v30 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v59[1] = v30;
  v58[2] = CFSTR("errorCode");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v25, "code", v30)));
  v33 = v32;
  if (!v32)
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v52 = v25;
  v59[2] = v33;
  v58[3] = CFSTR("oldVeridianFWVersion");
  v34 = v13;
  if (!v13)
    v34 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v35 = v13;
  v59[3] = v34;
  v58[4] = CFSTR("newVeridianFWVersion");
  v36 = v50;
  if (!v50)
    v36 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v59[4] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 5));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController result](v53, "result"));
  objc_msgSend(v38, "setData:", v37);

  if (v50)
  {
    if (v35)
      goto LABEL_34;
LABEL_41:

    if (v32)
      goto LABEL_35;
    goto LABEL_42;
  }

  if (!v35)
    goto LABEL_41;
LABEL_34:
  if (v32)
    goto LABEL_35;
LABEL_42:

LABEL_35:
  if (!v31)

  if (!v29)
  -[VeridianFWUpdateController setFinished:](v53, "setFinished:", 1);

}

- (int64_t)_requestFWURLAndDigestFromAST2WithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  dispatch_time_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id CRError;
  NSObject *v28;
  int64_t v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  NSObject *v50;
  __int128 *p_buf;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t v59[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int128 buf;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[VeridianFWUpdateController _requestFWURLAndDigestFromAST2WithError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v64 = 0x3032000000;
  v65 = sub_100003A98;
  v66 = sub_100003AA8;
  v67 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_100003A98;
  v57 = sub_100003AA8;
  v58 = 0;
  v7 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
  if (!v7)
  {
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFD6, CFSTR("Failed to get device FGSN"), 0);
    v24 = objc_claimAutoreleasedReturnValue(CRError);
    v25 = 0;
    v26 = 0;
    v11 = 0;
    v15 = 0;
    v16 = 0;
    v20 = 0;
    goto LABEL_11;
  }
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v59 = 138412290;
    v60 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request Veridian fwURL & fwDigest with device serial number: %@", v59, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v10, self, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController inputs](self, "inputs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ast2RequestURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v14));

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v16, "setObject:forKey:", v7, CFSTR("serialNumber"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v16, 0, 0));
  objc_msgSend(v15, "setHTTPBody:", v17);

  v18 = dispatch_semaphore_create(0);
  v19 = objc_autoreleasePoolPush();
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100003AB0;
  v49[3] = &unk_1000082C0;
  p_buf = &buf;
  v52 = &v53;
  v20 = v18;
  v50 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v15, v49));
  objc_msgSend(v21, "resume");

  objc_autoreleasePoolPop(v19);
  v22 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v20, v22))
  {
    v23 = createCRError((void *)0xFFFFFFFFFFFFFFF3, CFSTR("Waiting for fwURL & fwDigest from AST2 timeout"), 0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
LABEL_8:
    v25 = 0;
LABEL_9:
    v26 = 0;
LABEL_11:
    v28 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v24;
    v29 = -24;
    goto LABEL_12;
  }
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v25 = 0;
    v26 = 0;
    v29 = -24;
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v54[5], "objectForKeyedSubscript:", CFSTR("batteryFW")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("fwURL")));

  if (!v25)
  {
    v35 = createCRError((void *)0xFFFFFFFFFFFFFFE8, CFSTR("fwURL is nil from AST2"), 0);
    v24 = objc_claimAutoreleasedReturnValue(v35);
    goto LABEL_8;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));
  -[VeridianFWUpdateController setFwURL:](self, "setFwURL:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwURL](self, "fwURL"));
  if (!v33)
    goto LABEL_25;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwURL](self, "fwURL"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "host"));
  if (!v45)
  {

    goto LABEL_25;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwURL](self, "fwURL"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "scheme"));
  if (objc_msgSend(v34, "caseInsensitiveCompare:", CFSTR("http")))
  {

    goto LABEL_27;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwURL](self, "fwURL"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "scheme"));
  v41 = objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("https")) == 0;

  if (v41)
  {
LABEL_25:
    v36 = createCRError((void *)0xFFFFFFFFFFFFFFE8, CFSTR("Invaild fwURL from AST2"), 0);
    v24 = objc_claimAutoreleasedReturnValue(v36);
    goto LABEL_9;
  }
LABEL_27:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v54[5], "objectForKeyedSubscript:", CFSTR("batteryFW")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("fwDigest")));

  if (!v26)
  {
    v40 = createCRError((void *)0xFFFFFFFFFFFFFFE8, CFSTR("fwDigest is nil from AST2"), 0);
    v24 = objc_claimAutoreleasedReturnValue(v40);
    goto LABEL_9;
  }
  -[VeridianFWUpdateController setFwDigest:](self, "setFwDigest:", v26);
  v38 = handleForCategory(0);
  v28 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwURL](self, "fwURL"));
    v39 = objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwDigest](self, "fwDigest"));
    *(_DWORD *)v59 = 138412546;
    v60 = v48;
    v61 = 2112;
    v62 = v39;
    v46 = (void *)v39;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Request Veridian fwURL: %@ and fwDigest: %@ from AST2 successfully", v59, 0x16u);

  }
  v29 = 0;
LABEL_12:

  if (a3)
LABEL_13:
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
LABEL_14:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&buf, 8);

  return v29;
}

- (int64_t)_downloadVeridianFirmwareWithError:(id *)a3
{
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  dispatch_time_t v23;
  intptr_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  int v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  void *v35;
  id CRError;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v44;
  void *v45;
  void *v46;
  _QWORD v47[9];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  _QWORD v58[5];
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  dispatch_semaphore_t v65;
  uint8_t v66[4];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int128 buf;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[VeridianFWUpdateController _downloadVeridianFirmwareWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/tmp/VeridianFWImage/FirmwareMap.plist")));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v71 = 0x3032000000;
  v72 = sub_100003A98;
  v73 = sub_100003AA8;
  v74 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = sub_100003A98;
  v64 = sub_100003AA8;
  v65 = dispatch_semaphore_create(0);
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_100003A98;
  v58[4] = sub_100003AA8;
  v59 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_100003A98;
  v52 = sub_100003AA8;
  v53 = 0;
  mkdir("/private/var/tmp/VeridianFWImage/", 0x1C0u);
  v6 = 0;
  v46 = 0;
  v7 = 0;
  v44 = -23;
  do
  {
    v8 = objc_autoreleasePoolPush();
    v9 = (void *)v49[5];
    v49[5] = 0;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = objc_msgSend(v10, "fileExistsAtPath:", CFSTR("/private/var/tmp/VeridianFWImage/FirmwareMap.plist"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v12, "removeItemAtPath:error:", CFSTR("/private/var/tmp/VeridianFWImage/FirmwareMap.plist"), 0);

    }
    sleep(v6);
    v13 = handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v66 = 67109120;
      LODWORD(v67) = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Downloading the FirmwareMap:counter:%d", v66, 8u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    v16 = (void *)objc_opt_new(CRURLSessionDelegate);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v15, v16, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwURL](self, "fwURL"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000042F8;
    v47[3] = &unk_1000082E8;
    v47[4] = &buf;
    v47[5] = &v54;
    v47[6] = v58;
    v47[7] = &v48;
    v47[8] = &v60;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "downloadTaskWithURL:completionHandler:", v18, v47));
    objc_msgSend(v19, "resume");

    v20 = v61[5];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController inputs](self, "inputs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeoutPeriod"));
    v23 = dispatch_time(0, 1000000000 * (int)objc_msgSend(v22, "intValue"));
    v24 = dispatch_semaphore_wait(v20, v23);

    if (v24 || !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) || v49[5] || !*((_BYTE *)v55 + 24))
    {
      v25 = handleForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v39 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        v40 = v49[5];
        *(_DWORD *)v66 = 138412546;
        v67 = v39;
        v68 = 2112;
        v69 = v40;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to download firmwareMap::location:%@:error:%@", v66, 0x16u);
      }
      v27 = 0;
    }
    else
    {
      v30 = handleForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v66 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Asset download success", v66, 2u);
      }

      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "SHA256DigestString"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwDigest](self, "fwDigest"));
      v34 = objc_msgSend(v33, "caseInsensitiveCompare:", v32) == 0;

      if (v34)
      {
        v41 = handleForCategory(0);
        v26 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v66 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Asset digest match success", v66, 2u);
        }
        v44 = 0;
        v27 = 1;
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController fwDigest](self, "fwDigest"));
        v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Digest Mismatched, Download Failure:%@:%@"), v35, v32));

        CRError = createCRError((void *)0xFFFFFFFFFFFFFFE9, v26, 0);
        v37 = objc_claimAutoreleasedReturnValue(CRError);
        v38 = (void *)v49[5];
        v49[5] = v37;

        v27 = 0;
      }
      v46 = (void *)v32;
    }

    objc_autoreleasePoolPop(v8);
    if (v7++ > 1)
      v29 = 1;
    else
      v29 = v27;
    v6 += 3;
  }
  while (v29 != 1);
  if (a3)
    *a3 = objc_retainAutorelease((id)v49[5]);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&buf, 8);

  return v44;
}

- (int64_t)_updateVeridianFirmwareWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  CFURLRef v7;
  id v8;
  id v9;
  unsigned int v10;
  int64_t v11;
  void *v12;
  __CFDictionary *Mutable;
  __CFDictionary *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  char v19;
  uint64_t v20;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  const __CFURL *v28;
  void *v29;
  _UNKNOWN **v30;
  unsigned __int8 v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint32_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  int64_t v53;
  id *v54;
  VeridianFWUpdateController *v55;
  void *key;
  const char *CStringPtr;
  void *value;
  id v59;
  char v60;
  _BYTE v61[15];
  char v62;
  _BYTE v63[15];
  char v64;
  _BYTE v65[15];
  uint64_t v66;
  const void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint8_t buf[4];
  _BYTE v73[18];

  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v73 = "-[VeridianFWUpdateController _updateVeridianFirmwareWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v68 = 0;
  v69 = 0;
  value = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
  v66 = 0;
  v67 = 0;
  v7 = CFURLCreateWithFileSystemPath(0, CFSTR("/private/var/tmp/VeridianFWImage/"), kCFURLPOSIXPathStyle, 1u);
  CStringPtr = CFStringGetCStringPtr(CFSTR("T200"), 0x8000100u);
  v54 = a3;
  if (CStringPtr && v7)
  {
    v55 = self;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    key = (void *)kAMAuthInstallUpdaterDeviceInfo;
    v11 = -24;
    while (1)
    {
      v12 = objc_autoreleasePoolPush();
      v66 = 0;
      v67 = 0;

      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v14 = Mutable;
      if (!Mutable)
      {
        v20 = handleForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_100005B20(&v64, v65);
        v9 = 0;
        v19 = 0;
        v15 = 0;
        goto LABEL_18;
      }
      CFDictionarySetValue(Mutable, kT200OptionUpdateType, value);
      CFDictionarySetValue(v14, CFSTR("BundlePath"), v7);
      v15 = T200UpdaterCreate(v14, sub_100004EEC, CStringPtr, &v69);
      v9 = v69;
      if (v15)
        v16 = v69 == 0;
      else
        v16 = 0;
      if (!v16)
      {
        v69 = 0;
        v17 = handleForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v73 = CStringPtr;
          *(_WORD *)&v73[8] = 2112;
          *(_QWORD *)&v73[10] = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to create %s obj::error:%@", buf, 0x16u);
        }
        v19 = 0;
LABEL_14:
        v11 = -24;
        goto LABEL_18;
      }
      v22 = handleForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Created the Veridian Updater", buf, 2u);
      }

      if (T200UpdaterIsDone(v15, &v69))
      {
        v9 = 0;
        v19 = 0;
        goto LABEL_19;
      }
      v19 = 0;
      while (1)
      {
        v9 = v69;
        if (v69)
        {
          v69 = 0;
          v39 = handleForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue(v39);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_14;
LABEL_52:
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v9;
          v41 = v18;
          v42 = "T200UpdaterExecCommand failed:%@";
          v43 = 12;
LABEL_63:
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, v42, buf, v43);
          goto LABEL_14;
        }
        v24 = T200UpdaterExecCommand(v15, CFSTR("queryInfo"), 0, &v67, &v69);
        v9 = v69;
        if (!v24 || v69)
        {
          v69 = 0;
          v40 = handleForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue(v40);
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          goto LABEL_52;
        }
        v25 = handleForCategory(0);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v67;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Device Info Dict is %@", buf, 0xCu);
        }

        CFDictionarySetValue(v14, key, v67);
        v27 = +[CRPersonalizationManager getDefaultAMAuthInstallRef](CRPersonalizationManager, "getDefaultAMAuthInstallRef");
        if (!v27)
          break;
        v8 = v27;
        v28 = v7;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[VeridianFWUpdateController inputs](v55, "inputs"));
        if ((objc_msgSend(v29, "useAppleConnect") & 1) != 0)
        {

          v30 = &AMSupportSafeRelease_ptr;
        }
        else
        {
          v30 = &AMSupportSafeRelease_ptr;
          v31 = +[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault");

          if ((v31 & 1) == 0)
            goto LABEL_38;
        }
        if (objc_msgSend(v30[13], "enableSSO:", v8))
        {
          v49 = handleForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            sub_100005B78(&v60, v61);
          v9 = 0;
          v7 = v28;
          goto LABEL_67;
        }
LABEL_38:
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[13], "initWithAuthInstallObj:", v8));
        v59 = 0;
        v33 = objc_msgSend(v32, "getBMUTicketForVeridianFWUpdateWithOptions:BMUTicket:error:", v14, &v68, &v59);
        v9 = v59;

        v34 = handleForCategory(0);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v73 = v68;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "BMU ticket:%@", buf, 0xCu);
        }

        if (!v33 || !v68 || v9)
        {
          v45 = +[CRPersonalizationManager IsTatsuErrorNetworkingRelated:](CRPersonalizationManager, "IsTatsuErrorNetworkingRelated:", objc_msgSend(v9, "code"));
          v46 = -15;
          if (v45)
            v46 = -13;
          v53 = v46;
          v47 = handleForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = v33;
            *(_WORD *)&v73[4] = 2112;
            *(_QWORD *)&v73[6] = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Veridan FW Personalization failed:%d:%@", buf, 0x12u);
          }
          v7 = v28;
          v11 = v53;
          goto LABEL_18;
        }
        CFDictionaryAddValue(v14, CFSTR("BMU,Ticket"), v68);
        v70 = kT200SkipFirmwareMapStore;
        v71 = &__kCFBooleanTrue;
        CFDictionaryAddValue(v14, CFSTR("Options"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
        v36 = T200UpdaterExecCommand(v15, CFSTR("performNextStage"), v14, &v66, &v69);
        v9 = v69;
        if (!v36 || v69)
        {
          v69 = 0;
          v48 = handleForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue(v48);
          v7 = v28;
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v73 = v9;
          *(_WORD *)&v73[8] = 2112;
          *(_QWORD *)&v73[10] = v66;
          v41 = v18;
          v42 = "T200UpdaterExecCommand failed: %@:%@";
          v43 = 22;
          goto LABEL_63;
        }
        v37 = handleForCategory(0);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        v7 = v28;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Veridian Firmware Update Successful", buf, 2u);
        }

        v19 = 1;
        if (T200UpdaterIsDone(v15, &v69))
        {
          v9 = 0;
          v11 = 0;
          goto LABEL_19;
        }
      }
      v44 = handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100005B4C(&v62, v63);
      v8 = 0;
      v9 = 0;
LABEL_67:
      v11 = -15;
LABEL_18:

LABEL_19:
      AMSupportSafeRelease(v67);
      AMSupportSafeRelease(v66);
      AMSupportSafeRelease(v15);
      AMSupportSafeRelease(v14);
      AMSupportSafeRelease(v8);
      objc_autoreleasePoolPop(v12);
      if ((v19 & 1) == 0 && v10++ < 2)
        continue;
      goto LABEL_71;
    }
  }
  v50 = handleForCategory(0);
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    sub_100005AF0();

  v9 = 0;
  v11 = -24;
LABEL_71:
  if (v54)
    *v54 = objc_retainAutorelease(v9);
  AMSupportSafeRelease(v7);

  return v11;
}

- (int64_t)_validateDeviceWithError:(id *)a3
{
  uint64_t v4;
  NSObject *v5;
  BOOL v6;
  __CFString *v10;
  int64_t v11;
  uint64_t v12;
  id CRError;
  void *v14;
  void *v16;
  unsigned __int8 v17;
  int v18;
  const char *v19;

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[VeridianFWUpdateController _validateDeviceWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
  }

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("vcrt")) & 1) == 0)
  {
    v10 = CFSTR("Veridian FW Update not supported");
    goto LABEL_20;
  }
  if (&kT200SkipFirmwareMapStore)
    v6 = &_T200UpdaterExecCommand == 0;
  else
    v6 = 1;
  if (v6 || &_T200UpdaterIsDone == 0 || &_T200UpdaterCreate == 0 || &kT200OptionUpdateType == 0)
  {
    v10 = CFSTR("Veridian symbols absent");
LABEL_20:
    v11 = -22;
    v12 = -22;
    goto LABEL_21;
  }
  v16 = (void *)objc_opt_new(CRBatteryStatus);
  v17 = objc_msgSend(v16, "isFirstAuthComplete");

  if ((v17 & 1) != 0)
  {
    v11 = 0;
    v14 = 0;
    if (!a3)
      goto LABEL_23;
    goto LABEL_22;
  }
  v10 = CFSTR("Veridian First Auth Not Complete");
  v11 = -21;
  v12 = -21;
LABEL_21:
  CRError = createCRError((void *)v12, v10, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(CRError);
  if (a3)
LABEL_22:
    *a3 = objc_retainAutorelease(v14);
LABEL_23:

  return v11;
}

- (VeridianFWUpdaterInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->inputs, a3);
}

- (NSURL)fwURL
{
  return self->_fwURL;
}

- (void)setFwURL:(id)a3
{
  objc_storeStrong((id *)&self->_fwURL, a3);
}

- (NSString)fwDigest
{
  return self->_fwDigest;
}

- (void)setFwDigest:(id)a3
{
  objc_storeStrong((id *)&self->_fwDigest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fwDigest, 0);
  objc_storeStrong((id *)&self->_fwURL, 0);
  objc_storeStrong((id *)&self->inputs, 0);
}

@end
