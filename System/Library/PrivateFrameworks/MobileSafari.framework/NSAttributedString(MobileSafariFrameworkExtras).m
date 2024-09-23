@implementation NSAttributedString(MobileSafariFrameworkExtras)

+ (uint64_t)safari_richListOfLinksForTabs:()MobileSafariFrameworkExtras
{
  return objc_msgSend(a1, "safari_richListOfLinksForTabs:includingBulletForSingleLink:", a3, 0);
}

+ (id)safari_richListOfLinksForTabs:()MobileSafariFrameworkExtras includingBulletForSingleLink:
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  id obj;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  void *v37;
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0DCCB58], "linkCountForTabs:", v5);
  if (v6)
  {
    v7 = v6;
    v31 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v38 = *MEMORY[0x1E0DC1178];
    v8 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    v9 = objc_alloc(MEMORY[0x1E0DC1300]);
    v10 = (void *)objc_msgSend(v9, "initWithMarkerFormat:options:", *MEMORY[0x1E0DC1228], 0);
    v37 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextLists:", v11);

    v39[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v5;
    obj = v5;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      if (v7 > 1)
        v15 = 1;
      else
        v15 = a4;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v17, "url", v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v17, "title");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "length"))
            {
              v20 = v19;
            }
            else
            {
              objc_msgSend(v18, "safari_userVisibleHostWithoutWWWSubdomain");
              v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            v21 = v20;
            v22 = (void *)MEMORY[0x1E0CB3498];
            objc_msgSend(v18, "absoluteString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "safari_attributedStringWithLinkText:linkUrl:extraTitle:", v21, v23, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(v24, "mutableCopy");

            if (v15)
              objc_msgSend(v25, "addAttributes:range:", v29, 0, objc_msgSend(v21, "length"));
            objc_msgSend(v31, "appendAttributedString:", v25);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v13);
    }

    v26 = (void *)objc_msgSend(v31, "copy");
    v5 = v28;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
