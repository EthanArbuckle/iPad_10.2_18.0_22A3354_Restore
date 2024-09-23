@implementation HMIVideoAnalyzerEventTorso

- (HMIVideoAnalyzerEventTorso)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  return -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](self, "initWithConfidence:boundingBox:roll:torsoRecognition:", a3, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEventTorso)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 roll:(id)a5 torsoRecognition:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  HMIVideoAnalyzerEventTorso *v16;
  HMIVideoAnalyzerEventTorso *v17;
  objc_super v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMIVideoAnalyzerEventTorso;
  v16 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](&v19, sel_initWithConfidence_boundingBox_userInfo_, a3, 0, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_roll, a5);
    objc_storeStrong((id *)&v17->_torsoRecognition, a6);
  }

  return v17;
}

- (NSUUID)sessionEntityUUID
{
  void *v3;
  void *v4;
  void *v5;

  -[HMIVideoAnalyzerEventTorso torsoRecognition](self, "torsoRecognition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMIVideoAnalyzerEventTorso torsoRecognition](self, "torsoRecognition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionEntityUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSUUID *)v5;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnalyzerEventTorso;
  -[HMIVideoAnalyzerEvent attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEventTorso roll](self, "roll");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Torso Roll"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEventTorso torsoRecognition](self, "torsoRecognition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Torso Recognition"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)HMIVideoAnalyzerEventTorso;
    v7 = -[HMIVideoAnalyzerEvent isEqual:](&v9, sel_isEqual_, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMIVideoAnalyzerEventTorso;
  return -[HMIVideoAnalyzerEvent hash](&v3, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMIVideoAnalyzerEventTorso;
  v4 = a3;
  -[HMIVideoAnalyzerEvent encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMIVideoAnalyzerEventTorso roll](self, "roll", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIVAET.ro"));

  -[HMIVideoAnalyzerEventTorso torsoRecognition](self, "torsoRecognition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMIVAET.tr"));

}

- (HMIVideoAnalyzerEventTorso)initWithCoder:(id)a3
{
  id v4;
  HMIVideoAnalyzerEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  HMIVideoAnalyzerEventTorso *v9;

  v4 = a3;
  v5 = -[HMIVideoAnalyzerEvent initWithCoder:]([HMIVideoAnalyzerEvent alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIVAET.ro"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIVAET.tr"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEvent confidence](v5, "confidence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIVideoAnalyzerEvent boundingBox](v5, "boundingBox");
    self = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](self, "initWithConfidence:boundingBox:roll:torsoRecognition:", v8, v6, v7);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HMITorsoRecognition)torsoRecognition
{
  return (HMITorsoRecognition *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)roll
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_torsoRecognition, 0);
}

@end
