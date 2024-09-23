@implementation CDBLogInitIfNeeded

void __CDBLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;

  v0 = os_log_create("com.apple.calendar.database", "CalendarDatabase");
  v1 = (void *)CDBLogHandle;
  CDBLogHandle = (uint64_t)v0;

  v2 = os_log_create("com.apple.calendar.database", "WidgetReload");
  v3 = (void *)CDBWidgetReloadHandle;
  CDBWidgetReloadHandle = (uint64_t)v2;

  v4 = os_log_create("com.apple.calendar.database", "iCalendarConversion");
  v5 = (void *)CDBiCalendarConversionHandle;
  CDBiCalendarConversionHandle = (uint64_t)v4;

  v6 = os_log_create("com.apple.calendar.database", "SQLProfile");
  v7 = (void *)CDBSQLProfileHandle;
  CDBSQLProfileHandle = (uint64_t)v6;

  v8 = os_log_create("com.apple.calendar.database", "CalendarDatabasePerf");
  v9 = (void *)CDBPerfSignpostsHandle;
  CDBPerfSignpostsHandle = (uint64_t)v8;

}

@end
