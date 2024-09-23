@implementation ComponentCameraFrontIR

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ComponentCameraFrontIR;
  v4 = a3;
  -[ComponentCameraBase populateAttributes:](&v8, "populateAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraFrontIR sensorSerialNumber](self, "sensorSerialNumber", v8.receiver, v8.super_class));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("sensorSerialNumber"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraFrontIR savageChipID](self, "savageChipID"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("sensorChipID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraFrontIR savageUID](self, "savageUID"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("sensorUID"));

}

- (BOOL)isPresent
{
  void *v2;
  uint64_t v3;
  BOOL result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName"));

  result = MGGetBoolAnswer(CFSTR("8S7ydMJ4DlCUF38/hI/fJA"), v3);
  if (!v2)
    return 0;
  return result;
}

- (id)serialNumberComponentPropertyKey
{
  return CFSTR("FrontIRCameraModuleSerialNumString");
}

- (int64_t)cameraModuleType
{
  return 3;
}

- (id)sensorSerialNumber
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraFrontIR savageSerialNumber](self, "savageSerialNumber"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraFrontIR yonkersSerialNumber](self, "yonkersSerialNumber"));
    v3 = v4;
    if (v4)
      v5 = v4;

  }
  if (isValidSerialNumber(v3))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)savageSerialNumber
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", objc_msgSend(v2, "UTF8String"), CFSTR("SavageSNUM"), 20, 0));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;
  if (isValidSerialNumber(v4))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)savageChipID
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", objc_msgSend(v2, "UTF8String"), CFSTR("SavageChipID"), 4, 0));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)savageUID
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", objc_msgSend(v2, "UTF8String"), CFSTR("SavageUID"), 16, 0));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)yonkersSerialNumber
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", objc_msgSend(v2, "UTF8String"), CFSTR("YonkersSNUM"), 20, 0));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;
  if (isValidSerialNumber(v4))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

@end
