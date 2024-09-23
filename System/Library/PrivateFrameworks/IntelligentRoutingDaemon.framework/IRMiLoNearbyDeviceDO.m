@implementation IRMiLoNearbyDeviceDO

- (IRMiLoNearbyDeviceDO)initWithHasBleRssi:(BOOL)a3 deviceIdentifier:(id)a4
{
  id v7;
  IRMiLoNearbyDeviceDO *v8;
  IRMiLoNearbyDeviceDO *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRMiLoNearbyDeviceDO;
  v8 = -[IRMiLoNearbyDeviceDO init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_hasBleRssi = a3;
    objc_storeStrong((id *)&v8->_deviceIdentifier, a4);
  }

  return v9;
}

+ (id)miLoNearbyDeviceDOWithHasBleRssi:(BOOL)a3 deviceIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHasBleRssi:deviceIdentifier:", v4, v6);

  return v7;
}

- (id)copyWithReplacementHasBleRssi:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHasBleRssi:deviceIdentifier:", a3, self->_deviceIdentifier);
}

- (id)copyWithReplacementDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHasBleRssi:deviceIdentifier:", self->_hasBleRssi, v4);

  return v5;
}

- (BOOL)isEqualToMiLoNearbyDeviceDO:(id)a3
{
  id v4;
  void *v5;
  int hasBleRssi;
  int v7;
  void *v8;
  int v9;
  NSString *deviceIdentifier;
  void *v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4
    && (hasBleRssi = self->_hasBleRssi, hasBleRssi == objc_msgSend(v4, "hasBleRssi"))
    && (v7 = self->_deviceIdentifier != 0,
        objc_msgSend(v5, "deviceIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = v8 == 0,
        v8,
        v7 != v9))
  {
    deviceIdentifier = self->_deviceIdentifier;
    if (deviceIdentifier)
    {
      objc_msgSend(v5, "deviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSString isEqual:](deviceIdentifier, "isEqual:", v11);

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  IRMiLoNearbyDeviceDO *v4;
  IRMiLoNearbyDeviceDO *v5;
  BOOL v6;

  v4 = (IRMiLoNearbyDeviceDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRMiLoNearbyDeviceDO isEqualToMiLoNearbyDeviceDO:](self, "isEqualToMiLoNearbyDeviceDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  _BOOL8 hasBleRssi;

  hasBleRssi = self->_hasBleRssi;
  return -[NSString hash](self->_deviceIdentifier, "hash") - hasBleRssi + 32 * hasBleRssi;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRMiLoNearbyDeviceDO)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IRMiLoNearbyDeviceDO *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("hasBleRssi"));
  if (v5)
    goto LABEL_2;
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("hasBleRssi")) & 1) == 0)
    {
      v20 = *MEMORY[0x24BDD0FC8];
      v21[0] = CFSTR("Missing serialized value for IRMiLoNearbyDeviceDO.hasBleRssi");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiLoNearbyDeviceDOOCNTErrorDomain"), 1, v6);
      objc_msgSend(v4, "failWithError:", v8);
      goto LABEL_11;
    }
LABEL_2:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRMiLoNearbyDeviceDO key \"deviceIdentifier\" (expected %@, decoded %@)"), v8, v10, 0);
        v18 = *MEMORY[0x24BDD0FC8];
        v19 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRMiLoNearbyDeviceDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v13);

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_12:
        v15 = 0;
        goto LABEL_13;
      }
    }
    self = -[IRMiLoNearbyDeviceDO initWithHasBleRssi:deviceIdentifier:](self, "initWithHasBleRssi:deviceIdentifier:", v5 != 0, v6);
    v15 = self;
LABEL_13:

    goto LABEL_14;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceIdentifier;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", self->_hasBleRssi, CFSTR("hasBleRssi"));
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
    objc_msgSend(v5, "encodeObject:forKey:", deviceIdentifier, CFSTR("deviceIdentifier"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasBleRssi);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<IRMiLoNearbyDeviceDO | hasBleRssi:%@ deviceIdentifier:%@>"), v4, self->_deviceIdentifier);

  return v5;
}

- (BOOL)hasBleRssi
{
  return self->_hasBleRssi;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
