@implementation NSDictionary(BW_AVAudioRouteDataSourceUtilities)

- (uint64_t)bw_optimalMicPolarPattern
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v2 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D49DD0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v14;
  v7 = -1;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "intValue");
        v11 = 0;
        while (v10 != *(_DWORD *)&aInmoddrcdcbs[4 * v11])
        {
          if (++v11 == 3)
          {
            v11 = 0;
            break;
          }
        }
        if (v11 <= v7)
          v5 = v5;
        else
          v5 = v10;
        if (v11 > v7)
          v7 = v11;
      }
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v4);
  return v5;
}

@end
