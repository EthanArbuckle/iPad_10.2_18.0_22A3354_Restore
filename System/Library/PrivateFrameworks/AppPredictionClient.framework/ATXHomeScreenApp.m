@implementation ATXHomeScreenApp

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenApp)initWithBundleId:(id)a3
{
  return -[ATXHomeScreenApp initWithBundleId:predictionSource:](self, "initWithBundleId:predictionSource:", a3, 0);
}

- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4
{
  return -[ATXHomeScreenApp initWithBundleId:predictionSource:score:](self, "initWithBundleId:predictionSource:score:", a3, a4, 0.0);
}

- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4 score:(double)a5
{
  return -[ATXHomeScreenApp initWithBundleId:predictionSource:score:uniqueDaysLaunched:rawLaunchCount:](self, "initWithBundleId:predictionSource:score:uniqueDaysLaunched:rawLaunchCount:", a3, a4, 0, 0, a5);
}

- (ATXHomeScreenApp)initWithBundleId:(id)a3 predictionSource:(id)a4 score:(double)a5 uniqueDaysLaunched:(unint64_t)a6 rawLaunchCount:(unint64_t)a7
{
  id v12;
  id v13;
  ATXHomeScreenApp *v14;
  uint64_t v15;
  NSString *bundleId;
  uint64_t v17;
  NSString *predictionSource;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATXHomeScreenApp;
  v14 = -[ATXHomeScreenApp init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    bundleId = v14->_bundleId;
    v14->_bundleId = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    predictionSource = v14->_predictionSource;
    v14->_predictionSource = (NSString *)v17;

    v14->_score = a5;
    v14->_numUniqueDays = a6;
    v14->_numAppLaunches = a7;
  }

  return v14;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_bundleId, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenApp *v4;
  ATXHomeScreenApp *v5;
  BOOL v6;

  v4 = (ATXHomeScreenApp *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenApp isEqualToATXHomeScreenApp:](self, "isEqualToATXHomeScreenApp:", v5);

  return v6;
}

- (NSString)description
{
  return self->_bundleId;
}

- (BOOL)isEqualToATXHomeScreenApp:(id)a3
{
  NSString *v4;
  NSString *v5;
  char v6;

  v4 = self->_bundleId;
  v5 = v4;
  if (v4 == *((NSString **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSString isEqual:](v4, "isEqual:");

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleId;
  id v5;

  bundleId = self->_bundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predictionSource, CFSTR("predictionSource"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numUniqueDays, CFSTR("numUniqueDays"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numAppLaunches, CFSTR("numAppLaunches"));

}

- (ATXHomeScreenApp)initWithCoder:(id)a3
{
  id v4;
  ATXHomeScreenApp *v5;
  uint64_t v6;
  NSString *bundleId;
  uint64_t v8;
  NSString *predictionSource;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXHomeScreenApp;
  v5 = -[ATXHomeScreenApp init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionSource"));
    v8 = objc_claimAutoreleasedReturnValue();
    predictionSource = v5->_predictionSource;
    v5->_predictionSource = (NSString *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
    v5->_score = v10;
    v5->_numUniqueDays = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numUniqueDays"));
    v5->_numAppLaunches = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numAppLaunches"));
  }

  return v5;
}

- (id)dictionaryRepresentationForIntrospection
{
  const __CFString *predictionSource;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("bundleId");
  v9[1] = CFSTR("predictionSource");
  predictionSource = (const __CFString *)self->_predictionSource;
  if (!predictionSource)
    predictionSource = CFSTR("<nil>");
  v10[0] = self->_bundleId;
  v10[1] = predictionSource;
  v9[2] = CFSTR("score");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("numUniqueDays");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numUniqueDays);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("numAppLaunches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numAppLaunches);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)predictionSource
{
  return self->_predictionSource;
}

- (void)setPredictionSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)score
{
  return self->_score;
}

- (unint64_t)numUniqueDays
{
  return self->_numUniqueDays;
}

- (unint64_t)numAppLaunches
{
  return self->_numAppLaunches;
}

- (ATXHomeScreenPage)page
{
  return (ATXHomeScreenPage *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_page, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_predictionSource, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
