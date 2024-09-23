@implementation NSString(MNLPRExras)

- (id)mnlpr_componentsSeparatedByGlyph
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    v3 = 0;
    while (1)
    {
      v4 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v3);
      if (!v5)
        break;
      v6 = v4;
      v7 = v5;
      objc_msgSend(a1, "substringWithRange:", v4, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v8);
      v3 = v6 + v7;

      if (v3 >= objc_msgSend(a1, "length"))
        goto LABEL_5;
    }
    v9 = 0;
  }
  else
  {
LABEL_5:
    v9 = v2;
  }

  return v9;
}

@end
