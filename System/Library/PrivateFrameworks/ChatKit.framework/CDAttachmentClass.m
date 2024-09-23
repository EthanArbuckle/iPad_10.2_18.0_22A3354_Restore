@implementation CDAttachmentClass

Class __get_CDAttachmentClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreDuetLibrary();
  result = objc_getClass("_CDAttachment");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_CDAttachmentClass_block_invoke_cold_1();
  get_CDAttachmentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_CDAttachmentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_CDAttachmentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKSMSComposeViewServiceController.m"), 91, CFSTR("Unable to find class %s"), "_CDAttachment");

  __break(1u);
}

@end
