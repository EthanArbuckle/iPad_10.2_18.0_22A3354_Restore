@implementation EDAMSearchRecord

+ (id)structName
{
  return CFSTR("SearchRecord");
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
  _QWORD v14[9];

  v14[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1600;
  if (!structFields_structFields_1600)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("userQuery"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 1, CFSTR("noteFilter"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("searchScope"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 10, 1, CFSTR("searchTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("selectedNoteGUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 10, 1, CFSTR("selectTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 8, 1, CFSTR("noteRank"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[6] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 8, 1, CFSTR("noteCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[7] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)structFields_structFields_1600;
    structFields_structFields_1600 = v11;

    v2 = (void *)structFields_structFields_1600;
  }
  return v2;
}

- (NSString)userQuery
{
  return self->_userQuery;
}

- (void)setUserQuery:(id)a3
{
  objc_storeStrong((id *)&self->_userQuery, a3);
}

- (EDAMNoteFilter)noteFilter
{
  return self->_noteFilter;
}

- (void)setNoteFilter:(id)a3
{
  objc_storeStrong((id *)&self->_noteFilter, a3);
}

- (NSNumber)searchScope
{
  return self->_searchScope;
}

- (void)setSearchScope:(id)a3
{
  objc_storeStrong((id *)&self->_searchScope, a3);
}

- (NSNumber)searchTime
{
  return self->_searchTime;
}

- (void)setSearchTime:(id)a3
{
  objc_storeStrong((id *)&self->_searchTime, a3);
}

- (NSString)selectedNoteGUID
{
  return self->_selectedNoteGUID;
}

- (void)setSelectedNoteGUID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedNoteGUID, a3);
}

- (NSNumber)selectTime
{
  return self->_selectTime;
}

- (void)setSelectTime:(id)a3
{
  objc_storeStrong((id *)&self->_selectTime, a3);
}

- (NSNumber)noteRank
{
  return self->_noteRank;
}

- (void)setNoteRank:(id)a3
{
  objc_storeStrong((id *)&self->_noteRank, a3);
}

- (NSNumber)noteCount
{
  return self->_noteCount;
}

- (void)setNoteCount:(id)a3
{
  objc_storeStrong((id *)&self->_noteCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteCount, 0);
  objc_storeStrong((id *)&self->_noteRank, 0);
  objc_storeStrong((id *)&self->_selectTime, 0);
  objc_storeStrong((id *)&self->_selectedNoteGUID, 0);
  objc_storeStrong((id *)&self->_searchTime, 0);
  objc_storeStrong((id *)&self->_searchScope, 0);
  objc_storeStrong((id *)&self->_noteFilter, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
}

@end
