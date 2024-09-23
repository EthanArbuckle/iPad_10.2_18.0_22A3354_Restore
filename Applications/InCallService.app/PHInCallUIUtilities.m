@implementation PHInCallUIUtilities

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A2C4;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DCA28 != -1)
    dispatch_once(&qword_1002DCA28, block);
  return (id)qword_1002DCA20;
}

- (PHInCallUIUtilities)init
{
  PHInCallUIUtilities *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  unsigned int (*v8)(_QWORD);
  _Unwind_Exception *v10;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v11.receiver = self;
  v11.super_class = (Class)PHInCallUIUtilities;
  v2 = -[PHInCallUIUtilities init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:](FBSDisplayLayoutMonitor, "sharedMonitorForDisplayType:", 0));
    v5 = (void *)objc_opt_class(v2, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentLayout"));
    if ((objc_msgSend(v5, "layoutIsLocked:", v6) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = (unsigned int (*)(_QWORD))off_1002DCA60;
      v16 = off_1002DCA60;
      if (!off_1002DCA60)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10007B134;
        v12[3] = &unk_100285628;
        v12[4] = &v13;
        sub_10007B134((uint64_t)v12);
        v8 = (unsigned int (*)(_QWORD))v14[3];
      }
      _Block_object_dispose(&v13, 8);
      if (!v8)
      {
        v10 = (_Unwind_Exception *)sub_1001A8660();
        _Block_object_dispose(&v13, 8);
        _Unwind_Resume(v10);
      }
      v7 = v8(0) != 0;
    }
    v2->_springBoardLocked = v7;

    objc_msgSend(v3, "addObserver:", v2);
  }
  return v2;
}

+ (id)telephonyClient
{
  if (qword_1002DCA38 != -1)
    dispatch_once(&qword_1002DCA38, &stru_100286670);
  return (id)qword_1002DCA30;
}

+ (int64_t)interfaceOrientationForDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 1;
  else
    return a3;
}

+ (int64_t)deviceOrientationForBSInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 1;
  else
    return qword_10023FD30[a3 - 2];
}

+ (id)handleNavigationControllerIfNecessary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  v5 = objc_opt_class(UINavigationController, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

+ (BOOL)shouldRequestPasscodeUnlockForMMICode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  _BYTE v40[14];
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("*#06#")) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "telephonyClient"));
    v38 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSubscriptionInfoWithError:", &v38));
    v7 = v38;

    if (v7)
    {
      v8 = sub_1000C5588();
      v32 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_1001A9AB8();
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        v32 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 2);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v14)
        {
          v15 = v14;
          v30 = v6;
          v31 = v4;
          v7 = 0;
          v16 = *(_QWORD *)v35;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v35 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(v18, "isSimHidden", v30, v31) & 1) == 0)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "telephonyClient"));
                v33 = v7;
                v20 = objc_msgSend(v19, "copyCarrierBundleValueWithDefault:key:bundleType:error:", v18, CFSTR("ShowIMEIsInLockScreen"), v32, &v33);
                v21 = v33;

                if (v21)
                {
                  v22 = sub_1000C5588();
                  v23 = objc_claimAutoreleasedReturnValue(v22);
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v40 = v21;
                    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Received error: %@ while querying -copyCarrierBundleValueWithDefault", buf, 0xCu);
                  }

                }
                else
                {
                  if ((objc_opt_respondsToSelector(v20, "BOOLValue") & 1) != 0)
                    v24 = objc_msgSend(v20, "BOOLValue");
                  else
                    v24 = 0;
                  v25 = sub_1000C5588();
                  v26 = objc_claimAutoreleasedReturnValue(v25);
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  {
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uuid"));
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v40 = v24;
                    *(_WORD *)&v40[4] = 2112;
                    *(_QWORD *)&v40[6] = v20;
                    v41 = 2112;
                    v42 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received regionWantsPasscodeBypassForIMEI: %d from carrierBundleValue: %@ subscription: %@", buf, 0x1Cu);

                  }
                  if ((v24 & 1) != 0)
                  {

                    v9 = 0;
                    v7 = 0;
                    goto LABEL_34;
                  }
                }

                v7 = v21;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            if (v15)
              continue;
            break;
          }
          v9 = 1;
LABEL_34:
          v6 = v30;
          v4 = v31;
        }
        else
        {
          v7 = 0;
          v9 = 1;
        }

        goto LABEL_37;
      }
      v28 = sub_1000C5588();
      v32 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_1001A9A58();
      v7 = 0;
    }
    v9 = 1;
