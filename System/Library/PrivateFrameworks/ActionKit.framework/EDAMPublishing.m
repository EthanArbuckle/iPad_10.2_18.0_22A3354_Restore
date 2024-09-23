@implementation EDAMPublishing

+ (id)structName
{
  return CFSTR("Publishing");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1589;
  if (!structFields_structFields_1589)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("uri"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("order"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("ascending"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("publicDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)structFields_structFields_1589;
    structFields_structFields_1589 = v7;

    v2 = (void *)structFields_structFields_1589;
  }
  return v2;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (NSNumber)order
{
  return self->_order;
}

- (void)setOrder:(id)a3
{
  objc_storeStrong((id *)&self->_order, a3);
}

- (NSNumber)ascending
{
  return self->_ascending;
}

- (void)setAscending:(id)a3
{
  objc_storeStrong((id *)&self->_ascending, a3);
}

- (NSString)publicDescription
{
  return self->_publicDescription;
}

- (void)setPublicDescription:(id)a3
{
  objc_storeStrong((id *)&self->_publicDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicDescription, 0);
  objc_storeStrong((id *)&self->_ascending, 0);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
