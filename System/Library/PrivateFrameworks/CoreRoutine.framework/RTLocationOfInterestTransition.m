@implementation RTLocationOfInterestTransition

- (RTLocationOfInterestTransition)initWithIdentifier:(id)a3 startDate:(id)a4 stopDate:(id)a5 visitIdentifierOrigin:(id)a6 visitIdentifierDestination:(id)a7 modeOfTransportation:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  RTLocationOfInterestTransition *v19;
  RTLocationOfInterestTransition *v20;
  RTLocationOfInterestTransition *v21;
  uint64_t v22;
  NSDate *startDate;
  uint64_t v24;
  NSDate *stopDate;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifier"
            "Destination:modeOfTransportation:]";
      v36 = 1024;
      v37 = 33;
      _os_log_error_impl(&dword_1A5E26000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDe"
          "stination:modeOfTransportation:]";
    v36 = 1024;
    v37 = 34;
    _os_log_error_impl(&dword_1A5E26000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
  }

  if (v16)
  {
LABEL_4:
    if (v17)
      goto LABEL_5;
LABEL_22:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifier"
            "Destination:modeOfTransportation:]";
      v36 = 1024;
      v37 = 36;
      _os_log_error_impl(&dword_1A5E26000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifierOrigin (in %s:%d)", buf, 0x12u);
    }

    if (v18)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_19:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDe"
          "stination:modeOfTransportation:]";
    v36 = 1024;
    v37 = 35;
    _os_log_error_impl(&dword_1A5E26000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stopDate (in %s:%d)", buf, 0x12u);
  }

  if (!v17)
    goto LABEL_22;
LABEL_5:
  if (v18)
  {
LABEL_6:
    v19 = 0;
    if (v14 && v15 && v16 && v17)
    {
      v33.receiver = self;
      v33.super_class = (Class)RTLocationOfInterestTransition;
      v20 = -[RTLocationOfInterestTransition init](&v33, sel_init);
      v21 = v20;
      if (v20)
      {
        objc_storeStrong((id *)&v20->_identifier, a3);
        v22 = objc_msgSend(v15, "copy");
        startDate = v21->_startDate;
        v21->_startDate = (NSDate *)v22;

        v24 = objc_msgSend(v16, "copy");
        stopDate = v21->_stopDate;
        v21->_stopDate = (NSDate *)v24;

        objc_storeStrong((id *)&v21->_visitIdentifierOrigin, a6);
        objc_storeStrong((id *)&v21->_visitIdentifierDestination, a7);
        v21->_modeOfTransportation = a8;
      }
      self = v21;
      v19 = self;
    }
    goto LABEL_28;
  }
LABEL_25:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDe"
          "stination:modeOfTransportation:]";
    v36 = 1024;
    v37 = 37;
    _os_log_error_impl(&dword_1A5E26000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifierDestination (in %s:%d)", buf, 0x12u);
  }

  v19 = 0;
LABEL_28:

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v14 = (void *)MEMORY[0x1E0CB37A0];
  -[RTLocationOfInterestTransition identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterestTransition startDate](self, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterestTransition stopDate](self, "stopDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterestTransition visitIdentifierOrigin](self, "visitIdentifierOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterestTransition visitIdentifierDestination](self, "visitIdentifierDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTRoutineManager modeOfTransportationToString:](RTRoutineManager, "modeOfTransportationToString:", -[RTLocationOfInterestTransition modeOfTransportation](self, "modeOfTransportation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("identifier, %@, startDate, %@, stopDate, %@, origin, %@, destination, %@, modeOfTransportation, %@"), v3, v4, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTLocationOfInterestTransition)initWithCoder:(id)a3
{
  id v4;
  RTLocationOfInterestTransition *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *stopDate;
  uint64_t v12;
  NSUUID *visitIdentifierOrigin;
  uint64_t v14;
  NSUUID *visitIdentifierDestination;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RTLocationOfInterestTransition;
  v5 = -[RTLocationOfInterestTransition init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stopDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    stopDate = v5->_stopDate;
    v5->_stopDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visitIdentifierOrigin"));
    v12 = objc_claimAutoreleasedReturnValue();
    visitIdentifierOrigin = v5->_visitIdentifierOrigin;
    v5->_visitIdentifierOrigin = (NSUUID *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visitIdentifierDestination"));
    v14 = objc_claimAutoreleasedReturnValue();
    visitIdentifierDestination = v5->_visitIdentifierDestination;
    v5->_visitIdentifierDestination = (NSUUID *)v14;

    v5->_modeOfTransportation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("modeOfTransportation"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stopDate, CFSTR("stopDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visitIdentifierOrigin, CFSTR("visitIdentifierOrigin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visitIdentifierDestination, CFSTR("visitIdentifierDestination"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_modeOfTransportation, CFSTR("modeOfTransportation"));

}

- (BOOL)isEqual:(id)a3
{
  RTLocationOfInterestTransition *v4;
  RTLocationOfInterestTransition *v5;
  RTLocationOfInterestTransition *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (RTLocationOfInterestTransition *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[RTLocationOfInterestTransition identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationOfInterestTransition identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RTLocationOfInterestTransition identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)stopDate
{
  return self->_stopDate;
}

- (NSUUID)visitIdentifierOrigin
{
  return self->_visitIdentifierOrigin;
}

- (NSUUID)visitIdentifierDestination
{
  return self->_visitIdentifierDestination;
}

- (int64_t)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitIdentifierDestination, 0);
  objc_storeStrong((id *)&self->_visitIdentifierOrigin, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
