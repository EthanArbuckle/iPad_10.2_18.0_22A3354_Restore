@implementation ABMWrapper

+ (id)sharedInstance
{
  void *v2;
  ABMWrapper *v3;
  void *v4;

  v2 = (void *)qword_1002B8210;
  if (!qword_1002B8210)
  {
    v3 = objc_alloc_init(ABMWrapper);
    v4 = (void *)qword_1002B8210;
    qword_1002B8210 = (uint64_t)v3;

    v2 = (void *)qword_1002B8210;
  }
  return v2;
}

- (ABMWrapper)init
{
  ABMWrapper *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  void *__p[2];
  char v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ABMWrapper;
  v2 = -[ABMWrapper init](&v10, "init");
  if (v2)
  {
    sub_1000198F0(__p, "fieldtest");
    abm::client::CreateManager(&v9, __p, -[ABMWrapper queue](v2, "queue"));
    sub_100017EB4((uint64_t)&v2->_abmManager, &v9);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    if (v8 < 0)
      operator delete(__p[0]);
  }
  return v2;
}

- (dispatch_queue_s)queue
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017F94;
  block[3] = &unk_10025E7C0;
  block[4] = self;
  if (qword_1002B8218 != -1)
    dispatch_once(&qword_1002B8218, block);
  return self->_queue;
}

- (BOOL)addAWDConfigForAppId:(id)a3 andProtofFilePath:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  xpc_object_t v9;
  BOOL v10;
  xpc_object_t v11;
  id v12;
  xpc_object_t v13;
  void *v14;
  int v15;
  xpc_object_t v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  __int128 *p_buf;
  const char *v26;
  void *__p[2];
  char v29;
  Manager *ptr;
  __shared_weak_count *v31;
  xpc_object_t v32;
  xpc_object_t v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t v36;
  xpc_object_t v37;
  xpc_object_t object;
  xpc_object_t v39[2];
  __int128 buf;
  int64_t v41;
  _BYTE v42[7];
  char v43;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[FTMInternal-4] addAWDConfigForAppId begins", (uint8_t *)&buf, 2u);
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("fieldtest")) & 1) == 0)
  {
    v10 = 0;
    goto LABEL_48;
  }
  memset(&v39[1], 0, 7);
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = v8;
  if (v8)
  {
    v39[0] = v8;
  }
  else
  {
    v9 = xpc_null_create();
    v39[0] = v9;
    if (!v9)
    {
      v11 = xpc_null_create();
      v9 = 0;
      goto LABEL_12;
    }
  }
  if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v9);
    goto LABEL_13;
  }
  v11 = xpc_null_create();
LABEL_12:
  v39[0] = v11;
