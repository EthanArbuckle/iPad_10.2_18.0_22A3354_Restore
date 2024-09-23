@implementation STPersonContactHandle

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[STPersonContactHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPersonContactHandle label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; handle=%@ (%@)>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqualToPersonContactHandle:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[STPersonContactHandle type](self, "type");
  if (v5 != objc_msgSend(v4, "type"))
    goto LABEL_10;
  -[STPersonContactHandle label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v4, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_10;
  }
  -[STPersonContactHandle label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[STPersonContactHandle handle](self, "handle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

LABEL_12:
      -[STPersonContactHandle handle](self, "handle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "isEqualToString:", v16);

      goto LABEL_11;
    }
    objc_msgSend(v4, "handle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_12;
  }
LABEL_10:
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[STPersonContactHandle isEqualToPersonContactHandle:](self, "isEqualToPersonContactHandle:", v4);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[STPersonContactHandle type](self, "type");
  -[STPersonContactHandle label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[STPersonContactHandle handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("_handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("_label"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("_type"));

}

- (STPersonContactHandle)initWithCoder:(id)a3
{
  id v4;
  STPersonContactHandle *v5;
  uint64_t v6;
  NSString *handle;
  uint64_t v8;
  NSString *label;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STPersonContactHandle;
  v5 = -[STPersonContactHandle init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
  }

  return v5;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
