@implementation NSError(NUError)

- (id)descriptionWithIndent:()NUError
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%*s%@"), a3, ", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
