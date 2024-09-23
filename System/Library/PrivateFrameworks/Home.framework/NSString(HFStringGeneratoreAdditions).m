@implementation NSString(HFStringGeneratoreAdditions)

- (id)stringWithAttributes:()HFStringGeneratoreAdditions
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:attributes:", a1, v5);

  return v6;
}

- (id)dynamicStringForSize:()HFStringGeneratoreAdditions attributes:
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:attributes:", a1, v5);

  return v6;
}

- (uint64_t)prefersDynamicString
{
  return 0;
}

@end
