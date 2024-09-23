@implementation NSString

void __49__NSString_CalClassAdditions__stringByURLQuoting__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("?"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)stringByURLQuoting_allowedCharacters;
  stringByURLQuoting_allowedCharacters = v1;

}

void __71__NSString_CalClassAdditions__stringByURLEscapingAllReservedCharacters__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR(":/?#[]@!$&’()*+,;=%"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)stringByURLEscapingAllReservedCharacters_allowedCharacters;
  stringByURLEscapingAllReservedCharacters_allowedCharacters = v1;

}

void __54__NSString_CalClassAdditions__stringByEncodingSlashes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("/"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)stringByEncodingSlashes_allowedCharacters;
  stringByEncodingSlashes_allowedCharacters = v1;

}

void __46__NSString_CalClassAdditions__CalSafeFilename__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/\\?%*|\"<>:"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CalSafeFilename_disallowedCharacters;
  CalSafeFilename_disallowedCharacters = v0;

}

void __51__NSString_CalClassAdditions__CalAutoCommentPrefix__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C🗓%C "), 8203, 8203);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CalAutoCommentPrefix_prefix;
  CalAutoCommentPrefix_prefix = v0;

}

@end
