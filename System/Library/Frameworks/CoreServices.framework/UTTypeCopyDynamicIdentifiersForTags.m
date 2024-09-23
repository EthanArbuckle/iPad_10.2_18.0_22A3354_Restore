@implementation UTTypeCopyDynamicIdentifiersForTags

void ___UTTypeCopyDynamicIdentifiersForTags_block_invoke(uint64_t a1, const __CFString *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *DynamicIdentifierForTag;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        DynamicIdentifierForTag = (__CFString *)_UTTypeCreateDynamicIdentifierForTag(0, a2, *(const __CFString **)(*((_QWORD *)&v10 + 1) + 8 * v8), *(const __CFString **)(a1 + 40));
        if (DynamicIdentifierForTag)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", DynamicIdentifierForTag, (_QWORD)v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

@end
