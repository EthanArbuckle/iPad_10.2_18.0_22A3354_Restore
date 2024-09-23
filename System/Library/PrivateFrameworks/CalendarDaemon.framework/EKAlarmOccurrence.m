@implementation EKAlarmOccurrence

+ (id)alarmOccurrenceWithAlarmID:(id)a3 ownerID:(id)a4 ownerDate:(id)a5 ownerTimeZone:(id)a6 ownerURI:(id)a7 fireDate:(id)a8 externalID:(id)a9 acknowledgedDate:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAlarmID:ownerID:ownerDate:ownerTimeZone:ownerURI:fireDate:externalID:acknowledgedDate:", v24, v23, v22, v21, v20, v19, v18, v17);

  return v25;
}

- (EKAlarmOccurrence)initWithAlarmID:(id)a3 ownerID:(id)a4 ownerDate:(id)a5 ownerTimeZone:(id)a6 ownerURI:(id)a7 fireDate:(id)a8 externalID:(id)a9 acknowledgedDate:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  EKAlarmOccurrence *v24;
  EKAlarmOccurrence *v25;
  uint64_t v26;
  NSDate *ownerDate;
  uint64_t v28;
  NSTimeZone *ownerTimeZone;
  uint64_t v30;
  NSURL *ownerURI;
  uint64_t v32;
  NSDate *fireDate;
  uint64_t v34;
  NSString *externalID;
  uint64_t v36;
  NSDate *acknowledgedDate;
  id v39;
  objc_super v40;

  v39 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)EKAlarmOccurrence;
  v24 = -[EKAlarmOccurrence init](&v40, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_alarmID, a3);
    objc_storeStrong((id *)&v25->_ownerID, a4);
    v26 = objc_msgSend(v18, "copy");
    ownerDate = v25->_ownerDate;
    v25->_ownerDate = (NSDate *)v26;

    v28 = objc_msgSend(v19, "copy");
    ownerTimeZone = v25->_ownerTimeZone;
    v25->_ownerTimeZone = (NSTimeZone *)v28;

    v30 = objc_msgSend(v20, "copy");
    ownerURI = v25->_ownerURI;
    v25->_ownerURI = (NSURL *)v30;

    v32 = objc_msgSend(v21, "copy");
    fireDate = v25->_fireDate;
    v25->_fireDate = (NSDate *)v32;

    v34 = objc_msgSend(v22, "copy");
    externalID = v25->_externalID;
    v25->_externalID = (NSString *)v34;

    v36 = objc_msgSend(v23, "copy");
    acknowledgedDate = v25->_acknowledgedDate;
    v25->_acknowledgedDate = (NSDate *)v36;

  }
  return v25;
}

