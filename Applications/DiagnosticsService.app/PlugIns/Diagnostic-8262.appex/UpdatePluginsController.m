@implementation UpdatePluginsController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  DKResponder *v7;
  uint64_t v8;
  NSObject *v9;
  DKResponder *diagsReponder;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  DKResponder *v18;

  v6 = a3;
  v7 = (DKResponder *)a4;
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[UpdatePluginsController setupWithInputs:responder:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v13, 0x20u);
  }

  -[UpdatePluginsController setInputs:](self, "setInputs:", v6);
  diagsReponder = self->diagsReponder;
  self->diagsReponder = v7;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController result](self, "result"));
    objc_msgSend(v12, "setStatusCode:", &off_1000089A8);

    -[UpdatePluginsController setFinished:](self, "setFinished:", 1);
  }

}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  CRPluginsController *v5;
  CRPluginsController *pluginsHandle;
  void *v7;
  unsigned int v8;
  int64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *pdiMountPath;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[5];
  _QWORD v65[5];
  uint8_t buf[4];
  const char *v67;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v67 = "-[UpdatePluginsController start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = objc_opt_new(CRPluginsController);
  pluginsHandle = self->pluginsHandle;
  self->pluginsHandle = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
  v8 = objc_msgSend(v7, "needRequestURL");

  if (v8)
  {
    v63 = 0;
    v9 = -[UpdatePluginsController _requestUpdateURLAndDigestFromAST2WithError:](self, "_requestUpdateURLAndDigestFromAST2WithError:", &v63);
    v10 = v63;
    if (v9)
    {
      v52 = handleForCategory(0);
      v37 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_100005AC8((uint64_t)v10, v37, v53, v54, v55, v56, v57, v58);
      goto LABEL_39;
    }
    v11 = objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiURL](self, "pdiURL"));
    if (!v11
      || (v12 = (void *)v11,
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiDigest](self, "pdiDigest")),
          v13,
          v12,
          !v13))
    {
      v14 = 0;
      v9 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "PDIURL"));
    -[UpdatePluginsController setPdiURL:](self, "setPdiURL:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "PDIDigest"));
    -[UpdatePluginsController setPdiDigest:](self, "setPdiDigest:", v18);

    v10 = 0;
  }
  v19 = v10;
  v62 = v10;
  v9 = -[UpdatePluginsController _downloadDiskImageWithError:](self, "_downloadDiskImageWithError:", &v62);
  v10 = v62;

  if (v9)
  {
    v36 = handleForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_100005A64((uint64_t)v10, v37, v38, v39, v40, v41, v42, v43);
LABEL_39:

    v14 = 0;
    goto LABEL_15;
  }
  v61 = v10;
  v9 = -[UpdatePluginsController _performPluginsUpdateWithError:](self, "_performPluginsUpdateWithError:", &v61);
  v20 = v61;

  if (v9)
  {
    v44 = handleForCategory(0);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_100005A00((uint64_t)v20, v45, v46, v47, v48, v49, v50, v51);

    v14 = 0;
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(-[UpdatePluginsController diskPluginsMap](self, "diskPluginsMap"));
    v21 = handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Reloading the Diagnostics Plugins", buf, 2u);
    }

    -[DKResponder requestPluginReloadOnFinishWithCompletion:](self->diagsReponder, "requestPluginReloadOnFinishWithCompletion:", &stru_100008288);
    v9 = 0;
  }
  v10 = v20;
LABEL_15:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRUtils getInnermostNSError:](CRUtils, "getInnermostNSError:", v10));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController result](self, "result"));
  objc_msgSend(v25, "setStatusCode:", v24);

  v64[0] = CFSTR("MountPath");
  pdiMountPath = self->pdiMountPath;
  v27 = (uint64_t)pdiMountPath;
  if (!pdiMountPath)
    v27 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v59 = (void *)v27;
  v65[0] = v27;
  v65[1] = CFSTR("1.0");
  v64[1] = CFSTR("pluginVersion");
  v64[2] = CFSTR("error");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
  v29 = v28;
  if (!v28)
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v65[2] = v29;
  v64[3] = CFSTR("errorCode");
  v60 = v23;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v23, "code")));
  v31 = v30;
  if (!v30)
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v65[3] = v31;
  v64[4] = CFSTR("newPluginVersions");
  v32 = (void *)v14;
  v33 = (void *)v14;
  if (!v14)
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v65[4] = v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 5));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController result](self, "result"));
  objc_msgSend(v35, "setData:", v34);

  if (v33)
  {
    if (v30)
      goto LABEL_25;
  }
  else
  {

    if (v30)
      goto LABEL_25;
  }

