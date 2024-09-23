@implementation ComponentTouchID

- (BOOL)isPresent
{
  void *v3;
  BOOL valid;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTouchID serialNumber](self, "serialNumber"));
  if (findDeviceWithName("mesa") && isValidSerialNumber(v3))
  {
    valid = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTouchID mesaSensorSerialNumber](self, "mesaSensorSerialNumber"));
    valid = isValidSerialNumber(v5);

  }
  return valid;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTouchID serialNumber](self, "serialNumber"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTouchID mesaSensorProvisioningState](self, "mesaSensorProvisioningState"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("mesaSensorProvisioningState"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentTouchID mesaSensorSerialNumber](self, "mesaSensorSerialNumber"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("mesaSensorSerialNumber"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ComponentTouchID mesaModuleSerialNumber](self, "mesaModuleSerialNumber"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("mesaModuleSerialNumber"));

}

- (id)serialNumber
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("MesaSerialNumber"), 0);
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)mesaSensorProvisioningState
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v6[12];
  unsigned int v7;

  v7 = 0;
  if (sub_10000379C((int *)&v7))
  {
    v2 = DiagnosticsKitLogHandleForCategory(2);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unable to get current mesa provisioning state", v6, 2u);
    }

    v4 = 0;
    v7 = 0;
  }
  else
  {
    v4 = v7;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
}

- (id)mesaSensorSerialNumber
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  char v13[128];

  v10 = 128;
  if (sub_100003E48(v13, &v10))
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v13, v10));
    v4 = byteString(v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v5 = DiagnosticsKitLogHandleForCategory(2);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Mesa sensor serial number: %@", buf, 0xCu);
    }

  }
  v7 = stringOrNull(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)mesaModuleSerialNumber
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  char v12[128];

  v9 = 128;
  if (sub_100003ABC(v12, &v9))
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, v9));
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
    v4 = DiagnosticsKitLogHandleForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Mesa Module serial number: %@", buf, 0xCu);
    }

  }
  v6 = stringOrNull(v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

@end
