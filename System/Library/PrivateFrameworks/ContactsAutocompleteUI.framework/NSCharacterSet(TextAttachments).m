@implementation NSCharacterSet(TextAttachments)

+ (id)textAttachmentCharacterSet
{
  void *v0;
  void *v1;
  __int16 v3;

  v3 = -4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
