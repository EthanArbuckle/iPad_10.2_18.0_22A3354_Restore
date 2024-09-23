@implementation ComponentUSBCController

- (BOOL)isPresent
{
  return +[DAComponentUtil IORegistryNameExists:optionalKey:](DAComponentUtil, "IORegistryNameExists:optionalKey:", CFSTR("Port-USB-C"), 0);
}

- (void)populateAttributes:(id)a3
{
  uint64_t v3;
  void *v4;
  NSString *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v3 = objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("AppleHPMDeviceHALType3"), CFSTR("UUID"), 0));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llx"), MGGetSInt64Answer(CFSTR("UniqueChipID"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = CFSTR("ecid");
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("AppleHPMDevice"), CFSTR("UUID"), 0));
    if (!v8)
      goto LABEL_5;
    v4 = (void *)v8;
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("UUID"));

      v6 = 0;
      goto LABEL_4;
    }
    v6 = v9;
    v7 = CFSTR("UUID");
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v7);
LABEL_4:

LABEL_5:
}

- (unsigned)deviceNode
{
  return self->_deviceNode;
}

- (void)setDeviceNode:(unsigned int)a3
{
  self->_deviceNode = a3;
}

- (NSString)challengeString
{
  return self->_challengeString;
}

- (void)setChallengeString:(id)a3
{
  objc_storeStrong((id *)&self->_challengeString, a3);
}

- (NSString)signatureString
{
  return self->_signatureString;
}

- (void)setSignatureString:(id)a3
{
  self->_signatureString = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challengeString, 0);
}

@end
