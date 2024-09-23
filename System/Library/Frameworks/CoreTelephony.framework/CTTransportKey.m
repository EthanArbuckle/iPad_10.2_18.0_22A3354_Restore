@implementation CTTransportKey

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", index=%d"), -[CTTransportKey index](self, "index"));
  -[CTTransportKey key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", key=%@"), v4);

  -[CTTransportKey key_epki](self, "key_epki");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", epki=%@"), v5);

  -[CTTransportKey retiredKey_epki](self, "retiredKey_epki");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", retired epki=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", last resort=%d"), -[CTTransportKey last_resort](self, "last_resort"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTTransportKey)initWithKey:(id)a3 epki:(id)a4 forIdx:(int)a5 toReplaceEpki:(id)a6 isLastResort:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  CTTransportKey *v15;
  CTTransportKey *v16;
  objc_super v18;

  v7 = a7;
  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CTTransportKey;
  v15 = -[CTTransportKey init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[CTTransportKey setIndex:](v15, "setIndex:", v9);
    -[CTTransportKey setKey:](v16, "setKey:", v12);
    -[CTTransportKey setKey_epki:](v16, "setKey_epki:", v13);
    -[CTTransportKey setRetiredKey_epki:](v16, "setRetiredKey_epki:", v14);
    -[CTTransportKey setLast_resort:](v16, "setLast_resort:", v7);
  }

  return v16;
}

- (CTTransportKey)initWithKey:(id)a3 forIdx:(int)a4 toReplace:(id)a5
{
  uint64_t v5;
  id v7;
  CTTransportKey *v8;
  CTTransportKey *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTTransportKey;
  v8 = -[CTTransportKey init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CTTransportKey setIndex:](v8, "setIndex:", v5);
    -[CTTransportKey setKey:](v9, "setKey:", v7);
    -[CTTransportKey setKey_epki:](v9, "setKey_epki:", 0);
    -[CTTransportKey setRetiredKey_epki:](v9, "setRetiredKey_epki:", 0);
    -[CTTransportKey setLast_resort:](v9, "setLast_resort:", 0);
  }

  return v9;
}

- (CTTransportKey)initWithKey:(id)a3 epki:(id)a4 forIdx:(int)a5 toReplace:(id)a6 epki:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  CTTransportKey *v14;
  CTTransportKey *v15;
  objc_super v17;

  v8 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CTTransportKey;
  v14 = -[CTTransportKey init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[CTTransportKey setIndex:](v14, "setIndex:", v8);
    -[CTTransportKey setKey:](v15, "setKey:", v11);
    -[CTTransportKey setKey_epki:](v15, "setKey_epki:", v12);
    -[CTTransportKey setRetiredKey_epki:](v15, "setRetiredKey_epki:", v13);
    -[CTTransportKey setLast_resort:](v15, "setLast_resort:", 0);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIndex:", -[CTTransportKey index](self, "index"));
  -[CTTransportKey key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setKey:", v6);

  -[CTTransportKey key_epki](self, "key_epki");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setKey_epki:", v8);

  -[CTTransportKey retiredKey_epki](self, "retiredKey_epki");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setRetiredKey_epki:", v10);

  objc_msgSend(v4, "setLast_resort:", -[CTTransportKey last_resort](self, "last_resort"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInt32:forKey:", -[CTTransportKey index](self, "index"), CFSTR("tkey_index"));
  -[CTTransportKey key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("tkey_value"));

  -[CTTransportKey key_epki](self, "key_epki");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("tkey_epki"));

  -[CTTransportKey retiredKey_epki](self, "retiredKey_epki");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("tkey_retired_epki"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CTTransportKey last_resort](self, "last_resort"), CFSTR("last_resort"));
}

- (CTTransportKey)initWithCoder:(id)a3
{
  id v4;
  CTTransportKey *v5;
  uint64_t v6;
  NSData *key;
  uint64_t v8;
  NSData *key_epki;
  uint64_t v10;
  NSData *retiredKey_epki;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTTransportKey;
  v5 = -[CTTransportKey init](&v13, sel_init);
  if (v5)
  {
    v5->_index = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("tkey_index"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tkey_value"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tkey_epki"));
    v8 = objc_claimAutoreleasedReturnValue();
    key_epki = v5->_key_epki;
    v5->_key_epki = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tkey_retired_epki"));
    v10 = objc_claimAutoreleasedReturnValue();
    retiredKey_epki = v5->_retiredKey_epki;
    v5->_retiredKey_epki = (NSData *)v10;

    v5->_last_resort = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("last_resort"));
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

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)key_epki
{
  return self->_key_epki;
}

- (void)setKey_epki:(id)a3
{
  objc_storeStrong((id *)&self->_key_epki, a3);
}

- (NSData)retiredKey_epki
{
  return self->_retiredKey_epki;
}

- (void)setRetiredKey_epki:(id)a3
{
  objc_storeStrong((id *)&self->_retiredKey_epki, a3);
}

- (BOOL)last_resort
{
  return self->_last_resort;
}

- (void)setLast_resort:(BOOL)a3
{
  self->_last_resort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retiredKey_epki, 0);
  objc_storeStrong((id *)&self->_key_epki, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
