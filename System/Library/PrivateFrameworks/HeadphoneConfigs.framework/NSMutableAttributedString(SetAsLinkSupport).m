@implementation NSMutableAttributedString(SetAsLinkSupport)

- (BOOL)setAsLink:()SetAsLinkSupport linkURL:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "mutableString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfString:", v7);
  v11 = v10;

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E0DC1160], v6, v9, v11);

  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

@end
