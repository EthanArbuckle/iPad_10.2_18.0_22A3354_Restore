@implementation COAlarmReadRequest

- (COAlarmReadRequest)initWithAccessoryUniqueIdentifier:(id)a3 requiresFilter:(BOOL)a4
{
  id v7;
  COAlarmReadRequest *v8;
  COAlarmReadRequest *v9;

  v7 = a3;
  v8 = -[COMeshCommand init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessoryUniqueIdentifier, a3);
    v9->_requiresFilter = a4;
  }

  return v9;
}

- (COAlarmReadRequest)initWithAccessoryUniqueIdentifier:(id)a3
{
  return -[COAlarmReadRequest initWithAccessoryUniqueIdentifier:requiresFilter:](self, "initWithAccessoryUniqueIdentifier:requiresFilter:", a3, 1);
}

- (COAlarmReadRequest)initWithAccessory:(id)a3
{
  void *v4;
  COAlarmReadRequest *v5;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[COAlarmReadRequest initWithAccessoryUniqueIdentifier:](self, "initWithAccessoryUniqueIdentifier:", v4);

  return v5;
}

- (id)initForMerge
{
  id result;

  result = -[COMeshCommand init](self, "init");
  if (result)
  {
    *((_BYTE *)result + 17) = 0;
    *((_BYTE *)result + 16) = 1;
  }
  return result;
}

- (COAlarmReadRequest)initWithCoder:(id)a3
{
  id v4;
  COAlarmReadRequest *v5;
  uint64_t v6;
  NSUUID *accessoryUniqueIdentifier;
  uint64_t v8;
  NSString *eTag;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COAlarmReadRequest;
  v5 = -[COMeshCommand initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("identifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v6 = objc_claimAutoreleasedReturnValue();
      accessoryUniqueIdentifier = v5->_accessoryUniqueIdentifier;
      v5->_accessoryUniqueIdentifier = (NSUUID *)v6;

    }
    v5->_requiresFilter = objc_msgSend(v4, "containsValueForKey:", CFSTR("filtered"));
    v5->_isForMerge = objc_msgSend(v4, "containsValueForKey:", CFSTR("merge"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("etag")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("etag"));
      v8 = objc_claimAutoreleasedReturnValue();
      eTag = v5->_eTag;
      v5->_eTag = (NSString *)v8;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COAlarmReadRequest;
  -[COMeshCommand encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[COAlarmReadRequest accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));
  if (-[COAlarmReadRequest requiresFilter](self, "requiresFilter"))
    objc_msgSend(v4, "encodeObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("filtered"));
  if (-[COAlarmReadRequest isForMerge](self, "isForMerge"))
    objc_msgSend(v4, "encodeObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("merge"));
  -[COAlarmReadRequest eTag](self, "eTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[COAlarmReadRequest eTag](self, "eTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("etag"));

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acceptableResponses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (NSUUID)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (BOOL)isForMerge
{
  return self->_isForMerge;
}

- (NSString)eTag
{
  return self->_eTag;
}

- (void)setETag:(id)a3
{
  objc_storeStrong((id *)&self->_eTag, a3);
}

- (BOOL)requiresFilter
{
  return self->_requiresFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
}

@end
