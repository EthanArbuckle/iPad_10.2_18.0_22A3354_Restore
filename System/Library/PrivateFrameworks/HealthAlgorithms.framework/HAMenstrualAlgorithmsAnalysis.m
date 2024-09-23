@implementation HAMenstrualAlgorithmsAnalysis

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsAnalysis)init
{
  HAMenstrualAlgorithmsAnalysis *v2;
  HAMenstrualAlgorithmsAnalysis *v3;
  NSArray *menstruationPredictions;
  NSArray *v5;
  NSArray *fertilityPredictions;
  uint64_t v7;
  HAMenstrualAlgorithmsStats *stats;
  uint64_t v9;
  HAMenstrualAlgorithmsDeviationAnalysis *deviationAnalysis;
  HAMenstrualAlgorithmsAnalysis *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HAMenstrualAlgorithmsAnalysis;
  v2 = -[HAMenstrualAlgorithmsAnalysis init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    menstruationPredictions = v2->_menstruationPredictions;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_menstruationPredictions = (NSArray *)MEMORY[0x24BDBD1A8];

    fertilityPredictions = v3->_fertilityPredictions;
    v3->_fertilityPredictions = v5;

    v7 = objc_opt_new();
    stats = v3->_stats;
    v3->_stats = (HAMenstrualAlgorithmsStats *)v7;

    v9 = objc_opt_new();
    deviationAnalysis = v3->_deviationAnalysis;
    v3->_deviationAnalysis = (HAMenstrualAlgorithmsDeviationAnalysis *)v9;

    v11 = v3;
  }

  return v3;
}

- (HAMenstrualAlgorithmsAnalysis)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsAnalysis *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *menstruationPredictions;
  void *v12;
  uint64_t v13;
  NSArray *fertilityPredictions;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  HAMenstrualAlgorithmsStats *stats;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  HAMenstrualAlgorithmsDeviationAnalysis *deviationAnalysis;
  void *v23;
  HAMenstrualAlgorithmsAnalysis *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HAMenstrualAlgorithmsAnalysis init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_menstruationPredictions);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    menstruationPredictions = v5->_menstruationPredictions;
    v5->_menstruationPredictions = (NSArray *)v10;

    NSStringFromSelector(sel_fertilityPredictions);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    fertilityPredictions = v5->_fertilityPredictions;
    v5->_fertilityPredictions = (NSArray *)v13;

    v15 = objc_opt_class();
    NSStringFromSelector(sel_stats);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    stats = v5->_stats;
    v5->_stats = (HAMenstrualAlgorithmsStats *)v17;

    v19 = objc_opt_class();
    NSStringFromSelector(sel_deviationAnalysis);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    deviationAnalysis = v5->_deviationAnalysis;
    v5->_deviationAnalysis = (HAMenstrualAlgorithmsDeviationAnalysis *)v21;

    NSStringFromSelector(sel_isUserInactive);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isUserInactive = objc_msgSend(v4, "decodeBoolForKey:", v23);

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *menstruationPredictions;
  void *v5;
  NSArray *fertilityPredictions;
  void *v7;
  HAMenstrualAlgorithmsStats *stats;
  void *v9;
  HAMenstrualAlgorithmsDeviationAnalysis *deviationAnalysis;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  menstruationPredictions = self->_menstruationPredictions;
  NSStringFromSelector(sel_menstruationPredictions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", menstruationPredictions, v5);

  fertilityPredictions = self->_fertilityPredictions;
  NSStringFromSelector(sel_fertilityPredictions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", fertilityPredictions, v7);

  stats = self->_stats;
  NSStringFromSelector(sel_stats);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", stats, v9);

  deviationAnalysis = self->_deviationAnalysis;
  NSStringFromSelector(sel_deviationAnalysis);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", deviationAnalysis, v11);

  LODWORD(v11) = self->_isUserInactive;
  NSStringFromSelector(sel_isUserInactive);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeBool:forKey:", (_DWORD)v11 != 0, v12);

}

- (NSArray)menstruationPredictions
{
  return self->_menstruationPredictions;
}

- (void)setMenstruationPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_menstruationPredictions, a3);
}

- (NSArray)fertilityPredictions
{
  return self->_fertilityPredictions;
}

- (void)setFertilityPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_fertilityPredictions, a3);
}

- (HAMenstrualAlgorithmsStats)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_storeStrong((id *)&self->_stats, a3);
}

- (HAMenstrualAlgorithmsDeviationAnalysis)deviationAnalysis
{
  return self->_deviationAnalysis;
}

- (void)setDeviationAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_deviationAnalysis, a3);
}

- (BOOL)isUserInactive
{
  return self->_isUserInactive;
}

- (void)setIsUserInactive:(BOOL)a3
{
  self->_isUserInactive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviationAnalysis, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_fertilityPredictions, 0);
  objc_storeStrong((id *)&self->_menstruationPredictions, 0);
}

@end
