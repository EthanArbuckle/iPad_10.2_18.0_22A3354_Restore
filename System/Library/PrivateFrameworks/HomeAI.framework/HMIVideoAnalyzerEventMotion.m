@implementation HMIVideoAnalyzerEventMotion

- (HMIVideoAnalyzerEventMotion)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 motionScore:(float)a5
{
  HMIVideoAnalyzerEventMotion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMIVideoAnalyzerEventMotion;
  result = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:](&v7, sel_initWithConfidence_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result)
    result->_motionScore = a5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)HMIVideoAnalyzerEventMotion,
        -[HMIVideoAnalyzerEvent isEqual:](&v12, sel_isEqual_, v6)))
  {
    -[HMIVideoAnalyzerEventMotion motionScore](self, "motionScore");
    v8 = v7;
    objc_msgSend(v6, "motionScore");
    v10 = v8 == v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerEventMotion;
  -[HMIVideoAnalyzerEvent attributeDescriptions](&v11, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerEventMotion motionScore](self, "motionScore");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Motion score"), v6);
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)HMIVideoAnalyzerEventMotion;
  -[HMIVideoAnalyzerEvent shortDescription](&v10, sel_shortDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerEventMotion motionScore](self, "motionScore");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HMIFormatNumber(v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@@(%@)"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  float v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIVideoAnalyzerEventMotion;
  v4 = a3;
  -[HMIVideoAnalyzerEvent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMIVideoAnalyzerEventMotion motionScore](self, "motionScore", v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIVAEM.ms"), v5);

}

- (HMIVideoAnalyzerEventMotion)initWithCoder:(id)a3
{
  id v4;
  HMIVideoAnalyzerEvent *v5;
  void *v6;
  HMIVideoAnalyzerEventMotion *v7;

  v4 = a3;
  v5 = -[HMIVideoAnalyzerEvent initWithCoder:]([HMIVideoAnalyzerEvent alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIVAEM.ms"));
    -[HMIVideoAnalyzerEvent confidence](v5, "confidence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEvent boundingBox](v5, "boundingBox");
    self = -[HMIVideoAnalyzerEventMotion initWithConfidence:boundingBox:motionScore:](self, "initWithConfidence:boundingBox:motionScore:", v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (float)motionScore
{
  return self->_motionScore;
}

@end
