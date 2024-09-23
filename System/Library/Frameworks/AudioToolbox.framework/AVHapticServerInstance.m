@implementation AVHapticServerInstance

- (id)getAsyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__AVHapticServerInstance_getAsyncDelegateForMethod_errorHandler___block_invoke;
  v11[3] = &unk_1E450C620;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  v12 = v6;
  v8 = v6;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v9;
}

- (id)getSyncDelegateForMethod:(SEL)a3 errorHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__AVHapticServerInstance_getSyncDelegateForMethod_errorHandler___block_invoke;
  v11[3] = &unk_1E450C620;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  v12 = v6;
  v8 = v6;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v9;
}

- (void)notifyClientOnStopWithReason:(int64_t)a3 error:(id)a4
{
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[AVHapticServerInstance getAsyncDelegateForMethod:errorHandler:](self, "getAsyncDelegateForMethod:errorHandler:", a2, &__block_literal_global_18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (kHSRVScope)
  {
    v9 = *(id *)kHSRVScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316162;
    v14 = "AVHapticServer.mm";
    v15 = 1024;
    v16 = 338;
    v17 = 2080;
    v18 = "-[AVHapticServerInstance notifyClientOnStopWithReason:error:]";
    v19 = 1024;
    v20 = a3;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <Calling clientStoppedForReason:%d error:'%@' on client delegate>", (uint8_t *)&v13, 0x2Cu);

  }
LABEL_8:
  objc_msgSend(v8, "clientStoppedForReason:error:", a3, v7);

}

- (void)handleClientRouteChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t clientID;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  AVHapticServer *master;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v5 = *(id *)kHSRVScope;
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          clientID = self->_clientID;
          *(_DWORD *)buf = 136315906;
          v30 = "AVHapticServer.mm";
          v31 = 1024;
          v32 = 344;
          v33 = 2080;
          v34 = "-[AVHapticServerInstance handleClientRouteChange:]";
          v35 = 2048;
          v36 = clientID;
          _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling client route change for client 0x%lx", buf, 0x26u);
        }

      }
    }
  }
  v8 = (id)*MEMORY[0x1E0D485C0];
  objc_msgSend(v4, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v10 = *(id *)kHSRVScope;
      if (v10)
      {
        v11 = v10;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v30 = "AVHapticServer.mm";
          v31 = 1024;
          v32 = 347;
          v33 = 2080;
          v34 = "-[AVHapticServerInstance handleClientRouteChange:]";
          v35 = 2112;
          v36 = (unint64_t)v9;
          _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: New route: %@", buf, 0x26u);
        }

      }
    }
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Receiver")) & 1) != 0)
    v12 = 1;
  else
    v12 = objc_msgSend(v9, "isEqualToString:", CFSTR("ReceiverAndMicrophone"));
  self->_routeUsesReceiver = v12;
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v27)
    {
      v14 = -[AVHapticServer manager](self->_master, "manager");
      v15 = v28;
      v26[0] = v27;
      v26[1] = v28;
      if (v28)
      {
        p_shared_owners = (unint64_t *)&v28->__shared_owners_;
        do
          v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
      }
      ServerManager::handleRouteChangeForEntry((uint64_t)v14, v26, self->_routeUsesReceiver);
      if (v15)
      {
        v18 = (unint64_t *)&v15->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
    }
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v20 = *(id *)kHSRVScope;
      if (v20)
      {
        v21 = v20;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v22 = self->_clientID;
          *(_DWORD *)buf = 136315906;
          v30 = "AVHapticServer.mm";
          v31 = 1024;
          v32 = 354;
          v33 = 2080;
          v34 = "-[AVHapticServerInstance handleClientRouteChange:]";
          v35 = 2048;
          v36 = v22;
          _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done handling route change for client 0x%lx", buf, 0x26u);
        }

      }
    }
  }
  v23 = v28;
  if (v28)
  {
    v24 = (unint64_t *)&v28->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

}

- (BOOL)handleClientApplicationStateChangeUsingAppState:(unint64_t)a3
{
  int v4;
  NSObject *v5;
  AVHapticServer *master;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  unint64_t v12;
  AVHapticServer *v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const CALog::Scope *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  AVHapticServer *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  os_log_type_t v42;
  id v43;
  id v44;
  AVHapticServer *v45;
  void *v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  id v55;
  unint64_t clientID;
  void *v57;
  std::__shared_weak_count *v58;
  unint64_t *p_shared_owners;
  unint64_t v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  NSObject *v66;
  id v67;
  unint64_t v68;
  AVHapticServer *v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  AVHapticServer *v73;
  unint64_t *v74;
  unint64_t v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  NSObject *v79;
  NSObject *v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  NSObject *v84;
  id v85;
  BOOL v86;
  NSObject *v88;
  NSObject *v89;
  AVHapticServer *v90;
  unint64_t *v91;
  unint64_t v92;
  id v93;
  std::__shared_weak_count *v94;
  unint64_t *v95;
  unint64_t v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  uint64_t v102;
  std::__shared_weak_count *v103;
  _QWORD v104[2];
  uint64_t v105;
  std::__shared_weak_count *v106;
  _BYTE buf[18];
  __int16 v108;
  const char *v109;
  __int16 v110;
  unint64_t v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  if (a3 == 8)
  {
    if (!-[AVHapticServerInstance runningInBackground](self, "runningInBackground"))
      goto LABEL_128;
    -[AVHapticServerInstance setRunningInBackground:](self, "setRunningInBackground:", 0);
    master = self->_master;
    if (master)
    {
      -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
      if (v105)
      {
        if (kHSRVScope)
        {
          v7 = *(id *)kHSRVScope;
          if (!v7)
          {
LABEL_115:
            v57 = -[AVHapticServer manager](self->_master, "manager");
            v58 = v106;
            v99[0] = v105;
            v99[1] = v106;
            if (v106)
            {
              p_shared_owners = (unint64_t *)&v106->__shared_owners_;
              do
                v60 = __ldxr(p_shared_owners);
              while (__stxr(v60 + 1, p_shared_owners));
            }
            ServerManager::handleAppBackgroundingForEntry((uint64_t)v57, v99, 0);
            if (v58)
            {
              v61 = (unint64_t *)&v58->__shared_owners_;
              do
                v62 = __ldaxr(v61);
              while (__stlxr(v62 - 1, v61));
              if (!v62)
              {
                ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
                std::__shared_weak_count::__release_weak(v58);
              }
            }
            goto LABEL_123;
          }
        }
        else
        {
          v7 = MEMORY[0x1E0C81028];
          v55 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          clientID = self->_clientID;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 421;
          v108 = 2080;
          v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
          v110 = 2048;
          v111 = clientID;
          _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App for backgrounded client 0x%lx returning to foreground - unmute haptics", buf, 0x26u);
        }

        goto LABEL_115;
      }
    }
    else
    {
      v105 = 0;
      v106 = 0;
    }
LABEL_123:
    v63 = v106;
    if (v106)
    {
      v64 = (unint64_t *)&v106->__shared_owners_;
      do
        v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      if (!v65)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }
LABEL_128:
    if (!-[AVHapticServerInstance clientSuspended](self, "clientSuspended"))
      return 0;
    if (kHSRVScope)
    {
      v66 = *(id *)kHSRVScope;
      if (!v66)
        goto LABEL_136;
    }
    else
    {
      v66 = MEMORY[0x1E0C81028];
      v67 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v68 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 426;
      v108 = 2080;
      v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
      v110 = 2048;
      v111 = v68;
      _os_log_impl(&dword_1A0F4D000, v66, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App for suspended client 0x%lx now resuming", buf, 0x26u);
    }

LABEL_136:
    -[AVHapticServerInstance setClientSuspended:](self, "setClientSuspended:", 0);
    if (!-[AVHapticServerInstance wasPrewarmedAndSuspended](self, "wasPrewarmedAndSuspended"))
      goto LABEL_165;
    -[AVHapticServerInstance setWasPrewarmedAndSuspended:](self, "setWasPrewarmedAndSuspended:", 0);
    v69 = self->_master;
    if (v69)
    {
      -[AVHapticServer entryWithID:](v69, "entryWithID:", self->_clientID);
      v70 = v105;
      if (v105)
      {
        if (kHSRVScope)
        {
          if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
          {
            v71 = *(id *)kHSRVScope;
            if (v71)
            {
              v72 = v71;
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = "AVHapticServer.mm";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 432;
                v108 = 2080;
                v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
                _os_log_impl(&dword_1A0F4D000, v72, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling doPrewarm (on ACQ) due to client resume", buf, 0x1Cu);
              }

              v70 = v105;
            }
          }
        }
        v73 = self->_master;
        v97 = v70;
        v98 = v106;
        if (v106)
        {
          v74 = (unint64_t *)&v106->__shared_owners_;
          do
            v75 = __ldxr(v74);
          while (__stxr(v75 + 1, v74));
        }
        -[AVHapticServer doPrewarm:](v73, "doPrewarm:", &v97);
        v76 = v98;
        if (v98)
        {
          v77 = (unint64_t *)&v98->__shared_owners_;
          do
            v78 = __ldaxr(v77);
          while (__stlxr(v78 - 1, v77));
          if (!v78)
          {
            ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
            std::__shared_weak_count::__release_weak(v76);
          }
        }
LABEL_160:
        v81 = v106;
        if (v106)
        {
          v82 = (unint64_t *)&v106->__shared_owners_;
          do
            v83 = __ldaxr(v82);
          while (__stlxr(v83 - 1, v82));
          if (!v83)
          {
            ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
            std::__shared_weak_count::__release_weak(v81);
          }
        }
LABEL_165:
        if (!-[AVHapticServerInstance wasRunningAndSuspended](self, "wasRunningAndSuspended", v97))
          return 0;
        if (kHSRVScope)
        {
          v84 = *(id *)kHSRVScope;
          if (!v84)
          {
LABEL_173:
            -[AVHapticServerInstance setWasRunningAndSuspended:](self, "setWasRunningAndSuspended:", 0);
            return 0;
          }
        }
        else
        {
          v84 = MEMORY[0x1E0C81028];
          v85 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 440;
          v108 = 2080;
          v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
          _os_log_impl(&dword_1A0F4D000, v84, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Not restarting engine after client leaves suspended state", buf, 0x1Cu);
        }

        goto LABEL_173;
      }
    }
    else
    {
      v105 = 0;
      v106 = 0;
    }
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v79 = *(id *)kHSRVScope;
        if (v79)
        {
          v80 = v79;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "AVHapticServer.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 436;
            v108 = 2080;
            v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
            _os_log_impl(&dword_1A0F4D000, v80, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client gone - noop", buf, 0x1Cu);
          }

        }
      }
    }
    goto LABEL_160;
  }
  v4 = a3;
  if (a3 == 4)
  {
    if (-[AVHapticServerInstance runningInBackground](self, "runningInBackground"))
      return 0;
    if (kHSRVScope)
    {
      v8 = *(id *)kHSRVScope;
      if (!v8)
        goto LABEL_35;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 400;
      v108 = 2080;
      v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
      v110 = 2048;
      v111 = v15;
      _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App for client 0x%lx being run in background", buf, 0x26u);
    }

LABEL_35:
    -[AVHapticServerInstance setRunningInBackground:](self, "setRunningInBackground:", 1);
    if (!-[AVHapticServerInstance clientSuspended](self, "clientSuspended"))
    {
      if (kHSRVScope)
      {
        v17 = *(id *)kHSRVScope;
        if (!v17)
          goto LABEL_95;
      }
      else
      {
        v17 = MEMORY[0x1E0C81028];
        v44 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVHapticServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 407;
        v108 = 2080;
        v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
        _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App coming from foreground - mute haptics", buf, 0x1Cu);
      }

      goto LABEL_95;
    }
    if (kHSRVScope)
    {
      v16 = *(id *)kHSRVScope;
      if (!v16)
      {
LABEL_90:
        -[AVHapticServerInstance setClientSuspended:](self, "setClientSuspended:", 0);
LABEL_95:
        v45 = self->_master;
        if (v45)
        {
          -[AVHapticServer entryWithID:](v45, "entryWithID:", self->_clientID);
          if (*(_QWORD *)buf)
          {
            v46 = -[AVHapticServer manager](self->_master, "manager");
            v47 = *(std::__shared_weak_count **)&buf[8];
            v100[0] = *(_QWORD *)buf;
            v100[1] = *(_QWORD *)&buf[8];
            if (*(_QWORD *)&buf[8])
            {
              v48 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
              do
                v49 = __ldxr(v48);
              while (__stxr(v49 + 1, v48));
            }
            ServerManager::handleAppBackgroundingForEntry((uint64_t)v46, v100, 1);
            if (v47)
            {
              v50 = (unint64_t *)&v47->__shared_owners_;
              do
                v51 = __ldaxr(v50);
              while (__stlxr(v51 - 1, v50));
              if (!v51)
              {
                ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
                std::__shared_weak_count::__release_weak(v47);
              }
            }
          }
        }
        else
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
        }
        v52 = *(std::__shared_weak_count **)&buf[8];
        if (*(_QWORD *)&buf[8])
        {
          v53 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v54 = __ldaxr(v53);
          while (__stlxr(v54 - 1, v53));
          if (!v54)
          {
            ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
            std::__shared_weak_count::__release_weak(v52);
          }
        }
        return 0;
      }
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v43 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 403;
      v108 = 2080;
      v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
      _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App coming from suspended - re-mute haptics", buf, 0x1Cu);
    }

    goto LABEL_90;
  }
  if (a3 != 2)
  {
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v9 = *(id *)kHSRVScope;
        if (v9)
        {
          v10 = v9;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "AVHapticServer.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 446;
            v108 = 2080;
            v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
            v110 = 1024;
            LODWORD(v111) = v4;
            _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: New app state %d ignored", buf, 0x22u);
          }

        }
      }
    }
    return 0;
  }
  if (-[AVHapticServerInstance clientSuspended](self, "clientSuspended"))
    return 0;
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_28;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 363;
    v108 = 2080;
    v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
    v110 = 2048;
    v111 = v12;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: App for client 0x%lx being suspended", buf, 0x26u);
  }

LABEL_28:
  -[AVHapticServerInstance setClientSuspended:](self, "setClientSuspended:", 1);
  v13 = self->_master;
  if (v13)
  {
    -[AVHapticServer entryWithID:](v13, "entryWithID:", self->_clientID);
  }
  else
  {
    v105 = 0;
    v106 = 0;
  }
  if (-[AVHapticServerInstance runningInBackground](self, "runningInBackground"))
  {
    -[AVHapticServerInstance setRunningInBackground:](self, "setRunningInBackground:", 0);
    if (!v105)
      goto LABEL_81;
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v19 = *(id *)kHSRVScope;
        if (v19)
        {
          v20 = v19;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "AVHapticServer.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 369;
            v108 = 2080;
            v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
            _os_log_impl(&dword_1A0F4D000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: App was in background-running - unmute haptics for suspend", buf, 0x1Cu);
          }

        }
      }
    }
    v21 = -[AVHapticServer manager](self->_master, "manager");
    v22 = v106;
    v104[0] = v105;
    v104[1] = v106;
    if (v106)
    {
      v23 = (unint64_t *)&v106->__shared_owners_;
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    ServerManager::handleAppBackgroundingForEntry((uint64_t)v21, v104, 0);
    if (v22)
    {
      v25 = (unint64_t *)&v22->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  if (!v105)
  {
LABEL_81:
    if (!kHSRVScope)
      goto LABEL_189;
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) == 0)
      goto LABEL_189;
    v39 = *(id *)kHSRVScope;
    if (!v39)
      goto LABEL_189;
    v38 = v39;
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      goto LABEL_188;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 393;
    v108 = 2080;
    v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
    v40 = "%25s:%-5d %s: Client gone - noop";
    v41 = v38;
    v42 = OS_LOG_TYPE_DEBUG;
LABEL_187:
    _os_log_impl(&dword_1A0F4D000, v41, v42, v40, buf, 0x1Cu);
LABEL_188:

    goto LABEL_189;
  }
  if (*(_BYTE *)(v105 + 116))
  {
    -[AVHapticServerInstance setWasPrewarmedAndSuspended:](self, "setWasPrewarmedAndSuspended:", 1);
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v27 = *(id *)kHSRVScope;
        if (v27)
        {
          v28 = v27;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "AVHapticServer.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 376;
            v108 = 2080;
            v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
            _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling doStopPrewarm (on ACQ) due to client suspend", buf, 0x1Cu);
          }

        }
      }
    }
    v29 = self->_master;
    v102 = v105;
    v103 = v106;
    if (v106)
    {
      v30 = (unint64_t *)&v106->__shared_owners_;
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }
    -[AVHapticServer doStopPrewarm:audio:haptics:](v29, "doStopPrewarm:audio:haptics:", &v102, -[AVHapticServerInstance prewarmIncludesAudio](self, "prewarmIncludesAudio"), -[AVHapticServerInstance prewarmIncludesHaptics](self, "prewarmIncludesHaptics"));
    v32 = v103;
    if (v103)
    {
      v33 = (unint64_t *)&v103->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
  }
  v35 = atomic_load((unsigned int *)(v105 + 120));
  if (v35 >= 2)
  {
    v36 = atomic_load((unsigned int *)(v105 + 120));
    if (v36 != 2)
    {
      CALog::LogObjIfEnabled((CALog *)6, kHSRVScope, v18);
      v88 = objc_claimAutoreleasedReturnValue();
      v89 = v88;
      if (v88 && os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVHapticServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 380;
        v108 = 2080;
        v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
        _os_log_impl(&dword_1A0F4D000, v89, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling doStopRunning (on ACQ) due to client suspend", buf, 0x1Cu);
      }

      -[AVHapticServerInstance setWasRunningAndSuspended:](self, "setWasRunningAndSuspended:", 1);
      v90 = self->_master;
      v101[0] = v105;
      v101[1] = v106;
      if (v106)
      {
        v91 = (unint64_t *)&v106->__shared_owners_;
        do
          v92 = __ldxr(v91);
        while (__stxr(v92 + 1, v91));
      }
      -[AVHapticServer doStopRunning:audio:haptics:](v90, "doStopRunning:audio:haptics:", v101, -[AVHapticServerInstance runIncludesAudio](self, "runIncludesAudio"), -[AVHapticServerInstance runIncludesHaptics](self, "runIncludesHaptics"));
      std::shared_ptr<PowerUsageWatchdog::ClientDescription>::~shared_ptr[abi:ne180100]((uint64_t)v101);
      if (_os_feature_enabled_impl())
        v86 = -[AVHapticServerInstance runIncludesAudio](self, "runIncludesAudio");
      else
        v86 = 0;
      -[AVHapticServerInstance notifyClientOnStopWithReason:error:](self, "notifyClientOnStopWithReason:error:", 2, 0);
      goto LABEL_190;
    }
  }
  v37 = atomic_load((unsigned int *)(v105 + 120));
  if (v37 == 2)
  {
    if (kHSRVScope)
    {
      v38 = *(id *)kHSRVScope;
      if (!v38)
        goto LABEL_189;
    }
    else
    {
      v38 = MEMORY[0x1E0C81028];
      v93 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      goto LABEL_188;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 389;
    v108 = 2080;
    v109 = "-[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:]";
    v40 = "%25s:%-5d %s: Client already stopping when suspended - noop";
    v41 = v38;
    v42 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_187;
  }
LABEL_189:
  v86 = 0;
LABEL_190:
  v94 = v106;
  if (v106)
  {
    v95 = (unint64_t *)&v106->__shared_owners_;
    do
      v96 = __ldaxr(v95);
    while (__stlxr(v96 - 1, v95));
    if (!v96)
    {
      ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
      std::__shared_weak_count::__release_weak(v94);
    }
  }
  return v86;
}

- (BOOL)handleClientApplicationStateChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t clientID;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clientID = self->_clientID;
    v15 = 136315906;
    v16 = "AVHapticServer.mm";
    v17 = 1024;
    v18 = 454;
    v19 = 2080;
    v20 = "-[AVHapticServerInstance handleClientApplicationStateChange:]";
    v21 = 2048;
    v22 = clientID;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Handling app (client) state change for client 0x%lx", (uint8_t *)&v15, 0x26u);
  }

LABEL_8:
  v8 = (id)*MEMORY[0x1E0D492C8];
  objc_msgSend(v4, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVHapticServerInstance handleClientApplicationStateChangeUsingAppState:](self, "handleClientApplicationStateChangeUsingAppState:", objc_msgSend(v9, "unsignedIntegerValue"));
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v11 = *(id *)kHSRVScope;
      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v13 = self->_clientID;
          v15 = 136315906;
          v16 = "AVHapticServer.mm";
          v17 = 1024;
          v18 = 459;
          v19 = 2080;
          v20 = "-[AVHapticServerInstance handleClientApplicationStateChange:]";
          v21 = 2048;
          v22 = v13;
          _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Done handling state change for client 0x%lx", (uint8_t *)&v15, 0x26u);
        }

      }
    }
  }

  return v10;
}

- (void)muteClientForRingerSwitch:(BOOL)a3
{
  AVHapticServer *master;
  _BOOL4 v5;
  _QWORD *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  master = self->_master;
  if (master)
  {
    v5 = a3;
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v19)
    {
      v6 = -[AVHapticServer manager](self->_master, "manager");
      if (v20)
      {
        p_shared_owners = (unint64_t *)&v20->__shared_owners_;
        do
          v8 = __ldxr(p_shared_owners);
        while (__stxr(v8 + 1, p_shared_owners));
      }
      if (kHSRVScope)
      {
        if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
        {
          v9 = *(id *)kHSRVScope;
          if (v9)
          {
            v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              v11 = *(_QWORD *)(v19 + 24);
              *(_DWORD *)buf = 136316162;
              v22 = "ServerManager.mm";
              v23 = 1024;
              v24 = 1137;
              v25 = 2080;
              v26 = "handleRingerSwitchForEntry";
              v27 = 2048;
              v28 = v11;
              v29 = 1024;
              v30 = v5;
              _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client ID: 0x%lx, ringer switch: %d", buf, 0x2Cu);
            }

          }
        }
      }
      v13 = v6[30];
      v12 = v6 + 30;
      v14 = (*(uint64_t (**)(_QWORD *))(v13 + 16))(v12);
      ClientEntry::muteAudio(v19, v5, 1, 0.0);
      if (v14)
        (*(void (**)(_QWORD *))(*v12 + 24))(v12);
      if (v20)
      {
        v15 = (unint64_t *)&v20->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)())v20->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v20);
        }
      }
    }
  }
  else
  {
    v20 = 0;
  }
  if (v20)
  {
    v17 = (unint64_t *)&v20->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

- (void)fadeClientForSessionInterruption:(BOOL)a3 affectHaptics:(BOOL)a4 fadeTime:(float)a5 fadeLevel:(float)a6 stopAfterFade:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v10;
  _BOOL8 v11;
  AVHapticServer *master;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  unint64_t v23;
  const char *v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  int v31;
  unsigned int v32;
  id v33;
  unint64_t clientID;
  int v35;
  id v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  NSObject *v41;
  NSObject *v42;
  AVHapticServer *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  NSObject *v49;
  unint64_t v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  uint64_t v53[2];
  uint64_t v54;
  uint64_t v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  _BOOL4 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (self->_clientInterrupted == a3)
    return;
  v7 = a7;
  v10 = a4;
  v11 = a3;
  self->_clientInterrupted = a3;
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (!v11)
      goto LABEL_10;
  }
  else
  {
    v54 = 0;
    v55 = 0;
    if (!a3)
      goto LABEL_10;
  }
  if ((*(unsigned int (**)(HapticSession *))(*(_QWORD *)self->_hapticSession.__ptr_ + 48))(self->_hapticSession.__ptr_))
  {
    if (kHSRVScope)
    {
      v14 = *(id *)kHSRVScope;
      if (!v14)
        goto LABEL_50;
    }
    else
    {
      v14 = (id)MEMORY[0x1E0C81028];
      v33 = MEMORY[0x1E0C81028];
    }
    v17 = v14;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v35 = (*(uint64_t (**)(HapticSession *))(*(_QWORD *)self->_hapticSession.__ptr_ + 16))(self->_hapticSession.__ptr_);
      *(_DWORD *)buf = 136316162;
      v57 = "AVHapticServer.mm";
      v58 = 1024;
      v59 = 477;
      v60 = 2080;
      v61 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
      v62 = 2048;
      v63 = clientID;
      v64 = 1024;
      LODWORD(v65) = v35;
      _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%lx's private audio session %d has been deactivated by caller process or application backgrounded. Not proceeding with fading and stopping for Session Interruption", buf, 0x2Cu);
    }

    goto LABEL_49;
  }
LABEL_10:
  if (!v54)
  {
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v16 = *(id *)kHSRVScope;
        if (v16)
        {
          v17 = v16;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            goto LABEL_49;
          v18 = self->_clientID;
          *(_DWORD *)buf = 136315906;
          v57 = "AVHapticServer.mm";
          v58 = 1024;
          v59 = 497;
          v60 = 2080;
          v61 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
          v62 = 2048;
          v63 = v18;
          v19 = "%25s:%-5d %s: Client 0x%lx does not respond to interruptions (or was not found)";
          goto LABEL_19;
        }
      }
    }
    goto LABEL_50;
  }
  if (!kHSRVScope)
  {
    v15 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    goto LABEL_21;
  }
  v15 = *(id *)kHSRVScope;
  if (v15)
  {
LABEL_21:
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_clientID;
      v24 = "ending interruption";
      *(_DWORD *)buf = 136316930;
      v57 = "AVHapticServer.mm";
      v58 = 1024;
      if (v11)
        v24 = "being interrupted";
      v59 = 481;
      v60 = 2080;
      v61 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
      v62 = 2048;
      v63 = v23;
      v64 = 2080;
      v65 = v24;
      v66 = 2048;
      v67 = a5;
      v68 = 2048;
      v69 = a6;
      v70 = 1024;
      v71 = v10;
      _os_log_impl(&dword_1A0F4D000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client 0x%lx %s with fade time %.3f level %.3f. affectHaptics: %u", buf, 0x4Au);
    }

  }
  v25 = -[AVHapticServer manager](self->_master, "manager");
  v26 = (std::__shared_weak_count *)v55;
  v53[0] = v54;
  v53[1] = v55;
  if (v55)
  {
    v27 = (unint64_t *)(v55 + 8);
    do
      v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }
  ServerManager::handleSessionInterruptionForEntry((uint64_t)v25, v53, v11, v10, a5, a6);
  if (!v26)
    goto LABEL_33;
  p_shared_owners = (unint64_t *)&v26->__shared_owners_;
  do
    v30 = __ldaxr(p_shared_owners);
  while (__stlxr(v30 - 1, p_shared_owners));
  if (v30)
  {
LABEL_33:
    if (!v7)
      goto LABEL_50;
    goto LABEL_34;
  }
  ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
  std::__shared_weak_count::__release_weak(v26);
  if (v7)
  {
LABEL_34:
    v31 = atomic_load((unsigned int *)(v54 + 120));
    if (v31 < 2 || (v32 = atomic_load((unsigned int *)(v54 + 120)), v32 == 2))
    {
      if (kHSRVScope)
      {
        v17 = *(id *)kHSRVScope;
        if (!v17)
          goto LABEL_50;
      }
      else
      {
        v17 = MEMORY[0x1E0C81028];
        v36 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_clientID;
        *(_DWORD *)buf = 136315906;
        v57 = "AVHapticServer.mm";
        v58 = 1024;
        v59 = 492;
        v60 = 2080;
        v61 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
        v62 = 2048;
        v63 = v37;
        v19 = "%25s:%-5d %s: Client 0x%lx is stopping or is not running - noop";
        v20 = v17;
        v21 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_48;
      }
LABEL_49:

      goto LABEL_50;
    }
    if (!v11)
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "AVHapticServer.mm";
        v58 = 1024;
        v59 = 485;
        _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(startingInterrupt) != 0 is false]: ", buf, 0x12u);
      }
      __break(1u);
    }
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v41 = *(id *)kHSRVScope;
        if (v41)
        {
          v42 = v41;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v57 = "AVHapticServer.mm";
            v58 = 1024;
            v59 = 486;
            v60 = 2080;
            v61 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
            _os_log_impl(&dword_1A0F4D000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Calling doStopRunningForInterrupt (async on ACQ) due to client interruption", buf, 0x1Cu);
          }

        }
      }
    }
    v43 = self->_master;
    v51 = v54;
    v52 = (std::__shared_weak_count *)v55;
    if (v55)
    {
      v44 = (unint64_t *)(v55 + 8);
      do
        v45 = __ldxr(v44);
      while (__stxr(v45 + 1, v44));
    }
    -[AVHapticServer doStopRunningForInterrupt:audio:haptics:](v43, "doStopRunningForInterrupt:audio:haptics:", &v51, -[AVHapticServerInstance runIncludesAudio](self, "runIncludesAudio", v51), -[AVHapticServerInstance runIncludesHaptics](self, "runIncludesHaptics"));
    v46 = v52;
    if (v52)
    {
      v47 = (unint64_t *)&v52->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
    -[AVHapticServerInstance notifyClientOnStopWithReason:error:](self, "notifyClientOnStopWithReason:error:", 1, 0);
    if (!kHSRVScope)
      goto LABEL_50;
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) == 0)
      goto LABEL_50;
    v49 = *(id *)kHSRVScope;
    if (!v49)
      goto LABEL_50;
    v17 = v49;
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      goto LABEL_49;
    v50 = self->_clientID;
    *(_DWORD *)buf = 136315906;
    v57 = "AVHapticServer.mm";
    v58 = 1024;
    v59 = 489;
    v60 = 2080;
    v61 = "-[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:]";
    v62 = 2048;
    v63 = v50;
    v19 = "%25s:%-5d %s: Done stopping interrupted client 0x%lx";
