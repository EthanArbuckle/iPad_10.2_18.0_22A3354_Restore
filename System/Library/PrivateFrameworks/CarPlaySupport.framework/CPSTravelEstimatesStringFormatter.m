@implementation CPSTravelEstimatesStringFormatter

- (CPSTravelEstimatesStringFormatter)init
{
  NSCalendar *v2;
  NSCalendar *calendar;
  CPSTravelEstimatesStringFormatter *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  SEL v11;
  CPSTravelEstimatesStringFormatter *v12;

  v11 = a2;
  v12 = 0;
  v10.receiver = self;
  v10.super_class = (Class)CPSTravelEstimatesStringFormatter;
  v12 = -[CPSTravelEstimatesStringFormatter init](&v10, sel_init);
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v6 = v9;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    objc_msgSend(v6, "setLocale:");

    objc_msgSend(v9, "setDateStyle:");
    objc_msgSend(v9, "setTimeStyle:", 1);
    objc_msgSend(v9, "setAMSymbol:");
    objc_msgSend(v9, "setPMSymbol:", &stru_24E271FF0);
    objc_storeStrong((id *)&v12->_arrivalTimeFormatter, v9);
    v8 = objc_alloc_init(MEMORY[0x24BDD14F8]);
    objc_msgSend(v8, "setUnitsStyle:", 0);
    objc_storeStrong((id *)&v12->_remainingTimeFormatter, v8);
    v2 = (NSCalendar *)(id)objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    calendar = v12->_calendar;
    v12->_calendar = v2;

    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  v5 = v12;
  objc_storeStrong((id *)&v12, 0);
  return v5;
}

