@implementation ComponentStrobeFrontSLP

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

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ComponentStrobeFrontSLP;
  -[ComponentCameraBase populateAttributes:](&v8, "populateAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentStrobeFrontSLP flexDisconnected](self, "flexDisconnected")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("flexDisconnected"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentStrobeFrontSLP serialNumberMismatch](self, "serialNumberMismatch")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("serialNumberMismatch"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStrobeFrontSLP authenticityStatus](self, "authenticityStatus"));
  if (v7)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("authenticityStatus"));

}

- (id)serialNumber
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", objc_msgSend(v2, "UTF8String"), CFSTR("FrontIRStructuredLightProjectorSerialNumString"), 17, 0));

  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  return v4;
}

- (int64_t)cameraModuleType
{
  return 3;
}

- (BOOL)flexDisconnected
{
  void *v2;
  void *v3;
  BOOL v4;
  char v6;

  v6 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("romeo"), CFSTR("romeo-b2b-unplug-detected"), 0));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "getBytes:length:", &v6, 1);
    v4 = v6 != 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)serialNumberMismatch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/tmp/biokit_hw_issue_notification"));

  return v3;
}

- (id)authenticityStatus
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", objc_msgSend(v2, "UTF8String"), CFSTR("RomeoStatus"), 8, 0));

  if (v3)
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

@end
