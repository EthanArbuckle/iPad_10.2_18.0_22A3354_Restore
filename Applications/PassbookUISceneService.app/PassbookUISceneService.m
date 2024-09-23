id *sub_100003550(id *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t Object;
  NSObject *v7;
  _BOOL4 v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id *v18;
  objc_super v19;
  void *v20;
  uint8_t buf[4];
  id *v22;
  __int16 v23;
  void *v24;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
      __break(1u);
    v19.receiver = a1;
    v19.super_class = (Class)PKUISSBannerHandle;
    a1 = (id *)objc_msgSendSuper2(&v19, "init");
    Object = PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue(Object);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a1)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134218240;
        v22 = a1;
        v23 = 2048;
        v24 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): creating for connection %p.", buf, 0x16u);
      }

      *((_BYTE *)a1 + 24) = 0;
      objc_storeStrong(a1 + 4, a2);
      v14 = _NSConcreteStackBlock;
      v15 = 3221225472;
      v16 = sub_10000374C;
      v17 = &unk_10000C2B8;
      v9 = a1;
      v18 = v9;
      objc_msgSend(v5, "configureConnection:", &v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.PassbookUIService"), CFSTR("AngelReply"), v14, v15, v16, v17));
      v20 = v10;
      v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      v12 = v9[5];
      v9[5] = (id)v11;

      objc_msgSend(a1[4], "activate");
      a1 = v9;
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 134217984;
        v22 = (id *)v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle: failed to allocate service for connection %p.", buf, 0xCu);
      }

      objc_msgSend(v5, "invalidate");
    }
  }

  return a1;
}

void sub_10000374C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)PKBannerServiceInterface();
  objc_msgSend(v3, "setInterface:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceQuality userInitiated](BSServiceQuality, "userInitiated"));
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setTargetQueue:", &_dispatch_main_q);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003828;
  v6[3] = &unk_10000C290;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v6);

}

void sub_100003828(uint64_t a1)
{
  sub_100003834(*(_QWORD *)(a1 + 32), 1);
}

void sub_100003834(uint64_t a1, int a2)
{
  uint64_t Object;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id WeakRetained;
  _QWORD v20[4];
  id v21;
  __int128 *p_buf;
  id v23;
  _QWORD v24[5];
  uint8_t v25[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int128 buf;
  uint64_t v30;
  UIBackgroundTaskIdentifier v31;

  if (a1 && !*(_BYTE *)(a1 + 8))
  {
    *(_BYTE *)(a1 + 8) = 1;
    Object = PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue(Object);
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v6)
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = a1;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): remotely invalidated.", (uint8_t *)&buf, 0xCu);
      }

      v7 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

      v8 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;
    }
    else
    {
      if (v6)
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = a1;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): locally invalidated.", (uint8_t *)&buf, 0xCu);
      }

      v9 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

      v10 = *(unsigned __int8 *)(a1 + 24);
      if (v10 - 2 >= 3)
      {
        if (v10 >= 2)
        {
LABEL_18:
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(WeakRetained, "bannerHandleDidInvalidate:", a1);

          return;
        }
      }
      else if (!*(_BYTE *)(a1 + 25))
      {
        v8 = (void *)sub_100003BC0(a1);
        if (v8)
        {
          v11 = *(id *)(a1 + 32);
          v12 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = 0;

          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v30 = 0x2020000000;
          v31 = UIBackgroundTaskInvalid;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_100003CC4;
          v24[3] = &unk_10000C2E0;
          v24[4] = &buf;
          v14 = objc_msgSend(v13, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("banner.detach.transmit"), v24);
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v14;

          v15 = PKLogFacilityTypeGetObject(4);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v25 = 134218240;
            v26 = a1;
            v27 = 2048;
            v28 = v11;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): starting local invalidation of connection %p.", v25, 0x16u);
          }

          objc_initWeak((id *)v25, (id)a1);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)(a1 + 24) == 4));
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100003D98;
          v20[3] = &unk_10000C308;
          objc_copyWeak(&v23, (id *)v25);
          v18 = v11;
          v21 = v18;
          p_buf = &buf;
          objc_msgSend(v8, "detachWithFinished:reply:", v17, v20);

          objc_destroyWeak(&v23);
          objc_destroyWeak((id *)v25);
          _Block_object_dispose(&buf, 8);

          goto LABEL_17;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v8 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
}

