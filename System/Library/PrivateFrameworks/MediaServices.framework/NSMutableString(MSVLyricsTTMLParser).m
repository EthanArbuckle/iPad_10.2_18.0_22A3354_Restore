@implementation NSMutableString(MSVLyricsTTMLParser)

- (void)msvl_trimTrailingWhitespace
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v5, 4);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "setString:", &stru_1E43EA7B0);
  }
  else
  {
    v4 = v3 + 1;
    if (v3 + 1 < (unint64_t)objc_msgSend(a1, "length"))
      objc_msgSend(a1, "deleteCharactersInRange:", v4, objc_msgSend(a1, "length") - v4);
  }

}

@end