LABEL_19:
    v20 = v17;
    v21 = OS_LOG_TYPE_DEBUG;
LABEL_48:
    _os_log_impl(&dword_1A0F4D000, v20, v21, v19, buf, 0x26u);
    goto LABEL_49;
  }
LABEL_50:
  v38 = (std::__shared_weak_count *)v55;
  if (v55)
  {
    v39 = (unint64_t *)(v55 + 8);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
}

- (void)unmuteClientAfterSessionInterruption:(float)a3
{
  AVHapticServer *master;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  const char *v10;
  id v11;
  unint64_t v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  NSObject *v19;
  unint64_t clientID;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24[2];
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!self->_clientInterrupted)
    return;
  self->_clientInterrupted = 0;
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v25)
    {
      if (kHSRVScope)
      {
        v6 = *(id *)kHSRVScope;
        if (!v6)
        {
LABEL_17:
          v13 = -[AVHapticServer manager](self->_master, "manager");
          v14 = (std::__shared_weak_count *)v26;
          v24[0] = v25;
          v24[1] = v26;
          if (v26)
          {
            v15 = (unint64_t *)(v26 + 8);
            do
              v16 = __ldxr(v15);
            while (__stxr(v16 + 1, v15));
          }
          ServerManager::handleSessionInterruptionForEntry((uint64_t)v13, v24, 0, 1, a3, 1.0);
          if (v14)
          {
            p_shared_owners = (unint64_t *)&v14->__shared_owners_;
            do
              v18 = __ldaxr(p_shared_owners);
            while (__stlxr(v18 - 1, p_shared_owners));
            if (!v18)
            {
              ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
              std::__shared_weak_count::__release_weak(v14);
            }
          }
          if (!kHSRVScope)
            goto LABEL_32;
          if ((*(_BYTE *)(kHSRVScope + 8) & 1) == 0)
            goto LABEL_32;
          v19 = *(id *)kHSRVScope;
          if (!v19)
            goto LABEL_32;
          v8 = v19;
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            goto LABEL_31;
          clientID = self->_clientID;
          *(_DWORD *)buf = 136315906;
          v28 = "AVHapticServer.mm";
          v29 = 1024;
          v30 = 510;
          v31 = 2080;
          v32 = "-[AVHapticServerInstance unmuteClientAfterSessionInterruption:]";
          v33 = 2048;
          v34 = clientID;
          v10 = "%25s:%-5d %s: Done unmuting client 0x%lx";
          goto LABEL_30;
        }
      }
      else
      {
        v6 = MEMORY[0x1E0C81028];
        v11 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_clientID;
        *(_DWORD *)buf = 136315906;
        v28 = "AVHapticServer.mm";
        v29 = 1024;
        v30 = 508;
        v31 = 2080;
        v32 = "-[AVHapticServerInstance unmuteClientAfterSessionInterruption:]";
        v33 = 2048;
        v34 = v12;
        _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Interrupted client 0x%lx being unmuted on restart", buf, 0x26u);
      }

      goto LABEL_17;
    }
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v7 = *(id *)kHSRVScope;
      if (v7)
      {
        v8 = v7;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
LABEL_31:

          goto LABEL_32;
        }
        v9 = self->_clientID;
        *(_DWORD *)buf = 136315906;
        v28 = "AVHapticServer.mm";
        v29 = 1024;
        v30 = 513;
        v31 = 2080;
        v32 = "-[AVHapticServerInstance unmuteClientAfterSessionInterruption:]";
        v33 = 2048;
        v34 = v9;
        v10 = "%25s:%-5d %s: Client 0x%lx did not stop on interruption (or was not found)";
LABEL_30:
        _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEBUG, v10, buf, 0x26u);
        goto LABEL_31;
      }
    }
  }
LABEL_32:
  v21 = (std::__shared_weak_count *)v26;
  if (v26)
  {
    v22 = (unint64_t *)(v26 + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
}

- (void)handleInterruptionForSession:(const void *)a3 command:(unsigned int)a4 dictionary:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  unint64_t clientID;
  AVHapticServer *master;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  std::__shared_weak_count *v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  float v43;
  float v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  unsigned int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!AQMESession::isSameAudioSession(&self->_aqmeSession, (const AQMESession *)a3))
    goto LABEL_88;
  if (!kHSRVScope)
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_6;
  }
  v9 = *(id *)kHSRVScope;
  if (v9)
  {
LABEL_6:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      *(_DWORD *)buf = 136316162;
      v50 = "AVHapticServer.mm";
      v51 = 1024;
      v52 = 524;
      v53 = 2080;
      v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
      v55 = 2048;
      v56 = clientID;
      v57 = 1024;
      v58 = a4;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Handling session interruption notification for client 0x%lx, interruption cmd: %u", buf, 0x2Cu);
    }

  }
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v47)
    {
      v45 = v8;
      v46 = 0;
      v43 = 0.5;
      v44 = 0.0;
      switch(a4)
      {
        case 0u:
          if (kHSRVScope)
          {
            if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
            {
              v15 = *(id *)kHSRVScope;
              if (v15)
              {
                v16 = v15;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v50 = "AVHapticServer.mm";
                  v51 = 1024;
                  v52 = 537;
                  v53 = 2080;
                  v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling StopNow", buf, 0x1Cu);
                }

              }
            }
          }
          goto LABEL_50;
        case 1u:
          if (!kHSRVScope)
            goto LABEL_82;
          if ((*(_BYTE *)(kHSRVScope + 8) & 1) == 0)
            goto LABEL_82;
          v22 = *(id *)kHSRVScope;
          if (!v22)
            goto LABEL_82;
          v18 = v22;
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            goto LABEL_65;
          *(_DWORD *)buf = 136315650;
          v50 = "AVHapticServer.mm";
          v51 = 1024;
          v52 = 544;
          v53 = 2080;
          v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
          v19 = "%25s:%-5d %s: Ignoring InterruptionEnded";
          v20 = v18;
          v21 = 28;
          goto LABEL_64;
        case 2u:
          if (kHSRVScope)
          {
            if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
            {
              v23 = *(id *)kHSRVScope;
              if (v23)
              {
                v24 = v23;
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v50 = "AVHapticServer.mm";
                  v51 = 1024;
                  v52 = 560;
                  v53 = 2080;
                  v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A0F4D000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling BeginQuietTime", buf, 0x1Cu);
                }

              }
            }
          }
          v44 = 0.0;
          CACFDictionary::GetFloat32((CACFDictionary *)&v45, (const __CFString *)*MEMORY[0x1E0D49288], &v44);
          v25 = 0;
          v26 = 0;
          v27 = 1;
          *(float *)&v14 = v44;
          goto LABEL_59;
        case 3u:
          if (kHSRVScope)
          {
            if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
            {
              v28 = *(id *)kHSRVScope;
              if (v28)
              {
                v29 = v28;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v50 = "AVHapticServer.mm";
                  v51 = 1024;
                  v52 = 567;
                  v53 = 2080;
                  v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A0F4D000, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling EndQuietTime", buf, 0x1Cu);
                }

              }
            }
          }
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v44 = 1.0;
          goto LABEL_58;
        case 4u:
          if (kHSRVScope)
          {
            if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
            {
              v30 = *(id *)kHSRVScope;
              if (v30)
              {
                v31 = v30;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v50 = "AVHapticServer.mm";
                  v51 = 1024;
                  v52 = 547;
                  v53 = 2080;
                  v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A0F4D000, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling Pause", buf, 0x1Cu);
                }

              }
            }
          }
LABEL_50:
          CACFDictionary::GetFloat32((CACFDictionary *)&v45, (const __CFString *)*MEMORY[0x1E0D492A0], &v43);
          v44 = 0.0;
          v25 = 1;
          LODWORD(v14) = 0;
          v26 = 1;
          v27 = 1;
          goto LABEL_59;
        case 5u:
          if (kHSRVScope)
          {
            if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
            {
              v32 = *(id *)kHSRVScope;
              if (v32)
              {
                v33 = v32;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v50 = "AVHapticServer.mm";
                  v51 = 1024;
                  v52 = 554;
                  v53 = 2080;
                  v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
                  _os_log_impl(&dword_1A0F4D000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling Resume", buf, 0x1Cu);
                }

              }
            }
          }
          CACFDictionary::GetFloat32((CACFDictionary *)&v45, (const __CFString *)*MEMORY[0x1E0D492A0], &v43);
          v26 = 0;
          v27 = 0;
          v44 = 1.0;
          v25 = 1;
LABEL_58:
          LODWORD(v14) = 1.0;
LABEL_59:
          *(float *)&v13 = v43;
          -[AVHapticServerInstance fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:](self, "fadeClientForSessionInterruption:affectHaptics:fadeTime:fadeLevel:stopAfterFade:", v27, v25, v26, v13, v14);
          if (!kHSRVScope)
            goto LABEL_82;
          if ((*(_BYTE *)(kHSRVScope + 8) & 1) == 0)
            goto LABEL_82;
          v34 = *(id *)kHSRVScope;
          if (!v34)
            goto LABEL_82;
          v18 = v34;
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            goto LABEL_65;
          v35 = self->_clientID;
          *(_DWORD *)buf = 136315906;
          v50 = "AVHapticServer.mm";
          v51 = 1024;
          v52 = 585;
          v53 = 2080;
          v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
          v55 = 2048;
          v56 = v35;
          v19 = "%25s:%-5d %s: Done handling interruption notification for client 0x%lx";
          v20 = v18;
          v21 = 38;
          goto LABEL_64;
        case 6u:
          if (!kHSRVScope
            || (*(_BYTE *)(kHSRVScope + 8) & 1) == 0
            || (v36 = *(id *)kHSRVScope) == 0)
          {
            v38 = 1;
            goto LABEL_81;
          }
          v37 = v36;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v50 = "AVHapticServer.mm";
            v51 = 1024;
            v52 = 573;
            v53 = 2080;
            v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
            _os_log_impl(&dword_1A0F4D000, v37, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling Silent Mute", buf, 0x1Cu);
          }
          v38 = 1;
          goto LABEL_78;
        case 7u:
          if (kHSRVScope
            && (*(_BYTE *)(kHSRVScope + 8) & 1) != 0
            && (v39 = *(id *)kHSRVScope) != 0)
          {
            v37 = v39;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v50 = "AVHapticServer.mm";
              v51 = 1024;
              v52 = 577;
              v53 = 2080;
              v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
              _os_log_impl(&dword_1A0F4D000, v37, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling Silent UnMute", buf, 0x1Cu);
            }
            v38 = 0;
LABEL_78:

          }
          else
          {
            v38 = 0;
          }
LABEL_81:
          -[AVHapticServerInstance muteClientForRingerSwitch:](self, "muteClientForRingerSwitch:", v38);
LABEL_82:
          CACFDictionary::~CACFDictionary((CACFDictionary *)&v45);
          break;
        default:
          if (!kHSRVScope)
            goto LABEL_82;
          if ((*(_BYTE *)(kHSRVScope + 8) & 1) == 0)
            goto LABEL_82;
          v17 = *(id *)kHSRVScope;
          if (!v17)
            goto LABEL_82;
          v18 = v17;
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            goto LABEL_65;
          *(_DWORD *)buf = 136315906;
          v50 = "AVHapticServer.mm";
          v51 = 1024;
          v52 = 581;
          v53 = 2080;
          v54 = "-[AVHapticServerInstance handleInterruptionForSession:command:dictionary:]";
          v55 = 1024;
          LODWORD(v56) = a4;
          v19 = "%25s:%-5d %s: Ignoring cmd: 0x%x";
          v20 = v18;
          v21 = 34;
LABEL_64:
          _os_log_impl(&dword_1A0F4D000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
LABEL_65:

          goto LABEL_82;
      }
    }
  }
  else
  {
    v47 = 0;
    v48 = 0;
  }
  v40 = v48;
  if (v48)
  {
    p_shared_owners = (unint64_t *)&v48->__shared_owners_;
    do
      v42 = __ldaxr(p_shared_owners);
    while (__stlxr(v42 - 1, p_shared_owners));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
LABEL_88:

}

- (AVHapticServerInstance)initWithMaster:(id)a3 id:(unint64_t)a4 connection:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  AVHapticServerInstance *v12;
  AVHapticServerInstance *v13;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVHapticServerInstance;
  v12 = -[AVHapticServerInstance init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_master, a3);
    objc_storeStrong((id *)&v13->_connection, a5);
    v13->_clientID = a4;
    *(_DWORD *)&v13->_clientSuspended = 0;
    v13->_runningInBackground = 0;
  }

  return v13;
}

- (void)removeSessionListeners
{
  NSObject *v3;
  id v4;
  unint64_t clientID;
  uint64_t v6;
  void *v7;
  AVServerWrapper *v8;
  int v9;
  AVServerWrapper *v10;
  id v11;
  AVServerWrapper *listenerWrapper;
  _QWORD block[4];
  id v14;
  AVServerWrapper *v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_listenerWrapper)
  {
    if (kHSRVScope)
    {
      v3 = *(id *)kHSRVScope;
      if (!v3)
      {
LABEL_9:
        MEMORY[0x1A1B06700]();
        v6 = FigNotificationCenterRemoveWeakListener();
        MEMORY[0x1A1B06700](v6);
        FigNotificationCenterRemoveWeakListener();
        -[AVHapticServerInstance master](self, "master");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = self->_listenerWrapper;
        v9 = (*(uint64_t (**)(HapticSession *))(*(_QWORD *)self->_hapticSession.__ptr_ + 16))(self->_hapticSession.__ptr_);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __48__AVHapticServerInstance_removeSessionListeners__block_invoke;
        block[3] = &unk_1E450C6D8;
        v14 = v7;
        v15 = v8;
        v16 = v9;
        v10 = v8;
        v11 = v7;
        dispatch_async(MEMORY[0x1E0C80D38], block);
        listenerWrapper = self->_listenerWrapper;
        self->_listenerWrapper = 0;

        return;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      clientID = self->_clientID;
      *(_DWORD *)buf = 136315906;
      v18 = "AVHapticServer.mm";
      v19 = 1024;
      v20 = 660;
      v21 = 2080;
      v22 = "-[AVHapticServerInstance removeSessionListeners]";
      v23 = 2048;
      v24 = clientID;
      _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Removing session listeners on client 0x%lx", buf, 0x26u);
    }

    goto LABEL_9;
  }
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSXPCConnection *connection;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v3 = *(id *)kHSRVScope;
      if (v3)
      {
        v4 = v3;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v8 = "AVHapticServer.mm";
          v9 = 1024;
          v10 = 676;
          v11 = 2080;
          v12 = "-[AVHapticServerInstance dealloc]";
          _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Entered", buf, 0x1Cu);
        }

      }
    }
  }
  -[AVHapticServerInstance removeSessionListeners](self, "removeSessionListeners");
  connection = self->_connection;
  self->_connection = 0;

  v6.receiver = self;
  v6.super_class = (Class)AVHapticServerInstance;
  -[AVHapticServerInstance dealloc](&v6, sel_dealloc);
}

- (void)handleConnectionError
{
  NSObject *v3;
  id v4;
  unint64_t clientID;
  AVHapticServer *v6;
  AVHapticServer *master;
  NSObject *v8;
  NSObject *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  AVHapticServer *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t **v21;
  std::__shared_weak_count *v22;
  ClientEntry *v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  unint64_t v34;
  BOOL v35;
  uint64_t **v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  BOOL v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  id *v52;
  id *v53;
  ClientEntry *v54;
  std::__shared_weak_count *v55;
  _QWORD v56[5];
  id v57;
  id v58[2];
  std::__shared_weak_count *v59;
  id from;
  id location;
  ClientEntry *v62;
  std::__shared_weak_count *v63;
  _BYTE buf[12];
  __int16 v65;
  _BYTE v66[26];
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v65 = 1024;
    *(_DWORD *)v66 = 683;
    *(_WORD *)&v66[4] = 2080;
    *(_QWORD *)&v66[6] = "-[AVHapticServerInstance handleConnectionError]";
    *(_WORD *)&v66[14] = 2048;
    *(_QWORD *)&v66[16] = clientID;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v6 = self->_master;
  objc_sync_enter(v6);
  -[AVHapticServerInstance removeSessionListeners](self, "removeSessionListeners");
  master = self->_master;
  if (!master)
  {
    v62 = 0;
    v63 = 0;
    goto LABEL_87;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (v62)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_master);
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v8 = *(id *)kHSRVScope;
        if (v8)
        {
          v9 = v8;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "AVHapticServer.mm";
            v65 = 1024;
            *(_DWORD *)v66 = 690;
            *(_WORD *)&v66[4] = 2080;
            *(_QWORD *)&v66[6] = "-[AVHapticServerInstance handleConnectionError]";
            _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopPrewarm and doStopRunning on ACQ", buf, 0x1Cu);
          }

        }
      }
    }
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3321888768;
    v56[2] = __47__AVHapticServerInstance_handleConnectionError__block_invoke;
    v56[3] = &unk_1E450C700;
    v52 = &v57;
    objc_copyWeak(&v57, &from);
    objc_copyWeak(v58, &location);
    v58[1] = v62;
    v59 = v63;
    if (v63)
    {
      p_shared_owners = (unint64_t *)&v63->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    v56[4] = self;
    if (AudioControlQueue(void)::once != -1)
      dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
    v12 = (id)AudioControlQueue(void)::gAudioControlQueue;
    AT::DispatchBlock(v12, v56, 0, (uint64_t)"-[AVHapticServerInstance handleConnectionError]", (uint64_t)"AVHapticServer.mm", 701);

    if (_os_feature_enabled_impl()
      && -[AVHapticServerInstance runIncludesAudio](self, "runIncludesAudio", &v57))
    {
      (*(void (**)(HapticSession *, _QWORD))(*(_QWORD *)self->_hapticSession.__ptr_ + 56))(self->_hapticSession.__ptr_, 0);
    }
    if (kHSRVScope)
    {
      v13 = *(id *)kHSRVScope;
      if (!v13)
        goto LABEL_32;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      v65 = 1024;
      *(_DWORD *)v66 = 705;
      *(_WORD *)&v66[4] = 2080;
      *(_QWORD *)&v66[6] = "-[AVHapticServerInstance handleConnectionError]";
      *(_WORD *)&v66[14] = 2048;
      *(_QWORD *)&v66[16] = v62;
      _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Releasing resources (if necessary), unregistering and destroying client entry %p", buf, 0x26u);
    }

LABEL_32:
    v15 = self->_master;
    v54 = v62;
    v55 = v63;
    if (v63)
    {
      v16 = (unint64_t *)&v63->__shared_owners_;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    -[AVHapticServer doReleaseClientResources:](v15, "doReleaseClientResources:", &v54, v52);
    v18 = v55;
    if (v55)
    {
      v19 = (unint64_t *)&v55->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = -[AVHapticServer manager](self->_master, "manager");
    v23 = v62;
    v22 = v63;
    if (v63)
    {
      v24 = (unint64_t *)&v63->__shared_owners_;
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    if (kHSRVScope)
    {
      if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
      {
        v26 = *(id *)kHSRVScope;
        if (v26)
        {
          v27 = v26;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v28 = *((_QWORD *)v23 + 3);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "ServerManager.mm";
            v65 = 1024;
            *(_DWORD *)v66 = 1167;
            *(_WORD *)&v66[4] = 2080;
            *(_QWORD *)&v66[6] = "removeEntry";
            *(_WORD *)&v66[14] = 2048;
            *(_QWORD *)&v66[16] = v28;
            _os_log_impl(&dword_1A0F4D000, v27, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Client ID: 0x%lx", buf, 0x26u);
          }

        }
      }
    }
    v29 = v21[25];
    *(_QWORD *)buf = v21 + 3;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v21 + 3));
    *((_BYTE *)v21 + 192) = 1;
    *(_QWORD *)&v66[2] = v21;
    *(_QWORD *)&v66[10] = v21 + 24;
    *(_QWORD *)&v66[18] = v29;
    v30 = v21[1];
    if (v30)
    {
      v31 = *((_QWORD *)v23 + 3);
      v32 = (uint64_t *)(v21 + 1);
      v33 = v21[1];
      do
      {
        v34 = v33[4];
        v35 = v34 >= v31;
        if (v34 >= v31)
          v36 = (uint64_t **)v33;
        else
          v36 = (uint64_t **)(v33 + 1);
        if (v35)
          v32 = v33;
        v33 = *v36;
      }
      while (*v36);
      if (v32 != (uint64_t *)(v21 + 1) && v31 >= v32[4])
      {
        v40 = (uint64_t *)v32[1];
        if (v40)
        {
          do
          {
            v41 = v40;
            v40 = (uint64_t *)*v40;
          }
          while (v40);
        }
        else
        {
          v42 = v32;
          do
          {
            v41 = (uint64_t *)v42[2];
            v43 = *v41 == (_QWORD)v42;
            v42 = v41;
          }
          while (!v43);
        }
        if (*v21 == v32)
          *v21 = v41;
        v21[2] = (uint64_t *)((char *)v21[2] - 1);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v30, v32);
        std::shared_ptr<PowerUsageWatchdog::ClientDescription>::~shared_ptr[abi:ne180100]((uint64_t)(v32 + 5));
        operator delete(v32);
        **(_BYTE **)&v66[10] = 0;
        std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
        ClientEntry::uninitialize(v23);
        goto LABEL_76;
      }
    }
    *((_BYTE *)v21 + 192) = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    if (kHSRVScope)
    {
      v37 = *(id *)kHSRVScope;
      if (!v37)
      {
LABEL_76:
        if (v22)
        {
          v44 = (unint64_t *)&v22->__shared_owners_;
          do
            v45 = __ldaxr(v44);
          while (__stlxr(v45 - 1, v44));
          if (!v45)
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            std::__shared_weak_count::__release_weak(v22);
          }
        }
        v46 = v59;
        if (v59)
        {
          v47 = (unint64_t *)&v59->__shared_owners_;
          do
            v48 = __ldaxr(v47);
          while (__stlxr(v48 - 1, v47));
          if (!v48)
          {
            ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
            std::__shared_weak_count::__release_weak(v46);
          }
        }
        objc_destroyWeak(v58);
        objc_destroyWeak(v53);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
        goto LABEL_87;
      }
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v38 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = *((_QWORD *)v23 + 3);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "ServerManager.mm";
      v65 = 1024;
      *(_DWORD *)v66 = 1169;
      *(_WORD *)&v66[4] = 2080;
      *(_QWORD *)&v66[6] = "removeEntry";
      *(_WORD *)&v66[14] = 2048;
      *(_QWORD *)&v66[16] = v23;
      *(_WORD *)&v66[24] = 2048;
      v67 = v39;
      _os_log_impl(&dword_1A0F4D000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Invalid client entry: %p (connectionID 0x%lx)", buf, 0x30u);
    }

    goto LABEL_76;
  }
LABEL_87:
  -[AVHapticServer removeProcessEntry:](self->_master, "removeProcessEntry:", self->_clientID);
  v49 = v63;
  if (v63)
  {
    v50 = (unint64_t *)&v63->__shared_owners_;
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  objc_sync_exit(v6);

}

