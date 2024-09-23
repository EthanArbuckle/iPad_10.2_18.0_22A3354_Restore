@implementation FCArticleRecordSourceLocalizableKeysFromDesiredFieldOptions

id __FCArticleRecordSourceLocalizableKeysFromDesiredFieldOptions_block_invoke()
{
  if (qword_1ED0F7CA8 != -1)
    dispatch_once(&qword_1ED0F7CA8, &__block_literal_global_58_0);
  return (id)_MergedGlobals_12;
}

void __FCArticleRecordSourceLocalizableKeysFromDesiredFieldOptions_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("tagMetadata"), CFSTR("topicFlags"), CFSTR("scores"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v0;

}

@end
