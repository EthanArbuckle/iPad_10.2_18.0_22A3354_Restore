@implementation HAMenstrualAlgorithmsStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *medianCycleLength;
  void *v5;
  NSNumber *medianMenstruationLength;
  void *v7;
  NSNumber *lowerCycleLengthPercentile;
  void *v9;
  NSNumber *lowerMenstruationLengthPercentile;
  void *v11;
  NSNumber *upperCycleLengthPercentile;
  void *v13;
  NSNumber *upperMenstruationLengthPercentile;
  void *v15;
  NSNumber *numberOfCyclesFound;
  void *v17;
  NSNumber *julianDayOfFirstCycleStart;
  void *v19;
  NSNumber *julianDayOfLastCycleStart;
  void *v21;
  id v22;

  v22 = a3;
  medianCycleLength = self->_medianCycleLength;
  NSStringFromSelector(sel_medianCycleLength);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", medianCycleLength, v5);

  medianMenstruationLength = self->_medianMenstruationLength;
  NSStringFromSelector(sel_medianMenstruationLength);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", medianMenstruationLength, v7);

  lowerCycleLengthPercentile = self->_lowerCycleLengthPercentile;
  NSStringFromSelector(sel_lowerCycleLengthPercentile);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", lowerCycleLengthPercentile, v9);

  lowerMenstruationLengthPercentile = self->_lowerMenstruationLengthPercentile;
  NSStringFromSelector(sel_lowerMenstruationLengthPercentile);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", lowerMenstruationLengthPercentile, v11);

  upperCycleLengthPercentile = self->_upperCycleLengthPercentile;
  NSStringFromSelector(sel_upperCycleLengthPercentile);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", upperCycleLengthPercentile, v13);

  upperMenstruationLengthPercentile = self->_upperMenstruationLengthPercentile;
  NSStringFromSelector(sel_upperMenstruationLengthPercentile);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", upperMenstruationLengthPercentile, v15);

  numberOfCyclesFound = self->_numberOfCyclesFound;
  NSStringFromSelector(sel_numberOfCyclesFound);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", numberOfCyclesFound, v17);

  julianDayOfFirstCycleStart = self->_julianDayOfFirstCycleStart;
  NSStringFromSelector(sel_julianDayOfFirstCycleStart);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", julianDayOfFirstCycleStart, v19);

  julianDayOfLastCycleStart = self->_julianDayOfLastCycleStart;
  NSStringFromSelector(sel_julianDayOfLastCycleStart);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", julianDayOfLastCycleStart, v21);

}

- (HAMenstrualAlgorithmsStats)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsStats *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSNumber *medianCycleLength;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSNumber *medianMenstruationLength;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSNumber *lowerCycleLengthPercentile;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSNumber *lowerMenstruationLengthPercentile;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSNumber *upperCycleLengthPercentile;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSNumber *upperMenstruationLengthPercentile;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSNumber *numberOfCyclesFound;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSNumber *julianDayOfFirstCycleStart;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSNumber *julianDayOfLastCycleStart;
  HAMenstrualAlgorithmsStats *v42;

  v4 = a3;
  v5 = -[HAMenstrualAlgorithmsStats init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_medianCycleLength);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    medianCycleLength = v5->_medianCycleLength;
    v5->_medianCycleLength = (NSNumber *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_medianMenstruationLength);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    medianMenstruationLength = v5->_medianMenstruationLength;
    v5->_medianMenstruationLength = (NSNumber *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_lowerCycleLengthPercentile);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    lowerCycleLengthPercentile = v5->_lowerCycleLengthPercentile;
    v5->_lowerCycleLengthPercentile = (NSNumber *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_lowerMenstruationLengthPercentile);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    lowerMenstruationLengthPercentile = v5->_lowerMenstruationLengthPercentile;
    v5->_lowerMenstruationLengthPercentile = (NSNumber *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_upperCycleLengthPercentile);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    upperCycleLengthPercentile = v5->_upperCycleLengthPercentile;
    v5->_upperCycleLengthPercentile = (NSNumber *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_upperMenstruationLengthPercentile);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    upperMenstruationLengthPercentile = v5->_upperMenstruationLengthPercentile;
    v5->_upperMenstruationLengthPercentile = (NSNumber *)v28;

    v30 = objc_opt_class();
    NSStringFromSelector(sel_numberOfCyclesFound);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    numberOfCyclesFound = v5->_numberOfCyclesFound;
    v5->_numberOfCyclesFound = (NSNumber *)v32;

    v34 = objc_opt_class();
    NSStringFromSelector(sel_julianDayOfFirstCycleStart);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    julianDayOfFirstCycleStart = v5->_julianDayOfFirstCycleStart;
    v5->_julianDayOfFirstCycleStart = (NSNumber *)v36;

    v38 = objc_opt_class();
    NSStringFromSelector(sel_julianDayOfLastCycleStart);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    julianDayOfLastCycleStart = v5->_julianDayOfLastCycleStart;
    v5->_julianDayOfLastCycleStart = (NSNumber *)v40;

    v42 = v5;
  }

  return v5;
}

