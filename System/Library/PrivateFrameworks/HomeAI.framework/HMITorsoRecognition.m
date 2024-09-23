@implementation HMITorsoRecognition

- (HMITorsoRecognition)initWithTorsoprint:(id)a3 classification:(id)a4 predictedLinkedEntityUUIDs:(id)a5 sessionEntityAssignment:(int64_t)a6 sessionEntityUUID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMITorsoRecognition *v17;
  HMITorsoRecognition *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HMITorsoRecognition;
  v17 = -[HMITorsoRecognition init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_torsoprint, a3);
    objc_storeStrong((id *)&v18->_classification, a4);
    objc_storeStrong((id *)&v18->_predictedLinkedEntityUUIDs, a5);
    v18->_sessionEntityAssignment = a6;
    objc_storeStrong((id *)&v18->_sessionEntityUUID, a7);
  }

  return v18;
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
  id v7;

  v4 = a3;
  -[HMITorsoRecognition classification](self, "classification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMITR.c"));

  -[HMITorsoRecognition torsoprint](self, "torsoprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMITR.tp"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMITorsoRecognition sessionEntityAssignment](self, "sessionEntityAssignment"), CFSTR("HMITR.sea"));
  -[HMITorsoRecognition sessionEntityUUID](self, "sessionEntityUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMITR.seu"));

}

- (HMITorsoRecognition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HMITorsoRecognition *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITR.tp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITR.c"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMITR.sea"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITR.seu"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMITorsoRecognition initWithTorsoprint:classification:predictedLinkedEntityUUIDs:sessionEntityAssignment:sessionEntityUUID:](self, "initWithTorsoprint:classification:predictedLinkedEntityUUIDs:sessionEntityAssignment:sessionEntityUUID:", v5, v6, v9, v7, v8);

  return v10;
}

- (HMITorsoprint)torsoprint
{
  return (HMITorsoprint *)objc_getProperty(self, a2, 8, 1);
}

- (HMITorsoClassification)classification
{
  return (HMITorsoClassification *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)predictedLinkedEntityUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)sessionEntityAssignment
{
  return self->_sessionEntityAssignment;
}

- (NSUUID)sessionEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntityUUID, 0);
  objc_storeStrong((id *)&self->_predictedLinkedEntityUUIDs, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_torsoprint, 0);
}

@end
