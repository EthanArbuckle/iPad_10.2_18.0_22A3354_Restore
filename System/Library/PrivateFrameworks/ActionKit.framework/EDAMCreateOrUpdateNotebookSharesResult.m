@implementation EDAMCreateOrUpdateNotebookSharesResult

+ (id)structName
{
  return CFSTR("CreateOrUpdateNotebookSharesResult");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1489;
  if (!structFields_structFields_1489)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("updateSequenceNum"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 1, CFSTR("matchingShares"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_1489;
    structFields_structFields_1489 = v6;

    v2 = (void *)structFields_structFields_1489;
  }
  return v2;
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_updateSequenceNum, a3);
}

- (NSArray)matchingShares
{
  return self->_matchingShares;
}

- (void)setMatchingShares:(id)a3
{
  objc_storeStrong((id *)&self->_matchingShares, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingShares, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
}

@end
