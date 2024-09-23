@implementation CGPDFAppenderCreateCFDictionary

uint64_t __CGPDFAppenderCreateCFDictionary_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  CFNumberRef CFObject;

  if (a2 && a3)
  {
    CFObject = CGPDFAppenderCreateCFObject(a3, 0);
    CGPDFAppenderDictionarySetValue(*(__CFDictionary **)(a1 + 32), a2, CFObject);
    CFRelease(CFObject);
  }
  return 1;
}

@end
