@implementation EDAMNotebookDescriptor

+ (id)structName
{
  return CFSTR("NotebookDescriptor");
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
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2117;
  if (!structFields_structFields_2117)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("guid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("notebookDisplayName"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("contactName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("hasSharedNotebook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("joinedUserCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_2117;
    structFields_structFields_2117 = v8;

    v2 = (void *)structFields_structFields_2117;
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

- (NSString)notebookDisplayName
{
  return self->_notebookDisplayName;
}

- (void)setNotebookDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_notebookDisplayName, a3);
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setContactName:(id)a3
{
  objc_storeStrong((id *)&self->_contactName, a3);
}

- (NSNumber)hasSharedNotebook
{
  return self->_hasSharedNotebook;
}

- (void)setHasSharedNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_hasSharedNotebook, a3);
}

- (NSNumber)joinedUserCount
{
  return self->_joinedUserCount;
}

- (void)setJoinedUserCount:(id)a3
{
  objc_storeStrong((id *)&self->_joinedUserCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinedUserCount, 0);
  objc_storeStrong((id *)&self->_hasSharedNotebook, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_notebookDisplayName, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
