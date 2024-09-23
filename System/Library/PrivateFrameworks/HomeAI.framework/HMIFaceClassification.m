@implementation HMIFaceClassification

- (HMIFaceClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 confidence:(double)a5 fromTorsoClassification:(BOOL)a6 familiarity:(int64_t)a7
{
  id v13;
  id v14;
  HMIFaceClassification *v15;
  HMIFaceClassification *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMIFaceClassification;
  v15 = -[HMIFaceClassification init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_personUUID, a3);
    objc_storeStrong((id *)&v16->_sourceUUID, a4);
    v16->_confidence = a5;
    v16->_fromTorsoClassification = a6;
    v16->_familiarity = a7;
  }

  return v16;
}

- (HMIFaceClassification)initWithPersonUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 confidence:(double)a6 familiarity:(int64_t)a7
{
  id v13;
  HMIFaceClassification *v14;
  HMIFaceClassification *v15;

  v13 = a5;
  v14 = -[HMIFaceClassification initWithPersonUUID:sourceUUID:confidence:fromTorsoClassification:familiarity:](self, "initWithPersonUUID:sourceUUID:confidence:fromTorsoClassification:familiarity:", a3, a4, 0, a7, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_sessionEntityUUID, a5);

  return v15;
}

- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceCrop:(id)a6 faceprint:(id)a7 confidence:(double)a8 familiarity:(int64_t)a9
{
  id v17;
  id v18;
  HMIFaceClassification *v19;
  HMIFaceClassification *v20;

  v17 = a6;
  v18 = a7;
  v19 = -[HMIFaceClassification initWithPersonUUID:sourceUUID:sessionEntityUUID:confidence:familiarity:](self, "initWithPersonUUID:sourceUUID:sessionEntityUUID:confidence:familiarity:", a3, a4, a5, a9, a8);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_faceCrop, a6);
    objc_storeStrong((id *)&v20->_faceprint, a7);
  }

  return v20;
}

- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceCrop:(id)a6 faceprint:(id)a7 confidence:(double)a8 fromTorsoClassification:(BOOL)a9 familiarity:(int64_t)a10
{
  HMIFaceClassification *result;

  result = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:familiarity:](self, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:familiarity:", a3, a4, a5, a6, a7, a10, a8);
  if (result)
    result->_fromTorsoClassification = a9;
  return result;
}

- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 sessionEntityUUID:(id)a5 faceBoundingBox:(CGRect)a6 facecrop:(id)a7 faceprint:(id)a8 confidence:(double)a9
{
  return -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:familiarity:](self, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:familiarity:", a9, a6.origin.y, a6.size.width, a6.size.height);
}

- (HMIFaceClassification)initWithUUID:(id)a3 name:(id)a4 personsModelIdentifier:(id)a5 faceBoundingBox:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  id v12;
  void *v13;
  HMIFaceClassification *v14;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = (void *)MEMORY[0x24BDD1880];
  v12 = a3;
  objc_msgSend(v11, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMIFaceClassification initWithUUID:sourceUUID:faceBoundingBox:](self, "initWithUUID:sourceUUID:faceBoundingBox:", v12, v13, x, y, width, height);

  return v14;
}