LABEL_13:
  xpc_release(v9);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v7)));
  v13 = xpc_data_create(objc_msgSend(v12, "bytes"), (size_t)objc_msgSend(v12, "length"));
  if (!v13)
    v13 = xpc_null_create();
  if (xpc_get_type(v13) != (xpc_type_t)&_xpc_type_null)
  {
    v37 = xpc_int64_create(2);
    if (!v37)
      v37 = xpc_null_create();
    *(_QWORD *)&buf = v39;
    *((_QWORD *)&buf + 1) = abm::kKeyAppID;
    sub_100018578((uint64_t)&buf, &v37, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v37);
    v37 = 0;
    v35 = v13;
    if (v13)
      xpc_retain(v13);
    else
      v35 = xpc_null_create();
    *(_QWORD *)&buf = v39;
    *((_QWORD *)&buf + 1) = abm::kKeyPayload;
    sub_100018578((uint64_t)&buf, &v35, &v36);
    xpc_release(v36);
    v36 = 0;
    xpc_release(v35);
    v35 = 0;
    v33 = xpc_int64_create(0);
    if (!v33)
      v33 = xpc_null_create();
    *(_QWORD *)&buf = v39;
    *((_QWORD *)&buf + 1) = abm::kKeyPayloadType;
    sub_100018578((uint64_t)&buf, &v33, &v34);
    xpc_release(v34);
    v34 = 0;
    xpc_release(v33);
    v32 = 0;
    v33 = 0;
    v16 = xpc_null_create();
    cntrl = self->_abmManager.__cntrl_;
    ptr = self->_abmManager.__ptr_;
    v31 = cntrl;
    v32 = v16;
    if (cntrl)
    {
      v18 = (unint64_t *)((char *)cntrl + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    sub_1000198F0(__p, abm::kCommandAddConfiguration);
    abm::client::PerformCommand(&buf, &ptr, __p, v39[0], &v32);
    v20 = buf;
    v14 = (void *)*((_QWORD *)&buf + 1);
    v21 = v41;
    LODWORD(v39[1]) = *(_DWORD *)v42;
    *(_DWORD *)((char *)&v39[1] + 3) = *(_DWORD *)&v42[3];
    v15 = v43;
    v43 = 0;
    BYTE8(buf) = 0;
    if (v29 < 0)
      operator delete(__p[0]);
    v22 = (std::__shared_weak_count *)v31;
    if (!v31)
      goto LABEL_33;
    v23 = (unint64_t *)((char *)v31 + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
      if ((v15 & 0x80000000) == 0)
        goto LABEL_34;
    }
    else
    {
LABEL_33:
      if ((v15 & 0x80000000) == 0)
      {
LABEL_34:
        *(_QWORD *)&buf = v14;
        *((_QWORD *)&buf + 1) = v21;
        LODWORD(v41) = v39[1];
        *(_DWORD *)((char *)&v41 + 3) = *(_DWORD *)((char *)&v39[1] + 3);
        HIBYTE(v41) = v15;
        p_buf = &buf;
LABEL_39:
        NSLog(CFSTR("%s: error=%d msg=%s"), "-[ABMWrapper addAWDConfigForAppId:andProtofFilePath:]", v20, p_buf);
        if (SHIBYTE(v41) < 0)
          operator delete((void *)buf);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v26 = "FALSE";
          if (!(_DWORD)v20)
            v26 = "TRUE";
          LODWORD(buf) = 136446210;
          *(_QWORD *)((char *)&buf + 4) = v26;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[FTMInternal-4] addAWDConfigForAppId success? %{public}s", (uint8_t *)&buf, 0xCu);
        }
        v10 = (_DWORD)v20 == 0;
        goto LABEL_46;
      }
    }
    sub_1000197DC(&buf, v14, v21);
    if (v41 >= 0)
      p_buf = &buf;
    else
      p_buf = (__int128 *)buf;
    goto LABEL_39;
  }
  v14 = 0;
  v15 = 0;
  v10 = 0;
LABEL_46:
  xpc_release(v13);

  xpc_release(v39[0]);
  if (v15 < 0)
    operator delete(v14);
LABEL_48:

  return v10;
}

- (BOOL)removeAWDConfigForAppid:(id)a3
{
  id v4;
  xpc_object_t v5;
  xpc_object_t v6;
  BOOL v7;
  xpc_object_t v8;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __int128 *p_buf;
  const char *v20;
  void *__p[2];
  char v23;
  Manager *ptr;
  __shared_weak_count *v25;
  xpc_object_t v26;
  xpc_object_t object;
  xpc_object_t v28;
  xpc_object_t v29[2];
  __int128 buf;
  int64_t v31;
  _BYTE v32[7];
  char v33;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fieldtest")) & 1) == 0)
  {
    v7 = 0;
    goto LABEL_36;
  }
  memset(&v29[1], 0, 7);
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (v5)
  {
    v29[0] = v5;
  }
  else
  {
    v6 = xpc_null_create();
    v29[0] = v6;
    if (!v6)
    {
      v8 = xpc_null_create();
      v6 = 0;
      goto LABEL_10;
    }
  }
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v6);
    goto LABEL_11;
  }
  v8 = xpc_null_create();
LABEL_10:
  v29[0] = v8;
