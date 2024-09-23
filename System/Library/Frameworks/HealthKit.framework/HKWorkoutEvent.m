@implementation HKWorkoutEvent

uint64_t __30___HKWorkoutEvent_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)description___formatter;
  description___formatter = (uint64_t)v0;

  return objc_msgSend((id)description___formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

+ (id)_newWorkoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = -[HKWorkoutEvent _init]([HKWorkoutEvent alloc], "_init");
  v9[1] = a3;
  v10 = objc_msgSend(v8, "copy");

  v11 = (void *)v9[2];
  v9[2] = v10;

  if (v7)
  {
    v12 = objc_msgSend(v7, "copy");
    v13 = (void *)v9[3];
    v9[3] = v12;

  }
  return v9;
}

+ (id)_workoutEventWithType:(int64_t)a3 date:(id)a4 metadata:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v8 = (objc_class *)MEMORY[0x1E0CB3588];
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithStartDate:duration:", v10, 0.0);

  v12 = (void *)objc_msgSend(a1, "_newWorkoutEventWithType:dateInterval:metadata:", a3, v11, v9);
  v13 = HKDefaultObjectValidationConfiguration();
  objc_msgSend(v12, "_validateWithConfiguration:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {

    v12 = 0;
  }

  return v12;
}

+ (id)_workoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = (void *)objc_msgSend(a1, "_newWorkoutEventWithType:dateInterval:metadata:", a3, a4, a5);
  v6 = HKDefaultObjectValidationConfiguration();
  objc_msgSend(v5, "_validateWithConfiguration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

    v5 = 0;
  }
  return v5;
}

+ (id)_workoutEventWithInternalEvent:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v4 = -[HKWorkoutEvent _init]([HKWorkoutEvent alloc], "_init");
  v5 = objc_msgSend(v3, "eventType");
  v6 = 0;
  v7 = 1;
  switch(v5)
  {
    case 0:
    case 1:
    case 4:
    case 11:
    case 12:
    case 13:
    case 14:
      goto LABEL_11;
    case 2:
      goto LABEL_9;
    case 3:
      v7 = 2;
      goto LABEL_9;
    case 5:
      v7 = 3;
      goto LABEL_9;
    case 6:
      v7 = 4;
      goto LABEL_9;
    case 7:
      v7 = 5;
      goto LABEL_9;
    case 8:
      v7 = 6;
      goto LABEL_9;
    case 9:
      v7 = 7;
      goto LABEL_9;
    case 10:
      v7 = 8;
LABEL_9:
      v4[1] = v7;
      break;
    default:
      break;
  }
  objc_msgSend(v3, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  objc_msgSend(v3, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  v6 = v4;
LABEL_11:

  return v6;
}

+ (id)_unvalidatedWorkoutEventWithType:(int64_t)a3 dateInterval:(id)a4 metadata:(id)a5
{
  return (id)objc_msgSend(a1, "_newWorkoutEventWithType:dateInterval:metadata:", a3, a4, a5);
}

+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type date:(NSDate *)date
{
  objc_class *v6;
  NSDate *v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0CB3588];
  v7 = date;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithStartDate:duration:", v7, 0.0);

  v9 = (void *)objc_msgSend(a1, "_newWorkoutEventWithType:dateInterval:metadata:", type, v8, 0);
  objc_msgSend(v9, "_assertPropertiesValid");

  return (HKWorkoutEvent *)v9;
}

+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type date:(NSDate *)date metadata:(NSDictionary *)metadata
{
  objc_class *v7;
  NSDate *v8;
  void *v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x1E0CB3588];
  v8 = date;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithStartDate:duration:", v8, 0.0);

  v10 = (void *)objc_msgSend(a1, "_newWorkoutEventWithType:dateInterval:metadata:", type, v9, 0);
  objc_msgSend(v10, "_assertPropertiesValid");

  return (HKWorkoutEvent *)v10;
}

+ (HKWorkoutEvent)workoutEventWithType:(HKWorkoutEventType)type dateInterval:(NSDateInterval *)dateInterval metadata:(NSDictionary *)metadata
{
  void *v5;

  v5 = (void *)objc_msgSend(a1, "_newWorkoutEventWithType:dateInterval:metadata:", type, dateInterval, metadata);
  objc_msgSend(v5, "_assertPropertiesValid");
  return (HKWorkoutEvent *)v5;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;

  v3 = self->_type - 1;
  if (v3 > 7)
    v4 = 0;
  else
    v4 = off_1E37F6660[v3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v4, self->_dateInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDictionary count](self->_metadata, "count"))
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@"), self->_metadata);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char isKindOfClass;
  BOOL v6;
  id v7;
  NSUInteger v8;
  NSDictionary *metadata;

  v4 = (id *)a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = v4[3];
    v8 = -[NSDictionary count](self->_metadata, "count");
    v6 = v8 == objc_msgSend(v7, "count")
      && ((metadata = self->_metadata) == 0
       || !v7
       || -[NSDictionary isEqualToDictionary:](metadata, "isEqualToDictionary:", v7))
      && v4[1] == (id)self->_type
      && -[NSDateInterval isEqualToDateInterval:](self->_dateInterval, "isEqualToDateInterval:", v4[2]);

  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSDateInterval hash](self->_dateInterval, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  if (-[NSDictionary count](self->_metadata, "count"))
    v5 ^= -[NSDictionary hash](self->_metadata, "hash");
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t type;
  int64_t v13;

  v4 = a3;
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  if (!v8)
  {
    -[NSDateInterval endDate](self->_dateInterval, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v11);

    if (!v8)
    {
      type = self->_type;
      if (type == objc_msgSend(v4, "type"))
      {
        v8 = 0;
      }
      else
      {
        v13 = self->_type;
        if (v13 < objc_msgSend(v4, "type"))
          v8 = -1;
        else
          v8 = 1;
      }
    }
  }

  return v8;
}

