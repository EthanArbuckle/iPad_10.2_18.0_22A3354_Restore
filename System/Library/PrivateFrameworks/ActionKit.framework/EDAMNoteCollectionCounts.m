@implementation EDAMNoteCollectionCounts

+ (id)structName
{
  return CFSTR("NoteCollectionCounts");
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
  uint64_t v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_668;
  if (!structFields_structFields_668)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 1, 13, 1, CFSTR("notebookCounts"), v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 2, 13, 1, CFSTR("tagCounts"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("trashCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)structFields_structFields_668;
    structFields_structFields_668 = v10;

    v2 = (void *)structFields_structFields_668;
  }
  return v2;
}

- (NSDictionary)notebookCounts
{
  return self->_notebookCounts;
}

- (void)setNotebookCounts:(id)a3
{
  objc_storeStrong((id *)&self->_notebookCounts, a3);
}

- (NSDictionary)tagCounts
{
  return self->_tagCounts;
}

- (void)setTagCounts:(id)a3
{
  objc_storeStrong((id *)&self->_tagCounts, a3);
}

- (NSNumber)trashCount
{
  return self->_trashCount;
}

- (void)setTrashCount:(id)a3
{
  objc_storeStrong((id *)&self->_trashCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashCount, 0);
  objc_storeStrong((id *)&self->_tagCounts, 0);
  objc_storeStrong((id *)&self->_notebookCounts, 0);
}

@end
