@implementation NSTextLineFragment(Mentions)

- (uint64_t)ck_animatingMentionsGlyphCount
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__NSTextLineFragment_Mentions__ck_animatingMentionsGlyphCount__block_invoke;
  v3[3] = &unk_1E2758438;
  v3[4] = &v4;
  objc_msgSend(a1, "ck_enumerateRunsWithBlock:", v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)ck_enumerateRunsWithBlock:()Mentions
{
  void (**v4)(id, const __CTLine *, _QWORD);
  const __CTLine *v5;
  const __CTLine *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (const __CTLine *)objc_msgSend(objc_retainAutorelease(a1), "lineRef");
  if (v5)
  {
    v6 = v5;
    CTLineGetGlyphRuns(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          v4[2](v4, v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

@end