LABEL_25:
  if (!v28)

  if (!pdiMountPath)
  -[UpdatePluginsController setFinished:](self, "setFinished:", 1);

}

- (int64_t)_requestUpdateURLAndDigestFromAST2WithError:(id *)a3
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
  id CRError;
  void *v26;
  void *v27;
  NSObject *v28;
  int64_t v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t *v50;
  __int128 *p_buf;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t v58[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int128 buf;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[UpdatePluginsController _requestUpdateURLAndDigestFromAST2WithError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v63 = 0x3032000000;
  v64 = sub_1000040D8;
  v65 = sub_1000040E8;
  v66 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_1000040D8;
  v56 = sub_1000040E8;
  v57 = 0;
  v7 = (void *)MGCopyAnswer(CFSTR("ProductVersion"), 0);
  if (!v7)
  {
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFD6, CFSTR("Failed to get OS version from MG"), 0);
    v24 = objc_claimAutoreleasedReturnValue(CRError);
    v11 = 0;
    v15 = 0;
    v16 = 0;
    v20 = 0;
    goto LABEL_9;
  }
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v58 = 138412290;
    v59 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request repair update pdiURL & pdiDigest with OS version: %@", v58, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v10, self, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ast2RequestURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v14));

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v16, "setObject:forKey:", v7, CFSTR("osVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v16, 0, 0));
  objc_msgSend(v15, "setHTTPBody:", v17);

  v18 = dispatch_semaphore_create(0);
  v19 = objc_autoreleasePoolPush();
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000040F0;
  v48[3] = &unk_1000082B0;
  v50 = &v52;
  p_buf = &buf;
  v20 = v18;
  v49 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v15, v48));
  objc_msgSend(v21, "resume");

  objc_autoreleasePoolPop(v19);
  v22 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v20, v22))
  {
    v23 = createCRError((void *)0xFFFFFFFFFFFFFFF3, CFSTR("Waiting for pdiURL & pdiDigest from AST2 timeout"), 0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
LABEL_9:
    v26 = 0;
    v27 = 0;
LABEL_10:
    v28 = v53[5];
    v53[5] = v24;
    v29 = 1;
    goto LABEL_11;
  }
  if (v53[5])
  {
    v26 = 0;
    v27 = 0;
    v29 = 1;
    if (!a3)
      goto LABEL_13;
    goto LABEL_12;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", CFSTR("plugin")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("dmgURL")));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKeyedSubscript:", CFSTR("plugin")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("dmgDigest")));

  if (v27 && v26)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v27));
    -[UpdatePluginsController setPdiURL:](self, "setPdiURL:", v33);

    -[UpdatePluginsController setPdiDigest:](self, "setPdiDigest:", v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiURL](self, "pdiURL"));
    if (v34)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiURL](self, "pdiURL"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "host"));
      if (v46)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiURL](self, "pdiURL"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "scheme"));
        if (objc_msgSend(v44, "caseInsensitiveCompare:", CFSTR("http")))
        {

          goto LABEL_28;
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiURL](self, "pdiURL"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "scheme"));
        v42 = objc_msgSend(v40, "caseInsensitiveCompare:", CFSTR("https")) == 0;

        if (!v42)
        {
LABEL_28:
          v41 = handleForCategory(0);
          v28 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v58 = 138412546;
            v59 = v27;
            v60 = 2112;
            v61 = v26;
            v36 = "Request repair udpate pdiURL: %@, pdiDigest: %@";
            v37 = v28;
            v38 = 22;
            goto LABEL_30;
          }
          goto LABEL_31;
        }
      }
      else
      {

      }
    }
    v39 = createCRError((void *)0xFFFFFFFFFFFFFFE8, CFSTR("Invaild PDI URL from AST2"), 0);
    v24 = objc_claimAutoreleasedReturnValue(v39);
    goto LABEL_10;
  }
  v35 = handleForCategory(0);
  v28 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v58 = 0;
    v36 = "No need to update repair software";
    v37 = v28;
    v38 = 2;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, v58, v38);
  }
