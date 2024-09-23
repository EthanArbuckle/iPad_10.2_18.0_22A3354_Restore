@implementation DNDSModeAssertionLifetimeRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionLifetimeRecord *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionLifetimeRecord);
    objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setLifetimeType:](v6, "setLifetimeType:", v7);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setEventUniqueID:](v6, "setEventUniqueID:", v8);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setOccurrenceDate:](v6, "setOccurrenceDate:", v9);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setOnlyDuringEvent:](v6, "setOnlyDuringEvent:", v10);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setStartDate:](v6, "setStartDate:", v11);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setEndDate:](v6, "setEndDate:", v12);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setScheduleIdentifier:](v6, "setScheduleIdentifier:", v13);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setBehavior:](v6, "setBehavior:", v14);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setLatitude:](v6, "setLatitude:", v15);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setLongitude:](v6, "setLongitude:", v16);

    objc_msgSend(v5, "bs_safeNumberForKey:", a4->var3.var10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setRadius:](v6, "setRadius:", v17);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var3.var11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionLifetimeRecord setRegionIdentifier:](v6, "setRegionIdentifier:", v18);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  char v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionLifetimeRecord lifetimeType](self, "lifetimeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v8, a3->var3.var0);

  -[DNDSModeAssertionLifetimeRecord eventUniqueID](self, "eventUniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v9, a3->var3.var1);

  -[DNDSModeAssertionLifetimeRecord occurrenceDate](self, "occurrenceDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var3.var2);

  -[DNDSModeAssertionLifetimeRecord onlyDuringEvent](self, "onlyDuringEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v11, a3->var3.var3);

  -[DNDSModeAssertionLifetimeRecord startDate](self, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v12, a3->var3.var4);

  -[DNDSModeAssertionLifetimeRecord endDate](self, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v13, a3->var3.var5);

  -[DNDSModeAssertionLifetimeRecord scheduleIdentifier](self, "scheduleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, a3->var3.var6);

  -[DNDSModeAssertionLifetimeRecord behavior](self, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v15, a3->var3.var7);

  -[DNDSModeAssertionLifetimeRecord latitude](self, "latitude");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v16, a3->var3.var8);

  -[DNDSModeAssertionLifetimeRecord longitude](self, "longitude");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v17, a3->var3.var9);

  -[DNDSModeAssertionLifetimeRecord radius](self, "radius");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v18, a3->var3.var10);

  -[DNDSModeAssertionLifetimeRecord regionIdentifier](self, "regionIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setSafeObject:forKey:", v19, a3->var3.var11);

  if ((v4 & 1) != 0)
  {
    -[DNDSModeAssertionLifetimeRecord startDate](self, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Local"), a3->var3.var4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v20, v21);

    -[DNDSModeAssertionLifetimeRecord endDate](self, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Local"), a3->var3.var5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dnds_setSafeLocalDateForTimestamp:key:", v22, v23);

  }
  return v7;
}

+ (id)recordForAssertionLifetime:(id)a3
{
  id v3;
  DNDSModeAssertionLifetimeRecord *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DNDSModeAssertionLifetimeRecord);
    v5 = objc_msgSend(v3, "lifetimeType");
    objc_msgSend(MEMORY[0x1E0CB3940], "dnds_stringForLifetimeType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionLifetimeRecord setLifetimeType:](v4, "setLifetimeType:", v6);

    switch(v5)
    {
      case 1:
        v7 = v3;
        objc_msgSend(v7, "eventUniqueID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setEventUniqueID:](v4, "setEventUniqueID:", v8);

        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "occurrenceDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dnds_safeNumberWithDate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setOccurrenceDate:](v4, "setOccurrenceDate:", v11);

        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = objc_msgSend(v7, "isOnlyDuringEvent");

        objc_msgSend(v12, "numberWithBool:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setOnlyDuringEvent:](v4, "setOnlyDuringEvent:", v14);
        goto LABEL_8;
      case 2:
        v15 = (void *)MEMORY[0x1E0CB37E8];
        v16 = v3;
        objc_msgSend(v16, "dateInterval");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dnds_numberWithDate:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setStartDate:](v4, "setStartDate:", v19);

        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v16, "dateInterval");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "endDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dnds_numberWithDate:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setEndDate:](v4, "setEndDate:", v22);

        goto LABEL_8;
      case 4:
        v23 = v3;
        objc_msgSend(v23, "scheduleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setScheduleIdentifier:](v4, "setScheduleIdentifier:", v24);

        v25 = (void *)MEMORY[0x1E0CB3940];
        v26 = objc_msgSend(v23, "behavior");

        objc_msgSend(v25, "dnds_stringForScheduleLifetimeBehavior:", v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setBehavior:](v4, "setBehavior:", v14);
        goto LABEL_8;
      case 5:
        v27 = (void *)MEMORY[0x1E0CB37E8];
        v28 = v3;
        objc_msgSend(v28, "region");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "center");
        objc_msgSend(v27, "numberWithDouble:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setLatitude:](v4, "setLatitude:", v30);

        v31 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "region");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "center");
        objc_msgSend(v31, "numberWithDouble:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setLongitude:](v4, "setLongitude:", v34);

        v35 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "region");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "radius");
        objc_msgSend(v35, "numberWithDouble:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setRadius:](v4, "setRadius:", v37);

        objc_msgSend(v28, "region");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionLifetimeRecord setRegionIdentifier:](v4, "setRegionIdentifier:", v38);

LABEL_8:
        break;
      default:
        break;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)object
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  NSObject *v31;

  -[DNDSModeAssertionLifetimeRecord lifetimeType](self, "lifetimeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dnds_lifetimeTypeValue");

  switch(v4)
  {
    case 1:
      -[DNDSModeAssertionLifetimeRecord eventUniqueID](self, "eventUniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord occurrenceDate](self, "occurrenceDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dnds_dateValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[DNDSModeAssertionLifetimeRecord onlyDuringEvent](self, "onlyDuringEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if (!v5)
        goto LABEL_17;
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D600]), "initWithEventUniqueID:occurrenceDate:onlyDuringEvent:", v5, v7, v9);
      goto LABEL_16;
    case 2:
      -[DNDSModeAssertionLifetimeRecord startDate](self, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dnds_dateValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[DNDSModeAssertionLifetimeRecord endDate](self, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dnds_dateValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      if (v5 && v7)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v7);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D610]), "initWithDateInterval:", v14);

      }
      goto LABEL_18;
    case 3:
      objc_msgSend(MEMORY[0x1E0D1D608], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      return v13;
    case 4:
      -[DNDSModeAssertionLifetimeRecord scheduleIdentifier](self, "scheduleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionLifetimeRecord behavior](self, "behavior");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v15;
      v13 = 0;
      if (!v5 || !v15)
        goto LABEL_18;
      v16 = objc_msgSend(v15, "dnds_scheduleLifetimeBehaviorValue");
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D638]), "initWithScheduleIdentifier:behavior:", v5, v16);
      goto LABEL_16;
    case 5:
      -[DNDSModeAssertionLifetimeRecord latitude](self, "latitude");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_20;
      v18 = (void *)v17;
      -[DNDSModeAssertionLifetimeRecord radius](self, "radius");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {

        goto LABEL_20;
      }
      v20 = (void *)v19;
      -[DNDSModeAssertionLifetimeRecord regionIdentifier](self, "regionIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_20:
        v31 = DNDSLogAssertionStore;
        if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_FAULT))
          -[DNDSModeAssertionLifetimeRecord object].cold.1((uint64_t)self, v31);
