@implementation FMDMagSafeRawInfo

- (FMDMagSafeRawInfo)initWithConnectionInfo:(id)a3
{
  id v4;
  FMDMagSafeRawInfo *v5;
  FMDMagSafeRawInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDMagSafeRawInfo;
  v5 = -[FMDMagSafeRawInfo init](&v8, "init");
  v6 = v5;
  if (v5)
    -[FMDMagSafeRawInfo setConnectionInfo:](v5, "setConnectionInfo:", v4);

  return v6;
}

- (BOOL)isMF4i
{
  return -[FMDMagSafeRawInfo protocol](self, "protocol") == 14;
}

- (BOOL)authPassed
{
  void *v3;
  unsigned __int8 v4;

  if (-[FMDMagSafeRawInfo protocol](self, "protocol") != 14
    || !-[FMDMagSafeRawInfo infoAvailable](self, "infoAvailable"))
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo authStatus](self, "authStatus"));
  v4 = objc_msgSend(v3, "isEqualToNumber:", &off_100039840);

  return v4;
}

- (void)updateWithAccessoryInfo:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  int v21;
  id v22;

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updateWithAccessoryInfo with %@", (uint8_t *)&v21, 0xCu);
  }

  v7 = kACCInfo_SerialNumber;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kACCInfo_SerialNumber));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));
    v11 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    if ((isKindOfClass & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));
      -[FMDMagSafeRawInfo setSerialNumber:](self, "setSerialNumber:", v13);

    }
  }
  -[FMDMagSafeRawInfo setFirmwareVersion:](self, "setFirmwareVersion:", CFSTR("1.1.1"));
  v14 = kACCInfo_AccessoryDeviceUID;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kACCInfo_AccessoryDeviceUID));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
    v18 = objc_opt_class(NSString);
    v19 = objc_opt_isKindOfClass(v17, v18);

    if ((v19 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
      -[FMDMagSafeRawInfo setCoreAccessoryUID:](self, "setCoreAccessoryUID:", v20);

    }
  }

}

