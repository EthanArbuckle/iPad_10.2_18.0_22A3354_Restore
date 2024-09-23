@implementation NUNIMoonPhaseModel

- (NUNIMoonPhaseModel)initWithDate:(id)a3 location:(id)a4
{
  id v7;
  id v8;
  NUNIMoonPhaseModel *v9;
  NUNIMoonPhaseModel *v10;
  CLLocation *location;
  double v12;
  double v13;
  double v14;
  double v15;
  void *eventDate;
  double v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSString *phaseName;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  id v40;
  void *v41;
  uint64_t v42;
  objc_super v43;
  uint8_t buf[4];
  unint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)NUNIMoonPhaseModel;
  v9 = -[NUNIMoonPhaseModel init](&v43, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryDate, a3);
    objc_storeStrong((id *)&v10->_location, a4);
    location = v10->_location;
    if (!location)
    {
      NUNILoggingObjectForDomain(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2134A1000, v23, OS_LOG_TYPE_DEFAULT, "NTKMoonPhaseUtilities found no location", buf, 2u);
      }

      NUNILocalizedString(CFSTR("MOONPHASE_UNKNOWN"));
      v24 = objc_claimAutoreleasedReturnValue();
      phaseName = v10->_phaseName;
      v10->_phaseName = (NSString *)v24;

      v10->_phaseNumber = 0;
      v10->_hemisphere = -1;
      v10->_event = -1;
      eventDate = v10->_eventDate;
      v10->_eventDate = 0;
      goto LABEL_21;
    }
    -[CLLocation coordinate](location, "coordinate");
    v13 = v12;
    v15 = v14;
    eventDate = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CB88]), "initWithLocation:date:body:", v7, 4, v12, v14);
    NUNIMoonPhaseAngleFromEphemeris(eventDate);
    v18 = vcvtmd_u64_f64((v17 + 180.0) / 360.0 * 112.0 + 0.5);
    v10->_phaseNumber = v18 - 112 * (((v18 >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64);
    v10->_hemisphere = v13 <= 0.0;
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NUNIMoonPhaseDescription(v7, v19, v13, v15);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v10->_phaseName;
    v10->_phaseName = (NSString *)v20;

    objc_msgSend(eventDate, "rise");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "compare:", v7) == -1)
    {
      objc_msgSend(eventDate, "set");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "compare:", v7);

      if (v27 != -1)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_alloc(MEMORY[0x24BE3CB88]);
      objc_msgSend(v22, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "initWithLocation:date:body:", v41, 4, v13, v15);

      eventDate = (void *)v42;
    }

LABEL_9:
    v28 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(eventDate, "rise");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(eventDate, "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayWithObjects:", v7, v29, v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "sortUsingSelector:", sel_compare_);
    v32 = objc_msgSend(v31, "indexOfObject:", v7) + 1;
    NUNILoggingObjectForDomain(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v45 = v32;
      v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_2134A1000, v33, OS_LOG_TYPE_DEFAULT, "NTKMoonPhaseUtilities index:%ld times:[%@]", buf, 0x16u);
    }

    if (v32 >= objc_msgSend(v31, "count"))
    {
      NUNILoggingObjectForDomain(0);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2134A1000, v38, OS_LOG_TYPE_DEFAULT, "NTKMoonPhaseUtilities unknown event as we have old rise set times", buf, 2u);
      }

      v7 = 0;
      v10->_event = -1;
    }
    else
    {
      objc_msgSend(v31, "objectAtIndexedSubscript:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(eventDate, "rise");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqualToDate:", v35);

      v37 = 2;
      if (v36)
        v37 = 0;
      v10->_event = v37;
      if (v34)
      {
        CLKRoundDateDownToNearestMinute();
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
    }
    objc_storeStrong((id *)&v10->_eventDate, v7);

LABEL_21:
  }

  return v10;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)phaseName
{
  return self->_phaseName;
}

- (unint64_t)phaseNumber
{
  return self->_phaseNumber;
}

- (int64_t)hemisphere
{
  return self->_hemisphere;
}

- (int64_t)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseName, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
}

@end