- (double)_minuteRoundedTimeRemainingForTravelEstimates:(id)a3
{
  double v3;
  long double v4;
  double v6;
  double v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "timeRemaining");
  v6 = v3;
  objc_msgSend(location[0], "timeRemaining");
  v7 = v6 - fmod(v4, 60.0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)generateTravelEstimatesStringsForTravelEstimates:(id)a3
{
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  CPSTravelEstimatesStrings *v13;
  id v14;
  NSDateComponentsFormatter *v15;
  NSDateComponentsFormatter *v16;
  NSDateComponentsFormatter *v17;
  NSDateFormatter *v18;
  NSCalendar *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSString *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(id *, void *, void *);
  void *v36;
  CPSTravelEstimatesStrings *v37;
  char v38;
  id v39;
  char v40;
  id v41;
  id v42;
  CPSTravelEstimatesStrings *v43;
  id location[2];
  CPSTravelEstimatesStringFormatter *v45;

  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = objc_alloc_init(CPSTravelEstimatesStrings);
  v24 = CPSLocalizedStringForKey(CFSTR("ARRIVAL"));
  -[CPSTravelEstimatesStrings setLocalizedArrivalString:](v43, "setLocalizedArrivalString:");

  v42 = (id)objc_msgSend(location[0], "distanceRemaining");
  if (v42 && (objc_msgSend(v42, "doubleValue"), v3 >= 0.0))
  {
    v21 = v42;
    v32 = MEMORY[0x24BDAC760];
    v33 = -1073741824;
    v34 = 0;
    v35 = __86__CPSTravelEstimatesStringFormatter_generateTravelEstimatesStringsForTravelEstimates___block_invoke;
    v36 = &unk_24E270D88;
    v37 = v43;
    CPSFormattedDistanceSepartedShortUnit(v21, &v32);
    objc_storeStrong((id *)&v37, 0);
  }
  else
  {
    -[CPSTravelEstimatesStrings setDistanceRemainingString:](v43, "setDistanceRemainingString:", 0x24E2723F0);
    v23 = (id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v40 = 0;
    v38 = 0;
    if ((objc_msgSend(v23, "usesMetricSystem") & 1) != 0)
    {
      v41 = CPSLocalizedStringForKey(CFSTR("KMS"));
      v40 = 1;
      v22 = v41;
    }
    else
    {
      v39 = CPSLocalizedStringForKey(CFSTR("MI"));
      v38 = 1;
      v22 = v39;
    }
    -[CPSTravelEstimatesStrings setLocalizedDistanceRemainingUnit:](v43, "setLocalizedDistanceRemainingUnit:", v22);
    if ((v38 & 1) != 0)

    if ((v40 & 1) != 0)
  }
  objc_msgSend(location[0], "timeRemaining");
  if (v4 >= 0.0)
  {
    -[CPSTravelEstimatesStringFormatter _minuteRoundedTimeRemainingForTravelEstimates:](v45, "_minuteRoundedTimeRemainingForTravelEstimates:", location[0]);
    v31 = v5;
    v30 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v29 = (id)objc_msgSend(v30, "dateByAddingTimeInterval:", v31);
    v18 = -[CPSTravelEstimatesStringFormatter arrivalTimeFormatter](v45, "arrivalTimeFormatter");
    v28 = -[NSDateFormatter stringFromDate:](v18, "stringFromDate:", v29);

    -[CPSTravelEstimatesStrings setArrivalTimeString:](v43, "setArrivalTimeString:", v28);
    v19 = -[CPSTravelEstimatesStringFormatter calendar](v45, "calendar");
    v27 = -[NSCalendar components:fromDate:toDate:options:](v19, "components:fromDate:toDate:options:", 96, v30, v29, 0);

    if (v27)
    {
      v17 = -[CPSTravelEstimatesStringFormatter remainingTimeFormatter](v45, "remainingTimeFormatter");
      -[NSDateComponentsFormatter setAllowedUnits:](v17, "setAllowedUnits:", 96);

      if (objc_msgSend(v27, "hour") >= 10)
      {
        objc_msgSend(v27, "setMinute:", 0);
        v16 = -[CPSTravelEstimatesStringFormatter remainingTimeFormatter](v45, "remainingTimeFormatter");
        -[NSDateComponentsFormatter setAllowedUnits:](v16, "setAllowedUnits:", 32);

      }
      v15 = -[CPSTravelEstimatesStringFormatter remainingTimeFormatter](v45, "remainingTimeFormatter");
      v26 = -[NSDateComponentsFormatter stringFromDateComponents:](v15, "stringFromDateComponents:", v27);

      v25 = 0;
      if (objc_msgSend(v27, "hour") <= 1)
      {
        if (objc_msgSend(v27, "hour") == 1)
        {
          v8 = CPSLocalizedStringForKey(CFSTR("HR"));
          v9 = v25;
          v25 = v8;

        }
        else
        {
          if (objc_msgSend(v27, "minute") <= 1)
            v10 = CPSLocalizedStringForKey(CFSTR("MIN"));
          else
            v10 = CPSLocalizedStringForKey(CFSTR("MINS"));
          v11 = v25;
          v25 = v10;

        }
      }
      else
      {
        v6 = CPSLocalizedStringForKey(CFSTR("HRS"));
        v7 = v25;
        v25 = v6;

      }
      -[CPSTravelEstimatesStrings setTimeRemainingString:](v43, "setTimeRemainingString:", v26);
      -[CPSTravelEstimatesStrings setLocalizedTimeRemainingUnit:](v43, "setLocalizedTimeRemainingUnit:", v25);
      objc_storeStrong(&v25, 0);
      objc_storeStrong((id *)&v26, 0);
    }
    else
    {
      -[CPSTravelEstimatesStrings setArrivalTimeString:](v43, "setArrivalTimeString:", 0x24E2723F0);
      -[CPSTravelEstimatesStrings setTimeRemainingString:](v43, "setTimeRemainingString:", 0x24E2723F0);
      v14 = CPSLocalizedStringForKey(CFSTR("MINS"));
      -[CPSTravelEstimatesStrings setLocalizedTimeRemainingUnit:](v43, "setLocalizedTimeRemainingUnit:");

    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    -[CPSTravelEstimatesStrings setArrivalTimeString:](v43, "setArrivalTimeString:", 0x24E2723F0);
    -[CPSTravelEstimatesStrings setTimeRemainingString:](v43, "setTimeRemainingString:", 0x24E2723F0);
    v20 = CPSLocalizedStringForKey(CFSTR("MINS"));
    -[CPSTravelEstimatesStrings setLocalizedTimeRemainingUnit:](v43, "setLocalizedTimeRemainingUnit:");

  }
  v13 = v43;
  objc_storeStrong(&v42, 0);
  objc_storeStrong((id *)&v43, 0);
  objc_storeStrong(location, 0);
  return v13;
}

void __86__CPSTravelEstimatesStringFormatter_generateTravelEstimatesStringsForTravelEstimates___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  objc_msgSend(a1[4], "setDistanceRemainingString:", location[0]);
  objc_msgSend(a1[4], "setLocalizedDistanceRemainingUnit:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (NSDateFormatter)arrivalTimeFormatter
{
  return self->_arrivalTimeFormatter;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSDateComponentsFormatter)remainingTimeFormatter
{
  return self->_remainingTimeFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_arrivalTimeFormatter, 0);
}

@end
