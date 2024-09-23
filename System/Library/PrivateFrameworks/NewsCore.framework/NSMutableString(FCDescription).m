@implementation NSMutableString(FCDescription)

- (void)indentBy:()FCDescription
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_msgSend(CFSTR("          "), "mutableCopy");
  v7 = v5;
  while (objc_msgSend(v5, "length") < a3)
  {
    objc_msgSend(v7, "appendString:", v7);
    v5 = v7;
  }
  objc_msgSend(v7, "deleteCharactersInRange:", a3, objc_msgSend(v7, "length") - a3);
  objc_msgSend(a1, "insertString:atIndex:", v7, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), v6, 0, 0, objc_msgSend(a1, "length"));

}

@end
