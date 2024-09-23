@implementation EndpointReachability

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
    v14 = "-[EndpointReachability setupWithInputs:responder:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v13, 0x20u);
  }

  -[EndpointReachability setInputs:](self, "setInputs:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability inputs](self, "inputs"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability result](self, "result"));
    objc_msgSend(v12, "setStatusCode:", &off_100008698);

    -[EndpointReachability setFinished:](self, "setFinished:", 1);
  }

}

- (void)start
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  signed int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_queue_global_t global_queue;
  void *v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  __int128 v39;
  NSMutableDictionary *v40;
  NSObject *queue;
  NSObject *group;
  NSObject *dsema;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD block[4];
  NSObject *v50;
  EndpointReachability *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t *v54;
  __int128 *p_buf;
  uint64_t *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  NSMutableDictionary *v71;
  _QWORD v72[3];
  _QWORD v73[3];
  uint8_t v74[128];
  uint8_t v75[4];
  uint64_t v76;
  uint8_t v77[128];
  __int128 buf;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  NSMutableArray *v82;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[EndpointReachability start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v79 = 0x3032000000;
  v80 = sub_100003C78;
  v81 = sub_100003C88;
  v82 = objc_opt_new(NSMutableArray);
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = sub_100003C78;
  v70 = sub_100003C88;
  v71 = objc_opt_new(NSMutableDictionary);
  v40 = objc_opt_new(NSMutableDictionary);
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeout"));
  v6 = objc_msgSend(v5, "intValue");

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = handleForCategory(0, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Timeout is 0, setting to default timeout.", v75, 2u);
    }

    v8 = 60;
  }
  -[EndpointReachability initEndpointsInfo](self, "initEndpointsInfo");
  dsema = dispatch_semaphore_create(32);
  group = dispatch_group_create();
  global_queue = dispatch_get_global_queue(21, 0);
  queue = objc_claimAutoreleasedReturnValue(global_queue);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability endpointsInfo](self, "endpointsInfo"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
  if (v13)
  {
    v15 = *(_QWORD *)v59;
    *(_QWORD *)&v14 = 138412290;
    v39 = v14;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
        v19 = handleForCategory(0, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v75 = v39;
          v76 = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Testing endpoint: %@", v75, 0xCu);
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100003C90;
        block[3] = &unk_1000082B8;
        v21 = group;
        v50 = v21;
        v51 = self;
        v56 = &v62;
        v57 = v8;
        v52 = v17;
        v54 = &v66;
        p_buf = &buf;
        v53 = dsema;
        dispatch_group_async(v21, queue, block);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
    }
    while (v13);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v63 + 24))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability result](self, "result"));
    objc_msgSend(v22, "setStatusCode:", &off_1000086B0);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability result](self, "result"));
    objc_msgSend(v22, "setStatusCode:", &off_1000086C8);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability endpointsInfo](self, "endpointsInfo"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v74, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v25)
          objc_enumerationMutation(v23);
        v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability endpointsInfo](self, "endpointsInfo", v39));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "valueForKey:", v27));

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "valueForKey:", CFSTR("metrics")));
        -[NSMutableDictionary setObject:forKey:](v40, "setObject:forKey:", v30, v27);

      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v74, 16);
    }
    while (v24);
  }

  v72[0] = CFSTR("endpointReachability");
  v31 = objc_msgSend((id)v67[5], "count");
  if (v31)
    v32 = (void *)v67[5];
  else
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v73[0] = v32;
  v72[1] = CFSTR("unreachableEndpoints");
  v33 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count", v39);
  if (v33)
    v34 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  else
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v73[1] = v34;
  v72[2] = CFSTR("metrics");
  v35 = -[NSMutableDictionary count](v40, "count");
  v36 = v40;
  if (!v35)
    v36 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v73[2] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 3));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability result](self, "result"));
  objc_msgSend(v38, "setData:", v37);

  if (!v35)
  if (!v33)

  if (!v31)
  -[EndpointReachability setFinished:](self, "setFinished:", 1);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&buf, 8);
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
    v5 = "-[EndpointReachability cancel]";
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
    v5 = "-[EndpointReachability teardown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)initEndpointsInfo
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (__cdecl **v9)(CFTypeRef);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (__cdecl **v30)(CFTypeRef);
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  id obj;
  uint64_t v45;
  EndpointReachability *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[6];
  _QWORD v56[6];
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];

  v3 = objc_opt_new(NSMutableDictionary);
  -[EndpointReachability setEndpointsInfo:](self, "setEndpointsInfo:", v3);

  v46 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endpointURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v7;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v52;
    v9 = &CFRelease_ptr;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v52 != v45)
          objc_enumerationMutation(obj);
        v50 = v10;
        v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v10);
        v12 = handleForCategory(0, v8);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "endpoint: %@", buf, 0xCu);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "host"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "port"));
        if (!v17)
        {
          v18 = handleForCategory(0, v16);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v14;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: Port number not specified, using default.", buf, 0xCu);
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scheme"));
          v21 = objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("http"));

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scheme"));
            v23 = objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("https"));

            if (v23)
            {
              v17 = 0;
              goto LABEL_17;
            }
            v24 = 443;
          }
          else
          {
            v24 = 80;
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v24));
        }