LABEL_11:
  xpc_release(v6);
  v28 = xpc_null_create();
  v26 = xpc_int64_create(2);
  if (!v26)
    v26 = xpc_null_create();
  *(_QWORD *)&buf = v29;
  *((_QWORD *)&buf + 1) = abm::kKeyAppID;
  sub_100018578((uint64_t)&buf, &v26, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v26);
  cntrl = self->_abmManager.__cntrl_;
  ptr = self->_abmManager.__ptr_;
  v25 = cntrl;
  v26 = 0;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  sub_1000198F0(__p, abm::kCommandClearConfiguration);
  abm::client::PerformCommand(&buf, &ptr, __p, v29[0], &v28);
  v12 = buf;
  v14 = (void *)*((_QWORD *)&buf + 1);
  v13 = v31;
  LODWORD(v29[1]) = *(_DWORD *)v32;
  *(_DWORD *)((char *)&v29[1] + 3) = *(_DWORD *)&v32[3];
  v15 = v33;
  v33 = 0;
  BYTE8(buf) = 0;
  if (v23 < 0)
    operator delete(__p[0]);
  v16 = (std::__shared_weak_count *)v25;
  if (v25)
  {
    v17 = (unint64_t *)((char *)v25 + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
      if ((v15 & 0x80000000) == 0)
        goto LABEL_23;
LABEL_25:
      sub_1000197DC(&buf, v14, v13);
      if (v31 >= 0)
        p_buf = &buf;
      else
        p_buf = (__int128 *)buf;
      goto LABEL_28;
    }
  }
  if (v15 < 0)
    goto LABEL_25;
LABEL_23:
  *(_QWORD *)&buf = v14;
  *((_QWORD *)&buf + 1) = v13;
  LODWORD(v31) = v29[1];
  *(_DWORD *)((char *)&v31 + 3) = *(_DWORD *)((char *)&v29[1] + 3);
  HIBYTE(v31) = v15;
  p_buf = &buf;
LABEL_28:
  NSLog(CFSTR("%s: error=%d msg=%s"), "-[ABMWrapper removeAWDConfigForAppid:]", v12, p_buf);
  if (SHIBYTE(v31) < 0)
    operator delete((void *)buf);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v20 = "FALSE";
    if (!(_DWORD)v12)
      v20 = "TRUE";
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = v20;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[FTMInternal-4] removeAWDConfigForAppid success? %{public}s", (uint8_t *)&buf, 0xCu);
  }
  v7 = (_DWORD)v12 == 0;
  xpc_release(v29[0]);
  if (v15 < 0)
    operator delete(v14);
LABEL_36:

  return v7;
}

- (BOOL)querySpecificMetric:(id)a3 triggerRef:(int)a4 triggerType:(int)a5 triggerID:(int)a6 profileID:(int)a7 metricID:(int)a8
{
  id v14;
  xpc_object_t v15;
  xpc_object_t v16;
  BOOL v17;
  xpc_object_t v18;
  xpc_object_t v19;
  __shared_weak_count *cntrl;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  int v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _BYTE *v30;
  const char *v31;
  void *__p[2];
  char v34;
  Manager *ptr;
  __shared_weak_count *v36;
  xpc_object_t v37;
  xpc_object_t v38;
  xpc_object_t v39;
  xpc_object_t v40;
  xpc_object_t v41;
  xpc_object_t v42;
  xpc_object_t v43;
  xpc_object_t v44;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  xpc_object_t object;
  xpc_object_t v50;
  xpc_object_t v51;
  xpc_object_t v52;
  _DWORD v53[2];
  _BYTE buf[24];
  _BYTE v55[7];
  char v56;

  v14 = a3;
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("fieldtest")) & 1) == 0)
  {
    v17 = 0;
    goto LABEL_48;
  }
  *(_DWORD *)((char *)v53 + 3) = 0;
  v53[0] = 0;
  v15 = xpc_dictionary_create(0, 0, 0);
  v16 = v15;
  if (v15)
  {
    v52 = v15;
  }
  else
  {
    v16 = xpc_null_create();
    v52 = v16;
    if (!v16)
    {
      v18 = xpc_null_create();
      v16 = 0;
      goto LABEL_10;
    }
  }
  if (xpc_get_type(v16) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v16);
    goto LABEL_11;
  }
  v18 = xpc_null_create();