LABEL_31:
  v29 = 0;
LABEL_11:

  if (a3)
LABEL_12:
    *a3 = objc_retainAutorelease((id)v53[5]);
LABEL_13:

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&buf, 8);

  return v29;
}

- (int64_t)_downloadDiskImageWithError:(id *)a3
{
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  intptr_t v25;
  void *v26;
  NSObject *v27;
  id CRError;
  uint64_t v29;
  void *v30;
  int v31;
  int v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  int64_t v46;
  void *v47;
  _QWORD v48[9];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _QWORD v59[5];
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  dispatch_semaphore_t v66;
  uint8_t v67[4];
  unsigned int v68;
  __int128 buf;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[UpdatePluginsController _downloadDiskImageWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg")));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v70 = 0x3032000000;
  v71 = sub_1000040D8;
  v72 = sub_1000040E8;
  v73 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = sub_1000040D8;
  v65 = sub_1000040E8;
  v66 = dispatch_semaphore_create(0);
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = sub_1000040D8;
  v59[4] = sub_1000040E8;
  v60 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_1000040D8;
  v53 = sub_1000040E8;
  v54 = 0;
  mkdir("/private/var/mobile/RepairDiskImage/", 0x1C0u);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v46 = -23;
  do
  {
    v9 = objc_autoreleasePoolPush();
    v10 = (void *)v50[5];
    v50[5] = 0;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = objc_msgSend(v11, "fileExistsAtPath:", CFSTR("/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v13, "removeItemAtPath:error:", CFSTR("/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg"), 0);

    }
    sleep(v6);
    v14 = handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 67109120;
      v68 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Downloading the Disk Image:counter:%d", v67, 8u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    v17 = (void *)objc_opt_new(CRURLSessionDelegate);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v16, v17, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiURL](self, "pdiURL"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10000490C;
    v48[3] = &unk_1000082D8;
    v48[4] = &buf;
    v48[5] = &v55;
    v48[6] = v59;
    v48[7] = &v49;
    v48[8] = &v61;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "downloadTaskWithURL:completionHandler:", v19, v48));
    objc_msgSend(v20, "resume");

    v21 = v62[5];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "timeoutPeriod"));
    v24 = dispatch_time(0, 1000000000 * (int)objc_msgSend(v23, "intValue"));
    v25 = dispatch_semaphore_wait(v21, v24);

    if (v25 || !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) || v50[5] || !*((_BYTE *)v56 + 24))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiDigest](self, "pdiDigest"));
      v27 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to download Disk Image::location:%@:error:%@"), v26, v7));

      CRError = createCRError((void *)0xFFFFFFFFFFFFFFE9, v27, 0);
      v29 = objc_claimAutoreleasedReturnValue(CRError);
      v30 = (void *)v50[5];
      v50[5] = v29;

      v31 = 0;
    }
    else
    {
      v34 = handleForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v67 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Asset download success", v67, 2u);
      }

      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "SHA256DigestString"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiDigest](self, "pdiDigest"));
      v38 = objc_msgSend(v37, "caseInsensitiveCompare:", v36) == 0;

      if (v38)
      {
        v43 = handleForCategory(0);
        v27 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Asset digest match success", v67, 2u);
        }
        v46 = 0;
        v31 = 1;
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController pdiDigest](self, "pdiDigest"));
        v27 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Digest Mismatched, Download Failure:%@:%@"), v39, v36));

        v40 = createCRError((void *)0xFFFFFFFFFFFFFFE9, v27, 0);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        v42 = (void *)v50[5];
        v50[5] = v41;

        v31 = 0;
      }
      v7 = (void *)v36;
    }

    objc_autoreleasePoolPop(v9);
    if (v8++ > 1)
      v33 = 1;
    else
      v33 = v31;
    v6 += 3;
  }
  while (v33 != 1);
  if (a3)
    *a3 = objc_retainAutorelease((id)v50[5]);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v59, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&buf, 8);

  return v46;
}

