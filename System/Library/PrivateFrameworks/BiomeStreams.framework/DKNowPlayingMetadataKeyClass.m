@implementation DKNowPlayingMetadataKeyClass

Class __get_DKNowPlayingMetadataKeyClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_1E26484A0;
    v5 = 0;
    CoreDuetLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary_1)
    __get_DKNowPlayingMetadataKeyClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_DKNowPlayingMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_DKNowPlayingMetadataKeyClass_block_invoke_cold_2();
  get_DKNowPlayingMetadataKeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKNowPlayingMetadataKeyClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BMNowPlayingEvent.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_DKNowPlayingMetadataKeyClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DKNowPlayingMetadataKeyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMNowPlayingEvent.m"), 23, CFSTR("Unable to find class %s"), "_DKNowPlayingMetadataKey");

  __break(1u);
}

@end
