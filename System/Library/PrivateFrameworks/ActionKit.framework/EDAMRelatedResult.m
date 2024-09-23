@implementation EDAMRelatedResult

+ (id)structName
{
  return CFSTR("RelatedResult");
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
  _QWORD v21[10];

  v21[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_936;
  if (!structFields_structFields_936)
  {
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 1, 15, 1, CFSTR("notes"), v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v19;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 2, 15, 1, CFSTR("notebooks"), v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v17;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 3, 15, 1, CFSTR("tags"), v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("containingNotebooks"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("debugInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v6;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 6, 15, 1, CFSTR("experts"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 7, 15, 1, CFSTR("relatedContent"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[6] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 11, 1, CFSTR("cacheKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[7] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 8, 1, CFSTR("cacheExpires"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[8] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_936;
    structFields_structFields_936 = v13;

    v2 = (void *)structFields_structFields_936;
  }
  return v2;
}

- (NSArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSArray)notebooks
{
  return self->_notebooks;
}

- (void)setNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_notebooks, a3);
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (NSArray)containingNotebooks
{
  return self->_containingNotebooks;
}

- (void)setContainingNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_containingNotebooks, a3);
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfo, a3);
}

- (NSArray)experts
{
  return self->_experts;
}

- (void)setExperts:(id)a3
{
  objc_storeStrong((id *)&self->_experts, a3);
}

- (NSArray)relatedContent
{
  return self->_relatedContent;
}

- (void)setRelatedContent:(id)a3
{
  objc_storeStrong((id *)&self->_relatedContent, a3);
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (NSNumber)cacheExpires
{
  return self->_cacheExpires;
}

- (void)setCacheExpires:(id)a3
{
  objc_storeStrong((id *)&self->_cacheExpires, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheExpires, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_relatedContent, 0);
  objc_storeStrong((id *)&self->_experts, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_containingNotebooks, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_notebooks, 0);
  objc_storeStrong((id *)&self->_notes, 0);
}

@end
