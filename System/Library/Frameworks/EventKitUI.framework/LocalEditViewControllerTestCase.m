@implementation LocalEditViewControllerTestCase

- (id)controller
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CA9FF0], "calendarForEntityType:eventStore:", 0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", CFSTR("CalendarTestTitle"));
  objc_msgSend(v4, "setSource:", v3);
  objc_msgSend(MEMORY[0x1E0CAA060], "eventWithEventStore:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", CFSTR("EventTestTitle"));
  objc_msgSend(v5, "setCalendar:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartDate:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 3600.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndDateUnadjustedForLegacyClients:", v7);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setEvent:", v5);

  return v8;
}

@end
