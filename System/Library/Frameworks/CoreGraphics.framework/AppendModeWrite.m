@implementation AppendModeWrite

void __AppendModeWrite_block_invoke(uint64_t a1, const char *a2, const void *a3)
{
  CGPDFAppenderMutateDictionaryValue(*(char **)(a1 + 32), *(uint64_t **)(a1 + 40), a2, a3, 0);
}

void __AppendModeWrite_block_invoke_2(uint64_t a1, const char *a2, const void *a3)
{
  CGPDFAppenderDictionarySetValue(*(__CFDictionary **)(a1 + 32), a2, a3);
}

void __AppendModeWrite_block_invoke_3(uint64_t a1, const char *a2, const void *a3)
{
  CGPDFAppenderDictionarySetValue(*(__CFDictionary **)(a1 + 32), a2, a3);
}

@end