- (BOOL)setupAudioSessionFromID:(unsigned int)a3 isShared:(BOOL)a4 error:(id *)a5
{
  uint64_t v6;
  shared_ptr<HapticSession> v8;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *mSourceSessionID;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __shared_weak_count *v17;
  shared_ptr<opaqueCMSession> v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *mCFObject;
  unint64_t mSubsessionID;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_mDescription;
  int64_t *p_var0;
  int64_t v26;
  AVServerWrapper *v27;
  AVServerWrapper *listenerWrapper;
  int v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  BOOL result;
  int v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  void *v48;
  AVHapticServerInstance *v49;
  CFNumberRef v50[6];
  CFNumberRef number;
  uint64_t v52;
  audit_token_t v53;
  AQMESession buf;
  char v55;
  uint64_t v56;

  v6 = *(_QWORD *)&a3;
  v56 = *MEMORY[0x1E0C80C00];
  memset(&v53, 0, sizeof(v53));
  HapticSession::create_shared((HapticSession *)&buf, a3, a4, &v53);
  v8 = *(shared_ptr<HapticSession> *)&buf.mProcessID;
  *(_QWORD *)&buf.mProcessID = 0;
  buf.mSourceSessionID = 0;
  cntrl = self->_hapticSession.__cntrl_;
  self->_hapticSession = v8;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  mSourceSessionID = (std::__shared_weak_count *)buf.mSourceSessionID;
  if (buf.mSourceSessionID)
  {
    v13 = (unint64_t *)(*(_QWORD *)&buf.mSourceSessionID + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))mSourceSessionID->__on_zero_shared)(mSourceSessionID);
      std::__shared_weak_count::__release_weak(mSourceSessionID);
    }
  }
  v15 = (*(uint64_t (**)(HapticSession *))(*(_QWORD *)self->_hapticSession.__ptr_ + 16))(self->_hapticSession.__ptr_);
  v16 = AudioSessionCopyCMSessionForSessionID(v15);
  v17 = (__shared_weak_count *)operator new();
  *(_QWORD *)v17 = &off_1E450C9E0;
  *((_QWORD *)v17 + 1) = 0;
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = v16;
  v18.__ptr_ = (opaqueCMSession *)v16;
  v18.__cntrl_ = v17;
  v19 = self->_clientSession.__cntrl_;
  self->_clientSession = v18;
  if (v19)
  {
    v20 = (unint64_t *)((char *)v19 + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v19 + 16))(v19);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v19);
    }
  }
  AQMESession::AQMESession(&buf, v6, 0);
  mCFObject = buf.mSubsessionRef.mCFObject;
  *(_QWORD *)&self->_aqmeSession.mProcessID = *(_QWORD *)&buf.mProcessID;
  *(_QWORD *)((char *)&self->_aqmeSession.mSessionID + 1) = *(_QWORD *)((char *)&buf.mSessionID + 1);
  buf.mSubsessionRef.mCFObject = self->_aqmeSession.mSubsessionRef.mCFObject;
  mSubsessionID = buf.mSubsessionID;
  self->_aqmeSession.mSubsessionRef.mCFObject = mCFObject;
  self->_aqmeSession.mSubsessionID = mSubsessionID;
  p_mDescription = &self->_aqmeSession.mDescription;
  if (*((char *)&self->_aqmeSession.mDescription.__r_.__value_.var0.__l + 23) < 0)
    operator delete(p_mDescription->__r_.__value_.var0.__l.__data_);
  *(_OWORD *)p_mDescription->__r_.__value_.var0.__s.__data_ = *(_OWORD *)buf.mDescription.__r_.__value_.var0.__s.__data_;
  *((_QWORD *)&self->_aqmeSession.mDescription.__r_.__value_.var0.__l + 2) = *((_QWORD *)&buf.mDescription.__r_.__value_.var0.__l
                                                                             + 2);
  *((_BYTE *)&buf.mDescription.__r_.__value_.var0.__l + 23) = 0;
  buf.mDescription.__r_.__value_.var0.__s.__data_[0] = 0;
  self->_aqmeSession.mDescription.__r_.var0 = buf.mDescription.__r_.var0;
  p_var0 = &self->_aqmeSession.mDescription.var0;
  if (self->_anon_88[0] == v55)
  {
    if (self->_anon_88[0])
    {
      v26 = *p_var0;
      *p_var0 = buf.mDescription.var0;
      buf.mDescription.var0 = v26;
    }
  }
  else if (self->_anon_88[0])
  {
    std::__optional_destruct_base<applesauce::CF::StringRef,false>::reset[abi:ne180100]((uint64_t)p_var0);
  }
  else
  {
    self->_aqmeSession.mDescription.var0 = buf.mDescription.var0;
    buf.mDescription.var0 = 0;
    self->_anon_88[0] = 1;
  }
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf.mDescription.var0);
  if (*((char *)&buf.mDescription.__r_.__value_.var0.__l + 23) < 0)
    operator delete(buf.mDescription.__r_.__value_.var0.__l.__data_);
  if (buf.mSubsessionRef.mCFObject)
    CFRelease(buf.mSubsessionRef.mCFObject);
  if (!self->_clientSession.__ptr_)
  {
    if (kHSRVScope)
    {
      v31 = *(id *)kHSRVScope;
      if (!v31)
        goto LABEL_50;
    }
    else
    {
      v31 = MEMORY[0x1E0C81028];
      v34 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      buf.mProcessID = 136315906;
      *(_QWORD *)&buf.mSessionID = "AVHapticServer.mm";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 719;
      WORD1(buf.mSubsessionRef.mCFObject) = 2080;
      *(void **)((char *)&buf.mSubsessionRef.mCFObject + 4) = "-[AVHapticServerInstance setupAudioSessionFromID:isShared:error:]";
      WORD2(buf.mSubsessionID) = 1024;
      *(_DWORD *)((char *)&buf.mSubsessionID + 6) = v6;
      _os_log_impl(&dword_1A0F4D000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Could not get CMSession for audio session ID %u", (uint8_t *)&buf, 0x22u);
    }

LABEL_50:
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4810, 0);
      v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
      v37 = v35;
      result = 0;
      *a5 = v37;
      return result;
    }
    return 0;
  }
  v27 = -[AVServerWrapper initWithServerInstance:]([AVServerWrapper alloc], "initWithServerInstance:", self);
  listenerWrapper = self->_listenerWrapper;
  self->_listenerWrapper = v27;

  MEMORY[0x1A1B06700]();
  v29 = FigNotificationCenterAddWeakListener();
  if (v29)
  {
    if (kHSRVScope)
    {
      v30 = *(id *)kHSRVScope;
      if (!v30)
        goto LABEL_44;
    }
    else
    {
      v30 = MEMORY[0x1E0C81028];
      v33 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      buf.mProcessID = 136315906;
      *(_QWORD *)&buf.mSessionID = "AVHapticServer.mm";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 727;
      WORD1(buf.mSubsessionRef.mCFObject) = 2080;
      *(void **)((char *)&buf.mSubsessionRef.mCFObject + 4) = "-[AVHapticServerInstance setupAudioSessionFromID:isShared:error:]";
      WORD2(buf.mSubsessionID) = 1024;
      *(_DWORD *)((char *)&buf.mSubsessionID + 6) = v29;
      _os_log_impl(&dword_1A0F4D000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Could not add listener for application state notifications: %d", (uint8_t *)&buf, 0x22u);
    }

LABEL_44:
    if (a5)
      goto LABEL_58;
    return 0;
  }
  MEMORY[0x1A1B06700]();
  v29 = FigNotificationCenterAddWeakListener();
  if (v29)
  {
    if (kHSRVScope)
    {
      v32 = *(id *)kHSRVScope;
      if (!v32)
        goto LABEL_57;
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v36 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      buf.mProcessID = 136315906;
      *(_QWORD *)&buf.mSessionID = "AVHapticServer.mm";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 734;
      WORD1(buf.mSubsessionRef.mCFObject) = 2080;
      *(void **)((char *)&buf.mSubsessionRef.mCFObject + 4) = "-[AVHapticServerInstance setupAudioSessionFromID:isShared:error:]";
      WORD2(buf.mSubsessionID) = 1024;
      *(_DWORD *)((char *)&buf.mSubsessionID + 6) = v29;
      _os_log_impl(&dword_1A0F4D000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Could not add listener for route change notifications: %d", (uint8_t *)&buf, 0x22u);
    }

LABEL_57:
    if (a5)
    {
LABEL_58:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v29, 0);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    }
    return 0;
  }
  v52 = 0;
  _CMSessionCopyProperty();
  number = 0;
  CMSessionCopyProperty();
  if (!number)
  {
    if (kHSRVScope)
    {
      v41 = *(id *)kHSRVScope;
      if (!v41)
        goto LABEL_81;
    }
    else
    {
      v41 = MEMORY[0x1E0C81028];
      v42 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      buf.mProcessID = 136315650;
      *(_QWORD *)&buf.mSessionID = "AVHapticServer.mm";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 764;
      WORD1(buf.mSubsessionRef.mCFObject) = 2080;
      *(void **)((char *)&buf.mSubsessionRef.mCFObject + 4) = "-[AVHapticServerInstance setupAudioSessionFromID:isShared:error:]";
      _os_log_impl(&dword_1A0F4D000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: failed to query kCMSessionProperty_ApplicationState", (uint8_t *)&buf, 0x1Cu);
    }

    goto LABEL_81;
  }
  HIDWORD(v50[0]) = 0;
  CFNumberGetValue(number, kCFNumberSInt32Type, (char *)v50 + 4);
  v39 = HIDWORD(v50[0]);
  if (HIDWORD(v50[0]) != 8)
  {
    if (kHSRVScope)
    {
      v40 = *(id *)kHSRVScope;
      if (!v40)
      {
LABEL_77:
        v45 = MEMORY[0x1E0C809B0];
        v46 = 3221225472;
        v47 = __65__AVHapticServerInstance_setupAudioSessionFromID_isShared_error___block_invoke_31;
        v48 = &unk_1E450C738;
        v49 = self;
        LODWORD(v50[0]) = v39;
        if (AudioControlQueue(void)::once != -1)
          dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
        v44 = (id)AudioControlQueue(void)::gAudioControlQueue;
        AT::DispatchBlock(v44, &v45, 0, (uint64_t)"-[AVHapticServerInstance setupAudioSessionFromID:isShared:error:]", (uint64_t)"AVHapticServer.mm", 759);

        goto LABEL_80;
      }
    }
    else
    {
      v40 = MEMORY[0x1E0C81028];
      v43 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      buf.mProcessID = 136315650;
      *(_QWORD *)&buf.mSessionID = "AVHapticServer.mm";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 758;
      WORD1(buf.mSubsessionRef.mCFObject) = 2080;
      *(void **)((char *)&buf.mSubsessionRef.mCFObject + 4) = "-[AVHapticServerInstance setupAudioSessionFromID:isShared:error:]";
      _os_log_impl(&dword_1A0F4D000, v40, OS_LOG_TYPE_INFO, "%25s:%-5d %s: ApplicationState is not starting out in ForegroundRunning - processing initial state", (uint8_t *)&buf, 0x1Cu);
    }

    v39 = HIDWORD(v50[0]);
    goto LABEL_77;
  }
LABEL_80:
  CFRelease(number);
LABEL_81:
  -[AVHapticServer addListener:forAudioSessionID:](self->_master, "addListener:forAudioSessionID:", self->_listenerWrapper, v6, v45, v46, v47, v48, v49, v50[0], v50[1], v50[2], v50[3], v50[4], v50[5]);
  return 1;
}

- (void)configureWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, unint64_t);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  id v14;
  const char *v15;
  AVHapticServer *master;
  NSObject *v17;
  NSObject *v18;
  id v19;
  unint64_t v20;
  unint64_t clientID;
  _BOOL4 v22;
  id v23;
  NSObject *v24;
  unint64_t v25;
  id v26;
  unint64_t v27;
  void *v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  id v32;
  unint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  _BYTE v45[14];
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, unint64_t))a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("AudioSessionID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("AudioSessionIsShared"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("BypassAudioSession"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v34, "unsignedIntegerValue");
  v11 = objc_msgSend(v8, "BOOLValue");
  v12 = objc_msgSend(v9, "BOOLValue");
  if (kHSRVScope)
  {
    v13 = *(id *)kHSRVScope;
    if (!v13)
      goto LABEL_10;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = "not shared";
    *(_DWORD *)buf = 136316418;
    v39 = "AVHapticServer.mm";
    v41 = 780;
    v40 = 1024;
    v43 = "-[AVHapticServerInstance configureWithOptions:reply:]";
    v42 = 2080;
    if ((_DWORD)v11)
      v15 = "shared";
    v44 = 1024;
    *(_DWORD *)v45 = v10;
    *(_WORD *)&v45[4] = 2080;
    *(_QWORD *)&v45[6] = v15;
    v46 = 1024;
    v47 = v12;
    _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] called by client with sessionID: %u (%s), bypassAudioSession: %u", buf, 0x32u);
  }

LABEL_10:
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v36)
    {
      if (v12)
      {
        if (kHSRVScope)
        {
          v17 = *(id *)kHSRVScope;
          if (!v17)
          {
LABEL_34:
            clientID = self->_clientID;
            goto LABEL_35;
          }
        }
        else
        {
          v17 = MEMORY[0x1E0C81028];
          v26 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v27 = self->_clientID;
          *(_DWORD *)buf = 136315906;
          v39 = "AVHapticServer.mm";
          v40 = 1024;
          v41 = 785;
          v42 = 2080;
          v43 = "-[AVHapticServerInstance configureWithOptions:reply:]";
          v44 = 2048;
          *(_QWORD *)v45 = v27;
          _os_log_impl(&dword_1A0F4D000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Skipping setting up AudioSession; replying with 0x%lx",
            buf,
            0x26u);
        }

        goto LABEL_34;
      }
      v35 = 0;
      v22 = -[AVHapticServerInstance setupAudioSessionFromID:isShared:error:](self, "setupAudioSessionFromID:isShared:error:", v10, v11, &v35);
      v23 = v35;
      if (!v22)
      {
        v25 = 0;
LABEL_47:
        v7[2](v7, v25);
        v28 = v23;
        goto LABEL_36;
      }
      if (kHSRVScope)
      {
        v24 = *(id *)kHSRVScope;
        if (!v24)
        {
LABEL_46:
          v25 = self->_clientID;
          goto LABEL_47;
        }
      }
      else
      {
        v24 = MEMORY[0x1E0C81028];
        v32 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v33 = self->_clientID;
        *(_DWORD *)buf = 136315906;
        v39 = "AVHapticServer.mm";
        v40 = 1024;
        v41 = 789;
        v42 = 2080;
        v43 = "-[AVHapticServerInstance configureWithOptions:reply:]";
        v44 = 2048;
        *(_QWORD *)v45 = v33;
        _os_log_impl(&dword_1A0F4D000, v24, OS_LOG_TYPE_INFO, "%25s:%-5d %s: replying with 0x%lx", buf, 0x26u);
      }

      goto LABEL_46;
    }
  }
  else
  {
    v36 = 0;
    v37 = 0;
  }
  if (!kHSRVScope)
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_21;
  }
  v18 = *(id *)kHSRVScope;
  if (v18)
  {
LABEL_21:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_clientID;
      *(_DWORD *)buf = 136315906;
      v39 = "AVHapticServer.mm";
      v40 = 1024;
      v41 = 797;
      v42 = 2080;
      v43 = "-[AVHapticServerInstance configureWithOptions:reply:]";
      v44 = 2048;
      *(_QWORD *)v45 = v20;
      _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: No matching entry found for clientID 0x%lx", buf, 0x26u);
    }

  }
  clientID = 0;
LABEL_35:
  v7[2](v7, clientID);
  v28 = 0;
LABEL_36:
  v29 = v37;
  if (v37)
  {
    p_shared_owners = (unint64_t *)&v37->__shared_owners_;
    do
      v31 = __ldaxr(p_shared_owners);
    while (__stlxr(v31 - 1, p_shared_owners));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

}

- (void)queryCapabilities:(id)a3 reply:(id)a4
{
  std::string *v6;
  void (**v7)(id, _QWORD, uint64_t);
  id v8;
  void *v9;
  std::string::size_type size;
  NSObject *v11;
  NSObject *v12;
  id v13;
  std::string *p_p;
  uint64_t **v15;
  uint64_t *v16;
  std::string *v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  AVHapticServer *master;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  void *v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  int v46;
  char v47;
  NSObject *v48;
  NSObject *v49;
  id v50;
  unint64_t *p_shared_owners;
  unint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  uint64_t *v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  __int128 v76;
  std::string v77;
  char v78;
  uint64_t v79;
  std::__shared_weak_count *v80;
  __int128 v81;
  std::string __p;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  _BYTE buf[28];
  __int16 v90;
  std::string *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = (std::string *)a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__3359;
  v87 = __Block_byref_object_dispose__3360;
  v88 = 0;
  unk_1EE5F7890(v6, "objectForKey:", CFSTR("RequestedLocality"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&__p, 0, sizeof(__p));
  v81 = 0uLL;
  if (objc_msgSend(v9, "length"))
  {
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = *(std::string *)buf;
  }
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  if (!size)
  {
    if (kHSRVScope)
    {
      v12 = *(id *)kHSRVScope;
      if (!v12)
        goto LABEL_26;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 826;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
      _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No Locality passed in", buf, 0x1Cu);
    }

    goto LABEL_26;
  }
  if (std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__count_unique<std::string>(*(_QWORD **)(*(_QWORD *)(-[AVHapticServer manager](self->_master, "manager") + 232) + 16), &__p))
  {
    if (kHSRVScope)
    {
      v11 = *(id *)kHSRVScope;
      if (!v11)
      {
LABEL_21:
        v15 = (uint64_t **)(*(_QWORD *)(-[AVHapticServer manager](self->_master, "manager") + 232) + 8);
        *(_QWORD *)buf = &__p;
        v16 = std::__tree<std::__value_type<std::string,Locality>,std::__map_value_compare<std::string,std::__value_type<std::string,Locality>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Locality>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v15, &__p, (__int128 **)buf);
        v17 = (std::string *)operator new(0x98uLL);
        v17->__r_.__value_.__l.__size_ = 0;
        v17->__r_.__value_.__r.__words[2] = 0;
        v17->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E450CA18;
        Locality::Locality(v17 + 1, (const Locality *)(v16 + 7));
        *(_QWORD *)&v19 = v18;
        *((_QWORD *)&v19 + 1) = v17;
        v81 = v19;
        goto LABEL_27;
      }
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVHapticServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 831;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
      v90 = 2080;
      v91 = p_p;
      _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Found Locality: %s", buf, 0x26u);
    }

    goto LABEL_21;
  }
LABEL_26:
  v19 = 0uLL;
LABEL_27:
  master = self->_master;
  if (master)
  {
    v70 = v19;
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v79)
    {
      unk_1EE5F7898(v6, "objectForKey:", CFSTR("RequestedPriority"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = objc_msgSend(v22, "unsignedIntegerValue");
        v25 = v24;
        switch(v24)
        {
          case 0:
            goto LABEL_31;
          case 1:
            v32 = v79;
            v33 = 1000;
            goto LABEL_47;
          case 2:
            v32 = v79;
            v33 = 1001;
            goto LABEL_47;
          case 3:
            v32 = v79;
            v33 = 1003;
            goto LABEL_47;
          case 4:
            v32 = v79;
            v33 = 1002;
LABEL_47:
            *(_DWORD *)(v32 + 104) = v33;
            goto LABEL_48;
          default:
            if (kHSRVScope)
            {
              v31 = *(id *)kHSRVScope;
              if (!v31)
                goto LABEL_127;
            }
            else
            {
              v31 = MEMORY[0x1E0C81028];
              v67 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "AVHapticServer.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 869;
              *(_WORD *)&buf[18] = 2080;
              *(_QWORD *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
              v90 = 1024;
              LODWORD(v91) = v25;
              _os_log_impl(&dword_1A0F4D000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal priority: %u", buf, 0x22u);
            }

LABEL_127:
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4850, 0);
            v68 = objc_claimAutoreleasedReturnValue();
            v69 = (void *)v84[5];
            v84[5] = v68;

            v7[2](v7, 0, v84[5]);
            v44 = v23;
            v29 = v9;
            break;
        }
        goto LABEL_109;
      }
LABEL_31:
      if (kHSRVScope)
      {
        v26 = *(id *)kHSRVScope;
        if (!v26)
          goto LABEL_48;
      }
      else
      {
        v26 = MEMORY[0x1E0C81028];
        v30 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVHapticServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 866;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
        _os_log_impl(&dword_1A0F4D000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No Priority passed in", buf, 0x1Cu);
      }

LABEL_48:
      unk_1EE5F78A0(v6, "objectForKey:", CFSTR("RequestedPowerUsage"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v35 = objc_msgSend(v34, "unsignedIntegerValue");
        v36 = v35;
        if (v35)
        {
          if (v35 == 11)
          {
            *(_BYTE *)(v79 + 108) = 1;
            goto LABEL_69;
          }
          if (v35 == 10)
          {
            *(_BYTE *)(v79 + 108) = 0;
            goto LABEL_69;
          }
          if (kHSRVScope)
          {
            v39 = *(id *)kHSRVScope;
            if (!v39)
            {
LABEL_68:
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4850, 0);
              v41 = objc_claimAutoreleasedReturnValue();
              v42 = (void *)v84[5];
              v84[5] = v41;

              v7[2](v7, 0, v84[5]);
              goto LABEL_69;
            }
          }
          else
          {
            v39 = MEMORY[0x1E0C81028];
            v40 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "AVHapticServer.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 895;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
            v90 = 1024;
            LODWORD(v91) = v36;
            _os_log_impl(&dword_1A0F4D000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal power usage: %u", buf, 0x22u);
          }

          goto LABEL_68;
        }
      }
      if (kHSRVScope)
      {
        v37 = *(id *)kHSRVScope;
        if (!v37)
          goto LABEL_69;
      }
      else
      {
        v37 = MEMORY[0x1E0C81028];
        v38 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVHapticServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 892;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
        _os_log_impl(&dword_1A0F4D000, v37, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No Power usage passed in", buf, 0x1Cu);
      }

LABEL_69:
      unk_1EE5F78A8(v6, "objectForKey:", CFSTR("AllowBackgroundHaptics"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = v43;
      if (v43)
        *(_BYTE *)(v79 + 216) = objc_msgSend(v43, "BOOLValue");
      unk_1EE5F78B0(v6, "objectForKey:", CFSTR("RequestedUsageCategory"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
        goto LABEL_79;
      v45 = v29;
      if (objc_msgSend(v45, "isEqualToString:", CFSTR("UIFeedback")))
      {
        v46 = 1;
      }
      else
      {
        if (!objc_msgSend(v45, "isEqualToString:", CFSTR("iOSKeyboard")))
        {
          *(_DWORD *)(v79 + 112) = 0;
          goto LABEL_78;
        }
        v46 = 2;
      }
      *(_DWORD *)(v79 + 112) = v46;
LABEL_78:

LABEL_79:
      if (HardwareSupportsHaptics::sCheckServer_Once != -1)
        dispatch_once(&HardwareSupportsHaptics::sCheckServer_Once, &__block_literal_global_10159);
      v47 = HardwareSupportsHaptics::sHapticsSupported;
      if (kHSRVScope)
      {
        if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
        {
          v48 = *(id *)kHSRVScope;
          if (v48)
          {
            v49 = v48;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "AVHapticServer.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 917;
              *(_WORD *)&buf[18] = 2080;
              *(_QWORD *)&buf[20] = "-[AVHapticServerInstance queryCapabilities:reply:]";
              v90 = 2112;
              v91 = v6;
              _os_log_impl(&dword_1A0F4D000, v49, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: queries: %@", buf, 0x26u);
            }

          }
        }
      }
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3321888768;
      v71[2] = __50__AVHapticServerInstance_queryCapabilities_reply___block_invoke;
      v71[3] = &unk_1E450C760;
      v50 = v8;
      v78 = v47;
      v72 = v50;
      v74 = v79;
      v75 = v80;
      if (v80)
      {
        p_shared_owners = (unint64_t *)&v80->__shared_owners_;
        do
          v52 = __ldxr(p_shared_owners);
        while (__stxr(v52 + 1, p_shared_owners));
      }
      v76 = v70;
      if (*((_QWORD *)&v70 + 1))
      {
        v53 = (unint64_t *)(*((_QWORD *)&v70 + 1) + 8);
        do
          v54 = __ldxr(v53);
        while (__stxr(v54 + 1, v53));
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v77, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v77 = __p;
      v73 = &v83;
      unk_1EE5F78B8(v6, "enumerateKeysAndObjectsUsingBlock:", v71);
      ((void (**)(id, id, uint64_t))v7)[2](v7, v50, v84[5]);
      if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v77.__r_.__value_.__l.__data_);
      v55 = (std::__shared_weak_count *)*((_QWORD *)&v76 + 1);
      if (*((_QWORD *)&v76 + 1))
      {
        v56 = (unint64_t *)(*((_QWORD *)&v76 + 1) + 8);
        do
          v57 = __ldaxr(v56);
        while (__stlxr(v57 - 1, v56));
        if (!v57)
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
      }
      v58 = v75;
      if (v75)
      {
        v59 = (unint64_t *)&v75->__shared_owners_;
        do
          v60 = __ldaxr(v59);
        while (__stlxr(v60 - 1, v59));
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
          std::__shared_weak_count::__release_weak(v58);
        }
      }

LABEL_109:
      goto LABEL_110;
    }
  }
  else
  {
    v79 = 0;
    v80 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v84[5];
  v84[5] = v27;

  v7[2](v7, 0, v84[5]);
  v29 = v9;
LABEL_110:
  v61 = v80;
  if (v80)
  {
    v62 = (unint64_t *)&v80->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  v64 = (std::__shared_weak_count *)*((_QWORD *)&v81 + 1);
  if (*((_QWORD *)&v81 + 1))
  {
    v65 = (unint64_t *)(*((_QWORD *)&v81 + 1) + 8);
    do
      v66 = __ldaxr(v65);
    while (__stlxr(v66 - 1, v65));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
      std::__shared_weak_count::__release_weak(v64);
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  _Block_object_dispose(&v83, 8);
}

- (void)allocateClientResources:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t clientID;
  AVHapticServer *v8;
  AVHapticServer *master;
  BOOL v10;
  id v11;
  AVHapticServer *v12;
  uint64_t v13;
  HapticSession *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  int v27;
  NSObject *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  OS_dispatch_object *fObj;
  NSObject *v41;
  id v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  unsigned int v46;
  object v47;
  _QWORD *v48;
  std::__shared_weak_count *v49;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unsigned int v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    v52 = "AVHapticServer.mm";
    v53 = 1024;
    v54 = 1004;
    v55 = 2080;
    v56 = "-[AVHapticServerInstance allocateClientResources:]";
    v57 = 2048;
    v58 = clientID;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v8 = self->_master;
  objc_sync_enter(v8);
  master = self->_master;
  v50 = 0;
  v10 = -[AVHapticServer incrementInit:](master, "incrementInit:", &v50);
  v11 = v50;
  if (!v10)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v4 + 2))(v4, 0, 0, v11);
    goto LABEL_72;
  }
  v12 = self->_master;
  if (v12)
  {
    -[AVHapticServer entryWithID:](v12, "entryWithID:", self->_clientID);
    if (v48)
    {
      v47.fObj = (OS_dispatch_object *)xpc_null_create();
      v46 = 2688;
      v13 = (uint64_t)v48;
      ptr = self->_hapticSession.__ptr_;
      cntrl = self->_hapticSession.__cntrl_;
      if (cntrl)
      {
        v16 = (unint64_t *)((char *)cntrl + 8);
        do
          v17 = __ldxr(v16);
        while (__stxr(v17 + 1, v16));
      }
      if (kHSRVScope)
      {
        v18 = *(id *)kHSRVScope;
        if (!v18)
          goto LABEL_24;
      }
      else
      {
        v18 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v21 = v48[3];
        *(_DWORD *)buf = 136315906;
        v52 = "ClientEntry.mm";
        v53 = 1024;
        v54 = 154;
        v55 = 2080;
        v56 = "initialize";
        v57 = 1024;
        LODWORD(v58) = v21;
        _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x", buf, 0x22u);
      }

LABEL_24:
      if (cntrl)
      {
        v22 = (unint64_t *)((char *)cntrl + 8);
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }
      v24 = (std::__shared_weak_count *)v48[9];
      v48[8] = ptr;
      *(_QWORD *)(v13 + 72) = cntrl;
      if (v24)
      {
        p_shared_owners = (unint64_t *)&v24->__shared_owners_;
        do
          v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      v27 = HapticSharedMemoryReader::allocate((HapticSharedMemoryReader *)(v13 + 128), &v47, &v46);
      if (v27)
        goto LABEL_45;
      ClientEntry::setState(v13, 1u);
      if (*(_QWORD *)(v13 + 472))
      {
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v52 = "ClientEntry.mm";
          v53 = 1024;
          v54 = 159;
          _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(_channelIDsToBeDetached.size() == 0) != 0 is false]: ", buf, 0x12u);
        }
        __break(1u);
      }
      else if (SupportsMultiAudioOutput::once == -1)
      {
LABEL_35:
        v27 = 0;
        if (gHapticAudioMultiOutputEnabled && ptr)
        {
          if (kHSRVScope)
          {
            v28 = *(id *)kHSRVScope;
            if (!v28)
            {
LABEL_44:
              v31 = *(_QWORD *)(*(_QWORD *)(v13 + 224) + 232);
              v32 = *(_QWORD *)(v13 + 24);
              v33 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v13 + 64) + 16))(*(_QWORD *)(v13 + 64));
              v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v31 + 136))(v31, v32, v33, v13 + 32);
              goto LABEL_45;
            }
          }
          else
          {
            v28 = MEMORY[0x1E0C81028];
            v29 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v30 = *(_QWORD *)(v13 + 24);
            *(_DWORD *)buf = 136315906;
            v52 = "ClientEntry.mm";
            v53 = 1024;
            v54 = 193;
            v55 = 2080;
            v56 = "addAudioOutput";
            v57 = 2048;
            v58 = v30;
            _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Registering audio SynthOutput for client ID: 0x%lx", buf, 0x26u);
          }

          goto LABEL_44;
        }
LABEL_45:
        if (cntrl)
        {
          v34 = (unint64_t *)((char *)cntrl + 8);
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
          }
        }
        if (v27)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v27, 0);
          v36 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = 0;
        }

        if (kHSRVScope)
        {
          if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
          {
            v37 = *(id *)kHSRVScope;
            if (v37)
            {
              v38 = v37;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                v39 = _Block_copy(v4);
                *(_DWORD *)buf = 136316418;
                v52 = "AVHapticServer.mm";
                v53 = 1024;
                v54 = 1023;
                v55 = 2080;
                v56 = "-[AVHapticServerInstance allocateClientResources:]";
                v57 = 2048;
                v58 = (unint64_t)v39;
                v59 = 1024;
                v60 = v46;
                v61 = 2112;
                v62 = v36;
                _os_log_impl(&dword_1A0F4D000, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with sharedBufferSize %u and error %@", buf, 0x36u);

              }
            }
          }
        }
        fObj = v47.fObj;
        (*((void (**)(id, OS_dispatch_object *, _QWORD, uint64_t))v4 + 2))(v4, v47.fObj, v46, v36);
        if (kHSRVScope)
        {
          v41 = *(id *)kHSRVScope;
          if (!v41)
          {
LABEL_66:

            v11 = (id)v36;
            goto LABEL_67;
          }
        }
        else
        {
          v41 = MEMORY[0x1E0C81028];
          v42 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v52 = "AVHapticServer.mm";
          v53 = 1024;
          v54 = 1025;
          v55 = 2080;
          v56 = "-[AVHapticServerInstance allocateClientResources:]";
          _os_log_impl(&dword_1A0F4D000, v41, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Done", buf, 0x1Cu);
        }

        goto LABEL_66;
      }
      dispatch_once(&SupportsMultiAudioOutput::once, &__block_literal_global_2_10166);
      goto LABEL_35;
    }
  }
  else
  {
    v48 = 0;
    v49 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
  v19 = objc_claimAutoreleasedReturnValue();

  v11 = (id)v19;
  (*((void (**)(id, _QWORD, _QWORD, uint64_t))v4 + 2))(v4, 0, 0, v19);
LABEL_67:
  v43 = v49;
  if (v49)
  {
    v44 = (unint64_t *)&v49->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
LABEL_72:

  objc_sync_exit(v8);
}

- (void)releaseClientResources
{
  NSObject *v3;
  id v4;
  unint64_t clientID;
  AVHapticServer *v6;
  AVHapticServer *master;
  AVHapticServer *v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  id v13;
  AVHapticServer *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  std::__shared_weak_count *v27;
  _QWORD v28[5];
  id v29;
  id v30[2];
  std::__shared_weak_count *v31;
  id from;
  id location;
  void *v34;
  std::__shared_weak_count *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    v37 = "AVHapticServer.mm";
    v38 = 1024;
    v39 = 1033;
    v40 = 2080;
    v41 = "-[AVHapticServerInstance releaseClientResources]";
    v42 = 2048;
    v43 = clientID;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v6 = self->_master;
  objc_sync_enter(v6);
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    v8 = self->_master;
  }
  else
  {
    v8 = 0;
    v34 = 0;
    v35 = 0;
  }
  objc_initWeak(&location, v8);
  objc_initWeak(&from, self);
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHSRVScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v37 = "AVHapticServer.mm";
          v38 = 1024;
          v39 = 1039;
          v40 = 2080;
          v41 = "-[AVHapticServerInstance releaseClientResources]";
          _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopRunning on ACQ", buf, 0x1Cu);
        }

      }
    }
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3321888768;
  v28[2] = __48__AVHapticServerInstance_releaseClientResources__block_invoke;
  v28[3] = &unk_1E450C700;
  objc_copyWeak(&v29, &from);
  objc_copyWeak(v30, &location);
  v30[1] = v34;
  v31 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v28[4] = self;
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v13 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v13, v28, 0, (uint64_t)"-[AVHapticServerInstance releaseClientResources]", (uint64_t)"AVHapticServer.mm", 1043);

  if (_os_feature_enabled_impl() && -[AVHapticServerInstance runIncludesAudio](self, "runIncludesAudio"))
    (*(void (**)(HapticSession *, _QWORD))(*(_QWORD *)self->_hapticSession.__ptr_ + 56))(self->_hapticSession.__ptr_, 0);
  v14 = self->_master;
  v26 = v34;
  v27 = v35;
  if (v35)
  {
    v15 = (unint64_t *)&v35->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  -[AVHapticServer doReleaseClientResources:](v14, "doReleaseClientResources:", &v26);
  v17 = v27;
  if (v27)
  {
    v18 = (unint64_t *)&v27->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v31;
  if (v31)
  {
    v21 = (unint64_t *)&v31->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  objc_destroyWeak(v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  v23 = v35;
  if (v35)
  {
    v24 = (unint64_t *)&v35->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  objc_sync_exit(v6);

}

- (void)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7
{
  int v9;
  id v12;
  NSObject *v13;
  id v14;
  unint64_t clientID;
  AVHapticServer *v16;
  AVHapticServer *master;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD *v24;
  int v25;
  float v26;
  NSObject *v27;
  void *v28;
  unsigned int v29;
  const char *v30;
  const char *v31;
  int v32;
  const char *v33;
  int started;
  AudioUnitElement v35;
  int CustomZoneVelocity;
  int v37;
  NSObject *v38;
  int v39;
  __int128 v40;
  __int128 v41;
  int v42;
  uint64_t v43;
  OpaqueAudioComponentInstance *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t *p_shared_owners;
  unint64_t v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  unsigned int *v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  std::__shared_weak_count *v66;
  BOOL v67;
  BOOL v68;
  id v69;
  __int16 v70;
  AudioUnitElement inElement;
  AudioUnitElement v72[2];
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint8_t v77[4];
  const char *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  int v84;
  _BYTE buf[12];
  __int16 v86;
  _BYTE v87[26];
  __int128 v88;
  __int16 v89;
  int v90;
  uint64_t v91;
  uint64_t v92;

  v9 = a5;
  v92 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v63 = a4;
  v64 = a6;
  v12 = a7;
  if (kHCARScope)
  {
    v13 = *(id *)kHCARScope;
    if (!v13)
      goto LABEL_8;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v86 = 1024;
    *(_DWORD *)v87 = 1053;
    *(_WORD *)&v87[4] = 2080;
    *(_QWORD *)&v87[6] = "-[AVHapticServerInstance createCustomAudioEvent:format:frames:options:reply:]";
    *(_WORD *)&v87[14] = 2048;
    *(_QWORD *)&v87[16] = clientID;
    _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v16 = self->_master;
  objc_sync_enter(v16);
  master = self->_master;
  if (!master)
  {
    v66 = 0;
    goto LABEL_26;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v65)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    goto LABEL_61;
  }
  v60 = objc_msgSend(objc_retainAutorelease(v62), "bytes");
  v61 = objc_msgSend(v63, "streamDescription");
  if (kHCARScope)
  {
    if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
    {
      v18 = *(id *)kHCARScope;
      if (v18)
      {
        v19 = v18;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v20 = *(_QWORD *)(v65 + 24);
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "ClientEntry.mm";
          v86 = 1024;
          *(_DWORD *)v87 = 443;
          *(_WORD *)&v87[4] = 2080;
          *(_QWORD *)&v87[6] = "createCustomAudioEvent";
          *(_WORD *)&v87[14] = 1024;
          *(_DWORD *)&v87[16] = v20;
          _os_log_impl(&dword_1A0F4D000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x", buf, 0x22u);
        }

      }
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(v65 + 224) + 424);
  if (kHCARScope)
  {
    if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
    {
      v22 = *(id *)kHCARScope;
      if (v22)
      {
        v23 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AudioEventManager.mm";
          v86 = 1024;
          *(_DWORD *)v87 = 34;
          *(_WORD *)&v87[4] = 2080;
          *(_QWORD *)&v87[6] = "createCustomAudioEvent";
          _os_log_impl(&dword_1A0F4D000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Requesting new event from synth", buf, 0x1Cu);
        }

      }
    }
  }
  std::mutex::lock((std::mutex *)(v21 + 8));
  v24 = *(_QWORD **)v21;
  v25 = *(unsigned __int16 *)(*(_QWORD *)v21 + 544);
  v26 = *(float *)(*(_QWORD *)v21 + 556);
  inElement = 0;
  v69 = v64;
  v70 = 0;
  v68 = 1;
  CACFDictionary::GetBool((CACFDictionary *)&v69, CFSTR("UseVolumeEnvelope"), &v68);
  v67 = 0;
  CACFDictionary::GetBool((CACFDictionary *)&v69, CFSTR("LoopEnabled"), &v67);
  v59 = v9;
  if (kHCARScope)
  {
    v27 = *(NSObject **)kHCARScope;
    if (!*(_QWORD *)kHCARScope)
      goto LABEL_35;
  }
  else
  {
    v27 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_QWORD *)&buf[4] = "HapticAudioUnit.cpp";
    v86 = 1024;
    if (v67)
      v30 = "looped";
    else
      v30 = "unlooped";
    v31 = "with";
    *(_DWORD *)v87 = 1072;
    *(_QWORD *)&v87[6] = "createCustomAudioEvent";
    *(_DWORD *)buf = 136316162;
    *(_WORD *)&v87[4] = 2080;
    *(_WORD *)&v87[14] = 2080;
    if (!v68)
      v31 = "without";
    *(_QWORD *)&v87[16] = v30;
    *(_WORD *)&v87[24] = 2080;
    *(_QWORD *)&v88 = v31;
    _os_log_impl(&dword_1A0F4D000, v27, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding layer/zone/waveform for %s custom audio event %s envelope", buf, 0x30u);
  }
LABEL_35:
  if (v68)
    v32 = 10;
  else
    v32 = 11;
  if (HapticAudioUnit::getLayerWithKey((HapticAudioUnit *)(v24 + 17), v32, &inElement))
  {
    if (v68)
      v33 = "Custom Audio Waveforms";
    else
      v33 = "Custom Audio Waveforms No Envelope";
    *(_QWORD *)buf = CFStringCreateWithCString(0, v33, 0x600u);
    started = HapticAudioUnit::addLayer((HapticAudioUnit *)(v24 + 17), 0, v25, v32, *(const __CFString **)buf, &inElement);
    if (started)
      goto LABEL_45;
    v35 = inElement;
    started = HapticAudioUnit::addDefaultGainConnections((HapticAudioUnit *)(v24 + 17), inElement, v26, 0, 0);
    if (started)
      goto LABEL_45;
    v72[0] = 0;
    started = HapticAudioUnit::addEnvelope((HapticAudioUnit *)(v24 + 17), v35, 0, v26, v72);
    if (started)
      goto LABEL_45;
    if (v68)
    {
      started = HapticAudioUnit::addCustomAudioEnvelopeConnections((HapticAudioUnit *)(v24 + 17), v35, v72[0]);
      if (started)
        goto LABEL_45;
    }
    started = HapticAudioUnit::addPitchConnection((HapticAudioUnit *)(v24 + 17), v35, 0, 4.0);
    if (started
      || (started = HapticAudioUnit::addFilterConnection((HapticAudioUnit *)(v24 + 17), v35, 24000.0, 2048.0)) != 0
      || (started = HapticAudioUnit::addCustomAudioOffsetStartTimeConnection((HapticAudioUnit *)(v24 + 17), v35)) != 0)
    {
LABEL_45:
      Smart<__CFString const*>::~Smart((const void **)buf);
LABEL_46:
      v29 = 0;
      goto LABEL_47;
    }
    Smart<__CFString const*>::~Smart((const void **)buf);
  }
  else
  {
    v35 = inElement;
  }
  CustomZoneVelocity = HapticAudioUnit::getCustomZoneVelocity((HapticAudioUnit *)(v24 + 17), v35);
  if (CustomZoneVelocity == -1)
  {
    if (kHCARScope)
    {
      v55 = *(NSObject **)kHCARScope;
      if (!*(_QWORD *)kHCARScope)
      {
LABEL_90:
        v29 = 0;
        started = -4825;
        goto LABEL_47;
      }
    }
    else
    {
      v55 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "HapticAudioUnit.cpp";
      v86 = 1024;
      *(_DWORD *)v87 = 1107;
      *(_WORD *)&v87[4] = 2080;
      *(_QWORD *)&v87[6] = "createCustomAudioEvent";
      _os_log_impl(&dword_1A0F4D000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unable to find a velocity slot for this event", buf, 0x1Cu);
    }
    goto LABEL_90;
  }
  v58 = CustomZoneVelocity;
  v37 = *(_DWORD *)(v61 + 24);
  if (kHPRSScope)
  {
    if ((*(_BYTE *)(kHPRSScope + 8) & 1) != 0)
    {
      v38 = *(NSObject **)kHPRSScope;
      if (*(_QWORD *)kHPRSScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kHPRSScope, OS_LOG_TYPE_DEBUG))
        {
          v39 = *(_DWORD *)(v61 + 28);
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = "HapticAudioUnit.cpp";
          v86 = 1024;
          *(_DWORD *)v87 = 39;
          *(_WORD *)&v87[4] = 2080;
          *(_QWORD *)&v87[6] = "addAudioSample";
          *(_WORD *)&v87[14] = 2048;
          *(_QWORD *)&v87[16] = v60;
          *(_WORD *)&v87[24] = 1024;
          LODWORD(v88) = v37 * v59;
          WORD2(v88) = 1024;
          *(_DWORD *)((char *)&v88 + 6) = v39;
          WORD5(v88) = 1024;
          HIDWORD(v88) = v59;
          v89 = 1024;
          v90 = v37;
          _os_log_impl(&dword_1A0F4D000, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding raw audio sample %p, size %u bytes. Raw audio has %u channels, %u frames, %u Bytes per frame", buf, 0x3Eu);
        }
      }
    }
  }
  *(_QWORD *)v72 = v60;
  v73 = (v37 * v59);
  v40 = *(_OWORD *)v61;
  v41 = *(_OWORD *)(v61 + 16);
  v76 = *(_QWORD *)(v61 + 32);
  v75 = v41;
  v74 = v40;
  v91 = 0x200000000;
  *(_QWORD *)buf = v72;
  v42 = (*(uint64_t (**)(_QWORD *))(v24[25] + 16))(v24 + 25);
  v43 = v24[24];
  if (v43)
    v44 = *(OpaqueAudioComponentInstance **)(v43 + 16);
  else
    v44 = 0;
  started = AudioUnitSetProperty(v44, 0x1030u, 4u, 0, buf, 0x48u);
  if (v42)
    (*(void (**)(_QWORD *))(v24[25] + 24))(v24 + 25);
  if (started)
  {
    if (kHPRSScope)
    {
      v56 = *(NSObject **)kHPRSScope;
      if (!*(_QWORD *)kHPRSScope)
        goto LABEL_46;
    }
    else
    {
      v56 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 136315906;
      v78 = "HapticAudioUnit.cpp";
      v79 = 1024;
      v80 = 46;
      v81 = 2080;
      v82 = "addAudioSample";
      v83 = 1024;
      v84 = started;
      _os_log_impl(&dword_1A0F4D000, v56, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unable to load generated sample: err %d", v77, 0x22u);
    }
    goto LABEL_46;
  }
  started = HapticAudioUnit::addZoneForSample((HapticAudioUnit *)(v24 + 17), v91, v35, v32, v58, v67, 1, 0, (const __CFString *)buf, v57);
  v29 = v32 | (v58 << 8);
LABEL_47:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v69);
  std::mutex::unlock((std::mutex *)(v21 + 8));
  if (started)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), started, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = *(_QWORD *)(v21 + 272);
    *(_QWORD *)buf = v21 + 96;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v21 + 96));
    *(_QWORD *)&v87[2] = v21 + 72;
    *(_QWORD *)&v87[10] = v21 + 264;
    *(_QWORD *)&v87[18] = v45;
    *(_BYTE *)(v21 + 264) = 1;
    std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v21 + 72), COERCE_DOUBLE(v29 | 0x100000000));
    **(_BYTE **)&v87[10] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    v46 = v65;
    v47 = atomic_load((unsigned int *)(v65 + 120));
    v48 = *(_QWORD *)(v46 + 904);
    *(_QWORD *)buf = v46 + 728;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v46 + 728));
    v49 = 0x100000000;
    if (v47 > 1)
      v49 = 0x200000000;
    *(_QWORD *)&v87[2] = v65 + 704;
    *(_QWORD *)&v87[10] = v65 + 896;
    *(_QWORD *)&v87[18] = v48;
    *(_BYTE *)(v65 + 896) = 1;
    std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v65 + 704), COERCE_DOUBLE(v49 | v29));
    **(_BYTE **)&v87[10] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    v28 = 0;
  }
