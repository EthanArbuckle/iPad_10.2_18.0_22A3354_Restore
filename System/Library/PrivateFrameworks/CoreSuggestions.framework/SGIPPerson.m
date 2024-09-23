@implementation SGIPPerson

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGIPPerson '%@' ht:%@ h:%@>"), self->_name, self->_handleType, self->_handle);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_handleType, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_handle, "hash") - v4 + 32 * v4;
}

- (SGIPPerson)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  SGIPPerson *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (SGIPPerson *)objc_opt_new();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("nam"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPPerson setName:](v6, "setName:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("han"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIPPerson setHandle:](v6, "setHandle:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("hty"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGIPPerson setHandleType:](v6, "setHandleType:", v9);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("nam"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("han"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handleType, CFSTR("hty"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSString copyWithZone:](self->_handle, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSString copyWithZone:](self->_handleType, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

  }
  return v5;
}

- (BOOL)isEqualToPerson:(id)a3
{
  id *v4;
  id *v5;
  NSString *name;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *handle;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  char v16;
  NSString *v17;
  NSString *v18;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  name = self->_name;
  v7 = (NSString *)v4[1];
  if (name == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = name;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_8;
  }
  handle = self->_handle;
  v12 = (NSString *)v5[2];
  if (handle == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = handle;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
LABEL_8:
      v16 = 0;
      goto LABEL_14;
    }
  }
  v17 = self->_handleType;
  v18 = v17;
  if (v17 == v5[3])
    v16 = 1;
  else
    v16 = -[NSString isEqual:](v17, "isEqual:");

LABEL_14:
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  SGIPPerson *v4;
  SGIPPerson *v5;
  BOOL v6;

  v4 = (SGIPPerson *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGIPPerson isEqualToPerson:](self, "isEqualToPerson:", v5);

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(id)a3
{
  objc_storeStrong((id *)&self->_handleType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)personWithIPPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setName:", v6);

  objc_msgSend(v3, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setHandle:", v8);

  objc_msgSend(v3, "handleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setHandleType:", v10);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
