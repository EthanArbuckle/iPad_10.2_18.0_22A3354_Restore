@implementation IDMSAuthenticator

- (int64_t)authenticateFromObjectModel:(id)a3 outRequest:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;

  v6 = a3;
  v8 = v6;
  if (!v6)
  {
    v31 = handleForCategory(0, v7);
    v30 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10000C970();
    v15 = 0;
    v9 = 0;
    v20 = 0;
    v28 = 0;
    v27 = 0;
    v23 = 0;
    v22 = -107;
    goto LABEL_26;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subElementWithID:", CFSTR("login")));
  v10 = objc_opt_class(RUITableViewRow);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v32 = handleForCategory(0, v11);
    v30 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10000CAE0();
    v15 = 0;
    v20 = 0;
    v28 = 0;
    goto LABEL_20;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableCell"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editableTextField"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subElementWithID:", CFSTR("password")));
  v16 = objc_opt_class(RUITableViewRow);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {
    v28 = v14;
    v33 = handleForCategory(0, v17);
    v30 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10000CAB4();
    v20 = 0;
LABEL_20:
    v27 = 0;
    v23 = 0;
    v22 = -104;
    goto LABEL_26;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tableCell"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "editableTextField"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "text"));

  if (!v14 || !objc_msgSend(v14, "length"))
  {
    v28 = v14;
    v34 = handleForCategory(0, v21);
    v30 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10000C99C();
    goto LABEL_25;
  }
  if (!v20 || !objc_msgSend(v20, "length"))
  {
    v28 = v14;
    v35 = handleForCategory(0, v21);
    v30 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10000C9C8();
LABEL_25:
    v27 = 0;
    v23 = 0;
    v22 = -201;
    goto LABEL_26;
  }
  v42 = 0;
  v43 = 0;
  v22 = -[IDMSAuthenticator _fetchGSTokenWithPassword:username:altDSID:gsToken:](self, "_fetchGSTokenWithPassword:username:altDSID:gsToken:", v20, v14, &v43, &v42);
  v23 = v43;
  v24 = v42;
  v26 = v14;
  v27 = v24;
  if (v22)
  {
    v28 = v26;
    v29 = handleForCategory(0, v25);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10000CA54();
  }
  else
  {
    v28 = v26;
    v22 = -[IDMSAuthenticator _constructAlbertRequest:objectModel:username:altDSID:gsToken:](self, "_constructAlbertRequest:objectModel:username:altDSID:gsToken:", a4, v8);
    if (!v22)
      goto LABEL_28;
    v41 = handleForCategory(0, v40);
    v30 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_10000C9F4();
  }
LABEL_26:

  v36 = objc_opt_class(RUITableViewRow);
  if ((objc_opt_isKindOfClass(v15, v36) & 1) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tableCell"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "editableTextField"));
    objc_msgSend(v38, "setText:", &stru_100014BA8);

  }
LABEL_28:

  return v22;
}

- (int64_t)_constructAlbertRequest:(id *)a3 objectModel:(id)a4 username:(id)a5 altDSID:(id)a6 gsToken:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  id *v42;
  IDMSAuthenticator *v43;
  id v44;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0;
  if (v13)
  {
    v18 = -202;
    if (v14)
    {
      v43 = self;
      v19 = 0;
      v20 = 0;
      if (v15)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subElementWithID:", CFSTR("next")));
        v20 = v21;
        if (v21
          && (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attributes")),
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("url"))),
              v24,
              v23,
              v24))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "attributes"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("url")));

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceURL"));
          if (v26)
          {
            v42 = a3;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceURL"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "URLByAppendingPathComponent:", v19));
            v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v29));

            objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
            objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
            objc_msgSend(v16, "setObject:forKey:", v13, CFSTR("login"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverInfo"));

            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverInfo"));
              objc_msgSend(v16, "setObject:forKey:", v31, CFSTR("serverInfo"));

            }
            v44 = 0;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v16, 100, 0, &v44));
            v33 = v44;
            objc_msgSend(v17, "setHTTPBody:", v32);

            if (v33)
            {
              v35 = handleForCategory(0, v34);
              v36 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                sub_10000CB64();

              v18 = -108;
            }
            else
            {
              -[IDMSAuthenticator _appendAdditionalHeaders:altDSID:gsToken:](v43, "_appendAdditionalHeaders:altDSID:gsToken:", v17, v14, v15);
              if (v42)
              {
                v17 = objc_retainAutorelease(v17);
                v18 = 0;
                *v42 = v17;
              }
              else
              {
                v18 = 0;
              }
            }
          }
          else
          {
            v39 = handleForCategory(0, v27);
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              sub_10000CB38();

            v17 = 0;
            v18 = -106;
          }
        }
        else
        {
          v37 = handleForCategory(0, v22);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            sub_10000CB0C();

          v17 = 0;
          v19 = 0;
          v18 = -105;
        }
      }
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v18 = -201;
  }

  return v18;
}

- (int64_t)_fetchGSTokenWithPassword:(id)a3 username:(id)a4 altDSID:(id *)a5 gsToken:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  dispatch_semaphore_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int64_t v27;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint8_t buf[16];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v9 = a3;
  v10 = a4;
  v12 = (void *)objc_opt_new(AKAppleIDAuthenticationContext, v11);
  v14 = (void *)objc_opt_new(AKAppleIDAuthenticationController, v13);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_100009818;
  v49 = sub_100009828;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_100009818;
  v43 = sub_100009828;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = -1;
  v15 = dispatch_semaphore_create(0);
  objc_msgSend(v12, "setUsername:", v10);
  objc_msgSend(v12, "_setPassword:", v9);
  objc_msgSend(v12, "setShouldUpdatePersistentServiceTokens:", 0);
  objc_msgSend(v12, "setShouldPromptForPasswordOnly:", 1);
  objc_msgSend(v12, "setIsUsernameEditable:", 0);
  objc_msgSend(v12, "setIsEphemeral:", 1);
  objc_msgSend(v12, "setAuthenticationType:", 0);
  objc_msgSend(v12, "setServiceType:", 1);
  objc_msgSend(v12, "setServiceIdentifier:", CFSTR("com.apple.gs.corerepair.auth"));
  v17 = handleForCategory(0, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Authenticating user credentials...", buf, 2u);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100009830;
  v29[3] = &unk_1000147D8;
  v31 = &v35;
  v32 = &v45;
  v33 = &v39;
  v19 = v15;
  v30 = v19;
  objc_msgSend(v14, "authenticateWithContext:completion:", v12, v29);
  v21 = handleForCategory(0, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Waiting for IDMS", buf, 2u);
  }

  v23 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v19, v23))
  {
    v25 = handleForCategory(0, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10000CBC4();

    v36[3] = -200;
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v46[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v40[5]);
  v27 = v36[3];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v27;
}

- (void)_appendAdditionalHeaders:(id)a3 altDSID:(id)a4 gsToken:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "ak_addDeviceUDIDHeader");
  objc_msgSend(v9, "ak_addClientInfoHeader");
  objc_msgSend(v9, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v7, v8);

}

- (id)authKitSession
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  objc_msgSend(v2, "setURLCache:", 0);
  objc_msgSend(v2, "setRequestCachePolicy:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  v5 = objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", v4);
  objc_msgSend(v2, "set_appleIDContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v2));

  return v6;
}

@end
