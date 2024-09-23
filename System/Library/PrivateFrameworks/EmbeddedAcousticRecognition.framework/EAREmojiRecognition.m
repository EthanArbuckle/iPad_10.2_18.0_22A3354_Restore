@implementation EAREmojiRecognition

void __73___EAREmojiRecognition_recognizeEmojisInInputString_enumerateUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v9, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "baseStringForEmojiString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
