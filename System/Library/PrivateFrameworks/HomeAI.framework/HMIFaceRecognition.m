@implementation HMIFaceRecognition

- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMIFaceRecognition *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionEntityUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = -[HMIFaceRecognition initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:](self, "initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:", v10, v9, v8, 0, 0, v13, -1.0);
  return v14;
}

- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5 predictedLinkedEntityUUIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMIFaceRecognition *v17;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v10, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionEntityUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v17 = -[HMIFaceRecognition initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:](self, "initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:", v13, v12, v10, v11, 0, v16, -1.0);
  return v17;
}

- (HMIFaceRecognition)initWithFaceCrop:(id)a3 faceprint:(id)a4 classifications:(id)a5 predictedLinkedEntityUUIDs:(id)a6 faceQualityScore:(double)a7 sessionEntityAssignment:(int64_t)a8 sessionEntityUUID:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  HMIFaceRecognition *v20;
  HMIFaceRecognition *v21;
  id v24;
  objc_super v25;

  v24 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HMIFaceRecognition;
  v20 = -[HMIFaceRecognition init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_faceCrop, a3);
    objc_storeStrong((id *)&v21->_faceprint, a4);
    objc_storeStrong((id *)&v21->_classifications, a5);
    objc_storeStrong((id *)&v21->_predictedLinkedEntityUUIDs, a6);
    v21->_faceQualityScore = a7;
    v21->_sessionEntityAssignment = a8;
    objc_storeStrong((id *)&v21->_sessionEntityUUID, a9);
  }

  return v21;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceRecognition faceCrop](self, "faceCrop");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Face Crop UUID"), v21);
  v23[0] = v20;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceRecognition faceprint](self, "faceprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Faceprint UUID"), v6);
  v23[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceRecognition classifications](self, "classifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Face Classifications"), v9);
  v23[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[HMIFaceRecognition faceQualityScore](self, "faceQualityScore");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Face Quality Score"), v13);
  v23[3] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceRecognition sessionEntityUUID](self, "sessionEntityUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Session Entity UUID"), v16);
  v23[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  char v18;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMIFaceRecognition classifications](self, "classifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classifications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMIFaceRecognition faceCrop](self, "faceCrop");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "faceCrop");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[HMIFaceRecognition faceprint](self, "faceprint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "faceprint");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12)
          && (v13 = -[HMIFaceRecognition sessionEntityAssignment](self, "sessionEntityAssignment"),
              v13 == objc_msgSend(v6, "sessionEntityAssignment"))
          && (-[HMIFaceRecognition faceQualityScore](self, "faceQualityScore"),
              v15 = v14,
              objc_msgSend(v6, "faceQualityScore"),
              v15 == v16))
        {
          -[HMIFaceRecognition sessionEntityUUID](self, "sessionEntityUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sessionEntityUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v20, "isEqual:", v17);

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMIFaceRecognition faceCrop](self, "faceCrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMIFaceRecognition faceprint](self, "faceprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
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
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMIFaceRecognition classifications](self, "classifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIFR.c"));

  -[HMIFaceRecognition faceCrop](self, "faceCrop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMIFR.fc"));

  -[HMIFaceRecognition faceprint](self, "faceprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMIFR.fp"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMIFaceRecognition sessionEntityAssignment](self, "sessionEntityAssignment"), CFSTR("HMIFR.sea"));
  -[HMIFaceRecognition faceQualityScore](self, "faceQualityScore");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMIFR.fqs"));
  -[HMIFaceRecognition sessionEntityUUID](self, "sessionEntityUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMIFR.seu"));

  -[HMIFaceRecognition predictedLinkedEntityUUIDs](self, "predictedLinkedEntityUUIDs");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMIFR.leus"));

}

- (HMIFaceRecognition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMIFaceRecognition *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFR.fc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFR.fp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HMIFR.c"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMIFR.sea"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HMIFR.fqs"));
  v13 = v12;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFR.seu"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDBCF20];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("HMIFR.leus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[HMIFaceRecognition initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:](self, "initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:", v5, v6, v10, v18, v11, v14, v13);
  return v19;
}

- (HMIFaceCrop)faceCrop
{
  return (HMIFaceCrop *)objc_getProperty(self, a2, 8, 1);
}

- (HMIFaceprint)faceprint
{
  return (HMIFaceprint *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)classifications
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (double)faceQualityScore
{
  return self->_faceQualityScore;
}

- (NSUUID)sessionEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)predictedLinkedEntityUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)sessionEntityAssignment
{
  return self->_sessionEntityAssignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedLinkedEntityUUIDs, 0);
  objc_storeStrong((id *)&self->_sessionEntityUUID, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_faceCrop, 0);
}

@end
