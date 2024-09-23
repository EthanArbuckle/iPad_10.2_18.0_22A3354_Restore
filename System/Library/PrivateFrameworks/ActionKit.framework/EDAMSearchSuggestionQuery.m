@implementation EDAMSearchSuggestionQuery

+ (id)structName
{
  return CFSTR("SearchSuggestionQuery");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1047;
  if (!structFields_structFields_1047)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("prefix"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 1, CFSTR("contextFilter"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)structFields_structFields_1047;
    structFields_structFields_1047 = v5;

    v2 = (void *)structFields_structFields_1047;
  }
  return v2;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (EDAMNoteFilter)contextFilter
{
  return self->_contextFilter;
}

- (void)setContextFilter:(id)a3
{
  objc_storeStrong((id *)&self->_contextFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextFilter, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end
