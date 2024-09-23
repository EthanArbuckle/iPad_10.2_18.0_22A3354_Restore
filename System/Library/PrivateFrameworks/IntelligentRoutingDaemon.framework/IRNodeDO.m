@implementation IRNodeDO

- (IRNodeDO)initWithAvOutpuDeviceIdentifier:(id)a3 rapportIdentifier:(id)a4 idsIdentifier:(id)a5 avOutputDevice:(id)a6 rapportDevice:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IRNodeDO *v17;
  IRNodeDO *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IRNodeDO;
  v17 = -[IRNodeDO init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_avOutpuDeviceIdentifier, a3);
    objc_storeStrong((id *)&v18->_rapportIdentifier, a4);
    objc_storeStrong((id *)&v18->_idsIdentifier, a5);
    objc_storeStrong((id *)&v18->_avOutputDevice, a6);
    objc_storeStrong((id *)&v18->_rapportDevice, a7);
  }

  return v18;
}

+ (id)nodeDOWithAvOutpuDeviceIdentifier:(id)a3 rapportIdentifier:(id)a4 idsIdentifier:(id)a5 avOutputDevice:(id)a6 rapportDevice:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", v16, v15, v14, v13, v12);

  return v17;
}

- (id)copyWithReplacementAvOutpuDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", v4, self->_rapportIdentifier, self->_idsIdentifier, self->_avOutputDevice, self->_rapportDevice);

  return v5;
}

- (id)copyWithReplacementRapportIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", self->_avOutpuDeviceIdentifier, v4, self->_idsIdentifier, self->_avOutputDevice, self->_rapportDevice);

  return v5;
}

- (id)copyWithReplacementIdsIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", self->_avOutpuDeviceIdentifier, self->_rapportIdentifier, v4, self->_avOutputDevice, self->_rapportDevice);

  return v5;
}

- (id)copyWithReplacementAvOutputDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", self->_avOutpuDeviceIdentifier, self->_rapportIdentifier, self->_idsIdentifier, v4, self->_rapportDevice);

  return v5;
}

- (id)copyWithReplacementRapportDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", self->_avOutpuDeviceIdentifier, self->_rapportIdentifier, self->_idsIdentifier, self->_avOutputDevice, v4);

  return v5;
}

