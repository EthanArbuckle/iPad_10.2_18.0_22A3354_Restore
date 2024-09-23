@implementation IPFeatureSentenceFragment

+ (id)fragmentWithRange:(_NSRange)a3 clusterType:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  IPFeatureSentenceFragment *v7;

  length = a3.length;
  location = a3.location;
  v7 = objc_alloc_init(IPFeatureSentenceFragment);
  -[IPFeatureSentenceFragment setRange:](v7, "setRange:", location, length);
  -[IPFeatureSentenceFragment setClusterType:](v7, "setClusterType:", a4);
  return v7;
}

- (unint64_t)mainPolarity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[IPFeatureSentenceFragment probability_None](self, "probability_None");
  v4 = v3;
  -[IPFeatureSentenceFragment probability_Rejection](self, "probability_Rejection");
  v6 = v5;
  -[IPFeatureSentenceFragment probability_Proposal](self, "probability_Proposal");
  v8 = v7;
  -[IPFeatureSentenceFragment probability_Confirmation](self, "probability_Confirmation");
  if (v4 > 0.5)
    return 1;
  if (v8 + v9 >= 0.66)
  {
    if (v9 <= v8)
      return 2;
    else
      return 3;
  }
  else if (v6 >= 0.35)
  {
    return 4;
  }
  else if (v8 < 0.54 || v8 <= v6 || v8 <= v9)
  {
    if (v9 <= v6 || v9 <= v8 || v9 < 0.54)
      return 5;
    else
      return 3;
  }
  else
  {
    return 2;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)IPFeatureSentenceFragment;
  -[IPFeatureSentenceFragment description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPFeatureSentence humanReadableFeaturePolarity:](IPFeatureSentence, "humanReadableFeaturePolarity:", -[IPFeatureSentenceFragment mainPolarity](self, "mainPolarity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPEventClassificationType humanReadableClusterType:](IPEventClassificationType, "humanReadableClusterType:", -[IPFeatureSentenceFragment clusterType](self, "clusterType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ MainPolarity:%@ Cluster:%@ \nprobability_None=%f \nprobability_Rejection=%f \nprobability_Proposal=%f \nprobability_Confirmation=%f"), v4, v5, v6, *(_QWORD *)&self->_probability_None, *(_QWORD *)&self->_probability_Rejection, *(_QWORD *)&self->_probability_Proposal, *(_QWORD *)&self->_probability_Confirmation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (unint64_t)clusterType
{
  return self->_clusterType;
}

- (void)setClusterType:(unint64_t)a3
{
  self->_clusterType = a3;
}

- (double)probability_None
{
  return self->_probability_None;
}

- (void)setProbability_None:(double)a3
{
  self->_probability_None = a3;
}

- (double)probability_Rejection
{
  return self->_probability_Rejection;
}

- (void)setProbability_Rejection:(double)a3
{
  self->_probability_Rejection = a3;
}

- (double)probability_Proposal
{
  return self->_probability_Proposal;
}

- (void)setProbability_Proposal:(double)a3
{
  self->_probability_Proposal = a3;
}

- (double)probability_Confirmation
{
  return self->_probability_Confirmation;
}

- (void)setProbability_Confirmation:(double)a3
{
  self->_probability_Confirmation = a3;
}

@end
