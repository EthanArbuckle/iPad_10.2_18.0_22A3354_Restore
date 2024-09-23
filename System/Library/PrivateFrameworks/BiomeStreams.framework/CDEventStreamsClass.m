@implementation CDEventStreamsClass

Class __get_CDEventStreamsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary_3)
  {
    v4 = xmmword_1E2648848;
    v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary_3)
    __get_CDEventStreamsClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_CDEventStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_CDEventStreamsClass_block_invoke_cold_2();
  get_CDEventStreamsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_CDEventStreamsClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary_9)
  {
    v4 = xmmword_1E2649588;
    v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary_9 = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary_9)
    __get_CDEventStreamsClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("_CDEventStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_CDEventStreamsClass_block_invoke_cold_2_0();
  get_CDEventStreamsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_CDEventStreamsClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMDKEventStream.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_CDEventStreamsClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_CDEventStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDKEventStream.m"), 19, CFSTR("Unable to find class %s"), "_CDEventStreams");

  __break(1u);
}

void __get_CDEventStreamsClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMDaemon+Pruning.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_CDEventStreamsClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_CDEventStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMDaemon+Pruning.m"), 32, CFSTR("Unable to find class %s"), "_CDEventStreams");

  __break(1u);
}

@end
