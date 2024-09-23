@implementation RTPlaceInferenceQuery

- (RTPlaceInferenceQuery)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_date_errorCode_fidelityPolicyMask_placeInference_sourceIdentifier_);
}

- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 errorCode:(int64_t)a5 fidelityPolicyMask:(unint64_t)a6 placeInference:(id)a7 sourceIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTPlaceInferenceQuery *v19;
  RTPlaceInferenceQuery *v20;
  RTPlaceInferenceQuery *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  objc_super v27;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  if (v15)
  {
    v26 = v18;
    if (v16)
    {
      v27.receiver = self;
      v27.super_class = (Class)RTPlaceInferenceQuery;
      v19 = -[RTPlaceInferenceQuery init](&v27, sel_init);
      v20 = v19;
      if (v19)
      {
        objc_storeStrong((id *)&v19->_identifier, a3);
        objc_storeStrong((id *)&v20->_date, a4);
        v20->_errorCode = a5;
        v20->_fidelityPolicyMask = a6;
        objc_storeStrong((id *)&v20->_placeInference, a7);
        objc_storeStrong((id *)&v20->_sourceIdentifier, a8);
      }
      self = v20;
      v21 = self;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A5E26000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", buf, 2u);
      }

      v21 = 0;
    }
    v22 = v26;
  }
  else
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 fidelityPolicyMask:(unint64_t)a5 placeInference:(id)a6 sourceIdentifier:(id)a7
{
  return -[RTPlaceInferenceQuery initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:](self, "initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:", a3, a4, -1, a5, a6, a7);
}

- (RTPlaceInferenceQuery)initWithIdentifier:(id)a3 date:(id)a4 fidelityPolicyMask:(unint64_t)a5 placeInference:(id)a6
{
  return -[RTPlaceInferenceQuery initWithIdentifier:date:fidelityPolicyMask:placeInference:sourceIdentifier:](self, "initWithIdentifier:date:fidelityPolicyMask:placeInference:sourceIdentifier:", a3, a4, a5, a6, 0);
}

- (BOOL)isEqual:(id)a3
{
  RTPlaceInferenceQuery *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (RTPlaceInferenceQuery *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RTPlaceInferenceQuery identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPlaceInferenceQuery identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RTPlaceInferenceQuery *v4;
  void *v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  RTPlaceInferenceQuery *v11;

  v4 = [RTPlaceInferenceQuery alloc];
  -[RTPlaceInferenceQuery identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceQuery date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RTPlaceInferenceQuery errorCode](self, "errorCode");
  v8 = -[RTPlaceInferenceQuery fidelityPolicyMask](self, "fidelityPolicyMask");
  -[RTPlaceInferenceQuery placeInference](self, "placeInference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceQuery sourceIdentifier](self, "sourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RTPlaceInferenceQuery initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:](v4, "initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:", v5, v6, v7, v8, v9, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RTPlaceInferenceQuery identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[RTPlaceInferenceQuery date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("date"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[RTPlaceInferenceQuery errorCode](self, "errorCode"), CFSTR("errorCode"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[RTPlaceInferenceQuery fidelityPolicyMask](self, "fidelityPolicyMask"), CFSTR("fidelityPolicyMask"));
  -[RTPlaceInferenceQuery placeInference](self, "placeInference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("placeInference"));

  -[RTPlaceInferenceQuery sourceIdentifier](self, "sourceIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sourceIdentifier"));

}

- (RTPlaceInferenceQuery)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  RTPlaceInferenceQuery *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("errorCode"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fidelityPolicyMask"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeInference"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[RTPlaceInferenceQuery initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:](self, "initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTPlaceInferenceQuery identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceQuery date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTPlaceInferenceQuery errorCode](self, "errorCode");
  v7 = -[RTPlaceInferenceQuery fidelityPolicyMask](self, "fidelityPolicyMask");
  -[RTPlaceInferenceQuery placeInference](self, "placeInference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceQuery sourceIdentifier](self, "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier, %@, date, %@, errorCode, %lu, fidelityPolicyMask, %lu, placeInference, %@, source identifier, %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (unint64_t)fidelityPolicyMask
{
  return self->_fidelityPolicyMask;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (RTPlaceInference)placeInference
{
  return self->_placeInference;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_placeInference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