- (int64_t)_performPluginsUpdateWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  unsigned int v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSString *v26;
  NSString *pdiMountPath;
  uint64_t v28;
  NSObject *v29;
  NSString *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  int64_t v36;
  void *v37;
  id v38;
  __CFString *v39;
  id v40;
  __CFString *v42;
  id CRError;
  void *v44;
  id v45;
  id v46;
  void *v47;
  char *v48;
  _QWORD v49[3];
  _QWORD v50[3];
  uint8_t buf[4];
  const char *v52;

  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[UpdatePluginsController _performPluginsUpdateWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v47 = 0;
  v48 = 0;
  v7 = MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"));
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v52) = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " inDiagnosticsmode:%d", buf, 8u);
  }

  v10 = +[CRPersonalizationManager getDefaultAMAuthInstallRef](CRPersonalizationManager, "getDefaultAMAuthInstallRef");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
  if ((objc_msgSend(v11, "useAppleConnect") & 1) != 0)
  {

  }
  else
  {
    v12 = +[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault");

    if ((v12 & 1) == 0)
      goto LABEL_9;
  }
  if (+[CRPersonalizationManager enableSSO:](CRPersonalizationManager, "enableSSO:", v10))
  {
    v42 = CFSTR("Failed to enable single sign on");
LABEL_45:
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFF1, v42, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(CRError);
    v25 = 0;
    goto LABEL_47;
  }
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tatsuURL"));

  if (v14)
  {
    v15 = handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting Custom signing URL", buf, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatePluginsController inputs](self, "inputs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tatsuURL"));
    v19 = AMAuthInstallSetSigningServerURL(v10, v18);

    if (v19)
    {
      v42 = CFSTR("Failed to set tatsu URL");
      goto LABEL_45;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRPersonalizationManager initWithAuthInstallObj:](CRPersonalizationManager, "initWithAuthInstallObj:", v10));
  v46 = 0;
  v21 = objc_msgSend(v20, "getPDIAPTicketUsingCache:apTicketData:error:", 0, &v48, &v46);
  v22 = v46;

  v23 = handleForCategory(0);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v48;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Ticket:%@", buf, 0xCu);
  }

  if (!v21 || !v48 || v22)
  {
    if (+[CRPersonalizationManager IsTatsuErrorNetworkingRelated:](CRPersonalizationManager, "IsTatsuErrorNetworkingRelated:", objc_msgSend(v22, "code")))v36 = -13;
    else
      v36 = -15;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Asset Personalization failed:%d:%@"), v21, v22));
    v38 = createCRError((void *)v36, v37, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v38);

    v25 = 0;
    if (!v10)
      goto LABEL_39;
    goto LABEL_38;
  }
  v49[0] = kMobileStorageDeviceTypeKey;
  v49[1] = kMSMDiskImageTypeKey;
  v50[0] = kMobileStorageDeviceTypeDiskImage;
  v50[1] = kMSMDiskImageTypePersonalized;
  v49[2] = kMSMSignatureKey;
  v50[2] = v48;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 3));
  v26 = (NSString *)MobileStorageMountWithError(CFSTR("/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg"), v25, &v47);
  pdiMountPath = self->pdiMountPath;
  self->pdiMountPath = v26;

  if (self->pdiMountPath)
  {
    v28 = handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->pdiMountPath;
      *(_DWORD *)buf = 138412290;
      v52 = (const char *)v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Successfully mounted the disk image at: %@", buf, 0xCu);
    }

    if (-[CRPluginsController isApplicationInstalledWithMaxRetries:bundleName:](self->pluginsHandle, "isApplicationInstalledWithMaxRetries:bundleName:", 5, CFSTR("com.apple.corerepair.PluginsUpdaterApp")))
    {
      v31 = handleForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Application found", buf, 2u);
      }

      if ((v7 & 1) == 0)
      {
LABEL_29:
        v35 = 0;
        v36 = 0;
        if (!v10)
          goto LABEL_39;
LABEL_38:
        CFRelease(v10);
        goto LABEL_39;
      }
      if (-[CRPluginsController rebuildApplicationDataBase](self->pluginsHandle, "rebuildApplicationDataBase"))
      {
        v33 = handleForCategory(0);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "re building DB successsful", buf, 2u);
        }

        goto LABEL_29;
      }
      v39 = CFSTR("Failed to rebuild DB");
    }
    else
    {
      v39 = CFSTR("Unable to find Application after 5 retries");
    }
    v36 = -20;
    v40 = createCRError((void *)0xFFFFFFFFFFFFFFECLL, v39, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v40);
    if (!v10)
      goto LABEL_39;
    goto LABEL_38;
  }
  v44 = v47;
  v45 = createCRError((void *)0xFFFFFFFFFFFFFFF1, CFSTR("Failed to mount disk image"), v47);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v45);

