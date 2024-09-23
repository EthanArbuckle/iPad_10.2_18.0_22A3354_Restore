@implementation HSNFCManager

- (HSNFCManager)initWithDelegate:(id)a3
{
  id v4;
  HSNFCManager *v5;
  HSNFCManager *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *sessionQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HSNFCManager;
  v5 = -[HSNFCManager init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.Home.HomeUIService.NFCSessionQueue", v8);
    sessionQueue = v6->_sessionQueue;
    v6->_sessionQueue = (OS_dispatch_queue *)v9;

  }
  return v6;
}

- (id)start
{
  unsigned __int8 v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[5];
  id v38;
  id v39;
  id buf;
  id v41;

  v41 = 0;
  v3 = -[HSNFCManager readerSupportedWithError:](self, "readerSupportedWithError:", &v41);
  v4 = v41;
  if ((v3 & 1) == 0)
  {
    v17 = HFLogForCategory(58);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10006039C(v18, v19, v20, v21, v22, v23, v24, v25);

    v26 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v4));
    goto LABEL_13;
  }
  v5 = objc_claimAutoreleasedReturnValue(-[HSNFCManager nearFieldReaderSession](self, "nearFieldReaderSession"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSNFCManager nearFieldReaderSession](self, "nearFieldReaderSession"));
    v8 = objc_msgSend(v7, "state");

    if (v8 != (id)2)
    {
      v27 = HFLogForCategory(58);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_10006036C(v28, v29, v30, v31, v32, v33, v34, v35);

      v26 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
LABEL_13:
      v16 = (id)v26;
      goto LABEL_14;
    }
  }
  v9 = HFLogForCategory(58);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "NFC: Attempting to start session", (uint8_t *)&buf, 2u);
  }

  v11 = objc_alloc_init((Class)NAFuture);
  objc_initWeak(&buf, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10004440C;
  v37[3] = &unk_1000A2EB8;
  v37[4] = self;
  objc_copyWeak(&v39, &buf);
  v13 = v11;
  v38 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startReaderSession:", v37));
  -[HSNFCManager setOverallSession:](self, "setOverallSession:", v14);

  v15 = v38;
  v16 = v13;

  objc_destroyWeak(&v39);
  objc_destroyWeak(&buf);
LABEL_14:

  return v16;
}

- (void)stop
{
  uint64_t v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[6];
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  if (-[HSNFCManager readerSupportedWithError:](self, "readerSupportedWithError:", 0))
  {
    v3 = HFLogForCategory(58);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NFC: Attempting to end session", buf, 2u);
    }

    v5 = dispatch_semaphore_create(0);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = sub_10004495C;
    v28 = sub_10004496C;
    v6 = objc_alloc((Class)BKSProcessAssertion);
    v7 = getpid();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100044974;
    v21[3] = &unk_1000A2EE0;
    v23 = &v30;
    v8 = v5;
    v22 = v8;
    v29 = objc_msgSend(v6, "initWithPID:flags:reason:name:withHandler:", v7, 1, 4, CFSTR("HomeNFCStopAssertion"), v21);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (!*((_BYTE *)v31 + 24))
    {
      v9 = HFLogForCategory(58);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100060498(v10, v11, v12, v13, v14, v15, v16, v17);

      objc_msgSend(*((id *)v25 + 5), "invalidate");
      v18 = (void *)*((_QWORD *)v25 + 5);
      *((_QWORD *)v25 + 5) = 0;

    }
    v19 = objc_claimAutoreleasedReturnValue(-[HSNFCManager sessionQueue](self, "sessionQueue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100044988;
    v20[3] = &unk_1000A2F08;
    v20[4] = self;
    v20[5] = buf;
    dispatch_async(v19, v20);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v30, 8);

  }
}

