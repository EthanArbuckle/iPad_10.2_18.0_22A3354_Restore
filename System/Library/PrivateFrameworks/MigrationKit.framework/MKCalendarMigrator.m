@implementation MKCalendarMigrator

- (MKCalendarMigrator)init
{
  MKCalendarMigrator *v2;
  EKEventStore *v3;
  EKEventStore *eventStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKCalendarMigrator;
  v2 = -[MKMigrator init](&v6, sel_init);
  if (v2)
  {
    v3 = (EKEventStore *)objc_alloc_init(MEMORY[0x24BDC74E8]);
    eventStore = v2->_eventStore;
    v2->_eventStore = v3;

    -[MKMigrator setType:](v2, "setType:", 4);
  }
  return v2;
}

- (void)importiCal:(id)a3
{
  MKCalendarMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKCalendarMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  MKCalendarMigrator *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLog log](MKLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "%@ will import iCal.", (uint8_t *)&v24, 0xCu);
  }

  -[EKEventStore defaultCalendarForNewEvents](self->_eventStore, "defaultCalendarForNewEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore importICSData:intoCalendar:options:](self->_eventStore, "importICSData:intoCalendar:options:", v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore reset](self->_eventStore, "reset");
  if (objc_msgSend(v8, "count"))
  {
    -[MKMigrator migratorDidImportWithCount:](self, "migratorDidImportWithCount:", objc_msgSend(v8, "count"));
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v4, "length"));
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_21EC08000, v9, OS_LOG_TYPE_INFO, "%@ EKEventStore was failed to import data.", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKCalendarError"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_msgSend(v11, "mk_occurrenceCountOfString:", CFSTR("BEGIN:VCALENDAR"));
      if (v12 <= 1)
        v13 = 1;
      else
        v13 = v12;
      -[MKMigrator migratorDidFailWithImportError:count:](self, "migratorDidFailWithImportError:count:", v10, v13);
    }
    else
    {
      -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v10);
    }

  }
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  objc_msgSend(v14, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "calendars");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v5);
  v19 = v18;

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v19);
  objc_msgSend(v16, "importElapsedTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "decimalNumberByAdding:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImportElapsedTime:", v22);

  objc_sync_exit(v14);
  +[MKLog log](MKLog, "log");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_21EC08000, v23, OS_LOG_TYPE_INFO, "%@ did import iCal.", (uint8_t *)&v24, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
