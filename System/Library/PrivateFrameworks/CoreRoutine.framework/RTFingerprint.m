@implementation RTFingerprint

- (RTFingerprint)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_settledState_start_accessPoints_);
}

- (RTFingerprint)initWithIdentifier:(id)a3 settledState:(unint64_t)a4 start:(id)a5 accessPoints:(id)a6
{
  id v10;
  id v11;
  id v12;
  RTFingerprint *v13;
  uint64_t v14;
  NSUUID *identifier;
  uint64_t v16;
  NSDate *start;
  uint64_t v18;
  NSArray *accessPoints;
  RTFingerprint *v20;
  NSObject *v21;
  const char *v22;
  objc_super v24;
  uint8_t buf[16];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: identifier";
LABEL_13:
    _os_log_error_impl(&dword_1A5E26000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_14;
  }
  if (a4 >= 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: RTScenarioTriggerSettledStateIsValid(settledState)";
    goto LABEL_13;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Invalid parameter not satisfying: start";
      goto LABEL_13;
    }
LABEL_14:

    v20 = 0;
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)RTFingerprint;
  v13 = -[RTFingerprint init](&v24, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSUUID *)v14;

    v13->_settledState = a4;
    v16 = objc_msgSend(v11, "copy");
    start = v13->_start;
    v13->_start = (NSDate *)v16;

    v18 = objc_msgSend(v12, "copy");
    accessPoints = v13->_accessPoints;
    v13->_accessPoints = (NSArray *)v18;

  }
  self = v13;
  v20 = self;
LABEL_15:

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[RTScenarioTrigger scenarioTriggerSettledStateToString:](RTScenarioTrigger, "scenarioTriggerSettledStateToString:", self->_settledState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate stringFromDate](self->_start, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("settled state, %@, start, %@, number of access points, %lu"), v4, v5, -[NSArray count](self->_accessPoints, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:settledState:start:accessPoints:", self->_identifier, self->_settledState, self->_start, self->_accessPoints);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTFingerprint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  RTFingerprint *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settledState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("accessPoints"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[RTFingerprint initWithIdentifier:settledState:start:accessPoints:](self, "initWithIdentifier:settledState:start:accessPoints:", v5, v7, v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_settledState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("settledState"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_start, CFSTR("start"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_accessPoints, CFSTR("accessPoints"));

}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_settledState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSDate hash](self->_start, "hash");
  v7 = v5 ^ v6 ^ -[NSArray hash](self->_accessPoints, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTFingerprint *v5;
  RTFingerprint *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  char v32;
  char v33;

  v5 = (RTFingerprint *)a3;
  if (self == v5)
  {
    v32 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[RTFingerprint accessPoints](self, "accessPoints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      -[RTFingerprint accessPoints](v6, "accessPoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v8 != v10)
      {
LABEL_16:
        v32 = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[RTFingerprint accessPoints](self, "accessPoints");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        -[RTFingerprint accessPoints](v6, "accessPoints");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[RTFingerprint accessPoints](self, "accessPoints");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (v15)
          {
            v16 = 0;
            do
            {
              -[RTFingerprint accessPoints](self, "accessPoints");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              -[RTFingerprint accessPoints](v6, "accessPoints");
              v19 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v19, "objectAtIndexedSubscript:", v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              LOBYTE(v19) = objc_msgSend(v18, "isEqual:", v20);
              if ((v19 & 1) == 0)
                goto LABEL_16;
              ++v16;
              -[RTFingerprint accessPoints](self, "accessPoints");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "count");

            }
            while (v16 < v22);
          }
        }
      }
      -[RTFingerprint identifier](self, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTFingerprint identifier](v6, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      v26 = -[RTFingerprint settledState](self, "settledState");
      v27 = -[RTFingerprint settledState](v6, "settledState");
      -[RTFingerprint start](self, "start");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 || (-[RTFingerprint start](v6, "start"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[RTFingerprint start](self, "start");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTFingerprint start](v6, "start");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqualToDate:", v30);

        if (v28)
        {
LABEL_19:

          if (v26 == v27)
            v33 = v25;
          else
            v33 = 0;
          v32 = v33 & v31;
          goto LABEL_23;
        }
      }
      else
      {
        v31 = 1;
      }

      goto LABEL_19;
    }
    v32 = 0;
  }
LABEL_24:

  return v32;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (NSDate)start
{
  return self->_start;
}

- (NSArray)accessPoints
{
  return self->_accessPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
