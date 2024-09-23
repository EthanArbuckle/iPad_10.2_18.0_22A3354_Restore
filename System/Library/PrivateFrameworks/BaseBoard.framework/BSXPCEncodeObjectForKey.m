@implementation BSXPCEncodeObjectForKey

void ___BSXPCEncodeObjectForKey_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "encodeWithBSXPCCoder:", *(_QWORD *)(a1 + 40));
  NSStringFromClass((Class)objc_msgSend(*(id *)(a1 + 32), "classForCoder"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeStringToXPCDictionaryWithKey(v4, a2, "bsx_class");

}

id ___BSXPCEncodeObjectForKey_block_invoke_3(uint64_t a1, void *a2)
{
  return BSSerializeBSXPCEncodableObjectToXPCDictionary(*(void **)(a1 + 32), a2);
}

void ___BSXPCEncodeObjectForKey_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    v5 = *MEMORY[0x1E0C99778];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          _BSXPCEncodeObjectForKey(*(_QWORD *)(a1 + 40), v8, v7);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v5, CFSTR("Dictionary keys must be of type NSString"), (_QWORD)v9);
        }
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

@end
