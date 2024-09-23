@implementation ICIAMMetricEvent(Metrics)

- (id)reportableDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(a1, "pageDetailsCount"))
  {
    objc_msgSend(a1, "pageDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v5, "iam_dictionaryFromArrayOfICIIAMParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("pageDetails"));

  }
  if (objc_msgSend(a1, "actionDetailsCount"))
  {
    objc_msgSend(a1, "actionDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v8, "iam_dictionaryFromArrayOfICIIAMParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("actionDetails"));

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)reportableDictionaryForClickEventWithMessageIdentifier:()Metrics andTargetIdentifier:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "reportableDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("targetId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("targetId"));
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("actionContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !v11)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("actionContext"));
  v12 = (void *)objc_msgSend(v9, "copy");

  return v12;
}

@end
