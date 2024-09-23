@implementation CTStewieRequestContext

- (id)description
{
  void *v3;
  unint64_t v4;
  const char *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTStewieRequestContext reason](self, "reason");
  if (v4 > 0xA)
    v5 = "???";
  else
    v5 = off_1E15346D8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR(", reason=%s"), v5);
  -[CTStewieRequestContext metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metadata=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToRequestContext:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[CTStewieRequestContext reason](self, "reason");
  if (v5 == objc_msgSend(v4, "reason"))
  {
    -[CTStewieRequestContext metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[CTStewieRequestContext metadata](self, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieRequestContext *v4;
  BOOL v5;

  v4 = (CTStewieRequestContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieRequestContext isEqualToRequestContext:](self, "isEqualToRequestContext:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setReason:", -[CTStewieRequestContext reason](self, "reason"));
  -[CTStewieRequestContext metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setMetadata:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieRequestContext reason](self, "reason"), CFSTR("reason"));
  -[CTStewieRequestContext metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("metadata"));

}

- (CTStewieRequestContext)initWithCoder:(id)a3
{
  id v4;
  CTStewieRequestContext *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *metadata;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTStewieRequestContext;
  v5 = -[CTStewieRequestContext init](&v15, sel_init);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("metadata"));
    v12 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSData)epki
{
  return self->_epki;
}

- (void)setEpki:(id)a3
{
  objc_storeStrong((id *)&self->_epki, a3);
}

- (NSData)shared
{
  return self->_shared;
}

- (void)setShared:(id)a3
{
  objc_storeStrong((id *)&self->_shared, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shared, 0);
  objc_storeStrong((id *)&self->_epki, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
