@implementation CDMXPCSystemEventTypeNames

+ (id)getNameStringToEnumDict
{
  if (getNameStringToEnumDict_onceToken_7677 != -1)
    dispatch_once(&getNameStringToEnumDict_onceToken_7677, &__block_literal_global_7678);
  return (id)getNameStringToEnumDict_cdmXpcSystemEventTypeNameStringToEnum;
}

void __53__CDMXPCSystemEventTypeNames_getNameStringToEnumDict__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("com.apple.siri.cdm.xpc_activity.maintenance");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  v10[0] = v0;
  v9[1] = CFSTR("com.apple.siri.cdm.xpc_activity.post_install");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 2);
  v10[1] = v1;
  v9[2] = CFSTR("com.apple.trial.NamespaceUpdate.SIRI_UNDERSTANDING_NL");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 3);
  v10[2] = v2;
  v9[3] = CFSTR("com.apple.siri.uaf.com.apple.siri.understanding");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 3);
  v10[3] = v3;
  v9[4] = CFSTR("com.apple.LaunchServices.applicationRegistered");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 4);
  v10[4] = v4;
  v9[5] = CFSTR("com.apple.LaunchServices.applicationUnregistered");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 5);
  v10[5] = v5;
  v9[6] = CFSTR("com.apple.siri.VoiceShortcuts.DataDidUpdateNotification");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 6);
  v10[6] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)getNameStringToEnumDict_cdmXpcSystemEventTypeNameStringToEnum;
  getNameStringToEnumDict_cdmXpcSystemEventTypeNameStringToEnum = v7;

}

@end
