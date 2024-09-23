@implementation HAMenstrualAlgorithmsDayStreamProcessorConfig

- (NSNumber)userReportedMenstruationLength
{
  return self->_userReportedMenstruationLength;
}

- (NSNumber)userReportedCycleLength
{
  return self->_userReportedCycleLength;
}

- (NSNumber)julianDayOfUserReportedMenstruationLength
{
  return self->_julianDayOfUserReportedMenstruationLength;
}

- (NSNumber)julianDayOfUserReportedCycleLength
{
  return self->_julianDayOfUserReportedCycleLength;
}

- (HAMenstrualAlgorithmsDeviationInput)deviationInput
{
  return self->_deviationInput;
}

- (NSDateComponents)birthDateComponents
{
  return self->_birthDateComponents;
}

- (unsigned)todayAsJulianDay
{
  return self->_todayAsJulianDay;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsDayStreamProcessorConfig)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsDayStreamProcessorConfig *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSNumber *userReportedCycleLength;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSNumber *julianDayOfUserReportedCycleLength;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSNumber *userReportedMenstruationLength;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSNumber *julianDayOfUserReportedMenstruationLength;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDateComponents *birthDateComponents;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  HAMenstrualAlgorithmsDeviationInput *deviationInput;
  void *v30;
  HAMenstrualAlgorithmsDayStreamProcessorConfig *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HAMenstrualAlgorithmsDayStreamProcessorConfig;
  v5 = -[HAMenstrualAlgorithmsDayStreamProcessorConfig init](&v33, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_userReportedCycleLength);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    userReportedCycleLength = v5->_userReportedCycleLength;
    v5->_userReportedCycleLength = (NSNumber *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_julianDayOfUserReportedCycleLength);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    julianDayOfUserReportedCycleLength = v5->_julianDayOfUserReportedCycleLength;
    v5->_julianDayOfUserReportedCycleLength = (NSNumber *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_userReportedMenstruationLength);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    userReportedMenstruationLength = v5->_userReportedMenstruationLength;
    v5->_userReportedMenstruationLength = (NSNumber *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_julianDayOfUserReportedMenstruationLength);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    julianDayOfUserReportedMenstruationLength = v5->_julianDayOfUserReportedMenstruationLength;
    v5->_julianDayOfUserReportedMenstruationLength = (NSNumber *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_birthDateComponents);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    birthDateComponents = v5->_birthDateComponents;
    v5->_birthDateComponents = (NSDateComponents *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_deviationInput);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    deviationInput = v5->_deviationInput;
    v5->_deviationInput = (HAMenstrualAlgorithmsDeviationInput *)v28;

    NSStringFromSelector(sel_todayAsJulianDay);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_todayAsJulianDay = objc_msgSend(v4, "decodeInt32ForKey:", v30);

    v31 = v5;
  }

  return v5;
}

- (void)setUserReportedMenstruationLength:(id)a3
{
  objc_storeStrong((id *)&self->_userReportedMenstruationLength, a3);
}

- (void)setUserReportedCycleLength:(id)a3
{
  objc_storeStrong((id *)&self->_userReportedCycleLength, a3);
}

- (void)setTodayAsJulianDay:(unsigned int)a3
{
  self->_todayAsJulianDay = a3;
}

- (void)setJulianDayOfUserReportedMenstruationLength:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayOfUserReportedMenstruationLength, a3);
}

- (void)setJulianDayOfUserReportedCycleLength:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayOfUserReportedCycleLength, a3);
}

- (void)setDeviationInput:(id)a3
{
  objc_storeStrong((id *)&self->_deviationInput, a3);
}

- (void)setBirthDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_birthDateComponents, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *userReportedCycleLength;
  void *v5;
  NSNumber *julianDayOfUserReportedCycleLength;
  void *v7;
  NSNumber *userReportedMenstruationLength;
  void *v9;
  NSNumber *julianDayOfUserReportedMenstruationLength;
  void *v11;
  NSDateComponents *birthDateComponents;
  void *v13;
  HAMenstrualAlgorithmsDeviationInput *deviationInput;
  void *v15;
  uint64_t todayAsJulianDay;
  void *v17;
  id v18;

  v18 = a3;
  userReportedCycleLength = self->_userReportedCycleLength;
  NSStringFromSelector(sel_userReportedCycleLength);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", userReportedCycleLength, v5);

  julianDayOfUserReportedCycleLength = self->_julianDayOfUserReportedCycleLength;
  NSStringFromSelector(sel_julianDayOfUserReportedCycleLength);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", julianDayOfUserReportedCycleLength, v7);

  userReportedMenstruationLength = self->_userReportedMenstruationLength;
  NSStringFromSelector(sel_userReportedMenstruationLength);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", userReportedMenstruationLength, v9);

  julianDayOfUserReportedMenstruationLength = self->_julianDayOfUserReportedMenstruationLength;
  NSStringFromSelector(sel_julianDayOfUserReportedMenstruationLength);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", julianDayOfUserReportedMenstruationLength, v11);

  birthDateComponents = self->_birthDateComponents;
  NSStringFromSelector(sel_birthDateComponents);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", birthDateComponents, v13);

  deviationInput = self->_deviationInput;
  NSStringFromSelector(sel_deviationInput);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", deviationInput, v15);

  todayAsJulianDay = self->_todayAsJulianDay;
  NSStringFromSelector(sel_todayAsJulianDay);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeInt32:forKey:", todayAsJulianDay, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviationInput, 0);
  objc_storeStrong((id *)&self->_birthDateComponents, 0);
  objc_storeStrong((id *)&self->_julianDayOfUserReportedMenstruationLength, 0);
  objc_storeStrong((id *)&self->_userReportedMenstruationLength, 0);
  objc_storeStrong((id *)&self->_julianDayOfUserReportedCycleLength, 0);
  objc_storeStrong((id *)&self->_userReportedCycleLength, 0);
}

@end
