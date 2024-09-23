@implementation MKPlaceHoursViewHelper

+ (void)determineExtraRulesForPlaceHoursViews:(id)a3 withBusinessHours:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hoursType") == 1 && objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPlaceHoursViewOptions:", objc_msgSend(v8, "placeHoursViewOptions") | 0x10);

      goto LABEL_15;
    }

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(v7, "objectAtIndex:", 0, (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 != v14)
          objc_msgSend(v13, "setPlaceHoursViewOptions:", objc_msgSend(v13, "placeHoursViewOptions") | 0x100);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
LABEL_15:

}

@end
