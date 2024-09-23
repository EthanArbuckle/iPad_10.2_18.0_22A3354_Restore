@implementation CDContextQueriesClass

Class __get_CDContextQueriesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E2647EE0;
    v5 = 0;
    CoreDuetContextLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreDuetContextLibraryCore_frameworkLibrary)
    __get_CDContextQueriesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_CDContextQueries");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_CDContextQueriesClass_block_invoke_cold_2();
  get_CDContextQueriesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_CDContextQueriesClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreDuetContextLibrary();
  result = objc_getClass("_CDContextQueries");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_CDContextQueriesClass_block_invoke_cold_1_0();
  get_CDContextQueriesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_CDContextQueriesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetContextLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMKnowledgeContextMapping.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_CDContextQueriesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_CDContextQueriesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMKnowledgeContextMapping.m"), 25, CFSTR("Unable to find class %s"), "_CDContextQueries");

  __break(1u);
}

void __get_CDContextQueriesClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_CDContextQueriesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMAppStreams.m"), 40, CFSTR("Unable to find class %s"), "_CDContextQueries");

  __break(1u);
}

@end
