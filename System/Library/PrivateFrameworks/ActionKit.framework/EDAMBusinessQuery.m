@implementation EDAMBusinessQuery

+ (id)structName
{
  return CFSTR("BusinessQuery");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1167;
  if (!structFields_structFields_1167)
  {
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 1, 12, 1, CFSTR("filter"), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("numExperts"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("includeNotebooks"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("includeNotesCounts"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)structFields_structFields_1167;
    structFields_structFields_1167 = v7;

    v2 = (void *)structFields_structFields_1167;
  }
  return v2;
}

- (EDAMNoteFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (NSNumber)numExperts
{
  return self->_numExperts;
}

- (void)setNumExperts:(id)a3
{
  objc_storeStrong((id *)&self->_numExperts, a3);
}

- (NSNumber)includeNotebooks
{
  return self->_includeNotebooks;
}

- (void)setIncludeNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_includeNotebooks, a3);
}

- (NSNumber)includeNotesCounts
{
  return self->_includeNotesCounts;
}

- (void)setIncludeNotesCounts:(id)a3
{
  objc_storeStrong((id *)&self->_includeNotesCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeNotesCounts, 0);
  objc_storeStrong((id *)&self->_includeNotebooks, 0);
  objc_storeStrong((id *)&self->_numExperts, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
