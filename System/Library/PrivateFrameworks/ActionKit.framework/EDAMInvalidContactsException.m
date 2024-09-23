@implementation EDAMInvalidContactsException

+ (id)structName
{
  return CFSTR("EDAMInvalidContactsException");
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
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_62_31412;
  if (!structFields_structFields_62_31412)
  {
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 1, 15, 0, CFSTR("contacts"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("parameter"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 3, 15, 1, CFSTR("reasons"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_62_31412;
    structFields_structFields_62_31412 = v8;

    v2 = (void *)structFields_structFields_62_31412;
  }
  return v2;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSString)parameter
{
  return self->_parameter;
}

- (void)setParameter:(id)a3
{
  objc_storeStrong((id *)&self->_parameter, a3);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_storeStrong((id *)&self->_reasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
