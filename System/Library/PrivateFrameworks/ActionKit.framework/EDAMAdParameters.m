@implementation EDAMAdParameters

+ (id)structName
{
  return CFSTR("AdParameters");
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
  uint64_t v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_774;
  if (!structFields_structFields_774)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("clientLanguage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 4, 15, 1, CFSTR("impressions"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("supportHtml"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 6, 13, 1, CFSTR("clientProperties"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)structFields_structFields_774;
    structFields_structFields_774 = v10;

    v2 = (void *)structFields_structFields_774;
  }
  return v2;
}

- (NSString)clientLanguage
{
  return self->_clientLanguage;
}

- (void)setClientLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_clientLanguage, a3);
}

- (NSArray)impressions
{
  return self->_impressions;
}

- (void)setImpressions:(id)a3
{
  objc_storeStrong((id *)&self->_impressions, a3);
}

- (NSNumber)supportHtml
{
  return self->_supportHtml;
}

- (void)setSupportHtml:(id)a3
{
  objc_storeStrong((id *)&self->_supportHtml, a3);
}

- (NSDictionary)clientProperties
{
  return self->_clientProperties;
}

- (void)setClientProperties:(id)a3
{
  objc_storeStrong((id *)&self->_clientProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProperties, 0);
  objc_storeStrong((id *)&self->_supportHtml, 0);
  objc_storeStrong((id *)&self->_impressions, 0);
  objc_storeStrong((id *)&self->_clientLanguage, 0);
}

@end