void sub_100003B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003BC0(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t Object;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 32);
    if (v2)
    {
      result = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteTargetWithAssertionAttributes:", *(_QWORD *)(v1 + 40)));
      if (result)
        return result;
      Object = PKLogFacilityTypeGetObject(4);
      v4 = objc_claimAutoreleasedReturnValue(Object);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      v7 = 134217984;
      v8 = v1;
      v5 = "PKUISSBannerHandle (%p): attempting to message inactive connection.";
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(4);
      v4 = objc_claimAutoreleasedReturnValue(v6);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        return 0;
      }
      v7 = 134217984;
      v8 = v1;
      v5 = "PKUISSBannerHandle (%p): attempting to message invalidated connection.";
    }
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);
    goto LABEL_9;
  }
  return result;
}

void sub_100003CC4(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003D20;
  block[3] = &unk_10000C2E0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100003D20(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

void sub_100003D98(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t Object;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    Object = PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue(Object);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (WeakRetained)
    {
      if (v7)
      {
        v15 = 134218242;
        v16 = WeakRetained;
        v17 = 2112;
        v18 = v3;
        v8 = "PKUISSBannerHandle (%p): failed to notify remote of local invalidation - %@.";
        v9 = v6;
        v10 = 22;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);
      }
    }
    else if (v7)
    {
      v15 = 138412290;
      v16 = v3;
      v8 = "PKUISSBannerHandle (?): failed to notify remote of local invalidation - %@.";
      v9 = v6;
      v10 = 12;
      goto LABEL_7;
    }

  }
  v11 = PKLogFacilityTypeGetObject(4);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(a1 + 32);
    v15 = 134217984;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle: connection %p locally invalidated.", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v14, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = UIBackgroundTaskInvalid;
  }

}

void sub_100003F60(uint64_t a1)
{
  int v2;
  uint64_t Object;
  NSObject *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD);
  uint8_t buf[4];
  uint64_t v9;

  if (a1 && !*(_BYTE *)(a1 + 8))
  {
    v2 = *(unsigned __int8 *)(a1 + 24);
    if (v2 == 2)
    {
      *(_BYTE *)(a1 + 24) = 3;
      v5 = *(void **)(a1 + 16);
      if (v5)
      {
        v7 = objc_retainBlock(v5);
        v6 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;

        v7[2](v7, 0);
      }
    }
    else if (v2 != 4)
    {
      Object = PKLogFacilityTypeGetObject(0);
      v4 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v9 = a1;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): out of order - start - invalidating.", buf, 0xCu);
      }

      sub_100003834(a1, 0);
    }
  }
}

void sub_100004094(uint64_t a1)
{
  void *v2;
  uint64_t Object;
  NSObject *v4;
  int v5;
  uint64_t v6;

  if (a1 && !*(_BYTE *)(a1 + 8))
  {
    if ((*(_BYTE *)(a1 + 24) & 0xFE) == 2)
    {
      *(_BYTE *)(a1 + 24) = 4;
      v2 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

      sub_100003834(a1, 0);
    }
    else
    {
      Object = PKLogFacilityTypeGetObject(0);
      v4 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 134217984;
        v6 = a1;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): out of order - finish - invalidating.", (uint8_t *)&v5, 0xCu);
      }

      sub_100003834(a1, 0);
    }
  }
}

void sub_1000041A4(uint64_t a1, void *a2)
{
  id WeakRetained;
  id obj;

  obj = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained != obj || !obj || !WeakRetained)
    {
      objc_storeWeak((id *)(a1 + 64), obj);
      if (*(_BYTE *)(a1 + 8))
        objc_msgSend(obj, "bannerHandleDidInvalidate:", a1);
    }

  }
}

void sub_10000491C(uint64_t a1)
{
  id v2;

  v2 = (id)sub_100006590();
  sub_100006AE4((uint64_t)v2, *(void **)(a1 + 32));

}

void sub_10000495C(uint64_t a1)
{
  id v2;

  v2 = (id)sub_100006590();
  sub_100006DA8((uint64_t)v2, *(void **)(a1 + 32));

}

void sub_10000499C(uint64_t a1)
{
  id v2;

  v2 = (id)sub_100006590();
  sub_100006E90((uint64_t)v2, *(_QWORD *)(a1 + 32));

}

