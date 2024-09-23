@implementation SGEmojiPreferences

void __SGEmojiPreferences_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A600]), "initWithBlock:idleTimeout:", &__block_literal_global_8_935, 0.2);
  v2 = (void *)SGEmojiPreferences__pasExprOnceResult;
  SGEmojiPreferences__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __SGEmojiPreferences_block_invoke_2()
{
  void *v0;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E820]), "_initWithoutConnection");
  objc_msgSend(v0, "readEmojiDefaults");
  return v0;
}

@end
