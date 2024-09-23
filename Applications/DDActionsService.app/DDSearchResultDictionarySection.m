@implementation DDSearchResultDictionarySection

- (DDSearchResultDictionarySection)initWithSearchString:(id)a3 queryId:(unint64_t)a4
{
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id obj;
  id v12;
  DDSearchResultDictionarySection *v14;
  _QWORD __b[8];
  id v16;
  id v17;
  int v18;
  objc_super v19;
  unint64_t v20;
  id location[2];
  id v22;
  DDSearchResultDictionarySection *v23;
  id v24;
  _BYTE v25[128];

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v4 = v22;
  v22 = 0;
  v19.receiver = v4;
  v19.super_class = (Class)DDSearchResultDictionarySection;
  v14 = -[DDSearchResultDictionarySection init](&v19, "init");
  v22 = v14;
  objc_storeStrong(&v22, v14);
  if (v14)
  {
    v10 = (id)DDLocalizedString(CFSTR("Dictionary"), CFSTR("Title for dictionary entries in lookup"));
    objc_msgSend(v22, "setTitle:");

    objc_msgSend(v22, "setBundleIdentifier:", CFSTR("com.apple.lookup.dictionary"));
    v24 = (id)DCSSearchFoundationCopyResults(location[0]);
    v17 = v24;
    memset(__b, 0, sizeof(__b));
    obj = v17;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
    if (v12)
    {
      v7 = *(_QWORD *)__b[2];
      v8 = 0;
      v9 = v12;
      while (1)
      {
        v6 = v8;
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(obj);
        v16 = *(id *)(__b[1] + 8 * v8);
        objc_msgSend(v16, "setQueryId:", v20);
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          v8 = 0;
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
          if (!v9)
            break;
        }
      }
    }

    objc_msgSend(v22, "setResults:", v17);
    v23 = (DDSearchResultDictionarySection *)v22;
    v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v23 = 0;
    v18 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v22, 0);
  return v23;
}

@end
