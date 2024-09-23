@implementation SAGuidanceCheckForGuideUpdates(AssistantUIAdditions)

+ (id)afui_guideCheckSupportedFeatures
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (MGGetBoolAnswer())
    objc_msgSend(v0, "addObject:", *MEMORY[0x24BE81B60]);
  if (MGGetBoolAnswer())
    objc_msgSend(v0, "addObject:", *MEMORY[0x24BE81B68]);
  if (MGGetBoolAnswer())
    objc_msgSend(v0, "addObject:", *MEMORY[0x24BE81B70]);
  if (MGGetBoolAnswer())
    objc_msgSend(v0, "addObject:", *MEMORY[0x24BE81B78]);
  if (ShouldShowWeibo())
    objc_msgSend(v0, "addObject:", *MEMORY[0x24BE81B80]);
  return v0;
}

@end
