@implementation TUDialRequest

+ (id)dialRequestForCallProvider:(id)a3 handle:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "type");
  if (objc_msgSend(v5, "supportsHandleType:", v7))
  {
    v8 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithProvider:", v5);
    objc_msgSend(v8, "setHandle:", v6);
  }
  else
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001A9BD8(v5, (uint64_t)v7, v10);

    v8 = 0;
  }

  return v8;
}

+ (id)dialRequestForUserActivity:(id)a3 callProviderManager:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  int v34;
  id v35;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 138412290;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to create a dial request for user activity (%@)", (uint8_t *)&v34, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callProviderIdentifier"));
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "providerWithIdentifier:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handle"));
      LOBYTE(v34) = 0;
      if ((v12
         || (v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "providerWithService:video:", objc_msgSend(v6, "callService"), &v34))) != 0)
        && v13)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dialRequestForCallProvider:handle:", v12, v13));
        objc_msgSend(v22, "setVideo:", v34);
      }
      else
      {
        v31 = sub_1000C5588();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_1001A9D0C((uint64_t)v11, v32);

        v22 = 0;
      }

    }
    else
    {
      v23 = sub_1000C5588();
      v12 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1001A9CD8(v12, v24, v25, v26, v27, v28, v29, v30);
      v22 = 0;
    }

  }
  else
  {
    v14 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001A9CA4(v11, v15, v16, v17, v18, v19, v20, v21);
    v22 = 0;
  }

  return v22;
}

- (BOOL)canMakeEmergencyCallForSenderIdentity:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;

  v3 = a3;
  if (sub_1000873AC())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
    v5 = +[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:](TUCallCapabilities, "canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:", v4);

    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("cannot");
      if (v5)
        v8 = CFSTR("can");
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device is in airplane mode and %@ make an emergency call using sender identity %@", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)dialRequestByResolvingDialTypeUsingSenderIdentityClient:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  TUDialRequest *v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;

  v4 = a3;
  v5 = -[TUDialRequest copy](self, "copy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUDialRequest handle](self, "handle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  if (objc_msgSend(v7, "length"))
  {

    goto LABEL_4;
  }
  v8 = -[TUDialRequest dialType](self, "dialType");

  if (v8 == (id)1)
  {
LABEL_4:
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10007CB28;
    v31[3] = &unk_100286780;
    v32 = v4;
    v33 = self;
    v9 = objc_retainBlock(v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUDialRequest localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUDialRequest provider](self, "provider"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "senderIdentityForAccountUUID:", v10));

      if (v12)
      {
        v13 = ((uint64_t (*)(_QWORD *, id, void *))v9[2])(v9, v5, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        if (v14)
        {
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
        v15 = sub_1000C5588();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v10;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not find a sender identity that contains account UUID %@", buf, 0xCu);
        }

      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUDialRequest provider](self, "provider"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "prioritizedSenderIdentities"));

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      while (2)
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          v24 = ((uint64_t (*)(_QWORD *, id, _QWORD))v9[2])(v9, v5, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v23));
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (v25)
          {
            v14 = (void *)v25;
            goto LABEL_21;
          }
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        if (v21)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:

  return v5;
}

@end
