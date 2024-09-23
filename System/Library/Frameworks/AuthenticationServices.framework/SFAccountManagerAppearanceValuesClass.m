@implementation SFAccountManagerAppearanceValuesClass

Class __get_SFAccountManagerAppearanceValuesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C94F900;
    v5 = 0;
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SafariServicesLibraryCore_frameworkLibrary)
    __get_SFAccountManagerAppearanceValuesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_SFAccountManagerAppearanceValues");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_SFAccountManagerAppearanceValuesClass_block_invoke_cold_2();
  get_SFAccountManagerAppearanceValuesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SFAccountManagerAppearanceValuesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SafariServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_ASPasswordManagerIconController_iOS.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_SFAccountManagerAppearanceValuesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_SFAccountManagerAppearanceValuesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASPasswordManagerIconController_iOS.m"), 34, CFSTR("Unable to find class %s"), "_SFAccountManagerAppearanceValues");

  __break(1u);
}

@end