- (void)updateWithProperties:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  char v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  const __CFBoolean *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  unsigned int v56;
  id v57;
  NSObject *v58;
  int v59;
  id v60;
  __int16 v61;
  void *v62;

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v59 = 138412290;
    v60 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updateWithProperties with %@", (uint8_t *)&v59, 0xCu);
  }

  v7 = kACCProperties_Endpoint_NFC_Type;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kACCProperties_Endpoint_NFC_Type));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));
    v11 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    if ((isKindOfClass & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
      -[FMDMagSafeRawInfo setAccessoryType:](self, "setAccessoryType:", v14);

    }
  }
  v15 = kACCProperties_Endpoint_NFC_WashIndex;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kACCProperties_Endpoint_NFC_WashIndex));
  if (v16)
  {
    v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v15));
    v19 = objc_opt_class(NSNumber);
    v20 = objc_opt_isKindOfClass(v18, v19);

    if ((v20 & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v15));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringValue"));
      -[FMDMagSafeRawInfo setStyle:](self, "setStyle:", v22);

      v23 = sub_100005190();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo style](self, "style"));
        v59 = 138412290;
        v60 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#colorTesting color of wallet = %@", (uint8_t *)&v59, 0xCu);

      }
    }
  }
  v26 = kACCExternalAccessoryAuthStatusKey;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kACCExternalAccessoryAuthStatusKey));
  if (v27)
  {
    v28 = (void *)v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v26));
    v30 = objc_opt_class(NSNumber);
    v31 = objc_opt_isKindOfClass(v29, v30);

    if ((v31 & 1) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v26));
      -[FMDMagSafeRawInfo setAuthStatus:](self, "setAuthStatus:", v32);

    }
  }
  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFC_InfoAvailable")));
  if (v33
    && (v34 = (void *)v33,
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFC_InfoAvailable"))),
        v36 = objc_opt_class(NSNumber),
        v37 = objc_opt_isKindOfClass(v35, v36),
        v35,
        v34,
        (v37 & 1) != 0))
  {
    v38 = sub_100005190();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFC_InfoAvailable")));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFC_InfoAvailable")));
      v42 = (void *)objc_opt_class(v41);
      v59 = 138412546;
      v60 = v40;
      v61 = 2112;
      v62 = v42;
      v43 = v42;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "FMDMagSafeRawInfo: get NFC_InfoAvailable  = %@ %@", (uint8_t *)&v59, 0x16u);

    }
    v44 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFC_InfoAvailable")));
    -[FMDMagSafeRawInfo setInfoAvailable:](self, "setInfoAvailable:", CFBooleanGetValue(v44) != 0);

  }
  else
  {
    v45 = sub_100005190();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFC_InfoAvailable")));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFC_InfoAvailable")));
      v49 = (void *)objc_opt_class(v48);
      v59 = 138412546;
      v60 = v47;
      v61 = 2112;
      v62 = v49;
      v50 = v49;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "FMDMagSafeRawInfo: get NFC_InfoAvailable unexpected  = %@ %@", (uint8_t *)&v59, 0x16u);

    }
    -[FMDMagSafeRawInfo setInfoAvailable:](self, "setInfoAvailable:", 0);
  }
  v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACCMFi4PairingStatus")));
  if (v51
    && (v52 = (void *)v51,
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACCMFi4PairingStatus"))),
        v54 = objc_opt_respondsToSelector(v53, "integerValue"),
        v53,
        v52,
        (v54 & 1) != 0))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACCMFi4PairingStatus")));
    v56 = objc_msgSend(v55, "integerValue");

    -[FMDMagSafeRawInfo setIsNVMSetup:](self, "setIsNVMSetup:", (v56 & 0xFFFFFFFE) == 2);
    -[FMDMagSafeRawInfo setKeysAvailable:](self, "setKeysAvailable:", v56 == 2);
  }
  else
  {
    v57 = sub_100005190();
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v59) = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "did not get ACCMFi4PairingStatus", (uint8_t *)&v59, 2u);
    }

  }
}

- (BOOL)hasEnoughInformation
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo serialNumber](self, "serialNumber"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo accessoryType](self, "accessoryType"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMDMagSafeRawInfo(0x%lx) \name - %@, serialNumber - %@, accessoryType - %@, color - %@, nvm - %d, keysAvailable - %d"), self, self->_name, self->_serialNumber, self->_accessoryType, self->_style, self->_isNVMSetup, self->_keysAvailable);
}

- (NSString)name
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  intptr_t v11;
  id v12;
  NSObject *name;
  uint64_t v14;
  NSString *v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  intptr_t v27;
  __int16 v28;
  uint64_t v29;

  if (!self->_name && -[FMDMagSafeRawInfo authPassed](self, "authPassed"))
  {
    v3 = dispatch_group_create();
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
    if (-[FMDMagSafeRawInfo enableCAAPI:](self, "enableCAAPI:", CFSTR("enableGetAccessoryUserName")))
    {
      dispatch_group_enter(v3);
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = sub_100012708;
      v24 = sub_100012718;
      v25 = 0;
      v5 = sub_100005190();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA calling getAccessoryUserName", buf, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100012720;
      v17[3] = &unk_100034D60;
      v19 = &v20;
      v8 = v3;
      v18 = v8;
      objc_msgSend(v7, "getAccessoryUserName:withReply:", v4, v17);

      v9 = dispatch_time(0, 5000000000);
      v10 = dispatch_group_wait(v8, v9);
      if (v10)
      {
        v11 = v10;
        v12 = sub_100005190();
        name = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(name, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v21[5];
          *(_DWORD *)buf = 134218242;
          v27 = v11;
          v28 = 2112;
          v29 = v14;
          _os_log_impl((void *)&_mh_execute_header, name, OS_LOG_TYPE_DEFAULT, "#CA timeout while trying to getAccessoryUserName error %ld result = %@", buf, 0x16u);
        }
      }
      else
      {
        v15 = (NSString *)(id)v21[5];
        name = self->_name;
        self->_name = v15;
      }

      _Block_object_dispose(&v20, 8);
    }

  }
  return self->_name;
}

