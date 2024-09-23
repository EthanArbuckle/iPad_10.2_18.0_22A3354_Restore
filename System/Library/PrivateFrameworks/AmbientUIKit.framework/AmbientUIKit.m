double AMUIRedModeAnimationDuration()
{
  return 1.2;
}

uint64_t AMUIRedModeAnimationCurve()
{
  return 0;
}

id AMUIRedModeAnimationSettings()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BE0BD98];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "settingsWithDuration:timingFunction:", v1, 1.2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

