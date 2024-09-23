@implementation RTSynthesizedLocationEnumerationContext

- (RTSynthesizedLocationEnumerationContext)init
{
  void *v3;
  RTSynthesizedLocationEnumerationContext *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[RTSynthesizedLocationEnumerationContext initWithEnumerationOptions:offset:](self, "initWithEnumerationOptions:offset:", v3, 0);

  return v4;
}

- (RTSynthesizedLocationEnumerationContext)initWithEnumerationOptions:(id)a3
{
  return -[RTSynthesizedLocationEnumerationContext initWithEnumerationOptions:offset:](self, "initWithEnumerationOptions:offset:", a3, 0);
}

- (RTSynthesizedLocationEnumerationContext)initWithEnumerationOptions:(id)a3 offset:(unint64_t)a4
{
  id v6;
  RTSynthesizedLocationEnumerationContext *v7;
  uint64_t v8;
  RTSynthesizedLocationEnumerationOptions *options;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTSynthesizedLocationEnumerationContext;
  v7 = -[RTSynthesizedLocationEnumerationContext init](&v11, sel_init);
  if (v7)
  {
    if (v6)
      v8 = objc_msgSend(v6, "copy");
    else
      v8 = objc_opt_new();
    options = v7->_options;
    v7->_options = (RTSynthesizedLocationEnumerationOptions *)v8;

    v7->_offset = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RTSynthesizedLocationEnumerationContext options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEnumerationOptions:offset:", v5, -[RTSynthesizedLocationEnumerationContext offset](self, "offset"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  RTSynthesizedLocationEnumerationOptions *options;
  id v5;

  options = self->_options;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", options, CFSTR("options"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_offset, CFSTR("offset"));

}

- (RTSynthesizedLocationEnumerationContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  RTSynthesizedLocationEnumerationContext *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("offset"));

  v7 = -[RTSynthesizedLocationEnumerationContext initWithEnumerationOptions:offset:](self, "initWithEnumerationOptions:offset:", v5, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  RTSynthesizedLocationEnumerationContext *v4;
  RTSynthesizedLocationEnumerationContext *v5;
  BOOL v6;

  v4 = (RTSynthesizedLocationEnumerationContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTSynthesizedLocationEnumerationContext isEqualToContext:](self, "isEqualToContext:", v5);

  return v6;
}

- (BOOL)isEqualToContext:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  RTSynthesizedLocationEnumerationOptions *options;
  RTSynthesizedLocationEnumerationOptions *v8;
  void *v9;
  char v10;
  unint64_t offset;
  BOOL v12;

  v5 = a3;
  v6 = v5;
  options = self->_options;
  v8 = options;
  if (options)
  {
LABEL_4:
    objc_msgSend(v6, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTSynthesizedLocationEnumerationOptions isEqual:](v8, "isEqual:", v9);

    if (options)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v5, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = self->_options;
    goto LABEL_4;
  }
  v10 = 1;
LABEL_7:

LABEL_8:
  offset = self->_offset;
  if (offset == objc_msgSend(v6, "offset"))
    v12 = v10;
  else
    v12 = 0;

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[RTSynthesizedLocationEnumerationOptions hash](self->_options, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_offset);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("options, %@, offset, %lu"), self->_options, self->_offset);
}

- (RTSynthesizedLocationEnumerationOptions)options
{
  return self->_options;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
