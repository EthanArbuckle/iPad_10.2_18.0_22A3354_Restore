@implementation NSDate(EmailCoreAdditions)

- (id)ec_descriptionForMimeHeaders
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("EEE, d MMM yyyy HH:mm:ss ZZ"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "ef_posixLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "stringFromDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)ec_integerDate
{
  void *v1;
  double v2;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timeIntervalSince1970");
  return objc_msgSend(v1, "dateWithTimeIntervalSince1970:", floor(v2));
}

@end
