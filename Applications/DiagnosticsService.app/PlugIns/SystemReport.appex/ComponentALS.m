@implementation ComponentALS

- (BOOL)isPresent
{
  return +[DAComponentUtil IORegistryNameExists:optionalKey:](DAComponentUtil, "IORegistryNameExists:optionalKey:", CFSTR("als"), 0)|| findDeviceWithName("als")|| findDeviceWithName("als-i2c3");
}

- (void)populateAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentALS serialNumber](self, "serialNumber"));
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("serialNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentALS sensorSerialNumber](self, "sensorSerialNumber"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentALS sensorSerialNumber](self, "sensorSerialNumber"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("sensorSerialNumber"));

  }
}

- (id)serialNumber
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("product"), CFSTR("ambient-light-sensor-serial-num"), 0));
  if (v2)
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;

  return v3;
}

- (id)sensorSerialNumber
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("product"), CFSTR("rosaline-serial-num"), 0));
  if (v2)
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;

  return v3;
}

@end
