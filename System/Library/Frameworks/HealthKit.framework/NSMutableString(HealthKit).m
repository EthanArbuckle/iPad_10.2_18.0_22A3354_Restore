@implementation NSMutableString(HealthKit)

- (void)hk_appendComponentsJoinedByString:()HealthKit container:componentGenerator:
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x19AEC7968](v12);
        if ((v14 & 1) != 0)
          objc_msgSend(a1, "appendString:", v8, (_QWORD)v20);
        v10[2](v10, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "appendString:", v19);

        objc_autoreleasePoolPop(v18);
        ++v16;
        v14 = 1;
      }
      while (v13 != v16);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v13 = v12;
    }
    while (v12);
  }

}

@end