LABEL_37:

    goto LABEL_38;
  }
  v10 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Code is not for IMEI, should request passcode unlock", buf, 2u);
  }
  v9 = 1;
LABEL_38:

  return v9;
}

+ (BOOL)isSpringBoardPasscodeLocked
{
  return MKBGetDeviceLockState(0, a2) - 1 < 2;
}

+ (BOOL)layoutIsLocked:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "elements", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = FBSDisplayLayoutElementLockScreenIdentifier;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "identifier"));
        v10 = objc_msgSend(v9, "isEqualToString:", v7);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)hasMultipleSenderIdentities
{
  void *v2;
  BOOL v3;

  if (qword_1002DCA40 != -1)
    dispatch_once(&qword_1002DCA40, &stru_100286690);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002DCA48, "prioritizedSenderIdentities"));
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

+ (id)fbsOrientationObserver
{
  if (qword_1002DCA58 != -1)
    dispatch_once(&qword_1002DCA58, &stru_1002866B0);
  return (id)qword_1002DCA50;
}

+ (BOOL)isExplicitTransferSupportedForSubscriptionLabelIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  id v34;
  NSObject *v35;
  BOOL v36;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "telephonyClient"));
  v46 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSubscriptionInfoWithError:", &v46));
  v7 = v46;

  if (v7)
  {
    v8 = sub_1000C5588();
    v40 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_1001A9B78();
    goto LABEL_30;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
  v10 = objc_msgSend(v9, "count");

  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v10)
  {
    v40 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1001A9B18();
    goto LABEL_29;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
    *(_DWORD *)buf = 138412290;
    v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: all the subscriptions are: %@", buf, 0xCu);

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptions"));
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  v40 = v15;
  if (!v16)
  {
LABEL_29:
    v7 = 0;
LABEL_30:
    v36 = 0;
    goto LABEL_31;
  }
  v17 = v16;
  v39 = a1;
  v18 = 0;
  v19 = *(_QWORD *)v43;
  v38 = v4;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v43 != v19)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
      v22 = sub_1000C5588();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: checking subscription: %@", buf, 0xCu);
      }

      if ((objc_msgSend(v21, "isSimHidden") & 1) == 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "labelID"));
        v25 = objc_msgSend(v24, "isEqualToString:", v4);

        if (v25)
        {
          v26 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "telephonyClient"));
          v41 = v18;
          v28 = objc_msgSend(v27, "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v21, &off_100297170, v26, &v41);
          v7 = v41;

          v30 = objc_opt_class(NSNumber, v29);
          if ((objc_opt_isKindOfClass(v28, v30) & 1) != 0
            || (v32 = objc_opt_class(NSString, v31), (objc_opt_isKindOfClass(v28, v32) & 1) != 0))
          {
            v33 = objc_msgSend(v28, "BOOLValue");
          }
          else
          {
            v33 = 0;
          }
          v34 = sub_1000C5588();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v48 = v28;
            v49 = 2112;
            v50 = v21;
            v51 = 2112;
            v52 = v7;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "ShowExplicitCallTransferButton: retrieved ShowExplicitCallTransferButton value %@ for subscription %@ with error %@", buf, 0x20u);
          }

          if ((v33 & 1) != 0)
          {
            v36 = 1;
            v4 = v38;
            goto LABEL_31;
          }
          v18 = v7;
          v4 = v38;
          v15 = v40;
        }
      }
    }
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v17)
      continue;
    break;
  }
  v36 = 0;
  v7 = v18;
LABEL_31:

  return v36;
}

+ (int64_t)frontboardOrientation
{
  void *v2;
  char *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fbsOrientationObserver"));
  v3 = (char *)objc_msgSend(v2, "activeInterfaceOrientation");
  if ((unint64_t)(v3 - 1) > 3)
    v4 = 0;
  else
    v4 = qword_10023FD48[(_QWORD)(v3 - 1)];

  return v4;
}

- (BOOL)isSpringBoardLocked
{
  return self->_springBoardLocked;
}

- (void)setSpringBoardLocked:(BOOL)a3
{
  self->_springBoardLocked = a3;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6;
  uint64_t v7;
  unsigned __int8 v8;
  _QWORD v9[5];
  unsigned __int8 v10;

  v6 = a4;
  v8 = objc_msgSend((id)objc_opt_class(self, v7), "layoutIsLocked:", v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007B0B4;
  v9[3] = &unk_100284C98;
  v9[4] = self;
  v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

@end
