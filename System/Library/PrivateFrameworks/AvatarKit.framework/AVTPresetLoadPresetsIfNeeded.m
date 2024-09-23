@implementation AVTPresetLoadPresetsIfNeeded

void __AVTPresetLoadPresetsIfNeeded_block_invoke()
{
  id v0;

  AVTPrecompiledMemojiPresetPlist();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_242);
  objc_msgSend(v0, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_271);

}

@end