- (void)getPairingStatus
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;
  NSObject *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, int, void *);
  void *v22;
  NSObject *v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  int v28;
  uint8_t v29[4];
  _BYTE v30[18];

  v3 = dispatch_group_create();
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
  if (-[FMDMagSafeRawInfo enableCAAPI:](self, "enableCAAPI:", CFSTR("enableGetPairingStatus"))
    && -[FMDMagSafeRawInfo authPassed](self, "authPassed"))
  {
    dispatch_group_enter(v3);
    v6 = sub_100005190();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CA calling getPairingStatus", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x2020000000;
    v28 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_100012B24;
    v22 = &unk_100034D88;
    v24 = buf;
    v9 = v3;
    v23 = v9;
    objc_msgSend(v8, "getPairingStatus:withReply:", v5, &v19);

    v10 = dispatch_time(0, 5000000000);
    v11 = dispatch_group_wait(v9, v10);
    v12 = *((int *)v26 + 6);
    if (v12 >= 4)
      v13 = CFSTR("no value");
    else
      v13 = *(&off_100034EE8 + v12);
    v14 = sub_100005190();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *((_DWORD *)v26 + 6);
      *(_DWORD *)v29 = 67109378;
      *(_DWORD *)v30 = v16;
      *(_WORD *)&v30[4] = 2112;
      *(_QWORD *)&v30[6] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#CA pairningstatus = %d %@", v29, 0x12u);
    }

    if (v11)
    {
      v17 = sub_100005190();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v29 = 134218242;
        *(_QWORD *)v30 = v11;
        *(_WORD *)&v30[8] = 2112;
        *(_QWORD *)&v30[10] = v4;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#CA timeout while trying to getPairingStatus error %ld result = %@", v29, 0x16u);
      }

    }
    else
    {
      -[FMDMagSafeRawInfo setIsNVMSetup:](self, "setIsNVMSetup:", (*((_DWORD *)v26 + 6) & 0xFFFFFFFE) == 2, v19, v20, v21, v22);
      -[FMDMagSafeRawInfo setKeysAvailable:](self, "setKeysAvailable:", *((_DWORD *)v26 + 6) == 2);
    }

    _Block_object_dispose(buf, 8);
  }

}

- (void)setPairingData:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  char *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  _QWORD v34[4];
  _QWORD v35[4];

  v6 = a3;
  v7 = a4;
  v8 = sub_100005190();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setting pairing Data", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
  v11 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0;
  v13 = 4;
  do
  {
    if ((unint64_t)((_BYTE *)objc_msgSend(v10, "length") - v12) < 0xF0)
    {
      if (objc_msgSend(v10, "length") == v12)
      {
        v15 = objc_alloc_init((Class)NSData);
        objc_msgSend(v11, "addObject:", v15);

      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subdataWithRange:", v12, (_BYTE *)objc_msgSend(v10, "length") - v12));
        objc_msgSend(v11, "addObject:", v16);

        v12 = (char *)objc_msgSend(v10, "length");
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subdataWithRange:", v12, 240));
      objc_msgSend(v11, "addObject:", v14);

      v12 += 240;
    }
    --v13;
  }
  while (v13);
  v34[0] = &off_100039858;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
  v35[0] = v17;
  v34[1] = &off_100039870;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 1));
  v35[1] = v18;
  v34[2] = &off_100039888;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 2));
  v35[2] = v19;
  v34[3] = &off_1000398A0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 3));
  v35[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 4));

  v22 = sub_100005190();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#CA calling setPublicNVMKeyValues with %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100012FD8;
  v28[3] = &unk_100034DB0;
  objc_copyWeak(&v31, (id *)buf);
  v26 = v6;
  v29 = v26;
  v27 = v7;
  v30 = v27;
  objc_msgSend(v24, "setPublicNVMKeyValues:forEndpoint:withReply:", v21, v25, v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

}

