@implementation SiriCalendarSyncSystemSetting

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v7;

  v7 = a6;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("CalendarSystemSettingValidity")) & 1) == 0)
    objc_msgSend(v7, "resetWithValidity:", CFSTR("CalendarSystemSettingValidity"));

}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = (void *)MEMORY[0x24BDBCE48];
  v6 = a4;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", v8))
  {
    objc_msgSend(v6, "setPostAnchor:", v11);
    objc_msgSend(v6, "setObject:", 0);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BE810C0]);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("CalendarSystemSettingIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v10);

    objc_msgSend(v9, "setCalendarType:", v8);
    objc_msgSend(v6, "setObject:", v9);
    objc_msgSend(v6, "setPostAnchor:", v8);

  }
  objc_msgSend(v6, "setIsDelete:", 0);

}

@end
