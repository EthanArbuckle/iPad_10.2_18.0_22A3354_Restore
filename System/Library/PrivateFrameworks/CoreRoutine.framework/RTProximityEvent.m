@implementation RTProximityEvent

- (RTProximityEvent)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventID_startDate_endDate_relationship_socialScore_combinedFrequencyScores_combinedRecencyScores_combinedSignificanceScores_);
}

- (RTProximityEvent)initWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 relationship:(int64_t)a6 socialScore:(double)a7 combinedFrequencyScores:(id)a8 combinedRecencyScores:(id)a9 combinedSignificanceScores:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  RTProximityEvent *v21;
  RTProximityEvent *v22;
  RTProximityEvent *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[16];

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v35 = a8;
  v34 = a9;
  v20 = a10;
  if (v17)
  {
    v32 = v20;
    v33 = v18;
    if (v18)
    {
      v36.receiver = self;
      v36.super_class = (Class)RTProximityEvent;
      v21 = -[RTProximityEvent init](&v36, sel_init);
      v22 = v21;
      if (v21)
      {
        objc_storeStrong((id *)&v21->_eventID, a3);
        objc_storeStrong((id *)&v22->_startDate, a4);
        objc_storeStrong((id *)&v22->_endDate, a5);
        v22->_relationship = a6;
        v22->_socialScore = a7;
        objc_storeStrong((id *)&v22->_combinedFrequencyScores, a8);
        objc_storeStrong((id *)&v22->_combinedRecencyScores, a9);
        objc_storeStrong((id *)&v22->_combinedSignificanceScores, a10);
      }
      self = v22;
      v23 = self;
      v24 = v33;
      v25 = v34;
      v26 = v35;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v29 = objc_claimAutoreleasedReturnValue();
      v25 = v34;
      v26 = v35;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A5E26000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
      }

      v23 = 0;
      v24 = 0;
    }
    v27 = v32;
  }
  else
  {
    v27 = v20;
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventID", buf, 2u);
    }

    v23 = 0;
    v25 = v34;
    v26 = v35;
  }

  return v23;
}

+ (id)convertPersonRelationshipToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Family");
  if (a3 == 2)
    return CFSTR("Friend");
  else
    return (id)v3;
}

+ (id)convertContactFrequencyToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return *(&off_1E4FB1828 + a3 - 1);
}

+ (id)convertContactRecencyToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return *(&off_1E4FB1840 + a3 - 1);
}

