@implementation HMIFaceprint

+ (id)sentinelFaceprintWithUUID:(id)a3 modelUUID:(id)a4 faceCropUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMIFaceprint *v10;
  void *v11;
  HMIFaceprint *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [HMIFaceprint alloc];
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMIFaceprint initWithUUID:data:modelUUID:faceCropUUID:](v10, "initWithUUID:data:modelUUID:faceCropUUID:", v9, v11, v8, v7);

  return v12;
}

- (HMIFaceprint)initWithUUID:(id)a3 data:(id)a4 modelUUID:(id)a5 faceCropUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMIFaceprint *v15;
  uint64_t v16;
  NSUUID *UUID;
  uint64_t v18;
  NSData *data;
  uint64_t v20;
  NSUUID *modelUUID;
  uint64_t v22;
  NSUUID *faceCropUUID;
  HMIFaceprint *v25;
  SEL v26;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v25 = (HMIFaceprint *)_HMFPreconditionFailure();
    return (HMIFaceprint *)-[HMIFaceprint attributeDescriptions](v25, v26);
  }
  v27.receiver = self;
  v27.super_class = (Class)HMIFaceprint;
  v15 = -[HMIFaceprint init](&v27, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v16;

    v18 = objc_msgSend(v11, "copy");
    data = v15->_data;
    v15->_data = (NSData *)v18;

    v20 = objc_msgSend(v12, "copy");
    modelUUID = v15->_modelUUID;
    v15->_modelUUID = (NSUUID *)v20;

    v22 = objc_msgSend(v14, "copy");
    faceCropUUID = v15->_faceCropUUID;
    v15->_faceCropUUID = (NSUUID *)v22;

  }
  return v15;
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceprint UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceprint data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Data"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceprint modelUUID](self, "modelUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Model UUID"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceprint faceCropUUID](self, "faceCropUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Face Crop UUID"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isSentinelFaceprint
{
  void *v2;
  void *v3;
  char v4;

  -[HMIFaceprint data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToData:", v3);

  return v4;
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
  void *v13;
  char v14;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMIFaceprint UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMIFaceprint data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToData:", v10))
      {
        -[HMIFaceprint modelUUID](self, "modelUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "modelUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          -[HMIFaceprint faceCropUUID](self, "faceCropUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "faceCropUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v16, "isEqual:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMIFaceprint UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  id v8;

  v4 = a3;
  -[HMIFaceprint UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIFP.ck.u"));

  -[HMIFaceprint data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMIFP.ck.d"));

  -[HMIFaceprint modelUUID](self, "modelUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMIFP.ck.mu"));

  -[HMIFaceprint faceCropUUID](self, "faceCropUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMIFP.ck.fcu"));

}

- (HMIFaceprint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v13;
  NSObject *v14;
  void *v15;
  HMIFaceprint *v16;
  HMIFaceprint *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFP.ck.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFP.ck.d"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFP.ck.mu"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFP.ck.fcu"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10 || v6 == 0 || v7 == 0)
  {
    v13 = (void *)MEMORY[0x220735570]();
    v16 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      v20 = v15;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ data: %@ modelUUID: %@ faceCropUUID: %@", (uint8_t *)&v19, 0x34u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }
  else
  {
    v16 = -[HMIFaceprint initWithUUID:data:modelUUID:faceCropUUID:](self, "initWithUUID:data:modelUUID:faceCropUUID:", v5, v6, v7, v8);
    v17 = v16;
  }

  return v17;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)modelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)faceCropUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropUUID, 0);
  objc_storeStrong((id *)&self->_modelUUID, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
