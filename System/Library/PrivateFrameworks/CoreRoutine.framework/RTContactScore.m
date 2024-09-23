@implementation RTContactScore

- (RTContactScore)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithContactID_frequencyScore_recencyScore_significanceScore_frequencyCount_runningMean_runningMeanOfSquares_);
}

- (RTContactScore)initWithContactID:(id)a3 frequencyScore:(double)a4 recencyScore:(double)a5 significanceScore:(double)a6 frequencyCount:(unint64_t)a7 runningMean:(double)a8 runningMeanOfSquares:(double)a9
{
  id v17;
  RTContactScore *v18;
  RTContactScore *v19;
  RTContactScore *v20;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[16];

  v17 = a3;
  if (v17)
  {
    v23.receiver = self;
    v23.super_class = (Class)RTContactScore;
    v18 = -[RTContactScore init](&v23, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_contactID, a3);
      v19->_frequencyScore = a4;
      v19->_recencyScore = a5;
      v19->_significanceScore = a6;
      v19->_frequencyCount = a7;
      v19->_runningMean = a8;
      v19->_runningMeanOfSquares = a9;
    }
    self = v19;
    v20 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", buf, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (void)mergeWithAnotherContactScore:(id)a3
{
  id v4;
  NSString *contactID;
  NSString *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a3;
  contactID = self->_contactID;
  v12 = v4;
  objc_msgSend(v4, "contactID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (contactID == v6)
  {
    self->_frequencyCount += objc_msgSend(v12, "frequencyCount");
    objc_msgSend(v12, "frequencyScore");
    self->_frequencyScore = v7;
    objc_msgSend(v12, "recencyScore");
    self->_recencyScore = v8;
    objc_msgSend(v12, "significanceScore");
    self->_significanceScore = v9;
    objc_msgSend(v12, "runningMean");
    self->_runningMean = v10;
    objc_msgSend(v12, "runningMeanOfSquares");
    self->_runningMeanOfSquares = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  RTContactScore *v4;
  RTContactScore *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v4 = (RTContactScore *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTContactScore contactID](self, "contactID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTContactScore contactID](v5, "contactID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7)
        && (-[RTContactScore frequencyScore](self, "frequencyScore"),
            v9 = v8,
            -[RTContactScore frequencyScore](v5, "frequencyScore"),
            v9 == v10)
        && (-[RTContactScore recencyScore](self, "recencyScore"),
            v12 = v11,
            -[RTContactScore recencyScore](v5, "recencyScore"),
            v12 == v13))
      {
        -[RTContactScore significanceScore](self, "significanceScore");
        v15 = v14;
        -[RTContactScore significanceScore](v5, "significanceScore");
        v17 = v15 == v16;
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v9[0] = self->_contactID;
  v8[0] = CFSTR("ContactID");
  v8[1] = CFSTR("FrequencyScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frequencyScore);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("RecencyScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_recencyScore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("SignificanceScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_significanceScore);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  -[RTContactScore descriptionDictionary](self, "descriptionDictionary");
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
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContactID:frequencyScore:recencyScore:significanceScore:frequencyCount:runningMean:runningMeanOfSquares:", self->_contactID, self->_frequencyCount, self->_frequencyScore, self->_recencyScore, self->_significanceScore, self->_runningMean, self->_runningMeanOfSquares);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTContactScore)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  RTContactScore *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContactID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FrequencyScore"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RecencyScore"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SignificanceScore"));
  v11 = v10;
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FrequencyCount"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RunningMean"));
  v14 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("RunningMeanOfSquares"));
  v16 = v15;

  v17 = -[RTContactScore initWithContactID:frequencyScore:recencyScore:significanceScore:frequencyCount:runningMean:runningMeanOfSquares:](self, "initWithContactID:frequencyScore:recencyScore:significanceScore:frequencyCount:runningMean:runningMeanOfSquares:", v5, v12, v7, v9, v11, v14, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactID;
  id v5;

  contactID = self->_contactID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactID, CFSTR("ContactID"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FrequencyScore"), self->_frequencyScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("RecencyScore"), self->_recencyScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("SignificanceScore"), self->_significanceScore);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_frequencyCount, CFSTR("FrequencyCount"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("RunningMean"), self->_runningMean);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("RunningMeanOfSquares"), self->_runningMeanOfSquares);

}

- (NSString)contactID
{
  return self->_contactID;
}

- (double)frequencyScore
{
  return self->_frequencyScore;
}

- (void)setFrequencyScore:(double)a3
{
  self->_frequencyScore = a3;
}

- (double)recencyScore
{
  return self->_recencyScore;
}

- (void)setRecencyScore:(double)a3
{
  self->_recencyScore = a3;
}

- (double)significanceScore
{
  return self->_significanceScore;
}

- (void)setSignificanceScore:(double)a3
{
  self->_significanceScore = a3;
}

- (unint64_t)frequencyCount
{
  return self->_frequencyCount;
}

- (void)setFrequencyCount:(unint64_t)a3
{
  self->_frequencyCount = a3;
}

- (double)runningMean
{
  return self->_runningMean;
}

- (void)setRunningMean:(double)a3
{
  self->_runningMean = a3;
}

- (double)runningMeanOfSquares
{
  return self->_runningMeanOfSquares;
}

- (void)setRunningMeanOfSquares:(double)a3
{
  self->_runningMeanOfSquares = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactID, 0);
}

@end
