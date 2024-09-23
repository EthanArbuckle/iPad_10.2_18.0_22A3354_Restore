@implementation DKSystemEventStreamsClass

Class __get_DKSystemEventStreamsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7A2C08;
    v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary)
    __get_DKSystemEventStreamsClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_DKSystemEventStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKSystemEventStreamsClass_block_invoke_cold_2();
  get_DKSystemEventStreamsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AFUISiriSession.m"), 66, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_DKSystemEventStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AFUISiriSession.m"), 67, CFSTR("Unable to find class %s"), "_DKSystemEventStreams");

  __break(1u);
}

@end