+ (id)convertContactSignificanceToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unknown");
  else
    return *(&off_1E4FB1840 + a3 - 1);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTProximityEvent *v5;
  RTProximityEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;

  v5 = (RTProximityEvent *)a3;
  if (v5 == self)
  {
    v11 = 1;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_18;
  }
  v6 = v5;
  -[RTProximityEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[RTProximityEvent endDate](v6, "endDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v10 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  -[RTProximityEvent endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTProximityEvent endDate](v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToDate:", v9);

  if (!v7)
    goto LABEL_10;
LABEL_11:

  -[RTProximityEvent eventID](self, "eventID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTProximityEvent eventID](v6, "eventID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqual:", v13))
  {
    -[RTProximityEvent startDate](self, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTProximityEvent startDate](v6, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToDate:", v15) & v10) == 1)
    {
      v16 = -[RTProximityEvent relationship](self, "relationship");
      v11 = v16 == -[RTProximityEvent relationship](v6, "relationship");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

LABEL_18:
  return v11;
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  NSDate *startDate;
  void *v6;
  NSDate *endDate;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_eventID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("EventID"));

  startDate = self->_startDate;
  if (startDate)
  {
    -[NSDate getFormattedDateString](startDate, "getFormattedDateString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("StartDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("-"), CFSTR("StartDate"));
  }
  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate getFormattedDateString](endDate, "getFormattedDateString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("EndDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("-"), CFSTR("EndDate"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_socialScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("SocialScore"));

  objc_msgSend((id)objc_opt_class(), "convertPersonRelationshipToString:", self->_relationship);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("Relationship"));

  -[RTProximityEvent combinedFrequencyScores](self, "combinedFrequencyScores");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RTProximityEvent combinedFrequencyScores](self, "combinedFrequencyScores");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = 0;
      do
      {
        objc_msgSend((id)objc_opt_class(), "convertContactFrequencyToString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTProximityEvent combinedFrequencyScores](self, "combinedFrequencyScores");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intValue");

        if (v19 >= 1)
        {
          -[RTProximityEvent combinedFrequencyScores](self, "combinedFrequencyScores");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Frequency:%@"), v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v22, v23);

        }
        ++v15;
        -[RTProximityEvent combinedFrequencyScores](self, "combinedFrequencyScores");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

      }
      while (v25 > v15);
    }
  }
  -[RTProximityEvent combinedRecencyScores](self, "combinedRecencyScores");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[RTProximityEvent combinedRecencyScores](self, "combinedRecencyScores");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      v29 = 0;
      do
      {
        +[RTProximityEvent convertContactRecencyToString:](RTProximityEvent, "convertContactRecencyToString:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTProximityEvent combinedRecencyScores](self, "combinedRecencyScores");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "intValue");

        if (v33 >= 1)
        {
          -[RTProximityEvent combinedRecencyScores](self, "combinedRecencyScores");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", v29);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Recency:%@"), v30);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v36, v37);

        }
        ++v29;
        -[RTProximityEvent combinedRecencyScores](self, "combinedRecencyScores");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

      }
      while (v39 > v29);
    }
  }
  -[RTProximityEvent combinedSignificanceScores](self, "combinedSignificanceScores");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[RTProximityEvent combinedSignificanceScores](self, "combinedSignificanceScores");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v42)
    {
      v43 = 0;
      do
      {
        +[RTProximityEvent convertContactSignificanceToString:](RTProximityEvent, "convertContactSignificanceToString:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTProximityEvent combinedSignificanceScores](self, "combinedSignificanceScores");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndexedSubscript:", v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "intValue");

        if (v47 >= 1)
        {
          -[RTProximityEvent combinedSignificanceScores](self, "combinedSignificanceScores");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectAtIndexedSubscript:", v43);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringValue");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Significance:%@"), v44);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v50, v51);

        }
        ++v43;
        -[RTProximityEvent combinedSignificanceScores](self, "combinedSignificanceScores");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "count");

      }
      while (v53 > v43);
    }
  }
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
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
  -[RTProximityEvent descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v11);
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
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[RTProximityEvent eventID](self, "eventID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTProximityEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTProximityEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RTProximityEvent relationship](self, "relationship");
  -[RTProximityEvent socialScore](self, "socialScore");
  v10 = v9;
  -[RTProximityEvent combinedFrequencyScores](self, "combinedFrequencyScores");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTProximityEvent combinedRecencyScores](self, "combinedRecencyScores");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTProximityEvent combinedSignificanceScores](self, "combinedSignificanceScores");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithEventID:startDate:endDate:relationship:socialScore:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:", v5, v6, v7, v8, v11, v12, v10, v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTProximityEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  RTProximityEvent *v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EventID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("Relationship"));
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("SocialScore"));
  v13 = v12;
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("CombinedFrequency"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("CombinedRecency"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ContactSignificance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[RTProximityEvent initWithEventID:startDate:endDate:relationship:socialScore:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:](self, "initWithEventID:startDate:endDate:relationship:socialScore:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:", v8, v9, v10, v11, v14, v15, v13, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *eventID;
  id v5;

  eventID = self->_eventID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventID, CFSTR("EventID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("StartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("EndDate"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_relationship, CFSTR("Relationship"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("SocialScore"), self->_socialScore);
  objc_msgSend(v5, "encodeObject:forKey:", self->_combinedFrequencyScores, CFSTR("CombinedFrequency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_combinedRecencyScores, CFSTR("CombinedRecency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_combinedSignificanceScores, CFSTR("ContactSignificance"));

}

- (NSUUID)eventID
{
  return self->_eventID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)socialScore
{
  return self->_socialScore;
}

- (NSArray)combinedFrequencyScores
{
  return self->_combinedFrequencyScores;
}

- (NSArray)combinedRecencyScores
{
  return self->_combinedRecencyScores;
}

- (NSArray)combinedSignificanceScores
{
  return self->_combinedSignificanceScores;
}

- (int64_t)relationship
{
  return self->_relationship;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedSignificanceScores, 0);
  objc_storeStrong((id *)&self->_combinedRecencyScores, 0);
  objc_storeStrong((id *)&self->_combinedFrequencyScores, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end
