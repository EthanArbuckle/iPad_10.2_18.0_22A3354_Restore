@implementation RTStoredVisitFetchOptions

- (NSSet)sources
{
  return self->_sources;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (NSNumber)confidence
{
  return self->_confidence;
}

- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 labelVisit:(BOOL)a6 limit:(id)a7 sources:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  RTStoredVisitFetchOptions *v21;
  RTStoredVisitFetchOptions *v22;
  uint64_t v23;
  NSSet *sources;
  RTStoredVisitFetchOptions *v25;
  NSObject *v26;
  const char *v27;
  objc_super v29;
  uint8_t buf[16];

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    if (v19 != 0.0)
    {
      objc_msgSend(v15, "doubleValue");
      if (v20 != 1.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v27 = "Invalid parameter not satisfying: !confidence || (confidence && (confidence.doubleValue == RTVisitConfid"
                "enceLow || confidence.doubleValue == RTVisitConfidenceHigh))";
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
  }
  if (v17 && !objc_msgSend(v17, "unsignedIntegerValue"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "Invalid parameter not satisfying: !limit || (limit && limit.unsignedIntegerValue > 0)";
      goto LABEL_17;
    }
LABEL_18:

    v25 = 0;
    goto LABEL_19;
  }
  if (v18 && !+[RTVisit validVisitSources:](RTVisit, "validVisitSources:", v18))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "Invalid parameter not satisfying: !sources || (sources && [RTVisit validVisitSources:sources])";
LABEL_17:
      _os_log_error_impl(&dword_1A5E26000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v29.receiver = self;
  v29.super_class = (Class)RTStoredVisitFetchOptions;
  v21 = -[RTStoredVisitFetchOptions init](&v29, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_ascending = a3;
    objc_storeStrong((id *)&v21->_confidence, a4);
    objc_storeStrong((id *)&v22->_dateInterval, a5);
    v22->_labelVisit = a6;
    objc_storeStrong((id *)&v22->_limit, a7);
    v23 = objc_msgSend(v18, "copy");
    sources = v22->_sources;
    v22->_sources = (NSSet *)v23;

  }
  self = v22;
  v25 = self;
LABEL_19:

  return v25;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
}

- (RTStoredVisitFetchOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAscending_confidence_dateInterval_labelVisit_limit_sources_);
}

- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 limit:(id)a6
{
  return -[RTStoredVisitFetchOptions initWithAscending:confidence:dateInterval:labelVisit:limit:](self, "initWithAscending:confidence:dateInterval:labelVisit:limit:", a3, a4, a5, 0, a6);
}

- (RTStoredVisitFetchOptions)initWithAscending:(BOOL)a3 confidence:(id)a4 dateInterval:(id)a5 labelVisit:(BOOL)a6 limit:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v10;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  RTStoredVisitFetchOptions *v17;

  v7 = a6;
  v10 = a3;
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  objc_msgSend(v12, "setWithObject:", &unk_1E4FC1208);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[RTStoredVisitFetchOptions initWithAscending:confidence:dateInterval:labelVisit:limit:sources:](self, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", v10, v15, v14, v7, v13, v16);

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 ascending;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  ascending = self->_ascending;
  v8 = a3;
  objc_msgSend(v4, "numberWithBool:", ascending);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("ascending"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_confidence, CFSTR("confidence"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_labelVisit);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("labelVisit"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_sources, CFSTR("sources"));

}

- (RTStoredVisitFetchOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  RTStoredVisitFetchOptions *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ascending"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labelVisit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("sources"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[RTStoredVisitFetchOptions initWithAscending:confidence:dateInterval:labelVisit:limit:sources:](self, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", v6, v7, v8, v10, v11, v15);
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  RTStoredVisitFetchOptions *v4;
  RTStoredVisitFetchOptions *v5;
  BOOL v6;

  v4 = (RTStoredVisitFetchOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTStoredVisitFetchOptions isEqualToFetchOptions:](self, "isEqualToFetchOptions:", v5);

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int ascending;
  int v8;
  NSNumber *confidence;
  uint64_t v10;
  NSNumber *v11;
  void *v12;
  NSDateInterval *dateInterval;
  uint64_t v14;
  void *v15;
  NSDateInterval *v16;
  void *v17;
  char v18;
  int labelVisit;
  int v20;
  NSNumber *limit;
  uint64_t v22;
  void *v23;
  NSNumber *v24;
  int v25;
  int v26;
  char v27;
  int v28;
  void *v29;
  char v30;
  uint64_t v31;
  NSSet *sources;
  uint64_t v33;
  void *v34;
  NSSet *v35;
  char v36;
  int v37;
  int v38;
  char v39;
  int v40;
  void *v41;
  char v42;
  uint64_t v43;
  char v44;
  char v45;
  char v46;
  void *v48;
  char v49;
  int v50;

  v6 = a3;
  ascending = self->_ascending;
  v8 = objc_msgSend(v6, "ascending");
  confidence = self->_confidence;
  if (!confidence)
  {
    objc_msgSend(v6, "confidence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (self->_confidence)
        goto LABEL_2;
      v49 = 0;
    }
    else
    {
      v49 = 1;
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_2:
  objc_msgSend(v6, "confidence");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v4 = (void *)v10;
    v11 = self->_confidence;
    objc_msgSend(v6, "confidence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[NSNumber isEqualToNumber:](v11, "isEqualToNumber:", v12);

    if (!confidence)
      goto LABEL_11;
  }
  else
  {
    v49 = 0;
    if (!confidence)
      goto LABEL_11;
  }
LABEL_12:
  dateInterval = self->_dateInterval;
  v50 = v8;
  if (dateInterval)
    goto LABEL_13;
  objc_msgSend(v6, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v18 = 1;
    goto LABEL_22;
  }
  if (self->_dateInterval)
  {
LABEL_13:
    objc_msgSend(v6, "dateInterval");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = self->_dateInterval;
      objc_msgSend(v6, "dateInterval");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSDateInterval isEqualToDateInterval:](v16, "isEqualToDateInterval:", v17);

      if (dateInterval)
        goto LABEL_23;
    }
    else
    {
      v18 = 0;
      if (dateInterval)
        goto LABEL_23;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_22:

LABEL_23:
  labelVisit = self->_labelVisit;
  v20 = objc_msgSend(v6, "labelVisit");
  limit = self->_limit;
  if (limit)
    goto LABEL_24;
  objc_msgSend(v6, "limit");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    v48 = 0;
    v30 = 1;
    goto LABEL_33;
  }
  v48 = (void *)v31;
  if (!self->_limit)
  {
    v30 = 0;
LABEL_33:

    goto LABEL_34;
  }
LABEL_24:
  objc_msgSend(v6, "limit", v48);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = self->_limit;
    objc_msgSend(v6, "limit");
    v25 = v20;
    v26 = labelVisit;
    v27 = v18;
    v28 = ascending;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[NSNumber isEqualToNumber:](v24, "isEqualToNumber:", v29);

    ascending = v28;
    v18 = v27;
    labelVisit = v26;
    v20 = v25;

    if (!limit)
      goto LABEL_33;
  }
  else
  {
    v30 = 0;
    if (!limit)
      goto LABEL_33;
  }
LABEL_34:
  sources = self->_sources;
  if (sources)
    goto LABEL_35;
  objc_msgSend(v6, "sources");
  v43 = objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    v48 = 0;
    v42 = 1;
    goto LABEL_44;
  }
  v48 = (void *)v43;
  if (self->_sources)
  {
LABEL_35:
    objc_msgSend(v6, "sources", v48);
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      v35 = self->_sources;
      objc_msgSend(v6, "sources");
      v36 = v30;
      v37 = v20;
      v38 = labelVisit;
      v39 = v18;
      v40 = ascending;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[NSSet isEqual:](v35, "isEqual:", v41);

      ascending = v40;
      v18 = v39;
      labelVisit = v38;
      v20 = v37;
      v30 = v36;

      if (sources)
        goto LABEL_45;
    }
    else
    {
      v42 = 0;
      if (sources)
        goto LABEL_45;
    }
  }
  else
  {
    v42 = 0;
  }