LABEL_17:
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v15, v17));
        v55[0] = CFSTR("remoteAddress");
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[8], "null"));
        v56[0] = v25;
        v55[1] = CFSTR("remotePort");
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[8], "null"));
        v56[1] = v26;
        v55[2] = CFSTR("dnsResolutionTime");
        v27 = (void *)v15;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[8], "null"));
        v56[2] = v28;
        v55[3] = CFSTR("connectionEstablishmentTime");
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[8], "null"));
        v56[3] = v29;
        v55[4] = CFSTR("httpRequestTime");
        v30 = v9;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[8], "null"));
        v56[4] = v31;
        v55[5] = CFSTR("httpResponseTime");
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[8], "null"));
        v56[5] = v32;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 6));

        v33 = objc_opt_new(NSMutableDictionary);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scheme"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@"), v34, v48));
        -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v35, CFSTR("url"));

        if (v27)
        {
          -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v27, CFSTR("hostname"));
        }
        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[8], "null"));
          -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v36, CFSTR("hostname"));

        }
        v9 = v30;
        if (v17)
        {
          -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v17, CFSTR("port"));
          if (v49)
            goto LABEL_22;
        }
        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[8], "null"));
          -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v37, CFSTR("port"));

          if (v49)
          {
LABEL_22:
            -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v49, CFSTR("metrics"));
            goto LABEL_25;
          }
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30[8], "null"));
        -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v38, CFSTR("metrics"));

LABEL_25:
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability endpointsInfo](v46, "endpointsInfo"));
        objc_msgSend(v39, "setObject:forKey:", v33, v48);

        v10 = v50 + 1;
      }
      while (v47 != (id)(v50 + 1));
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v47);
  }

  v41 = handleForCategory(0, v40);
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability endpointsInfo](v46, "endpointsInfo"));
    *(_DWORD *)buf = 138412290;
    v58 = v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "endpointsInfo: %@", buf, 0xCu);

  }
}

- (void)_testURL:(id)a3 timeout:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, int64_t);
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  __int16 v43;
  id v44;

  v8 = a3;
  v9 = (void (**)(id, int64_t))a5;
  v11 = handleForCategory(0, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 136315394;
    v42 = "-[EndpointReachability _testURL:timeout:completion:]";
    v43 = 2112;
    v44 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v41, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability endpointsInfo](self, "endpointsInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v8));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("url")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v15));

  v17 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hostname")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("port")));
  v20 = handleForCategory(0, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 138412546;
    v42 = v17;
    v43 = 2112;
    v44 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Hostname: %@  Portnumber: %@", (uint8_t *)&v41, 0x16u);
  }

  v22 = -[EndpointReachability _localNetworkCheckWithHostName:](self, "_localNetworkCheckWithHostName:", v17);
  if (v22)
  {
    v24 = v22;
    v25 = handleForCategory(0, v23);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100005C30((uint64_t)v8, v26, v27, v28, v29, v30, v31, v32);
  }
  else
  {
    v24 = -[EndpointReachability _httpCheckWithURL:timeout:](self, "_httpCheckWithURL:timeout:", v16, a4);
    if (!v24)
      goto LABEL_12;
    v34 = handleForCategory(0, v33);
    v26 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100005BCC((uint64_t)v8, v26, v35, v36, v37, v38, v39, v40);
  }

LABEL_12:
  if (v9)
    v9[2](v9, v24);

}

- (BOOL)_flagIsReachable:(unsigned int)a3
{
  BOOL v3;
  BOOL v4;

  v3 = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0)
    v3 = 0;
  v4 = (a3 & 4) == 0 || v3;
  return (a3 & 2) != 0 && v4;
}

