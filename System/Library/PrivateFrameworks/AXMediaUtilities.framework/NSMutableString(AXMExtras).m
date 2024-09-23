@implementation NSMutableString(AXMExtras)

- (void)axmAppendIndentation:()AXMExtras
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "axmIndentationString:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendString:", v2);

}

+ (id)axmIndentationString:()AXMExtras
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(v4, "appendString:", CFSTR(" "));
      --a3;
    }
    while (a3);
  }
  return v4;
}

@end
