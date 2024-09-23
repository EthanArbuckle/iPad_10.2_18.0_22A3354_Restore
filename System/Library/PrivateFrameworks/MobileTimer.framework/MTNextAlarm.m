@implementation MTNextAlarm

- (NSURL)clockAppSectionURL
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (-[MTNextAlarm isSleepAlarm](self, "isSleepAlarm"))
    v3 = CFSTR("clock-sleep-alarm");
  else
    v3 = CFSTR("clock-alarm");
  return (NSURL *)objc_msgSend(v2, "mtURLForScheme:", v3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)MTNextAlarm;
  -[MTNextAlarm description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTNextAlarm title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTNextAlarm fireDate](self, "fireDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTNextAlarm identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTNextAlarm clockAppSectionURL](self, "clockAppSectionURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] title: [%@] fireDate: [%@] identifier: [%@] clockAppSectionURL: [%@]"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (void)setIsSleepAlarm:(BOOL)a3
{
  self->_isSleepAlarm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
