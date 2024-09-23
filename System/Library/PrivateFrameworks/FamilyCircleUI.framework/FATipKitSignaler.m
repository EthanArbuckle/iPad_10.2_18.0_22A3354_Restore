@implementation FATipKitSignaler

+ (void)sendSignalForFamilyChecklistTapped
{
  +[FATipKitSignaler _sendSignalForEventIdentifier:context:](FATipKitSignaler, "_sendSignalForEventIdentifier:context:", CFSTR("com.apple.family.checklist-tapped"), 0);
}

+ (void)_sendSignalForEventIdentifier:(id)a3 context:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x24BE0CB70];
  v6 = a4;
  v7 = a3;
  v10 = (id)objc_msgSend([v5 alloc], "initWithIdentifier:bundleID:context:userInfo:", v7, CFSTR("com.apple.Preferences"), v6, 0);

  objc_msgSend(MEMORY[0x24BE0CDB0], "discoverabilitySignal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEvent:", v10);

}

@end
