@implementation DKDigitalHealthMetadataKeyClass

Class __get_DKDigitalHealthMetadataKeyClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreDuetLibrary();
  result = objc_getClass("_DKDigitalHealthMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKDigitalHealthMetadataKeyClass_block_invoke_cold_1();
  get_DKDigitalHealthMetadataKeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKDigitalHealthMetadataKeyClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreDuetLibrary_0();
  result = objc_getClass("_DKDigitalHealthMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKDigitalHealthMetadataKeyClass_block_invoke_cold_1_0();
  get_DKDigitalHealthMetadataKeyClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKDigitalHealthMetadataKeyClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKDigitalHealthMetadataKeyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMKnowledgeContextMapping.m"), 21, CFSTR("Unable to find class %s"), "_DKDigitalHealthMetadataKey");

  __break(1u);
}

void __get_DKDigitalHealthMetadataKeyClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKDigitalHealthMetadataKeyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMAppStreams.m"), 35, CFSTR("Unable to find class %s"), "_DKDigitalHealthMetadataKey");

  __break(1u);
}

@end
