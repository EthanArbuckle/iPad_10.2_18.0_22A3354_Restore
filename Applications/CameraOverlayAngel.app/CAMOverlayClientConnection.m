@implementation CAMOverlayClientConnection

- (CAMOverlayClientConnection)initWithBoardServiceConnection:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  CAMOverlayClientConnection *v9;
  CAMOverlayClientConnection *v10;
  uint64_t v11;
  NSHashTable *registeredObservers;
  uint64_t v13;
  BSAuditToken *auditToken;
  id *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  unsigned int v33;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CAMOverlayClientConnection;
  v9 = -[CAMOverlayClientConnection init](&v27, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__connectionQueue, a4);
    v11 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    registeredObservers = v10->__registeredObservers;
    v10->__registeredObservers = (NSHashTable *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteToken"));
    auditToken = v10->_auditToken;
    v10->_auditToken = (BSAuditToken *)v13;

    v10->__debugID = ++qword_10001F150;
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_100005DA4;
    v24 = &unk_100018988;
    v25 = v8;
    v15 = v10;
    v26 = v15;
    objc_msgSend(v7, "configureConnection:", &v21);
    v16 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_loggingHeader", v21, v22, v23, v24, v25));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
      v19 = -[BSAuditToken pid](v10->_auditToken, "pid");
      *(_DWORD *)buf = 138543874;
      v29 = v17;
      v30 = 2114;
      v31 = v18;
      v32 = 1024;
      v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Activating connection from %{public}@:%d", buf, 0x1Cu);

    }
    objc_msgSend(v7, "activate");
    objc_storeStrong(v15 + 8, a3);

  }
  return v10;
}

- (void)dealloc
{
  BSServiceConnectionHost *connection;
  objc_super v4;

  -[BSServiceConnectionHost invalidate](self->__connection, "invalidate");
  connection = self->__connection;
  self->__connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMOverlayClientConnection;
  -[CAMOverlayClientConnection dealloc](&v4, "dealloc");
}

- (NSString)description
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_opt_class(self);
  v4 = -[CAMOverlayClientConnection _debugID](self, "_debugID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection auditToken](self, "auditToken"));
  v6 = objc_msgSend(v5, "pid");
  v7 = -[CAMOverlayClientConnection status](self, "status");
  if (v7 > 2)
    v8 = 0;
  else
    v8 = off_100018AE8[v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection updatesByID](self, "updatesByID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(",")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ ID: [%lu]; pid: %d; status: %@; value IDs: %@>"),
                    v3,
                    v4,
                    v6,
                    v8,
                    v11));

  return (NSString *)v12;
}

- (id)_loggingHeader
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ClientConnection (ID:%lu)"), -[CAMOverlayClientConnection _debugID](self, "_debugID"));
}

- (void)_updateStatusWithReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  __CFString *v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _connection](self, "_connection"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _clientProxy](self, "_clientProxy"));

    v7 = v6 != 0;
  }
  else
  {
    v7 = 2;
  }
  if (v7 != -[CAMOverlayClientConnection status](self, "status"))
  {
    v8 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _loggingHeader](self, "_loggingHeader"));
      v10 = (void *)v9;
      v11 = off_100018AE8[v7];
      if (a3 > 2)
        v12 = 0;
      else
        v12 = off_100018B00[a3];
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Status became %{public}@ for reason %{public}@", buf, 0x20u);

    }
    -[CAMOverlayClientConnection _setStatus:](self, "_setStatus:", v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006378;
    v13[3] = &unk_1000189B0;
    v13[4] = self;
    v13[5] = v7;
    -[CAMOverlayClientConnection _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v13);
  }
}

- (void)invalidate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _connection](self, "_connection"));
  objc_msgSend(v3, "invalidate");

  -[CAMOverlayClientConnection set_connection:](self, "set_connection:", 0);
  -[CAMOverlayClientConnection _setClientProxy:](self, "_setClientProxy:", 0);
  -[CAMOverlayClientConnection _updateStatusWithReason:](self, "_updateStatusWithReason:", 1);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _registeredObservers](self, "_registeredObservers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _registeredObservers](self, "_registeredObservers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_enumerateObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _registeredObservers](self, "_registeredObservers"));
  v6 = objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_handleConnectionDidActivate:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006604;
  v4[3] = &unk_1000189D8;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_handleConnectionDidInterrupt:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000066A0;
  block[3] = &unk_100018A00;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleConnectionDidInvalidate:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006728;
  block[3] = &unk_100018A00;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)applyControlUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controlIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection controlsByID](self, "controlsByID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  v8 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _loggingHeader](self, "_loggingHeader"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugDescription"));
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending value %{public}@ for ID %{public}@", (uint8_t *)&v13, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _updatesByID](self, "_updatesByID"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, v5);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _clientProxy](self, "_clientProxy"));
  objc_msgSend(v12, "serverDidUpdateControl:", v4);

}