void sub_100004B88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_100004BA8(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C04;
  block[3] = &unk_10000C2E0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004C04(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

uint64_t sub_100004C7C(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

uint64_t sub_100004C88(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

void sub_100004CF0(uint64_t a1)
{
  uint64_t v1;

  v1 = objc_opt_self(a1);

}

id sub_100004D0C(uint64_t a1, int a2)
{
  id result;
  _QWORD *v4;
  void *v5;

  result = (id)objc_opt_self(a1);
  if (a2)
  {
    if (qword_100012200)
      goto LABEL_6;
    v4 = sub_100004DA8([PKUISSListener_Banner alloc]);
    v5 = (void *)qword_100012200;
    qword_100012200 = (uint64_t)v4;

  }
  result = (id)qword_100012200;
  if (qword_100012200)
    return (id)qword_100012200;
LABEL_6:
  __break(1u);
  return result;
}

void sub_100004D64(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id *v3;

  objc_opt_self(a1);
  v1 = objc_opt_self(PKUISSListener_Banner);
  v2 = (id *)sub_100004D0C(v1, 0);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2[1], "activate");
    v2 = v3;
  }

}

_QWORD *sub_100004DA8(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)PKUISSListener_Banner;
  v1 = objc_msgSendSuper2(&v8, "init");
  v2 = v1;
  if (v1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004E78;
    v6[3] = &unk_10000C358;
    v2 = v1;
    v7 = v2;
    v3 = objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v6));
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

void sub_100004E78(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("remote-ui"));
  objc_msgSend(v3, "setService:", PKBannerServiceName);
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

void sub_1000054C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  uint64_t v27;

  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a27);
  objc_destroyWeak((id *)(v27 - 144));
  _Unwind_Resume(a1);
}

BOOL sub_1000054F8(id a1, NSUserActivity *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity activityType](a2, "activityType"));
  v3 = objc_msgSend(v2, "isEqualToString:", PKPassbookUISSUserActivityTypePeerPaymentRegistration);

  return v3;
}

void sub_10000553C(uint64_t a1, uint64_t a2)
{
  uint64_t Object;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  Object = PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error requesting destruction for session: %@, %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1000055FC(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[2], "setRootViewController:", 0);
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000056CC;
    v6[3] = &unk_10000C3C0;
    v7 = v4;
    objc_msgSend(v5, "requestSceneSessionDestruction:options:errorHandler:", v7, 0, v6);

  }
}

void sub_1000056CC(uint64_t a1, uint64_t a2)
{
  uint64_t Object;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  Object = PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error requesting destruction for session: %@, %@", (uint8_t *)&v7, 0x16u);
  }

}

uint64_t sub_10000578C(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void sub_100005C54(uint64_t a1, uint64_t a2)
{
  uint64_t Object;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  Object = PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to destruct in-app scene session %@, error: %@", (uint8_t *)&v7, 0x16u);
  }

}

id *sub_100005D3C(void *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;
  uint64_t Object;
  NSObject *v11;
  id v12;
  id v13;
  id *v14;
  objc_super v16;
  uint8_t buf[4];
  id *v18;
  __int16 v19;
  void *v20;

  v4 = a2;
  v5 = v4;
  if (!a1)
    goto LABEL_11;
  if (!v4 || (v6 = sub_100004C7C((uint64_t)v4), (v7 = objc_claimAutoreleasedReturnValue(v6)) == 0))
  {
    __break(1u);
LABEL_11:
    v14 = 0;
    goto LABEL_9;
  }
  v8 = (void *)v7;
  v16.receiver = a1;
  v16.super_class = (Class)PKUISSPresentableContext;
  v9 = (id *)objc_msgSendSuper2(&v16, "init");
  if (v9)
  {
    Object = PKLogFacilityTypeGetObject(0);
    v11 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v18 = v9;
      v19 = 2048;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PKUISSPresentableContext (%p): creating for handle %p.", buf, 0x16u);
    }

    v9[6] = objc_msgSend(v8, "type");
    objc_storeStrong(v9 + 1, a2);
    objc_storeStrong(v9 + 2, a2);
    v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v5, 0);
    v13 = v9[3];
    v9[3] = v12;

    sub_1000041A4((uint64_t)v9[2], v9);
  }
  v14 = v9;

LABEL_9:
  return v14;
}

void sub_100005EC0(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  if (a1 && !*(_BYTE *)(a1 + 32))
  {
    *(_BYTE *)(a1 + 32) = 1;
    v6 = 0u;
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v1 = *(id *)(a1 + 24);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          sub_100003F60(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5));
          v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

  }
}

