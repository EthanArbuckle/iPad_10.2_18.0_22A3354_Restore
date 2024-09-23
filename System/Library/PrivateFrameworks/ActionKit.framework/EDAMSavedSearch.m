@implementation EDAMSavedSearch

+ (id)structName
{
  return CFSTR("SavedSearch");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1667;
  if (!structFields_structFields_1667)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("guid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("query"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 1, CFSTR("format"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("updateSequenceNum"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 6, 12, 1, CFSTR("scope"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)structFields_structFields_1667;
    structFields_structFields_1667 = v9;

    v2 = (void *)structFields_structFields_1667;
  }
  return v2;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSNumber)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_updateSequenceNum, a3);
}

- (EDAMSavedSearchScope)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
  objc_storeStrong((id *)&self->_scope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
