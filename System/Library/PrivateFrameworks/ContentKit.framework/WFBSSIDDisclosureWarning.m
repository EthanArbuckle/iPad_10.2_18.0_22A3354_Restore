@implementation WFBSSIDDisclosureWarning

- (id)localizedMessage
{
  void *v2;
  int v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCapability:", *MEMORY[0x24BEC1888]);

  if (v3)
    v4 = CFSTR("This shortcut is attempting to use your WLAN network address. This may be used to infer your device location.");
  else
    v4 = CFSTR("This shortcut is attempting to use your Wi-Fi network address. This may be used to infer your device location.");
  WFLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