void sub_100005FBC(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  if (a1 && !*(_BYTE *)(a1 + 33))
  {
    *(_BYTE *)(a1 + 33) = 1;
    v6 = 0u;
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v1 = *(id *)(a1 + 24);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v1);
          sub_100004094(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5));
          v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      }
      while (v3);
    }

  }
}

void sub_1000060B8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (!a1)
    goto LABEL_5;
  if (!*(_BYTE *)(a1 + 34))
  {
    *(_BYTE *)(a1 + 34) = 1;
    v6 = v3;
    objc_storeWeak((id *)(a1 + 40), v3);
    v3 = v6;
    if (v6)
    {
      v4 = sub_100004C88(*(_QWORD *)(a1 + 8));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      objc_msgSend(v6, "setBannerState:", v5);

      objc_msgSend(v6, "setBannerDetached:", *(_QWORD *)(a1 + 16) == 0);
      v3 = v6;
    }
LABEL_5:

    return;
  }
  __break(1u);
}

void sub_100006148(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t Object;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  id WeakRetained;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
      goto LABEL_20;
    v5 = sub_100004C7C((uint64_t)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (!v6)
      goto LABEL_20;
    v7 = v6;
    v8 = (unint64_t)objc_msgSend(v6, "type");
    if (v8 != *(_QWORD *)(a1 + 48) || (v8 | 2) == 2)
      goto LABEL_20;
    Object = PKLogFacilityTypeGetObject(0);
    v10 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134218240;
      v19 = a1;
      v20 = 2048;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PKUISSPresentableContext (%p): coalescing handle %p.", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 24), "addObject:", v4);
    if (*(_BYTE *)(a1 + 32))
      sub_100003F60((uint64_t)v4);
    if (*(_BYTE *)(a1 + 33))
      sub_100004094((uint64_t)v4);
    sub_1000041A4((uint64_t)v4, (void *)a1);
    if (*(_BYTE *)(a1 + 33))
LABEL_20:
      __break(1u);
    if (!*(_QWORD *)(a1 + 16))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "firstObject"));
      v12 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v11;

      v13 = *(void **)(a1 + 16);
      if (v13)
      {
        v14 = (uint64_t *)(a1 + 8);
        objc_storeStrong((id *)(a1 + 8), v13);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        if (WeakRetained)
        {
          v16 = sub_100004C88(*v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          objc_msgSend(WeakRetained, "setBannerState:", v17);

          objc_msgSend(WeakRetained, "setBannerDetached:", 0);
        }

      }
    }

  }
}

uint64_t sub_100006300(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = sub_100004C88(*(_QWORD *)(result + 8));
    return objc_claimAutoreleasedReturnValue(v1);
  }
  return result;
}

id sub_10000649C(uint64_t a1, uint64_t a2)
{
  objc_opt_self();
  if (qword_100012208 != -1)
    dispatch_once(&qword_100012208, &stru_10000C450);
  return +[PKBannerPresentationManager _managerForDestination:withProvider:](PKBannerPresentationManager, "_managerForDestination:withProvider:", a2, qword_100012210);
}

void sub_1000064F8(id a1)
{
  _QWORD *v1;
  void *v2;

  v1 = sub_100006524([PKUISSBannerPresentableProvider alloc]);
  v2 = (void *)qword_100012210;
  qword_100012210 = (uint64_t)v1;

}

_QWORD *sub_100006524(void *a1)
{
  _QWORD *v1;
  id v2;
  void *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)PKUISSBannerPresentableProvider;
  v1 = objc_msgSendSuper2(&v5, "init");
  if (v1)
  {
    v2 = objc_alloc_init((Class)NSMutableArray);
    v3 = (void *)v1[2];
    v1[2] = v2;

  }
  return v1;
}

uint64_t sub_100006590()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;

  v0 = ((uint64_t (*)(void))objc_opt_self)();
  v1 = objc_opt_self(v0);
  v2 = sub_10000649C(v1, 0);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "provider"));

  return v3;
}

id sub_1000069FC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = sub_100004C7C(*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "createBannerViewController");

  sub_1000060B8(*(_QWORD *)(a1 + 40), v4);
  return v4;
}

id sub_100006A4C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = sub_100004C7C(*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "createBannerViewController");

  sub_1000060B8(*(_QWORD *)(a1 + 40), v4);
  return v4;
}

