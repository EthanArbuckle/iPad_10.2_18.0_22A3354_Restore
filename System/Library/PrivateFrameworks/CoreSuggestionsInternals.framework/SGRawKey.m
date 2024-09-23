@implementation SGRawKey

- (SGRawKey)initWithSerialized:(id)a3
{
  id v6;
  SGRawKey *v7;
  SGRawKey *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGRawKey.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialized"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGRawKey;
  v7 = -[SGRawKey init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_serialized, a3);

  return v8;
}

- (id)serialize
{
  return self->_serialized;
}

- (BOOL)isEqual:(id)a3
{
  SGRawKey *v4;
  SGRawKey *v5;
  BOOL v6;

  v4 = (SGRawKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGRawKey isEqualToRawKey:](self, "isEqualToRawKey:", v5);

  return v6;
}

- (BOOL)isEqualToRawKey:(id)a3
{
  SGRawKey *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = (SGRawKey *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = self->_serialized;
    v6 = v5;
    if (v5 == v4->_serialized)
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_serialized, "hash");
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGRawKey: %@>"), self->_serialized);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialized, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return 1;
}

@end