LABEL_10:
  v52 = v18;
LABEL_11:
  xpc_release(v16);
  v50 = xpc_int64_create(2);
  if (!v50)
    v50 = xpc_null_create();
  *(_QWORD *)buf = &v52;
  *(_QWORD *)&buf[8] = abm::kKeyAppID;
  sub_100018578((uint64_t)buf, &v50, &v51);
  xpc_release(v51);
  v51 = 0;
  xpc_release(v50);
  v50 = 0;
  v48 = xpc_int64_create(0);
  if (!v48)
    v48 = xpc_null_create();
  *(_QWORD *)buf = &v52;
  *(_QWORD *)&buf[8] = abm::kKeyPayloadType;
  sub_100018578((uint64_t)buf, &v48, &object);
  xpc_release(object);
  object = 0;
  xpc_release(v48);
  v48 = 0;
  v46 = xpc_int64_create(a4);
  if (!v46)
    v46 = xpc_null_create();
  *(_QWORD *)buf = &v52;
  *(_QWORD *)&buf[8] = abm::kKeyTriggerRef;
  sub_100018578((uint64_t)buf, &v46, &v47);
  xpc_release(v47);
  v47 = 0;
  xpc_release(v46);
  v46 = 0;
  v44 = xpc_int64_create(a5);
  if (!v44)
    v44 = xpc_null_create();
  *(_QWORD *)buf = &v52;
  *(_QWORD *)&buf[8] = abm::kKeyTriggerType;
  sub_100018578((uint64_t)buf, &v44, &v45);
  xpc_release(v45);
  v45 = 0;
  xpc_release(v44);
  v44 = 0;
  v42 = xpc_int64_create(a6);
  if (!v42)
    v42 = xpc_null_create();
  *(_QWORD *)buf = &v52;
  *(_QWORD *)&buf[8] = abm::kKeyTriggerID;
  sub_100018578((uint64_t)buf, &v42, &v43);
  xpc_release(v43);
  v43 = 0;
  xpc_release(v42);
  v42 = 0;
  v40 = xpc_int64_create(a7);
  if (!v40)
    v40 = xpc_null_create();
  *(_QWORD *)buf = &v52;
  *(_QWORD *)&buf[8] = abm::kKeyProfileID;
  sub_100018578((uint64_t)buf, &v40, &v41);
  xpc_release(v41);
  v41 = 0;
  xpc_release(v40);
  v40 = 0;
  v38 = xpc_int64_create(a8);
  if (!v38)
    v38 = xpc_null_create();
  *(_QWORD *)buf = &v52;
  *(_QWORD *)&buf[8] = abm::kKeyMetricID;
  sub_100018578((uint64_t)buf, &v38, &v39);
  xpc_release(v39);
  v39 = 0;
  xpc_release(v38);
  v37 = 0;
  v38 = 0;
  v19 = xpc_null_create();
  cntrl = self->_abmManager.__cntrl_;
  ptr = self->_abmManager.__ptr_;
  v36 = cntrl;
  v37 = v19;
  if (cntrl)
  {
    v21 = (unint64_t *)((char *)cntrl + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  sub_1000198F0(__p, abm::kCommandQueryMetric);
  abm::client::PerformCommand(buf, &ptr, __p, v52, &v37);
  v23 = *(unsigned int *)buf;
  v25 = *(void **)&buf[8];
  v24 = *(_QWORD *)&buf[16];
  v53[0] = *(_DWORD *)v55;
  *(_DWORD *)((char *)v53 + 3) = *(_DWORD *)&v55[3];
  v26 = v56;
  v56 = 0;
  buf[8] = 0;
  if (v34 < 0)
    operator delete(__p[0]);
  v27 = (std::__shared_weak_count *)v36;
  if (v36)
  {
    v28 = (unint64_t *)((char *)v36 + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
      if ((v26 & 0x80000000) == 0)
        goto LABEL_35;
LABEL_37:
      sub_1000197DC(buf, v25, v24);
      if (buf[23] >= 0)
        v30 = buf;
      else
        v30 = *(_BYTE **)buf;
      goto LABEL_40;
    }
  }
  if (v26 < 0)
    goto LABEL_37;
LABEL_35:
  *(_QWORD *)buf = v25;
  *(_QWORD *)&buf[8] = v24;
  *(_DWORD *)&buf[16] = v53[0];
  *(_DWORD *)&buf[19] = *(_DWORD *)((char *)v53 + 3);
  buf[23] = v26;
  v30 = buf;
LABEL_40:
  NSLog(CFSTR("%s: error=%d msg=%s"), "-[ABMWrapper querySpecificMetric:triggerRef:triggerType:triggerID:profileID:metricID:]", v23, v30);
  if ((buf[23] & 0x80000000) != 0)
    operator delete(*(void **)buf);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v31 = "FALSE";
    if (!(_DWORD)v23)
      v31 = "TRUE";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v23;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[FTMInternal-4] querySpecificMetric success? %{public}s errorCode if any %{public}d", buf, 0x12u);
  }
  v17 = (_DWORD)v23 == 0;
  xpc_release(v52);
  if (v26 < 0)
    operator delete(v25);
LABEL_48:

  return v17;
}

