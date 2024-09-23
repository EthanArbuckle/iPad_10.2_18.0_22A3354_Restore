@implementation EDAMBusinessQueryResult

+ (id)structName
{
  return CFSTR("BusinessQueryResult");
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
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1186;
  if (!structFields_structFields_1186)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("totalNotebooks"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 2, 13, 1, CFSTR("totalNotesByNotebook"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 3, 15, 1, CFSTR("experts"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v8;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("matchingNotebooks"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)structFields_structFields_1186;
    structFields_structFields_1186 = v11;

    v2 = (void *)structFields_structFields_1186;
  }
  return v2;
}

- (NSNumber)totalNotebooks
{
  return self->_totalNotebooks;
}

- (void)setTotalNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_totalNotebooks, a3);
}

- (NSDictionary)totalNotesByNotebook
{
  return self->_totalNotesByNotebook;
}

- (void)setTotalNotesByNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_totalNotesByNotebook, a3);
}

- (NSArray)experts
{
  return self->_experts;
}

- (void)setExperts:(id)a3
{
  objc_storeStrong((id *)&self->_experts, a3);
}

- (NSArray)matchingNotebooks
{
  return self->_matchingNotebooks;
}

- (void)setMatchingNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_matchingNotebooks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingNotebooks, 0);
  objc_storeStrong((id *)&self->_experts, 0);
  objc_storeStrong((id *)&self->_totalNotesByNotebook, 0);
  objc_storeStrong((id *)&self->_totalNotebooks, 0);
}

@end
