@implementation LTTranslatorClass

void __get_LTTranslatorClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  TranslationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_LTTranslator");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_LTTranslatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_LTTranslatorClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFTranslateTextAction.m"), 19, CFSTR("Unable to find class %s"), "_LTTranslator");

    __break(1u);
  }
}

Class __get_LTTranslatorClass_block_invoke_47137(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!TranslationLibraryCore_frameworkLibrary_47140)
    TranslationLibraryCore_frameworkLibrary_47140 = _sl_dlopen();
  if (!TranslationLibraryCore_frameworkLibrary_47140)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *TranslationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFTranslateTextLanguagePickerParameter.m"), 20, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("_LTTranslator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_LTTranslatorClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFTranslateTextLanguagePickerParameter.m"), 21, CFSTR("Unable to find class %s"), "_LTTranslator");

LABEL_8:
    __break(1u);
  }
  get_LTTranslatorClass_softClass_47136 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
