@implementation MOOutlierMetadata

- (MOOutlierMetadata)initWithIdentifier:(id)a3 updateDate:(id)a4 isSignificant:(BOOL)a5 outlierScore:(double)a6 outlierScoreThreshold:(double)a7 bundleGoodnessScore:(double)a8 bundleGoodnessScoreThreshold:(double)a9
{
  id v17;
  id v18;
  MOOutlierMetadata *v19;
  MOOutlierMetadata *v20;
  objc_super v22;

  v17 = a3;
  v18 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MOOutlierMetadata;
  v19 = -[MOOutlierMetadata init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_updatedDate, a4);
    v20->_isSignificant = a5;
    v20->_outlierScore = a6;
    v20->_bundleGoodnessScore = a8;
    v20->_outlierScoreThreshold = a7;
    v20->_bundleGoodnessScoreThreshold = a9;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedDate, CFSTR("updatedDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSignificant, CFSTR("isSignificant"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("outlierScore"), self->_outlierScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("outlierScoreThreshold"), self->_outlierScoreThreshold);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("bundleGoodnessScore"), self->_bundleGoodnessScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("bundleGoodnessScoreThreshold"), self->_bundleGoodnessScoreThreshold);

}

- (MOOutlierMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  MOOutlierMetadata *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSignificant"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("outlierScore"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("outlierScoreThreshold"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bundleGoodnessScore"));
  v13 = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bundleGoodnessScoreThreshold"));
  v15 = v14;

  v16 = -[MOOutlierMetadata initWithIdentifier:updateDate:isSignificant:outlierScore:outlierScoreThreshold:bundleGoodnessScore:bundleGoodnessScoreThreshold:](self, "initWithIdentifier:updateDate:isSignificant:outlierScore:outlierScoreThreshold:bundleGoodnessScore:bundleGoodnessScoreThreshold:", v5, v6, v7, v9, v11, v13, v15);
  return v16;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)updatedDate
{
  return self->_updatedDate;
}

- (void)setUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_updatedDate, a3);
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (void)setIsSignificant:(BOOL)a3
{
  self->_isSignificant = a3;
}

- (double)outlierScore
{
  return self->_outlierScore;
}

- (void)setOutlierScore:(double)a3
{
  self->_outlierScore = a3;
}

- (double)bundleGoodnessScore
{
  return self->_bundleGoodnessScore;
}

- (void)setBundleGoodnessScore:(double)a3
{
  self->_bundleGoodnessScore = a3;
}

- (double)outlierScoreThreshold
{
  return self->_outlierScoreThreshold;
}

- (void)setOutlierScoreThreshold:(double)a3
{
  self->_outlierScoreThreshold = a3;
}

- (double)bundleGoodnessScoreThreshold
{
  return self->_bundleGoodnessScoreThreshold;
}

- (void)setBundleGoodnessScoreThreshold:(double)a3
{
  self->_bundleGoodnessScoreThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
