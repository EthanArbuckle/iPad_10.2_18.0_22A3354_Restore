@implementation MTSyncSnooze

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[MTSyncSnooze syncDate](self, "syncDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setSyncDate:");

  -[MTSyncSnooze syncIdentifier](self, "syncIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncID:", v5);

  -[MTSyncSnooze syncVersion](self, "syncVersion");
  objc_msgSend(v3, "setSyncVersion:", v6);
  v7 = (void *)objc_opt_new();
  -[MTSyncSnooze snoozeDate](self, "snoozeDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "setSnoozeDate:");

  objc_msgSend(v3, "setSnoozeAction:", v7);
  return v3;
}

+ (id)deserialize:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTSyncSnooze+ProtoBuffer.m"), 31, CFSTR("Unsupported class for action %@"), objc_opt_class());

  }
  v6 = v5;
  if (objc_msgSend(v6, "hasSnoozeAction"))
  {
    objc_msgSend(v6, "snoozeAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "snoozeDate");
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "syncDate");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncVersion");
    *(float *)&v13 = v13;
    +[MTSyncSnooze syncSnoozeOfObjectWithIdentifier:snoozeDate:date:version:](MTSyncSnooze, "syncSnoozeOfObjectWithIdentifier:snoozeDate:date:version:", v8, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTSyncSnooze+ProtoBuffer.m"), 40, CFSTR("Unexpected codeable: %@"), v6);
    v14 = 0;
  }

  return v14;
}

- (id)initFromDeserializer:(id)a3
{
  void *v4;
  void *v5;
  MTPBSyncMessage *v6;
  void *v7;

  objc_msgSend(a3, "mtCoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTPBSyncMessage initWithData:]([MTPBSyncMessage alloc], "initWithData:", v5);
  objc_msgSend((id)objc_opt_class(), "deserialize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)serializeWithSerializer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "mtCoder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MTSyncSnooze serialize](self, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("data"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 2;
}

+ (id)syncSnoozeOfObjectWithIdentifier:(id)a3 snoozeDate:(id)a4 date:(id)a5
{
  double v5;

  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(a1, "syncSnoozeOfObjectWithIdentifier:snoozeDate:date:version:", a3, a4, a5, v5);
}

+ (id)syncSnoozeOfObjectWithIdentifier:(id)a3 snoozeDate:(id)a4 date:(id)a5 version:(float)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  void *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  *(float *)&v14 = a6;
  v15 = (void *)objc_msgSend(v13, "initWithSnoozedObjectIdentifier:snoozeDate:date:version:", v12, v11, v10, v14);

  return v15;
}

- (MTSyncSnooze)initWithSnoozedObjectIdentifier:(id)a3 snoozeDate:(id)a4 date:(id)a5 version:(float)a6
{
  id v11;
  id v12;
  id v13;
  MTSyncSnooze *v14;
  MTSyncSnooze *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTSyncSnooze;
  v14 = -[MTSyncSnooze init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_snoozeDate, a4);
    objc_storeStrong((id *)&v15->_date, a5);
    v15->_syncVersion = a6;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  MTSyncSnooze *v4;
  MTSyncSnooze *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;

  v4 = (MTSyncSnooze *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MTSyncSnooze date](self, "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTSyncSnooze date](v5, "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToDate:", v7))
      {
        -[MTSyncSnooze snoozeDate](self, "snoozeDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTSyncSnooze snoozeDate](v5, "snoozeDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[MTSyncSnooze identifier](self, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MTSyncSnooze identifier](v5, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", v11))
          {
            -[MTSyncSnooze syncVersion](self, "syncVersion");
            v13 = v12;
            -[MTSyncSnooze syncVersion](v5, "syncVersion");
            v15 = v13 == v14;
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (NSString)syncIdentifier
{
  return self->_identifier;
}

- (NSDate)syncDate
{
  return self->_date;
}

- (unint64_t)syncType
{
  return 0;
}

- (BOOL)conflicts:(id)a3
{
  return objc_msgSend(a3, "syncType") == 0;
}

- (id)preferred:(id)a3
{
  MTSyncSnooze *v4;
  void *v5;
  void *v6;
  MTSyncSnooze *v7;
  MTSyncSnooze *v8;

  v4 = (MTSyncSnooze *)a3;
  -[MTSyncSnooze syncDate](self, "syncDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSyncSnooze syncDate](v4, "syncDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mtIsAfterDate:", v6))
    v7 = self;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTSyncSnooze syncIdentifier](self, "syncIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSyncSnooze snoozeDate](self, "snoozeDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSyncSnooze date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ snoozeDate: %@ (%@)>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSDate)snoozeDate
{
  return self->_snoozeDate;
}

- (void)setSnoozeDate:(id)a3
{
  objc_storeStrong((id *)&self->_snoozeDate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (float)syncVersion
{
  return self->_syncVersion;
}

- (void)setSyncVersion:(float)a3
{
  self->_syncVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_snoozeDate, 0);
}

@end