- (void)getPairingDataWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _UNKNOWN **v13;
  FMDMagSafeRawInfo *v14;
  void (**v15)(id, void *, _QWORD);
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  _UNKNOWN **v19;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo pairingData](self, "pairingData"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo pairingData](self, "pairingData"));
    v4[2](v4, v6, 0);

  }
  else
  {
    v7 = sub_100005190();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = &off_100039918;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA calling getPublicNVMKeyValues %@ %@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013264;
    v12[3] = &unk_100034DD8;
    v13 = &off_100039918;
    v14 = self;
    v15 = v4;
    objc_msgSend(v10, "getPublicNVMKeyValues:forEndpoint:withReply:", &off_100039918, v11, v12);

  }
}

- (void)setName:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id buf[2];

  v6 = a3;
  v7 = a4;
  v8 = sub_100005190();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setting accessory name", (uint8_t *)buf, 2u);
  }

  if (-[FMDMagSafeRawInfo enableCAAPI:](self, "enableCAAPI:", CFSTR("enableSetAccessoryUserName")))
  {
    v10 = sub_100005190();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#CA calling setAccessoryUserName", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    global_queue = dispatch_get_global_queue(2, 0);
    v13 = objc_claimAutoreleasedReturnValue(global_queue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001369C;
    v14[3] = &unk_100034E00;
    v14[4] = self;
    v15 = v6;
    objc_copyWeak(&v17, buf);
    v16 = v7;
    dispatch_async(v13, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
  }
  else
  {
    -[FMDMagSafeRawInfo setName:](self, "setName:", v6);
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)setupKeysWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  _QWORD block[5];
  void (**v15)(id, void *);
  id v16;
  uint8_t v17[16];
  id buf[2];

  v4 = (void (**)(id, void *))a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "provisioning keys for accessory", (uint8_t *)buf, 2u);
  }

  if (-[FMDMagSafeRawInfo isNVMSetup](self, "isNVMSetup"))
  {
    v7 = sub_100005190();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001F858(v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
    v4[2](v4, v9);

  }
  else
  {
    objc_initWeak(buf, self);
    if (-[FMDMagSafeRawInfo enableCAAPI:](self, "enableCAAPI:", CFSTR("enableProvisionAccessoryForFindMy")))
    {
      v10 = sub_100005190();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#CA calling provisionAccessoryForFindMy", v17, 2u);
      }

      global_queue = dispatch_get_global_queue(2, 0);
      v13 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013A84;
      block[3] = &unk_100034E50;
      block[4] = self;
      objc_copyWeak(&v16, buf);
      v15 = v4;
      dispatch_async(v13, block);

      objc_destroyWeak(&v16);
    }
    else
    {
      -[FMDMagSafeRawInfo setIsNVMSetup:](self, "setIsNVMSetup:", 1);
      -[FMDMagSafeRawInfo setKeysAvailable:](self, "setKeysAvailable:", 1);
      v4[2](v4, 0);
    }
    objc_destroyWeak(buf);
  }

}

- (void)removeKeysWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t v15[16];
  id buf[2];

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "### removing keys for accessory", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  if (-[FMDMagSafeRawInfo enableCAAPI:](self, "enableCAAPI:", CFSTR("enableResetPairingInformation")))
  {
    v7 = sub_100005190();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "### #CA calling resetPairingInformation", v15, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013E30;
    v12[3] = &unk_100034E28;
    objc_copyWeak(&v14, buf);
    v13 = v4;
    objc_msgSend(v9, "resetPairingInformation:withReply:", v10, v12);

    objc_destroyWeak(&v14);
  }
  else
  {
    -[FMDMagSafeRawInfo setIsNVMSetup:](self, "setIsNVMSetup:", 0);
    -[FMDMagSafeRawInfo setKeysAvailable:](self, "setKeysAvailable:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
    (*((void (**)(id, void *))v4 + 2))(v4, v11);

  }
  objc_destroyWeak(buf);

}

