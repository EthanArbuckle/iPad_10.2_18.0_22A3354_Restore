@implementation EDAMRelatedResultSpec

+ (id)structName
{
  return CFSTR("RelatedResultSpec");
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
  _QWORD v16[10];

  v16[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_979;
  if (!structFields_structFields_979)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("maxNotes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("maxNotebooks"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("maxTags"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("writableNotebooksOnly"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("includeContainingNotebooks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("includeDebugInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[5] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 8, 1, CFSTR("maxExperts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[6] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 8, 1, CFSTR("maxRelatedContent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[7] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 8, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 9, 14, 1, CFSTR("relatedContentTypes"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[8] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_979;
    structFields_structFields_979 = v12;

    v2 = (void *)structFields_structFields_979;
  }
  return v2;
}

- (NSNumber)maxNotes
{
  return self->_maxNotes;
}

- (void)setMaxNotes:(id)a3
{
  objc_storeStrong((id *)&self->_maxNotes, a3);
}

- (NSNumber)maxNotebooks
{
  return self->_maxNotebooks;
}

- (void)setMaxNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_maxNotebooks, a3);
}

- (NSNumber)maxTags
{
  return self->_maxTags;
}

- (void)setMaxTags:(id)a3
{
  objc_storeStrong((id *)&self->_maxTags, a3);
}

- (NSNumber)writableNotebooksOnly
{
  return self->_writableNotebooksOnly;
}

- (void)setWritableNotebooksOnly:(id)a3
{
  objc_storeStrong((id *)&self->_writableNotebooksOnly, a3);
}

- (NSNumber)includeContainingNotebooks
{
  return self->_includeContainingNotebooks;
}

- (void)setIncludeContainingNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_includeContainingNotebooks, a3);
}

- (NSNumber)includeDebugInfo
{
  return self->_includeDebugInfo;
}

- (void)setIncludeDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_includeDebugInfo, a3);
}

- (NSNumber)maxExperts
{
  return self->_maxExperts;
}

- (void)setMaxExperts:(id)a3
{
  objc_storeStrong((id *)&self->_maxExperts, a3);
}

- (NSNumber)maxRelatedContent
{
  return self->_maxRelatedContent;
}

- (void)setMaxRelatedContent:(id)a3
{
  objc_storeStrong((id *)&self->_maxRelatedContent, a3);
}

- (NSSet)relatedContentTypes
{
  return self->_relatedContentTypes;
}

- (void)setRelatedContentTypes:(id)a3
{
  objc_storeStrong((id *)&self->_relatedContentTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedContentTypes, 0);
  objc_storeStrong((id *)&self->_maxRelatedContent, 0);
  objc_storeStrong((id *)&self->_maxExperts, 0);
  objc_storeStrong((id *)&self->_includeDebugInfo, 0);
  objc_storeStrong((id *)&self->_includeContainingNotebooks, 0);
  objc_storeStrong((id *)&self->_writableNotebooksOnly, 0);
  objc_storeStrong((id *)&self->_maxTags, 0);
  objc_storeStrong((id *)&self->_maxNotebooks, 0);
  objc_storeStrong((id *)&self->_maxNotes, 0);
}

@end
