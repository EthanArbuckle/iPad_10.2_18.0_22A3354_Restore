@implementation HAMenstrualAlgorithmsDayInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t julianDay;
  void *v5;
  uint64_t flow;
  void *v7;
  void *v8;
  uint64_t ovulationTestResult;
  void *v10;
  HAMenstrualAlgorithmsHeartRateStatistics *sedentaryHeartRateStatistics;
  void *v12;
  HAMenstrualAlgorithmsHeartRateStatistics *sleepHeartRateStatistics;
  void *v14;
  HAMenstrualAlgorithmsWristTemperature *wristTemperature;
  void *v16;
  id v17;

  v17 = a3;
  julianDay = self->_julianDay;
  NSStringFromSelector(sel_julianDay);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeInt32:forKey:", julianDay, v5);

  flow = self->_flow;
  NSStringFromSelector(sel_flow);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeInt32:forKey:", flow, v7);

  LODWORD(flow) = self->_spotting;
  NSStringFromSelector(sel_spotting);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeBool:forKey:", (_DWORD)flow != 0, v8);

  ovulationTestResult = self->_ovulationTestResult;
  NSStringFromSelector(sel_ovulationTestResult);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeInt32:forKey:", ovulationTestResult, v10);

  sedentaryHeartRateStatistics = self->_sedentaryHeartRateStatistics;
  NSStringFromSelector(sel_sedentaryHeartRateStatistics);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", sedentaryHeartRateStatistics, v12);

  sleepHeartRateStatistics = self->_sleepHeartRateStatistics;
  NSStringFromSelector(sel_sleepHeartRateStatistics);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", sleepHeartRateStatistics, v14);

  wristTemperature = self->_wristTemperature;
  NSStringFromSelector(sel_wristTemperature);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", wristTemperature, v16);

}

- (HAMenstrualAlgorithmsDayInput)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsDayInput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  HAMenstrualAlgorithmsHeartRateStatistics *sedentaryHeartRateStatistics;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  HAMenstrualAlgorithmsHeartRateStatistics *sleepHeartRateStatistics;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  HAMenstrualAlgorithmsWristTemperature *wristTemperature;
  HAMenstrualAlgorithmsDayInput *v22;

  v4 = a3;
  v5 = -[HAMenstrualAlgorithmsDayInput init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_julianDay);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_julianDay = objc_msgSend(v4, "decodeInt32ForKey:", v6);

    NSStringFromSelector(sel_flow);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_flow = objc_msgSend(v4, "decodeInt32ForKey:", v7);

    NSStringFromSelector(sel_spotting);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_spotting = objc_msgSend(v4, "decodeBoolForKey:", v8);

    NSStringFromSelector(sel_ovulationTestResult);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ovulationTestResult = objc_msgSend(v4, "decodeInt32ForKey:", v9);

    v10 = objc_opt_class();
    NSStringFromSelector(sel_sedentaryHeartRateStatistics);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    sedentaryHeartRateStatistics = v5->_sedentaryHeartRateStatistics;
    v5->_sedentaryHeartRateStatistics = (HAMenstrualAlgorithmsHeartRateStatistics *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_sleepHeartRateStatistics);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    sleepHeartRateStatistics = v5->_sleepHeartRateStatistics;
    v5->_sleepHeartRateStatistics = (HAMenstrualAlgorithmsHeartRateStatistics *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_wristTemperature);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    wristTemperature = v5->_wristTemperature;
    v5->_wristTemperature = (HAMenstrualAlgorithmsWristTemperature *)v20;

    v22 = v5;
  }

  return v5;
}

- (unsigned)julianDay
{
  return self->_julianDay;
}

- (void)setJulianDay:(unsigned int)a3
{
  self->_julianDay = a3;
}

- (unsigned)flow
{
  return self->_flow;
}

- (void)setFlow:(unsigned __int8)a3
{
  self->_flow = a3;
}

- (BOOL)spotting
{
  return self->_spotting;
}

- (void)setSpotting:(BOOL)a3
{
  self->_spotting = a3;
}

- (unsigned)ovulationTestResult
{
  return self->_ovulationTestResult;
}

- (void)setOvulationTestResult:(unsigned __int8)a3
{
  self->_ovulationTestResult = a3;
}

- (HAMenstrualAlgorithmsHeartRateStatistics)sedentaryHeartRateStatistics
{
  return self->_sedentaryHeartRateStatistics;
}

- (void)setSedentaryHeartRateStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_sedentaryHeartRateStatistics, a3);
}

- (HAMenstrualAlgorithmsHeartRateStatistics)sleepHeartRateStatistics
{
  return self->_sleepHeartRateStatistics;
}

- (void)setSleepHeartRateStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_sleepHeartRateStatistics, a3);
}

- (HAMenstrualAlgorithmsWristTemperature)wristTemperature
{
  return self->_wristTemperature;
}

- (void)setWristTemperature:(id)a3
{
  objc_storeStrong((id *)&self->_wristTemperature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristTemperature, 0);
  objc_storeStrong((id *)&self->_sleepHeartRateStatistics, 0);
  objc_storeStrong((id *)&self->_sedentaryHeartRateStatistics, 0);
}

@end