id sub_100006A9C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = sub_100004C7C(*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = objc_msgSend(v2, "createBannerViewController");

  return v3;
}

void sub_100006AD4(uint64_t a1)
{
  sub_100005EC0(*(_QWORD *)(a1 + 32));
}

void sub_100006ADC(uint64_t a1)
{
  sub_100005FBC(*(_QWORD *)(a1 + 32));
}

void sub_100006AE4(uint64_t a1, void *a2)
{
  if (a1)
    sub_100006AF0(a1, a2);
}

void sub_100006AF0(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unsigned int v17;
  uint64_t Object;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  int v36;
  id v37;
  __int16 v38;
  id v39;

  v4 = a2;
  v5 = v4;
  if (a1 && v4)
  {
    v6 = objc_opt_self(PKUISSBannerPresentableProvider);
    v7 = sub_10000649C(v6, 0);
    v8 = sub_100004C7C((uint64_t)v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "passUniqueIdentifier"));

    v13 = *(_QWORD *)(a1 + 8);
    v12 = (id *)(a1 + 8);
    v11 = v13;
    if (v13)
    {
      v14 = sub_100004C7C(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "passUniqueIdentifier"));

      v17 = objc_msgSend(v10, "isEqualToString:", v16);
      Object = PKLogFacilityTypeGetObject(0);
      v19 = objc_claimAutoreleasedReturnValue(Object);
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v20)
        {
          v36 = 138412290;
          v37 = v16;
          v21 = "PKUISSBannerPresentableProvider: coalescing express transaction for %@.";
          v22 = v19;
          v23 = 12;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v36, v23);
        }
      }
      else if (v20)
      {
        v36 = 138412546;
        v37 = v10;
        v38 = 2112;
        v39 = v16;
        v21 = "PKUISSBannerPresentableProvider: subsuming express transaction for %@ with banner for %@.";
        v22 = v19;
        v23 = 22;
        goto LABEL_12;
      }
LABEL_20:

      goto LABEL_21;
    }
    v16 = objc_msgSend(v7, "_currentRequest");
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "context"));
    v19 = v24;
    if (!v24 || *(_QWORD *)(v24 + 48))
    {
      objc_storeStrong(v12, a2);
      objc_msgSend(v7, "_setNeedsUpdate");
      goto LABEL_20;
    }
    v25 = *(id *)(v24 + 8);
    v26 = sub_100004C7C((uint64_t)v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "passUniqueIdentifier"));

    v29 = objc_msgSend(v10, "isEqualToString:", v28);
    v30 = PKLogFacilityTypeGetObject(0);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v32)
      {
        v36 = 138412290;
        v37 = v28;
        v33 = "PKUISSBannerPresentableProvider: coalescing express transaction for %@.";
        v34 = v31;
        v35 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)&v36, v35);
      }
    }
    else if (v32)
    {
      v36 = 138412546;
      v37 = v10;
      v38 = 2112;
      v39 = v28;
      v33 = "PKUISSBannerPresentableProvider: subsuming express transaction for %@ with banner for %@.";
      v34 = v31;
      v35 = 22;
      goto LABEL_18;
    }

    goto LABEL_20;
  }
LABEL_21:

}

void sub_100006DA8(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  id v5;
  id v6;
  id *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 24);
    if (v3
      || (v4 = objc_opt_self(PKUISSBannerPresentableProvider),
          v5 = sub_10000649C(v4, 0),
          v6 = objc_msgSend(v5, "_currentRequest"),
          v3 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context")),
          v6,
          v5,
          v3)
      && v3[6] == 1)
    {
      sub_100006148((uint64_t)v3, v10);
    }
    else
    {

      v7 = sub_100005D3C([PKUISSPresentableContext alloc], v10);
      v8 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v7;

      v9 = objc_opt_self(PKUISSBannerPresentableProvider);
      v3 = sub_10000649C(v9, 0);
      objc_msgSend(v3, "_setNeedsUpdate");
    }

  }
}

void sub_100006E90(uint64_t a1, uint64_t a2)
{
  if (a1)
    sub_100006E9C(a1, a2);
}

void sub_100006E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "addObject:", a2);
    v2 = objc_opt_self(PKUISSBannerPresentableProvider);
    v3 = sub_10000649C(v2, 0);
    objc_msgSend(v3, "_setNeedsUpdate");

  }
}

