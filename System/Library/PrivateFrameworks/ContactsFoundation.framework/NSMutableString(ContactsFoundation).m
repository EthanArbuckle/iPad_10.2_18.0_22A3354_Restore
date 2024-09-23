@implementation NSMutableString(ContactsFoundation)

- (void)_cn_appendNonNilString:()ContactsFoundation
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v7;
    if (v6)
    {
      objc_msgSend(a1, "appendString:", v7);
      v5 = v7;
    }
  }

}

- (uint64_t)_cn_trim
{
  objc_msgSend(a1, "_cn_trimLeadingWhitespace");
  return objc_msgSend(a1, "_cn_trimTrailingWhitespace");
}

- (void)_cn_trimLeadingWhitespace
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cn_deleteCharactersInSet:options:", v2, 8);

}

- (void)_cn_trimTrailingWhitespace
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cn_deleteCharactersInSet:options:", v2, 12);

}

- (uint64_t)_cn_deleteCharactersInSet:()ContactsFoundation
{
  return objc_msgSend(a1, "_cn_deleteCharactersInSet:options:", a3, 385);
}

- (void)_cn_deleteCharactersInSet:()ContactsFoundation options:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v9, a4))
      objc_msgSend(a1, "deleteCharactersInRange:", i, v7);
  }

}

- (void)_cn_replaceOccurrencesOfString:()ContactsFoundation withString:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, objc_msgSend(a1, "length"));

}

@end
