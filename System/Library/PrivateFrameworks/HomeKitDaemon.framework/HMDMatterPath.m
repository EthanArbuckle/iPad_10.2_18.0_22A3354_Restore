@implementation HMDMatterPath

- (HMDMatterPath)initWithUUID:(id)a3 mtrPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMatterPath *v12;
  HMDMatterPath *v13;
  id v14;
  void *v15;
  MTRAttributePath *v16;
  MTRAttributePath *attributePath;
  id v18;
  void *v19;
  MTRCommandPath *v20;
  MTRCommandPath *commandPath;
  id v22;
  void *v23;
  MTREventPath *v24;
  MTREventPath *eventPath;
  HMDMatterPath *v27;
  SEL v28;
  id v29;
  id v30;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v9 = v8;
  objc_msgSend(v8, "endpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  objc_msgSend(v9, "cluster");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_18:
    v27 = (HMDMatterPath *)_HMFPreconditionFailure();
    return -[HMDMatterPath initWithPathModel:accessory:](v27, v28, v29, v30);
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDMatterPath;
  v12 = -[HMDMatterPath init](&v31, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    v14 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    attributePath = v13->_attributePath;
    v13->_attributePath = v16;

    v18 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    commandPath = v13->_commandPath;
    v13->_commandPath = v20;

    v22 = v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    eventPath = v13->_eventPath;
    v13->_eventPath = v24;

  }
  return v13;
}

- (HMDMatterPath)initWithPathModel:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDMatterPath *v27;
  void *v29;
  HMDMatterPath *v30;
  SEL v31;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "endpointID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  objc_msgSend(v6, "clusterID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_22:
    _HMFPreconditionFailure();
    goto LABEL_23;
  }
  v10 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {

    goto LABEL_10;
  }
  v13 = v10;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (!v13 || (isKindOfClass & 1) == 0)
  {
LABEL_23:
    v30 = (HMDMatterPath *)_HMFPreconditionFailure();
    return (HMDMatterPath *)-[HMDMatterPath mtrPath](v30, v31);
  }
