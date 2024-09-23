@implementation NSAttributedString(CLKTextProvider)

- (id)_attributedStringWithOtherAttributesFromStyle:()CLKTextProvider
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "otherAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (id)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v4, "otherAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttributes:range:", v8, 0, objc_msgSend(v7, "length"));

  }
  else
  {
    v7 = a1;
  }

  return v7;
}

- (id)_attributedStringWithForegroundColor:()CLKTextProvider
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x24BEBD278], v4, 0, objc_msgSend(v5, "length"));

    v6 = (id)objc_msgSend(v5, "copy");
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

@end
