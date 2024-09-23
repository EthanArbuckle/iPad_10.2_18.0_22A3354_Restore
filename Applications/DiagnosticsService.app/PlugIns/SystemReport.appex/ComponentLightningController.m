@implementation ComponentLightningController

- (BOOL)isPresent
{
  return findDeviceWithName((unsigned __int8 *)objc_msgSend(CFSTR("tristar"), "UTF8String"));
}

- (void)populateAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ComponentLightningController registryESN](self, "registryESN"));
  if (v5)
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[ComponentLightningController accessoryManagerESN](self, "accessoryManagerESN"));
    if (v8)
    {
      v6 = v8;
      v7 = 1;
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v7 = 2;
    }
  }
  v13 = (id)v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("esn"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("source"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentLightningController deviceID](self, "deviceID"));
  v11 = stringOrNull(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("deviceID"));

}

- (id)registryESN
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("tristar"), CFSTR("esn"), 0));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentLightningController reverseByteOrder:](self, "reverseByteOrder:", v3));

    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));
  }
  else
  {
    v4 = 0;
  }

  return v3;
}

- (id)accessoryManagerESN
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint8_t v7[16];
  id v8;
  id v9;

  v9 = 0;
  if (MFAAComponentAuthCreateSignature(0, 0, &v9, 0, 2) && v9)
  {
    v8 = 0;
    v3 = v9;
    -[ComponentLightningController base64EncodeData:result:](self, "base64EncodeData:result:", v3, &v8);
    v4 = v8;
  }
  else
  {
    v5 = DiagnosticLogHandleForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to get esn from MFAAComponentAuthCreateSignature()", v7, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (id)deviceID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("AppleHPMDevice"), CFSTR("Device ID"), 0));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;

  return v4;
}

- (BOOL)base64EncodeData:(id)a3 result:(id *)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "base64EncodedStringWithOptions:", 0));
  *a4 = v5;
  return v5 != 0;
}

- (id)reverseByteOrder:(id)a3
{
  id v3;
  _BYTE *v4;
  id v5;
  char *v6;
  char *v7;
  _BYTE *v8;
  void *v9;
  uint64_t v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (char *)objc_msgSend(v5, "bytes");
  if (v4)
  {
    v7 = (char *)&v11 - ((unint64_t)(v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    v8 = v4;
    do
      *v7++ = (v8--)[(_QWORD)(v6 - 1)];
    while (v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:"));

  return v9;
}

@end
