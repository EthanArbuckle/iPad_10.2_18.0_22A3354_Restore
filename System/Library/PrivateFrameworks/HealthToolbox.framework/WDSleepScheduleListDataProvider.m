@implementation WDSleepScheduleListDataProvider

- (WDSleepScheduleListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  WDSleepScheduleListDataProvider *v4;
  NSDateFormatter *v5;
  NSDateFormatter *standaloneFormatter;
  NSDateFormatter *v7;
  NSDateFormatter *listItemFormatter;
  uint64_t v9;
  NSCalendar *gregorianCalender;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WDSleepScheduleListDataProvider;
  v4 = -[WDSampleListDataProvider initWithDisplayType:profile:](&v12, sel_initWithDisplayType_profile_, a3, a4);
  if (v4)
  {
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    standaloneFormatter = v4->_standaloneFormatter;
    v4->_standaloneFormatter = v5;

    -[NSDateFormatter setFormattingContext:](v4->_standaloneFormatter, "setFormattingContext:", 2);
    v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    listItemFormatter = v4->_listItemFormatter;
    v4->_listItemFormatter = v7;

    -[NSDateFormatter setFormattingContext:](v4->_listItemFormatter, "setFormattingContext:", 5);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v9 = objc_claimAutoreleasedReturnValue();
    gregorianCalender = v4->_gregorianCalender;
    v4->_gregorianCalender = (NSCalendar *)v9;

  }
  return v4;
}

- (int64_t)cellStyle
{
  return 1;
}

- (unint64_t)numberOfSections
{
  void *v2;
  unint64_t v3;

  -[WDSampleListDataProvider samples](self, "samples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") > 0;

  return v3;
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDSleepScheduleListDataProvider;
  -[WDSampleListDataProvider removeObjectAtIndex:forSection:sectionRemoved:](&v7, sel_removeObjectAtIndex_forSection_sectionRemoved_, a3, a4);
  if (!-[WDSleepScheduleListDataProvider numberOfSections](self, "numberOfSections"))
    *a5 = 1;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SLEEP_SCHEDULE_ALL_DATA_TITLE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3F08], "sleepScheduleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textForObject:(id)a3
{
  return (id)objc_msgSend(a3, "hk_localizedScheduledSleepDuration");
}

- (id)secondaryTextForObject:(id)a3
{
  return (id)objc_msgSend(a3, "hk_localizedWeekdaysListWithGregorianCalendar:standaloneFormatter:listItemFormatter:", self->_gregorianCalender, self->_standaloneFormatter, self->_listItemFormatter);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalender, 0);
  objc_storeStrong((id *)&self->_listItemFormatter, 0);
  objc_storeStrong((id *)&self->_standaloneFormatter, 0);
}

@end
