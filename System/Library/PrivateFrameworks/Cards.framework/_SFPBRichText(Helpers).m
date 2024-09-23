@implementation _SFPBRichText(Helpers)

+ (id)textWithString:()Helpers
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BE85110];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BE85148], "textWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setText:", v6);
  return v5;
}

- (void)setMaxLines:()Helpers
{
  id v4;

  objc_msgSend(a1, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxLines:", a3);

}

- (uint64_t)maxLines
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "text");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "maxLines");

  return v2;
}

@end
