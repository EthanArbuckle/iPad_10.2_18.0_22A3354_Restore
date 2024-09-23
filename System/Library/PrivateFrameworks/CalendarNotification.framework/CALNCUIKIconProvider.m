@implementation CALNCUIKIconProvider

+ (id)_identifierEncodingAllowedCharacters
{
  if (_identifierEncodingAllowedCharacters_onceToken != -1)
    dispatch_once(&_identifierEncodingAllowedCharacters_onceToken, &__block_literal_global_13);
  return (id)_identifierEncodingAllowedCharacters_characterSet;
}

void __60__CALNCUIKIconProvider__identifierEncodingAllowedCharacters__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(CFSTR("-"), "stringByAppendingString:", CFSTR("%"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_identifierEncodingAllowedCharacters_characterSet;
  _identifierEncodingAllowedCharacters_characterSet = v1;

}

+ (CALNCUIKIconProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CALNCUIKIconProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, block);
  return (CALNCUIKIconProvider *)(id)sharedInstance_sharedInstance_5;
}

void __38__CALNCUIKIconProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = v0;

}

- (id)pngDataForIconWithIdentifier:(id)a3
{
  id v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIImage *v16;
  UIImage *v17;
  id v19;
  id v20;
  uint64_t v21;

  v21 = 0;
  v3 = a3;
  v19 = 0;
  v20 = 0;
  v4 = objc_msgSend((id)objc_opt_class(), "_parseIconIdentifier:intoDateComponents:calendar:type:", v3, &v20, &v19, &v21);

  v5 = v20;
  v6 = v19;
  v7 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v9;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 182.0, 182.0, v10);
    objc_msgSend(v11, "setShouldApplyMask:", 0);
    v12 = objc_alloc(MEMORY[0x24BE51A90]);
    v13 = (void *)objc_msgSend(v12, "initWithDateComponents:calendar:format:forceNoTextEffects:", v5, v6, v21, 1);
    objc_msgSend(v13, "prepareImageForDescriptor:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "CGImage");
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v15, 0, v10);
      v16 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        UIImagePNGRepresentation(v16);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (BOOL)_parseIconIdentifier:(id)a3 intoDateComponents:(id *)a4 calendar:(id *)a5 type:(int64_t *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t *v34;
  void *v35;
  void *v36;
  int64_t v37;
  id *v38;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("-"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 6)
  {
    v38 = a5;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "intValue");
    v17 = v16 == 5;
    if (v16 == 5)
    {
      v34 = a6;
      v35 = v11;
      v36 = v10;
      objc_msgSend(v11, "stringByRemovingPercentEncoding");
      v18 = objc_claimAutoreleasedReturnValue();
      v33 = v12;
      objc_msgSend(v12, "stringByRemovingPercentEncoding");
      v19 = v14;
      v20 = objc_claimAutoreleasedReturnValue();
      v32 = v13;
      v37 = (int)objc_msgSend(v13, "intValue");
      v29 = v19;
      v21 = (int)objc_msgSend(v19, "intValue");
      v22 = (int)objc_msgSend(v15, "intValue");
      v23 = (void *)objc_opt_new();
      v31 = (void *)v18;
      objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v20;
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setLocale:", v25);

      objc_msgSend(v23, "setCalendar:", v24);
      objc_msgSend(v23, "setDay:", v22);
      if (v37 == 1)
      {
        objc_msgSend(v23, "setMonth:", v21);
        v27 = v38;
      }
      else
      {
        v26 = v21;
        v27 = v38;
        if (!v37)
          objc_msgSend(v23, "setWeekday:", v26);
      }
      v11 = v35;
      v10 = v36;
      v14 = v29;
      if (a4)
        *a4 = objc_retainAutorelease(v23);
      if (v27)
        *v27 = objc_retainAutorelease(v24);
      if (v34)
        *v34 = v37;

      v13 = v32;
      v12 = v33;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)identifierForIconWithDate:(id)a3 inCalendar:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[7];

  v24[6] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "components:fromDate:", 536, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v23, "weekday");
  v7 = objc_msgSend(v23, "day");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_identifierEncodingAllowedCharacters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_identifierEncodingAllowedCharacters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  v24[1] = v10;
  v24[2] = v14;
  v24[3] = v15;
  v24[4] = v16;
  v24[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("-"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