- (void)listen
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  __shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  Manager *v27;
  __shared_weak_count *v28;
  Manager *v29;
  __shared_weak_count *v30;
  _QWORD v31[5];
  Manager *v32;
  __shared_weak_count *v33;
  _QWORD v34[5];
  void *v35[2];
  char v36;
  Manager *ptr;
  __shared_weak_count *v38;

  cntrl = self->_abmManager.__cntrl_;
  ptr = self->_abmManager.__ptr_;
  v38 = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  sub_1000198F0(v35, abm::kEventTrigger);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100019294;
  v34[3] = &unk_10025E810;
  v34[4] = self;
  abm::client::RegisterEventHandler(&ptr, v35, v34);
  if (v36 < 0)
    operator delete(v35[0]);
  v6 = (std::__shared_weak_count *)v38;
  if (v38)
  {
    v7 = (unint64_t *)((char *)v38 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = self->_abmManager.__cntrl_;
  v32 = self->_abmManager.__ptr_;
  v33 = v9;
  if (v9)
  {
    v10 = (unint64_t *)((char *)v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  sub_1000198F0(v35, abm::kEventMetric);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000193CC;
  v31[3] = &unk_10025E810;
  v31[4] = self;
  abm::client::RegisterEventHandler(&v32, v35, v31);
  if (v36 < 0)
    operator delete(v35[0]);
  v12 = (std::__shared_weak_count *)v33;
  if (v33)
  {
    v13 = (unint64_t *)((char *)v33 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = self->_abmManager.__cntrl_;
  v29 = self->_abmManager.__ptr_;
  v30 = v15;
  if (v15)
  {
    v16 = (unint64_t *)((char *)v15 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  abm::client::EventsOff(&v29);
  v18 = (std::__shared_weak_count *)v30;
  if (v30)
  {
    v19 = (unint64_t *)((char *)v30 + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = self->_abmManager.__cntrl_;
  v27 = self->_abmManager.__ptr_;
  v28 = v21;
  if (v21)
  {
    v22 = (unint64_t *)((char *)v21 + 8);
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  abm::client::EventsOn(&v27);
  v24 = (std::__shared_weak_count *)v28;
  if (v28)
  {
    v25 = (unint64_t *)((char *)v28 + 8);
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

- (ABMWrapperDelegate)delegate
{
  return (ABMWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  sub_1000199A0((uint64_t)&self->_abmManager);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
