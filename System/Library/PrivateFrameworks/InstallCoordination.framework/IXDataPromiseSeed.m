@implementation IXDataPromiseSeed

- (IXDataPromiseSeed)initWithCoder:(id)a3
{
  id v4;
  IXDataPromiseSeed *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  NSUUID *uniqueIdentifier;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IXDataPromiseSeed;
  v5 = -[IXDataPromiseSeed init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creatorIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_creatorIdentifier = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalBytesNeededOnDisk"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalBytesNeededOnDisk = objc_msgSend(v11, "unsignedLongLongValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[IXDataPromiseSeed name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXDataPromiseSeed creatorIdentifier](self, "creatorIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("creatorIdentifier"));

  -[IXDataPromiseSeed uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("uniqueIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IXDataPromiseSeed totalBytesNeededOnDisk](self, "totalBytesNeededOnDisk"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("totalBytesNeededOnDisk"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[IXDataPromiseSeed name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(v4, "setCreatorIdentifier:", -[IXDataPromiseSeed creatorIdentifier](self, "creatorIdentifier"));
  -[IXDataPromiseSeed uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniqueIdentifier:", v6);

  objc_msgSend(v4, "setTotalBytesNeededOnDisk:", -[IXDataPromiseSeed totalBytesNeededOnDisk](self, "totalBytesNeededOnDisk"));
  return v4;
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)creatorIdentifier
{
  return self->_creatorIdentifier;
}

- (void)setCreatorIdentifier:(unint64_t)a3
{
  self->_creatorIdentifier = a3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (unint64_t)totalBytesNeededOnDisk
{
  return self->_totalBytesNeededOnDisk;
}

- (void)setTotalBytesNeededOnDisk:(unint64_t)a3
{
  self->_totalBytesNeededOnDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
