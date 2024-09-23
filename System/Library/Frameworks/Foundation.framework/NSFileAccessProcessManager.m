@implementation NSFileAccessProcessManager

- (void)dealloc
{
  OS_xpc_object *connection;
  NSObject *queue;
  id assertionToken;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[NSFileAccessProcessMonitor removeProcessManager:forPID:](+[NSFileAccessProcessMonitor sharedInstance](NSFileAccessProcessMonitor, "sharedInstance"), "removeProcessManager:forPID:", self, self->_pid);
  connection = self->_connection;
  if (connection)
    xpc_release(connection);
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);

  assertionToken = self->_assertionToken;
  if (assertionToken)
  {
    -[_NSFileAccessAsynchronousProcessAssertionScheduler removeAssertionWithToken:](+[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance](_NSFileAccessAsynchronousProcessAssertionScheduler, "sharedInstance"), "removeAssertionWithToken:", self->_assertionToken);
    assertionToken = self->_assertionToken;
  }

  v6.receiver = self;
  v6.super_class = (Class)NSFileAccessProcessManager;
  -[NSFileAccessProcessManager dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  -[NSFileAccessProcessManager setSuspensionHandler:](self, "setSuspensionHandler:", 0);
  -[NSFileAccessProcessMonitor removeProcessManager:forPID:](+[NSFileAccessProcessMonitor sharedInstance](NSFileAccessProcessMonitor, "sharedInstance"), "removeProcessManager:forPID:", self, self->_pid);
  -[NSFileAccessProcessManager allowSuspension](self, "allowSuspension");
}

- (void)_ensureMonitor
{
  if ((self->_suspensionHandler || self->_pendingMessageCount >= 1)
    && +[NSFileAccessProcessManager needToManageConnection:forURLs:](NSFileAccessProcessManager, "needToManageConnection:forURLs:", self->_connection, self->_urls))
  {
    -[NSFileAccessProcessMonitor addProcessManager:forPID:](+[NSFileAccessProcessMonitor sharedInstance](NSFileAccessProcessMonitor, "sharedInstance"), "addProcessManager:forPID:", self, self->_pid);
  }
  else
  {
    -[NSFileAccessProcessMonitor removeProcessManager:forPID:](+[NSFileAccessProcessMonitor sharedInstance](NSFileAccessProcessMonitor, "sharedInstance"), "removeProcessManager:forPID:", self, self->_pid);
  }
}

- (void)preventSuspensionWithActivityName:(id)a3
{
  void *v5;
  uint64_t pid;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A3F0 != -1)
    dispatch_once(&qword_1ECD0A3F0, &__block_literal_global_93);
  if (_MergedGlobals_138
    && +[NSFileAccessProcessManager needToManageConnection:forURLs:](NSFileAccessProcessManager, "needToManageConnection:forURLs:", self->_connection, self->_urls)&& !self->_assertionToken)
  {
    v5 = (void *)xpc_connection_copy_bundle_id();
    if (v5)
    {
      pid = xpc_connection_get_pid(self->_connection);
      v7 = _NSFCProcessMonitorLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8[0] = 67109378;
        v8[1] = pid;
        v9 = 2114;
        v10 = a3;
        _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "Scheduling suspension prevention of pid %d for activity: %{public}@", (uint8_t *)v8, 0x12u);
      }
      self->_assertionToken = -[_NSFileAccessAsynchronousProcessAssertionScheduler addAssertionWithName:forPID:](+[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance](_NSFileAccessAsynchronousProcessAssertionScheduler, "sharedInstance"), "addAssertionWithName:forPID:", a3, pid);
    }
    free(v5);
  }
}

