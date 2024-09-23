@implementation RTLocationOfInterestVisit

- (RTLocationOfInterestVisit)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_entry_exit_location_locationOfInterestConfidence_locationOfInterestSource_);
}

- (RTLocationOfInterestVisit)initWithIdentifier:(id)a3 entry:(id)a4 exit:(id)a5 location:(id)a6 locationOfInterestConfidence:(double)a7 locationOfInterestSource:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  RTLocationOfInterestVisit *v19;
  uint64_t v20;
  NSUUID *identifier;
  uint64_t v22;
  NSDate *entryDate;
  uint64_t v24;
  NSDate *exitDate;
  RTLocationOfInterestVisit *v26;
  NSObject *v27;
  const char *v28;
  objc_super v30;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = v17;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: identifier";
LABEL_21:
    _os_log_error_impl(&dword_1A5E26000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_22;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: entry";
    goto LABEL_21;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: exit";
    goto LABEL_21;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: location";
    goto LABEL_21;
  }
  if (a7 < 0.0 || a7 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: kRTLocationOfInterestVisitConfidenceMin <= locationOfInterestConfidence &&"
            " locationOfInterestConfidence <= kRTLocationOfInterestVisitConfidenceMax";
      goto LABEL_21;
    }
LABEL_22:

    goto LABEL_23;
  }
  if ((a8 & 0xFFFFFFFFFFF00020) != 0)
  {
LABEL_23:
    v26 = 0;
    goto LABEL_24;
  }
  v30.receiver = self;
  v30.super_class = (Class)RTLocationOfInterestVisit;
  v19 = -[RTLocationOfInterestVisit init](&v30, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSUUID *)v20;

    v22 = objc_msgSend(v15, "copy");
    entryDate = v19->_entryDate;
    v19->_entryDate = (NSDate *)v22;

    v24 = objc_msgSend(v16, "copy");
    exitDate = v19->_exitDate;
    v19->_exitDate = (NSDate *)v24;

    objc_storeStrong((id *)&v19->_location, a6);
    v19->_locationOfInterestConfidence = a7;
    v19->_locationOfInterestSource = a8;
  }
  self = v19;
  v26 = self;
LABEL_24:

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTLocationOfInterestVisit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  RTLocationOfInterestVisit *v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryTime"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exitDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exitTime"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v17;

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationOfInterestConfidence"));
  v20 = -[RTLocationOfInterestVisit initWithIdentifier:entry:exit:location:locationOfInterestConfidence:locationOfInterestSource:](self, "initWithIdentifier:entry:exit:location:locationOfInterestConfidence:locationOfInterestSource:", v5, v8, v14, v18, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationOfInterestSource")), v19);

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entryDate, CFSTR("entryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exitDate, CFSTR("exitDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("locationOfInterestConfidence"), self->_locationOfInterestConfidence);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_locationOfInterestSource, CFSTR("locationOfInterestSource"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTLocationOfInterestVisit *v5;
  RTLocationOfInterestVisit *v6;
  RTLocationOfInterestVisit *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (RTLocationOfInterestVisit *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[RTLocationOfInterestVisit identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[RTLocationOfInterestVisit identifier](v7, "identifier"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[RTLocationOfInterestVisit identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLocationOfInterestVisit identifier](v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RTLocationOfInterestVisit identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  uint64_t v11;
  void *v12;

  if (qword_1ECF931E8 != -1)
    dispatch_once(&qword_1ECF931E8, &__block_literal_global_5);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)_MergedGlobals_9;
  -[RTLocationOfInterestVisit entryDate](self, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_MergedGlobals_9;
  -[RTLocationOfInterestVisit exitDate](self, "exitDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterestVisit location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationOfInterestVisit locationOfInterestConfidence](self, "locationOfInterestConfidence");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("entry, %@, exit, %@, location, %@, loiConfidence, %f"), v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __40__RTLocationOfInterestVisit_description__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_9, "setLocale:", v2);

  objc_msgSend((id)_MergedGlobals_9, "setDateStyle:", 1);
  return objc_msgSend((id)_MergedGlobals_9, "setTimeStyle:", 3);
}

- (id)entryTime
{
  return self->_entryDate;
}

- (id)exitTime
{
  return self->_exitDate;
}

- (id)entry
{
  return self->_entryDate;
}

- (id)exit
{
  return self->_exitDate;
}

- (RTLocation)location
{
  return self->_location;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (double)locationOfInterestConfidence
{
  return self->_locationOfInterestConfidence;
}

- (unint64_t)locationOfInterestSource
{
  return self->_locationOfInterestSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
