@implementation EDAMRelatedQuery

+ (id)structName
{
  return CFSTR("RelatedQuery");
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
  uint64_t v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_894;
  if (!structFields_structFields_894)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("noteGuid"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("plainText"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 3, 12, 1, CFSTR("filter"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("referenceUri"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("cacheKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)structFields_structFields_894;
    structFields_structFields_894 = v9;

    v2 = (void *)structFields_structFields_894;
  }
  return v2;
}

- (NSString)noteGuid
{
  return self->_noteGuid;
}

- (void)setNoteGuid:(id)a3
{
  objc_storeStrong((id *)&self->_noteGuid, a3);
}

- (NSString)plainText
{
  return self->_plainText;
}

- (void)setPlainText:(id)a3
{
  objc_storeStrong((id *)&self->_plainText, a3);
}

- (EDAMNoteFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (NSString)referenceUri
{
  return self->_referenceUri;
}

- (void)setReferenceUri:(id)a3
{
  objc_storeStrong((id *)&self->_referenceUri, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_referenceUri, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_plainText, 0);
  objc_storeStrong((id *)&self->_noteGuid, 0);
}

@end
