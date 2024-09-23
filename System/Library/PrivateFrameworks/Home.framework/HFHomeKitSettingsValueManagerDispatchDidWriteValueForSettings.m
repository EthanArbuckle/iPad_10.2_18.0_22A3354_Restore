@implementation HFHomeKitSettingsValueManagerDispatchDidWriteValueForSettings

void __HFHomeKitSettingsValueManagerDispatchDidWriteValueForSettings_block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "settings:didWriteValueForSettings:failedSettings:homeKitObjectIdentifiers:", a1[4], a1[5], a1[6], a1[7]);

}

@end