LABEL_61:
  if (v66)
  {
    p_shared_owners = (unint64_t *)&v66->__shared_owners_;
    do
      v51 = __ldaxr(p_shared_owners);
    while (__stlxr(v51 - 1, p_shared_owners));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
  objc_sync_exit(v16);

  if (kHCARScope)
  {
    if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
    {
      v52 = *(id *)kHCARScope;
      if (v52)
      {
        v53 = v52;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          v54 = _Block_copy(v12);
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          v86 = 1024;
          *(_DWORD *)v87 = 1068;
          *(_WORD *)&v87[4] = 2080;
          *(_QWORD *)&v87[6] = "-[AVHapticServerInstance createCustomAudioEvent:format:frames:options:reply:]";
          *(_WORD *)&v87[14] = 2048;
          *(_QWORD *)&v87[16] = v54;
          *(_WORD *)&v87[24] = 1024;
          LODWORD(v88) = v29;
          WORD2(v88) = 2112;
          *(_QWORD *)((char *)&v88 + 6) = v28;
          _os_log_impl(&dword_1A0F4D000, v53, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with eventID %u and error %@", buf, 0x36u);

        }
      }
    }
  }
  (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, v29, v28);

}

- (void)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5
{
  int v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  unint64_t clientID;
  AVHapticServer *v13;
  AVHapticServer *master;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD *v21;
  int v22;
  float v23;
  NSObject *v24;
  void *v25;
  unsigned int v26;
  int LayerWithKey;
  NSObject *v28;
  int v29;
  _BOOL4 v30;
  const char *v31;
  const __CFString *v32;
  int v33;
  AudioUnitElement v34;
  uint64_t v35;
  OpaqueAudioComponentInstance *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  AudioUnitElement v46;
  int CustomZoneVelocity;
  uint64_t v48;
  OpaqueAudioComponentInstance *v49;
  NSObject *v50;
  OSStatus v51;
  NSObject *v52;
  int v53;
  const char *v54;
  NSObject *v55;
  uint32_t v56;
  unsigned int *v57;
  int v58;
  int v59;
  id v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  AudioUnitElement inData;
  BOOL v64;
  BOOL v65;
  id v66;
  __int16 v67;
  AudioUnitElement v68[2];
  AudioUnitElement outData;
  AudioUnitElement inElement;
  _BYTE buf[12];
  __int16 v72;
  _BYTE v73[26];
  unsigned int v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v6 = a3;
  v77 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (kHCARScope)
  {
    v10 = *(id *)kHCARScope;
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v72 = 1024;
    *(_DWORD *)v73 = 1074;
    *(_WORD *)&v73[4] = 2080;
    *(_QWORD *)&v73[6] = "-[AVHapticServerInstance copyCustomAudioEvent:options:reply:]";
    *(_WORD *)&v73[14] = 2048;
    *(_QWORD *)&v73[16] = clientID;
    _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v13 = self->_master;
  objc_sync_enter(v13);
  master = self->_master;
  if (!master)
  {
    v62 = 0;
    goto LABEL_26;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v61)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    goto LABEL_71;
  }
  if (kHCARScope)
  {
    if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
    {
      v15 = *(id *)kHCARScope;
      if (v15)
      {
        v16 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v17 = *(_QWORD *)(v61 + 24);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "ClientEntry.mm";
          *(_DWORD *)v73 = 455;
          *(_WORD *)&v73[4] = 2080;
          v72 = 1024;
          *(_QWORD *)&v73[6] = "copyCustomAudioEvent";
          *(_WORD *)&v73[14] = 1024;
          *(_DWORD *)&v73[16] = v17;
          *(_WORD *)&v73[20] = 1024;
          *(_DWORD *)&v73[22] = v6;
          _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x eventID %u", buf, 0x28u);
        }

      }
    }
  }
  v18 = *(_QWORD *)(*(_QWORD *)(v61 + 224) + 424);
  if (kHCARScope)
  {
    if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
    {
      v19 = *(id *)kHCARScope;
      if (v19)
      {
        v20 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "AudioEventManager.mm";
          v72 = 1024;
          *(_DWORD *)v73 = 47;
          *(_WORD *)&v73[4] = 2080;
          *(_QWORD *)&v73[6] = "copyCustomAudioEvent";
          *(_WORD *)&v73[14] = 1024;
          *(_DWORD *)&v73[16] = v6;
          _os_log_impl(&dword_1A0F4D000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Requesting copy of event ID %u from synth", buf, 0x22u);
        }

      }
    }
  }
  v60 = v8;
  std::mutex::lock((std::mutex *)(v18 + 8));
  v21 = *(_QWORD **)v18;
  v22 = *(unsigned __int16 *)(*(_QWORD *)v18 + 544);
  v23 = *(float *)(*(_QWORD *)v18 + 556);
  *(_QWORD *)v68 = 0;
  v66 = v8;
  v67 = 0;
  v65 = 1;
  CACFDictionary::GetBool((CACFDictionary *)&v66, CFSTR("UseVolumeEnvelope"), &v65);
  v64 = 0;
  CACFDictionary::GetBool((CACFDictionary *)&v66, CFSTR("LoopEnabled"), &v64);
  if (kHCARScope)
  {
    v24 = *(NSObject **)kHCARScope;
    if (!*(_QWORD *)kHCARScope)
      goto LABEL_30;
  }
  else
  {
    v24 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "HapticAudioUnit.cpp";
    v72 = 1024;
    *(_DWORD *)v73 = 1132;
    *(_WORD *)&v73[4] = 2080;
    *(_QWORD *)&v73[6] = "copyCustomAudioEvent";
    *(_WORD *)&v73[14] = 1024;
    *(_DWORD *)&v73[16] = v6;
    _os_log_impl(&dword_1A0F4D000, v24, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding new zone from a copy of the sampleID for audio event ID %u", buf, 0x22u);
  }
LABEL_30:
  if (HapticAudioUnit::getLayerWithKey((HapticAudioUnit *)(v21 + 17), 10, &v68[1]))
  {
    LayerWithKey = HapticAudioUnit::getLayerWithKey((HapticAudioUnit *)(v21 + 17), 11, &v68[1]);
    if (LayerWithKey)
    {
      if (kHCARScope)
      {
        v28 = *(NSObject **)kHCARScope;
        if (!*(_QWORD *)kHCARScope)
          goto LABEL_52;
      }
      else
      {
        v28 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "HapticAudioUnit.cpp";
        v72 = 1024;
        *(_DWORD *)v73 = 1137;
        *(_WORD *)&v73[4] = 2080;
        *(_QWORD *)&v73[6] = "copyCustomAudioEvent";
        _os_log_impl(&dword_1A0F4D000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unable to access layers for custom events", buf, 0x1Cu);
      }
      goto LABEL_52;
    }
  }
  if (v65)
    v29 = 10;
  else
    v29 = 11;
  if (!HapticAudioUnit::getLayerWithKey((HapticAudioUnit *)(v21 + 17), v29, v68))
  {
LABEL_59:
    inElement = 0;
    if (HapticAudioUnit::getZoneWithVelocity((HapticAudioUnit *)(v21 + 17), v68[1], BYTE1(v6), &inElement))goto LABEL_64;
    outData = 0;
    *(_DWORD *)buf = 4;
    v35 = v21[24];
    v36 = v35 ? *(OpaqueAudioComponentInstance **)(v35 + 16) : 0;
    if (AudioUnitGetProperty(v36, 0x1068u, 7u, inElement, &outData, (UInt32 *)buf))
      goto LABEL_64;
    inData = outData;
    if (outData == -1)
      goto LABEL_64;
    v46 = v68[0];
    CustomZoneVelocity = HapticAudioUnit::getCustomZoneVelocity((HapticAudioUnit *)(v21 + 17), v68[0]);
    if (CustomZoneVelocity == -1)
    {
      if (kHCARScope)
      {
        v50 = *(NSObject **)kHCARScope;
        if (!*(_QWORD *)kHCARScope)
          goto LABEL_64;
      }
      else
      {
        v50 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "HapticAudioUnit.cpp";
        v72 = 1024;
        *(_DWORD *)v73 = 1159;
        *(_WORD *)&v73[4] = 2080;
        *(_QWORD *)&v73[6] = "copyCustomAudioEvent";
        v54 = "%25s:%-5d %s: Unable to find a velocity slot for this event";
        v55 = v50;
        v56 = 28;
        goto LABEL_109;
      }
    }
    else
    {
      v59 = (*(uint64_t (**)(_QWORD *))(v21[25] + 16))(v21 + 25);
      v48 = v21[24];
      if (v48)
        v49 = *(OpaqueAudioComponentInstance **)(v48 + 16);
      else
        v49 = 0;
      v51 = AudioUnitSetProperty(v49, 0x1033u, 4u, 0, &inData, 4u);
      if (v59)
        (*(void (**)(_QWORD *))(v21[25] + 24))(v21 + 25);
      if (!v51)
      {
        v53 = HapticAudioUnit::addZoneForSample((HapticAudioUnit *)(v21 + 17), inData, v46, v29, CustomZoneVelocity, v64, 1, 0, (const __CFString *)buf, v57);
        if (v53)
          v26 = 0;
        else
          v26 = v29 | (CustomZoneVelocity << 8);
        if (v53)
          LayerWithKey = -1;
        else
          LayerWithKey = 0;
        goto LABEL_65;
      }
      if (kHCARScope)
      {
        v52 = *(NSObject **)kHCARScope;
        if (!*(_QWORD *)kHCARScope)
          goto LABEL_64;
      }
      else
      {
        v52 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "HapticAudioUnit.cpp";
        v72 = 1024;
        *(_DWORD *)v73 = 1165;
        *(_WORD *)&v73[4] = 2080;
        *(_QWORD *)&v73[6] = "copyCustomAudioEvent";
        *(_WORD *)&v73[14] = 1024;
        *(_DWORD *)&v73[16] = inData;
        v54 = "%25s:%-5d %s: Unable to reference sampleID %u";
        v55 = v52;
        v56 = 34;
LABEL_109:
        _os_log_impl(&dword_1A0F4D000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);
      }
    }
LABEL_64:
    v26 = 0;
    LayerWithKey = -1;
    goto LABEL_65;
  }
  v58 = v29;
  v30 = v65;
  inElement = 0;
  if (v65)
    v31 = "Custom Audio Waveforms";
  else
    v31 = "Custom Audio Waveforms No Envelope";
  v32 = CFStringCreateWithCString(0, v31, 0x600u);
  *(_QWORD *)buf = v32;
  if (v30)
    v33 = 10;
  else
    v33 = 11;
  LayerWithKey = HapticAudioUnit::addLayer((HapticAudioUnit *)(v21 + 17), 0, v22, v33, v32, &inElement);
  if (!LayerWithKey)
  {
    v34 = inElement;
    LayerWithKey = HapticAudioUnit::addDefaultGainConnections((HapticAudioUnit *)(v21 + 17), inElement, v23, 0, 0);
    if (!LayerWithKey)
    {
      outData = 0;
      LayerWithKey = HapticAudioUnit::addEnvelope((HapticAudioUnit *)(v21 + 17), v34, 0, v23, &outData);
      if (!LayerWithKey
        && (!v30
         || (LayerWithKey = HapticAudioUnit::addCustomAudioEnvelopeConnections((HapticAudioUnit *)(v21 + 17), v34, outData)) == 0))
      {
        LayerWithKey = HapticAudioUnit::addPitchConnection((HapticAudioUnit *)(v21 + 17), v34, 0, 4.0);
        if (!LayerWithKey)
        {
          LayerWithKey = HapticAudioUnit::addFilterConnection((HapticAudioUnit *)(v21 + 17), v34, 24000.0, 2048.0);
          if (!LayerWithKey)
          {
            LayerWithKey = HapticAudioUnit::addCustomAudioOffsetStartTimeConnection((HapticAudioUnit *)(v21 + 17), v34);
            if (!LayerWithKey)
            {
              v68[0] = v34;
              Smart<__CFString const*>::~Smart((const void **)buf);
              v29 = v58;
              goto LABEL_59;
            }
          }
        }
      }
    }
  }
  Smart<__CFString const*>::~Smart((const void **)buf);
LABEL_52:
  v26 = 0;
LABEL_65:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v66);
  std::mutex::unlock((std::mutex *)(v18 + 8));
  if (LayerWithKey)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), LayerWithKey, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = *(_QWORD *)(v18 + 272);
    *(_QWORD *)buf = v18 + 96;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v18 + 96));
    *(_QWORD *)&v73[2] = v18 + 72;
    *(_QWORD *)&v73[10] = v18 + 264;
    *(_QWORD *)&v73[18] = v37;
    *(_BYTE *)(v18 + 264) = 1;
    std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v18 + 72), COERCE_DOUBLE(v26 | 0x100000000));
    **(_BYTE **)&v73[10] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    v38 = atomic_load((unsigned int *)(v61 + 120));
    v39 = *(_QWORD *)(v61 + 904);
    *(_QWORD *)buf = v61 + 728;
    buf[8] = 1;
    std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v61 + 728));
    v40 = 0x100000000;
    if (v38 > 1)
      v40 = 0x200000000;
    *(_QWORD *)&v73[2] = v61 + 704;
    *(_QWORD *)&v73[10] = v61 + 896;
    *(_QWORD *)&v73[18] = v39;
    *(_BYTE *)(v61 + 896) = 1;
    std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v61 + 704), COERCE_DOUBLE(v40 | v26));
    **(_BYTE **)&v73[10] = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    v25 = 0;
  }
  v8 = v60;
LABEL_71:
  if (v62)
  {
    p_shared_owners = (unint64_t *)&v62->__shared_owners_;
    do
      v42 = __ldaxr(p_shared_owners);
    while (__stlxr(v42 - 1, p_shared_owners));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
  objc_sync_exit(v13);

  if (kHCARScope)
  {
    if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
    {
      v43 = *(id *)kHCARScope;
      if (v43)
      {
        v44 = v43;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v45 = _Block_copy(v9);
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          v72 = 1024;
          *(_DWORD *)v73 = 1087;
          *(_WORD *)&v73[4] = 2080;
          *(_QWORD *)&v73[6] = "-[AVHapticServerInstance copyCustomAudioEvent:options:reply:]";
          *(_WORD *)&v73[14] = 2048;
          *(_QWORD *)&v73[16] = v45;
          *(_WORD *)&v73[24] = 1024;
          v74 = v26;
          v75 = 2112;
          v76 = v25;
          _os_log_impl(&dword_1A0F4D000, v44, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with eventID %u and error %@", buf, 0x36u);

        }
      }
    }
  }
  (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, v26, v25);

}

