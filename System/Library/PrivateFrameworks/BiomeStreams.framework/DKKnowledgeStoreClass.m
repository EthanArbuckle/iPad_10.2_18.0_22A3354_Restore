@implementation DKKnowledgeStoreClass

Class __get_DKKnowledgeStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreDuetLibrary_0();
  result = objc_getClass("_DKKnowledgeStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKKnowledgeStoreClass_block_invoke_cold_1();
  get_DKKnowledgeStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKKnowledgeStoreClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreDuetLibrary_2();
  result = objc_getClass("_DKKnowledgeStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKKnowledgeStoreClass_block_invoke_cold_1_0();
  get_DKKnowledgeStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKKnowledgeStoreClass_block_invoke_1(uint64_t a1)
{
  Class result;

  CoreDuetLibrary_3();
  result = objc_getClass("_DKKnowledgeStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKKnowledgeStoreClass_block_invoke_cold_1_1();
  get_DKKnowledgeStoreClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKKnowledgeStoreClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKKnowledgeStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMAppStreams.m"), 32, CFSTR("Unable to find class %s"), "_DKKnowledgeStore");

  __break(1u);
}

void __get_DKKnowledgeStoreClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKKnowledgeStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMTipsStreams.m"), 25, CFSTR("Unable to find class %s"), "_DKKnowledgeStore");

  __break(1u);
}

void __get_DKKnowledgeStoreClass_block_invoke_cold_1_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKKnowledgeStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMCoreDuetStream.m"), 23, CFSTR("Unable to find class %s"), "_DKKnowledgeStore");

  __break(1u);
}

@end
