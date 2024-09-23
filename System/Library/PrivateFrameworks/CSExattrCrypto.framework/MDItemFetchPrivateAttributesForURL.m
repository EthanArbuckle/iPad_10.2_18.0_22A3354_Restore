@implementation MDItemFetchPrivateAttributesForURL

uint64_t ___MDItemFetchPrivateAttributesForURL_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *ValueAtIndex)
{
  uint64_t v4;
  const __CFArray *v5;
  CFTypeID TypeID;

  v4 = *(_QWORD *)(a1 + 32);
  if (ValueAtIndex)
  {
    v5 = ValueAtIndex;
    TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v5) && CFArrayGetCount(v5))
      ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v5, 0);
    else
      ValueAtIndex = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFArray *))(v4 + 16))(v4, a2, ValueAtIndex);
}

@end
