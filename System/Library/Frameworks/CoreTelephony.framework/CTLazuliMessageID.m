@implementation CTLazuliMessageID

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageID uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", uuid = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliMessageID uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageID *v4;
  CTLazuliMessageID *v5;
  BOOL v6;

  v4 = (CTLazuliMessageID *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageID isEqualToCTLazuliMessageID:](self, "isEqualToCTLazuliMessageID:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageID *v4;

  v4 = +[CTLazuliMessageID allocWithZone:](CTLazuliMessageID, "allocWithZone:", a3);
  -[CTLazuliMessageID setUuid:](v4, "setUuid:", self->_uuid);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("kUuidKey"));
}

- (CTLazuliMessageID)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageID *v5;
  uint64_t v6;
  NSString *uuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageID;
  v5 = -[CTLazuliMessageID init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUuidKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliMessageID)initWithReflection:(const void *)a3
{
  CTLazuliMessageID *v4;
  const void *v5;
  uint64_t v6;
  NSString *uuid;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageID;
  v4 = -[CTLazuliMessageID init](&v9, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v4->_uuid;
    v4->_uuid = (NSString *)v6;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)extractRawMessageID
{
  void *v3;
  void *v4;
  void *v5;

  -[CTLazuliMessageID uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("__"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  else
    -[CTLazuliMessageID uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
