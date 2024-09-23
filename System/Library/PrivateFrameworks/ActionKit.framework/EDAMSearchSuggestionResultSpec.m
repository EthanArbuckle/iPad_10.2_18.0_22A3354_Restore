@implementation EDAMSearchSuggestionResultSpec

+ (id)structName
{
  return CFSTR("SearchSuggestionResultSpec");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1066;
  if (!structFields_structFields_1066)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("maxTypeAheadSuggestions"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)structFields_structFields_1066;
    structFields_structFields_1066 = v4;

    v2 = (void *)structFields_structFields_1066;
  }
  return v2;
}

- (NSNumber)maxTypeAheadSuggestions
{
  return self->_maxTypeAheadSuggestions;
}

- (void)setMaxTypeAheadSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_maxTypeAheadSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTypeAheadSuggestions, 0);
}

@end