- (NSNumber)medianCycleLength
{
  return self->_medianCycleLength;
}

- (void)setMedianCycleLength:(id)a3
{
  objc_storeStrong((id *)&self->_medianCycleLength, a3);
}

- (NSNumber)medianMenstruationLength
{
  return self->_medianMenstruationLength;
}

- (void)setMedianMenstruationLength:(id)a3
{
  objc_storeStrong((id *)&self->_medianMenstruationLength, a3);
}

- (NSNumber)lowerCycleLengthPercentile
{
  return self->_lowerCycleLengthPercentile;
}

- (void)setLowerCycleLengthPercentile:(id)a3
{
  objc_storeStrong((id *)&self->_lowerCycleLengthPercentile, a3);
}

- (NSNumber)lowerMenstruationLengthPercentile
{
  return self->_lowerMenstruationLengthPercentile;
}

- (void)setLowerMenstruationLengthPercentile:(id)a3
{
  objc_storeStrong((id *)&self->_lowerMenstruationLengthPercentile, a3);
}

- (NSNumber)upperCycleLengthPercentile
{
  return self->_upperCycleLengthPercentile;
}

- (void)setUpperCycleLengthPercentile:(id)a3
{
  objc_storeStrong((id *)&self->_upperCycleLengthPercentile, a3);
}

- (NSNumber)upperMenstruationLengthPercentile
{
  return self->_upperMenstruationLengthPercentile;
}

- (void)setUpperMenstruationLengthPercentile:(id)a3
{
  objc_storeStrong((id *)&self->_upperMenstruationLengthPercentile, a3);
}

- (NSNumber)numberOfCyclesFound
{
  return self->_numberOfCyclesFound;
}

- (void)setNumberOfCyclesFound:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfCyclesFound, a3);
}

- (NSNumber)julianDayOfFirstCycleStart
{
  return self->_julianDayOfFirstCycleStart;
}

- (void)setJulianDayOfFirstCycleStart:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayOfFirstCycleStart, a3);
}

- (NSNumber)julianDayOfLastCycleStart
{
  return self->_julianDayOfLastCycleStart;
}

- (void)setJulianDayOfLastCycleStart:(id)a3
{
  objc_storeStrong((id *)&self->_julianDayOfLastCycleStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_julianDayOfLastCycleStart, 0);
  objc_storeStrong((id *)&self->_julianDayOfFirstCycleStart, 0);
  objc_storeStrong((id *)&self->_numberOfCyclesFound, 0);
  objc_storeStrong((id *)&self->_upperMenstruationLengthPercentile, 0);
  objc_storeStrong((id *)&self->_upperCycleLengthPercentile, 0);
  objc_storeStrong((id *)&self->_lowerMenstruationLengthPercentile, 0);
  objc_storeStrong((id *)&self->_lowerCycleLengthPercentile, 0);
  objc_storeStrong((id *)&self->_medianMenstruationLength, 0);
  objc_storeStrong((id *)&self->_medianCycleLength, 0);
}

@end
