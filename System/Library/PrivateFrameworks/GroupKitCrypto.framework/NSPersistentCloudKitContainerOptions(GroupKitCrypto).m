@implementation NSPersistentCloudKitContainerOptions(GroupKitCrypto)

+ (id)gpkCrypto_optionsWithContainerIdentifier:()GroupKitCrypto apnsServiceName:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setUseZoneWidePCS:", 1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB608]), "initWithContainerIdentifier:", v6);

  objc_msgSend(v8, "setUseDeviceToDeviceEncryption:", 1);
  objc_msgSend(v8, "setAutomaticallyScheduleImportAndExportOperations:", 1);
  objc_msgSend(v8, "setContainerOptions:", v7);
  objc_msgSend(v8, "setApsConnectionMachServiceName:", v5);

  v9 = v8;
  return v9;
}

@end