+ (BOOL)needToManageConnection:(id)a3 forURLs:(id)a4
{
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const char *v9;
  NSString *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __CFString *v16;
  NSObject *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  const __CFString *v24;
  NSObject *v25;
  __int128 v27;
  const __CFString *v28;
  CFTypeRef cf;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  uint64_t v38;
  char buffer[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a4, "count"))
    return 0;
  if (qword_1ECD0A3C8 != -1)
    dispatch_once(&qword_1ECD0A3C8, &__block_literal_global_63);
  if (!off_1ECD0A3C0)
  {
    v19 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buffer = 0;
      _os_log_error_impl(&dword_1817D9000, v19, OS_LOG_TYPE_ERROR, "Could not find SecTaskCopySigningIdentifier symbol", (uint8_t *)buffer, 2u);
    }
    return 1;
  }
  v41 = 0u;
  v42 = 0u;
  xpc_connection_get_audit_token();
  v5 = *MEMORY[0x1E0C9AE30];
  *(_OWORD *)buffer = 0u;
  v40 = 0u;
  v6 = (const __CFString *)off_1ECD0A3B8(v5, buffer);
  cf = 0;
  v7 = (const __CFString *)off_1ECD0A3C0(v6, &cf);
  if (!v7)
  {
    v20 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buffer = 138412290;
      *(_QWORD *)&buffer[4] = cf;
      _os_log_error_impl(&dword_1817D9000, v20, OS_LOG_TYPE_ERROR, "Could not get signing identifier: %@", (uint8_t *)buffer, 0xCu);
    }
    if (cf)
      CFRelease(cf);
    goto LABEL_41;
  }
  v8 = v7;
  if (!CFStringGetCStringPtr(v7, 0x8000100u) && !CFStringGetCString(v8, buffer, 1024, 0x8000100u))
  {
    v25 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v8;
      _os_log_error_impl(&dword_1817D9000, v25, OS_LOG_TYPE_ERROR, "Could not convert signing identifier %{public}@", buf, 0xCu);
    }
LABEL_41:
    v24 = v6;
LABEL_42:
    CFRelease(v24);
    return 1;
  }
  v9 = (const char *)container_create_or_lookup_path_for_current_user();
  if (!v9)
  {
    v22 = _NSFCProcessMonitorLog();
    v23 = v22;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v8;
      v37 = 2048;
      v38 = 1;
      _os_log_error_impl(&dword_1817D9000, v23, OS_LOG_TYPE_ERROR, "Could not get container for signing identifier %{public}@. Error: %llu", buf, 0x16u);
    }
    CFRelease(v6);
    v24 = v8;
    goto LABEL_42;
  }
  v10 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", v9, strlen(v9), 4, 1);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v32;
    *(_QWORD *)&v12 = 138478083;
    v27 = v12;
    v28 = v6;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(a4);
        v16 = (__CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "path", v27);
        if (-[__CFString hasPrefix:](v16, "hasPrefix:", CFSTR("/var")))
          v16 = (__CFString *)objc_msgSend(CFSTR("/private"), "stringByAppendingString:", v16);
        if (!-[__CFString hasPrefix:](v16, "hasPrefix:", v10)
          || -[__CFString containsString:](v16, "containsString:", CFSTR("/com.apple.watchconnectivity/")))
        {
          v21 = _NSFCProcessMonitorLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543619;
            v36 = v8;
            v37 = 2113;
            v38 = (uint64_t)v16;
            _os_log_debug_impl(&dword_1817D9000, v21, OS_LOG_TYPE_DEBUG, "Will be managing connection for %{public}@ because path is not private %{private}@", buf, 0x16u);
          }
          v18 = 1;
          v6 = v28;
          goto LABEL_35;
        }
        v17 = _NSFCProcessMonitorLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v27;
          v36 = v16;
          v37 = 2114;
          v38 = (uint64_t)v8;
          _os_log_debug_impl(&dword_1817D9000, v17, OS_LOG_TYPE_DEBUG, "Skipping path %{private}@ for %{public}@ because path it is private", buf, 0x16u);
        }
      }
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      v18 = 0;
      v6 = v28;
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_35:
  CFRelease(v6);
  CFRelease(v8);

  return v18;
}

