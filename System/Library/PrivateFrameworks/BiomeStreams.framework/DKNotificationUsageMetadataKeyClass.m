@implementation DKNotificationUsageMetadataKeyClass

Class __get_DKNotificationUsageMetadataKeyClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary_4)
  {
    v4 = xmmword_1E2648918;
    v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary_4)
    __get_DKNotificationUsageMetadataKeyClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_DKNotificationUsageMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKNotificationUsageMetadataKeyClass_block_invoke_cold_2();
  get_DKNotificationUsageMetadataKeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKNotificationUsageMetadataKeyClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMNotificationEvent.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_DKNotificationUsageMetadataKeyClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKNotificationUsageMetadataKeyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMNotificationEvent.m"), 23, CFSTR("Unable to find class %s"), "_DKNotificationUsageMetadataKey");

  __break(1u);
}

@end
