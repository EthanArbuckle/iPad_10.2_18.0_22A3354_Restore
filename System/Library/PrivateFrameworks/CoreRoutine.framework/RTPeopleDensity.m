@implementation RTPeopleDensity

- (RTPeopleDensity)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBundleUUID_startDate_endDate_densityScore_scanDuration_rssiHistogram_);
}

- (RTPeopleDensity)initWithBundleUUID:(id)a3 startDate:(id)a4 endDate:(id)a5 densityScore:(double)a6 scanDuration:(double)a7 rssiHistogram:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTPeopleDensity *v19;
  RTPeopleDensity *v20;
  RTPeopleDensity *v21;
  NSObject *v22;
  objc_super v24;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (v16)
  {
    v24.receiver = self;
    v24.super_class = (Class)RTPeopleDensity;
    v19 = -[RTPeopleDensity init](&v24, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_uuid, a3);
      objc_storeStrong((id *)&v20->_startDate, a4);
      objc_storeStrong((id *)&v20->_endDate, a5);
      v20->_densityScore = a6;
      v20->_scanDuration = a7;
      objc_storeStrong((id *)&v20->_rssiHistogram, a8);
    }
    self = v20;
    v21 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  RTPeopleDensity *v4;
  RTPeopleDensity *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (RTPeopleDensity *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTPeopleDensity uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPeopleDensity uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  void *v3;
  NSUUID *uuid;
  void *v5;
  NSDate *startDate;
  void *v7;
  NSDate *endDate;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  uuid = self->_uuid;
  if (uuid)
  {
    -[NSUUID UUIDString](uuid, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("UUID"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", &stru_1E4FB1A18, CFSTR("UUID"));
  }
  startDate = self->_startDate;
  if (startDate)
  {
    -[NSDate getFormattedDateString](startDate, "getFormattedDateString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("StartDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("-"), CFSTR("StartDate"));
  }
  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate getFormattedDateString](endDate, "getFormattedDateString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("EndDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("-"), CFSTR("EndDate"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_densityScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("Score"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scanDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ScanDuration"));

  if (self->_rssiHistogram)
  {
    v12 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NSDictionary allKeys](self->_rssiHistogram, "allKeys", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_rssiHistogram, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v19, v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("rssiHistogram"));
  }
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTPeopleDensity descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 3, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  }
  v7 = (void *)v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleUUID:startDate:endDate:densityScore:scanDuration:rssiHistogram:", self->_uuid, self->_startDate, self->_endDate, self->_rssiHistogram, self->_densityScore, self->_scanDuration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDensity)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  RTPeopleDensity *v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("Score"));
  v12 = v11;
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("ScanDuration"));
  v14 = v13;
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("rssiHistogram"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[RTPeopleDensity initWithBundleUUID:startDate:endDate:densityScore:scanDuration:rssiHistogram:](self, "initWithBundleUUID:startDate:endDate:densityScore:scanDuration:rssiHistogram:", v8, v9, v10, v15, v12, v14);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("StartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("EndDate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Score"), self->_densityScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ScanDuration"), self->_scanDuration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_rssiHistogram, CFSTR("rssiHistogram"));

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)densityScore
{
  return self->_densityScore;
}

- (double)scanDuration
{
  return self->_scanDuration;
}

- (NSDictionary)rssiHistogram
{
  return self->_rssiHistogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssiHistogram, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