- (void)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  unsigned int v4;
  id v6;
  NSObject *v7;
  id v8;
  unint64_t clientID;
  AVHapticServer *v10;
  AVHapticServer *master;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  BOOL v28;
  uint64_t *v29;
  NSObject *v30;
  id v31;
  id v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  _BYTE buf[12];
  __int16 v44;
  _BYTE v45[26];
  NSObject *v46;
  uint8_t v47[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v4 = a3;
  v55 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (kHCARScope)
  {
    v7 = *(id *)kHCARScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v44 = 1024;
    *(_DWORD *)v45 = 1093;
    *(_WORD *)&v45[4] = 2080;
    *(_QWORD *)&v45[6] = "-[AVHapticServerInstance referenceCustomAudioEvent:reply:]";
    *(_WORD *)&v45[14] = 2048;
    *(_QWORD *)&v45[16] = clientID;
    *(_WORD *)&v45[24] = 1024;
    LODWORD(v46) = v4;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx, eventID %u", buf, 0x2Cu);
  }

LABEL_8:
  v10 = self->_master;
  objc_sync_enter(v10);
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v41)
    {
      if (kHCARScope)
      {
        if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
        {
          v12 = *(id *)kHCARScope;
          if (v12)
          {
            v13 = v12;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              v14 = *(_QWORD *)(v41 + 24);
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = "ClientEntry.mm";
              *(_DWORD *)v45 = 467;
              *(_WORD *)&v45[4] = 2080;
              v44 = 1024;
              *(_QWORD *)&v45[6] = "referenceCustomAudioEvent";
              *(_WORD *)&v45[14] = 1024;
              *(_DWORD *)&v45[16] = v14;
              *(_WORD *)&v45[20] = 1024;
              *(_DWORD *)&v45[22] = v4;
              _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, eventID %u", buf, 0x28u);
            }

          }
        }
      }
      v15 = *(_QWORD *)(v41 + 904);
      *(_QWORD *)buf = v41 + 728;
      buf[8] = 1;
      std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v41 + 728));
      *(_QWORD *)&v45[2] = v41 + 704;
      *(_QWORD *)&v45[10] = v41 + 896;
      *(_QWORD *)&v45[18] = v15;
      *(_BYTE *)(v41 + 896) = 1;
      LOBYTE(v15) = std::__tree<std::__value_type<unsigned int const,unsigned int>,std::__map_value_compare<unsigned int const,std::__value_type<unsigned int const,unsigned int>,std::less<unsigned int const>,true>,std::allocator<std::__value_type<unsigned int const,unsigned int>>>::__emplace_unique_impl<std::tuple<unsigned int const,unsigned int> &>((uint64_t **)(v41 + 704), COERCE_DOUBLE(v4 | 0x100000000));
      **(_BYTE **)&v45[10] = 0;
      std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
      if ((v15 & 1) == 0)
      {
        if (kHCARScope)
        {
          v16 = *(id *)kHCARScope;
          if (!v16)
            goto LABEL_52;
        }
        else
        {
          v16 = MEMORY[0x1E0C81028];
          v31 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "ClientEntry.mm";
          v44 = 1024;
          *(_DWORD *)v45 = 471;
          *(_WORD *)&v45[4] = 2080;
          *(_QWORD *)&v45[6] = "referenceCustomAudioEvent";
          _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: event was already present in map, so DOING NOTHING", buf, 0x1Cu);
        }

        goto LABEL_71;
      }
      if (kHCARScope)
      {
        if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
        {
          v18 = *(id *)kHCARScope;
          if (v18)
          {
            v19 = v18;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "ClientEntry.mm";
              v44 = 1024;
              *(_DWORD *)v45 = 475;
              *(_WORD *)&v45[4] = 2080;
              *(_QWORD *)&v45[6] = "referenceCustomAudioEvent";
              _os_log_impl(&dword_1A0F4D000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: added event to local map and bumping manager's reference", buf, 0x1Cu);
            }

          }
        }
      }
      v20 = *(_QWORD *)(*(_QWORD *)(v41 + 224) + 424);
      v21 = *(_QWORD *)(v20 + 272);
      *(_QWORD *)buf = v20 + 96;
      buf[8] = 1;
      std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v20 + 96));
      v22 = (_BYTE *)(v20 + 264);
      v25 = *(_QWORD *)(v20 + 80);
      v24 = v20 + 80;
      v23 = v25;
      *(_QWORD *)&v45[2] = v24 - 8;
      *(_QWORD *)&v45[10] = v22;
      *(_QWORD *)&v45[18] = v21;
      *(_BYTE *)(v24 + 184) = 1;
      if (v25)
      {
        v26 = v24;
        do
        {
          v27 = *(_DWORD *)(v23 + 28);
          v28 = v27 >= v4;
          if (v27 >= v4)
            v29 = (uint64_t *)v23;
          else
            v29 = (uint64_t *)(v23 + 8);
          if (v28)
            v26 = v23;
          v23 = *v29;
        }
        while (*v29);
        if (v26 != v24 && *(_DWORD *)(v26 + 28) <= v4)
        {
          if (kRSRVScope)
          {
            if ((*(_BYTE *)(kRSRVScope + 8) & 1) != 0)
            {
              v38 = *(id *)kRSRVScope;
              if (v38)
              {
                v39 = v38;
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  v40 = *(_DWORD *)(v26 + 32) + 1;
                  *(_DWORD *)v47 = 136315906;
                  v48 = "AudioEventManager.mm";
                  v49 = 1024;
                  v50 = 61;
                  v51 = 2080;
                  v52 = "operator()";
                  v53 = 1024;
                  v54 = v40;
                  _os_log_impl(&dword_1A0F4D000, v39, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: found it: refcount will be %u", v47, 0x22u);
                }

                v22 = *(_BYTE **)&v45[10];
              }
            }
          }
          ++*(_DWORD *)(v26 + 32);
          *v22 = 0;
          std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
LABEL_71:
          v16 = 0;
          goto LABEL_52;
        }
      }
      *v22 = 0;
      std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
      if (kRSRVScope)
      {
        v30 = *(id *)kRSRVScope;
        if (!v30)
        {
LABEL_50:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -1, 0);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_51;
        }
      }
      else
      {
        v30 = MEMORY[0x1E0C81028];
        v32 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "AudioEventManager.mm";
        v44 = 1024;
        *(_DWORD *)v45 = 65;
        *(_WORD *)&v45[4] = 2080;
        *(_QWORD *)&v45[6] = "referenceCustomAudioEvent";
        *(_WORD *)&v45[14] = 1024;
        *(_DWORD *)&v45[16] = v4;
        _os_log_impl(&dword_1A0F4D000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Event ID %u not found", buf, 0x22u);
      }

      goto LABEL_50;
    }
  }
  else
  {
    v41 = 0;
    v42 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0, v41);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_51:
  v16 = v17;
LABEL_52:
  if (v42)
  {
    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
    do
      v34 = __ldaxr(p_shared_owners);
    while (__stlxr(v34 - 1, p_shared_owners));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  objc_sync_exit(v10);

  if (kHCARScope)
  {
    if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
    {
      v35 = *(id *)kHCARScope;
      if (v35)
      {
        v36 = v35;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v37 = _Block_copy(v6);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          v44 = 1024;
          *(_DWORD *)v45 = 1105;
          *(_WORD *)&v45[4] = 2080;
          *(_QWORD *)&v45[6] = "-[AVHapticServerInstance referenceCustomAudioEvent:reply:]";
          *(_WORD *)&v45[14] = 2048;
          *(_QWORD *)&v45[16] = v37;
          *(_WORD *)&v45[24] = 2112;
          v46 = v16;
          _os_log_impl(&dword_1A0F4D000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);

        }
      }
    }
  }
  (*((void (**)(id, NSObject *))v6 + 2))(v6, v16);

}

- (void)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  unsigned int v4;
  id v6;
  NSObject *v7;
  id v8;
  unint64_t clientID;
  AVHapticServer *v10;
  AVHapticServer *master;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  int v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  _BYTE v32[10];
  void *v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (kHCARScope)
  {
    v7 = *(id *)kHCARScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    v26 = "AVHapticServer.mm";
    v27 = 1024;
    v28 = 1113;
    v29 = 2080;
    v30 = "-[AVHapticServerInstance releaseCustomAudioEvent:reply:]";
    v31 = 2048;
    *(_QWORD *)v32 = clientID;
    *(_WORD *)&v32[8] = 1024;
    LODWORD(v33) = v4;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx, eventID %u", buf, 0x2Cu);
  }

LABEL_8:
  v10 = self->_master;
  objc_sync_enter(v10);
  master = self->_master;
  if (!master)
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_14;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v23)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0, v23);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (!kHCARScope)
  {
    v12 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_17;
  }
  v12 = *(id *)kHCARScope;
  if (v12)
  {
LABEL_17:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_QWORD *)(v23 + 24);
      *(_DWORD *)buf = 136316162;
      v26 = "ClientEntry.mm";
      v28 = 516;
      v29 = 2080;
      v27 = 1024;
      v30 = "releaseCustomAudioEvent";
      v31 = 1024;
      *(_DWORD *)v32 = v16;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v4;
      _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x eventID %u", buf, 0x28u);
    }

  }
  if (ClientEntry::sendRealTimeCommand(v23, 2, v4)
    || (v17 = ClientEntry::handleReleaseCustomAudioEvent((ClientEntry *)v23, v4)) == 0)
  {
    v14 = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v17, 0);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v14 = (void *)v13;
LABEL_24:
  if (v24)
  {
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  objc_sync_exit(v10);

  if (kHCARScope)
  {
    if ((*(_BYTE *)(kHCARScope + 8) & 1) != 0)
    {
      v20 = *(id *)kHCARScope;
      if (v20)
      {
        v21 = v20;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v22 = _Block_copy(v6);
          *(_DWORD *)buf = 136316162;
          v26 = "AVHapticServer.mm";
          v27 = 1024;
          v28 = 1125;
          v29 = 2080;
          v30 = "-[AVHapticServerInstance releaseCustomAudioEvent:reply:]";
          v31 = 2048;
          *(_QWORD *)v32 = v22;
          *(_WORD *)&v32[8] = 2112;
          v33 = v14;
          _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);

        }
      }
    }
  }
  (*((void (**)(id, void *))v6 + 2))(v6, v14);

}

- (void)loadHapticEvent:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  id v9;
  unint64_t clientID;
  AVHapticServer *master;
  int v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  int v17;
  HapticSynth *v18;
  int v19;
  int v20;
  id v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  unsigned int Count;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  OpaqueAudioComponentInstance *v36;
  id v37;
  int PropertyInfo;
  id v39;
  id v40;
  NSObject *v41;
  UInt32 v42;
  UInt32 v43;
  AudioUnitElement *v44;
  uint64_t v45;
  OpaqueAudioComponentInstance *v46;
  id v47;
  const CALog::Scope *v48;
  NSObject *v49;
  NSObject *v50;
  unint64_t v51;
  uint64_t v52;
  AudioUnitElement v53;
  AudioUnitElement v54;
  uint64_t v55;
  OpaqueAudioComponentInstance *v56;
  unint64_t v57;
  char v58;
  NSObject *v59;
  NSObject *v60;
  HapticSynth *v61;
  int v62;
  const CALog::Scope *v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  AudioUnitElement *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  __int16 outData;
  _QWORD v71[2];
  Boolean outWritable;
  UInt32 outDataSize;
  CFArrayRef theArray;
  __int16 v75;
  unsigned int v76;
  id v77;
  __int16 v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  unint64_t v86;
  __int16 v87;
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (kHSRVScope)
  {
    v8 = *(id *)kHSRVScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    v80 = "AVHapticServer.mm";
    v81 = 1024;
    v82 = 1131;
    v83 = 2080;
    v84 = "-[AVHapticServerInstance loadHapticEvent:reply:]";
    v85 = 2048;
    v86 = clientID;
    v87 = 2048;
    v88 = v6;
    _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx preset: %p", buf, 0x30u);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    v69 = 0;
    goto LABEL_15;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v68)
  {
LABEL_15:
    v14 = -4812;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v14, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = 0;
    goto LABEL_28;
  }
  v12 = atomic_load((unsigned int *)(v68 + 120));
  if (v12 > 1)
  {
    if (kHSRVScope)
    {
      v13 = *(id *)kHSRVScope;
      if (!v13)
      {
LABEL_26:
        v14 = -4806;
        goto LABEL_27;
      }
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v80 = "AVHapticServer.mm";
      v81 = 1024;
      v82 = 1141;
      v83 = 2080;
      v84 = "-[AVHapticServerInstance loadHapticEvent:reply:]";
      _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Player must be stopped to load a preset", buf, 0x1Cu);
    }

    goto LABEL_26;
  }
  v15 = -[AVHapticServer manager](self->_master, "manager");
  v16 = v15 + 30;
  v17 = (*(uint64_t (**)(_QWORD *))(v15[30] + 16))(v15 + 30);
  v18 = (HapticSynth *)v15[29];
  v77 = v6;
  v78 = 0;
  if (!v6)
  {
    if (kHPRSScope)
    {
      v27 = *(id *)kHPRSScope;
      if (!v27)
        goto LABEL_87;
    }
    else
    {
      v27 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v80 = "HapticSynth_Parser.mm";
      v81 = 1024;
      v82 = 207;
      v83 = 2080;
      v84 = "loadEventDictionary";
      _os_log_impl(&dword_1A0F4D000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Invalid event dictionary", buf, 0x1Cu);
    }
    goto LABEL_86;
  }
  v76 = 0;
  if (!CACFDictionary::GetUInt32((CACFDictionary *)&v77, CFSTR("TypeID"), &v76))
  {
    if (kHPRSScope)
    {
      v27 = *(id *)kHPRSScope;
      if (!v27)
        goto LABEL_87;
    }
    else
    {
      v27 = MEMORY[0x1E0C81028];
      v29 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v80 = "HapticSynth_Parser.mm";
      v81 = 1024;
      v82 = 129;
      v83 = 2080;
      v84 = "loadEventDictionary";
      _os_log_impl(&dword_1A0F4D000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Single event dictionary must provide a 'LoadAs' type key", buf, 0x1Cu);
    }
    goto LABEL_86;
  }
  switch(v76)
  {
    case 0x3E8u:
      v20 = 0;
      break;
    case 0x7D0u:
      v20 = 1;
      break;
    case 0xBB8u:
      v19 = 0;
      v20 = 1;
      goto LABEL_52;
    default:
      if (kHPRSScope)
      {
        v27 = *(id *)kHPRSScope;
        if (!v27)
          goto LABEL_87;
      }
      else
      {
        v27 = MEMORY[0x1E0C81028];
        v37 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v80 = "HapticSynth_Parser.mm";
        v81 = 1024;
        v82 = 124;
        v83 = 2080;
        v84 = "loadEventDictionary";
        _os_log_impl(&dword_1A0F4D000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Unrecognized event dictionary 'LoadAs' key", buf, 0x1Cu);
      }
LABEL_86:

LABEL_87:
      v23 = 0;
      PropertyInfo = -50;
      goto LABEL_88;
  }
  v19 = 1;
LABEL_52:
  if (!CACFDictionary::HasKey((CACFDictionary *)&v77, CFSTR("Layers")))
  {
    if (kHPRSScope)
    {
      v27 = *(id *)kHPRSScope;
      if (!v27)
        goto LABEL_87;
    }
    else
    {
      v27 = MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v80 = "HapticSynth_Parser.mm";
      v81 = 1024;
      v82 = 202;
      v83 = 2080;
      v84 = "loadEventDictionary";
      _os_log_impl(&dword_1A0F4D000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: No layers array", buf, 0x1Cu);
    }
    goto LABEL_86;
  }
  theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v75 = 257;
  CACFDictionary::GetCACFArray((CACFDictionary *)&v77, CFSTR("Layers"), (CACFArray *)&theArray);
  if (theArray)
    Count = CFArrayGetCount(theArray);
  else
    Count = 0;
  if (kHPRSScope)
  {
    v32 = *(id *)kHPRSScope;
    if (!v32)
      goto LABEL_73;
  }
  else
  {
    v32 = MEMORY[0x1E0C81028];
    v33 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v80 = "HapticSynth_Parser.mm";
    v81 = 1024;
    v82 = 136;
    v83 = 2080;
    v84 = "loadEventDictionary";
    v85 = 1024;
    LODWORD(v86) = Count;
    _os_log_impl(&dword_1A0F4D000, v32, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event has %u layers", buf, 0x22u);
  }

LABEL_73:
  if (!Count)
  {
    if (kHPRSScope)
    {
      v34 = *(id *)kHPRSScope;
      if (!v34)
        goto LABEL_101;
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v39 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v80 = "HapticSynth_Parser.mm";
      v81 = 1024;
      v82 = 138;
      v83 = 2080;
      v84 = "loadEventDictionary";
      _os_log_impl(&dword_1A0F4D000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Empty layers array", buf, 0x1Cu);
    }
    goto LABEL_100;
  }
  if (Count >= 3)
  {
    if (kHPRSScope)
    {
      v34 = *(id *)kHPRSScope;
      if (!v34)
        goto LABEL_101;
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v40 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v80 = "HapticSynth_Parser.mm";
      v81 = 1024;
      v82 = 142;
      v83 = 2080;
      v84 = "loadEventDictionary";
      _os_log_impl(&dword_1A0F4D000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Single event dictionary cannot have more than 2 layers", buf, 0x1Cu);
    }
LABEL_100:

LABEL_101:
    v23 = 0;
    PropertyInfo = -50;
    goto LABEL_161;
  }
  outDataSize = 0;
  outWritable = 0;
  v35 = *((_QWORD *)v18 + 24);
  if (v35)
    v36 = *(OpaqueAudioComponentInstance **)(v35 + 16);
  else
    v36 = 0;
  PropertyInfo = AudioUnitGetPropertyInfo(v36, 0x102Cu, 4u, 0, &outDataSize, &outWritable);
  if (PropertyInfo)
  {
    if (kHPRSScope)
    {
      v41 = *(id *)kHPRSScope;
      if (!v41)
      {
LABEL_112:

        v23 = 0;
        goto LABEL_161;
      }
    }
    else
    {
      v41 = MEMORY[0x1E0C81028];
      v47 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v80 = "HapticSynth_Parser.mm";
      v81 = 1024;
      v82 = 151;
      v83 = 2080;
      v84 = "loadEventDictionary";
      v85 = 1024;
      LODWORD(v86) = PropertyInfo;
      _os_log_impl(&dword_1A0F4D000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Call mSynthUnit.GetPropertyInfo(kAUSamplerProperty_LayerIDs, kAudioUnitScope_Part, 0, &propSize, &writable) failed with error %d", buf, 0x22u);
    }
    goto LABEL_112;
  }
  v42 = outDataSize;
  v43 = outDataSize & 0xFFFFFFFC;
  v44 = (AudioUnitElement *)operator new[]();
  outDataSize = v43;
  v45 = *((_QWORD *)v18 + 24);
  if (v45)
    v46 = *(OpaqueAudioComponentInstance **)(v45 + 16);
  else
    v46 = 0;
  PropertyInfo = AudioUnitGetProperty(v46, 0x102Cu, 4u, 0, v44, &outDataSize);
  if (PropertyInfo)
  {
    CALog::LogObjIfEnabled((CALog *)1, kHPRSScope, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v80 = "HapticSynth_Parser.mm";
      v81 = 1024;
      v82 = 155;
      v83 = 2080;
      v84 = "loadEventDictionary";
      v85 = 1024;
      LODWORD(v86) = PropertyInfo;
      _os_log_impl(&dword_1A0F4D000, v50, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Call mSynthUnit.CAAudioUnit::GetProperty(kAUSamplerProperty_LayerIDs, kAudioUnitScope_Part, 0, &existingLayers[0], &propSize) failed with error %d", buf, 0x22u);
    }
    goto LABEL_118;
  }
  v51 = 0;
  v71[0] = 0;
  v71[1] = 0;
  if (v42 < 4)
    goto LABEL_133;
  if (v42 >> 2 <= 1)
    v52 = 1;
  else
    v52 = v42 >> 2;
  v67 = v44;
  do
  {
    outData = 32512;
    v54 = *v44++;
    v53 = v54;
    *(_DWORD *)buf = 2;
    v55 = *((_QWORD *)v18 + 24);
    if (v55)
      v56 = *(OpaqueAudioComponentInstance **)(v55 + 16);
    else
      v56 = 0;
    PropertyInfo = AudioUnitGetProperty(v56, 0x1020u, 6u, v53, &outData, (UInt32 *)buf);
    if (PropertyInfo)
    {
      if (kHPRSScope)
      {
        v50 = *(id *)kHPRSScope;
        v44 = v67;
        if (!v50)
          goto LABEL_119;
      }
      else
      {
        v50 = MEMORY[0x1E0C81028];
        v66 = MEMORY[0x1E0C81028];
        v44 = v67;
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v80 = "HapticSynth_Parser.mm";
        v81 = 1024;
        v82 = 159;
        v83 = 2080;
        v84 = "loadEventDictionary";
        v85 = 1024;
        LODWORD(v86) = PropertyInfo;
        _os_log_impl(&dword_1A0F4D000, v50, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Call mSynthUnit.GetProperty(kAUSamplerProperty_KeyRange, kAudioUnitScope_Layer, existingLayers[l], &keyrange) failed with error %d", buf, 0x22u);
      }
LABEL_118:

LABEL_119:
      v23 = 0;
      goto LABEL_160;
    }
    if (HIBYTE(outData) != outData)
    {
      if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v80 = "HapticSynth_Parser.mm";
        v81 = 1024;
        v82 = 160;
        _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(keyrange.mHigh == keyrange.mLow) != 0 is false]: ", buf, 0x12u);
      }
      __break(1u);
    }
    if (outData < 0)
      std::__throw_out_of_range[abi:ne180100]("bitset set argument out of range");
    *(_QWORD *)((char *)v71 + (((unint64_t)HIBYTE(outData) >> 3) & 0x18)) |= 1 << SHIBYTE(outData);
    --v52;
  }
  while (v52);
  v51 = v71[0];
  v44 = v67;
LABEL_133:
  v57 = 0;
  while (2)
  {
    if ((v20 & v19) != 0)
    {
      if (v57 - 45 > 0x27)
        goto LABEL_145;
LABEL_144:
      if (((*(_QWORD *)((char *)v71 + ((v57 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v57) & 1) == 0)
        goto LABEL_153;
      goto LABEL_145;
    }
    if (!v19)
    {
      v58 = v20 ^ 1;
      if (v57 < 0x55)
        v58 = 1;
      if ((v58 & 1) == 0)
        goto LABEL_144;
LABEL_145:
      if (++v57 == 127)
      {
        CALog::LogObjIfEnabled((CALog *)1, kHPRSScope, v48);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v59;
        if (v59 && os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v80 = "HapticSynth_Parser.mm";
          v81 = 1024;
          v82 = 184;
          v83 = 2080;
          v84 = "loadEventDictionary";
          _os_log_impl(&dword_1A0F4D000, v60, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: No space left for additional event definitions", buf, 0x1Cu);
        }

        v23 = 0;
        PropertyInfo = -4899;
        goto LABEL_160;
      }
      continue;
    }
    break;
  }
  if (v57 > 0x2C || ((v51 >> v57) & 1) != 0)
    goto LABEL_145;
LABEL_153:
  v61 = v18;
  v62 = v57;
  PropertyInfo = HapticSynth::walkLayerList(v61, &theArray, v57, 64);
  if (PropertyInfo)
    v23 = 0;
  else
    v23 = v62 | 0x4000;
  CALog::LogObjIfEnabled((CALog *)5, kHSYNScope, v63);
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64 && os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v80 = "HapticSynth_Parser.mm";
    v81 = 1024;
    v82 = 198;
    v83 = 2080;
    v84 = "loadEventDictionary";
    v85 = 1024;
    LODWORD(v86) = v23;
    _os_log_impl(&dword_1A0F4D000, v65, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Custom event loaded with ID %u", buf, 0x22u);
  }

LABEL_160:
  MEMORY[0x1A1B07B1C](v44, 0x1000C8052888210);
LABEL_161:
  CACFArray::~CACFArray((CACFArray *)&theArray);
LABEL_88:
  CACFDictionary::~CACFDictionary((CACFDictionary *)&v77);
  if (v17)
    (*(void (**)(_QWORD *))(*v16 + 24))(v16);
  if (PropertyInfo)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), PropertyInfo, 0);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v24 = (void *)v22;
  }
  else
  {
    v24 = 0;
  }
  v7[2](v7, v23, v24);
  if (v69)
  {
    p_shared_owners = (unint64_t *)&v69->__shared_owners_;
    do
      v26 = __ldaxr(p_shared_owners);
    while (__stlxr(v26 - 1, p_shared_owners));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
      std::__shared_weak_count::__release_weak(v69);
    }
  }

}

- (void)loadHapticSequenceFromData:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  unint64_t clientID;
  AVHapticServer *master;
  unint64_t *p_shared_owners;
  unint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  _QWORD *v37;
  uint64_t v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  int v42;
  int v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  unint64_t *v52;
  unint64_t v53;
  _QWORD *v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  uint64_t v58;
  id v59;
  int v60;
  _BYTE buf[18];
  __int16 v62;
  _BYTE v63[30];
  _DWORD v64[3];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kHSEQScope)
  {
    v8 = *(id *)kHSEQScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1155;
    v62 = 2080;
    *(_QWORD *)v63 = "-[AVHapticServerInstance loadHapticSequenceFromData:reply:]";
    *(_WORD *)&v63[8] = 2048;
    *(_QWORD *)&v63[10] = clientID;
    *(_WORD *)&v63[18] = 2048;
    *(_QWORD *)&v63[20] = v6;
    *(_WORD *)&v63[28] = 1024;
    v64[0] = objc_msgSend(v6, "length");
    _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx data: %p length: %u", buf, 0x36u);
  }

LABEL_8:
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v54)
    {
      -[AVHapticServer manager](self->_master, "manager");
      if (v55)
      {
        p_shared_owners = (unint64_t *)&v55->__shared_owners_;
        do
          v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
      }
      v15 = v6;
      if (kHSEQScope)
      {
        v16 = *(id *)kHSEQScope;
        if (!v16)
          goto LABEL_22;
      }
      else
      {
        v16 = MEMORY[0x1E0C81028];
        v21 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v22 = v54[3];
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "ClientEntry.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1216;
        v62 = 2080;
        *(_QWORD *)v63 = "loadAndAddSequence";
        *(_WORD *)&v63[8] = 1024;
        *(_DWORD *)&v63[10] = v22;
        *(_WORD *)&v63[14] = 2048;
        *(_QWORD *)&v63[16] = v15;
        _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, sequenceData: %p", buf, 0x2Cu);
      }

LABEL_22:
      v23 = v54[11];
      *(_QWORD *)buf = v54[10];
      *(_QWORD *)&buf[8] = v23;
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 8);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      std::allocate_shared[abi:ne180100]<HapticSequence,std::allocator<HapticSequence>,std::shared_ptr<MuteManager>,void>(&v56, (__int128 *)buf);
      v26 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v27 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      v29 = v56;
      v30 = *(_QWORD *)(v54[28] + 232);
      v31 = v15;
      if (kHSEQScope)
      {
        v32 = *(id *)kHSEQScope;
        if (!v32)
          goto LABEL_37;
      }
      else
      {
        v32 = MEMORY[0x1E0C81028];
        v33 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v34 = *(_QWORD *)(*(_QWORD *)(v29 + 24) + 24);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "HapticSequence.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 52;
        v62 = 2080;
        *(_QWORD *)v63 = "load";
        *(_WORD *)&v63[8] = 1024;
        *(_DWORD *)&v63[10] = v34;
        _os_log_impl(&dword_1A0F4D000, v32, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Loading sequence %u", buf, 0x22u);
      }

LABEL_37:
      v35 = *(_QWORD *)(v29 + 24);
      v58 = v30;
      v59 = v31;
      v36 = v31;
      v60 = 0;
      *(_QWORD *)buf = &off_1E450EE60;
      *(_QWORD *)&buf[8] = &v60;
      *(_QWORD *)&v63[4] = buf;
      std::function<void ()(int)>::operator=((_QWORD *)(v35 + 520), (uint64_t)buf);
      v37 = *(_QWORD **)&v63[4];
      if (*(_BYTE **)&v63[4] == buf)
      {
        v38 = 4;
        v37 = buf;
      }
      else
      {
        if (!*(_QWORD *)&v63[4])
          goto LABEL_42;
        v38 = 5;
      }
      (*(void (**)(void))(*v37 + 8 * v38))();
LABEL_42:
      boost::msm::back::state_machine<SequenceFSM::StateFront,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>::process_event_internal<SequenceFSM::Load<NSData>>(v35 + 32, &v58);
      v39 = v60;

      if (v39)
      {
        v40 = 0;
        v19 = -1;
        v18 = 0.0;
      }
      else
      {
        v41 = *(_QWORD *)(v29 + 24);
        v19 = *(_QWORD *)(v41 + 24);
        v18 = *(double *)(v41 + 608);
        v42 = *(_DWORD *)(v41 + 596);
        v43 = *(_DWORD *)(v41 + 600);
        ClientEntry::addSequence((uint64_t)v54, &v56);
        v40 = v42 - v43;
      }
      v44 = v57;
      if (v57)
      {
        v45 = (unint64_t *)&v57->__shared_owners_;
        do
          v46 = __ldaxr(v45);
        while (__stlxr(v46 - 1, v45));
        if (!v46)
        {
          ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
          std::__shared_weak_count::__release_weak(v44);
        }
      }

      if (!v55)
        goto LABEL_54;
      v47 = (unint64_t *)&v55->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)())v55->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v55);
        if (v39)
          goto LABEL_55;
      }
      else
      {
LABEL_54:
        if (v39)
        {
LABEL_55:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v39, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:
          v17 = v40;
          goto LABEL_59;
        }
      }
      v20 = 0;
      goto LABEL_58;
    }
  }
  else
  {
    v55 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
  v17 = 0;
  v18 = 0.0;
  v19 = -1;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_59:
  if (kHSEQScope)
  {
    if ((*(_BYTE *)(kHSEQScope + 8) & 1) != 0)
    {
      v49 = *(id *)kHSEQScope;
      if (v49)
      {
        v50 = v49;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v51 = _Block_copy(v7);
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          *(_DWORD *)&buf[14] = 1172;
          v62 = 2080;
          *(_WORD *)&buf[12] = 1024;
          *(_QWORD *)v63 = "-[AVHapticServerInstance loadHapticSequenceFromData:reply:]";
          *(_WORD *)&v63[8] = 2048;
          *(_QWORD *)&v63[10] = v51;
          *(_WORD *)&v63[18] = 1024;
          *(_DWORD *)&v63[20] = v19;
          *(_WORD *)&v63[24] = 1024;
          *(_DWORD *)&v63[26] = v17;
          LOWORD(v64[0]) = 2112;
          *(_QWORD *)((char *)v64 + 2) = v20;
          _os_log_impl(&dword_1A0F4D000, v50, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with seqID %u, channelCount %u, and error %@", buf, 0x3Cu);

        }
      }
    }
  }
  (*((void (**)(id, uint64_t, uint64_t, void *, double))v7 + 2))(v7, v19, v17, v20, v18);

  if (v55)
  {
    v52 = (unint64_t *)&v55->__shared_owners_;
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }

}