LABEL_10:
  objc_msgSend(v6, "attributeID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDDB538];
    objc_msgSend(v6, "endpointID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clusterID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributePathWithEndpointID:clusterID:attributeID:", v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "commandID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x24BDDB660];
      objc_msgSend(v6, "endpointID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clusterID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "commandID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "commandPathWithEndpointID:clusterID:commandID:", v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "eventID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v29 = (void *)MEMORY[0x24BDDB620];
        objc_msgSend(v6, "endpointID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "clusterID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "clusterPathWithEndpointID:clusterID:", v17, v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v24 = (void *)MEMORY[0x24BDDB748];
      objc_msgSend(v6, "endpointID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clusterID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "eventPathWithEndpointID:clusterID:eventID:", v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
    }
  }
  v25 = (void *)v20;

LABEL_17:
  objc_msgSend(v6, "uuid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HMDMatterPath initWithUUID:mtrPath:](self, "initWithUUID:mtrPath:", v26, v25);

  if (v27)
    objc_storeWeak((id *)&v27->_accessory, v10);

  return v27;
}

- (id)mtrPath
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDMatterPath attributePath](self, "attributePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HMDMatterPath commandPath](self, "commandPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[HMDMatterPath eventPath](self, "eventPath");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[HMDMatterPath endpointID](self, "endpointID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDMatterPath clusterID](self, "clusterID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDMatterPath attributeID](self, "attributeID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = 1;
      }
      else
      {
        -[HMDMatterPath commandID](self, "commandID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v6 = 1;
        }
        else
        {
          -[HMDMatterPath eventID](self, "eventID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v8 != 0;

        }
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSNumber)endpointID
{
  void *v2;
  void *v3;

  -[HMDMatterPath mtrPath](self, "mtrPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)clusterID
{
  void *v2;
  void *v3;

  -[HMDMatterPath mtrPath](self, "mtrPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cluster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)attributeID
{
  void *v2;
  void *v3;

  -[HMDMatterPath attributePath](self, "attributePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attribute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)commandID
{
  void *v2;
  void *v3;

  -[HMDMatterPath commandPath](self, "commandPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)eventID
{
  void *v2;
  void *v3;

  -[HMDMatterPath eventPath](self, "eventPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDMatterPath *v4;
  HMDMatterPath *v5;
  HMDMatterPath *v6;
  HMDMatterPath *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;

  v4 = (HMDMatterPath *)a3;
  if (self == v4)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (!v6)
      goto LABEL_11;
    -[HMDMatterPath endpointID](v6, "endpointID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterPath endpointID](self, "endpointID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

    if (!v10)
      goto LABEL_11;
    -[HMDMatterPath clusterID](v7, "clusterID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterPath clusterID](self, "clusterID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if (!v13)
      goto LABEL_11;
    -[HMDMatterPath attributeID](v7, "attributeID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterPath attributeID](self, "attributeID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HMFEqualObjects();

    if (!v16)
      goto LABEL_11;
    -[HMDMatterPath commandID](v7, "commandID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterPath commandID](self, "commandID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = HMFEqualObjects();

    if (v19)
    {
      -[HMDMatterPath eventID](v7, "eventID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMatterPath eventID](self, "eventID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

    }
    else
    {
LABEL_11:
      v22 = 0;
    }

  }
  return v22;
}

- (id)path
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  -[HMDMatterPath attributeID](self, "attributeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[HMDMatterPath endpointID](self, "endpointID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterPath clusterID](self, "clusterID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMatterPath attributeID](self, "attributeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("EP/CL/ATTR: %@/%@/%@"), v5, v6, v7);
  }
  else
  {
    -[HMDMatterPath commandID](self, "commandID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      -[HMDMatterPath endpointID](self, "endpointID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMatterPath clusterID](self, "clusterID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMatterPath commandID](self, "commandID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("EP/CL/CMD: %@/%@/%@"), v5, v6, v7);
    }
    else
    {
      -[HMDMatterPath eventID](self, "eventID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD17C8];
      -[HMDMatterPath endpointID](self, "endpointID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMatterPath clusterID](self, "clusterID");
      v12 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v12;
      if (!v10)
      {
        objc_msgSend(v11, "stringWithFormat:", CFSTR("EP/CL: %@/%@"), v5, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      -[HMDMatterPath eventID](self, "eventID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("EP/CL/EVE: %@/%@/%@"), v5, v6, v7);
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDMatterPath path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  -[HMDMatterPath endpointID](self, "endpointID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDMatterPathEndpointIDKey"));

  -[HMDMatterPath clusterID](self, "clusterID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDMatterPathClusterIDKey"));

  -[HMDMatterPath attributeID](self, "attributeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMDMatterPathAttributeIDKey"));

  -[HMDMatterPath commandID](self, "commandID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMDMatterPathCommandIDKey"));

  -[HMDMatterPath eventID](self, "eventID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMDMatterPathEventIDKey"));

}

- (HMDMatterPath)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  HMDMatterPath *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDMatterPathEndpointIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDMatterPathClusterIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDMatterPathAttributeIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDDB538], "attributePathWithEndpointID:clusterID:attributeID:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDMatterPathCommandIDKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDDB660], "commandPathWithEndpointID:clusterID:commandID:", v5, v6, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDMatterPathEventIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDDB748], "eventPathWithEndpointID:clusterID:eventID:", v5, v6, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  +[HMDMatterPath PathWithMTRPath:](HMDMatterPath, "PathWithMTRPath:", v8);
  v13 = (HMDMatterPath *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)populateModelObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v11;
  else
    v4 = 0;
  v5 = v4;
  -[HMDMatterPath endpointID](self, "endpointID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndpointID:", v6);

  -[HMDMatterPath clusterID](self, "clusterID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClusterID:", v7);

  -[HMDMatterPath attributeID](self, "attributeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributeID:", v8);

  -[HMDMatterPath commandID](self, "commandID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCommandID:", v9);

  -[HMDMatterPath eventID](self, "eventID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventID:", v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HMDMatterPath uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterPath mtrPath](self, "mtrPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUID:mtrPath:", v5, v6);

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDMatterPath uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterPath accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterPath path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@/%@ %@"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDMatterPath accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMatterPath path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7;
  id v8;
  HMDMatterPathModel *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:]([HMDMatterPathModel alloc], "initWithObjectChangeType:uuid:parentUUID:", a3, v8, v7);

  return v9;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  objc_msgSend(a5, "respondWithSuccess", a3, a4);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (MTRClusterPath)clusterPath
{
  return self->_clusterPath;
}

- (MTRAttributePath)attributePath
{
  return self->_attributePath;
}

- (MTRCommandPath)commandPath
{
  return self->_commandPath;
}

- (MTREventPath)eventPath
{
  return self->_eventPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPath, 0);
  objc_storeStrong((id *)&self->_commandPath, 0);
  objc_storeStrong((id *)&self->_attributePath, 0);
  objc_storeStrong((id *)&self->_clusterPath, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)PathWithMTRPath:(id)a3
{
  id v3;
  HMDMatterPath *v4;
  void *v5;
  HMDMatterPath *v6;

  v3 = a3;
  v4 = [HMDMatterPath alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDMatterPath initWithUUID:mtrPath:](v4, "initWithUUID:mtrPath:", v5, v3);

  return v6;
}

+ (id)PathWithAttributeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDDB538], "attributePathWithEndpointID:clusterID:attributeID:", a4, a5, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMatterPath PathWithMTRPath:](HMDMatterPath, "PathWithMTRPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)PathWithCommandID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDDB660], "commandPathWithEndpointID:clusterID:commandID:", a4, a5, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMatterPath PathWithMTRPath:](HMDMatterPath, "PathWithMTRPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)PathWithEventID:(id)a3 endpointID:(id)a4 clusterID:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDDB748], "eventPathWithEndpointID:clusterID:eventID:", a4, a5, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMatterPath PathWithMTRPath:](HMDMatterPath, "PathWithMTRPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_144622 != -1)
    dispatch_once(&logCategory__hmf_once_t7_144622, &__block_literal_global_144623);
  return (id)logCategory__hmf_once_v8_144624;
}

void __28__HMDMatterPath_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_144624;
  logCategory__hmf_once_v8_144624 = v0;

}

@end
