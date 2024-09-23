@implementation HMDCameraSignificantEventFaceClassification

- (HMDCameraSignificantEventFaceClassification)initWithUUID:(id)a3 personManagerUUID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCameraSignificantEventFaceClassification *v10;
  HMDCameraSignificantEventFaceClassification *v11;
  HMDCameraSignificantEventFaceClassification *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = v8;
    v16.receiver = self;
    v16.super_class = (Class)HMDCameraSignificantEventFaceClassification;
    v10 = -[HMDCameraSignificantEventFaceClassification init](&v16, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_UUID, a3);
      objc_storeStrong((id *)&v11->_personManagerUUID, a4);
    }

    return v11;
  }
  else
  {
    v13 = (HMDCameraSignificantEventFaceClassification *)_HMFPreconditionFailure();
    return (HMDCameraSignificantEventFaceClassification *)-[HMDCameraSignificantEventFaceClassification isEqual:](v13, v14, v15);
  }
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
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDCameraSignificantEventFaceClassification UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDCameraSignificantEventFaceClassification personManagerUUID](self, "personManagerUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "personManagerUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqual:", v10))
        goto LABEL_12;
      -[HMDCameraSignificantEventFaceClassification personUUID](self, "personUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "personUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HMFEqualObjects();

      if (!v13)
        goto LABEL_12;
      -[HMDCameraSignificantEventFaceClassification personName](self, "personName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "personName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = HMFEqualObjects();

      if (v16)
      {
        -[HMDCameraSignificantEventFaceClassification unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unassociatedFaceCropUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = HMFEqualObjects();

      }
      else
      {
LABEL_12:
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCameraSignificantEventFaceClassification UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableCameraSignificantEventFaceClassification *v4;
  void *v5;
  void *v6;
  HMDMutableCameraSignificantEventFaceClassification *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[HMDMutableCameraSignificantEventFaceClassification allocWithZone:](HMDMutableCameraSignificantEventFaceClassification, "allocWithZone:", a3);
  -[HMDCameraSignificantEventFaceClassification UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification personManagerUUID](self, "personManagerUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCameraSignificantEventFaceClassification initWithUUID:personManagerUUID:](v4, "initWithUUID:personManagerUUID:", v5, v6);

  -[HMDCameraSignificantEventFaceClassification personUUID](self, "personUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification setPersonUUID:](v7, "setPersonUUID:", v8);

  -[HMDCameraSignificantEventFaceClassification personName](self, "personName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification setPersonName:](v7, "setPersonName:", v9);

  -[HMDCameraSignificantEventFaceClassification unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification setUnassociatedFaceCropUUID:](v7, "setUnassociatedFaceCropUUID:", v10);

  return v7;
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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraSignificantEventFaceClassification UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("UUID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraSignificantEventFaceClassification personManagerUUID](self, "personManagerUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Person Manager UUID"), v8);
  objc_msgSend(v3, "addObject:", v9);

  -[HMDCameraSignificantEventFaceClassification personUUID](self, "personUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMDCameraSignificantEventFaceClassification personUUID](self, "personUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Person UUID"), v12);
    objc_msgSend(v3, "addObject:", v13);

  }
  -[HMDCameraSignificantEventFaceClassification personName](self, "personName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMDCameraSignificantEventFaceClassification personName](self, "personName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithName:value:options:formatter:", CFSTR("Person Name"), v16, 2, v17);
    objc_msgSend(v3, "addObject:", v18);

  }
  -[HMDCameraSignificantEventFaceClassification unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMDCameraSignificantEventFaceClassification unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("Unassociated Face Crop UUID"), v21);
    objc_msgSend(v3, "addObject:", v22);

  }
  v23 = (void *)objc_msgSend(v3, "copy");

  return v23;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)personManagerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPersonUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)personName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPersonName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSUUID)unassociatedFaceCropUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnassociatedFaceCropUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unassociatedFaceCropUUID, 0);
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_personManagerUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)faceClassificationWithHMIFaceClassification:(id)a3 person:(id)a4
{
  id v5;
  id v6;
  HMDMutableCameraSignificantEventFaceClassification *v7;
  void *v8;
  void *v9;
  HMDMutableCameraSignificantEventFaceClassification *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = [HMDMutableCameraSignificantEventFaceClassification alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDCameraSignificantEventFaceClassification initWithUUID:personManagerUUID:](v7, "initWithUUID:personManagerUUID:", v8, v9);

  objc_msgSend(v5, "personUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassification setPersonUUID:](v10, "setPersonUUID:", v11);

  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraSignificantEventFaceClassification setPersonName:](v10, "setPersonName:", v12);
  objc_msgSend(v5, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v5, "faceCrop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSignificantEventFaceClassification setUnassociatedFaceCropUUID:](v10, "setUnassociatedFaceCropUUID:", v15);

  }
  v16 = (void *)-[HMDMutableCameraSignificantEventFaceClassification copy](v10, "copy");

  return v16;
}

@end