- (void)loadHapticSequenceFromEvents:(id)a3 reply:(id)a4
{
  NSArray *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  unint64_t clientID;
  AVHapticServer *master;
  unint64_t *p_shared_owners;
  unint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  unint64_t *v27;
  unint64_t v28;
  ClientEntry *v29;
  std::__shared_weak_count *v30;
  unsigned int v31;
  double v32;
  _BYTE buf[12];
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = (NSArray *)a3;
  v7 = a4;
  if (kHSEQScope)
  {
    v8 = *(id *)kHSEQScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v34 = 1024;
    v35 = 1178;
    v36 = 2080;
    v37 = "-[AVHapticServerInstance loadHapticSequenceFromEvents:reply:]";
    v38 = 2048;
    v39 = clientID;
    v40 = 1024;
    v41 = -[NSArray count](v6, "count");
    _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx array of %u events", buf, 0x2Cu);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    v30 = 0;
    goto LABEL_20;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v29)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v18 = 0.0;
    v17 = -1;
    goto LABEL_21;
  }
  -[AVHapticServer manager](self->_master, "manager");
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  v32 = 0.0;
  *(_QWORD *)buf = -1;
  v31 = 0;
  v15 = ClientEntry::loadAndAddSequence(v29, v6, (unint64_t *)buf, &v32, &v31);
  v16 = v15;
  v17 = *(_QWORD *)buf;
  v18 = v32;
  v19 = v31;
  if (v30)
  {
    v20 = (unint64_t *)&v30->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)())v30->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v30);
      if (v16)
        goto LABEL_18;
LABEL_35:
      v23 = 0;
      goto LABEL_22;
    }
  }
  if (!v15)
    goto LABEL_35;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v16, 0, v29, v30);
  v22 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v23 = (void *)v22;
LABEL_22:
  if (kHSEQScope)
  {
    if ((*(_BYTE *)(kHSEQScope + 8) & 1) != 0)
    {
      v24 = *(id *)kHSEQScope;
      if (v24)
      {
        v25 = v24;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v26 = _Block_copy(v7);
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          v35 = 1195;
          v36 = 2080;
          v34 = 1024;
          v37 = "-[AVHapticServerInstance loadHapticSequenceFromEvents:reply:]";
          v38 = 2048;
          v39 = (unint64_t)v26;
          v40 = 1024;
          v41 = v17;
          v42 = 1024;
          v43 = v19;
          v44 = 2112;
          v45 = v23;
          _os_log_impl(&dword_1A0F4D000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with seqID %u, channelCount %u, and error %@", buf, 0x3Cu);

        }
      }
    }
  }
  (*((void (**)(id, uint64_t, uint64_t, void *, double))v7 + 2))(v7, v17, v19, v23, v18);

  if (v30)
  {
    v27 = (unint64_t *)&v30->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

}

- (void)loadVibePattern:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  unint64_t clientID;
  AVHapticServer *master;
  unint64_t *p_shared_owners;
  unint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _BYTE buf[12];
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kHSEQScope)
  {
    v8 = *(id *)kHSEQScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v29 = 1024;
    v30 = 1201;
    v31 = 2080;
    v32 = "-[AVHapticServerInstance loadVibePattern:reply:]";
    v33 = 2048;
    v34 = clientID;
    v35 = 2048;
    v36 = v6;
    _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx pattern: %p", buf, 0x30u);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    v27 = 0;
    goto LABEL_20;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v26)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v16 = -1;
    goto LABEL_21;
  }
  -[AVHapticServer manager](self->_master, "manager");
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  *(_QWORD *)buf = -1;
  v14 = (*(uint64_t (**)(uint64_t, id, _BYTE *))(*(_QWORD *)v26 + 56))(v26, v6, buf);
  v15 = v14;
  v16 = *(_QWORD *)buf;
  if (v27)
  {
    v17 = (unint64_t *)&v27->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)())v27->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v27);
      if (v15)
        goto LABEL_18;
LABEL_35:
      v20 = 0;
      goto LABEL_22;
    }
  }
  if (!v14)
    goto LABEL_35;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v15, 0, v26, v27);
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v20 = (void *)v19;
LABEL_22:
  if (kHSEQScope)
  {
    if ((*(_BYTE *)(kHSEQScope + 8) & 1) != 0)
    {
      v21 = *(id *)kHSEQScope;
      if (v21)
      {
        v22 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v23 = _Block_copy(v7);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          v29 = 1024;
          v30 = 1213;
          v31 = 2080;
          v32 = "-[AVHapticServerInstance loadVibePattern:reply:]";
          v33 = 2048;
          v34 = (unint64_t)v23;
          v35 = 2112;
          v36 = v20;
          _os_log_impl(&dword_1A0F4D000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);

        }
      }
    }
  }
  (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, v16, v20);

  if (v27)
  {
    v24 = (unint64_t *)&v27->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

}

- (void)prepareHapticSequence:(unint64_t)a3 reply:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  unint64_t clientID;
  AVHapticServer *master;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void *v34;
  id v35[2];
  uint64_t v36[2];
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  void *v48;
  _QWORD v49[3];
  _QWORD *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (kHSEQScope)
  {
    v8 = *(id *)kHSEQScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    v40 = "AVHapticServer.mm";
    v41 = 1024;
    v42 = 1221;
    v43 = 2080;
    v44 = "-[AVHapticServerInstance prepareHapticSequence:reply:]";
    v45 = 2048;
    v46 = clientID;
    v47 = 1024;
    LODWORD(v48) = a3;
    _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx seqID: %u", buf, 0x2Cu);
  }

LABEL_8:
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v37)
    {
      objc_initWeak((id *)buf, self);
      v12 = -[AVHapticServer manager](self->_master, "manager");
      v13 = (std::__shared_weak_count *)v38;
      v36[0] = v37;
      v36[1] = v38;
      if (v38)
      {
        v14 = (unint64_t *)(v38 + 8);
        do
          v15 = __ldxr(v14);
        while (__stxr(v15 + 1, v14));
      }
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __54__AVHapticServerInstance_prepareHapticSequence_reply___block_invoke;
      v34 = &unk_1E450C7B8;
      objc_copyWeak(v35, (id *)buf);
      v35[1] = (id)a2;
      v49[0] = &off_1E450CA50;
      v49[1] = _Block_copy(&v31);
      v50 = v49;
      v19 = ServerManager::prepareSequence((uint64_t)v12, v36, a3, (uint64_t)v49);
      v20 = v50;
      if (v50 == v49)
      {
        v21 = 4;
        v20 = v49;
      }
      else
      {
        if (!v50)
        {
          if (!v13)
            goto LABEL_24;
LABEL_20:
          p_shared_owners = (unint64_t *)&v13->__shared_owners_;
          do
            v24 = __ldaxr(p_shared_owners);
          while (__stlxr(v24 - 1, p_shared_owners));
          if (!v24)
          {
            ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
            std::__shared_weak_count::__release_weak(v13);
            if (v19)
              goto LABEL_25;
          }
          else
          {
LABEL_24:
            if (v19)
            {
LABEL_25:
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v19, 0, v31, v32, v33, v34);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
              objc_destroyWeak(v35);
              objc_destroyWeak((id *)buf);
              goto LABEL_29;
            }
          }
          v22 = 0;
          goto LABEL_28;
        }
        v21 = 5;
      }
      (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*v20 + 8 * v21))(v20, v16, v17, v18);
      goto LABEL_20;
    }
  }
  else
  {
    v37 = 0;
    v38 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
  if (kHSEQScope)
  {
    if ((*(_BYTE *)(kHSEQScope + 8) & 1) != 0)
    {
      v25 = *(id *)kHSEQScope;
      if (v25)
      {
        v26 = v25;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v27 = _Block_copy(v7);
          *(_DWORD *)buf = 136316162;
          v40 = "AVHapticServer.mm";
          v41 = 1024;
          v42 = 1243;
          v43 = 2080;
          v44 = "-[AVHapticServerInstance prepareHapticSequence:reply:]";
          v45 = 2048;
          v46 = (unint64_t)v27;
          v47 = 2112;
          v48 = v22;
          _os_log_impl(&dword_1A0F4D000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);

        }
      }
    }
  }
  (*((void (**)(id, void *))v7 + 2))(v7, v22);
  v28 = (std::__shared_weak_count *)v38;
  if (v38)
  {
    v29 = (unint64_t *)(v38 + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }

}

- (void)detachSequence:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  unint64_t clientID;
  AVHapticServer *master;
  _QWORD *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  dispatch_time_t v15;
  NSObject *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _BYTE buf[40];
  std::__shared_weak_count *v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1249;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticServerInstance detachSequence:]";
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = clientID;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    v27 = 0;
    goto LABEL_34;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v26)
    goto LABEL_34;
  v9 = -[AVHapticServer manager](self->_master, "manager");
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  if (!kHSEQScope)
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_18;
  }
  v12 = *(id *)kHSEQScope;
  if (v12)
  {
LABEL_18:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(v26 + 24);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "ServerManager.mm";
      *(_DWORD *)&buf[14] = 1219;
      *(_WORD *)&buf[18] = 2080;
      *(_WORD *)&buf[12] = 1024;
      *(_QWORD *)&buf[20] = "detachSequence";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v14;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = a3;
      _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d %s: client ID: 0x%x, asychronously detaching sequence with ID %u after 2-second delay", buf, 0x28u);
    }

  }
  v15 = dispatch_time(0, 2000000000);
  v16 = v9[60];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = ___ZN13ServerManager14detachSequenceENSt3__110shared_ptrI11ClientEntryEEm_block_invoke;
  *(_QWORD *)&buf[24] = &__block_descriptor_56_ea8_32c39_ZTSNSt3__110shared_ptrI11ClientEntryEE_e5_v8__0l;
  *(_QWORD *)&buf[32] = v26;
  v29 = v27;
  if (v27)
  {
    v17 = (unint64_t *)&v27->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  v30 = a3;
  dispatch_after(v15, v16, buf);
  v19 = v29;
  if (v29)
  {
    v20 = (unint64_t *)&v29->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v27)
  {
    v22 = (unint64_t *)&v27->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)())v27->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v27);
    }
  }
LABEL_34:
  if (v27)
  {
    v24 = (unint64_t *)&v27->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
}

- (void)prewarm:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t clientID;
  AVHapticServer *master;
  NSObject *v9;
  NSObject *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  id v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _QWORD v26[6];
  id v27[2];
  std::__shared_weak_count *v28;
  id location;
  void *v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    v37 = "AVHapticServer.mm";
    v38 = 1024;
    v39 = 1260;
    v40 = 2080;
    v41 = "-[AVHapticServerInstance prewarm:]";
    v42 = 2048;
    v43 = clientID;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = -4812;
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v30)
    {
      objc_initWeak(&location, self->_master);
      if (kHSRVScope)
      {
        if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
        {
          v9 = *(id *)kHSRVScope;
          if (v9)
          {
            v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v37 = "AVHapticServer.mm";
              v38 = 1024;
              v39 = 1266;
              v40 = 2080;
              v41 = "-[AVHapticServerInstance prewarm:]";
              _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doPrewarm on ACQ", buf, 0x1Cu);
            }

          }
        }
      }
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3321888768;
      v26[2] = __34__AVHapticServerInstance_prewarm___block_invoke;
      v26[3] = &unk_1E450C7E0;
      v26[4] = self;
      v26[5] = &v32;
      objc_copyWeak(v27, &location);
      v27[1] = v30;
      v28 = v31;
      if (v31)
      {
        p_shared_owners = (unint64_t *)&v31->__shared_owners_;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
      if (AudioControlQueue(void)::once != -1)
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
      v13 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v13, v26, 0, (uint64_t)"-[AVHapticServerInstance prewarm:]", (uint64_t)"AVHapticServer.mm", 1272);

      v14 = v28;
      if (v28)
      {
        v15 = (unint64_t *)&v28->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      objc_destroyWeak(v27);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  v17 = *((int *)v33 + 6);
  if ((_DWORD)v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  if (kHSRVScope)
  {
    v19 = *(id *)kHSRVScope;
    if (!v19)
      goto LABEL_38;
  }
  else
  {
    v19 = (id)MEMORY[0x1E0C81028];
    v20 = MEMORY[0x1E0C81028];
  }
  v21 = v19;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = _Block_copy(v4);
    *(_DWORD *)buf = 136316162;
    v37 = "AVHapticServer.mm";
    v38 = 1024;
    v39 = 1275;
    v40 = 2080;
    v41 = "-[AVHapticServerInstance prewarm:]";
    v42 = 2048;
    v43 = (unint64_t)v22;
    v44 = 2112;
    v45 = v18;
    _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_INFO, "%25s:%-5d %s: invoking callback %p with %@", buf, 0x30u);

  }
LABEL_38:
  (*((void (**)(id, void *))v4 + 2))(v4, v18);
  v23 = v31;
  if (v31)
  {
    v24 = (unint64_t *)&v31->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  _Block_object_dispose(&v32, 8);

}

- (void)stopPrewarm
{
  NSObject *v3;
  id v4;
  unint64_t clientID;
  AVHapticServer *master;
  NSObject *v7;
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  id v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[5];
  id v19[2];
  std::__shared_weak_count *v20;
  id location;
  void *v22;
  std::__shared_weak_count *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    v25 = "AVHapticServer.mm";
    v26 = 1024;
    v27 = 1281;
    v28 = 2080;
    v29 = "-[AVHapticServerInstance stopPrewarm]";
    v30 = 2048;
    v31 = clientID;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v22)
    {
      objc_initWeak(&location, self->_master);
      if (kHSRVScope)
      {
        if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
        {
          v7 = *(id *)kHSRVScope;
          if (v7)
          {
            v8 = v7;
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v25 = "AVHapticServer.mm";
              v26 = 1024;
              v27 = 1285;
              v28 = 2080;
              v29 = "-[AVHapticServerInstance stopPrewarm]";
              _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopPrewarm on ACQ", buf, 0x1Cu);
            }

          }
        }
      }
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3321888768;
      v18[2] = __37__AVHapticServerInstance_stopPrewarm__block_invoke;
      v18[3] = &unk_1E450C818;
      v18[4] = self;
      objc_copyWeak(v19, &location);
      v19[1] = v22;
      v20 = v23;
      if (v23)
      {
        p_shared_owners = (unint64_t *)&v23->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      if (AudioControlQueue(void)::once != -1)
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
      v11 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v11, v18, 0, (uint64_t)"-[AVHapticServerInstance stopPrewarm]", (uint64_t)"AVHapticServer.mm", 1289);

      v12 = v20;
      if (v20)
      {
        v13 = (unint64_t *)&v20->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  v15 = v23;
  if (v23)
  {
    v16 = (unint64_t *)&v23->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

- (void)startRunning:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t clientID;
  AVHapticServer *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  AVHapticServer *master;
  void *v14;
  unint64_t *v15;
  unint64_t v16;
  int v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  id location;
  _QWORD v35[5];
  _BYTE buf[18];
  __int16 v37;
  const char *v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1295;
    v37 = 2080;
    v38 = "-[AVHapticServerInstance startRunning:]";
    v39 = 2048;
    v40 = clientID;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v8 = self->_master;
  objc_sync_enter(v8);
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHSRVScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AVHapticServer.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1299;
          v37 = 2080;
          v38 = "-[AVHapticServerInstance startRunning:]";
          _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching unmuteClientAfterSessionInterruption on ACQ", buf, 0x1Cu);
        }

      }
    }
  }
  v11 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __39__AVHapticServerInstance_startRunning___block_invoke;
  v35[3] = &unk_1E4516D60;
  v35[4] = self;
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v12 = (id)AudioControlQueue(void)::gAudioControlQueue;
  AT::DispatchBlock(v12, v35, 0, (uint64_t)"-[AVHapticServerInstance startRunning:]", (uint64_t)"AVHapticServer.mm", 1302);

  master = self->_master;
  if (!master)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    goto LABEL_28;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!*(_QWORD *)buf)
  {
LABEL_28:
    v17 = -4812;
    goto LABEL_29;
  }
  -[AVHapticServerInstance setWasRunningAndSuspended:](self, "setWasRunningAndSuspended:", 0);
  objc_initWeak(&location, self);
  -[AVHapticServerInstance master](self, "master");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *(_QWORD *)buf;
  v33 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __39__AVHapticServerInstance_startRunning___block_invoke_2;
  v30[3] = &unk_1E450C850;
  objc_copyWeak(&v31, &location);
  v17 = objc_msgSend(v14, "doStartRunning:completedBlock:", &v32, v30);
  v18 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
LABEL_29:
  v21 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v22 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  objc_sync_exit(v8);

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v17, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  if (kHSRVScope)
  {
    v25 = *(id *)kHSRVScope;
    if (!v25)
      goto LABEL_49;
  }
  else
  {
    v25 = (id)MEMORY[0x1E0C81028];
    v26 = MEMORY[0x1E0C81028];
  }
  v27 = v25;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = _Block_copy(v4);
    if (v24)
    {
      objc_msgSend(v24, "localizedDescription");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = CFSTR("(no err)");
    }
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1317;
    v37 = 2080;
    v38 = "-[AVHapticServerInstance startRunning:]";
    v39 = 2048;
    v40 = (unint64_t)v28;
    v41 = 2112;
    v42 = v29;
    _os_log_impl(&dword_1A0F4D000, v27, OS_LOG_TYPE_INFO, "%25s:%-5d %s: invoking callback %p: %@", buf, 0x30u);
    if (v24)

  }
LABEL_49:
  (*((void (**)(id, void *))v4 + 2))(v4, v24);

}

- (void)stopRunning
{
  NSObject *v3;
  id v4;
  unint64_t clientID;
  AVHapticServer *v6;
  AVHapticServer *master;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  id v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD v20[6];
  std::__shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    v25 = "AVHapticServer.mm";
    v26 = 1024;
    v27 = 1323;
    v28 = 2080;
    v29 = "-[AVHapticServerInstance stopRunning]";
    v30 = 2048;
    v31 = clientID;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v6 = self->_master;
  objc_sync_enter(v6);
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    v8 = v22;
    if (v22)
    {
      if (kHSRVScope)
      {
        if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
        {
          v9 = *(id *)kHSRVScope;
          if (v9)
          {
            v10 = v9;
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v25 = "AVHapticServer.mm";
              v26 = 1024;
              v27 = 1327;
              v28 = 2080;
              v29 = "-[AVHapticServerInstance stopRunning]";
              _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopRunning on ACQ", buf, 0x1Cu);
            }

            v8 = v22;
          }
        }
      }
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3321888768;
      v20[2] = __37__AVHapticServerInstance_stopRunning__block_invoke;
      v20[3] = &unk_1E450C878;
      v20[4] = self;
      v20[5] = v8;
      v21 = v23;
      if (v23)
      {
        p_shared_owners = (unint64_t *)&v23->__shared_owners_;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
      if (AudioControlQueue(void)::once != -1)
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
      v13 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v13, v20, 0, (uint64_t)"-[AVHapticServerInstance stopRunning]", (uint64_t)"AVHapticServer.mm", 1332);

      if (_os_feature_enabled_impl()
        && -[AVHapticServerInstance runIncludesAudio](self, "runIncludesAudio"))
      {
        (*(void (**)(HapticSession *, _QWORD))(*(_QWORD *)self->_hapticSession.__ptr_ + 56))(self->_hapticSession.__ptr_, 0);
      }
      v14 = v21;
      if (v21)
      {
        v15 = (unint64_t *)&v21->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  objc_sync_exit(v6);

}

- (void)stopRunning:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t clientID;
  AVHapticServer *v8;
  AVHapticServer *master;
  NSObject *v10;
  NSObject *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  AVHapticServerInstance *v31;
  uint64_t *v32;
  id v33[2];
  std::__shared_weak_count *v34;
  id location;
  void *v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  unint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHSRVScope)
  {
    v5 = *(id *)kHSRVScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136315906;
    v43 = "AVHapticServer.mm";
    v44 = 1024;
    v45 = 1342;
    v46 = 2080;
    v47 = "-[AVHapticServerInstance stopRunning:]";
    v48 = 2048;
    v49 = clientID;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", buf, 0x26u);
  }

LABEL_8:
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v8 = self->_master;
  objc_sync_enter(v8);
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v36)
    {
      objc_initWeak(&location, self->_master);
      if (kHSRVScope)
      {
        if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
        {
          v10 = *(id *)kHSRVScope;
          if (v10)
          {
            v11 = v10;
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v43 = "AVHapticServer.mm";
              v44 = 1024;
              v45 = 1349;
              v46 = 2080;
              v47 = "-[AVHapticServerInstance stopRunning:]";
              _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dispatching doStopRunning on ACQ", buf, 0x1Cu);
            }

          }
        }
      }
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3321888768;
      v29 = __38__AVHapticServerInstance_stopRunning___block_invoke;
      v30 = &unk_1E450C7E0;
      objc_copyWeak(v33, &location);
      v32 = &v38;
      v33[1] = v36;
      v34 = v37;
      if (v37)
      {
        p_shared_owners = (unint64_t *)&v37->__shared_owners_;
        do
          v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }
      v31 = self;
      if (AudioControlQueue(void)::once != -1)
        dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
      v14 = (id)AudioControlQueue(void)::gAudioControlQueue;
      AT::DispatchBlock(v14, &v27, 0, (uint64_t)"-[AVHapticServerInstance stopRunning:]", (uint64_t)"AVHapticServer.mm", 1357);

      if (_os_feature_enabled_impl()
        && -[AVHapticServerInstance runIncludesAudio](self, "runIncludesAudio", v27, v28, v29, v30, v31, v32))
      {
        (*(void (**)(HapticSession *, _QWORD))(*(_QWORD *)self->_hapticSession.__ptr_ + 56))(self->_hapticSession.__ptr_, 0);
      }
      v15 = v34;
      if (v34)
      {
        v16 = (unint64_t *)&v34->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v36 = 0;
    v37 = 0;
  }
  v18 = v37;
  if (v37)
  {
    v19 = (unint64_t *)&v37->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  objc_sync_exit(v8);

  v21 = *((int *)v39 + 6);
  if ((_DWORD)v21)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  if (kHSRVScope)
  {
    v23 = *(id *)kHSRVScope;
    if (!v23)
      goto LABEL_46;
  }
  else
  {
    v23 = (id)MEMORY[0x1E0C81028];
    v24 = MEMORY[0x1E0C81028];
  }
  v25 = v23;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = _Block_copy(v4);
    *(_DWORD *)buf = 136315906;
    v43 = "AVHapticServer.mm";
    v44 = 1024;
    v45 = 1364;
    v46 = 2080;
    v47 = "-[AVHapticServerInstance stopRunning:]";
    v48 = 2048;
    v49 = (unint64_t)v26;
    _os_log_impl(&dword_1A0F4D000, v25, OS_LOG_TYPE_INFO, "%25s:%-5d %s: invoking callback %p", buf, 0x26u);

  }
LABEL_46:
  (*((void (**)(id, void *))v4 + 2))(v4, v22);
  _Block_object_dispose(&v38, 8);

}

- (void)getHapticLatency:(id)a3
{
  void (**v4)(id, void *, double);
  AVHapticServer *v5;
  AVHapticServer *master;
  uint64_t v7;
  double v8;
  void *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = (void (**)(id, void *, double))a3;
  v5 = self->_master;
  objc_sync_enter(v5);
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    master = self->_master;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v7 = -[AVHapticServer manager](master, "manager", v12);
  v8 = (*(double (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v7 + 232) + 120))(*(_QWORD *)(v7 + 232), (*(_QWORD *)(v13 + 96) >> 1) & 1, 9999999);
  if (v8 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4806, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v4[2](v4, v9, v8);

  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  objc_sync_exit(v5);

}

- (void)setPlayerBehavior:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  id v8;
  unint64_t clientID;
  AVHapticServer *v10;
  AVHapticServer *master;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  BOOL routeUsesReceiver;
  NSObject *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  const char *v24;
  unint64_t v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  _BYTE *v35;
  id v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  unint64_t v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  const char *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  BOOL v57;
  const char *v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  int v64;
  uint8_t v65[4];
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  _BYTE v72[10];
  const char *v73;
  _BYTE buf[40];
  const char *v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  BOOL v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  if (kHSRVScope)
  {
    v7 = *(id *)kHSRVScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1385;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticServerInstance setPlayerBehavior:reply:]";
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = clientID;
    *(_WORD *)&buf[38] = 1024;
    LODWORD(v75) = a3;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx behavior: %u", buf, 0x2Cu);
  }

