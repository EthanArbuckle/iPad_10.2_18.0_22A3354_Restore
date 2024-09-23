@implementation SWCollaborationMetadataClass

Class __get_SWCollaborationMetadataClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!SharedWithYouLibraryCore_frameworkLibrary)
    SharedWithYouLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SharedWithYouLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SharedWithYouLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("LPMetadata.m"), 48, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("_SWCollaborationMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_SWCollaborationMetadataClass(void)_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("LPMetadata.m"), 49, CFSTR("Unable to find class %s"), "_SWCollaborationMetadata");

LABEL_8:
    __break(1u);
  }
  get_SWCollaborationMetadataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
