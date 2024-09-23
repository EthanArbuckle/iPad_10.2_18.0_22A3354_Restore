@implementation LocalEventViewControllerTestCase

- (id)controller
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calendar%d.db"), rand());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithOptions:path:", 44, v4);
  objc_msgSend(MEMORY[0x1E0CAA060], "eventWithEventStore:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", CFSTR("EventTestTitle"));
  objc_msgSend(v5, "defaultCalendarForNewEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendar:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStartDate:", v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 3600.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEndDateUnadjustedForLegacyClients:", v9);

  objc_msgSend(v5, "saveEvent:span:commit:error:", v6, 0, 1, 0);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setEvent:", v6);

  return v10;
}

@end
