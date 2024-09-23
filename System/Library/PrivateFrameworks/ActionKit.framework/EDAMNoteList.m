@implementation EDAMNoteList

+ (id)structName
{
  return CFSTR("NoteList");
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
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_477;
  if (!structFields_structFields_477)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("startIndex"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 0, CFSTR("totalNotes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 3, 15, 0, CFSTR("notes"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("stoppedWords"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 5, 15, 1, CFSTR("searchedWords"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 8, 1, CFSTR("updateCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 6);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_477;
    structFields_structFields_477 = v12;

    v2 = (void *)structFields_structFields_477;
  }
  return v2;
}

- (NSNumber)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(id)a3
{
  objc_storeStrong((id *)&self->_startIndex, a3);
}

- (NSNumber)totalNotes
{
  return self->_totalNotes;
}

- (void)setTotalNotes:(id)a3
{
  objc_storeStrong((id *)&self->_totalNotes, a3);
}

- (NSArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSArray)stoppedWords
{
  return self->_stoppedWords;
}

- (void)setStoppedWords:(id)a3
{
  objc_storeStrong((id *)&self->_stoppedWords, a3);
}

- (NSArray)searchedWords
{
  return self->_searchedWords;
}

- (void)setSearchedWords:(id)a3
{
  objc_storeStrong((id *)&self->_searchedWords, a3);
}

- (NSNumber)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(id)a3
{
  objc_storeStrong((id *)&self->_updateCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCount, 0);
  objc_storeStrong((id *)&self->_searchedWords, 0);
  objc_storeStrong((id *)&self->_stoppedWords, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_totalNotes, 0);
  objc_storeStrong((id *)&self->_startIndex, 0);
}

@end