LABEL_8:
  v10 = self->_master;
  objc_sync_enter(v10);
  master = self->_master;
  if (!master)
  {
    v17 = 0;
    v60 = 0;
    goto LABEL_112;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v59)
  {
    v17 = 0;
    goto LABEL_112;
  }
  v58 = -[AVHapticServer manager](self->_master, "manager");
  v12 = v60;
  if (v60)
  {
    p_shared_owners = (unint64_t *)&v60->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  if (a3 < 0x400)
  {
    routeUsesReceiver = self->_routeUsesReceiver;
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    if ((~(_BYTE)a3 & 0x11) == 0)
    {
      if (kHSRVScope)
      {
        v16 = *(id *)kHSRVScope;
        if (!v16)
        {
LABEL_36:
          v17 = -4800;
          goto LABEL_107;
        }
      }
      else
      {
        v16 = MEMORY[0x1E0C81028];
        v21 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "ServerManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1246;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "setClientPlayerBehavior";
        _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Cannot set both haptics-only and audio-only", buf, 0x1Cu);
      }

      goto LABEL_36;
    }
    v57 = routeUsesReceiver;
    if (kHSRVScope)
    {
      v19 = *(id *)kHSRVScope;
      if (!v19)
        goto LABEL_45;
    }
    else
    {
      v19 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(v59 + 24);
      v24 = "audio-only";
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "ServerManager.mm";
      if ((a3 & 0x10) == 0)
        v24 = "haptics+audio";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1250;
      *(_QWORD *)&buf[20] = "setClientPlayerBehavior";
      *(_WORD *)&buf[28] = 2048;
      *(_WORD *)&buf[18] = 2080;
      if ((a3 & 1) != 0)
        v24 = "haptics-only";
      *(_QWORD *)&buf[30] = v23;
      *(_WORD *)&buf[38] = 2080;
      v75 = v24;
      _os_log_impl(&dword_1A0F4D000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client ID 0x%lx -> %s mode", buf, 0x30u);
    }

LABEL_45:
    v25 = (*(_QWORD *)(v59 + 96) & 0xFFFFFFFFFFFFFFFCLL | (2 * (a3 & 1)) | ((a3 & 0x10) >> 4)) ^ 3;
    *(_QWORD *)(v59 + 96) = v25;
    if ((~(_BYTE)a3 & 5) != 0)
      goto LABEL_54;
    if (kHSRVScope)
    {
      v26 = *(id *)kHSRVScope;
      if (!v26)
      {
LABEL_53:
        v25 = *(_QWORD *)(v59 + 96) | 0x40;
        *(_QWORD *)(v59 + 96) = v25;
LABEL_54:
        if (((v25 >> 2) & 1) == ((a3 >> 1) & 1))
          goto LABEL_74;
        *(_QWORD *)(v59 + 96) = v25 & 0xFFFFFFFFFFFFFFFBLL | (2 * (a3 & 2));
        if (kHSRVScope)
        {
          v29 = *(id *)kHSRVScope;
          if (!v29)
          {
LABEL_64:
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3321888768;
            *(_QWORD *)&buf[16] = ___ZN13ServerManager23setClientPlayerBehaviorENSt3__110shared_ptrI11ClientEntryEEmb_block_invoke;
            *(_QWORD *)&buf[24] = &unk_1E4514800;
            *(_QWORD *)&buf[32] = &v61;
            v75 = v58;
            v76 = v59;
            v77 = v60;
            if (v60)
            {
              v33 = (unint64_t *)&v60->__shared_owners_;
              do
                v34 = __ldxr(v33);
              while (__stxr(v34 + 1, v33));
            }
            v78 = v57;
            v35 = buf;
            if (AudioControlQueue(void)::once != -1)
              dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
            v36 = (id)AudioControlQueue(void)::gAudioControlQueue;
            AT::DispatchBlock(v36, v35, 0, (uint64_t)"executeSync", (uint64_t)"ServerManager.mm", 327);

            v37 = v77;
            if (v77)
            {
              v38 = (unint64_t *)&v77->__shared_owners_;
              do
                v39 = __ldaxr(v38);
              while (__stlxr(v39 - 1, v38));
              if (!v39)
              {
                ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
                std::__shared_weak_count::__release_weak(v37);
              }
            }
LABEL_74:
            v40 = *(_QWORD *)(v59 + 96);
            if (((v40 >> 3) & 1) != ((a3 >> 5) & 1))
            {
              if (kHMUTScope)
              {
                if ((*(_BYTE *)(kHMUTScope + 8) & 1) != 0)
                {
                  v41 = *(id *)kHMUTScope;
                  if (v41)
                  {
                    v42 = v41;
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                    {
                      v43 = *(_QWORD *)(v59 + 24);
                      *(_DWORD *)v65 = 136316162;
                      v66 = "ClientEntry.mm";
                      v68 = 768;
                      v69 = 2080;
                      v67 = 1024;
                      v70 = "setAudioBehaviorMuted";
                      v71 = 1024;
                      *(_DWORD *)v72 = v43;
                      *(_WORD *)&v72[4] = 1024;
                      *(_DWORD *)&v72[6] = (a3 >> 5) & 1;
                      _os_log_impl(&dword_1A0F4D000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, mute all audio on this client: %d", v65, 0x28u);
                    }

                  }
                }
              }
              *(_QWORD *)(v59 + 96) = *(_QWORD *)(v59 + 96) & 0xFFFFFFFFFFFFFFF7 | ((a3 & 0x20) >> 2);
              ClientEntry::muteAudio(v59, (a3 & 0x20) != 0, 6, 0.0);
              v40 = *(_QWORD *)(v59 + 96);
            }
            if (((v40 >> 4) & 1) != ((a3 >> 6) & 1))
            {
              if (kHMUTScope)
              {
                if ((*(_BYTE *)(kHMUTScope + 8) & 1) != 0)
                {
                  v44 = *(id *)kHMUTScope;
                  if (v44)
                  {
                    v45 = v44;
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                    {
                      v46 = *(_QWORD *)(v59 + 24);
                      *(_DWORD *)v65 = 136316162;
                      v66 = "ClientEntry.mm";
                      v68 = 774;
                      v69 = 2080;
                      v67 = 1024;
                      v70 = "setHapticsBehaviorMuted";
                      v71 = 1024;
                      *(_DWORD *)v72 = v46;
                      *(_WORD *)&v72[4] = 1024;
                      *(_DWORD *)&v72[6] = (a3 >> 6) & 1;
                      _os_log_impl(&dword_1A0F4D000, v45, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, mute all haptics on this client: %d", v65, 0x28u);
                    }

                  }
                }
              }
              *(_QWORD *)(v59 + 96) = *(_QWORD *)(v59 + 96) & 0xFFFFFFFFFFFFFFEFLL | ((a3 & 0x40) >> 2);
              (*(void (**)(uint64_t, BOOL, uint64_t, float))(*(_QWORD *)v59 + 48))(v59, (a3 & 0x40) != 0, 6, 0.0);
              v40 = *(_QWORD *)(v59 + 96);
            }
            v47 = a3 & 0x200;
            if ((v47 == 0) == ((v40 & 0x100) == 0))
              goto LABEL_102;
            if (kHMUTScope)
            {
              v48 = *(id *)kHMUTScope;
              if (!v48)
              {
LABEL_100:
                *(_QWORD *)(v59 + 96) = *(_QWORD *)(v59 + 96) & 0xFFFFFFFFFFFFFEFFLL | (v47 >> 1);
                if (*(_BYTE *)(*(_QWORD *)(v59 + 224) + 473))
                  (*(void (**)(uint64_t, BOOL, uint64_t, float))(*(_QWORD *)v59 + 48))(v59, v47 == 0, 1, 0.0);
LABEL_102:
                if ((a3 & 0x80) != 0)
                  *(_DWORD *)(v59 + 104) = 1003;
                if ((a3 & 0x100) != 0)
                  *(_BYTE *)(v59 + 108) = 1;
                v17 = *((_DWORD *)v62 + 6);
                v12 = v60;
LABEL_107:
                _Block_object_dispose(&v61, 8);
                if (!v12)
                  goto LABEL_112;
                goto LABEL_108;
              }
            }
            else
            {
              v48 = MEMORY[0x1E0C81028];
              v49 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v50 = *(_QWORD *)(v59 + 24);
              v51 = "no longer";
              *(_DWORD *)v65 = 136316162;
              v66 = "ServerManager.mm";
              v67 = 1024;
              if ((a3 & 0x200) == 0)
                v51 = "now";
              v68 = 1287;
              v69 = 2080;
              v70 = "setClientPlayerBehavior";
              v71 = 2048;
              *(_QWORD *)v72 = v50;
              *(_WORD *)&v72[8] = 2080;
              v73 = v51;
              _os_log_impl(&dword_1A0F4D000, v48, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client ID 0x%lx will %s mute haptics while device is recording", v65, 0x30u);
            }

            goto LABEL_100;
          }
        }
        else
        {
          v29 = MEMORY[0x1E0C81028];
          v30 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_QWORD *)&buf[4] = "ServerManager.mm";
          v31 = "now";
          v32 = *(_QWORD *)(v59 + 24);
          *(_DWORD *)buf = 136316162;
          *(_WORD *)&buf[12] = 1024;
          if ((a3 & 2) == 0)
            v31 = "no longer";
          *(_DWORD *)&buf[14] = 1266;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "setClientPlayerBehavior";
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = v32;
          *(_WORD *)&buf[38] = 2080;
          v75 = v31;
          _os_log_impl(&dword_1A0F4D000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client ID 0x%lx %s follows default route - updating mute state", buf, 0x30u);
        }

        goto LABEL_64;
      }
    }
    else
    {
      v26 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(v59 + 24);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "ServerManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1256;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "setClientPlayerBehavior";
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v28;
      _os_log_impl(&dword_1A0F4D000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Haptics-only client ID 0x%lx will not activate its audio session when starting", buf, 0x26u);
    }

    goto LABEL_53;
  }
  if (kHSRVScope)
  {
    v18 = *(id *)kHSRVScope;
    if (!v18)
      goto LABEL_30;
  }
  else
  {
    v18 = MEMORY[0x1E0C81028];
    v20 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "ServerManager.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1234;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "setClientPlayerBehavior";
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a3;
    _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal or unsupported player behavior: 0x%x", buf, 0x22u);
  }

LABEL_30:
  v17 = -4800;
  if (!v60)
    goto LABEL_112;
LABEL_108:
  v52 = (unint64_t *)&v12->__shared_owners_;
  do
    v53 = __ldaxr(v52);
  while (__stlxr(v53 - 1, v52));
  if (!v53)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
LABEL_112:
  if (v60)
  {
    v54 = (unint64_t *)&v60->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  objc_sync_exit(v10);

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v17, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = 0;
  }
  v6[2](v6, v56);

}

- (void)releaseChannels
{
  NSObject *v3;
  id v4;
  unint64_t clientID;
  AVHapticServer *master;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _BYTE v10[18];
  __int16 v11;
  const char *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kHCHNScope)
  {
    v3 = *(id *)kHCHNScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)v10 = 136315906;
    *(_QWORD *)&v10[4] = "AVHapticServer.mm";
    *(_WORD *)&v10[12] = 1024;
    *(_DWORD *)&v10[14] = 1398;
    v11 = 2080;
    v12 = "-[AVHapticServerInstance releaseChannels]";
    v13 = 2048;
    v14 = clientID;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx", v10, 0x26u);
  }

LABEL_8:
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (*(_QWORD *)v10)
      ClientEntry::clearAssignedChannels(*(ClientEntry **)v10);
  }
  else
  {
    *(_QWORD *)v10 = 0;
    *(_QWORD *)&v10[8] = 0;
  }
  v7 = *(std::__shared_weak_count **)&v10[8];
  if (*(_QWORD *)&v10[8])
  {
    v8 = (unint64_t *)(*(_QWORD *)&v10[8] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)requestChannels:(unint64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  unint64_t clientID;
  AVHapticServer *v10;
  AVHapticServer *master;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  NSObject *v16;
  id v17;
  int *v18;
  _QWORD **v19;
  uint64_t **v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t **v26;
  uint64_t **v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  int *v33;
  int *v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  unint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  const char *v45;
  int v46;
  unint64_t v47;
  AVHapticServerInstance *v48;
  id v49;
  int *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  void *__p;
  int *v54;
  uint64_t v55;
  _BYTE buf[40];
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (kHCHNScope)
  {
    v7 = *(id *)kHCHNScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1407;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[AVHapticServerInstance requestChannels:reply:]";
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = clientID;
    *(_WORD *)&buf[38] = 1024;
    v57 = a3;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx count: %u", buf, 0x2Cu);
  }

LABEL_8:
  v10 = self->_master;
  objc_sync_enter(v10);
  master = self->_master;
  if (!master)
  {
    v52 = 0;
    goto LABEL_63;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (v51)
  {
    v49 = v6;
    ClientEntry::getAssignedChannelIDs((ClientEntry *)buf, v51);
    v13 = *(_QWORD *)buf;
    v12 = *(_QWORD *)&buf[8];
    if (*(_QWORD *)buf)
      operator delete(*(void **)buf);
    if (v12 == v13)
    {
      if (a3 >> 31)
      {
        if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "HapticUtils.h";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 74;
          v45 = "%25s:%-5d ASSERTION FAILURE [(id < (1UL << 31)) != 0 is false]: ";
          goto LABEL_73;
        }
LABEL_74:
        __break(1u);
      }
      v14 = -[AVHapticServer getChannelID](self->_master, "getChannelID");
      v15 = a3;
    }
    else
    {
      v14 = -[AVHapticServer getChannelID](self->_master, "getChannelID");
      v15 = 1;
    }
    v47 = a3;
    v48 = self;
    __p = 0;
    v54 = 0;
    v55 = 0;
    v46 = ClientEntry::requestAndInitializeSynthChannels(v51, &__p, v15);
    if (v46)
      goto LABEL_37;
    if (kHCHNScope)
    {
      v16 = *(id *)kHCHNScope;
      if (!v16)
      {
LABEL_25:
        v18 = (int *)__p;
        v50 = v54;
        if (__p == v54)
          goto LABEL_37;
        v19 = (_QWORD **)(v51 + 232);
        v20 = (uint64_t **)(v51 + 240);
        while (1)
        {
          v21 = *v18;
          v22 = *(_QWORD *)(v51 + 432);
          *(_QWORD *)buf = v51 + 256;
          buf[8] = 1;
          std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v51 + 256));
          *(_QWORD *)&buf[16] = v51 + 232;
          *(_QWORD *)&buf[24] = v51 + 424;
          *(_QWORD *)&buf[32] = v22;
          *(_BYTE *)(v51 + 424) = 1;
          v23 = (uint64_t *)operator new(0x30uLL);
          v24 = v23;
          v23[4] = v14;
          *((_DWORD *)v23 + 10) = v21;
          v25 = *v20;
          v26 = (uint64_t **)(v51 + 240);
          v27 = (uint64_t **)(v51 + 240);
          if (!*v20)
            goto LABEL_34;
          do
          {
            while (1)
            {
              v27 = (uint64_t **)v25;
              v28 = v25[4];
              if (v14 >= v28)
                break;
              v25 = (uint64_t *)*v25;
              v26 = v27;
              if (!*v27)
                goto LABEL_34;
            }
            if (v28 >= v14)
            {
              operator delete(v23);
              **(_BYTE **)&buf[24] = 0;
              std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
              if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "ClientEntry.mm";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 225;
                v45 = "%25s:%-5d ASSERTION FAILURE [(!\"Attempted to add same channel ID twice\") != 0 is false]: ";
LABEL_73:
                _os_log_impl(&dword_1A0F4D000, 0, OS_LOG_TYPE_ERROR, v45, buf, 0x12u);
              }
              goto LABEL_74;
            }
            v25 = (uint64_t *)v25[1];
          }
          while (v25);
          v26 = v27 + 1;
LABEL_34:
          *v23 = 0;
          v23[1] = 0;
          v23[2] = (uint64_t)v27;
          *v26 = v23;
          v29 = (_QWORD *)**v19;
          if (v29)
          {
            *v19 = v29;
            v24 = *v26;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v51 + 240), v24);
          ++*(_QWORD *)(v51 + 248);
          **(_BYTE **)&buf[24] = 0;
          std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
          ++v14;
          if (++v18 == v50)
          {
LABEL_37:
            v30 = *(_QWORD *)(v51 + 432);
            *(_QWORD *)buf = v51 + 256;
            buf[8] = 1;
            std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)(v51 + 256));
            *(_QWORD *)&buf[16] = v51 + 232;
            *(_QWORD *)&buf[24] = v30;
            LODWORD(v30) = *(_DWORD *)(v51 + 248);
            std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)buf);
            *(_BYTE *)(v51 + 440) = (_DWORD)v30 != 0;
            if (__p)
              operator delete(__p);
            v6 = v49;
            if (v46)
            {
              if (kHCHNScope)
              {
                v31 = *(id *)kHCHNScope;
                if (!v31)
                  goto LABEL_53;
              }
              else
              {
                v31 = MEMORY[0x1E0C81028];
                v37 = MEMORY[0x1E0C81028];
              }
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v38 = v48->_clientID;
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = "AVHapticServer.mm";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 1421;
                *(_WORD *)&buf[18] = 2080;
                *(_QWORD *)&buf[20] = "-[AVHapticServerInstance requestChannels:reply:]";
                *(_WORD *)&buf[28] = 2048;
                *(_QWORD *)&buf[30] = v38;
                _os_log_impl(&dword_1A0F4D000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: clientID: 0x%lx - failed to get more channels!", buf, 0x26u);
              }

LABEL_53:
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v46, 0);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, _QWORD, void *))v49 + 2))(v49, 0, v39);

              goto LABEL_63;
            }
            v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            ClientEntry::getAssignedChannelIDs((ClientEntry *)&__p, v51);
            v33 = (int *)__p;
            v34 = v54;
            if (((char *)v54 - (_BYTE *)__p) >> 3 >= v47)
              LODWORD(v35) = v47;
            else
              v35 = ((char *)v54 - (_BYTE *)__p) >> 3;
            if (kHCHNScope)
            {
              v36 = *(id *)kHCHNScope;
              if (!v36)
              {
                do
                {
LABEL_58:
                  if (v34 == v33)
                    break;
                  v41 = *((_QWORD *)v34 - 1);
                  v34 -= 2;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "addObject:", v42);

                  -[AVHapticServer incrementChannelID](v48->_master, "incrementChannelID");
                  LODWORD(v35) = v35 - 1;
                }
                while ((_DWORD)v35);
                (*((void (**)(id, id, _QWORD))v49 + 2))(v49, v32, 0);
                if (v33)
                  operator delete(v33);

                goto LABEL_63;
              }
            }
            else
            {
              v36 = MEMORY[0x1E0C81028];
              v40 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "AVHapticServer.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 1435;
              *(_WORD *)&buf[18] = 2080;
              *(_QWORD *)&buf[20] = "-[AVHapticServerInstance requestChannels:reply:]";
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v35;
              _os_log_impl(&dword_1A0F4D000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Placing %u assigned channel IDs in output NSArray", buf, 0x22u);
            }

            goto LABEL_58;
          }
        }
      }
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "ClientEntry.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 211;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "addChannels";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = (unint64_t)((char *)v54 - (_BYTE *)__p) >> 2;
      _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_INFO, "%25s:%-5d %s: %u new synth channels now available -- binding to keys", buf, 0x22u);
    }

    goto LABEL_25;
  }
LABEL_63:
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v44 = __ldaxr(p_shared_owners);
    while (__stlxr(v44 - 1, p_shared_owners));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  objc_sync_exit(v10);

}

- (void)removeChannel:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  unint64_t v7;
  NSObject *v8;
  id v9;
  unint64_t clientID;
  AVHapticServer *v11;
  AVHapticServer *master;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  int v22;
  unint64_t v23;
  uint8x8_t v24;
  NSObject *v25;
  _QWORD *v26;
  _QWORD *i;
  unint64_t v28;
  caulk::rt_safe_memory_resource **v29;
  uint64_t v30;
  _QWORD *v31;
  float v32;
  float v33;
  _BOOL8 v34;
  unint64_t v35;
  unint64_t v36;
  int8x8_t prime;
  uint64_t v38;
  caulk::rt_safe_memory_resource *v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  uint8x8_t v43;
  unint64_t v44;
  uint8x8_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  unint64_t v51;
  BOOL v52;
  _QWORD *v53;
  NSObject *v54;
  NSObject *v55;
  int v56;
  NSObject *v57;
  id v58;
  unint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  unint64_t v64;
  unint64_t *p_shared_owners;
  unint64_t v66;
  AudioUnitElement *v67;
  AudioUnitElement *v68;
  uint64_t v69;
  caulk::rt_safe_memory_resource *v70;
  NSObject *v71;
  int v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  AudioUnitElement *v75;
  AudioUnitElement *v76;
  AudioUnitElement *v77;
  _BYTE buf[12];
  __int16 v79;
  _BYTE v80[26];
  int v81;
  uint8_t v82[4];
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  const char *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v7 = (unint64_t)&unk_1EE5ED000;
  if (kHCHNScope)
  {
    v8 = *(id *)kHCHNScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    v79 = 1024;
    *(_DWORD *)v80 = 1451;
    *(_WORD *)&v80[4] = 2080;
    *(_QWORD *)&v80[6] = "-[AVHapticServerInstance removeChannel:reply:]";
    *(_WORD *)&v80[14] = 2048;
    *(_QWORD *)&v80[16] = clientID;
    *(_WORD *)&v80[24] = 1024;
    v81 = a3;
    _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx channelID: %u", buf, 0x2Cu);
  }

LABEL_8:
  v11 = self->_master;
  objc_sync_enter(v11);
  master = self->_master;
  if (master)
  {
    -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
    if (v73)
    {
      if (kHCHNScope)
      {
        if ((*(_BYTE *)(kHCHNScope + 8) & 1) != 0)
        {
          v13 = *(id *)kHCHNScope;
          if (v13)
          {
            v14 = v13;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v15 = *(_QWORD *)(v73 + 24);
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = "ClientEntry.mm";
              *(_DWORD *)v80 = 231;
              *(_WORD *)&v80[4] = 2080;
              v79 = 1024;
              *(_QWORD *)&v80[6] = "removeAssignedChannelWithID";
              *(_WORD *)&v80[14] = 1024;
              *(_DWORD *)&v80[16] = v15;
              *(_WORD *)&v80[20] = 1024;
              *(_DWORD *)&v80[22] = a3;
              _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: client ID: 0x%x, key: %u", buf, 0x28u);
            }

          }
        }
      }
      v16 = atomic_load((unsigned int *)(v73 + 120));
      if (v16 == 5 || (v17 = atomic_load((unsigned int *)(v73 + 120)), v17 > 1))
      {
        if (kHCHNScope)
        {
          v18 = *(id *)kHCHNScope;
          if (!v18)
            goto LABEL_28;
        }
        else
        {
          v18 = MEMORY[0x1E0C81028];
          v21 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "ClientEntry.mm";
          v79 = 1024;
          *(_DWORD *)v80 = 254;
          *(_WORD *)&v80[4] = 2080;
          *(_QWORD *)&v80[6] = "removeAssignedChannelWithID";
          _os_log_impl(&dword_1A0F4D000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Flushing or running, so queueing chan ID for later release", buf, 0x1Cu);
        }

LABEL_28:
        v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v73 + 488) + 16))(v73 + 488);
        v23 = *(_QWORD *)(v73 + 456);
        if (v23)
        {
          v24 = (uint8x8_t)vcnt_s8((int8x8_t)v23);
          v24.i16[0] = vaddlv_u8(v24);
          if (v24.u32[0] > 1uLL)
          {
            v7 = a3;
            if (v23 <= a3)
              v7 = a3 % v23;
          }
          else
          {
            v7 = (v23 - 1) & a3;
          }
          v26 = *(_QWORD **)(*(_QWORD *)(v73 + 448) + 8 * v7);
          if (v26)
          {
            for (i = (_QWORD *)*v26; i; i = (_QWORD *)*i)
            {
              v28 = i[1];
              if (v28 == a3)
              {
                if (i[2] == a3)
                  goto LABEL_136;
              }
              else
              {
                if (v24.u32[0] > 1uLL)
                {
                  if (v28 >= v23)
                    v28 %= v23;
                }
                else
                {
                  v28 &= v23 - 1;
                }
                if (v28 != v7)
                  break;
              }
            }
          }
        }
        v29 = (caulk::rt_safe_memory_resource **)MEMORY[0x1E0DDB4F0];
        if (!*MEMORY[0x1E0DDB4F0])
          goto LABEL_170;
        v72 = v22;
        v30 = caulk::rt_safe_memory_resource::rt_allocate((caulk::rt_safe_memory_resource *)*MEMORY[0x1E0DDB4F0]);
        v31 = (_QWORD *)(v73 + 464);
        *(_QWORD *)v30 = 0;
        *(_QWORD *)(v30 + 8) = a3;
        *(_QWORD *)(v30 + 16) = a3;
        *(_BYTE *)(v30 + 24) = 0;
        v32 = (float)(unint64_t)(*(_QWORD *)(v73 + 472) + 1);
        v33 = *(float *)(v73 + 480);
        if (v23 && (float)(v33 * (float)v23) >= v32)
        {
LABEL_126:
          v63 = *(uint64_t **)(*(_QWORD *)(v73 + 448) + 8 * v7);
          if (v63)
          {
            *(_QWORD *)v30 = *v63;
            v22 = v72;
          }
          else
          {
            *(_QWORD *)v30 = *(_QWORD *)(v73 + 464);
            *(_QWORD *)(v73 + 464) = v30;
            *(_QWORD *)(*(_QWORD *)(v73 + 448) + 8 * v7) = v31;
            v22 = v72;
            if (!*(_QWORD *)v30)
              goto LABEL_135;
            v64 = *(_QWORD *)(*(_QWORD *)v30 + 8);
            if ((v23 & (v23 - 1)) != 0)
            {
              if (v64 >= v23)
                v64 %= v23;
            }
            else
            {
              v64 &= v23 - 1;
            }
            v63 = (uint64_t *)(*(_QWORD *)(v73 + 448) + 8 * v64);
          }
          *v63 = v30;
LABEL_135:
          ++*(_QWORD *)(v73 + 472);
LABEL_136:
          if (v22)
            (*(void (**)(uint64_t))(*(_QWORD *)(v73 + 488) + 24))(v73 + 488);
          goto LABEL_138;
        }
        v34 = 1;
        if (v23 >= 3)
          v34 = (v23 & (v23 - 1)) != 0;
        v35 = v34 | (2 * v23);
        v36 = vcvtps_u32_f32(v32 / v33);
        if (v35 <= v36)
          prime = (int8x8_t)v36;
        else
          prime = (int8x8_t)v35;
        if (*(_QWORD *)&prime == 1)
        {
          prime = (int8x8_t)2;
        }
        else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
        {
          prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        }
        v23 = *(_QWORD *)(v73 + 456);
        if (*(_QWORD *)&prime > v23)
        {
LABEL_61:
          if (!(*(_QWORD *)&prime >> 61) && *v29)
          {
            v38 = caulk::rt_safe_memory_resource::rt_allocate(*v29);
            v39 = *(caulk::rt_safe_memory_resource **)(v73 + 448);
            *(_QWORD *)(v73 + 448) = v38;
            if (v39)
              std::allocator_traits<caulk::rt_allocator<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long,BOOL>,void *> *> *>>::deallocate[abi:ne180100](v39, *(_QWORD *)(v73 + 456));
            v40 = 0;
            *(int8x8_t *)(v73 + 456) = prime;
            do
              *(_QWORD *)(*(_QWORD *)(v73 + 448) + 8 * v40++) = 0;
            while (*(_QWORD *)&prime != v40);
            v41 = (_QWORD *)*v31;
            if (*v31)
            {
              v42 = v41[1];
              v43 = (uint8x8_t)vcnt_s8(prime);
              v43.i16[0] = vaddlv_u8(v43);
              if (v43.u32[0] > 1uLL)
              {
                if (v42 >= *(_QWORD *)&prime)
                  v42 %= *(_QWORD *)&prime;
              }
              else
              {
                v42 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*(_QWORD *)(v73 + 448) + 8 * v42) = v31;
              v60 = (_QWORD *)*v41;
              if (*v41)
              {
                do
                {
                  v61 = v60[1];
                  if (v43.u32[0] > 1uLL)
                  {
                    if (v61 >= *(_QWORD *)&prime)
                      v61 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v61 &= *(_QWORD *)&prime - 1;
                  }
                  if (v61 != v42)
                  {
                    v62 = *(_QWORD *)(v73 + 448);
                    if (!*(_QWORD *)(v62 + 8 * v61))
                    {
                      *(_QWORD *)(v62 + 8 * v61) = v41;
                      goto LABEL_117;
                    }
                    *v41 = *v60;
                    *v60 = **(_QWORD **)(*(_QWORD *)(v73 + 448) + 8 * v61);
                    **(_QWORD **)(*(_QWORD *)(v73 + 448) + 8 * v61) = v60;
                    v60 = v41;
                  }
                  v61 = v42;
LABEL_117:
                  v41 = v60;
                  v60 = (_QWORD *)*v60;
                  v42 = v61;
                }
                while (v60);
              }
            }
            v23 = (unint64_t)prime;
            goto LABEL_121;
          }
LABEL_170:
          __break(1u);
        }
        if (*(_QWORD *)&prime < v23)
        {
          v44 = vcvtps_u32_f32((float)*(unint64_t *)(v73 + 472) / *(float *)(v73 + 480));
          if (v23 < 3 || (v45 = (uint8x8_t)vcnt_s8((int8x8_t)v23), v45.i16[0] = vaddlv_u8(v45), v45.u32[0] > 1uLL))
          {
            v44 = std::__next_prime(v44);
          }
          else
          {
            v46 = 1 << -(char)__clz(v44 - 1);
            if (v44 >= 2)
              v44 = v46;
          }
          if (*(_QWORD *)&prime <= v44)
            prime = (int8x8_t)v44;
          if (*(_QWORD *)&prime >= v23)
          {
            v23 = *(_QWORD *)(v73 + 456);
          }
          else
          {
            if (prime)
              goto LABEL_61;
            v70 = *(caulk::rt_safe_memory_resource **)(v73 + 448);
            *(_QWORD *)(v73 + 448) = 0;
            if (v70)
              std::allocator_traits<caulk::rt_allocator<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long,BOOL>,void *> *> *>>::deallocate[abi:ne180100](v70, *(_QWORD *)(v73 + 456));
            v23 = 0;
            *(_QWORD *)(v73 + 456) = 0;
          }
        }
