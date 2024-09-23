@implementation EDAMLazyMap

+ (id)structName
{
  return CFSTR("LazyMap");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1112;
  if (!structFields_structFields_1112)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 1, 14, 1, CFSTR("keysOnly"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 2, 13, 1, CFSTR("fullMap"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_1112;
    structFields_structFields_1112 = v8;

    v2 = (void *)structFields_structFields_1112;
  }
  return v2;
}

- (NSSet)keysOnly
{
  return self->_keysOnly;
}

- (void)setKeysOnly:(id)a3
{
  objc_storeStrong((id *)&self->_keysOnly, a3);
}

- (NSDictionary)fullMap
{
  return self->_fullMap;
}

- (void)setFullMap:(id)a3
{
  objc_storeStrong((id *)&self->_fullMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullMap, 0);
  objc_storeStrong((id *)&self->_keysOnly, 0);
}

@end