- (void)setSuspensionHandler:(id)a3
{
  id suspensionHandler;

  suspensionHandler = self->_suspensionHandler;
  if (suspensionHandler != a3)
  {

    self->_suspensionHandler = (id)objc_msgSend(a3, "copy");
    -[NSFileAccessProcessManager _ensureMonitor](self, "_ensureMonitor");
  }
}

- (void)setURLs:(id)a3
{
  NSArray *urls;

  urls = self->_urls;
  if (urls != a3)
  {

    self->_urls = (NSArray *)objc_msgSend(a3, "copy");
    -[NSFileAccessProcessManager _ensureMonitor](self, "_ensureMonitor");
  }
}

- (NSFileAccessProcessManager)initWithClient:(id)a3 queue:(id)a4
{
  NSFileAccessProcessManager *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFileAccessProcessManager;
  v6 = -[NSFileAccessProcessManager init](&v8, sel_init);
  if (v6)
  {
    v6->_connection = (OS_xpc_object *)xpc_retain(a3);
    v6->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }
  return v6;
}

- (void)allowSuspension
{
  NSObject *v3;
  id assertionToken;
  pid_t pid;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    pid = xpc_connection_get_pid(self->_connection);
    v6[0] = 67109120;
    v6[1] = pid;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Re-allowing suspension for pid: %d", (uint8_t *)v6, 8u);
  }
  assertionToken = self->_assertionToken;
  if (assertionToken)
  {
    -[_NSFileAccessAsynchronousProcessAssertionScheduler removeAssertionWithToken:](+[_NSFileAccessAsynchronousProcessAssertionScheduler sharedInstance](_NSFileAccessAsynchronousProcessAssertionScheduler, "sharedInstance"), "removeAssertionWithToken:", self->_assertionToken);
    assertionToken = self->_assertionToken;
  }

  self->_assertionToken = 0;
}

void *__61__NSFileAccessProcessManager_needToManageConnection_forURLs___block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (result)
  {
    v1 = result;
    off_1ECD0A3B8 = (uint64_t (*)(_QWORD, _QWORD))dlsym(result, "SecTaskCreateWithAuditToken");
    result = dlsym(v1, "SecTaskCopySigningIdentifier");
    off_1ECD0A3C0 = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

- (void)processSuspended
{
  NSObject *queue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__NSFileAccessProcessManager_processSuspended__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = self;
  dispatch_async(queue, v3);
}

uint64_t __46__NSFileAccessProcessManager_processSuspended__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t result;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Detected process suspension: %i", (uint8_t *)v7, 8u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v4 + 32);
  if (result)
  {
    result = (*(uint64_t (**)(void))(result + 16))();
    v4 = *(_QWORD *)(a1 + 32);
  }
  if (*(int *)(v4 + 56) >= 1)
  {
    v6 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEFAULT, "Killing process because it has oustanding messages", (uint8_t *)v7, 2u);
    }
    return objc_msgSend(*(id *)(a1 + 32), "killProcessWithMessage:", CFSTR("The process did not finish responding to an NSFilePresenter message before being suspended"));
  }
  return result;
}

- (id)suspensionHandler
{
  return self->_suspensionHandler;
}

- (NSArray)URLs
{
  return self->_urls;
}

- (void)killProcessWithMessage:(id)a3
{
  uint64_t pid;

  pid = xpc_connection_get_pid(self->_connection);
  if (qword_1ECD0A3E8 != -1)
    dispatch_once(&qword_1ECD0A3E8, &__block_literal_global_90);
  if (off_1ECD0A3D0)
    off_1ECD0A3D0(pid, 0, a3);
  kill(pid, 9);
}

