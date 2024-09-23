@implementation FMDRemoteUnlockPairingData

+ (id)keys
{
  if (qword_1000312F0 != -1)
    dispatch_once(&qword_1000312F0, &stru_1000254C0);
  return (id)qword_1000312E8;
}

- (FMDRemoteUnlockPairingData)initWithData:(id)a3
{
  id v4;
  FMDRemoteUnlockPairingData *v5;
  FMDRemoteUnlockPairingData *v6;
  id v7;
  void *v8;
  id v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  void *i;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  FMDRemoteUnlockPairingData *v24;
  void *v25;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)FMDRemoteUnlockPairingData;
  v5 = -[FMDRemoteUnlockPairingData init](&v33, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(v5), "keys");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v28 = v4;
    v9 = objc_retainAutorelease(v4);
    v10 = (char *)objc_msgSend(v9, "bytes");
    v11 = (char *)objc_msgSend(v9, "length");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v13)
    {
      v14 = v13;
      v27 = (uint64_t)v9;
      v15 = 0;
      v16 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v12);
          v18 = v15 + 2;
          if (v15 + 2 <= (unint64_t)v11)
          {
            v19 = __rev16(*(unsigned __int16 *)&v10[v15]);
            v15 = v18 + v19;
            if (v18 + v19 > (unint64_t)v11)
            {
              v22 = sub_100007B7C();
              v23 = objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                sub_100016CB0(v27, v23);

              v24 = 0;
              v4 = v28;
              goto LABEL_22;
            }
            if (v19)
            {
              v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v10[v18], v27));
              -[FMDRemoteUnlockPairingData setValue:forKey:](v6, "setValue:forKey:", v21, v20);

            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v14)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }

    if ((unint64_t)v11 > v15)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v10[v15], &v11[-v15]));
      -[FMDRemoteUnlockPairingData setOtherData:](v6, "setOtherData:", v25);

    }
    v4 = v28;
  }
  v24 = v6;
LABEL_22:

  return v24;
}

- (id)data
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = objc_alloc_init((Class)NSMutableData);
  v4 = objc_msgSend((id)objc_opt_class(self), "keys");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9), (_QWORD)v22));
        v11 = malloc_type_malloc(2uLL, 0x4258646CuLL);
        if (!v11)
        {

          v20 = 0;
          goto LABEL_16;
        }
        v12 = v11;
        v11[1] = objc_msgSend(v10, "length");
        *v12 = (unsigned __int16)objc_msgSend(v10, "length") >> 8;
        objc_msgSend(v3, "appendBytes:length:", v12, 2);
        objc_msgSend(v3, "appendData:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData otherData](self, "otherData"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData otherData](self, "otherData"));
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData otherData](self, "otherData"));
      objc_msgSend(v3, "appendData:", v17);

    }
  }
  v18 = sub_100007B7C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_100016D24((uint64_t)v3, v19);

  v20 = v3;
LABEL_16:

  return v20;
}

+ (id)randomDataOfSize:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = malloc_type_malloc(a3, 0x3658A070uLL);
  if (v4)
  {
    v5 = v4;
    arc4random_buf(v4, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v5, a3, 1));
  }
  return v4;
}

+ (BOOL)testPairingData
{
  FMDRemoteUnlockPairingData *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  FMDRemoteUnlockPairingData *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  id v23;
  id v24;
  uint8_t v26[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = objc_alloc_init(FMDRemoteUnlockPairingData);
  v4 = objc_msgSend((id)objc_opt_class(a1), "randomDataOfSize:", 60);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[FMDRemoteUnlockPairingData setPairingCheckToken:](v3, "setPairingCheckToken:", v5);

  v6 = objc_msgSend((id)objc_opt_class(a1), "randomDataOfSize:", 64);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[FMDRemoteUnlockPairingData setLostModePrivateKey:](v3, "setLostModePrivateKey:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData data](v3, "data"));
  if (v8)
  {
    v9 = -[FMDRemoteUnlockPairingData initWithData:]([FMDRemoteUnlockPairingData alloc], "initWithData:", v8);
    if (v9)
    {
      v10 = objc_msgSend((id)objc_opt_class(a1), "keys");
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue(v10);
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData valueForKey:](v3, "valueForKey:", v16));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData valueForKey:](v9, "valueForKey:", v16));
            v19 = objc_msgSend(v17, "isEqualToData:", v18);

            if (!v19)
            {
              v22 = 0;
              v21 = v11;
              goto LABEL_18;
            }
          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v13)
            continue;
          break;
        }
      }

      v20 = sub_100007B7C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "FMDRemoteUnlockPairingData: test 1 success", v26, 2u);
      }
      v22 = 1;
LABEL_18:

    }
    else
    {
      v24 = sub_100007B7C();
      v11 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100016DC4();
      v22 = 0;
    }

  }
  else
  {
    v23 = sub_100007B7C();
    v9 = (FMDRemoteUnlockPairingData *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      sub_100016D98();
    v22 = 0;
  }

  return v22;
}

