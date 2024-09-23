@implementation NSString

void __67__NSString_SPExtras___sp_stringByEncodingIllegalFilenameCharacters__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/%"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sp_stringByEncodingIllegalFilenameCharacters_characterSetExcludingSlashAndPercent;
  _sp_stringByEncodingIllegalFilenameCharacters_characterSetExcludingSlashAndPercent = v0;

}

@end
