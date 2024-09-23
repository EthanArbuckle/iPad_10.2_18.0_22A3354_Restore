@implementation SPCoreTelephonyAdapter

- (SPCoreTelephonyAdapter)init
{
  SPCoreTelephonyAdapter *v2;
  CoreTelephonyClient *v3;
  CoreTelephonyClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPCoreTelephonyAdapter;
  v2 = -[SPCoreTelephonyAdapter init](&v6, "init");
  if (v2)
  {
    v3 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", -[SPCoreTelephonyAdapter get_queue](v2, "get_queue"));
    client = v2->_client;
    v2->_client = v3;

  }
  return v2;
}

- (dispatch_queue_s)get_queue
{
  if (qword_1002B8230 != -1)
    dispatch_once(&qword_1002B8230, &stru_10025EED8);
  return (dispatch_queue_s *)qword_1002B8238;
}

- (id)setApplicationCategory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;

  v4 = a3;
  v5 = qword_1002BEFA0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "settings application category to %@", (uint8_t *)&v10, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter client](self, "client"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setApplicationCategory:", v4));

  if (v7)
  {
    v8 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
      sub_1001E4308((uint64_t)v4, (uint64_t)v7, v8);
  }

  return v7;
}

- (void)updateDelegate:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter delegate](self, "delegate"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter delegate](self, "delegate"));
    v13 = objc_opt_respondsToSelector(v12, "slicingDescriptorsDidUpdate:withDescriptors:appInfo:andStatus:");

    if ((v13 & 1) != 0)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10007AE2C;
      v15[3] = &unk_10025EF00;
      v15[4] = self;
      v16 = (id)objc_claimAutoreleasedReturnValue(+[SPSlicingDescriptor _coreTelephonyContainer:](SPSlicingDescriptor, "_coreTelephonyContainer:", v9));
      v17 = v8;
      v18 = a4;
      v14 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

    }
  }

}

- (id)getTrafficDescriptors
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter client](self, "client"));
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getSliceTrafficDescriptors:", &v9));
  v4 = v9;

  if (v4)
  {
    v5 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_ERROR))
      sub_1001E438C((uint64_t)v4, v5);
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trafficDescriptors"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingDescriptor _coreTelephonyDescritorList:](SPSlicingDescriptor, "_coreTelephonyDescritorList:", v7));

  }
  return v6;
}

- (id)getPDPInfo
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter client](self, "client"));
  v18 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getCurrentDataSubscriptionContextSync:", &v18));
  v5 = v18;

  if (v5)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v8 = &stru_10026F118;
  }
  else
  {
    v5 = 0;
    v7 = 28;
    v8 = &stru_10026F118;
    while (1)
    {
      v9 = v5;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter client](self, "client"));
      v17 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getConnectionState:connectionType:error:", v4, v7, &v17));
      v5 = v17;

      if (v11)
      {
        if (!v5)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interfaceName"));
          if (v12)
          {
            v13 = (void *)v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interfaceName"));
            v15 = objc_msgSend(v14, "isEqualToString:", &stru_10026F118);

            if (!v15)
              break;
          }
        }
      }

      v7 = (v7 + 1);
      if ((_DWORD)v7 == 36)
        goto LABEL_14;
    }
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interfaceName"));
    v5 = v11;
  }
LABEL_14:

  return v8;
}

- (void)nrSliceAppStateChanged:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = qword_1002BEFA0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("false");
    *(_DWORD *)buf = 138412802;
    v23 = v8;
    v24 = 2112;
    if (v6)
      v11 = CFSTR("true");
    v25 = v11;
    v26 = 2112;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Slicing AppId=%@ state changed status=%@ %@", buf, 0x20u);
  }
  v12 = objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter delegate](self, "delegate"));
  if (v12
    && (v13 = (void *)v12,
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter delegate](self, "delegate")),
        v15 = objc_opt_respondsToSelector(v14, "updateDelegate:status:trafficDescriptors:"),
        v14,
        v13,
        (v15 & 1) != 0))
  {
    objc_initWeak((id *)buf, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007B2AC;
    v17[3] = &unk_10025EF28;
    objc_copyWeak(&v20, (id *)buf);
    v18 = v8;
    v21 = v6;
    v19 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "there is not delegate set. Ignoring callback", buf, 2u);
    }
  }

}

- (void)nrSlicedRunningAppStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = qword_1002BEFA0;
  if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Slicing App state changed %@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingApplicationContainer _coreTelephonyAppInfoContainer:](SPSlicingApplicationContainer, "_coreTelephonyAppInfoContainer:", v4));
  v7 = objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter delegate](self, "delegate"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SPCoreTelephonyAdapter delegate](self, "delegate")),
        v10 = objc_opt_respondsToSelector(v9, "slicingRunningAppStateChanged:"),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    objc_initWeak((id *)buf, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007B4C8;
    v12[3] = &unk_10025EF50;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11 = qword_1002BEFA0;
    if (os_log_type_enabled((os_log_t)qword_1002BEFA0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "there is not delegate set. Ignoring callback", buf, 2u);
    }
  }

}

- (SPCoreTelephonyAdapterDelegate)delegate
{
  return (SPCoreTelephonyAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
