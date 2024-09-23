@implementation EDAMNotFoundException

+ (id)structName
{
  return CFSTR("EDAMNotFoundException");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_43_31391;
  if (!structFields_structFields_43_31391)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("identifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)structFields_structFields_43_31391;
    structFields_structFields_43_31391 = v5;

    v2 = (void *)structFields_structFields_43_31391;
  }
  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
