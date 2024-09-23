@implementation DSDateFormatter

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1)
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_1);
  return (id)sharedFormatter_singleton;
}

void __34__DSDateFormatter_sharedFormatter__block_invoke()
{
  DSDateFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(DSDateFormatter);
  v1 = (void *)sharedFormatter_singleton;
  sharedFormatter_singleton = (uint64_t)v0;

}

- (DSDateFormatter)init
{
  DSDateFormatter *v2;
  uint64_t v3;
  NSMutableDictionary *dateFormatters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSDateFormatter;
  v2 = -[DSDateFormatter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    dateFormatters = v2->_dateFormatters;
    v2->_dateFormatters = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (DSDateFormatter)formatterWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  -[DSDateFormatter dateFormatters](self, "dateFormatters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DSDateFormatter dateFormatters](self, "dateFormatters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v10, "setLocale:", v11);

    objc_msgSend(v10, "setFormatterBehavior:", 1040);
    switch(a3)
    {
      case 0:
        v12 = CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ");
        goto LABEL_11;
      case 1:
        objc_msgSend(v10, "setDateFormat:", CFSTR("MM/dd/YYYY HH:mm:ss ZZZ"));
        objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTimeZone:", v13);
        goto LABEL_7;
      case 2:
        objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
        objc_msgSend(MEMORY[0x24BDBCEA0], "systemLocale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLocale:", v13);
LABEL_7:

        break;
      case 3:
        v12 = CFSTR("yyyy-MM-dd");
        goto LABEL_11;
      case 4:
        v12 = CFSTR("EEE MMM dd HH:mm:ss z yyyy");
        goto LABEL_11;
      case 5:
        v12 = CFSTR("yyyy-MM-dd HH.mm.ss.SSS Z");
LABEL_11:
        objc_msgSend(v10, "setDateFormat:", v12);
        break;
      case 6:
        objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLocale:", v14);

        objc_msgSend(v10, "setDateStyle:", 3);
        objc_msgSend(v10, "setTimeStyle:", 1);
        objc_msgSend(v10, "setDoesRelativeDateFormatting:", 1);
        break;
      default:
        break;
    }
    -[DSDateFormatter dateFormatters](self, "dateFormatters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
  }

  return (DSDateFormatter *)v10;
}

- (NSMutableDictionary)dateFormatters
{
  return self->_dateFormatters;
}

- (void)setDateFormatters:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatters, 0);
}

@end
