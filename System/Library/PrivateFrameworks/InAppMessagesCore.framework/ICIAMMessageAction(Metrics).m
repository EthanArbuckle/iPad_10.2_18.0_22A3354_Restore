@implementation ICIAMMessageAction(Metrics)

- (id)dictionaryRepresentationWithReportableMetricsEvents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(a1, "hasClickEvent"))
  {
    objc_msgSend(a1, "clickEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportableDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("clickEvent"));

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

@end
