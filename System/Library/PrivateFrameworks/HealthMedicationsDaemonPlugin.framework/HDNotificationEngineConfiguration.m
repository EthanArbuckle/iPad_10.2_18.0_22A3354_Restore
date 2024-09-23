@implementation HDNotificationEngineConfiguration

- (HDNotificationEngineConfiguration)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDNotificationEngineConfiguration)initWithCalendar:(id)a3 startGenerationDate:(id)a4 endGenerationDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDNotificationEngineConfiguration *v12;
  uint64_t v13;
  NSDate *startGenerationDate;
  uint64_t v15;
  NSDate *endGenerationDate;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDNotificationEngineConfiguration;
  v12 = -[HDNotificationEngineConfiguration init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    startGenerationDate = v12->_startGenerationDate;
    v12->_startGenerationDate = (NSDate *)v13;

    v15 = objc_msgSend(v11, "copy");
    endGenerationDate = v12->_endGenerationDate;
    v12->_endGenerationDate = (NSDate *)v15;

    objc_storeStrong((id *)&v12->_calendar, a3);
  }

  return v12;
}

- (NSDate)startGenerationDate
{
  return self->_startGenerationDate;
}

- (NSDate)endGenerationDate
{
  return self->_endGenerationDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_endGenerationDate, 0);
  objc_storeStrong((id *)&self->_startGenerationDate, 0);
}

@end
