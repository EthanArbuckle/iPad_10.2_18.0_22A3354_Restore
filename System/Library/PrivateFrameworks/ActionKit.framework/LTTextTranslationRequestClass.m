@implementation LTTextTranslationRequestClass

void __get_LTTextTranslationRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  TranslationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_LTTextTranslationRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_LTTextTranslationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_LTTextTranslationRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFTranslateTextAction.m"), 20, CFSTR("Unable to find class %s"), "_LTTextTranslationRequest");

    __break(1u);
  }
}

@end
