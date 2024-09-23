@implementation EDAMSearchSuggestion

+ (id)structName
{
  return CFSTR("SearchSuggestion");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1078;
  if (!structFields_structFields_1078)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("suggestionText"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)structFields_structFields_1078;
    structFields_structFields_1078 = v4;

    v2 = (void *)structFields_structFields_1078;
  }
  return v2;
}

- (NSString)suggestionText
{
  return self->_suggestionText;
}

- (void)setSuggestionText:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionText, 0);
}

@end
