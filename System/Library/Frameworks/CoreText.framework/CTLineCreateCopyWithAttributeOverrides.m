@implementation CTLineCreateCopyWithAttributeOverrides

void __CTLineCreateCopyWithAttributeOverrides_block_invoke(uint64_t a1, const __CFString *a2, const void *a3)
{
  char isKindOfClass;
  __CFAttributedString *v7;
  CFRange v8;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = (__CFAttributedString *)atomic_load((unint64_t *)(a1 + 32));
  v8 = *(CFRange *)(a1 + 40);
  if ((isKindOfClass & 1) != 0)
    CFAttributedStringRemoveAttribute(v7, v8, a2);
  else
    CFAttributedStringSetAttribute(v7, v8, a2, a3);
}

@end
