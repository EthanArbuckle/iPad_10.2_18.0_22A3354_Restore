@implementation DKPREventClass

Class __get_DKPREventClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreDuetLibrary_1();
  result = objc_getClass("_DKPREvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKPREventClass_block_invoke_cold_1();
  get_DKPREventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKPREventClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKPREventClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_BMDKEventCodec_DKPREvent.m"), 21, CFSTR("Unable to find class %s"), "_DKPREvent");

  __break(1u);
}

@end