+ (BOOL)testPairingData2
{
  char *v2;
  id v3;
  FMDRemoteUnlockPairingData *v4;
  NSObject *v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  __int16 v16[8];

  v2 = (char *)malloc_type_malloc(0x15uLL, 0xD692C67uLL);
  *(_WORD *)v2 = 1280;
  *(_DWORD *)(v2 + 2) = 875770417;
  v2[6] = 53;
  *(_WORD *)(v2 + 7) = 3072;
  *(_DWORD *)(v2 + 17) = 1818978921;
  *(_QWORD *)(v2 + 9) = *(_QWORD *)"abcdefghijkl";
  v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v2, 21);
  v4 = -[FMDRemoteUnlockPairingData initWithData:]([FMDRemoteUnlockPairingData alloc], "initWithData:", v3);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", "12345", 5);
    v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", "abcdefghijkl", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData pairingCheckToken](v4, "pairingCheckToken"));
    v8 = -[NSObject isEqualToData:](v5, "isEqualToData:", v7);

    if (v8
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData lostModePrivateKey](v4, "lostModePrivateKey")),
          v10 = objc_msgSend(v6, "isEqualToData:", v9),
          v9,
          v10))
    {
      v11 = sub_100007B7C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDRemoteUnlockPairingData: test 2 success", (uint8_t *)v16, 2u);
      }

      v13 = 1;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v14 = sub_100007B7C();
    v5 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100016DC4();
    v13 = 0;
  }

  return v13;
}

+ (BOOL)testPairingData3
{
  char *v2;
  id v3;
  FMDRemoteUnlockPairingData *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  uint8_t *v23;
  id v24;
  id v25;
  const char *v26;
  uint8_t *v27;
  id v28;
  id v29;
  id v30;
  __int16 v32;
  uint8_t v33[2];
  uint8_t buf[2];
  __int16 v35;
  __int16 v36;
  __int16 v37;

  v2 = (char *)malloc_type_malloc(0x28uLL, 0x6EC9B2CFuLL);
  *(_WORD *)v2 = 1280;
  *(_DWORD *)(v2 + 2) = 875770417;
  v2[6] = 53;
  *(_WORD *)(v2 + 7) = 3072;
  *(_DWORD *)(v2 + 17) = 1818978921;
  *(_QWORD *)(v2 + 9) = *(_QWORD *)"abcdefghijkl";
  *(_WORD *)(v2 + 21) = 2304;
  v2[31] = 57;
  *(_QWORD *)(v2 + 23) = *(_QWORD *)"123456789";
  *((_QWORD *)v2 + 4) = 0x6867666564636261;
  v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v2, 40);
  v4 = -[FMDRemoteUnlockPairingData initWithData:]([FMDRemoteUnlockPairingData alloc], "initWithData:", v3);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", "12345", 5);
    v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", "abcdefghijkl", 12);
    v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", "123456789", 9);
    v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", "abcdefgh", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData pairingCheckToken](v4, "pairingCheckToken"));
    v10 = -[NSObject isEqualToData:](v5, "isEqualToData:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData lostModePrivateKey](v4, "lostModePrivateKey"));
      v12 = objc_msgSend(v6, "isEqualToData:", v11);

      if ((v12 & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData phoneNumber](v4, "phoneNumber"));
        v14 = objc_msgSend(v7, "isEqualToData:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData otherData](v4, "otherData"));
          v16 = objc_msgSend(v8, "isEqualToData:", v15);

          if ((v16 & 1) != 0)
          {
            v17 = objc_claimAutoreleasedReturnValue(-[FMDRemoteUnlockPairingData data](v4, "data"));
            v18 = -[NSObject isEqualToData:](v17, "isEqualToData:", v3);
            v19 = sub_100007B7C();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            if ((v18 & 1) != 0)
            {
              if (v21)
              {
                v32 = 0;
                v22 = "FMDRemoteUnlockPairingData: test 3 success";
                v23 = (uint8_t *)&v32;
LABEL_26:
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, v23, 2u);
              }
            }
            else if (v21)
            {
              *(_WORD *)v33 = 0;
              v22 = "FMDRemoteUnlockPairingData: decodedData failure";
              v23 = v33;
              goto LABEL_26;
            }

            goto LABEL_22;
          }
          v30 = sub_100007B7C();
          v17 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v26 = "FMDRemoteUnlockPairingData: otherData failure";
            v27 = buf;
            goto LABEL_20;
          }
LABEL_21:
          v18 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v29 = sub_100007B7C();
        v17 = objc_claimAutoreleasedReturnValue(v29);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        v35 = 0;
        v26 = "FMDRemoteUnlockPairingData: phoneNumber failure";
        v27 = (uint8_t *)&v35;
      }
      else
      {
        v28 = sub_100007B7C();
        v17 = objc_claimAutoreleasedReturnValue(v28);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        v36 = 0;
        v26 = "FMDRemoteUnlockPairingData: lostModePrivateKey failure";
        v27 = (uint8_t *)&v36;
      }
    }
    else
    {
      v25 = sub_100007B7C();
      v17 = objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v37 = 0;
      v26 = "FMDRemoteUnlockPairingData: pairingCheckToken failure";
      v27 = (uint8_t *)&v37;
    }
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v26, v27, 2u);
    goto LABEL_21;
  }
  v24 = sub_100007B7C();
  v5 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100016DF0();
  v18 = 0;
LABEL_23:

  return v18;
}

- (NSData)pairingCheckToken
{
  return self->_pairingCheckToken;
}

- (void)setPairingCheckToken:(id)a3
{
  objc_storeStrong((id *)&self->_pairingCheckToken, a3);
}

- (NSData)lostModePrivateKey
{
  return self->_lostModePrivateKey;
}

- (void)setLostModePrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_lostModePrivateKey, a3);
}

- (NSData)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSData)keysUpdated
{
  return self->_keysUpdated;
}

- (void)setKeysUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_keysUpdated, a3);
}

- (NSData)otherData
{
  return self->_otherData;
}

- (void)setOtherData:(id)a3
{
  objc_storeStrong((id *)&self->_otherData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherData, 0);
  objc_storeStrong((id *)&self->_keysUpdated, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_lostModePrivateKey, 0);
  objc_storeStrong((id *)&self->_pairingCheckToken, 0);
}

@end
