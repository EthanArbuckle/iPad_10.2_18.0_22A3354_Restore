@implementation NSString(SFTabBarUtilities)

- (id)truncatedTitleWithFont:()SFTabBarUtilities desiredWidth:truncatedSize:tabBarItemTitles:
{
  id v10;
  id v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  unint64_t v27;
  double v28;
  uint64_t v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  objc_msgSend(a1, "_legacy_sizeWithFont:", v10);
  if (a5)
  {
    v14 = *MEMORY[0x1E0C9D820];
    *(double *)a5 = v12;
    *(_QWORD *)(a5 + 8) = v13;
    v15 = a5 + 8;
  }
  else
  {
    v15 = 8;
    v14 = v12;
  }
  if (v12 <= a2)
    goto LABEL_37;
  v40 = v10;
  v16 = a1;
  v39 = v11;
  v17 = v11;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v18)
  {

    v10 = v40;
LABEL_37:
    v26 = a1;
    goto LABEL_38;
  }
  v19 = v18;
  v38 = a1;
  v20 = 0;
  v21 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v42 != v21)
        objc_enumerationMutation(v17);
      v23 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
      if ((objc_msgSend(v16, "isEqualToString:", v23) & 1) == 0)
      {
        v24 = 0;
        if (v16 && v23)
        {
          objc_msgSend(v16, "commonPrefixWithString:options:", v23, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v25, "length");

        }
        if (v24 > v20)
          v20 = v24;
      }
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v19);

  v11 = v39;
  v10 = v40;
  a1 = v38;
  if (!v20)
    goto LABEL_37;
  v26 = (id)objc_msgSend(v16, "mutableCopy");
  v27 = 0;
  while (1)
  {
    v28 = v14;
    if (a5)
      v28 = *(double *)a5;
    if (v28 <= a2 || v20 <= v27)
      break;
    v30 = deleteOneWord(v26, v20 - v27, 0);
    if (!v30)
      break;
    v27 += v30;
    objc_msgSend(v26, "_legacy_sizeWithFont:", v40);
    if (a5)
    {
      *(double *)a5 = v31;
      *(_QWORD *)v15 = v32;
    }
    else
    {
      v14 = v31;
    }
  }
  if (!truncatedTitleWithFont_desiredWidth_truncatedSize_tabBarItemTitles__nonAlphanumericCharacters)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "invertedSet");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)truncatedTitleWithFont_desiredWidth_truncatedSize_tabBarItemTitles__nonAlphanumericCharacters;
    truncatedTitleWithFont_desiredWidth_truncatedSize_tabBarItemTitles__nonAlphanumericCharacters = v34;

  }
  if (v27)
  {
    do
      v36 = objc_msgSend(v26, "length");
    while (deleteOneWord(v26, v36, (void *)truncatedTitleWithFont_desiredWidth_truncatedSize_tabBarItemTitles__nonAlphanumericCharacters));
  }
LABEL_38:

  return v26;
}

- (uint64_t)truncatedTitleWithFont:()SFTabBarUtilities desiredWidth:tabBarItemTitles:
{
  return objc_msgSend(a1, "truncatedTitleWithFont:desiredWidth:truncatedSize:tabBarItemTitles:", a3, 0, a4);
}

@end
