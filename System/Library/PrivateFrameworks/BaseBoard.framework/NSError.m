@implementation NSError

void __60__NSError_BaseBoard__descriptionBuilderWithMultilinePrefix___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CB2D60], *MEMORY[0x1E0CB2D68], CFSTR("BSErrorCodeDescription"), *MEMORY[0x1E0CB3388], *MEMORY[0x1E0CB2F70], CFSTR("NSDetailedErrors"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_23;
  _MergedGlobals_23 = v0;

}

void __60__NSError_BaseBoard__descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6, (_QWORD)v16);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = _NSIsNSArray();
        v9 = *(void **)(a1 + 48);
        if (v8)
          objc_msgSend(v9, "appendArraySection:withName:skipIfEmpty:", v7, v6, 1);
        else
          v10 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", v7, v6, 1);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

  v11 = (id *)(a1 + 56);
  v12 = objc_msgSend(*(id *)(a1 + 56), "count");
  v13 = *(void **)(a1 + 48);
  if (v12 == 1)
  {
    objc_msgSend(*v11, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "appendObject:withName:", v14, *MEMORY[0x1E0CB3388]);

  }
  else
  {
    objc_msgSend(v13, "appendCollectionSection:withName:skipIfEmpty:", *v11, *MEMORY[0x1E0CB2F70], 1);
  }
}

@end
