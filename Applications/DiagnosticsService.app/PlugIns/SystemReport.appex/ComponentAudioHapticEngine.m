@implementation ComponentAudioHapticEngine

- (BOOL)isPresent
{
  BOOL DeviceWithName;

  if (findDeviceWithName("audio-actuator")
    || findDeviceWithName("audio-actuator0")
    || findDeviceWithName("audio-haptic"))
  {
    return 1;
  }
  DeviceWithName = findDeviceWithName("homer");
  return DeviceWithName & findDeviceWithName("maggie-arc");
}

- (void)populateAttributes:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAudioHapticEngine arcSerialNumber](self, "arcSerialNumber"));
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("arcSerialNumber"));

}

- (id)getArcModuleClass
{
  if (+[DAComponentUtil IORegistryNameExists:optionalKey:](DAComponentUtil, "IORegistryNameExists:optionalKey:", CFSTR("AppleHapticsSupportArcEEPROM"), 0))
  {
    return CFSTR("AppleHapticsSupportArcEEPROM");
  }
  else
  {
    return CFSTR("AppleAD5860");
  }
}

- (id)getArcModuleSerialNumberKey
{
  __CFString *v2;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ComponentAudioHapticEngine getArcModuleClass](self, "getArcModuleClass"));

  if (v2 == CFSTR("AppleHapticsSupportArcEEPROM"))
    return CFSTR("ArcSerialNumber");
  else
    return CFSTR("arc-sn");
}

- (id)arcSerialNumber
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAudioHapticEngine getArcModuleClass](self, "getArcModuleClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAudioHapticEngine getArcModuleSerialNumberKey](self, "getArcModuleSerialNumberKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:](DAComponentUtil, "getIORegistryClass:property:optionalKey:", v3, v4, 0));

  if (v5)
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
  else
    v6 = 0;

  return v6;
}

@end
