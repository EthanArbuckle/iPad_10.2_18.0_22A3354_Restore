@implementation PKUISSBannerHandle

- (PKUISSBannerHandle)init
{

  return 0;
}

- (void)configureForRequest:(id)a3 withState:(id)a4 didStartReply:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t Object;
  NSObject *v14;
  const char *v15;
  id v16;
  id v17;
  id didStartReply;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  PKUISSBannerHandle *v26;
  __int16 v27;
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!self->_invalidated)
  {
    if (self->_phase)
    {
      Object = PKLogFacilityTypeGetObject(0);
      v14 = objc_claimAutoreleasedReturnValue(Object);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        sub_100003834((uint64_t)self, 0);
        goto LABEL_7;
      }
      v25 = 134217984;
      v26 = self;
      v15 = "PKUISSBannerHandle (%p): out of order - configure - invalidating.";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v25, 0xCu);
      goto LABEL_6;
    }
    self->_phase = 1;
    if (!v11)
    {
      v22 = PKLogFacilityTypeGetObject(0);
      v14 = objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      v25 = 134217984;
      v26 = self;
      v15 = "PKUISSBannerHandle (%p): missing reply - invalidating.";
      goto LABEL_5;
    }
    if (!v9)
    {
      v23 = PKLogFacilityTypeGetObject(0);
      v14 = objc_claimAutoreleasedReturnValue(v23);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      v25 = 134217984;
      v26 = self;
      v15 = "PKUISSBannerHandle (%p): missing request - invalidating.";
      goto LABEL_5;
    }
    if (v10)
    {
      v16 = objc_msgSend(v10, "type");
      if (v16 != objc_msgSend(v9, "type"))
      {
        v24 = PKLogFacilityTypeGetObject(0);
        v14 = objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_6;
        v25 = 134217984;
        v26 = self;
        v15 = "PKUISSBannerHandle (%p): type mismatch - invalidating.";
        goto LABEL_5;
      }
    }
    objc_storeStrong((id *)&self->_request, a3);
    objc_storeStrong((id *)&self->_state, a4);
    v17 = objc_retainBlock(v12);
    didStartReply = self->_didStartReply;
    self->_didStartReply = v17;

    v19 = PKLogFacilityTypeGetObject(0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = -[PKBannerHandleRequest type](self->_request, "type");
      v25 = 134218240;
      v26 = self;
      v27 = 2048;
      v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): configured for %ld.", (uint8_t *)&v25, 0x16u);
    }

  }
LABEL_7:

}

- (void)updateState:(id)a3 withReply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  int phase;
  id v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id WeakRetained;
  uint64_t Object;
  int v20;
  PKUISSBannerHandle *v21;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  if (!self->_invalidated)
  {
    phase = self->_phase;
    if (self->_phase)
    {
      if (v7)
      {
        v10 = objc_msgSend(v7, "type");
        if (v10 != -[PKBannerHandleRequest type](self->_request, "type"))
        {
          Object = PKLogFacilityTypeGetObject(0);
          v12 = objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v20 = 134217984;
            v21 = self;
            v13 = "PKUISSBannerHandle (%p): type mismatch - ignoring state update.";
            goto LABEL_18;
          }
LABEL_19:

          goto LABEL_20;
        }
        phase = self->_phase;
      }
      if (phase != 4)
      {
        v12 = self->_state;
        objc_storeStrong((id *)&self->_state, a3);
        v16 = PKLogFacilityTypeGetObject(0);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 134217984;
          v21 = self;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): state updated.", (uint8_t *)&v20, 0xCu);
        }

        v8[2](v8, 0);
        if ((self->_phase & 0xFE) == 2)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "bannerHandle:didChangeFromState:", self, v12);

        }
        goto LABEL_19;
      }
      v11 = PKLogFacilityTypeGetObject(0);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134217984;
        v21 = self;
        v13 = "PKUISSBannerHandle (%p): ignoring state update.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 0xCu);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    v14 = PKLogFacilityTypeGetObject(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134217984;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): out of order - update state - invalidating.", (uint8_t *)&v20, 0xCu);
    }

    sub_100003834((uint64_t)self, 0);
  }
LABEL_20:

}

- (void)displayWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  PKBannerHandleRequest *request;
  id v6;
  void (*v7)(uint64_t);
  void ***v8;
  uint64_t Object;
  NSObject *v10;
  void ***v11;
  void ***v12;
  uint64_t v13;
  NSObject *v14;
  void **v15;
  void **v16;
  void **v17;
  uint8_t buf[4];
  PKUISSBannerHandle *v19;

  v4 = (void (**)(id, _QWORD))a3;
  if (self->_invalidated)
    goto LABEL_13;
  if (self->_phase != 1)
  {
    Object = PKLogFacilityTypeGetObject(0);
    v10 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): out of order - display - invalidating.", buf, 0xCu);
    }

    goto LABEL_12;
  }
  request = self->_request;
  if (!request)
    goto LABEL_12;
  v6 = -[PKBannerHandleRequest type](request, "type");
  if (v6 == (id)2)
  {
    v15 = _NSConcreteStackBlock;
    v7 = sub_10000499C;
    v8 = &v15;
    goto LABEL_17;
  }
  if (v6 == (id)1)
  {
    if (PKSystemApertureIsAvailable())
    {
      v16 = _NSConcreteStackBlock;
      v7 = sub_10000495C;
      v8 = &v16;
      goto LABEL_17;
    }
LABEL_12:
    sub_100003834((uint64_t)self, 0);
    goto LABEL_13;
  }
  if (v6 || !PKSystemApertureIsAvailable())
    goto LABEL_12;
  v17 = _NSConcreteStackBlock;
  v7 = sub_10000491C;
  v8 = &v17;
LABEL_17:
  v8[1] = (void **)3221225472;
  v8[2] = (void **)v7;
  v8[3] = (void **)&unk_10000C330;
  v8[4] = (void **)&self->super.isa;
  v11 = objc_retainBlock(v8);
  if (!v11)
    goto LABEL_12;
  v12 = v11;
  v13 = PKLogFacilityTypeGetObject(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): started.", buf, 0xCu);
  }

  v4[2](v4, 0);
  self->_phase = 2;
  ((void (*)(void ***))v12[2])(v12);

LABEL_13:
}

- (void)detachWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t Object;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  __int128 buf;
  uint64_t v12;
  UIBackgroundTaskIdentifier v13;

  v4 = (void (**)(id, _QWORD))a3;
  Object = PKLogFacilityTypeGetObject(4);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): received remote detach.", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v12 = 0x2020000000;
  v13 = UIBackgroundTaskInvalid;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004BA8;
  v10[3] = &unk_10000C2E0;
  v10[4] = &buf;
  v8 = objc_msgSend(v7, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("banner.detach.receive"), v10);
  *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v8;

  self->_detached = 1;
  v4[2](v4, 0);
  sub_100003834((uint64_t)self, 0);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) != UIBackgroundTaskInvalid)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v9, "endBackgroundTask:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));

    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = UIBackgroundTaskInvalid;
  }
  _Block_object_dispose(&buf, 8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_didStartReply, 0);
}

@end
