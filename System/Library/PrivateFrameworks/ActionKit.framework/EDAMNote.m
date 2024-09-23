@implementation EDAMNote

+ (id)structName
{
  return CFSTR("Note");
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[20];

  v28[18] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1505;
  if (!structFields_structFields_1505)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("guid"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v27;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v26;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("content"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v25;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 16, 1, CFSTR("contentHash"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v24;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("contentLength"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 10, 1, CFSTR("created"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("updated"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[6] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 10, 1, CFSTR("deleted"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[7] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 2, 1, CFSTR("active"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[8] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 8, 1, CFSTR("updateSequenceNum"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[9] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 11, 1, CFSTR("notebookGuid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[10] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 12, 15, 1, CFSTR("tagGuids"), v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v28[11] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 13, 15, 1, CFSTR("resources"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[12] = v5;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 14, 12, 1, CFSTR("attributes"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[13] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 15, 15, 1, CFSTR("tagNames"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[14] = v8;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 16, 15, 1, CFSTR("sharedNotes"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[15] = v10;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 17, 12, 1, CFSTR("restrictions"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[16] = v11;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 18, 12, 1, CFSTR("limits"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[17] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 18);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_1505;
    structFields_structFields_1505 = v13;

    v2 = (void *)structFields_structFields_1505;
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

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (NSData)contentHash
{
  return self->_contentHash;
}

- (void)setContentHash:(id)a3
{
  objc_storeStrong((id *)&self->_contentHash, a3);
}

- (NSNumber)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(id)a3
{
  objc_storeStrong((id *)&self->_contentLength, a3);
}

- (NSNumber)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_storeStrong((id *)&self->_created, a3);
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_updated, a3);
}

- (NSNumber)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
  objc_storeStrong((id *)&self->_deleted, a3);
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setActive:(id)a3
{
  objc_storeStrong((id *)&self->_active, a3);
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_updateSequenceNum, a3);
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (void)setNotebookGuid:(id)a3
{
  objc_storeStrong((id *)&self->_notebookGuid, a3);
}

- (NSArray)tagGuids
{
  return self->_tagGuids;
}

- (void)setTagGuids:(id)a3
{
  objc_storeStrong((id *)&self->_tagGuids, a3);
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (EDAMNoteAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSArray)tagNames
{
  return self->_tagNames;
}

- (void)setTagNames:(id)a3
{
  objc_storeStrong((id *)&self->_tagNames, a3);
}

- (NSArray)sharedNotes
{
  return self->_sharedNotes;
}

- (void)setSharedNotes:(id)a3
{
  objc_storeStrong((id *)&self->_sharedNotes, a3);
}

- (EDAMNoteRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_restrictions, a3);
}

- (EDAMNoteLimits)limits
{
  return self->_limits;
}

- (void)setLimits:(id)a3
{
  objc_storeStrong((id *)&self->_limits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limits, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_sharedNotes, 0);
  objc_storeStrong((id *)&self->_tagNames, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_tagGuids, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_contentLength, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
