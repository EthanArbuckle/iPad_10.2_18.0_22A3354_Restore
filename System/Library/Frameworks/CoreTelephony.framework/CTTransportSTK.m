@implementation CTTransportSTK

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", index=%d"), -[CTTransportSTK index](self, "index"));
  -[CTTransportSTK key_epki](self, "key_epki");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", epki=%@"), v4);

  -[CTTransportSTK stk](self, "stk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", stk=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTTransportSTK)initWithSTK:(id)a3 forIdx:(int)a4
{
  uint64_t v4;
  id v6;
  CTTransportSTK *v7;
  CTTransportSTK *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTTransportSTK;
  v7 = -[CTTransportSTK init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CTTransportSTK setIndex:](v7, "setIndex:", v4);
    -[CTTransportSTK setStk:](v8, "setStk:", v6);
  }

  return v8;
}

- (CTTransportSTK)initWithSTK:(id)a3 forIdx:(int)a4 epki:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  CTTransportSTK *v10;
  CTTransportSTK *v11;
  objc_super v13;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CTTransportSTK;
  v10 = -[CTTransportSTK init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CTTransportSTK setIndex:](v10, "setIndex:", v6);
    -[CTTransportSTK setKey_epki:](v11, "setKey_epki:", v9);
    -[CTTransportSTK setStk:](v11, "setStk:", v8);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIndex:", -[CTTransportSTK index](self, "index"));
  -[CTTransportSTK key_epki](self, "key_epki");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setKey_epki:", v6);

  -[CTTransportSTK stk](self, "stk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setStk:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[CTTransportSTK index](self, "index"), CFSTR("tkey_index"));
  -[CTTransportSTK key_epki](self, "key_epki");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tkey_epki"));

  -[CTTransportSTK stk](self, "stk");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tkey_value"));

}

- (CTTransportSTK)initWithCoder:(id)a3
{
  id v4;
  CTTransportSTK *v5;
  uint64_t v6;
  NSData *key_epki;
  uint64_t v8;
  NSData *stk;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTTransportSTK;
  v5 = -[CTTransportSTK init](&v11, sel_init);
  if (v5)
  {
    v5->_index = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("tkey_index"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tkey_epki"));
    v6 = objc_claimAutoreleasedReturnValue();
    key_epki = v5->_key_epki;
    v5->_key_epki = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tkey_value"));
    v8 = objc_claimAutoreleasedReturnValue();
    stk = v5->_stk;
    v5->_stk = (NSData *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)index
{
  return self->_index;
}

- (void)setIndex:(int)a3
{
  self->_index = a3;
}

- (NSData)key_epki
{
  return self->_key_epki;
}

- (void)setKey_epki:(id)a3
{
  objc_storeStrong((id *)&self->_key_epki, a3);
}

- (NSData)stk
{
  return self->_stk;
}

- (void)setStk:(id)a3
{
  objc_storeStrong((id *)&self->_stk, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stk, 0);
  objc_storeStrong((id *)&self->_key_epki, 0);
}

@end