void sub_100007370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  id *v28;
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v28);
  objc_destroyWeak(v29);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v30 - 192));
  objc_destroyWeak((id *)(v30 - 144));
  _Unwind_Resume(a1);
}

BOOL sub_1000073CC(id a1, NSUserActivity *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity activityType](a2, "activityType"));
  v3 = objc_msgSend(v2, "isEqualToString:", PKPassbookUISSUserActivityTypeInAppPayment);

  return v3;
}

void sub_100007410(uint64_t a1, uint64_t a2)
{
  uint64_t Object;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  Object = PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error requesting destruction for session: %@, %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_1000074D0(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 3), "setRootViewController:", 0);
    v4 = (void *)v3[2];
    v3[2] = 0;

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000075B4;
    v7[3] = &unk_10000C3C0;
    v8 = v5;
    objc_msgSend(v6, "requestSceneSessionDestruction:options:errorHandler:", v8, 0, v7);

  }
}

void sub_1000075B4(uint64_t a1, uint64_t a2)
{
  uint64_t Object;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  Object = PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error requesting destruction for session: %@, %@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_100007674(uint64_t a1, int a2)
{
  id *v4;
  id *WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v6 = objc_alloc_init((Class)PKPaymentAuthorizationRemoteAlertViewController);
    v7 = v6;
    if (a2)
      objc_msgSend(v6, "setBlocksInput");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 56);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000077E4;
    v13[3] = &unk_10000C540;
    objc_copyWeak(&v16, v4);
    v10 = v7;
    v14 = v10;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v10, "configureWithUserInfo:dismissalHandler:completion:", v8, v9, v13);
    objc_storeStrong(WeakRetained + 1, v7);
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 48));
    v11 = objc_loadWeakRetained((id *)(a1 + 72));
    v12 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v11, "inAppPaymentInterfaceWillPresentWithSceneSession:", v12);

    objc_destroyWeak(&v16);
  }

}

void sub_1000077CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000077E4(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteActivatedWithPresentationMode:", 0);
    v2 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "setRootViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "makeKeyAndVisible");
    objc_msgSend(v2, "setOverrideUserInterfaceStyle:", 2);
    objc_msgSend(WeakRetained, "setWindow:", v2);

  }
}

int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;

  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(PassbookUISSApplicationDelegate);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  sub_100004CF0((uint64_t)PKUISSListener_Banner);
  sub_100004D64((uint64_t)PKUISSListener_Banner);
  objc_autoreleasePoolPop(v5);
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, v8);

  return (int)argv;
}

id objc_msgSend__createPresentableWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createPresentableWithConfiguration:");
}

id objc_msgSend__currentRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentRequest");
}

id objc_msgSend__setNeedsUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setNeedsUpdate");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_askForDismissalWithReason_error_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "askForDismissalWithReason:error:completion:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_bannerHandle_didChangeFromState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerHandle:didChangeFromState:");
}

id objc_msgSend_bannerHandleDidInvalidate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerHandleDidInvalidate:");
}

id objc_msgSend_beginBackgroundTaskWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginBackgroundTaskWithName:expirationHandler:");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_configureWithUserInfo_dismissalHandler_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureWithUserInfo:dismissalHandler:completion:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createBannerViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createBannerViewController");
}

id objc_msgSend_createWithPresentable_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createWithPresentable:context:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_detachWithFinished_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detachWithFinished:reply:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_inAppPaymentInterfaceWillPresentWithSceneSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inAppPaymentInterfaceWillPresentWithSceneSession:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUserInfo:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenerWithConfigurator:");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_noteActivatedWithPresentationMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteActivatedWithPresentationMode:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_passUniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passUniqueIdentifier");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_pk_anyObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pk_anyObjectPassingTest:");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provider");
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcess");
}

id objc_msgSend_remoteTargetWithAssertionAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteTargetWithAssertionAttributes:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_setBannerDetached_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBannerDetached:");
}

id objc_msgSend_setBannerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBannerState:");
}

id objc_msgSend_setBlocksInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlocksInput");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDidFinishHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidFinishHandler:");
}

id objc_msgSend_setDidStartHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidStartHandler:");
}

id objc_msgSend_setDismissHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissHandler:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setFactory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFactory:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceTarget:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setTargetQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetQueue:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_startRegistrationFlowWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRegistrationFlowWithCompletion:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivities");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInitiated");
}
