@implementation IRNearbyDeviceContainerDO

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_freezeDateNIHomeDevice, "hash");
  return -[NSSet hash](self->_nearbyDevices, "hash") - v3 + 32 * v3;
}

- (NSDate)freezeDateNIHomeDevice
{
  return self->_freezeDateNIHomeDevice;
}

- (NSSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (id)exportAsArray
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IRNearbyDeviceContainerDO nearbyDevices](self, "nearbyDevices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "exportAsDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (IRNearbyDeviceContainerDO)initWithFreezeDateNIHomeDevice:(id)a3 nearbyDevices:(id)a4
{
  id v7;
  id v8;
  IRNearbyDeviceContainerDO *v9;
  IRNearbyDeviceContainerDO *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IRNearbyDeviceContainerDO;
  v9 = -[IRNearbyDeviceContainerDO init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_freezeDateNIHomeDevice, a3);
    objc_storeStrong((id *)&v10->_nearbyDevices, a4);
  }

  return v10;
}

+ (id)miLoNearbyDeviceDOWithFreezeDateNIHomeDevice:(id)a3 nearbyDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFreezeDateNIHomeDevice:nearbyDevices:", v7, v6);

  return v8;
}

- (id)copyWithReplacementFreezeDateNIHomeDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFreezeDateNIHomeDevice:nearbyDevices:", v4, self->_nearbyDevices);

  return v5;
}

- (id)copyWithReplacementNearbyDevices:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFreezeDateNIHomeDevice:nearbyDevices:", self->_freezeDateNIHomeDevice, v4);

  return v5;
}

- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSDate *freezeDateNIHomeDevice;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSSet *nearbyDevices;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_freezeDateNIHomeDevice != 0;
  objc_msgSend(v4, "freezeDateNIHomeDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  freezeDateNIHomeDevice = self->_freezeDateNIHomeDevice;
  if (freezeDateNIHomeDevice)
  {
    objc_msgSend(v5, "freezeDateNIHomeDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDate isEqual:](freezeDateNIHomeDevice, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_nearbyDevices != 0;
  objc_msgSend(v5, "nearbyDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    nearbyDevices = self->_nearbyDevices;
    if (nearbyDevices)
    {
      objc_msgSend(v5, "nearbyDevices");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSSet isEqual:](nearbyDevices, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  IRNearbyDeviceContainerDO *v4;
  IRNearbyDeviceContainerDO *v5;
  BOOL v6;

  v4 = (IRNearbyDeviceContainerDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRNearbyDeviceContainerDO isEqualToMiLoNearbyDeviceDO:](self, "isEqualToMiLoNearbyDeviceDO:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRNearbyDeviceContainerDO)initWithCoder:(id)a3
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
  IRNearbyDeviceContainerDO *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("freezeDateNIHomeDevice"));
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
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRNearbyDeviceContainerDO key \"freezeDateNIHomeDevice\" (expected %@, decoded %@)"), v7, v9, 0);
      v21 = *MEMORY[0x24BDD0FC8];
      v22[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRNearbyDeviceContainerDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);

LABEL_5:
      v14 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v4, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_5;
  }
  v15 = objc_alloc(MEMORY[0x24BDBCF20]);
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("nearbyDevices"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 || (objc_msgSend(v4, "error"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, !v19))
  {
    self = -[IRNearbyDeviceContainerDO initWithFreezeDateNIHomeDevice:nearbyDevices:](self, "initWithFreezeDateNIHomeDevice:nearbyDevices:", v5, v18);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

LABEL_11:
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *freezeDateNIHomeDevice;
  NSSet *nearbyDevices;
  id v7;

  v4 = a3;
  freezeDateNIHomeDevice = self->_freezeDateNIHomeDevice;
  v7 = v4;
  if (freezeDateNIHomeDevice)
  {
    objc_msgSend(v4, "encodeObject:forKey:", freezeDateNIHomeDevice, CFSTR("freezeDateNIHomeDevice"));
    v4 = v7;
  }
  nearbyDevices = self->_nearbyDevices;
  if (nearbyDevices)
  {
    objc_msgSend(v7, "encodeObject:forKey:", nearbyDevices, CFSTR("nearbyDevices"));
    v4 = v7;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<IRNearbyDeviceContainerDO | freezeDateNIHomeDevice:%@ nearbyDevices:%@>"), self->_freezeDateNIHomeDevice, self->_nearbyDevices);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_freezeDateNIHomeDevice, 0);
}

@end