- (void)sendOverlayVisibility:(BOOL)a3 activeControlIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v6 = a4;
  if (self->_overlayVisible != v4)
  {
    self->_overlayVisible = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection controlsByID](self, "controlsByID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

    if (!v8)
    {
      v9 = os_log_create("com.apple.camera.overlay", "Angel");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000105D0(self);

      v6 = 0;
    }
    v10 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _loggingHeader](self, "_loggingHeader"));
      v12 = CFSTR("NO");
      v15 = 138543874;
      v16 = v11;
      v17 = 2114;
      if (v4)
        v12 = CFSTR("YES");
      v18 = v12;
      v19 = 2114;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending visibility: %{public}@ for control ID %{public}@", (uint8_t *)&v15, 0x20u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _clientProxy](self, "_clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    objc_msgSend(v13, "serverDidChangeOverlayVisible:activeControlIdentifier:", v14, v6);

  }
}

- (void)sendActiveControlIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _loggingHeader](self, "_loggingHeader"));
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending active control ID %@", (uint8_t *)&v8, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _clientProxy](self, "_clientProxy"));
  objc_msgSend(v7, "serverDidChangeActiveControlIdentifier:", v4);

}

- (void)setQuietUIActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;

  if (self->_quietUIActive != a3)
  {
    v3 = a3;
    self->_quietUIActive = a3;
    v5 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _loggingHeader](self, "_loggingHeader"));
      v7 = (void *)v6;
      v8 = CFSTR("NO");
      if (v3)
        v8 = CFSTR("YES");
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending interfaceReduced: %{public}@", (uint8_t *)&v11, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _clientProxy](self, "_clientProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v9, "didChangeInterfaceReduced:", v10);

  }
}

- (void)clientDidConfigureControls:(id)a3 initialUpdates:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  char **v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  CAMOverlayClientConnection *v51;
  id v52;
  void (**v53)(id, void *);
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  uint64_t v60;
  void *v61;
  _QWORD block[5];
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE buf[12];
  __int16 v77;
  id v78;
  NSErrorUserInfoKey v79;

  v8 = a3;
  v9 = a4;
  v53 = (void (**)(id, void *))a5;
  v10 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _loggingHeader](self, "_loggingHeader"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    v77 = 2114;
    v78 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Received controls: %{public}@", buf, 0x16u);

  }
  v51 = self;

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v9, "count")));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v71;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v71 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v16);
        if (objc_msgSend(v17, "isValueUpdate", v51))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "controlIdentifier"));
          objc_msgSend(v61, "setObject:forKeyedSubscript:", v17, v18);
LABEL_10:

          goto LABEL_13;
        }
        if (objc_msgSend(v17, "valueType") == (id)5 && (objc_msgSend(v17, "isEnabled") & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "controlIdentifier"));
          objc_msgSend(v58, "addObject:", v18);
          goto LABEL_10;
        }
LABEL_13:
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      v14 = v19;
    }
    while (v19);
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v8, "count")));
  v52 = v12;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v12, "count")));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v8;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v67;
    v60 = CAMOverlayErrorDomain;
    v24 = &selRef_setInvalidationHandler_;
    while (1)
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v67 != v23)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24 + 213, "interpretControl:", v26, v51));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", v28));
        if (!v29)
        {
          v79 = NSDebugDescriptionErrorKey;
          *(_QWORD *)buf = CFSTR("MissingValue");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v79, 1));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v60, -10, v33));

          v24 = &selRef_setInvalidationHandler_;
          if (v34)
          {
            v35 = os_log_create("com.apple.camera.overlay", "Angel");
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v79 = NSDebugDescriptionErrorKey;
              *(_QWORD *)buf = CFSTR("MissingValue");
              v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v79, 1));
              v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v60, -10, v40));

              v24 = &selRef_setInvalidationHandler_;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v26;
              v77 = 2114;
              v78 = v54;
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Rejecting control %{public}@: %{public}@", buf, 0x16u);

            }
            if (!v22)
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v79 = NSDebugDescriptionErrorKey;
            *(_QWORD *)buf = CFSTR("MissingValue");
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v79, 1));
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v60, -10, v36));

