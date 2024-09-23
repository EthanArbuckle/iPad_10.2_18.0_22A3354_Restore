@implementation EKTTLEventTracker

+ (void)trackTTLCandidateEventHasSuggestedLocation:(BOOL)a3 isOnSharedCalendar:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v4 = a4;
  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("hasSuggestedLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("isOnSharedCalendar");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CalAnalyticsSendEvent((uint64_t)CFSTR("CalendarEventTTL.ttlCandidateEvent"), v7);
}

+ (void)trackEventFiredTTLAlertWithAlertType:(unint64_t)a3 transportType:(unint64_t)a4 etaType:(unint64_t)a5 travelState:(unint64_t)a6 hasSuggestedLocation:(BOOL)a7 isOnSharedCalendar:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v8 = a8;
  v9 = a7;
  v22[6] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("alertType");
  objc_msgSend(a1, "_valueForAlertType:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v21[1] = CFSTR("transportType");
  objc_msgSend(a1, "_valueForTransportType:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v15;
  v21[2] = CFSTR("etaType");
  objc_msgSend(a1, "_valueForETAType:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v16;
  v21[3] = CFSTR("travelState");
  objc_msgSend(a1, "_valueForTravelState:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("hasSuggestedLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v18;
  v21[5] = CFSTR("isOnSharedCalendar");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  CalAnalyticsSendEvent((uint64_t)CFSTR("CalendarEventTTL.eventFiredTTLAlert"), v20);
}

+ (void)trackDirectionsEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v6 = a6;
  v7 = a5;
  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("transportType");
  objc_msgSend(a1, "_valueForTransportType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v15[1] = CFSTR("etaType");
  objc_msgSend(a1, "_valueForETAType:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v15[2] = CFSTR("hasSuggestedLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  v15[3] = CFSTR("isOnSharedCalendar");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  CalAnalyticsSendEvent((uint64_t)CFSTR("CalendarEventTTL.directionsEngaged"), v14);
}

+ (void)trackEmailEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v6 = a6;
  v7 = a5;
  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("transportType");
  objc_msgSend(a1, "_valueForTransportType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v15[1] = CFSTR("etaType");
  objc_msgSend(a1, "_valueForETAType:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v15[2] = CFSTR("hasSuggestedLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  v15[3] = CFSTR("isOnSharedCalendar");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  CalAnalyticsSendEvent((uint64_t)CFSTR("CalendarEventTTL.emailEngaged"), v14);
}

+ (id)_valueForAlertType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Approaching Departure");
  if (a3 == 1)
    v3 = CFSTR("Leave Now");
  if (a3 == 2)
    return CFSTR("Late");
  else
    return (id)v3;
}

+ (id)_valueForTransportType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E2A83C78 + a3 - 1);
}

+ (id)_valueForETAType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Short");
  if (a3 == 1)
    v3 = CFSTR("Medium");
  if (a3 == 2)
    return CFSTR("Long");
  else
    return (id)v3;
}

+ (id)_valueForTravelState:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1E2A83C90 + a3 - 1);
}

@end
