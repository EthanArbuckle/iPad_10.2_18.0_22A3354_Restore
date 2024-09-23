@implementation EDAMLogRequest

+ (id)structName
{
  return CFSTR("LogRequest");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1661;
  if (!structFields_structFields_1661)
  {
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 1, CFSTR("searchRecord"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)structFields_structFields_1661;
    structFields_structFields_1661 = v4;

    v2 = (void *)structFields_structFields_1661;
  }
  return v2;
}

- (EDAMSearchRecord)searchRecord
{
  return self->_searchRecord;
}

- (void)setSearchRecord:(id)a3
{
  objc_storeStrong((id *)&self->_searchRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchRecord, 0);
}

@end
