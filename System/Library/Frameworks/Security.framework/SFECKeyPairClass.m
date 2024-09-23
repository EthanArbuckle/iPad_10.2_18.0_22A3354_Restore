@implementation SFECKeyPairClass

Class __get_SFECKeyPairClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SecurityFoundationLibraryCore_frameworkLibrary)
    SecurityFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SecurityFoundationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SecurityFoundationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SOSFullPeerInfo.m"), 68, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("_SFECKeyPair");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_SFECKeyPairClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SOSFullPeerInfo.m"), 72, CFSTR("Unable to find class %s"), "_SFECKeyPair");

LABEL_8:
    __break(1u);
  }
  get_SFECKeyPairClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
