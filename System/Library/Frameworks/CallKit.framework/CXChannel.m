@implementation CXChannel

- (CXChannel)initWithUUID:(id)a3 transmissionMode:(int64_t)a4
{
  id v7;
  CXChannel *v8;
  objc_super v10;

  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CXChannel;
  v8 = -[CXChannel init](&v10, sel_init);
  if (v8)
  {
    if (!v7)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXChannel initWithUUID:transmissionMode:]", CFSTR("UUID"));
    v8->_transmissionMode = a4;
    objc_storeStrong((id *)&v8->_UUID, a3);
  }

  return v8;
}

- (CXChannel)initWithChannel:(id)a3
{
  id v4;
  CXChannel *v5;
  CXChannel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXChannel;
  v5 = -[CXChannel init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_localizedName, *((id *)v4 + 2));
    v6->_transmissionMode = *((_QWORD *)v4 + 3);
    objc_storeStrong((id *)&v6->_UUID, *((id *)v4 + 1));
  }

  return v6;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CXChannel localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
      goto LABEL_7;
  }
  else if (v5)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v7 = -[CXChannel transmissionMode](self, "transmissionMode");
  if (v7 != objc_msgSend(v4, "transmissionMode"))
    goto LABEL_7;
  -[CXChannel UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

LABEL_8:
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXChannel UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p UUID=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXChannel UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  -[CXChannel localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localizedName=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_transmissionMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CXChannel transmissionMode](self, "transmissionMode");
  objc_opt_self();
  if (v7 > 2)
    v8 = 0;
  else
    v8 = off_1E4B890A0[v7];
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v6, v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CXChannel isEqualToChannel:](self, "isEqualToChannel:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  -[CXChannel localizedName](self, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[CXChannel transmissionMode](self, "transmissionMode");
  -[CXChannel UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hash");
  v14 = CXHash(4uLL, v7, v8, v9, v10, v11, v12, v13, v4, v5);

  return v14;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (BOOL)isEquivalentToChannel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CXChannel UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

+ (NSSet)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannel)initWithCoder:(id)a3
{
  id v4;
  CXChannel *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *localizedName;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSUUID *UUID;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CXChannel;
  v5 = -[CXChannel init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_localizedName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v8;

    NSStringFromSelector(sel_transmissionMode);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_transmissionMode = objc_msgSend(v4, "decodeIntegerForKey:", v10);

    v11 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CXChannel localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[CXChannel transmissionMode](self, "transmissionMode");
  NSStringFromSelector(sel_transmissionMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  -[CXChannel UUID](self, "UUID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CXChannel initWithChannel:](+[CXChannel allocWithZone:](CXChannel, "allocWithZone:", a3), "initWithChannel:", self);
}

@end
