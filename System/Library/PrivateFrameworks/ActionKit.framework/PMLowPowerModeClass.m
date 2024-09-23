@implementation PMLowPowerModeClass

void __get_PMLowPowerModeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  LowPowerModeLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_PMLowPowerMode");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_PMLowPowerModeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_PMLowPowerModeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFLowPowerModeSettingsClient.m"), 25, CFSTR("Unable to find class %s"), "_PMLowPowerMode");

    __break(1u);
  }
}

@end