LABEL_44:

LABEL_45:
  v44 = v49;
  if (ascending != v50)
    v44 = 0;
  v45 = v44 & v18;
  if (labelVisit != v20)
    v45 = 0;
  v46 = v45 & v30 & v42;

  return v46;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  NSSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ascending);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSNumber hash](self->_confidence, "hash");
  v6 = v5 ^ -[NSDateInterval hash](self->_dateInterval, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_labelVisit);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NSNumber hash](self->_limit, "hash");

  if (-[NSSet count](self->_sources, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_sources;
    v11 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v9 ^= objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "hash", (_QWORD)v16);
        }
        while (v12 != v14);
        v12 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
  return v9;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  NSNumber *confidence;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  NSSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  if (self->_ascending)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  confidence = self->_confidence;
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_labelVisit)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ascending, %@, confidence, %@, startDate, %@, endDate, %@, labelVisit, %@, limit, %@"), v4, confidence, v7, v9, v11, self->_limit);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSSet count](self->_sources, "count"))
  {
    objc_msgSend(v12, "appendString:", CFSTR(", sources, ["));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = self->_sources;
    v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v18);

        }
        v15 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "deleteCharactersInRange:", objc_msgSend(v12, "length") - 2, 2);
    objc_msgSend(v12, "appendString:", CFSTR("]"));
  }
  return v12;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)labelVisit
{
  return self->_labelVisit;
}

@end
