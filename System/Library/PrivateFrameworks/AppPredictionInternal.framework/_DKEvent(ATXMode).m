@implementation _DKEvent(ATXMode)

- (id)atx_startDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && (objc_msgSend(a1, "metadata"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("start")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)atx_endDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && (objc_msgSend(a1, "metadata"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("end")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)atx_mode
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)atx_bundleID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)atx_eventDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "atx_endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "atx_startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  return v5;
}

@end
