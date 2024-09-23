@implementation NSArray(AXMExtras)

+ (id)axmArrayByIgnoringNilElementsWithCount:()AXMExtras
{
  void *v10;
  uint64_t *v11;
  uint64_t *i;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = &a9; a3; --a3)
  {
    v11 = i++;
    if (*v11)
      objc_msgSend(v10, "addObject:");
  }
  return v10;
}

@end
