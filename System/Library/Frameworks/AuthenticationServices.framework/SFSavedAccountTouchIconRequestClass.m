@implementation SFSavedAccountTouchIconRequestClass

Class __get_SFSavedAccountTouchIconRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  MobileSafariLibrary();
  result = objc_getClass("_SFSavedAccountTouchIconRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_SFSavedAccountTouchIconRequestClass_block_invoke_cold_1();
  get_SFSavedAccountTouchIconRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SFSavedAccountTouchIconRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_SFSavedAccountTouchIconRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASPasswordManagerIconController_iOS.m"), 40, CFSTR("Unable to find class %s"), "_SFSavedAccountTouchIconRequest");

  __break(1u);
}

@end
