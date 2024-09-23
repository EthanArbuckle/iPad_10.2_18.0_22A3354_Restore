@implementation HMITorsoClassification

- (HMITorsoClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 confidence:(double)a5
{
  id v9;
  id v10;
  HMITorsoClassification *v11;
  HMITorsoClassification *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMITorsoClassification;
  v11 = -[HMITorsoClassification init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceUUID, a4);
    objc_storeStrong((id *)&v12->_personUUID, a3);
    v12->_confidence = a5;
  }

  return v12;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoClassification personUUID](self, "personUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Person UUID"), v4);
  v16[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoClassification sourceUUID](self, "sourceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Source UUID"), v7);
  v16[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[HMITorsoClassification confidence](self, "confidence");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%.4lf"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Confidence"), v12);
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  HMITorsoClassification *v4;
  HMITorsoClassification *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = (HMITorsoClassification *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMITorsoClassification sourceUUID](self, "sourceUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMITorsoClassification sourceUUID](v5, "sourceUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = HMFEqualObjects();

      if (v8
        && (-[HMITorsoClassification personUUID](self, "personUUID"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[HMITorsoClassification personUUID](v5, "personUUID"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = HMFEqualObjects(),
            v10,
            v9,
            v11))
      {
        -[HMITorsoClassification confidence](self, "confidence");
        v13 = v12;
        -[HMITorsoClassification confidence](v5, "confidence");
        v15 = vabdd_f64(v13, v14) < 2.22044605e-16;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMITorsoClassification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  HMITorsoClassification *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITC.su"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITC.pu"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMITC.conf"));
  v8 = v7;

  v9 = -[HMITorsoClassification initWithPersonUUID:sourceUUID:confidence:](self, "initWithPersonUUID:sourceUUID:confidence:", v6, v5, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMITorsoClassification sourceUUID](self, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HMITC.su"));

  -[HMITorsoClassification personUUID](self, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HMITC.pu"));

  -[HMITorsoClassification confidence](self, "confidence");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("HMITC.conf"));

}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end
