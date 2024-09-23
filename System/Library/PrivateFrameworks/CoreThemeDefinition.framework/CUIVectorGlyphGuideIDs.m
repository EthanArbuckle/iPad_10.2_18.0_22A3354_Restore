@implementation CUIVectorGlyphGuideIDs

id __CUIVectorGlyphGuideIDs_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  id result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[8];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (__CUIVectorGlyphNodeIDs_onceToken != -1)
    dispatch_once(&__CUIVectorGlyphNodeIDs_onceToken, &__block_literal_global_309);
  v0 = (void *)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs;
  v1 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend((id)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs, "count"));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v0);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v1, "addObject:", objc_msgSend(CFSTR("left-margin"), "stringByAppendingFormat:", CFSTR("-%@"), v6));
        objc_msgSend(v1, "addObject:", objc_msgSend(CFSTR("right-margin"), "stringByAppendingFormat:", CFSTR("-%@"), v6));
      }
      v3 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v3);
  }
  v12[0] = CFSTR("Baseline-S");
  v12[1] = CFSTR("Capline-S");
  v12[2] = CFSTR("Baseline-M");
  v12[3] = CFSTR("Capline-M");
  v12[4] = CFSTR("Baseline-L");
  v12[5] = CFSTR("Capline-L");
  v12[6] = CFSTR("left-margin");
  v12[7] = CFSTR("right-margin");
  result = (id)objc_msgSend(v1, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 8));
  CUIVectorGlyphGuideIDs__CUIVectorGlyphGuideIDs = (uint64_t)result;
  return result;
}

@end
