@implementation C3DDeformerStackCFCopyDebugDescription

void ___C3DDeformerStackCFCopyDebugDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CFString *v4;
  objc_class *v5;
  NSString *v6;

  v4 = *(__CFString **)(a1 + 32);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  CFStringAppendFormat(v4, 0, CFSTR("  %@: %p\n"), v6, a3);
}

void ___C3DDeformerStackCFCopyDebugDescription_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CFString *v4;
  objc_class *v5;
  NSString *v6;

  v4 = *(__CFString **)(a1 + 32);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  CFStringAppendFormat(v4, 0, CFSTR("  %@: %p\n"), v6, a3);
}

@end
