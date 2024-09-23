@implementation NSDictionary(TextEffects)

- (uint64_t)ck_activeTextStylesFromTypingAttributes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1248]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = 4;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0DC11A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 |= 8uLL;
  }
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fontDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 |= __rbit32(objc_msgSend(v7, "symbolicTraits")) >> 30;

  }
  return v3;
}

- (uint64_t)ck_activeTextEffectFromTypingAttributes
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D393F0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "unsignedIntegerValue");
  else
    v2 = 0;

  return v2;
}

@end
