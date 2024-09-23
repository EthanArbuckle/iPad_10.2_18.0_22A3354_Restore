@implementation HAMenstrualAlgorithmsDeviationAnalysis

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsDeviationAnalysis)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsDeviationAnalysis *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  HAMenstrualAlgorithmsDeviation *irregularBleeding;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  HAMenstrualAlgorithmsDeviation *infrequentBleeding;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  HAMenstrualAlgorithmsDeviation *prolongedBleeding;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  HAMenstrualAlgorithmsDeviation *spotting;
  HAMenstrualAlgorithmsDeviationAnalysis *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HAMenstrualAlgorithmsDeviationAnalysis;
  v5 = -[HAMenstrualAlgorithmsDeviationAnalysis init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_irregularBleeding);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    irregularBleeding = v5->_irregularBleeding;
    v5->_irregularBleeding = (HAMenstrualAlgorithmsDeviation *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_infrequentBleeding);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    infrequentBleeding = v5->_infrequentBleeding;
    v5->_infrequentBleeding = (HAMenstrualAlgorithmsDeviation *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_prolongedBleeding);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    prolongedBleeding = v5->_prolongedBleeding;
    v5->_prolongedBleeding = (HAMenstrualAlgorithmsDeviation *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_spotting);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    spotting = v5->_spotting;
    v5->_spotting = (HAMenstrualAlgorithmsDeviation *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HAMenstrualAlgorithmsDeviation *irregularBleeding;
  void *v5;
  HAMenstrualAlgorithmsDeviation *infrequentBleeding;
  void *v7;
  HAMenstrualAlgorithmsDeviation *prolongedBleeding;
  void *v9;
  HAMenstrualAlgorithmsDeviation *spotting;
  void *v11;
  id v12;

  v12 = a3;
  irregularBleeding = self->_irregularBleeding;
  NSStringFromSelector(sel_irregularBleeding);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", irregularBleeding, v5);

  infrequentBleeding = self->_infrequentBleeding;
  NSStringFromSelector(sel_infrequentBleeding);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", infrequentBleeding, v7);

  prolongedBleeding = self->_prolongedBleeding;
  NSStringFromSelector(sel_prolongedBleeding);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", prolongedBleeding, v9);

  spotting = self->_spotting;
  NSStringFromSelector(sel_spotting);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", spotting, v11);

}

- (HAMenstrualAlgorithmsDeviation)irregularBleeding
{
  return self->_irregularBleeding;
}

- (void)setIrregularBleeding:(id)a3
{
  objc_storeStrong((id *)&self->_irregularBleeding, a3);
}

- (HAMenstrualAlgorithmsDeviation)infrequentBleeding
{
  return self->_infrequentBleeding;
}

- (void)setInfrequentBleeding:(id)a3
{
  objc_storeStrong((id *)&self->_infrequentBleeding, a3);
}

- (HAMenstrualAlgorithmsDeviation)prolongedBleeding
{
  return self->_prolongedBleeding;
}

- (void)setProlongedBleeding:(id)a3
{
  objc_storeStrong((id *)&self->_prolongedBleeding, a3);
}

- (HAMenstrualAlgorithmsDeviation)spotting
{
  return self->_spotting;
}

- (void)setSpotting:(id)a3
{
  objc_storeStrong((id *)&self->_spotting, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotting, 0);
  objc_storeStrong((id *)&self->_prolongedBleeding, 0);
  objc_storeStrong((id *)&self->_infrequentBleeding, 0);
  objc_storeStrong((id *)&self->_irregularBleeding, 0);
}

@end