- (void)safelySendMessageWithReplyUsingBlock:(id)a3
{
  char *v5;
  uint64_t pid;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  int v17;
  _QWORD v18[8];
  __int128 buf;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A3F0 != -1)
    dispatch_once(&qword_1ECD0A3F0, &__block_literal_global_93);
  if (_MergedGlobals_138
    && +[NSFileAccessProcessManager needToManageConnection:forURLs:](NSFileAccessProcessManager, "needToManageConnection:forURLs:", self->_connection, self->_urls))
  {
    v5 = (char *)xpc_connection_copy_bundle_id();
    if (v5)
    {
      ++self->_pendingMessageCount;
      -[NSFileAccessProcessManager _ensureMonitor](self, "_ensureMonitor");
      pid = xpc_connection_get_pid(self->_connection);
      v7 = -[NSFileAccessProcessMonitor processWithPIDIsSuspended:](+[NSFileAccessProcessMonitor sharedInstance](NSFileAccessProcessMonitor, "sharedInstance"), "processWithPIDIsSuspended:", pid);
      v8 = _NSFCProcessMonitorLog();
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = pid;
          _os_log_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEFAULT, "Killing %d because it was suspended when we tried to send it an NSFilePresenter message", (uint8_t *)&buf, 8u);
        }
        -[NSFileAccessProcessManager killProcessWithMessage:](self, "killProcessWithMessage:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Tried to send an NSFilePresenter message requiring a response, but process was suspended. You should unregister NSFilePresenters when a process is no longer active. The NSFilePresenter being messaged has a presentedItemURL of '%@'"), objc_msgSend(-[NSArray firstObject](self->_urls, "firstObject"), "path")));
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_25;
        v15[3] = &unk_1E0F4D2D8;
        v15[4] = self;
        (*((void (**)(id, _QWORD *))a3 + 2))(a3, v15);
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 136446210;
          *(_QWORD *)((char *)&buf + 4) = v5;
          _os_log_debug_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEBUG, "Taking assertion for %{public}s while sending it an NSFilePresenter message", (uint8_t *)&buf, 0xCu);
        }
        v10 = _NSFCProcessMonitorLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          v11 = strdup(v5);
        else
          v11 = 0;
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v20 = 0x3052000000;
        v21 = __Block_byref_object_copy__21;
        v22 = __Block_byref_object_dispose__21;
        v23 = 0;
        v12 = objc_alloc(objc_lookUpClass("BKSProcessAssertion"));
        v13 = MEMORY[0x1E0C809B0];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke;
        v18[3] = &unk_1E0F51A78;
        v18[4] = self;
        v18[5] = a3;
        v18[6] = &buf;
        v18[7] = v11;
        v14 = (void *)objc_msgSend(v12, "initWithPID:flags:reason:name:withHandler:", pid, 3, 4, CFSTR("filecoordinationd waiting for response from NSFilePresenter"), v18);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v14;
        v16[0] = v13;
        v16[1] = 3221225472;
        v16[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_20;
        v16[3] = &unk_1E0F4DC08;
        v17 = pid;
        v16[4] = self;
        objc_msgSend(v14, "setInvalidationHandler:", v16);
        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
    }
    free(v5);
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

void __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  NSObject *v3;
  _QWORD block[4];
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 48);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_2;
  block[3] = &unk_1E0F51A50;
  v5 = v1;
  v6 = v2;
  dispatch_async(v3, block);
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_3;
  v3[3] = &unk_1E0F51A28;
  v1 = *(_QWORD *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  return (*(uint64_t (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v3);
}

void __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = 136446210;
    v5 = v3;
    _os_log_debug_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEBUG, "Releasing assertion after sending message to %{public}s", (uint8_t *)&v4, 0xCu);
  }
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 32), "_ensureMonitor");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");

  free(*(void **)(a1 + 48));
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEFAULT, "Killing %d because it was suspended before replying to an NSFilePresenter method", (uint8_t *)v5, 8u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "killProcessWithMessage:", CFSTR("The process did not finish responding to an NSFilePresenter message before being suspended."));
}

uint64_t __67__NSFileAccessProcessManager_safelySendMessageWithReplyUsingBlock___block_invoke_25(uint64_t a1)
{
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56);
  return objc_msgSend(*(id *)(a1 + 32), "_ensureMonitor");
}

@end
