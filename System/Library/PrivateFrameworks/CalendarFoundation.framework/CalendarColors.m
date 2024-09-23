@implementation CalendarColors

+ (id)symbolicColorForNewCalendarWithExistingSymbolicNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  int v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "colorNamesOrderedForAssignment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

  }
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "countOfColor:inArray:", v9, v4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = objc_msgSend(a1, "countOfColor:inArray:", v16, v4, (_QWORD)v21);
        if (v17 < v10)
        {
          v18 = v17;
          v19 = v16;

          v10 = v18;
          v9 = v19;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return v9;
}

+ (int)countOfColor:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v5);

      v10 += v12;
      ++v9;
    }
    while (v8 != v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)colorNamesOrderedForAssignment
{
  objc_msgSend(a1, "_bootstrapColorNameMapping");
  return (id)_colorNamesOrderedForAssignment;
}

+ (id)defaultCalendarColorNames
{
  objc_msgSend(a1, "_bootstrapColorNameMapping");
  return (id)_defaultCalendarColorNames;
}

+ (void)_bootstrapColorNameMapping
{
  if (!_colorNameMapping)
    objc_msgSend(a1, "_rebuildColors");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "_bootstrapColorNameMapping");
}

+ (void)_rebuildColors
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v2;
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("CalendarColors"), CFSTR("plist"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v40;
    v35 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v4);
        objc_msgSend(v5, "objectForKey:", CFSTR("name"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "length"))
        {
          if (objc_msgSend(v3, "containsObject:", v6))
            NSLog(CFSTR("%s ERROR: color already defined for \"%@\"), "+[CalendarColors _rebuildColors]", v6);
          objc_msgSend(v5, "objectForKey:", CFSTR("tile"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count") == 3)
          {
            objc_msgSend(v7, "objectAtIndex:", 0);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "unsignedIntValue");
            objc_msgSend(v7, "objectAtIndex:", 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "unsignedIntValue");
            objc_msgSend(v7, "objectAtIndex:", 2);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "unsignedIntValue");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X%02X"), v9, v11, v13, 255);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v14 = 0;
          }
          objc_msgSend(v5, "objectForKey:", CFSTR("text"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count") == 3)
          {
            objc_msgSend(v15, "objectAtIndex:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "unsignedIntValue");
            objc_msgSend(v15, "objectAtIndex:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntValue");
            objc_msgSend(v15, "objectAtIndex:", 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "unsignedIntValue");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X%02X"), v17, v19, v21, 255);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              v3 = v35;
              if (v22)
              {
                objc_msgSend(v35, "addObject:", v6);
                objc_msgSend(v33, "setObject:forKey:", v14, v6);
                objc_msgSend(v34, "setObject:forKey:", v22, v6);
LABEL_18:

                goto LABEL_19;
              }
            }
            else
            {
              v3 = v35;
            }
          }
          else
          {
            v22 = 0;
          }
          NSLog(CFSTR("%s ERROR: incorrect definition for color \"%@\"), "+[CalendarColors _rebuildColors]", v6);
          goto LABEL_18;
        }
LABEL_19:

        ++v4;
      }
      while (v38 != v4);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v38 = v23;
    }
    while (v23);
  }
  v24 = (void *)_defaultCalendarColorNames;
  _defaultCalendarColorNames = (uint64_t)v3;
  v25 = v3;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0DDBBC0], *MEMORY[0x1E0DDBBE8], *MEMORY[0x1E0DDBBE0], *MEMORY[0x1E0DDBBD8], *MEMORY[0x1E0DDBBF0], *MEMORY[0x1E0DDBBF8], *MEMORY[0x1E0DDBBC8], 0);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)_colorNamesOrderedForAssignment;
  _colorNamesOrderedForAssignment = v26;

  v28 = (void *)_colorNameMapping;
  _colorNameMapping = (uint64_t)v33;
  v29 = v33;

  v30 = (void *)_textColorNameMapping;
  _textColorNameMapping = (uint64_t)v34;

}

+ (id)nameOfColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_bootstrapColorNameMapping");
  objc_msgSend(MEMORY[0x1E0DDB7E8], "symbolicColorForLegacyRGB:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend((id)_colorNameMapping, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend((id)_colorNameMapping, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (CalColorsAreAlmostEqual(v4, v14))
          {
            v7 = v13;

            goto LABEL_13;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

+ (id)colorForName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_bootstrapColorNameMapping");
  objc_msgSend((id)_colorNameMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)birthdayCalendarColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X%02X"), 130, 149, 175, 255);
}

+ (id)facebookCalendarColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X%02X"), 49, 66, 133, 255);
}

+ (id)grayColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X%02X"), 128, 128, 128, 255);
}

+ (id)textColorForName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_bootstrapColorNameMapping");
  objc_msgSend((id)_textColorNameMapping, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)localizedColorNameForColorName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CalendarFoundation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBBC0]) & 1) != 0)
  {
    v7 = CFSTR("Blue");
LABEL_15:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v7, &stru_1E2A86598, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBBD8]) & 1) != 0)
  {
    v7 = CFSTR("Green");
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBBF0]) & 1) != 0)
  {
    v7 = CFSTR("Red");
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBBE0]) & 1) != 0)
  {
    v7 = CFSTR("Orange");
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBBF8]) & 1) != 0)
  {
    v7 = CFSTR("Yellow");
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBBE8]) & 1) != 0)
  {
    v7 = CFSTR("Purple");
    goto LABEL_15;
  }
  v8 = v5;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDBBC8]))
  {
    v7 = CFSTR("Brown");
    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

@end