LABEL_35:
            objc_msgSend(v22, "addObject:", v32);

            goto LABEL_36;
          }
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "validateUpdate:", v29));

        if (v30)
        {
          v31 = os_log_create("com.apple.camera.overlay", "Angel");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "validateUpdate:", v29));
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v26;
            v77 = 2114;
            v78 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Rejecting control %{public}@: %{public}@", buf, 0x16u);

            v24 = &selRef_setInvalidationHandler_;
          }

          if (!v22)
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "validateUpdate:", v29));
          goto LABEL_35;
        }
        objc_msgSend(v57, "addObject:", v27);
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v27, v28);
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v29, v28);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
        v38 = objc_msgSend(v58, "containsObject:", v37);

        if (v38)
          objc_msgSend(v27, "setEnabled:", 0);
LABEL_36:

        v25 = (char *)v25 + 1;
      }
      while (v21 != v25);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      v21 = v41;
      if (!v41)
        goto LABEL_43;
    }
  }
  v22 = 0;
LABEL_43:

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007530;
  block[3] = &unk_100018A50;
  block[4] = v51;
  v42 = v57;
  v63 = v42;
  v43 = v56;
  v64 = v43;
  v44 = v55;
  v65 = v44;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v45 = v22;
  if (objc_msgSend(v45, "count") == (id)1)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));

    v47 = v52;
  }
  else
  {
    v48 = objc_msgSend(v45, "count");

    v47 = v52;
    if ((unint64_t)v48 < 2)
    {
      v46 = 0;
    }
    else
    {
      v49 = CAMOverlayErrorDomain;
      v79 = NSDebugDescriptionErrorKey;
      *(_QWORD *)buf = CFSTR("MultipleErrors");
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v79, 1));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v49, -1000, v50));

    }
  }
  v53[2](v53, v46);

}

- (void)clientDidUpdateControl:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controlIdentifier"));
  v9 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection _loggingHeader](self, "_loggingHeader"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugDescription"));
    *(_DWORD *)buf = 138543874;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Received value %{public}@ for ID %{public}@", buf, 0x20u);

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007760;
  v15[3] = &unk_100018AC8;
  v15[4] = self;
  v16 = v8;
  v17 = v6;
  v18 = v7;
  v12 = v7;
  v13 = v6;
  v14 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)_setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BOOL)overlayVisible
{
  return self->_overlayVisible;
}

- (BOOL)quietUIActive
{
  return self->_quietUIActive;
}

- (NSDictionary)controlsByID
{
  return self->_controlsByID;
}

- (void)_setControlsByID:(id)a3
{
  objc_storeStrong((id *)&self->_controlsByID, a3);
}

- (NSArray)controls
{
  return self->_controls;
}

- (void)_setControls:(id)a3
{
  objc_storeStrong((id *)&self->_controls, a3);
}

- (NSMutableDictionary)_updatesByID
{
  return self->__updatesByID;
}

- (void)_setUpdatesByID:(id)a3
{
  objc_storeStrong((id *)&self->__updatesByID, a3);
}

- (OS_dispatch_queue)_connectionQueue
{
  return self->__connectionQueue;
}

- (BSServiceConnectionHost)_connection
{
  return self->__connection;
}

- (void)set_connection:(id)a3
{
  objc_storeStrong((id *)&self->__connection, a3);
}

- (CAMOverlayClientInterface)_clientProxy
{
  return self->__clientProxy;
}

- (void)_setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->__clientProxy, a3);
}

- (NSHashTable)_registeredObservers
{
  return self->__registeredObservers;
}

- (void)set_registeredObservers:(id)a3
{
  objc_storeStrong((id *)&self->__registeredObservers, a3);
}

- (unint64_t)_debugID
{
  return self->__debugID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__registeredObservers, 0);
  objc_storeStrong((id *)&self->__clientProxy, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->__connectionQueue, 0);
  objc_storeStrong((id *)&self->__updatesByID, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_controlsByID, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
