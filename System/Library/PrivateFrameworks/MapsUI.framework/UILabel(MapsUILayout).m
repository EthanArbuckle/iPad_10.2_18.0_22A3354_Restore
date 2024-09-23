@implementation UILabel(MapsUILayout)

+ (double)_mapsui_maximumHeightWithFont:()MapsUILayout numberOfLines:displayScale:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4 < 1)
  {
    v16 = 1.79769313e308;
  }
  else
  {
    objc_msgSend(v5, "lineHeight");
    objc_msgSend(v6, "leading");
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 5)
    {
      objc_msgSend(v6, "fontDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fontAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13B8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = objc_msgSend(&unk_1E2E55C78, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
LABEL_6:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(&unk_1E2E55C78);
            if (objc_msgSend(v11, "containsString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15)))
              break;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(&unk_1E2E55C78, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
              if (v13)
                goto LABEL_6;
              break;
            }
          }
        }
      }

    }
    UICeilToScale();
    v16 = v17;
  }

  return v16;
}

@end
