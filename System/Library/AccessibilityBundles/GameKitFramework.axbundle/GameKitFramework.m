id AXGameCenterUIFrameworkLocString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AXGameCenterUIFrameworkLocString_onceToken != -1)
    dispatch_once(&AXGameCenterUIFrameworkLocString_onceToken, &__block_literal_global);
  if (AXGameCenterUIFrameworkLocString_bundle)
  {
    objc_msgSend((id)AXGameCenterUIFrameworkLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_25021A9D0, CFSTR("GameCenterUIFrameworkAccessibility"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x24BE00420]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