- (BOOL)isEqualToNodeDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *avOutpuDeviceIdentifier;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *rapportIdentifier;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *idsIdentifier;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  IRAVOutputDeviceDO *avOutputDevice;
  void *v28;
  _BOOL4 v29;
  int v30;
  void *v31;
  int v32;
  IRRapportDeviceDO *rapportDevice;
  void *v34;
  char v35;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_17;
  v6 = self->_avOutpuDeviceIdentifier != 0;
  objc_msgSend(v4, "avOutpuDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_17;
  avOutpuDeviceIdentifier = self->_avOutpuDeviceIdentifier;
  if (avOutpuDeviceIdentifier)
  {
    objc_msgSend(v5, "avOutpuDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](avOutpuDeviceIdentifier, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  v12 = self->_rapportIdentifier != 0;
  objc_msgSend(v5, "rapportIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_17;
  rapportIdentifier = self->_rapportIdentifier;
  if (rapportIdentifier)
  {
    objc_msgSend(v5, "rapportIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](rapportIdentifier, "isEqual:", v16);

    if (!v17)
      goto LABEL_17;
  }
  v18 = self->_idsIdentifier != 0;
  objc_msgSend(v5, "idsIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_17;
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
  {
    objc_msgSend(v5, "idsIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSString isEqual:](idsIdentifier, "isEqual:", v22);

    if (!v23)
      goto LABEL_17;
  }
  v24 = self->_avOutputDevice != 0;
  objc_msgSend(v5, "avOutputDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_17;
  avOutputDevice = self->_avOutputDevice;
  if (avOutputDevice)
  {
    objc_msgSend(v5, "avOutputDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[IRAVOutputDeviceDO isEqual:](avOutputDevice, "isEqual:", v28);

    if (!v29)
      goto LABEL_17;
  }
  v30 = self->_rapportDevice != 0;
  objc_msgSend(v5, "rapportDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v30 == v32)
  {
LABEL_17:
    v35 = 0;
  }
  else
  {
    rapportDevice = self->_rapportDevice;
    if (rapportDevice)
    {
      objc_msgSend(v5, "rapportDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[IRRapportDeviceDO isEqual:](rapportDevice, "isEqual:", v34);

    }
    else
    {
      v35 = 1;
    }
  }

  return v35;
}

- (BOOL)isEqual:(id)a3
{
  IRNodeDO *v4;
  IRNodeDO *v5;
  BOOL v6;

  v4 = (IRNodeDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRNodeDO isEqualToNodeDO:](self, "isEqualToNodeDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_avOutpuDeviceIdentifier, "hash");
  v4 = -[NSString hash](self->_rapportIdentifier, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_idsIdentifier, "hash") - v4 + 32 * v4;
  v6 = -[IRAVOutputDeviceDO hash](self->_avOutputDevice, "hash") - v5 + 32 * v5;
  return -[IRRapportDeviceDO hash](self->_rapportDevice, "hash") - v6 + 32 * v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRNodeDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IRNodeDO *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avOutpuDeviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRNodeDO key \"avOutpuDeviceIdentifier\" (expected %@, decoded %@)"), v7, v9, 0);
      v32 = *MEMORY[0x24BDD0FC8];
      v33[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNodeDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_15:

LABEL_16:
      v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
LABEL_6:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rapportIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRNodeDO key \"rapportIdentifier\" (expected %@, decoded %@)"), v9, v10, 0);
        v30 = *MEMORY[0x24BDD0FC8];
        v31 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNodeDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRNodeDO key \"idsIdentifier\" (expected %@, decoded %@)"), v10, v11, 0);
        v28 = *MEMORY[0x24BDD0FC8];
        v29 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNodeDOOCNTErrorDomain"), 3, v17);
        objc_msgSend(v4, "failWithError:", v21);

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_16;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avOutputDevice"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 || (objc_msgSend(v4, "error"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v26, !v26))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rapportDevice"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25
        || (objc_msgSend(v4, "error"), v27 = (void *)objc_claimAutoreleasedReturnValue(), v27, !v27))
      {
        self = -[IRNodeDO initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:](self, "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", v5, v7, v9, v24, v25);
        v14 = self;
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

    goto LABEL_17;
  }
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_6;
  v14 = 0;
LABEL_19:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *avOutpuDeviceIdentifier;
  NSString *rapportIdentifier;
  NSString *idsIdentifier;
  IRAVOutputDeviceDO *avOutputDevice;
  IRRapportDeviceDO *rapportDevice;
  id v10;

  v4 = a3;
  avOutpuDeviceIdentifier = self->_avOutpuDeviceIdentifier;
  v10 = v4;
  if (avOutpuDeviceIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", avOutpuDeviceIdentifier, CFSTR("avOutpuDeviceIdentifier"));
    v4 = v10;
  }
  rapportIdentifier = self->_rapportIdentifier;
  if (rapportIdentifier)
  {
    objc_msgSend(v10, "encodeObject:forKey:", rapportIdentifier, CFSTR("rapportIdentifier"));
    v4 = v10;
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
  {
    objc_msgSend(v10, "encodeObject:forKey:", idsIdentifier, CFSTR("idsIdentifier"));
    v4 = v10;
  }
  avOutputDevice = self->_avOutputDevice;
  if (avOutputDevice)
  {
    objc_msgSend(v10, "encodeObject:forKey:", avOutputDevice, CFSTR("avOutputDevice"));
    v4 = v10;
  }
  rapportDevice = self->_rapportDevice;
  if (rapportDevice)
  {
    objc_msgSend(v10, "encodeObject:forKey:", rapportDevice, CFSTR("rapportDevice"));
    v4 = v10;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRNodeDO | avOutpuDeviceIdentifier:%@ rapportIdentifier:%@ idsIdentifier:%@ avOutputDevice:%@ rapportDevice:%@>"), self->_avOutpuDeviceIdentifier, self->_rapportIdentifier, self->_idsIdentifier, self->_avOutputDevice, self->_rapportDevice);
}

- (NSString)avOutpuDeviceIdentifier
{
  return self->_avOutpuDeviceIdentifier;
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (IRAVOutputDeviceDO)avOutputDevice
{
  return self->_avOutputDevice;
}

- (IRRapportDeviceDO)rapportDevice
{
  return self->_rapportDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportDevice, 0);
  objc_storeStrong((id *)&self->_avOutputDevice, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_avOutpuDeviceIdentifier, 0);
}

+ (id)nodeDOFromNode:(id)a3
{
  id v3;
  IRNodeDO *v4;
  void *v5;
  void *v6;
  void *v7;
  IRNodeDO *v8;

  v3 = a3;
  v4 = [IRNodeDO alloc];
  objc_msgSend(v3, "avOutpuDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rapportIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[IRNodeDO initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:](v4, "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", v5, v6, v7, 0, 0);
  return v8;
}

+ (id)nodeFromNodeDO:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BE5B2F8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "avOutpuDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAvOutpuDeviceIdentifier:", v6);

  objc_msgSend(v4, "rapportIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRapportIdentifier:", v7);

  objc_msgSend(v4, "idsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdsIdentifier:", v8);

  objc_msgSend(v4, "computeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setName:", v9);
  return v5;
}

- (id)computedIdsIdentifier
{
  void *v3;
  void *v4;

  -[IRNodeDO idsIdentifier](self, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[IRNodeDO rapportDevice](self, "rapportDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)computedMediaRemoteIdenfifier
{
  void *v3;
  void *v4;
  void *v5;

  -[IRNodeDO avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[IRNodeDO avOutputDevice](self, "avOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[IRNodeDO rapportDevice](self, "rapportDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaRemoteIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (id)computedMediaRouteIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[IRNodeDO avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[IRNodeDO avOutputDevice](self, "avOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[IRNodeDO rapportDevice](self, "rapportDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaRouteIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (id)exportAsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[IRNodeDO avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("avOutpuDeviceIdentifier"));

  -[IRNodeDO rapportIdentifier](self, "rapportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rapportIdentifier"));

  -[IRNodeDO idsIdentifier](self, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("idsIdentifier"));

  -[IRNodeDO avOutputDevice](self, "avOutputDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exportAsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("avOutputDevice"));

  -[IRNodeDO rapportDevice](self, "rapportDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exportAsDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("rapportDevice"));

  return v3;
}

- (id)computeName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[IRNodeDO avOutputDevice](self, "avOutputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IRNodeDO avOutputDevice](self, "avOutputDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceName");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IRNodeDO rapportDevice](self, "rapportDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = 0;
      return v9;
    }
    -[IRNodeDO rapportDevice](self, "rapportDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

  return v9;
}

- (BOOL)deviceTypeExistsAirplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[IRNodeDO avOutputDevice](self, "avOutputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IRNodeDO avOutputDevice](self, "avOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[IRNodeDO avOutputDevice](self, "avOutputDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "deviceType") == 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)deviceTypeExistsNotAirplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[IRNodeDO avOutputDevice](self, "avOutputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IRNodeDO avOutputDevice](self, "avOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[IRNodeDO avOutputDevice](self, "avOutputDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "deviceType") != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
