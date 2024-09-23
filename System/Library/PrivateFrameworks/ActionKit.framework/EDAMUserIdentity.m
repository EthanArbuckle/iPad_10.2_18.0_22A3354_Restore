@implementation EDAMUserIdentity

+ (id)structName
{
  return CFSTR("UserIdentity");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2314;
  if (!structFields_structFields_2314)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("type"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("stringIdentifier"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 1, CFSTR("longIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_2314;
    structFields_structFields_2314 = v6;

    v2 = (void *)structFields_structFields_2314;
  }
  return v2;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)stringIdentifier
{
  return self->_stringIdentifier;
}

- (void)setStringIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stringIdentifier, a3);
}

- (NSNumber)longIdentifier
{
  return self->_longIdentifier;
}

- (void)setLongIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_longIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longIdentifier, 0);
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
