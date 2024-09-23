@implementation DKSystemEventStreamsClass

Class __get_DKSystemEventStreamsClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreDuetLibrary();
  result = objc_getClass("_DKSystemEventStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKSystemEventStreamsClass_block_invoke_cold_1();
  get_DKSystemEventStreamsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKSystemEventStreamsClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreDuetLibrary_0();
  result = objc_getClass("_DKSystemEventStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKSystemEventStreamsClass_block_invoke_cold_1_0();
  get_DKSystemEventStreamsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKSystemEventStreamsClass_block_invoke_1(uint64_t a1)
{
  Class result;

  CoreDuetLibrary_2();
  result = objc_getClass("_DKSystemEventStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKSystemEventStreamsClass_block_invoke_cold_1_1();
  get_DKSystemEventStreamsClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKSystemEventStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMKnowledgeContextMapping.m"), 17, CFSTR("Unable to find class %s"), "_DKSystemEventStreams");

  __break(1u);
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKSystemEventStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMAppStreams.m"), 37, CFSTR("Unable to find class %s"), "_DKSystemEventStreams");

  __break(1u);
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_1_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKSystemEventStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMTipsStreams.m"), 29, CFSTR("Unable to find class %s"), "_DKSystemEventStreams");

  __break(1u);
}

@end
