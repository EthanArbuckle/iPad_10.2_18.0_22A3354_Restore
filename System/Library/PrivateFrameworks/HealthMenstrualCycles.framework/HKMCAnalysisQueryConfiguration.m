@implementation HKMCAnalysisQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMCAnalysisQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setForceAnalysis:", -[HKMCAnalysisQueryConfiguration forceAnalysis](self, "forceAnalysis"));
  return v4;
}

- (void)setForceAnalysis:(BOOL)a3
{
  self->_forceAnalysis = a3;
}

- (BOOL)forceAnalysis
{
  return self->_forceAnalysis;
}

- (HKMCAnalysisQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKMCAnalysisQueryConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMCAnalysisQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_forceAnalysis = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ForceAnalysis"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMCAnalysisQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_forceAnalysis, CFSTR("ForceAnalysis"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
