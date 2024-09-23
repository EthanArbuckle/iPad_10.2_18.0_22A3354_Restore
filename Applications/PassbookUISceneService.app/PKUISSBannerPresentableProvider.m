@implementation PKUISSBannerPresentableProvider

- (PKUISSBannerPresentableProvider)init
{

  return 0;
}

- (BOOL)shouldRevokeCurrentRequestForManager:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;

  v4 = objc_msgSend(a3, "_currentRequest");
  v5 = v4;
  if (v4)
  {
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
    if (v6)
    {
      v7 = v6[6];
      if (self->_requestedExpressHandle)
      {
        v8 = v7 != 0;
      }
      else
      {
        if (self->_requestedFaceIDContext)
          v9 = v7 > 1;
        else
          v9 = 0;
        v8 = v9;
      }
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)nextRequestForManager:(id)a3
{
  void *v3;
  id v5;
  PKUISSBannerHandle *requestedExpressHandle;
  PKUISSBannerHandle *v7;
  PKUISSBannerHandle *v8;
  id *v9;
  id *v10;
  PKUISSBannerHandle *v11;
  _QWORD *v12;
  id *v13;
  PKUISSPresentableContext *requestedFaceIDContext;
  PKUISSBannerHandle *v15;
  PKUISSPresentableContext *v16;
  PKUISSPresentableContext *v17;
  id v18;
  id *v19;
  id *v20;
  id v21;
  uint64_t Object;
  NSObject *v23;
  _QWORD v25[4];
  id *v26;
  _QWORD v27[4];
  id *v28;
  _QWORD v29[4];
  PKUISSBannerHandle *v30;
  _QWORD v31[4];
  PKUISSBannerHandle *v32;
  id *v33;
  _QWORD v34[4];
  PKUISSBannerHandle *v35;
  id *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id *v40;

  v5 = a3;
  while (1)
  {
    requestedExpressHandle = self->_requestedExpressHandle;
    if (requestedExpressHandle)
    {
      v7 = requestedExpressHandle;
      v8 = self->_requestedExpressHandle;
      self->_requestedExpressHandle = 0;

      v9 = sub_100005D3C([PKUISSPresentableContext alloc], v7);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000069FC;
      v34[3] = &unk_10000C478;
      v35 = v7;
      v10 = v9;
      v36 = v10;
      v11 = v7;
      v12 = objc_retainBlock(v34);

      v13 = (id *)&v35;
LABEL_8:

      goto LABEL_9;
    }
    requestedFaceIDContext = self->_requestedFaceIDContext;
    if (requestedFaceIDContext)
    {
      v15 = requestedFaceIDContext->_effectiveHandle;
      v16 = self->_requestedFaceIDContext;
      v17 = self->_requestedFaceIDContext;
      self->_requestedFaceIDContext = 0;

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100006A4C;
      v31[3] = &unk_10000C478;
      v32 = v15;
      v10 = v16;
      v33 = v10;
      v11 = v15;
      v12 = objc_retainBlock(v31);

      v13 = (id *)&v32;
      goto LABEL_8;
    }
    v11 = (PKUISSBannerHandle *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_standaloneTransactonHandles, "firstObject"));
    if (v11)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_standaloneTransactonHandles, "removeObjectAtIndex:", 0);
      v10 = sub_100005D3C([PKUISSPresentableContext alloc], v11);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100006A9C;
      v29[3] = &unk_10000C4A0;
      v11 = v11;
      v30 = v11;
      v12 = objc_retainBlock(v29);
      v13 = (id *)&v30;
      goto LABEL_8;
    }
    v12 = 0;
    v10 = 0;
LABEL_9:

    if (!v10)
      break;
    v18 = objc_alloc_init((Class)PKBannerPresentableConfiguration);
    objc_msgSend(v18, "setFactory:", v12);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100006AD4;
    v27[3] = &unk_10000C4C8;
    v19 = v10;
    v28 = v19;
    objc_msgSend(v18, "setDidStartHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100006ADC;
    v25[3] = &unk_10000C4F0;
    v20 = v19;
    v26 = v20;
    objc_msgSend(v18, "setDidFinishHandler:", v25);
    v21 = objc_msgSend(v5, "_createPresentableWithConfiguration:", v18);
    if (v21)
    {
      Object = PKLogFacilityTypeGetObject(0);
      v23 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v38 = v21;
        v39 = 2048;
        v40 = v20;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PKUISSBannerPresentableProvider: created presentable %p for context %p.", buf, 0x16u);
      }

      v3 = (void *)objc_claimAutoreleasedReturnValue(+[PKBannerPresentableRequest createWithPresentable:context:](PKBannerPresentableRequest, "createWithPresentable:context:", v21, v20));
    }
    else
    {
      sub_100005FBC((uint64_t)v20);
    }

    if (v21)
      goto LABEL_19;
  }

  v3 = 0;
LABEL_19:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedFaceIDContext, 0);
  objc_storeStrong((id *)&self->_standaloneTransactonHandles, 0);
  objc_storeStrong((id *)&self->_requestedExpressHandle, 0);
}

@end
