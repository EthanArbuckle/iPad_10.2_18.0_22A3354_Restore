@implementation EDAMLinkedNotebook

+ (id)structName
{
  return CFSTR("LinkedNotebook");
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
  void *v15;
  void *v16;
  _QWORD v17[12];

  v17[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2084;
  if (!structFields_structFields_2084)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("shareName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("username"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("shardId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("sharedNotebookGlobalId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("uri"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 11, 1, CFSTR("guid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 8, 1, CFSTR("updateSequenceNum"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 11, 1, CFSTR("noteStoreUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 11, 1, CFSTR("webApiUrlPrefix"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 11, 1, CFSTR("stack"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 8, 1, CFSTR("businessId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[10] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_2084;
    structFields_structFields_2084 = v12;

    v2 = (void *)structFields_structFields_2084;
  }
  return v2;
}

- (NSString)shareName
{
  return self->_shareName;
}

- (void)setShareName:(id)a3
{
  objc_storeStrong((id *)&self->_shareName, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setShardId:(id)a3
{
  objc_storeStrong((id *)&self->_shardId, a3);
}

- (NSString)sharedNotebookGlobalId
{
  return self->_sharedNotebookGlobalId;
}

- (void)setSharedNotebookGlobalId:(id)a3
{
  objc_storeStrong((id *)&self->_sharedNotebookGlobalId, a3);
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_updateSequenceNum, a3);
}

- (NSString)noteStoreUrl
{
  return self->_noteStoreUrl;
}

- (void)setNoteStoreUrl:(id)a3
{
  objc_storeStrong((id *)&self->_noteStoreUrl, a3);
}

- (NSString)webApiUrlPrefix
{
  return self->_webApiUrlPrefix;
}

- (void)setWebApiUrlPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_webApiUrlPrefix, a3);
}

- (NSString)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (NSNumber)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
  objc_storeStrong((id *)&self->_businessId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessId, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_sharedNotebookGlobalId, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_shareName, 0);
}

@end
