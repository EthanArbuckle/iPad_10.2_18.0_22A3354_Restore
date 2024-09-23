@implementation ComponentCameraBase

- (void)populateAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase serialNumber](self, "serialNumber"));
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, CFSTR("serialNumber"));

  -[ComponentCameraBase populateFdrValidationStatus:](self, "populateFdrValidationStatus:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase illuminatorSerialNumber](self, "illuminatorSerialNumber"));
  v8 = stringOrNull(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("illuminatorSerialNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase zhuGeFDRStatus:](self, "zhuGeFDRStatus:", v9));
    if (objc_msgSend(v12, "count") == (id)2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("illuminatorFdrValidationStatus"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("zhuGeIlluminatorValidationStatus"));

    }
  }

}

- (id)IORegClassName
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  const __CFDictionary *v7;
  io_service_t MatchingService;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(&off_1000B25A8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(&off_1000B25A8);
        v6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v5));
        v7 = IOServiceMatching((const char *)objc_msgSend(v6, "UTF8String"));
        MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
        if (MatchingService)
        {
          IOObjectRelease(MatchingService);
          v2 = v6;
          return v2;
        }
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v2 = objc_msgSend(&off_1000B25A8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v3 = v2;
      if (v2)
        continue;
      break;
    }
  }
  return v2;
}

- (BOOL)isPresent
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase serialNumber](self, "serialNumber"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)retrieveSerialNumberWithComponentName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName"));
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), v4, 17, 0));
    if (v8)
      v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
    else
      v7 = 0;

  }
  if (isValidSerialNumber(v7))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (id)retrieveDataSerialNumberWithComponentName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  unsigned __int8 *v10;
  unint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v6 = v4;
  if (v6)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", objc_msgSend(v7, "UTF8String"), v6, 11, 0));

    if (v8)
    {
      v9 = objc_retainAutorelease(v8);
      v10 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
      if (objc_msgSend(v9, "length"))
      {
        v11 = 0;
        do
          objc_msgSend(v5, "appendFormat:", CFSTR("%02X"), v10[v11++]);
        while ((unint64_t)objc_msgSend(v9, "length") > v11);
      }
    }

  }
  if (isValidSerialNumber(v5))
    v12 = v5;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)serialNumber
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase serialNumberComponentPropertyKey](self, "serialNumberComponentPropertyKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase retrieveSerialNumberWithComponentName:](self, "retrieveSerialNumberWithComponentName:", v3));

  return v4;
}

- (id)serialNumberComponentPropertyKey
{
  return 0;
}

- (id)illuminatorSerialNumber
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase illuminatorSerialNumberComponentPropertyKey](self, "illuminatorSerialNumberComponentPropertyKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase retrieveDataSerialNumberWithComponentName:](self, "retrieveDataSerialNumberWithComponentName:", v3));

  return v4;
}

- (id)illuminatorSerialNumberComponentPropertyKey
{
  return 0;
}

- (int64_t)cameraModuleType
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Camera component does not define camera module type! This is used to determine source of FDR validation status.", v5, 2u);
  }

  return 0;
}

- (void)populateFdrValidationStatus:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  int v15;
  int64_t v16;

  v4 = a3;
  v5 = -[ComponentCameraBase cameraModuleType](self, "cameraModuleType");
  if (v5 == 3)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[ComponentCameraBase biometricKitFdrValidationStatus](self, "biometricKitFdrValidationStatus"));
    goto LABEL_5;
  }
  v6 = v5;
  if (v5 == 1)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[ComponentCameraBase ioRegFdrValidationStatus](self, "ioRegFdrValidationStatus"));
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_9;
  }
  v9 = DiagnosticLogHandleForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Camera with module type %ld does not support FDR validation", (uint8_t *)&v15, 0xCu);
  }

  v8 = 0;
LABEL_9:
  v11 = stringOrNull(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (objc_msgSend(v12, "isEqual:", v13))
    {

    }
    else
    {
      v14 = objc_msgSend(v12, "isEqualToString:", &stru_10009EB48);

      if ((v14 & 1) == 0)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("fdrValidationStatus"));
    }
  }

}

- (id)ioRegFdrValidationStatus
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", v2, CFSTR("CmClValidationStatus"), 0, 0));
    if (v3)
      v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
    else
      v4 = 0;
    v6 = stringOrNull(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)biometricKitFdrValidationStatus
{
  void *v2;
  unsigned int v3;
  __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/tmp/biokit_hw_issue_notification"));

  if (v3)
    v4 = CFSTR("Fail");
  else
    v4 = CFSTR("Pass");
  return v4;
}

- (id)zhuGeFDRStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  __objc2_meth_list **p_opt_class_meths;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  ComponentCameraBase *v22;
  unint64_t v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[5];

  v4 = a3;
  if (qword_1000BA058 != -1)
    dispatch_once(&qword_1000BA058, &stru_100080AA0);
  v26[0] = CFSTR("FailureData");
  v26[1] = CFSTR("FailureProperties");
  v26[2] = CFSTR("DataFailedtoReport");
  v26[3] = CFSTR("VerifiedData");
  v26[4] = CFSTR("VerifiedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 5));
  v6 = v5;
  if (v4 && objc_msgSend(v5, "count"))
  {
    v22 = self;
    v7 = 0;
    v8 = 0;
    p_opt_class_meths = &OBJC_PROTOCOL___DKReporter.opt_class_meths;
    v24 = v6;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_meth_list objectForKey:](p_opt_class_meths[10], "objectForKey:", v10));
      if (v11)
      {
        v23 = v8;
        v12 = 0;
        while ((unint64_t)objc_msgSend(v11, "count") > v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allValues"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("LiveInstance")));
          v17 = objc_msgSend(v16, "containsString:", v4);
          if (v17)
          {
            v18 = v10;

            v7 = v18;
          }

          ++v12;
          if (v17)
          {

            v6 = v24;
            goto LABEL_17;
          }
        }
        v8 = v23;
        v6 = v24;
        p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___DKReporter + 48);
      }

      ++v8;
    }
    while ((unint64_t)objc_msgSend(v6, "count") > v8);
LABEL_17:
    if (v7)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase zhuGeFDRLabelForCategory:](v22, "zhuGeFDRLabelForCategory:", v7));
      v25[0] = v20;
      v25[1] = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));

    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    v7 = 0;
  }

  return v19;
}

- (id)zhuGeFDRLabelForCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;
  _QWORD v10[2];

  if (!a3)
    return 0;
  v10[0] = CFSTR("VerifiedData");
  v10[1] = CFSTR("VerifiedProperties");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  v6 = objc_msgSend(v5, "containsObject:", v3);

  v7 = CFSTR("Fail");
  if (v6)
    v7 = CFSTR("Pass");
  v8 = v7;

  return v8;
}

@end