LABEL_121:
        if ((v23 & (v23 - 1)) != 0)
        {
          if (v23 <= a3)
            v7 = a3 % v23;
          else
            v7 = a3;
        }
        else
        {
          v7 = (v23 - 1) & a3;
        }
        goto LABEL_126;
      }
      if (kHCHNScope)
      {
        v25 = *(id *)kHCHNScope;
        if (!v25)
          goto LABEL_80;
      }
      else
      {
        v25 = MEMORY[0x1E0C81028];
        v47 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "ClientEntry.mm";
        v79 = 1024;
        *(_DWORD *)v80 = 234;
        *(_WORD *)&v80[4] = 2080;
        *(_QWORD *)&v80[6] = "removeAssignedChannelWithID";
        _os_log_impl(&dword_1A0F4D000, v25, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Not flushing or running, so directly releasing assigned channel", buf, 0x1Cu);
      }

LABEL_80:
      v75 = 0;
      v76 = 0;
      v48 = *(_QWORD *)(v73 + 432);
      v77 = 0;
      *(_QWORD *)buf = v73 + 256;
      buf[8] = 1;
      std::__shared_mutex_base::lock((std::__shared_mutex_base *)(v73 + 256));
      v49 = *(_QWORD **)(v73 + 240);
      *(_BYTE *)(v73 + 424) = 1;
      *(_QWORD *)&v80[2] = v73 + 232;
      *(_QWORD *)&v80[10] = v73 + 424;
      *(_QWORD *)&v80[18] = v48;
      if (!v49)
        goto LABEL_91;
      v50 = v73 + 240;
      do
      {
        v51 = v49[4];
        v52 = v51 >= a3;
        if (v51 >= a3)
          v53 = v49;
        else
          v53 = v49 + 1;
        if (v52)
          v50 = (uint64_t)v49;
        v49 = (_QWORD *)*v53;
      }
      while (*v53);
      if (v50 == v73 + 240 || *(_QWORD *)(v50 + 32) > a3)
      {
LABEL_91:
        *(_BYTE *)(v73 + 424) = 0;
        std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
        if (kHCHNScope)
        {
          if ((*(_BYTE *)(kHCHNScope + 8) & 1) != 0)
          {
            v54 = *(id *)kHCHNScope;
            if (v54)
            {
              v55 = v54;
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = "ClientEntry.mm";
                v79 = 1024;
                *(_DWORD *)v80 = 246;
                *(_WORD *)&v80[4] = 2080;
                *(_QWORD *)&v80[6] = "removeAssignedChannelWithID";
                *(_WORD *)&v80[14] = 1024;
                *(_DWORD *)&v80[16] = a3;
                _os_log_impl(&dword_1A0F4D000, v55, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: ChannelID %u not found", buf, 0x22u);
              }

            }
          }
        }
        v56 = -1;
        goto LABEL_98;
      }
      if (*(_DWORD *)(v50 + 40) != -1)
      {
        v67 = (AudioUnitElement *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(1uLL);
        *v67 = *(_DWORD *)(v50 + 40);
        v68 = v67 + 1;
        v76 = v67 + 1;
        v77 = &v67[v69];
        v75 = v67;
        v56 = -1;
        goto LABEL_164;
      }
      if (kHCHNScope && (*(_BYTE *)(kHCHNScope + 8) & 1) != 0)
      {
        v71 = *(id *)kHCHNScope;
        v67 = (AudioUnitElement *)v71;
        if (!v71)
        {
LABEL_163:
          v68 = 0;
          v56 = 0;
LABEL_164:
          std::__tree<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,caulk::alloc::consolidating_free_map<AQ::SharedPageAllocator,10485760ul>::FreelistOfSize>>>::__remove_node_pointer((uint64_t **)(v73 + 232), (uint64_t *)v50);
          operator delete((void *)v50);
          **(_BYTE **)&v80[10] = 0;
          std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
          if (v68 != v67)
          {
            ClientEntry::releaseSynthChannels(v73, &v75);
            v56 = 0;
          }
          if (v67)
          {
            v76 = v67;
            operator delete(v67);
          }
          if (!v56)
          {
LABEL_138:
            v20 = 0;
            goto LABEL_139;
          }
LABEL_98:
          if (kHCHNScope)
          {
            v57 = *(id *)kHCHNScope;
            if (!v57)
            {
LABEL_105:
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v56, 0);
              v19 = objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
          }
          else
          {
            v57 = MEMORY[0x1E0C81028];
            v58 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v59 = self->_clientID;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "AVHapticServer.mm";
            v79 = 1024;
            *(_DWORD *)v80 = 1458;
            *(_WORD *)&v80[4] = 2080;
            *(_QWORD *)&v80[6] = "-[AVHapticServerInstance removeChannel:reply:]";
            *(_WORD *)&v80[14] = 2048;
            *(_QWORD *)&v80[16] = v59;
            _os_log_impl(&dword_1A0F4D000, v57, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: clientID: 0x%lx - failed to release channel!", buf, 0x26u);
          }

          goto LABEL_105;
        }
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v82 = 136315650;
          v83 = "ClientEntry.mm";
          v84 = 1024;
          v85 = 241;
          v86 = 2080;
          v87 = "operator()";
          _os_log_impl(&dword_1A0F4D000, (os_log_t)v67, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Channel was already released", v82, 0x1Cu);
        }

      }
      v67 = 0;
      goto LABEL_163;
    }
  }
  else
  {
    v74 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4812, 0);
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_23:
  v20 = (void *)v19;
LABEL_139:
  v6[2](v6, v20);

  if (v74)
  {
    p_shared_owners = (unint64_t *)&v74->__shared_owners_;
    do
      v66 = __ldaxr(p_shared_owners);
    while (__stlxr(v66 - 1, p_shared_owners));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
  objc_sync_exit(v11);

}

- (void)setChannelEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 reply:(id)a5
{
  void (**v8)(id, id);
  NSObject *v9;
  id v10;
  unint64_t clientID;
  AVHapticServer *master;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  unint64_t v17;
  unsigned int AssignedChannelWithID;
  id v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, id))a5;
  if (kHSRVScope)
  {
    v9 = *(id *)kHSRVScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    v25 = "AVHapticServer.mm";
    v26 = 1024;
    v27 = 1471;
    v28 = 2080;
    v29 = "-[AVHapticServerInstance setChannelEventBehavior:behavior:reply:]";
    v30 = 2048;
    v31 = clientID;
    v32 = 1024;
    v33 = a4;
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx behavior: %u", buf, 0x2Cu);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    v22 = 0;
    v23 = 0;
    goto LABEL_14;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!v22)
  {
LABEL_14:
    v14 = -4812;
    goto LABEL_15;
  }
  if (!kHSRVScope)
  {
    v13 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
    goto LABEL_17;
  }
  v13 = *(id *)kHSRVScope;
  if (v13)
  {
LABEL_17:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(v22 + 24);
      *(_DWORD *)buf = 136316418;
      v25 = "ClientEntry.mm";
      v26 = 1024;
      v27 = 795;
      v28 = 2080;
      v29 = "setChannelBehaviorForChannelID";
      v30 = 2048;
      v31 = v17;
      v32 = 1024;
      v33 = a3;
      v34 = 1024;
      v35 = a4;
      _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Channel behavior change: Client ID 0x%lx, channelID: 0x%x, behavior: %u", buf, 0x32u);
    }

  }
  AssignedChannelWithID = ClientEntry::getAssignedChannelWithID((ClientEntry *)v22, a3);
  if (AssignedChannelWithID != -1)
  {
    ClientEntry::setChannelBehaviorForSynthChannel((ClientEntry *)v22, AssignedChannelWithID, a4);
    v15 = 0;
    goto LABEL_22;
  }
  v14 = -4804;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v14, 0, v22);
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
  v19 = v15;
  v8[2](v8, v19);

  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

}

- (void)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channelIndex:(unint64_t)a5 reply:(id)a6
{
  unsigned int v6;
  void (**v10)(id, void *);
  NSObject *v11;
  id v12;
  unint64_t clientID;
  AVHapticServer *master;
  std::__shared_weak_count *v15;
  ClientEntry *v16;
  unint64_t *v17;
  unint64_t v18;
  unsigned int SequencerChannelForIndex;
  uint64_t v20;
  void *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE buf[18];
  __int16 v30;
  const char *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v6 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *))a6;
  if (kHSRVScope)
  {
    v11 = *(id *)kHSRVScope;
    if (!v11)
      goto LABEL_8;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    clientID = self->_clientID;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVHapticServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1484;
    v30 = 2080;
    v31 = "-[AVHapticServerInstance setSequenceEventBehavior:behavior:channelIndex:reply:]";
    v32 = 2048;
    v33 = clientID;
    v34 = 1024;
    v35 = a4;
    _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: [via xpc] clientID: 0x%lx behavior: %u", buf, 0x2Cu);
  }

LABEL_8:
  master = self->_master;
  if (!master)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    goto LABEL_17;
  }
  -[AVHapticServer entryWithID:](master, "entryWithID:", self->_clientID);
  if (!*(_QWORD *)buf)
  {
LABEL_17:
    v20 = -4812;
    goto LABEL_18;
  }
  -[AVHapticServer manager](self->_master, "manager");
  v16 = *(ClientEntry **)buf;
  v15 = *(std::__shared_weak_count **)&buf[8];
  v27 = *(_QWORD *)buf;
  v28 = *(_QWORD *)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v17 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  SequencerChannelForIndex = ClientEntry::getSequencerChannelForIndex(v16, a3, v6);
  if (SequencerChannelForIndex == -1)
  {
    v20 = -4804;
    if (!v15)
      goto LABEL_24;
  }
  else
  {
    ClientEntry::setChannelBehaviorForSynthChannel(v16, SequencerChannelForIndex, a4);
    v20 = 0;
    if (!v15)
      goto LABEL_24;
  }
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    v23 = __ldaxr(p_shared_owners);
  while (__stlxr(v23 - 1, p_shared_owners));
  if (!v23)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
LABEL_24:
  if (SequencerChannelForIndex != -1)
  {
    v21 = 0;
    goto LABEL_26;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v20, 0, v27, v28, *(_QWORD *)buf);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
  v10[2](v10, v21);

  v24 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v25 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

}

- (void)debugExpectNotifyOnFinishAfter:(double)a3 reply:(id)a4
{
  (*((void (**)(id, double))a4 + 2))(a4, a3);
}

- (AVHapticServer)master
{
  return (AVHapticServer *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (BOOL)clientSuspended
{
  return self->_clientSuspended;
}

- (void)setClientSuspended:(BOOL)a3
{
  self->_clientSuspended = a3;
}

- (BOOL)wasPrewarmedAndSuspended
{
  return self->_wasPrewarmedAndSuspended;
}

- (void)setWasPrewarmedAndSuspended:(BOOL)a3
{
  self->_wasPrewarmedAndSuspended = a3;
}

- (BOOL)clientInterrupted
{
  return self->_clientInterrupted;
}

- (void)setClientInterrupted:(BOOL)a3
{
  self->_clientInterrupted = a3;
}

- (BOOL)runningInBackground
{
  return self->_runningInBackground;
}

- (void)setRunningInBackground:(BOOL)a3
{
  self->_runningInBackground = a3;
}

- (BOOL)prewarmIncludesHaptics
{
  return self->_prewarmIncludesHaptics;
}

- (void)setPrewarmIncludesHaptics:(BOOL)a3
{
  self->_prewarmIncludesHaptics = a3;
}

- (BOOL)prewarmIncludesAudio
{
  return self->_prewarmIncludesAudio;
}

- (void)setPrewarmIncludesAudio:(BOOL)a3
{
  self->_prewarmIncludesAudio = a3;
}

- (BOOL)runIncludesHaptics
{
  return self->_runIncludesHaptics;
}

- (void)setRunIncludesHaptics:(BOOL)a3
{
  self->_runIncludesHaptics = a3;
}

- (BOOL)runIncludesAudio
{
  return self->_runIncludesAudio;
}

- (void)setRunIncludesAudio:(BOOL)a3
{
  self->_runIncludesAudio = a3;
}

- (BOOL)wasRunningAndSuspended
{
  return self->_wasRunningAndSuspended;
}

- (void)setWasRunningAndSuspended:(BOOL)a3
{
  self->_wasRunningAndSuspended = a3;
}

- (void).cxx_destruct
{
  void *mCFObject;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;

  objc_storeStrong((id *)&self->_listenerWrapper, 0);
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_aqmeSession.mDescription.var0);
  if (*((char *)&self->_aqmeSession.mDescription.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_aqmeSession.mDescription.__r_.__value_.var0.__l.__data_);
  mCFObject = self->_aqmeSession.mSubsessionRef.mCFObject;
  if (mCFObject)
    CFRelease(mCFObject);
  cntrl = self->_clientSession.__cntrl_;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  std::shared_ptr<PowerUsageWatchdog::ClientDescription>::~shared_ptr[abi:ne180100]((uint64_t)&self->_hapticSession);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_master, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 76) = 0;
  *((_BYTE *)self + 128) = 0;
  *((_BYTE *)self + 136) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *(_OWORD *)((char *)self + 108) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *(_OWORD *)((char *)self + 57) = 0u;
  return self;
}

void __38__AVHapticServerInstance_stopRunning___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (!WeakRetained)
  {
    if (kHSRVScope)
    {
      v4 = *(id *)kHSRVScope;
      if (!v4)
      {
LABEL_9:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -4898;
        goto LABEL_10;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "AVHapticServer.mm";
      v17 = 1024;
      v18 = 1353;
      _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: Haptic server master is nil - cannot stop!", buf, 0x12u);
    }

    goto LABEL_9;
  }
LABEL_10:
  v6 = objc_loadWeakRetained(v2);
  v7 = *(std::__shared_weak_count **)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  objc_msgSend(v6, "doStopRunning:audio:haptics:", &v13, objc_msgSend(*(id *)(a1 + 32), "runIncludesAudio", v13), objc_msgSend(*(id *)(a1 + 32), "runIncludesHaptics"));
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

}

void __37__AVHapticServerInstance_stopRunning__block_invoke(uint64_t a1)
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  objc_msgSend(*(id *)(a1 + 32), "setWasRunningAndSuspended:", 0);
  objc_msgSend(*(id *)(a1 + 32), "master");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  objc_msgSend(v2, "doStopRunning:audio:haptics:", &v9, objc_msgSend(*(id *)(a1 + 32), "runIncludesAudio", v9), objc_msgSend(*(id *)(a1 + 32), "runIncludesHaptics"));
  v6 = v10;
  if (v10)
  {
    v7 = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

uint64_t __39__AVHapticServerInstance_startRunning___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "unmuteClientAfterSessionInterruption:", a2);
}

void __39__AVHapticServerInstance_startRunning___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  id *v6;
  id WeakRetained;
  id v8;
  int v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  int v15;
  NSObject *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = 0;
  else
    v5 = *(_BYTE *)(*(_QWORD *)a2 + 96) & 1;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRunIncludesHaptics:", v5);

  v8 = objc_loadWeakRetained(v6);
  v9 = objc_msgSend(v8, "runIncludesHaptics");

  if (!v9)
    goto LABEL_12;
  if (kHSRVScope)
  {
    v10 = *(id *)kHSRVScope;
    if (!v10)
      goto LABEL_12;
  }
  else
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315650;
    v19 = "AVHapticServer.mm";
    v20 = 1024;
    v21 = 1310;
    v22 = 2080;
    v23 = "-[AVHapticServerInstance startRunning:]_block_invoke_2";
    _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: runIncludesHaptics set to YES for this client", (uint8_t *)&v18, 0x1Cu);
  }

LABEL_12:
  if (a3)
    v12 = 0;
  else
    v12 = (*(unsigned __int8 *)(*(_QWORD *)a2 + 96) >> 1) & 1;
  v13 = objc_loadWeakRetained(v6);
  objc_msgSend(v13, "setRunIncludesAudio:", v12);

  v14 = objc_loadWeakRetained(v6);
  v15 = objc_msgSend(v14, "runIncludesAudio");

  if (v15)
  {
    if (kHSRVScope)
    {
      v16 = *(id *)kHSRVScope;
      if (!v16)
        return;
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = "AVHapticServer.mm";
      v20 = 1024;
      v21 = 1312;
      v22 = 2080;
      v23 = "-[AVHapticServerInstance startRunning:]_block_invoke";
      _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: runIncludesAudio set to YES for this client", (uint8_t *)&v18, 0x1Cu);
    }

  }
}

void __37__AVHapticServerInstance_stopPrewarm__block_invoke(uint64_t a1)
{
  id WeakRetained;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  objc_msgSend(*(id *)(a1 + 32), "setWasPrewarmedAndSuspended:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(std::__shared_weak_count **)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  objc_msgSend(WeakRetained, "doStopPrewarm:audio:haptics:", &v9, objc_msgSend(*(id *)(a1 + 32), "prewarmIncludesAudio", v9), objc_msgSend(*(id *)(a1 + 32), "prewarmIncludesHaptics"));
  v6 = v10;
  if (v10)
  {
    v7 = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

uint64_t __34__AVHapticServerInstance_prewarm___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  objc_msgSend(*(id *)(a1 + 32), "setWasPrewarmedAndSuspended:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v4 = *(std::__shared_weak_count **)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "doPrewarm:", &v13);
  v7 = v14;
  if (v14)
  {
    v8 = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v10 = 0;
  else
    v10 = *(_BYTE *)(*(_QWORD *)(a1 + 56) + 96) & 1;
  objc_msgSend(*(id *)(a1 + 32), "setPrewarmIncludesHaptics:", v10, v13);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v11 = 0;
  else
    v11 = (*(unsigned __int8 *)(*(_QWORD *)(a1 + 56) + 96) >> 1) & 1;
  return objc_msgSend(*(id *)(a1 + 32), "setPrewarmIncludesAudio:", v11);
}

void __54__AVHapticServerInstance_prepareHapticSequence_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1A1B082CC]();
    objc_msgSend(WeakRetained, "getAsyncDelegateForMethod:errorHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_80);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (kHSRVScope)
    {
      v7 = *(id *)kHSRVScope;
      if (!v7)
      {
LABEL_9:
        objc_msgSend(v6, "sequenceFinished:error:", a2, 0);

        objc_autoreleasePoolPop(v5);
        goto LABEL_10;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = "AVHapticServer.mm";
      v11 = 1024;
      v12 = 1233;
      v13 = 2080;
      v14 = "-[AVHapticServerInstance prepareHapticSequence:reply:]_block_invoke";
      v15 = 1024;
      v16 = a2;
      _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: <Calling sequenceFinished: on client delegate for seqID %u>", (uint8_t *)&v9, 0x22u);
    }

    goto LABEL_9;
  }
LABEL_10:

}

void __54__AVHapticServerInstance_prepareHapticSequence_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "AVHapticServer.mm";
    v9 = 1024;
    v10 = 1231;
    v11 = 2080;
    v12 = "-[AVHapticServerInstance prepareHapticSequence:reply:]_block_invoke_2";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to notify client of sequence finish: %@", (uint8_t *)&v7, 0x26u);

  }
LABEL_8:

}

void __48__AVHapticServerInstance_releaseClientResources__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setWasRunningAndSuspended:", 0);

  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(std::__shared_weak_count **)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  objc_msgSend(v3, "doStopRunning:audio:haptics:", &v10, objc_msgSend(*(id *)(a1 + 32), "runIncludesAudio", v10), objc_msgSend(*(id *)(a1 + 32), "runIncludesHaptics"));
  v7 = v11;
  if (v11)
  {
    v8 = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

void __50__AVHapticServerInstance_queryCapabilities_reply___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  _QWORD *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned int *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const CALog::Scope *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *__p[3];
  unsigned int *v57[3];
  unsigned int *v58[3];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  _QWORD *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (kHSRVScope)
  {
    if ((*(_BYTE *)(kHSRVScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHSRVScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v60 = "AVHapticServer.mm";
          v61 = 1024;
          v62 = 921;
          v63 = 2080;
          v64 = "-[AVHapticServerInstance queryCapabilities:reply:]_block_invoke";
          v65 = 2112;
          v66 = v7;
          _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: key: %@", buf, 0x26u);
        }

      }
    }
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SupportsHapticPlayback")))
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v7);

    goto LABEL_42;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SupportsAudioPlayback"))
    || objc_msgSend(v7, "isEqualToString:", CFSTR("SupportsAdvancedPatternPlayers")))
  {
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HapticContinuousTimeLimit")))
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, v7);

    goto LABEL_42;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("UsingInternalHaptics")))
  {
LABEL_15:
    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, v7);

    goto LABEL_42;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("BuiltInAudioEventIDs")))
  {
    v17 = *(void **)(a1 + 32);
    ClientEntry::getBuiltInAudioEventsDictionary(*(ClientEntry **)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, v7);

    goto LABEL_42;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HapticTransientDefaultIntensity")))
  {
    v20 = *(_QWORD *)(a1 + 64);
    if (v20)
    {
      v21 = *(void **)(a1 + 32);
      LODWORD(v19) = *(_DWORD *)(v20 + 36);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v22, v7);

    }
    goto LABEL_42;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HapticTransientDefaultSharpness")))
  {
    v24 = *(_QWORD *)(a1 + 64);
    if (v24)
    {
      v25 = *(void **)(a1 + 32);
      LODWORD(v23) = *(_DWORD *)(v24 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", v26, v7);

    }
    goto LABEL_42;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HapticContinuousDefaultIntensity")))
  {
    v28 = *(_QWORD *)(a1 + 64);
    if (v28)
    {
      v29 = *(void **)(a1 + 32);
      LODWORD(v27) = *(_DWORD *)(v28 + 44);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v30, v7);

    }
    goto LABEL_42;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HapticContinuousDefaultSharpness")))
  {
    v32 = *(_QWORD *)(a1 + 64);
    if (v32)
    {
      v33 = *(void **)(a1 + 32);
      LODWORD(v31) = *(_DWORD *)(v32 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v34, v7);

    }
    goto LABEL_42;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HapticTransientEventIDs")))
  {
    v35 = *(_QWORD *)(a1 + 64);
    if (!v35)
      goto LABEL_42;
    v36 = *(void **)(a1 + 32);
    memset(v58, 0, sizeof(v58));
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v58, *(const void **)(v35 + 56), *(_QWORD *)(v35 + 64), (uint64_t)(*(_QWORD *)(v35 + 64) - *(_QWORD *)(v35 + 56)) >> 2);
    vectorOfUInt32ToNSArray(v58);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v37, v7);

    v38 = v58[0];
    if (!v58[0])
      goto LABEL_42;
    goto LABEL_41;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HapticContinuousSustainedEventIDs")))
  {
    v39 = *(_QWORD *)(a1 + 64);
    if (!v39)
      goto LABEL_42;
    v40 = *(void **)(a1 + 32);
    memset(v57, 0, sizeof(v57));
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v57, *(const void **)(v39 + 80), *(_QWORD *)(v39 + 88), (uint64_t)(*(_QWORD *)(v39 + 88) - *(_QWORD *)(v39 + 80)) >> 2);
    vectorOfUInt32ToNSArray(v57);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKey:", v41, v7);

    v38 = v57[0];
    if (!v57[0])
      goto LABEL_42;
    goto LABEL_41;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HapticContinuousNonsustainedEventIDs")))
  {
    v42 = *(_QWORD *)(a1 + 64);
    if (!v42)
      goto LABEL_42;
    v43 = *(void **)(a1 + 32);
    memset(__p, 0, sizeof(__p));
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(__p, *(const void **)(v42 + 104), *(_QWORD *)(v42 + 112), (uint64_t)(*(_QWORD *)(v42 + 112) - *(_QWORD *)(v42 + 104)) >> 2);
    vectorOfUInt32ToNSArray((unsigned int **)__p);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v44, v7);

    v38 = (unsigned int *)__p[0];
    if (!__p[0])
      goto LABEL_42;
LABEL_41:
    operator delete(v38);
    goto LABEL_42;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RequestedPriority")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("RequestedPowerUsage")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("RequestedUsageCategory")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("AllowBackgroundHaptics")) & 1) != 0)
  {
    goto LABEL_42;
  }
  if (*(char *)(a1 + 103) < 0)
    v46 = *(_QWORD *)(a1 + 88);
  else
    v46 = *(unsigned __int8 *)(a1 + 103);
  if (!v46)
  {
    CALog::LogObjIfEnabled((CALog *)2, kHSRVScope, v45);
    v49 = objc_claimAutoreleasedReturnValue();
    v48 = v49;
    if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v60 = "AVHapticServer.mm";
      v61 = 1024;
      v62 = 992;
      v63 = 2080;
      v64 = "-[AVHapticServerInstance queryCapabilities:reply:]_block_invoke";
      v65 = 2112;
      v66 = v7;
      _os_log_impl(&dword_1A0F4D000, v48, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Unrecognized server query: '%@'", buf, 0x26u);
    }
    goto LABEL_56;
  }
  if (!*(_BYTE *)(a1 + 104) || *(_QWORD *)(a1 + 64))
  {
    CALog::LogObjIfEnabled((CALog *)4, kHSRVScope, v45);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47 && os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v60 = "AVHapticServer.mm";
      v61 = 1024;
      v62 = 988;
      v63 = 2080;
      v64 = "-[AVHapticServerInstance queryCapabilities:reply:]_block_invoke";
      _os_log_impl(&dword_1A0F4D000, v48, OS_LOG_TYPE_INFO, "%25s:%-5d %s: No Localities supported by server - ignoring", buf, 0x1Cu);
    }
LABEL_56:

    goto LABEL_42;
  }
  CALog::LogObjIfEnabled((CALog *)1, kHSRVScope, v45);
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50 && os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    v52 = (_QWORD *)(a1 + 80);
    if (*(char *)(a1 + 103) < 0)
      v52 = (_QWORD *)*v52;
    *(_DWORD *)buf = 136315906;
    v60 = "AVHapticServer.mm";
    v61 = 1024;
    v62 = 983;
    v63 = 2080;
    v64 = "-[AVHapticServerInstance queryCapabilities:reply:]_block_invoke";
    v65 = 2080;
    v66 = v52;
    _os_log_impl(&dword_1A0F4D000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to find Locality: %s", buf, 0x26u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4850, 0);
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v55 = *(void **)(v54 + 40);
  *(_QWORD *)(v54 + 40) = v53;

  *a4 = 1;
LABEL_42:

}

uint64_t __65__AVHapticServerInstance_setupAudioSessionFromID_isShared_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "muteClientForRingerSwitch:", 1);
}

uint64_t __65__AVHapticServerInstance_setupAudioSessionFromID_isShared_error___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleClientApplicationStateChangeUsingAppState:", *(unsigned int *)(a1 + 40));
}

void __47__AVHapticServerInstance_handleConnectionError__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  id v5;
  id *v6;
  id v7;
  id v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  id v15;
  id v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (!WeakRetained)
  {
    if (kHSRVScope)
    {
      v4 = *(id *)kHSRVScope;
      if (!v4)
        goto LABEL_9;
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v32 = "AVHapticServer.mm";
      v33 = 1024;
      v34 = 692;
      v35 = 2080;
      v36 = "-[AVHapticServerInstance handleConnectionError]_block_invoke";
      _os_log_impl(&dword_1A0F4D000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Server master is already nil - no call to stop prewarm or running possible", buf, 0x1Cu);
    }

  }
LABEL_9:
  v6 = (id *)(a1 + 48);
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "setWasPrewarmedAndSuspended:", 0);

  v8 = objc_loadWeakRetained(v2);
  v9 = *(std::__shared_weak_count **)(a1 + 64);
  v29 = *(_QWORD *)(a1 + 56);
  v30 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  objc_msgSend(v8, "doStopPrewarm:audio:haptics:", &v29, objc_msgSend(*(id *)(a1 + 32), "prewarmIncludesAudio"), objc_msgSend(*(id *)(a1 + 32), "prewarmIncludesHaptics"));
  v12 = v30;
  if (v30)
  {
    v13 = (unint64_t *)&v30->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  v15 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v15, "setWasRunningAndSuspended:", 0);

  v16 = objc_loadWeakRetained(v2);
  v17 = *(std::__shared_weak_count **)(a1 + 64);
  v27 = *(_QWORD *)(a1 + 56);
  v28 = v17;
  if (v17)
  {
    v18 = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  objc_msgSend(v16, "doStopRunning:audio:haptics:", &v27, objc_msgSend(*(id *)(a1 + 32), "runIncludesAudio", v27), objc_msgSend(*(id *)(a1 + 32), "runIncludesHaptics"));
  v20 = v28;
  if (v28)
  {
    v21 = (unint64_t *)&v28->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  v23 = objc_loadWeakRetained(v6);
  objc_msgSend(v23, "setClientSuspended:", 0);

  v24 = objc_loadWeakRetained(v6);
  objc_msgSend(v24, "setWasPrewarmedAndSuspended:", 0);

  v25 = objc_loadWeakRetained(v6);
  objc_msgSend(v25, "setClientInterrupted:", 0);

  v26 = objc_loadWeakRetained(v6);
  objc_msgSend(v26, "setRunningInBackground:", 0);

}

uint64_t __48__AVHapticServerInstance_removeSessionListeners__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeListener:withAudioSessionID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __61__AVHapticServerInstance_notifyClientOnStopWithReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (kHSRVScope)
  {
    v3 = *(id *)kHSRVScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "AVHapticServer.mm";
    v9 = 1024;
    v10 = 336;
    v11 = 2080;
    v12 = "-[AVHapticServerInstance notifyClientOnStopWithReason:error:]_block_invoke";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unable to notify client of stop: %@", (uint8_t *)&v7, 0x26u);

  }
LABEL_8:

}

void __64__AVHapticServerInstance_getSyncDelegateForMethod_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kHSRVScope)
    {
      v4 = *(id *)kHSRVScope;
      if (!v4)
        goto LABEL_9;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v9 = objc_msgSend(WeakRetained, "clientID");
      objc_msgSend(v3, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136316418;
      v12 = "AVHapticServer.mm";
      v13 = 1024;
      v14 = 327;
      v15 = 2080;
      v16 = "-[AVHapticServerInstance getSyncDelegateForMethod:errorHandler:]_block_invoke";
      v17 = 2112;
      v18 = v7;
      v19 = 1024;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Sync XPC call for '%@' (client ID 0x%x) failed: %@", (uint8_t *)&v11, 0x36u);

    }
  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__AVHapticServerInstance_getAsyncDelegateForMethod_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (kHSRVScope)
    {
      v4 = *(id *)kHSRVScope;
      if (!v4)
        goto LABEL_9;
    }
    else
    {
      v4 = (id)MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    v6 = v4;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v9 = objc_msgSend(WeakRetained, "clientID");
      objc_msgSend(v3, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136316418;
      v12 = "AVHapticServer.mm";
      v13 = 1024;
      v14 = 316;
      v15 = 2080;
      v16 = "-[AVHapticServerInstance getAsyncDelegateForMethod:errorHandler:]_block_invoke";
      v17 = 2112;
      v18 = v7;
      v19 = 1024;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Async XPC call for '%@' (client ID 0x%x) failed: %@", (uint8_t *)&v11, 0x36u);

    }
  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