LABEL_47:
  v36 = -20;
  if (v10)
    goto LABEL_38;
LABEL_39:
  if (a3)
    *a3 = objc_retainAutorelease(v35);

  return v36;
}

- (id)diskPluginsMap
{
  uint64_t v3;
  NSObject *v4;
  NSMutableString *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSMutableString *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  char *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSMutableDictionary *v41;
  void *v42;
  NSMutableString *v43;
  id v44;
  uint8_t buf[4];
  const char *v46;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[UpdatePluginsController diskPluginsMap]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = objc_opt_new(NSMutableString);
  v6 = objc_opt_new(NSMutableDictionary);
  -[NSMutableString appendString:](v5, "appendString:", self->pdiMountPath);
  -[NSMutableString appendString:](v5, "appendString:", CFSTR("/Applications/PluginsUpdaterApp.app/PlugIns/"));
  v7 = handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = (const char *)v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "plugins Path is:%@", buf, 0xCu);
  }

  v9 = objc_alloc_init((Class)NSFileManager);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumeratorAtPath:", v5));

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
  if (v11)
  {
    v12 = (char *)v11;
    v13 = 0;
    v42 = v10;
    v43 = v5;
    v41 = v6;
    while (1)
    {
      v14 = handleForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "fileName:%@", buf, 0xCu);
      }

      if (objc_msgSend(v12, "hasSuffix:", CFSTR("Info.plist")))
        break;
      v21 = v13;
LABEL_26:
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));

      v12 = (char *)v37;
      if (!v37)
        goto LABEL_30;
    }
    v16 = objc_opt_new(NSMutableString);
    -[NSMutableString appendString:](v16, "appendString:", v5);
    -[NSMutableString appendString:](v16, "appendString:", v12);
    v17 = handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = (const char *)v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FullPath:%@", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16));
    v44 = v13;
    v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v19, &v44));
    v21 = v44;

    if (!v21 && v20 && objc_msgSend(v20, "count"))
    {
      v22 = handleForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Plist:%@", buf, 0xCu);
      }

      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NSExtension")));
      if (!v24)
        goto LABEL_25;
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NSExtension")));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes")));
      if (v27)
      {
        v28 = (void *)v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NSExtension")));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes")));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("DKDiagnosticIdentifier")));

        v6 = v41;
        if (!v31)
        {
LABEL_25:

          v13 = v21;
          v10 = v42;
          v5 = v43;
          goto LABEL_26;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NSExtension")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes")));
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("DKDiagnosticIdentifier")));

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString")));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject stringValue](v25, "stringValue"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v34, v35);

      }
      else
      {

      }
    }
    else
    {
      v36 = handleForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v46 = (const char *)v21;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to read:%@", buf, 0xCu);
      }
    }

    goto LABEL_25;
  }
  v21 = 0;
LABEL_30:
  v38 = handleForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = (const char *)v6;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Map is:%@", buf, 0xCu);
  }

  return v6;
}

- (UpdatePluginsInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->inputs, a3);
}

- (NSURL)pdiURL
{
  return self->_pdiURL;
}

- (void)setPdiURL:(id)a3
{
  objc_storeStrong((id *)&self->_pdiURL, a3);
}

- (NSString)pdiDigest
{
  return self->_pdiDigest;
}

- (void)setPdiDigest:(id)a3
{
  objc_storeStrong((id *)&self->_pdiDigest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdiDigest, 0);
  objc_storeStrong((id *)&self->_pdiURL, 0);
  objc_storeStrong((id *)&self->inputs, 0);
  objc_storeStrong((id *)&self->diagsReponder, 0);
  objc_storeStrong((id *)&self->pluginsHandle, 0);
  objc_storeStrong((id *)&self->pdiMountPath, 0);
}

@end