- (int64_t)_localNetworkCheckWithHostName:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  const char *v9;
  const __SCNetworkReachability *v10;
  const __SCNetworkReachability *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  int64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  SCNetworkReachabilityFlags flags;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;

  v4 = (char *)a3;
  v6 = handleForCategory(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[EndpointReachability _localNetworkCheckWithHostName:]";
    v31 = 2112;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  v8 = objc_retainAutorelease(v4);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  if (v9 && (v10 = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, v9)) != 0)
  {
    v11 = v10;
    flags = 0;
    if (SCNetworkReachabilityGetFlags(v10, &flags))
    {
      v13 = -[EndpointReachability _flagIsReachable:](self, "_flagIsReachable:", flags);
      v15 = handleForCategory(0, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = "No";
        if (v13)
          v17 = "Yes";
        *(_DWORD *)buf = 138412546;
        v30 = v8;
        v31 = 2080;
        v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ reachable: %s", buf, 0x16u);
      }

      v18 = v13 - 1;
    }
    else
    {
      v19 = handleForCategory(0, v12);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100005C94((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);

      v18 = -2;
    }
    CFRelease(v11);
  }
  else
  {
    v18 = -13;
  }

  return v18;
}

- (BOOL)_httpSendRequestWithURL:(id)a3 timeout:(int64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[4];
  NSObject *v32;
  __int128 *p_buf;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t v53[4];
  id v54;
  __int16 v55;
  uint64_t v56;
  __int128 buf;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v8 = a3;
  v10 = handleForCategory(0, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Sending HTTP Request...", (uint8_t *)&buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v12, self, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v8, 1, (double)a4));
  objc_msgSend(v14, "setHTTPMethod:", CFSTR("GET"));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v58 = 0x3032000000;
  v59 = sub_100003C78;
  v60 = sub_100003C88;
  v61 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_100003C78;
  v51 = sub_100003C88;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_100003C78;
  v45 = sub_100003C88;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100004EB0;
  v31[3] = &unk_1000082E0;
  p_buf = &buf;
  v34 = &v47;
  v35 = &v41;
  v36 = &v37;
  v15 = dispatch_semaphore_create(0);
  v32 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v14, v31));
  objc_msgSend(v16, "resume");
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  v18 = handleForCategory(0, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v48[5];
    *(_DWORD *)v53 = 138412546;
    v54 = v8;
    v55 = 2112;
    v56 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: HTTP Response Header: %@", v53, 0x16u);
  }

  v22 = handleForCategory(0, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *((_DWORD *)v38 + 6);
    *(_DWORD *)v53 = 138412546;
    v54 = v8;
    v55 = 1024;
    LODWORD(v56) = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: HTTP Status: %d", v53, 0x12u);
  }

  v26 = handleForCategory(0, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v42[5];
    *(_DWORD *)v53 = 138412546;
    v54 = v8;
    v55 = 2112;
    v56 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@: HTTP Error: %@", v53, 0x16u);
  }

  v29 = (void *)v42[5];
  if (a5 && v29)
    *a5 = objc_retainAutorelease(v29);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&buf, 8);

  return v29 == 0;
}

- (int64_t)_httpCheckWithURL:(id)a3 timeout:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  int64_t v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v8 = handleForCategory(0, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[EndpointReachability _httpCheckWithURL:timeout:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  v15 = 0;
  v10 = -[EndpointReachability _httpSendRequestWithURL:timeout:error:](self, "_httpSendRequestWithURL:timeout:error:", v6, a4, &v15);
  v11 = v15;
  v12 = v11;
  v13 = 0;
  if ((v10 & 1) == 0)
  {
    if (objc_msgSend(v11, "code") == (id)-1001)
    {
      v13 = -11;
    }
    else if (objc_msgSend(v12, "code") == (id)-1004)
    {
      v13 = -9;
    }
    else if (objc_msgSend(v12, "code") == (id)-1009)
    {
      v13 = -8;
    }
    else if (objc_msgSend(v12, "code") == (id)-1003)
    {
      v13 = -10;
    }
    else
    {
      v13 = -12;
    }
  }

  return v13;
}

- (id)_calculateTimeIntervalFrom:(id)a3 To:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = 0;
  if (a3 && a4)
  {
    objc_msgSend(a4, "timeIntervalSinceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lf"), v5));
  }
  return v4;
}

