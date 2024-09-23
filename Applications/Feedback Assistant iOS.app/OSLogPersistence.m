@implementation OSLogPersistence

- (BOOL)fba_hasValidStartAndEndDates
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_claimAutoreleasedReturnValue(-[OSLogPersistence startDate](self, "startDate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSLogPersistence endDate](self, "endDate"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSLogPersistence startDate](self, "startDate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSLogPersistence endDate](self, "endDate"));
      v8 = objc_msgSend(v6, "compare:", v7);

      LOBYTE(v3) = v8 == (id)-1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

@end
