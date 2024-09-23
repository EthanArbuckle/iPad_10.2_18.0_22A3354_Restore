@implementation HAMenstrualAlgorithmsDeviationInput

- (NSNumber)julianDayMinAnalysisWindowStartSpotting
{
  return self->_julianDayMinAnalysisWindowStartSpotting;
}

- (NSNumber)julianDayMinAnalysisWindowStartProlonged
{
  return self->_julianDayMinAnalysisWindowStartProlonged;
}

- (NSNumber)julianDayMinAnalysisWindowStartIrregular
{
  return self->_julianDayMinAnalysisWindowStartIrregular;
}

- (NSNumber)julianDayMinAnalysisWindowStartInfrequent
{
  return self->_julianDayMinAnalysisWindowStartInfrequent;
}

- (NSNumber)julianDayMinAnalysisWindowEndSpotting
{
  return self->_julianDayMinAnalysisWindowEndSpotting;
}

- (NSNumber)julianDayMinAnalysisWindowEndProlonged
{
  return self->_julianDayMinAnalysisWindowEndProlonged;
}

- (NSNumber)julianDayMinAnalysisWindowEndIrregular
{
  return self->_julianDayMinAnalysisWindowEndIrregular;
}

- (NSNumber)julianDayMinAnalysisWindowEndInfrequent
{
  return self->_julianDayMinAnalysisWindowEndInfrequent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsDeviationInput)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsDeviationInput *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSNumber *julianDayMinAnalysisWindowStartIrregular;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSNumber *julianDayMinAnalysisWindowStartInfrequent;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSNumber *julianDayMinAnalysisWindowStartProlonged;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSNumber *julianDayMinAnalysisWindowStartSpotting;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSNumber *julianDayMinAnalysisWindowEndIrregular;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSNumber *julianDayMinAnalysisWindowEndInfrequent;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSNumber *julianDayMinAnalysisWindowEndProlonged;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSNumber *julianDayMinAnalysisWindowEndSpotting;
  HAMenstrualAlgorithmsDeviationInput *v38;

  v4 = a3;
  v5 = -[HAMenstrualAlgorithmsDeviationInput init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_julianDayMinAnalysisWindowStartIrregular);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    julianDayMinAnalysisWindowStartIrregular = v5->_julianDayMinAnalysisWindowStartIrregular;
    v5->_julianDayMinAnalysisWindowStartIrregular = (NSNumber *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_julianDayMinAnalysisWindowStartInfrequent);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    julianDayMinAnalysisWindowStartInfrequent = v5->_julianDayMinAnalysisWindowStartInfrequent;
    v5->_julianDayMinAnalysisWindowStartInfrequent = (NSNumber *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_julianDayMinAnalysisWindowStartProlonged);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    julianDayMinAnalysisWindowStartProlonged = v5->_julianDayMinAnalysisWindowStartProlonged;
    v5->_julianDayMinAnalysisWindowStartProlonged = (NSNumber *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_julianDayMinAnalysisWindowStartSpotting);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    julianDayMinAnalysisWindowStartSpotting = v5->_julianDayMinAnalysisWindowStartSpotting;
    v5->_julianDayMinAnalysisWindowStartSpotting = (NSNumber *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_julianDayMinAnalysisWindowEndIrregular);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    julianDayMinAnalysisWindowEndIrregular = v5->_julianDayMinAnalysisWindowEndIrregular;
    v5->_julianDayMinAnalysisWindowEndIrregular = (NSNumber *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_julianDayMinAnalysisWindowEndInfrequent);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    julianDayMinAnalysisWindowEndInfrequent = v5->_julianDayMinAnalysisWindowEndInfrequent;
    v5->_julianDayMinAnalysisWindowEndInfrequent = (NSNumber *)v28;

    v30 = objc_opt_class();
    NSStringFromSelector(sel_julianDayMinAnalysisWindowEndProlonged);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    julianDayMinAnalysisWindowEndProlonged = v5->_julianDayMinAnalysisWindowEndProlonged;
    v5->_julianDayMinAnalysisWindowEndProlonged = (NSNumber *)v32;

    v34 = objc_opt_class();
    NSStringFromSelector(sel_julianDayMinAnalysisWindowEndSpotting);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    julianDayMinAnalysisWindowEndSpotting = v5->_julianDayMinAnalysisWindowEndSpotting;
    v5->_julianDayMinAnalysisWindowEndSpotting = (NSNumber *)v36;

    v38 = v5;
  }

  return v5;
}

