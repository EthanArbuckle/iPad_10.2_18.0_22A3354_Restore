@implementation DSFileOperationID

- (DSFileOperationID)init
{
  void *v3;
  DSFileOperationID *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DSFileOperationID initWithUUID:](self, "initWithUUID:", v3);

  return v4;
}

- (DSFileOperationID)initWithUUID:(id)a3
{
  id v5;
  DSFileOperationID *v6;
  DSFileOperationID *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSFileOperationID;
  v6 = -[DSFileOperationID init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  void *v5;
  id v6;

  v6 = a3;
  uuid = self->_uuid;
  NSStringFromSelector(sel_uuid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", uuid, v5);

}

- (DSFileOperationID)initWithCoder:(id)a3
{
  id v4;
  DSFileOperationID *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *uuid;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DSFileOperationID;
  v5 = -[DSFileOperationID init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_uuid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(v4[1], "isEqual:", self->_uuid);
  else
    v5 = 0;

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
