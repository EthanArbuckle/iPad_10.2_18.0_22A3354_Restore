@implementation ExplicitAllowedPluginsByChangeType

void __ExplicitAllowedPluginsByChangeType_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = &unk_24C7EF1B8;
  v3[0] = &unk_24C7EF2E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ExplicitAllowedPluginsByChangeType_explicitAllowedPluginsForChangeType;
  ExplicitAllowedPluginsByChangeType_explicitAllowedPluginsForChangeType = v0;

}

@end
