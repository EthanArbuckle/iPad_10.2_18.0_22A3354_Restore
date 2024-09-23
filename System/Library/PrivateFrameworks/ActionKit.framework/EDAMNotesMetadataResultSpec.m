@implementation EDAMNotesMetadataResultSpec

+ (id)structName
{
  return CFSTR("NotesMetadataResultSpec");
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
  v2 = (void *)structFields_structFields_586;
  if (!structFields_structFields_586)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("includeTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("includeContentLength"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("includeCreated"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 1, CFSTR("includeUpdated"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("includeDeleted"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 2, 1, CFSTR("includeUpdateSequenceNum"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 2, 1, CFSTR("includeNotebookGuid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 2, 1, CFSTR("includeTagGuids"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 2, 1, CFSTR("includeAttributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 20, 2, 1, CFSTR("includeLargestResourceMime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 21, 2, 1, CFSTR("includeLargestResourceSize"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[10] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_586;
    structFields_structFields_586 = v12;

    v2 = (void *)structFields_structFields_586;
  }
  return v2;
}

- (NSNumber)includeTitle
{
  return self->_includeTitle;
}

- (void)setIncludeTitle:(id)a3
{
  objc_storeStrong((id *)&self->_includeTitle, a3);
}

- (NSNumber)includeContentLength
{
  return self->_includeContentLength;
}

- (void)setIncludeContentLength:(id)a3
{
  objc_storeStrong((id *)&self->_includeContentLength, a3);
}

- (NSNumber)includeCreated
{
  return self->_includeCreated;
}

- (void)setIncludeCreated:(id)a3
{
  objc_storeStrong((id *)&self->_includeCreated, a3);
}

- (NSNumber)includeUpdated
{
  return self->_includeUpdated;
}

- (void)setIncludeUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_includeUpdated, a3);
}

- (NSNumber)includeDeleted
{
  return self->_includeDeleted;
}

- (void)setIncludeDeleted:(id)a3
{
  objc_storeStrong((id *)&self->_includeDeleted, a3);
}

- (NSNumber)includeUpdateSequenceNum
{
  return self->_includeUpdateSequenceNum;
}

- (void)setIncludeUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_includeUpdateSequenceNum, a3);
}

- (NSNumber)includeNotebookGuid
{
  return self->_includeNotebookGuid;
}

- (void)setIncludeNotebookGuid:(id)a3
{
  objc_storeStrong((id *)&self->_includeNotebookGuid, a3);
}

- (NSNumber)includeTagGuids
{
  return self->_includeTagGuids;
}

- (void)setIncludeTagGuids:(id)a3
{
  objc_storeStrong((id *)&self->_includeTagGuids, a3);
}

- (NSNumber)includeAttributes
{
  return self->_includeAttributes;
}

- (void)setIncludeAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_includeAttributes, a3);
}

- (NSNumber)includeLargestResourceMime
{
  return self->_includeLargestResourceMime;
}

- (void)setIncludeLargestResourceMime:(id)a3
{
  objc_storeStrong((id *)&self->_includeLargestResourceMime, a3);
}

- (NSNumber)includeLargestResourceSize
{
  return self->_includeLargestResourceSize;
}

- (void)setIncludeLargestResourceSize:(id)a3
{
  objc_storeStrong((id *)&self->_includeLargestResourceSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeLargestResourceSize, 0);
  objc_storeStrong((id *)&self->_includeLargestResourceMime, 0);
  objc_storeStrong((id *)&self->_includeAttributes, 0);
  objc_storeStrong((id *)&self->_includeTagGuids, 0);
  objc_storeStrong((id *)&self->_includeNotebookGuid, 0);
  objc_storeStrong((id *)&self->_includeUpdateSequenceNum, 0);
  objc_storeStrong((id *)&self->_includeDeleted, 0);
  objc_storeStrong((id *)&self->_includeUpdated, 0);
  objc_storeStrong((id *)&self->_includeCreated, 0);
  objc_storeStrong((id *)&self->_includeContentLength, 0);
  objc_storeStrong((id *)&self->_includeTitle, 0);
}

@end
