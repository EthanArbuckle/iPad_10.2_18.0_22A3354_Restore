@implementation EDAMNoteMetadata

+ (id)structName
{
  return CFSTR("NoteMetadata");
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
  void *v17;
  void *v18;
  _QWORD v19[13];

  v19[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_510;
  if (!structFields_structFields_510)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("guid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("contentLength"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 10, 1, CFSTR("created"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("updated"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 10, 1, CFSTR("deleted"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[5] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 8, 1, CFSTR("updateSequenceNum"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[6] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 11, 1, CFSTR("notebookGuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[7] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 12, 15, 1, CFSTR("tagGuids"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[8] = v8;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 14, 12, 1, CFSTR("attributes"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[9] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 20, 11, 1, CFSTR("largestResourceMime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[10] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 21, 8, 1, CFSTR("largestResourceSize"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[11] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 12);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_510;
    structFields_structFields_510 = v12;

    v2 = (void *)structFields_structFields_510;
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

- (EDAMNoteAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSString)largestResourceMime
{
  return self->_largestResourceMime;
}

- (void)setLargestResourceMime:(id)a3
{
  objc_storeStrong((id *)&self->_largestResourceMime, a3);
}

- (NSNumber)largestResourceSize
{
  return self->_largestResourceSize;
}

- (void)setLargestResourceSize:(id)a3
{
  objc_storeStrong((id *)&self->_largestResourceSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largestResourceSize, 0);
  objc_storeStrong((id *)&self->_largestResourceMime, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_tagGuids, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_contentLength, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