- (void)getAuthNonceWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA calling beginVendorKeyErase", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014014;
  v10[3] = &unk_100034E78;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "beginVendorKeyErase:withReply:", v8, v10);

}

- (void)vendorKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[16];

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = sub_100005190();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#CA calling continueVendorKeyErase", buf, 2u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014234;
  v21[3] = &unk_100034EA0;
  v21[4] = self;
  v22 = v12;
  v20 = v12;
  objc_msgSend(v19, "continueVendorKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:", v16, v15, v14, v13, v21);

}

- (void)copyUserPrivateKeyWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA calling copyUserPrivateKey", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014408;
  v10[3] = &unk_100034E78;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "copyUserPrivateKey:withReply:", v8, v10);

}

- (void)beginUserKeyEraseWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA calling beginUserKeyErase", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000145E0;
  v10[3] = &unk_100034E78;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "beginUserKeyErase:withReply:", v8, v10);

}

- (void)continueUserKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[16];

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = sub_100005190();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#CA calling continueUserKeyErase", buf, 2u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014800;
  v21[3] = &unk_100034EA0;
  v21[4] = self;
  v22 = v12;
  v20 = v12;
  objc_msgSend(v19, "continueUserKeyErase:withSignature:andAccessoryNonce:forEndpoint:withReply:", v16, v15, v14, v13, v21);

}

- (void)cancelUserKeyEraseWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA calling cancelUserKeyErase", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000149D4;
  v10[3] = &unk_100034EC8;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "cancelUserKeyErase:withReply:", v8, v10);

}

- (void)cancelVendorKeyEraseWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA calling cancelVendorKeyErase", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo connectionInfo](self, "connectionInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo endPointUUID](self, "endPointUUID"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014B90;
  v10[3] = &unk_100034EC8;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v7, "cancelVendorKeyErase:withReply:", v8, v10);

}

- (BOOL)enableCAAPI:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDMagSafeRawInfo accessoryType](self, "accessoryType"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessoryType"));

}

- (FMDMagSafeRawInfo)initWithCoder:(id)a3
{
  id v4;
  FMDMagSafeRawInfo *v5;
  id v6;
  uint64_t v7;
  NSString *accessoryType;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDMagSafeRawInfo;
  v5 = -[FMDMagSafeRawInfo init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("accessoryType"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    accessoryType = v5->_accessoryType;
    v5->_accessoryType = (NSString *)v7;

  }
  return v5;
}

- (NSString)coreAccessoryUID
{
  return self->_coreAccessoryUID;
}

- (void)setCoreAccessoryUID:(id)a3
{
  objc_storeStrong((id *)&self->_coreAccessoryUID, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareVersion, a3);
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryType, a3);
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionUUID, a3);
}

- (NSString)endPointUUID
{
  return self->_endPointUUID;
}

- (void)setEndPointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endPointUUID, a3);
}

- (NSNumber)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(id)a3
{
  objc_storeStrong((id *)&self->_authStatus, a3);
}

- (BOOL)infoAvailable
{
  return self->_infoAvailable;
}

- (void)setInfoAvailable:(BOOL)a3
{
  self->_infoAvailable = a3;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (BOOL)isNVMSetup
{
  return self->_isNVMSetup;
}

- (void)setIsNVMSetup:(BOOL)a3
{
  self->_isNVMSetup = a3;
}

- (BOOL)keysAvailable
{
  return self->_keysAvailable;
}

- (void)setKeysAvailable:(BOOL)a3
{
  self->_keysAvailable = a3;
}

- (int)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(int)a3
{
  self->_protocol = a3;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (FMDACCConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInfo, a3);
}

- (FMDRemoteUnlockPairingData)pairingData
{
  return self->_pairingData;
}

- (void)setPairingData:(id)a3
{
  objc_storeStrong((id *)&self->_pairingData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingData, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_authStatus, 0);
  objc_storeStrong((id *)&self->_endPointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_coreAccessoryUID, 0);
}

@end
