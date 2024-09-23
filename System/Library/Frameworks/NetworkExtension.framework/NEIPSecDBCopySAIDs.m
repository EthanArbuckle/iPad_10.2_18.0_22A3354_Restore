@implementation NEIPSecDBCopySAIDs

CFDictionaryRef __NEIPSecDBCopySAIDs_block_invoke(CFDictionaryRef result)
{
  const __CFDictionary *v1;
  CFDictionaryRef v2;

  v1 = *(const __CFDictionary **)(*((_QWORD *)result + 5) + 80);
  if (v1)
  {
    v2 = result;
    result = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 4) + 8) + 24) = result;
  }
  return result;
}

@end
