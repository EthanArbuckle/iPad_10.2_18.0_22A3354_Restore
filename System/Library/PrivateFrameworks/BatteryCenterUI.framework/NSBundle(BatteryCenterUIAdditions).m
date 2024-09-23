@implementation NSBundle(BatteryCenterUIAdditions)

- (id)bsui_imageForIconInfo:()BatteryCenterUIAdditions
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
  {
    objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("CFBundleIconFilesRightToLeft"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (v11)
      objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("CFBundleIconFiles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = v12;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    if (v16)
      objc_msgSend(v6, "addObjectsFromArray:", v16);

  }
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("CFBundleIcons"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    v19 = v17;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    objc_msgSend(v21, "objectForKey:", CFSTR("CFBundlePrimaryIcon"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_opt_class();
    v24 = v22;
    if (v23)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
    }
    else
    {
      v25 = 0;
    }
    v26 = v25;

    objc_msgSend(v26, "objectForKey:", CFSTR("CFBundleIconName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_opt_class();
    v29 = v27;
    if (v28)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
    }
    else
    {
      v30 = 0;
    }
    v31 = v30;

    if (v31)
      objc_msgSend(v6, "addObject:", v31);

  }
  if (objc_msgSend(v6, "count"))
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v32 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v33 = v6;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v44;
LABEL_43:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v36)
        objc_enumerationMutation(v33);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v37), a1, (_QWORD)v43);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "size");
      if (v40 == a2 && v39 == a3)
        break;
      objc_msgSend(v32, "addObject:", v38);

      if (v35 == ++v37)
      {
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v35)
          goto LABEL_43;
        goto LABEL_52;
      }
    }

    if (v38)
      goto LABEL_55;
  }
  else
  {
LABEL_52:

  }
  objc_msgSend(v32, "lastObject", (_QWORD)v43);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:

  return v38;
}

@end
