@implementation HMITorsoAnnotation

- (HMITorsoAnnotation)initWithFaceRecognition:(id)a3 torsoprints:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMITorsoAnnotation *v9;

  v6 = a4;
  v7 = a3;
  +[HMITorsoprinter currentModelUUID](HMITorsoprinter, "currentModelUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMITorsoAnnotation initWithFaceRecognition:torsoprints:torsoModelVersion:](self, "initWithFaceRecognition:torsoprints:torsoModelVersion:", v7, v6, v8);

  return v9;
}

- (HMITorsoAnnotation)initWithFaceRecognition:(id)a3 torsoprints:(id)a4 torsoModelVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMITorsoAnnotation *v13;
  HMITorsoAnnotation *v14;
  HMITorsoAnnotation *v16;
  SEL v17;
  id v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    v16 = (HMITorsoAnnotation *)_HMFPreconditionFailure();
    return (HMITorsoAnnotation *)-[HMITorsoAnnotation isEqual:](v16, v17, v18);
  }
  v12 = v11;
  v19.receiver = self;
  v19.super_class = (Class)HMITorsoAnnotation;
  v13 = -[HMITorsoAnnotation init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_faceRecognition, a3);
    objc_storeStrong((id *)&v14->_torsoprints, a4);
    objc_storeStrong((id *)&v14->_torsoModelVersion, a5);
  }

  return v14;
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
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMITorsoAnnotation faceRecognition](self, "faceRecognition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "faceRecognition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMITorsoAnnotation torsoprints](self, "torsoprints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "torsoprints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToArray:", v10))
      {
        -[HMITorsoAnnotation torsoModelVersion](self, "torsoModelVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "torsoModelVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMITorsoAnnotation torsoprints](self, "torsoprints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMITorsoAnnotation faceRecognition](self, "faceRecognition");
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
  id v7;

  v4 = a3;
  -[HMITorsoAnnotation faceRecognition](self, "faceRecognition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMITA.ck.fr"));

  -[HMITorsoAnnotation torsoprints](self, "torsoprints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMITA.ck.tps"));

  -[HMITorsoAnnotation torsoModelVersion](self, "torsoModelVersion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMITA.ck.tmv"));

}

- (HMITorsoAnnotation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMITorsoAnnotation *v12;
  HMITorsoAnnotation *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITA.ck.fr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HMITA.ck.tps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMITA.ck.tmv"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v5 && v9 && v10)
  {
    v12 = -[HMITorsoAnnotation initWithFaceRecognition:torsoprints:torsoModelVersion:](self, "initWithFaceRecognition:torsoprints:torsoModelVersion:", v5, v9, v10);
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x220735570]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v16;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded faceRecognition: %@ torsoprints: %@ torsoModelVersion: %@", (uint8_t *)&v18, 0x2Au);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
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
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoAnnotation faceRecognition](self, "faceRecognition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Face Recognition"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoAnnotation torsoprints](self, "torsoprints", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Torsoprints"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMITorsoAnnotation torsoModelVersion](self, "torsoModelVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("TorsoModelVersion"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMIFaceRecognition)faceRecognition
{
  return (HMIFaceRecognition *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)torsoprints
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)torsoModelVersion
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoModelVersion, 0);
  objc_storeStrong((id *)&self->_torsoprints, 0);
  objc_storeStrong((id *)&self->_faceRecognition, 0);
}

@end
