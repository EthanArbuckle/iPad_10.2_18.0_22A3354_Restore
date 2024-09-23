@implementation MKHTTPContentDate

- (MKHTTPContentDate)initWithHeaderValue:(id)a3
{
  id v4;
  MKHTTPContentDate *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MKHTTPContentDate *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKHTTPContentDate;
  v5 = -[MKHTTPContentDate init](&v12, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocale:", v7);
    objc_msgSend(v6, "setTimeZone:", v8);
    objc_msgSend(v6, "setDateFormat:", CFSTR("EEE',' dd MMM yyyy HH':'mm':'ss z"));
    objc_msgSend(v6, "dateFromString:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPContentDate setDate:](v5, "setDate:", v9);

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
