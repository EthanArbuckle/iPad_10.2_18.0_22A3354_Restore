@implementation NSDate(GCSJSONSerializable)

+ (id)dateFormatter
{
  id v0;

  v0 = objc_alloc_init((Class)&off_254DF5618);
  objc_msgSend(v0, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
  return v0;
}

- (id)initWithJSONObject:()GCSJSONSerializable
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    +[NSDate dateFormatter](&off_254DF3E30, "dateFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "timeIntervalSince1970");
    a1 = (id)objc_msgSend(a1, "initWithTimeIntervalSince1970:");

    v8 = a1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)jsonObject
{
  void *v2;
  void *v3;

  +[NSDate dateFormatter](&off_254DF3E30, "dateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
