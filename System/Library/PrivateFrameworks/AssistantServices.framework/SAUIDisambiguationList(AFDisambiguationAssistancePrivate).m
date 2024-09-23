@implementation SAUIDisambiguationList(AFDisambiguationAssistancePrivate)

- (id)af_disambiguationIdentifier
{
  id v2;
  CC_SHA1_CTX v4;

  memset(&v4, 0, sizeof(v4));
  CC_SHA1_Init(&v4);
  _UpdateSha1WithDisambiguationList(&v4, a1);
  v2 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20));
  CC_SHA1_Final((unsigned __int8 *)objc_msgSend(v2, "mutableBytes"), &v4);
  return v2;
}

- (id)af_indexIdentifierForItem:()AFDisambiguationAssistancePrivate
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), v6);
  return v7;
}

- (id)af_itemForIndexIdentifier:()AFDisambiguationAssistancePrivate
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "integerValue");
  objc_msgSend(a1, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v5 || objc_msgSend(v4, "isEqualToString:", CFSTR("0")))
  {
    v8 = 0;
    if ((v5 & 0x8000000000000000) == 0 && v5 < v7)
    {
      objc_msgSend(a1, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)af_setDisambiguationInfo:()AFDisambiguationAssistancePrivate
{
  id v4;
  id v5;
  void *v6;
  AFDisambiguationStore *v7;

  v4 = a1;
  v5 = a3;
  objc_setAssociatedObject(v4, "DisambiguationInfoKey", v5, (void *)1);
  v7 = objc_alloc_init(AFDisambiguationStore);
  objc_msgSend(v4, "af_disambiguationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFDisambiguationStore saveInfo:forIdentifier:](v7, "saveInfo:forIdentifier:", v5, v6);
}

- (id)af_assistedSelectionItem
{
  id v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((objc_msgSend(a1, "autoDisambiguationDisabled") & 1) != 0)
  {
    v3 = 0;
    v4 = CFSTR("disabled");
LABEL_5:
    objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v4);
    goto LABEL_6;
  }
  _af_AssistedSelectionItem(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = CFSTR("selection");
    goto LABEL_5;
  }
LABEL_6:
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:context:", 1925, v2);

  return v3;
}

- (void)af_saveItemSelection:()AFDisambiguationAssistancePrivate forType:
{
  _af_SaveItemSelection(a1, a3, a4);
}

@end