LABEL_22:
        v13 = 0;
        return v13;
      }
      -[DNDSModeAssertionLifetimeRecord latitude](self, "latitude");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;
      -[DNDSModeAssertionLifetimeRecord longitude](self, "longitude");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      -[DNDSModeAssertionLifetimeRecord radius](self, "radius");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

      -[DNDSModeAssertionLifetimeRecord regionIdentifier](self, "regionIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E368]), "initWithCenter:radius:identifier:", v5, v24, v27, v30);
      if (v7)
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D620]), "initWithRegion:", v7);
LABEL_16:
        v13 = (void *)v10;
      }
      else
      {
LABEL_17:
        v13 = 0;
      }
LABEL_18:

      return v13;
    default:
      goto LABEL_22;
  }
}

- (NSString)lifetimeType
{
  return self->_lifetimeType;
}

- (void)setLifetimeType:(id)a3
{
  objc_storeStrong((id *)&self->_lifetimeType, a3);
}

- (NSString)eventUniqueID
{
  return self->_eventUniqueID;
}

- (void)setEventUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_eventUniqueID, a3);
}

- (NSNumber)occurrenceDate
{
  return self->_occurrenceDate;
}

- (void)setOccurrenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceDate, a3);
}

- (NSNumber)onlyDuringEvent
{
  return self->_onlyDuringEvent;
}

- (void)setOnlyDuringEvent:(id)a3
{
  objc_storeStrong((id *)&self->_onlyDuringEvent, a3);
}

- (NSNumber)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSNumber)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)scheduleIdentifier
{
  return self->_scheduleIdentifier;
}

- (void)setScheduleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleIdentifier, a3);
}

- (NSString)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_behavior, a3);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (NSNumber)radius
{
  return self->_radius;
}

- (void)setRadius:(id)a3
{
  objc_storeStrong((id *)&self->_radius, a3);
}

- (NSString)regionIdentifier
{
  return self->_regionIdentifier;
}

- (void)setRegionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_regionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_radius, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_scheduleIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_onlyDuringEvent, 0);
  objc_storeStrong((id *)&self->_occurrenceDate, 0);
  objc_storeStrong((id *)&self->_eventUniqueID, 0);
  objc_storeStrong((id *)&self->_lifetimeType, 0);
}

- (void)object
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CB895000, a2, OS_LOG_TYPE_FAULT, "Missing parameters of region trigger: %@", (uint8_t *)&v2, 0xCu);
}

@end
