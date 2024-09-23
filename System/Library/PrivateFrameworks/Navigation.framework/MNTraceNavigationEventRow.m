@implementation MNTraceNavigationEventRow

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MNTraceNavigationEventRow relativeTimestamp](self, "relativeTimestamp");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%0.2fs (%d)"), v5, -[MNTraceNavigationEventRow locationID](self, "locationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("YYYY-MM-dd h:mm:ss a"));
  -[MNTraceNavigationEventRow date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v9);
  -[MNTraceNavigationEventRow eventName](self, "eventName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MNTraceNavigationEventRow eventName](self, "eventName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[MNTraceNavigationEventRow eventDescription](self, "eventDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MNTraceNavigationEventRow eventDescription](self, "eventDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)relativeTimestamp
{
  return self->_relativeTimestamp;
}

- (void)setRelativeTimestamp:(double)a3
{
  self->_relativeTimestamp = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_locationID = a3;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (void)setEventDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)speakableEventDescription
{
  return self->_speakableEventDescription;
}

- (void)setSpeakableEventDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableEventDescription, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
