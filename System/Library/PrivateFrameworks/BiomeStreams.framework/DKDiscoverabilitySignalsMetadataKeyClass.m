@implementation DKDiscoverabilitySignalsMetadataKeyClass

Class __get_DKDiscoverabilitySignalsMetadataKeyClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreDuetLibrary_2();
  result = objc_getClass("_DKDiscoverabilitySignalsMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKDiscoverabilitySignalsMetadataKeyClass_block_invoke_cold_1();
  get_DKDiscoverabilitySignalsMetadataKeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKDiscoverabilitySignalsMetadataKeyClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKDiscoverabilitySignalsMetadataKeyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMTipsStreams.m"), 26, CFSTR("Unable to find class %s"), "_DKDiscoverabilitySignalsMetadataKey");

  __break(1u);
}

@end
