@implementation NSString(SCNExtensions)

- (uint64_t)scn_stringByReplacingCharactersInRanges:()SCNExtensions withStrings:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t k;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count");
  if (v7 != objc_msgSend(a4, "count"))
  {
    NSLog(CFSTR("Error: ranges and strings arrays must be of the same size"));
    return 0;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(a3);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "rangeValue");
        if (v14 < v10)
        {
          NSLog(CFSTR("Error: ranges must be ordered"));
          return 0;
        }
        v10 = v14 + v15;
        v11 += v15;
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(a4);
        v19 += objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "length");
      }
      v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }
  if (v19 - v11 + objc_msgSend(a1, "length") <= 0)
  {
    NSLog(CFSTR("Error: incorrect ranges : cumulated size larger than the original string"));
    return 0;
  }
  v33 = a1;
  v22 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = 0;
    v27 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(a3);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "rangeValue");
        v31 = v30;
        v32 = v29 - v26;
        if (v29 > v26)
          objc_msgSend(v22, "appendString:", objc_msgSend(v33, "substringWithRange:", v26, v32));
        objc_msgSend(v22, "appendString:", objc_msgSend(a4, "objectAtIndexedSubscript:", v25 + k, v32));
        v26 = v29 + v31;
      }
      v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      v25 += k;
    }
    while (v24);
  }
  else
  {
    v26 = 0;
  }
  if (v26 < objc_msgSend(v33, "length"))
    objc_msgSend(v22, "appendString:", objc_msgSend(v33, "substringWithRange:", v26, objc_msgSend(v33, "length") - v26));
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v22);
}

- (uint64_t)SCN_safeHash
{
  CC_SHA256_CTX v3;
  unsigned __int8 md[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  CC_SHA256_Init(&v3);
  CFStringUpdateHash(a1);
  CC_SHA256_Final(md, &v3);
  return *(_QWORD *)md;
}

@end