- (EKAlarmOccurrence)initWithCoder:(id)a3
{
  id v4;
  EKAlarmOccurrence *v5;
  uint64_t v6;
  CADObjectID *alarmID;
  uint64_t v8;
  CADObjectID *ownerID;
  uint64_t v10;
  NSDate *ownerDate;
  uint64_t v12;
  NSTimeZone *ownerTimeZone;
  uint64_t v14;
  NSURL *ownerURI;
  uint64_t v16;
  NSDate *fireDate;
  uint64_t v18;
  NSString *externalID;
  uint64_t v20;
  NSDate *acknowledgedDate;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EKAlarmOccurrence;
  v5 = -[EKAlarmOccurrence init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("alarmID"));
    v6 = objc_claimAutoreleasedReturnValue();
    alarmID = v5->_alarmID;
    v5->_alarmID = (CADObjectID *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ownerID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerID = v5->_ownerID;
    v5->_ownerID = (CADObjectID *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ownerDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    ownerDate = v5->_ownerDate;
    v5->_ownerDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ownerTimeZone"));
    v12 = objc_claimAutoreleasedReturnValue();
    ownerTimeZone = v5->_ownerTimeZone;
    v5->_ownerTimeZone = (NSTimeZone *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ownerURI"));
    v14 = objc_claimAutoreleasedReturnValue();
    ownerURI = v5->_ownerURI;
    v5->_ownerURI = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("fireDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("externalID"));
    v18 = objc_claimAutoreleasedReturnValue();
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("acknowledgedDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    acknowledgedDate = v5->_acknowledgedDate;
    v5->_acknowledgedDate = (NSDate *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CADObjectID *alarmID;
  id v5;

  alarmID = self->_alarmID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alarmID, CFSTR("alarmID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerID, CFSTR("ownerID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerDate, CFSTR("ownerDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerTimeZone, CFSTR("ownerTimeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerURI, CFSTR("ownerURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fireDate, CFSTR("fireDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalID, CFSTR("externalID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acknowledgedDate, CFSTR("acknowledgedDate"));

}

- (EKAlarmOccurrence)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  EKAlarmOccurrence *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  CADObjectID *alarmID;
  id v11;
  void *v12;
  uint64_t v13;
  CADObjectID *ownerID;
  void *v15;
  uint64_t v16;
  NSDate *ownerDate;
  void *v18;
  uint64_t v19;
  NSTimeZone *ownerTimeZone;
  void *v21;
  uint64_t v22;
  NSURL *ownerURI;
  void *v24;
  uint64_t v25;
  NSDate *fireDate;
  void *v27;
  uint64_t v28;
  NSString *externalID;
  void *v30;
  uint64_t v31;
  NSDate *acknowledgedDate;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EKAlarmOccurrence;
  v5 = -[EKAlarmOccurrence init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ownerTimeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D0BAF8]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alarmID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithDictionaryRepresentation:", v8);
    alarmID = v5->_alarmID;
    v5->_alarmID = (CADObjectID *)v9;

    v11 = objc_alloc(MEMORY[0x1E0D0BAF8]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ownerID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithDictionaryRepresentation:", v12);
    ownerID = v5->_ownerID;
    v5->_ownerID = (CADObjectID *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ownerDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    ownerDate = v5->_ownerDate;
    v5->_ownerDate = (NSDate *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ownerTimeZone"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v6);
      ownerTimeZone = v5->_ownerTimeZone;
      v5->_ownerTimeZone = (NSTimeZone *)v19;
    }
    else
    {
      ownerTimeZone = v5->_ownerTimeZone;
      v5->_ownerTimeZone = 0;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ownerURI"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    ownerURI = v5->_ownerURI;
    v5->_ownerURI = (NSURL *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fireDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v25;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("externalID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acknowledgedDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    acknowledgedDate = v5->_acknowledgedDate;
    v5->_acknowledgedDate = (NSDate *)v31;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CADObjectID *alarmID;
  void *v5;
  CADObjectID *ownerID;
  void *v7;
  NSDate *ownerDate;
  NSTimeZone *ownerTimeZone;
  void *v10;
  NSURL *ownerURI;
  NSDate *fireDate;
  NSString *externalID;
  NSDate *acknowledgedDate;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  alarmID = self->_alarmID;
  if (alarmID)
  {
    -[CADObjectID dictionaryRepresentation](alarmID, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("alarmID"));

  }
  ownerID = self->_ownerID;
  if (ownerID)
  {
    -[CADObjectID dictionaryRepresentation](ownerID, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ownerID"));

  }
  ownerDate = self->_ownerDate;
  if (ownerDate)
    objc_msgSend(v3, "setObject:forKey:", ownerDate, CFSTR("ownerDate"));
  ownerTimeZone = self->_ownerTimeZone;
  if (ownerTimeZone)
  {
    -[NSTimeZone name](ownerTimeZone, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ownerTimeZone"));

  }
  ownerURI = self->_ownerURI;
  if (ownerURI)
    objc_msgSend(v3, "setObject:forKey:", ownerURI, CFSTR("ownerURI"));
  fireDate = self->_fireDate;
  if (fireDate)
    objc_msgSend(v3, "setObject:forKey:", fireDate, CFSTR("fireDate"));
  externalID = self->_externalID;
  if (externalID)
    objc_msgSend(v3, "setObject:forKey:", externalID, CFSTR("externalID"));
  acknowledgedDate = self->_acknowledgedDate;
  if (acknowledgedDate)
    objc_msgSend(v3, "setObject:forKey:", acknowledgedDate, CFSTR("acknowledgedDate"));
  return v3;
}

- (CADObjectID)alarmID
{
  return self->_alarmID;
}

- (CADObjectID)ownerID
{
  return self->_ownerID;
}

- (NSDate)ownerDate
{
  return self->_ownerDate;
}

- (NSTimeZone)ownerTimeZone
{
  return self->_ownerTimeZone;
}

- (NSURL)ownerURI
{
  return self->_ownerURI;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSDate)acknowledgedDate
{
  return self->_acknowledgedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgedDate, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_ownerURI, 0);
  objc_storeStrong((id *)&self->_ownerTimeZone, 0);
  objc_storeStrong((id *)&self->_ownerDate, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end