- (id)_dnsResolutionTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainLookupStartDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainLookupEndDate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _calculateTimeIntervalFrom:To:](self, "_calculateTimeIntervalFrom:To:", v5, v6));
  return v7;
}

- (id)_connectionEstablishmentTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectStartDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectEndDate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _calculateTimeIntervalFrom:To:](self, "_calculateTimeIntervalFrom:To:", v5, v6));
  return v7;
}

- (id)_httpRequestTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestStartDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestEndDate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _calculateTimeIntervalFrom:To:](self, "_calculateTimeIntervalFrom:To:", v5, v6));
  return v7;
}

- (id)_httpResponseTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseStartDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseEndDate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _calculateTimeIntervalFrom:To:](self, "_calculateTimeIntervalFrom:To:", v5, v6));
  return v7;
}

- (id)_requestURL:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  return v4;
}

- (id)_remoteAddress:(id)a3
{
  return objc_msgSend(a3, "remoteAddress");
}

- (id)_remotePort:(id)a3
{
  return objc_msgSend(a3, "remotePort");
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  __int16 v20[8];
  uint8_t v21[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  v9 = handleForCategory(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "URLSession didReceiveChallenge...", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "protectionSpace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authenticationMethod"));
  v13 = objc_msgSend(v12, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

  v15 = handleForCategory(0, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v17)
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Continue without authentication. Accepting server.", v21, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "protectionSpace"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v18, "serverTrust")));

    v7[2](v7, 0, v19);
  }
  else
  {
    if (v17)
    {
      v20[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Perform default challenge handling.", (uint8_t *)v20, 2u);
    }

    v7[2](v7, 1, 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  void (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = (void (**)(id, _QWORD))a7;
  v9 = handleForCategory(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "URLSession willPerformHTTPRedirection...", v11, 2u);
  }

  v7[2](v7, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  EndpointReachability *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSMutableDictionary *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  NSMutableDictionary *v48;

  v37 = a3;
  v38 = a4;
  v44 = (NSMutableDictionary *)a5;
  v9 = handleForCategory(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "originalRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
    *(_DWORD *)buf = 138412546;
    v46 = v12;
    v47 = 2112;
    v48 = v44;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully collected URL(%@) metrics %@", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary transactionMetrics](v44, "transactionMetrics"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _dnsResolutionTime:](self, "_dnsResolutionTime:", v14));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _connectionEstablishmentTime:](self, "_connectionEstablishmentTime:", v14));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _httpRequestTime:](self, "_httpRequestTime:", v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _httpResponseTime:](self, "_httpResponseTime:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _remoteAddress:](self, "_remoteAddress:", v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _remotePort:](self, "_remotePort:", v14));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability _requestURL:](self, "_requestURL:", v14));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "host"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "port"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v43, v42));
  v21 = handleForCategory(0, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "testpoint: %@", buf, 0xCu);
  }

  v23 = objc_opt_new(NSMutableDictionary);
  v24 = v23;
  if (v16)
  {
    -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v16, CFSTR("remoteAddress"));
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v25, CFSTR("remoteAddress"));

  }
  if (v17)
  {
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v17, CFSTR("remotePort"));
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v26, CFSTR("remotePort"));

  }
  if (v41)
  {
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v41, CFSTR("dnsResolutionTime"));
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v27, CFSTR("dnsResolutionTime"));

  }
  if (v40)
  {
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v40, CFSTR("connectionEstablishmentTime"));
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v28, CFSTR("connectionEstablishmentTime"));

  }
  if (v39)
  {
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v39, CFSTR("httpRequestTime"));
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v29, CFSTR("httpRequestTime"));

  }
  if (v15)
  {
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v15, CFSTR("httpResponseTime"));
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v31, CFSTR("httpResponseTime"));

  }
  v32 = handleForCategory(0, v30);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v46 = v19;
    v47 = 2112;
    v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@ metrics: %@", buf, 0x16u);
  }

  v34 = self;
  objc_sync_enter(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointReachability endpointsInfo](v34, "endpointsInfo"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v19));
  objc_msgSend(v36, "setObject:forKey:", v24, CFSTR("metrics"));

  objc_sync_exit(v34);
}

- (EndpointReachabilityInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (NSMutableDictionary)endpointsInfo
{
  return self->_endpointsInfo;
}

- (void)setEndpointsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointsInfo, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
