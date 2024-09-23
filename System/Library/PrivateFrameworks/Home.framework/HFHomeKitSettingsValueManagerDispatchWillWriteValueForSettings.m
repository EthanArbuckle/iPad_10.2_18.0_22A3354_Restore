@implementation HFHomeKitSettingsValueManagerDispatchWillWriteValueForSettings

void __HFHomeKitSettingsValueManagerDispatchWillWriteValueForSettings_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "settings:willWriteValueForSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
