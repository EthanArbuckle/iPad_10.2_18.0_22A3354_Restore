@implementation NSSet(MRAVReconnaissanceSessionAdditions)

- (uint64_t)mr_containsObjectUsingWeakMatching:()MRAVReconnaissanceSessionAdditions
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(a1, "allObjects");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            v12 = objc_msgSend(v11, "length", (_QWORD)v18);
            v13 = v12 >= objc_msgSend(v5, "length") ? v5 : v11;
            v14 = v13 == v11 ? v5 : v11;
            v15 = v13;
            v16 = objc_msgSend(v14, "containsString:", v15);

            if ((v16 & 1) != 0)
            {
              v7 = 1;
              goto LABEL_20;
            }
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_20:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
