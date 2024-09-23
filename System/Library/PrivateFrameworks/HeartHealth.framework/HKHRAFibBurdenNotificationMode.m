@implementation HKHRAFibBurdenNotificationMode

- (HKHRAFibBurdenNotificationMode)initWithType:(int64_t)a3 shouldForwardToWatch:(BOOL)a4 currentPercentage:(id)a5 currentValueClamped:(id)a6 currentValueDateInterval:(id)a7 currentValueUUID:(id)a8 previousPercentage:(id)a9 previousValueClamped:(id)a10 previousTimeZoneDiffersFromCurrent:(id)a11
{
  id v16;
  id v17;
  HKHRAFibBurdenNotificationMode *v18;
  HKHRAFibBurdenNotificationMode *v19;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v16 = a10;
  v17 = a11;
  v28.receiver = self;
  v28.super_class = (Class)HKHRAFibBurdenNotificationMode;
  v18 = -[HKHRAFibBurdenNotificationMode init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    v18->_shouldForwardToWatch = a4;
    objc_storeStrong((id *)&v18->_currentPercentage, a5);
    objc_storeStrong((id *)&v19->_currentValueClamped, a6);
    objc_storeStrong((id *)&v19->_currentValueDateInterval, a7);
    objc_storeStrong((id *)&v19->_currentValueUUID, a8);
    objc_storeStrong((id *)&v19->_previousPercentage, a9);
    objc_storeStrong((id *)&v19->_previousValueClamped, a10);
    objc_storeStrong((id *)&v19->_previousTimeZoneDiffersFromCurrent, a11);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t type;
  int shouldForwardToWatch;
  NSNumber *currentPercentage;
  void *v9;
  NSNumber *currentValueClamped;
  void *v11;
  NSDateInterval *currentValueDateInterval;
  void *v13;
  NSUUID *currentValueUUID;
  void *v15;
  NSNumber *previousPercentage;
  void *v17;
  NSNumber *previousValueClamped;
  void *v19;
  NSNumber *previousTimeZoneDiffersFromCurrent;
  void *v21;
  BOOL v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    type = self->_type;
    if (type == objc_msgSend(v5, "type")
      && (shouldForwardToWatch = self->_shouldForwardToWatch,
          shouldForwardToWatch == objc_msgSend(v5, "shouldForwardToWatch")))
    {
      currentPercentage = self->_currentPercentage;
      objc_msgSend(v5, "currentPercentage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSNumber isEqualToNumber:](currentPercentage, "isEqualToNumber:", v9))
      {
        currentValueClamped = self->_currentValueClamped;
        objc_msgSend(v5, "currentValueClamped");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSNumber isEqualToNumber:](currentValueClamped, "isEqualToNumber:", v11))
        {
          currentValueDateInterval = self->_currentValueDateInterval;
          objc_msgSend(v5, "currentValueDateInterval");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSDateInterval isEqualToDateInterval:](currentValueDateInterval, "isEqualToDateInterval:", v13))
          {
            currentValueUUID = self->_currentValueUUID;
            objc_msgSend(v5, "currentValueUUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSUUID isEqual:](currentValueUUID, "isEqual:", v15))
            {
              previousPercentage = self->_previousPercentage;
              objc_msgSend(v5, "previousPercentage");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSNumber isEqualToNumber:](previousPercentage, "isEqualToNumber:", v17))
              {
                previousValueClamped = self->_previousValueClamped;
                objc_msgSend(v5, "previousValueClamped");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[NSNumber isEqualToNumber:](previousValueClamped, "isEqualToNumber:", v19))
                {
                  previousTimeZoneDiffersFromCurrent = self->_previousTimeZoneDiffersFromCurrent;
                  objc_msgSend(v5, "previousTimeZoneDiffersFromCurrent");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = -[NSNumber isEqualToNumber:](previousTimeZoneDiffersFromCurrent, "isEqualToNumber:", v21);

                }
                else
                {
                  v22 = 0;
                }

              }
              else
              {
                v22 = 0;
              }

            }
            else
            {
              v22 = 0;
            }

          }
          else
          {
            v22 = 0;
          }

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = self->_type ^ self->_shouldForwardToWatch;
  v4 = v3 ^ -[NSNumber hash](self->_currentPercentage, "hash");
  v5 = -[NSNumber hash](self->_currentValueClamped, "hash");
  v6 = v4 ^ v5 ^ -[NSDateInterval hash](self->_currentValueDateInterval, "hash");
  v7 = -[NSUUID hash](self->_currentValueUUID, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_previousPercentage, "hash");
  v9 = v6 ^ v8 ^ -[NSNumber hash](self->_previousValueClamped, "hash");
  return v9 ^ -[NSNumber hash](self->_previousTimeZoneDiffersFromCurrent, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldForwardToWatch, CFSTR("shouldForwardToWatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentPercentage, CFSTR("currentPercentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentValueClamped, CFSTR("currentValueClamped"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentValueDateInterval, CFSTR("currentValueDateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentValueUUID, CFSTR("currentValueUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousPercentage, CFSTR("previousPercentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousValueClamped, CFSTR("previousValueClamped"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousTimeZoneDiffersFromCurrent, CFSTR("previousTimeZoneDiffersFromCurrent"));

}

- (HKHRAFibBurdenNotificationMode)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenNotificationMode *v5;
  uint64_t v6;
  NSNumber *currentPercentage;
  uint64_t v8;
  NSNumber *currentValueClamped;
  uint64_t v10;
  NSDateInterval *currentValueDateInterval;
  uint64_t v12;
  NSUUID *currentValueUUID;
  uint64_t v14;
  NSNumber *previousPercentage;
  uint64_t v16;
  NSNumber *previousValueClamped;
  uint64_t v18;
  NSNumber *previousTimeZoneDiffersFromCurrent;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKHRAFibBurdenNotificationMode;
  v5 = -[HKHRAFibBurdenNotificationMode init](&v21, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_shouldForwardToWatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldForwardToWatch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentPercentage"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentPercentage = v5->_currentPercentage;
    v5->_currentPercentage = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentValueClamped"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentValueClamped = v5->_currentValueClamped;
    v5->_currentValueClamped = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentValueDateInterval"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentValueDateInterval = v5->_currentValueDateInterval;
    v5->_currentValueDateInterval = (NSDateInterval *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentValueUUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    currentValueUUID = v5->_currentValueUUID;
    v5->_currentValueUUID = (NSUUID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousPercentage"));
    v14 = objc_claimAutoreleasedReturnValue();
    previousPercentage = v5->_previousPercentage;
    v5->_previousPercentage = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousValueClamped"));
    v16 = objc_claimAutoreleasedReturnValue();
    previousValueClamped = v5->_previousValueClamped;
    v5->_previousValueClamped = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousTimeZoneDiffersFromCurrent"));
    v18 = objc_claimAutoreleasedReturnValue();
    previousTimeZoneDiffersFromCurrent = v5->_previousTimeZoneDiffersFromCurrent;
    v5->_previousTimeZoneDiffersFromCurrent = (NSNumber *)v18;

  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)shouldForwardToWatch
{
  return self->_shouldForwardToWatch;
}

- (NSNumber)currentPercentage
{
  return self->_currentPercentage;
}

- (NSNumber)currentValueClamped
{
  return self->_currentValueClamped;
}

- (NSDateInterval)currentValueDateInterval
{
  return self->_currentValueDateInterval;
}

- (NSUUID)currentValueUUID
{
  return self->_currentValueUUID;
}

- (NSNumber)previousPercentage
{
  return self->_previousPercentage;
}

- (NSNumber)previousValueClamped
{
  return self->_previousValueClamped;
}

- (NSNumber)previousTimeZoneDiffersFromCurrent
{
  return self->_previousTimeZoneDiffersFromCurrent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTimeZoneDiffersFromCurrent, 0);
  objc_storeStrong((id *)&self->_previousValueClamped, 0);
  objc_storeStrong((id *)&self->_previousPercentage, 0);
  objc_storeStrong((id *)&self->_currentValueUUID, 0);
  objc_storeStrong((id *)&self->_currentValueDateInterval, 0);
  objc_storeStrong((id *)&self->_currentValueClamped, 0);
  objc_storeStrong((id *)&self->_currentPercentage, 0);
}

@end
