@implementation PSSiriNLLoggerClass

Class __get_PSSiriNLLoggerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7A3480;
    v5 = 0;
    PeopleSuggesterLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
    __get_PSSiriNLLoggerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_PSSiriNLLogger");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_PSSiriNLLoggerClass_block_invoke_cold_2();
  get_PSSiriNLLoggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_PSSiriNLLoggerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PeopleSuggesterLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AFUISiriViewController.m"), 139, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_PSSiriNLLoggerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_PSSiriNLLoggerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AFUISiriViewController.m"), 140, CFSTR("Unable to find class %s"), "_PSSiriNLLogger");

  __break(1u);
}

@end
