@implementation NSMutableString(HFAdditions)

- (uint64_t)hf_appendLine:()HFAdditions
{
  objc_msgSend(a1, "appendString:");
  return objc_msgSend(a1, "appendString:", CFSTR("\n"));
}

- (uint64_t)hf_appendLineWithFormat:()HFAdditions
{
  objc_class *v10;
  id v11;
  void *v12;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  objc_msgSend(a1, "appendString:", v12);
  return objc_msgSend(a1, "appendString:", CFSTR("\n"));
}

@end
