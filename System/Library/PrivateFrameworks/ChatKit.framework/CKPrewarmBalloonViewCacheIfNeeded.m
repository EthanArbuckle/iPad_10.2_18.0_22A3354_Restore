@implementation CKPrewarmBalloonViewCacheIfNeeded

void __CKPrewarmBalloonViewCacheIfNeeded_block_invoke(double *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if (a3)
        {
          v10 = *(objc_class **)(*((_QWORD *)&v13 + 1) + 8 * v9);
          v11 = a3;
          do
          {
            v12 = (void *)objc_msgSend([v10 alloc], "initWithFrame:", a1[4], a1[5], a1[6], a1[7]);
            CKBalloonViewReuse(v12);

            --v11;
          }
          while (v11);
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

@end
