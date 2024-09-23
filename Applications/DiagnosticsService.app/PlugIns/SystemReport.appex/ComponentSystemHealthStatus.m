@implementation ComponentSystemHealthStatus

- (ComponentSystemHealthStatus)init
{
  ComponentSystemHealthStatus *v2;
  CRSystemHealthStatus *v3;
  CRSystemHealthStatus *systemHealthStatus;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComponentSystemHealthStatus;
  v2 = -[ComponentSystemHealthStatus init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(CRSystemHealthStatus);
    systemHealthStatus = v2->_systemHealthStatus;
    v2->_systemHealthStatus = v3;

  }
  return v2;
}

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemHealthStatus systemHealthInfo](self, "systemHealthInfo"));
  if (v4)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("systemHealthInfo"));

}

- (id)systemHealthInfo
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint8_t *v15;
  id v16;
  id location;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[4];
  uint64_t v25;

  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Making system health status async call.", buf, 2u);
  }

  v5 = dispatch_queue_create("systemHealthDiagnosticsQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  v6 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = sub_100026834;
  v22 = sub_100026844;
  v23 = 0;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002684C;
  v13[3] = &unk_100080BB0;
  objc_copyWeak(&v16, &location);
  v15 = buf;
  v7 = v6;
  v14 = v7;
  dispatch_async(v5, v13);
  v8 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = DiagnosticLogHandleForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 134217984;
      v25 = 0x4008000000000000;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "System health status retrieval timed out after %f seconds", v24, 0xCu);
    }

  }
  v11 = *((id *)v19 + 5);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  return v11;
}

- (CRSystemHealthStatus)systemHealthStatus
{
  return self->_systemHealthStatus;
}

- (void)setSystemHealthStatus:(id)a3
{
  objc_storeStrong((id *)&self->_systemHealthStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemHealthStatus, 0);
}

@end