- (void)_setWorkoutEventMetadata:(id)a3
{
  NSDictionary *v4;
  NSDictionary *metadata;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  metadata = self->_metadata;
  self->_metadata = v4;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKWorkoutEvent;
  return -[HKWorkoutEvent init](&v3, sel_init);
}

- (HKWorkoutEvent)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKWorkoutEvent)initWithWorkoutEventType:(int64_t)a3 sessionUUID:(id)a4 dateInterval:(id)a5 metadata:(id)a6 error:(id)a7
{
  HKWorkoutEvent *v8;

  +[HKWorkoutEvent _unvalidatedWorkoutEventWithType:dateInterval:metadata:](HKWorkoutEvent, "_unvalidatedWorkoutEventWithType:dateInterval:metadata:", a3, a5, a6);
  v8 = (HKWorkoutEvent *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HKWorkoutEventType)type
{
  return self->_type;
}

- (NSDate)date
{
  NSDateInterval *dateInterval;
  int64_t type;

  type = self->_type;
  dateInterval = self->_dateInterval;
  if (type == 3)
    -[NSDateInterval endDate](dateInterval, "endDate");
  else
    -[NSDateInterval startDate](dateInterval, "startDate");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)workoutEventType
{
  return self->_type;
}

- (NSUUID)sessionUUID
{
  return 0;
}

- (NSError)error
{
  return 0;
}

- (void)_assertPropertiesValid
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = HKDefaultObjectValidationConfiguration();
  -[HKWorkoutEvent _validateWithConfiguration:](self, "_validateWithConfiguration:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v9 = v5;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@"), v8);

    v5 = v9;
  }

}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  NSDateInterval *dateInterval;
  unint64_t var1;
  char var0;
  double v8;
  unint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  __CFString *type;
  const __CFString *v15;
  NSDictionary *metadata;
  BOOL v17;
  id v18;
  void *v19;
  __CFString *v21;
  id v22;

  if ((unint64_t)(self->_type - 1) >= 8)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = objc_opt_class();
    type = (__CFString *)self->_type;
    v15 = CFSTR("Invalid type (%ld)");
LABEL_18:
    v21 = type;
    goto LABEL_19;
  }
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    var1 = a3.var1;
    var0 = a3.var0;
    -[NSDateInterval duration](dateInterval, "duration");
    v9 = self->_type;
    if (v9 <= 8)
    {
      v10 = fabs(v8);
      if (((1 << v9) & 0x176) != 0)
      {
        if (v10 >= 2.22044605e-16)
          goto LABEL_6;
LABEL_13:
        if ((var0 & 4) != 0)
        {
          v18 = 0;
        }
        else
        {
          metadata = self->_metadata;
          v22 = 0;
          v17 = -[NSDictionary hk_validateMetadataKeysAndValuesForWorkoutEvent:applicationSDKVersionToken:error:](metadata, "hk_validateMetadataKeysAndValuesForWorkoutEvent:applicationSDKVersionToken:error:", self, var1, &v22);
          v18 = v22;
          if (!v17)
          {
            v18 = v18;
            v19 = v18;
LABEL_23:

            return v19;
          }
        }
        v19 = 0;
        goto LABEL_23;
      }
      if (v9 == 3 || v9 == 7 && v10 >= 2.22044605e-16)
        goto LABEL_13;
    }
LABEL_6:
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = objc_opt_class();
    v13 = self->_type - 1;
    if (v13 > 7)
      type = 0;
    else
      type = off_1E37F6660[v13];
    v15 = CFSTR("Invalid date interval duration for type %@");
    goto LABEL_18;
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = objc_opt_class();
  v15 = CFSTR("Workout event date interval cannot be nil");
LABEL_19:
  objc_msgSend(v11, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v12, a2, v15, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKWorkoutEvent *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v7, 0.0);

  }
  v8 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_replaceKeysFromSharedStringCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_unvalidatedWorkoutEventWithType:dateInterval:metadata:", v5, v6, v12);
  v13 = (HKWorkoutEvent *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));

}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
