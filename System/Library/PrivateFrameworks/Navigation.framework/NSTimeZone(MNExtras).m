@implementation NSTimeZone(MNExtras)

- (uint64_t)_navigation_hasSameOffsetFromGMTAsTimeZone:()MNExtras
{
  return objc_msgSend(a1, "_navigation_isEquivalentToTimeZone:forDate:", a3, 0);
}

- (BOOL)_navigation_isEquivalentToTimeZone:()MNExtras forDate:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (v7)
    {
      v8 = objc_msgSend(a1, "secondsFromGMTForDate:", v7);
      v9 = objc_msgSend(v6, "secondsFromGMTForDate:", v7);
    }
    else
    {
      v8 = objc_msgSend(a1, "secondsFromGMT");
      v9 = objc_msgSend(v6, "secondsFromGMT");
    }
    v10 = v8 == v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)_navigation_isEquivalentToTimeZone:()MNExtras forDates:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (!objc_msgSend(a1, "_navigation_isEquivalentToTimeZone:forDate:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15))
          {
            v13 = 0;
            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_12:

  }
  else
  {
    v13 = objc_msgSend(a1, "_navigation_isEquivalentToTimeZone:forDate:", v6, 0);
  }

  return v13;
}

@end
