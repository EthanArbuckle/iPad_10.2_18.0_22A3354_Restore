@implementation CXLabeledHandle

- (CXLabeledHandle)initWithHandle:(id)a3 label:(id)a4
{
  id v7;
  id v8;
  CXLabeledHandle *v9;
  uint64_t v10;
  NSString *label;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CXLabeledHandle;
  v9 = -[CXLabeledHandle init](&v13, sel_init);
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        objc_storeStrong((id *)&v9->_handle, a3);
        v10 = objc_msgSend(v8, "copy");
        label = v9->_label;
        v9->_label = (NSString *)v10;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXLabeledHandle initWithHandle:label:]", CFSTR("handle"));
      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXLabeledHandle initWithHandle:label:]", CFSTR("label"));
    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (CXLabeledHandle)init
{

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXLabeledHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXLabeledHandle label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p handle=%@ label=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CXLabeledHandle isEqualToLabeledHandle:](self, "isEqualToLabeledHandle:", v4);

  return v5;
}

- (BOOL)isEqualToLabeledHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  -[CXLabeledHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToHandle:", v6))
  {
    -[CXLabeledHandle label](self, "label");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (v7 | v8) == 0;
    if (v8)
      v9 = objc_msgSend((id)v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CXLabeledHandle handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXLabeledHandle label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXLabeledHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXLabeledHandle label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHandle:label:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXLabeledHandle)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CXLabeledHandle *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_label);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CXLabeledHandle initWithHandle:label:](self, "initWithHandle:label:", v7, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CXLabeledHandle handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXLabeledHandle label](self, "label");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_label);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (CXHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