- (HMIFaceClassification)initWithUUID:(id)a3 sourceUUID:(id)a4 faceBoundingBox:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  HMIFaceCrop *v13;
  void *v14;
  void *v15;
  void *v16;
  HMIFaceCrop *v17;
  HMIFaceprint *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMIFaceprint *v23;
  void *v24;
  HMIFaceClassification *v25;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  v13 = [HMIFaceCrop alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v13, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v14, v15, v16, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  v18 = [HMIFaceprint alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIFaceCrop UUID](v17, "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMIFaceprint initWithUUID:data:modelUUID:faceCropUUID:](v18, "initWithUUID:data:modelUUID:faceCropUUID:", v19, v20, v21, v22);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceBoundingBox:facecrop:faceprint:confidence:](self, "initWithUUID:sourceUUID:sessionEntityUUID:faceBoundingBox:facecrop:faceprint:confidence:", v12, v11, v24, v17, v23, x, y, width, height, 0.0);

  return v25;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  int64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[9];

  v34[8] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceClassification personUUID](self, "personUUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Person UUID"), v33);
  v34[0] = v32;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceClassification sourceUUID](self, "sourceUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Source UUID"), v31);
  v34[1] = v30;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceClassification sessionEntityUUID](self, "sessionEntityUUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Session Entity UUID"), v29);
  v34[2] = v28;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[HMIFaceClassification confidence](self, "confidence");
  objc_msgSend(v7, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Confidence"), v27);
  v34[3] = v26;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  v9 = -[HMIFaceClassification familiarity](self, "familiarity");
  v10 = CFSTR("Known");
  if (!v9)
    v10 = CFSTR("Unknown");
  if (v9 == 1)
    v11 = CFSTR("Uncertain");
  else
    v11 = v10;
  v12 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Familiarity"), v11);
  v34[4] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceClassification faceCrop](self, "faceCrop");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("FaceCrop UUID"), v15);
  v34[5] = v16;
  v17 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceClassification faceprint](self, "faceprint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Faceprint UUID"), v19);
  v34[6] = v20;
  v21 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceClassification fromTorsoClassification](self, "fromTorsoClassification");
  HMFBooleanToString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("FromTorsoClassification"), v22);
  v34[7] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  HMIFaceClassification *v4;
  HMIFaceClassification *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  double v23;
  double v24;
  double v25;
  char v26;
  int64_t v27;
  BOOL v28;
  BOOL v29;
  char v30;

  v4 = (HMIFaceClassification *)a3;
  if (v4 == self)
  {
    v30 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMIFaceClassification personUUID](self, "personUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIFaceClassification personUUID](v5, "personUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = HMFEqualObjects();

      -[HMIFaceClassification sourceUUID](self, "sourceUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIFaceClassification sourceUUID](v5, "sourceUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = HMFEqualObjects();

      v12 = v8 & v11;
      -[HMIFaceClassification sessionEntityUUID](self, "sessionEntityUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIFaceClassification sessionEntityUUID](v5, "sessionEntityUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = HMFEqualObjects();

      -[HMIFaceClassification faceCrop](self, "faceCrop");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIFaceClassification faceCrop](v5, "faceCrop");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = HMFEqualObjects();

      v19 = v12 & v15 & v18;
      -[HMIFaceClassification faceprint](self, "faceprint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIFaceClassification faceprint](v5, "faceprint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      -[HMIFaceClassification confidence](self, "confidence");
      v24 = v23;
      -[HMIFaceClassification confidence](v5, "confidence");
      if (v24 == v25)
        v26 = v19 & v22;
      else
        v26 = 0;
      v27 = -[HMIFaceClassification familiarity](self, "familiarity");
      if (v27 != -[HMIFaceClassification familiarity](v5, "familiarity"))
        v26 = 0;
      v28 = -[HMIFaceClassification fromTorsoClassification](self, "fromTorsoClassification");
      v29 = -[HMIFaceClassification fromTorsoClassification](v5, "fromTorsoClassification");

      v30 = v26 & (v28 ^ v29 ^ 1);
    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMIFaceClassification personUUID](self, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMIFaceClassification sourceUUID](self, "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIFaceClassification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  HMIFaceClassification *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.pu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.su"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.seu"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.fc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.fp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIFC.c"));
  v11 = v10;
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMIFC.ftc"));
  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMIFC.f"));

  v14 = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:](self, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:", v5, v6, v7, v8, v9, v12, v11, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HMIFaceClassification personUUID](self, "personUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("HMIFC.pu"));

  -[HMIFaceClassification sourceUUID](self, "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("HMIFC.su"));

  -[HMIFaceClassification sessionEntityUUID](self, "sessionEntityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("HMIFC.seu"));

  -[HMIFaceClassification faceCrop](self, "faceCrop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("HMIFC.fc"));

  -[HMIFaceClassification faceprint](self, "faceprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("HMIFC.fp"));

  -[HMIFaceClassification confidence](self, "confidence");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("HMIFC.c"));
  objc_msgSend(v9, "encodeBool:forKey:", -[HMIFaceClassification fromTorsoClassification](self, "fromTorsoClassification"), CFSTR("HMIFC.ftc"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[HMIFaceClassification familiarity](self, "familiarity"), CFSTR("HMIFC.f"));

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)personsModelIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (CGRect)faceBoundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (HMIFaceCrop)faceCrop
{
  return (HMIFaceCrop *)objc_getProperty(self, a2, 40, 1);
}

- (HMIFaceprint)faceprint
{
  return (HMIFaceprint *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)sessionEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (int64_t)familiarity
{
  return self->_familiarity;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)fromTorsoClassification
{
  return self->_fromTorsoClassification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntityUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_faceCrop, 0);
  objc_storeStrong((id *)&self->_personsModelIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