- (void)setJulianDayMinAnalysisWindowStartSpotting:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartSpotting, a3);
}

- (void)setJulianDayMinAnalysisWindowStartProlonged:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartProlonged, a3);
}

- (void)setJulianDayMinAnalysisWindowStartIrregular:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartIrregular, a3);
}

- (void)setJulianDayMinAnalysisWindowStartInfrequent:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartInfrequent, a3);
}

- (void)setJulianDayMinAnalysisWindowEndSpotting:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndSpotting, a3);
}

- (void)setJulianDayMinAnalysisWindowEndProlonged:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndProlonged, a3);
}

- (void)setJulianDayMinAnalysisWindowEndIrregular:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndIrregular, a3);
}

- (void)setJulianDayMinAnalysisWindowEndInfrequent:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndInfrequent, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *julianDayMinAnalysisWindowStartIrregular;
  void *v5;
  NSNumber *julianDayMinAnalysisWindowStartInfrequent;
  void *v7;
  NSNumber *julianDayMinAnalysisWindowStartProlonged;
  void *v9;
  NSNumber *julianDayMinAnalysisWindowStartSpotting;
  void *v11;
  NSNumber *julianDayMinAnalysisWindowEndIrregular;
  void *v13;
  NSNumber *julianDayMinAnalysisWindowEndInfrequent;
  void *v15;
  NSNumber *julianDayMinAnalysisWindowEndProlonged;
  void *v17;
  NSNumber *julianDayMinAnalysisWindowEndSpotting;
  void *v19;
  id v20;

  v20 = a3;
  julianDayMinAnalysisWindowStartIrregular = self->_julianDayMinAnalysisWindowStartIrregular;
  NSStringFromSelector(sel_julianDayMinAnalysisWindowStartIrregular);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", julianDayMinAnalysisWindowStartIrregular, v5);

  julianDayMinAnalysisWindowStartInfrequent = self->_julianDayMinAnalysisWindowStartInfrequent;
  NSStringFromSelector(sel_julianDayMinAnalysisWindowStartInfrequent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", julianDayMinAnalysisWindowStartInfrequent, v7);

  julianDayMinAnalysisWindowStartProlonged = self->_julianDayMinAnalysisWindowStartProlonged;
  NSStringFromSelector(sel_julianDayMinAnalysisWindowStartProlonged);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", julianDayMinAnalysisWindowStartProlonged, v9);

  julianDayMinAnalysisWindowStartSpotting = self->_julianDayMinAnalysisWindowStartSpotting;
  NSStringFromSelector(sel_julianDayMinAnalysisWindowStartSpotting);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", julianDayMinAnalysisWindowStartSpotting, v11);

  julianDayMinAnalysisWindowEndIrregular = self->_julianDayMinAnalysisWindowEndIrregular;
  NSStringFromSelector(sel_julianDayMinAnalysisWindowEndIrregular);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", julianDayMinAnalysisWindowEndIrregular, v13);

  julianDayMinAnalysisWindowEndInfrequent = self->_julianDayMinAnalysisWindowEndInfrequent;
  NSStringFromSelector(sel_julianDayMinAnalysisWindowEndInfrequent);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", julianDayMinAnalysisWindowEndInfrequent, v15);

  julianDayMinAnalysisWindowEndProlonged = self->_julianDayMinAnalysisWindowEndProlonged;
  NSStringFromSelector(sel_julianDayMinAnalysisWindowEndProlonged);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", julianDayMinAnalysisWindowEndProlonged, v17);

  julianDayMinAnalysisWindowEndSpotting = self->_julianDayMinAnalysisWindowEndSpotting;
  NSStringFromSelector(sel_julianDayMinAnalysisWindowEndSpotting);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", julianDayMinAnalysisWindowEndSpotting, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndSpotting, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndProlonged, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndInfrequent, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowEndIrregular, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartSpotting, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartProlonged, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartInfrequent, 0);
  objc_storeStrong((id *)&self->_julianDayMinAnalysisWindowStartIrregular, 0);
}

@end
