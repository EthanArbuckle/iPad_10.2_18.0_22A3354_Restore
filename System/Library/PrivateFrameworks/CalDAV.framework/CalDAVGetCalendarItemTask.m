@implementation CalDAVGetCalendarItemTask

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CalDAVCalendarItemData *v9;
  void *v10;
  CalDAVCalendarItemData *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  -[CalDAVGetCalendarItemTask responseHeaders](self, "responseHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CDVObjectForKeyCaseInsensitive:", *MEMORY[0x24BE1AA80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalDAVGetCalendarItemTask responseBodyParser](self, "responseBodyParser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "octetStreamData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [CalDAVCalendarItemData alloc];
  -[CalDAVGetCalendarItemTask url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CoreDAVLeafDataPayload initWithURL:eTag:dataPayload:inContainerWithURL:withAccountInfoProvider:](v9, "initWithURL:eTag:dataPayload:inContainerWithURL:withAccountInfoProvider:", v10, v6, v8, 0, 0);

  -[CoreDAVGetTask setAppSpecificDataItemResult:](self, "setAppSpecificDataItemResult:", v11);
  -[CalDAVGetCalendarItemTask url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVLeafDataPayload setServerID:](v11, "setServerID:", v12);

  -[CalDAVGetCalendarItemTask responseHeaders](self, "responseHeaders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "CDVObjectForKeyCaseInsensitive:", CFSTR("Schedule-Tag"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarItemData setScheduleTag:](v11, "setScheduleTag:", v14);

  v15.receiver = self;
  v15.super_class = (Class)CalDAVGetCalendarItemTask;
  -[CoreDAVGetTask finishCoreDAVTaskWithError:](&v15, sel_finishCoreDAVTaskWithError_, v4);

}

@end
