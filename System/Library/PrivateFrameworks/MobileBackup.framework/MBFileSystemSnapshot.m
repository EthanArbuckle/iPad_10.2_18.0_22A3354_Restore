@implementation MBFileSystemSnapshot

- (MBFileSystemSnapshot)initWithName:(id)a3 uuid:(id)a4 creationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  MBFileSystemSnapshot *v11;
  MBFileSystemSnapshot *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MBFileSystemSnapshot;
  v11 = -[MBFileSystemSnapshot init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MBFileSystemSnapshot setName:](v11, "setName:", v8);
    -[MBFileSystemSnapshot setUuid:](v12, "setUuid:", v9);
    -[MBFileSystemSnapshot setCreationDate:](v12, "setCreationDate:", v10);
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MBFileSystemSnapshot name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBFileSystemSnapshot uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBFileSystemSnapshot creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MBStringWithDate((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBFileSystemSnapshot creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: name=\"%@\", uuid=%@, creationDate=\"%@\"(%.3f)>"), v4, v5, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
