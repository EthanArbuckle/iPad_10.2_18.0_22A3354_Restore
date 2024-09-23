@implementation NSDate

void __55__NSDate_CATInternetDateAndTime__cat_RFC3339Formatters__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = objc_msgSend(&unk_24C1D8E78, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v11;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v11 != v3)
          objc_enumerationMutation(&unk_24C1D8E78);
        v5 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v4);
        v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
        objc_msgSend(v6, "setLocale:", v7);

        objc_msgSend(v6, "setDateFormat:", v5);
        objc_msgSend(v0, "addObject:", v6);

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(&unk_24C1D8E78, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v2);
  }
  v8 = objc_msgSend(v0, "copy");
  v9 = (void *)cat_RFC3339Formatters_RFC3339DateFormatters;
  cat_RFC3339Formatters_RFC3339DateFormatters = v8;

}

@end