- (BOOL)readerSupportedWithError:(id *)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
  LOBYTE(a3) = objc_msgSend(v4, "areFeaturesSupported:outError:", 1, a3);

  return (char)a3;
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  unsigned __int8 v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  id v47;
  char *obj;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int16 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  _BYTE v72[128];

  v6 = a3;
  v7 = (char *)a4;
  v8 = HFLogForCategory(58);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v67 = v6;
    v68 = 2112;
    v69 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NFC: readerSession:%@ didDetectTags:%@", buf, 0x16u);
  }

  v64 = 0;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v61;
    *(_QWORD *)&v11 = 138412546;
    v44 = v11;
    v45 = *(_QWORD *)v61;
    v46 = v6;
    do
    {
      v14 = 0;
      v47 = v12;
      do
      {
        if (*(_QWORD *)v61 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v14);
        v59 = 0;
        v16 = objc_msgSend(v6, "connectTag:error:", v15, &v59, v44);
        v17 = v59;
        if ((v16 & 1) != 0)
        {
          objc_msgSend(v6, "checkNdefSupportsRead:andWrite:", (char *)&v64 + 1, &v64);
          v18 = HFLogForCategory(58);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            if (HIBYTE(v64))
              v20 = "YES";
            else
              v20 = "NO";
            if ((_BYTE)v64)
              v21 = "YES";
            else
              v21 = "NO";
            *(_DWORD *)buf = 138412802;
            v67 = v15;
            v68 = 2080;
            v69 = v20;
            v70 = 2080;
            v71 = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "NFC: tag %@: read = %s write = %s", buf, 0x20u);
          }

          v58 = 0;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ndefReadWithError:", &v58));
          v51 = v58;
          v52 = v22;
          if (!v22)
          {
            v23 = HFLogForCategory(58);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v44;
              v67 = v15;
              v68 = 2112;
              v69 = (const char *)v51;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "NFC: Unable to read tag: %@. Error = %@", buf, 0x16u);
            }

            v22 = 0;
          }
          v49 = v17;
          v50 = v14;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "records"));
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v55;
            do
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(_QWORD *)v55 != v28)
                  objc_enumerationMutation(v25);
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1)
                                                                                   + 8 * (_QWORD)i), "decode"));
                v31 = HFLogForCategory(58);
                v32 = objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v67 = v30;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "NFC: read token: %@", buf, 0xCu);
                }

                v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSNFCManager delegate](self, "delegate"));
                v34 = objc_msgSend(v33, "nfcManager:shouldReturnPayloadString:", self, v30);

                if (v34)
                {
                  v35 = HFLogForCategory(58);
                  v36 = objc_claimAutoreleasedReturnValue(v35);
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v67 = v30;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "NFC: Successfully read setup payload string %@", buf, 0xCu);
                  }

                  v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSNFCManager delegate](self, "delegate"));
                  objc_msgSend(v37, "nfcManager:didRecognizePayloadString:", self, v30);

                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
            }
            while (v27);
          }

          v53 = 0;
          v6 = v46;
          v38 = objc_msgSend(v46, "disconnectTagWithError:", &v53);
          v39 = v53;
          v12 = v47;
          v13 = v45;
          v17 = v49;
          v14 = v50;
          if ((v38 & 1) == 0)
          {
            v40 = HFLogForCategory(58);
            v41 = objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v39;
              _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "NFC: Failed to disconnect tag with error:%@", buf, 0xCu);
            }

          }
          v42 = v51;
        }
        else
        {
          v43 = HFLogForCategory(58);
          v42 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v44;
            v67 = v15;
            v68 = 2112;
            v69 = (const char *)v17;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "NFC: Unable to connect to tag: %@. Error = %@", buf, 0x16u);
          }
        }

        v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    }
    while (v12);
  }

}

- (void)readerSessionDidEndUnexpectedly:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v4 = HFLogForCategory(58);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000604C8((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

}

- (HSNFCManagerDelegate)delegate
{
  return (HSNFCManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NFSession)overallSession
{
  return self->_overallSession;
}

- (void)setOverallSession:(id)a3
{
  objc_storeStrong((id *)&self->_overallSession, a3);
}

- (NFReaderSession)nearFieldReaderSession
{
  return self->_nearFieldReaderSession;
}

- (void)setNearFieldReaderSession:(id)a3
{
  objc_storeStrong((id *)&self->_nearFieldReaderSession, a3);
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionQueue, a3);
}

- (BOOL)pausedInBackground
{
  return self->_pausedInBackground;
}

- (void)setPausedInBackground:(BOOL)a3
{
  self->_pausedInBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_nearFieldReaderSession, 0);
  objc_storeStrong((id *)&self->_overallSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
