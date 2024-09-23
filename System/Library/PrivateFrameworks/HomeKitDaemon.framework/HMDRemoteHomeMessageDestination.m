@implementation HMDRemoteHomeMessageDestination

- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3 homeUUID:(id)a4
{
  return -[HMDRemoteHomeMessageDestination initWithTarget:homeUUID:queueTimeout:](self, "initWithTarget:homeUUID:queueTimeout:", a3, a4, 0);
}

- (HMDRemoteHomeMessageDestination)initWithTarget:(id)a3 homeUUID:(id)a4 queueTimeout:(id)a5
{
  id v9;
  id v10;
  HMDRemoteHomeMessageDestination *v11;
  HMDRemoteHomeMessageDestination *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDRemoteHomeMessageDestination;
  v11 = -[HMFMessageDestination initWithTarget:](&v14, sel_initWithTarget_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeUUID, a4);
    objc_storeStrong((id *)&v12->_queueTimeout, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMFMessageDestination target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDRemoteHomeMessageDestination homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMDRemoteHomeMessageDestination queueTimeout](self, "queueTimeout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMDRemoteHomeMessageDestination *v4;
  HMDRemoteHomeMessageDestination *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (HMDRemoteHomeMessageDestination *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMFMessageDestination target](self, "target");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFMessageDestination target](v5, "target");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8
        && (-[HMDRemoteHomeMessageDestination homeUUID](self, "homeUUID"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[HMDRemoteHomeMessageDestination homeUUID](v5, "homeUUID"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqual:", v10),
            v10,
            v9,
            v11))
      {
        -[HMDRemoteHomeMessageDestination queueTimeout](self, "queueTimeout");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemoteHomeMessageDestination queueTimeout](v5, "queueTimeout");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = HMFEqualObjects();

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

  return v14;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDestination target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24E79DB48;
  }
  -[HMFMessageDestination target](self, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteHomeMessageDestination homeUUID](self, "homeUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteHomeMessageDestination queueTimeout](self, "queueTimeout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Target = %@, Home UUID = %@, Queue Timeout = %@>"), v6, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v13;
}

- (id)debugDescription
{
  return -[HMDRemoteHomeMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMDRemoteHomeMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)privateDescription
{
  return -[HMDRemoteHomeMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSNumber)queueTimeout
{
  return self->_queueTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueTimeout, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
