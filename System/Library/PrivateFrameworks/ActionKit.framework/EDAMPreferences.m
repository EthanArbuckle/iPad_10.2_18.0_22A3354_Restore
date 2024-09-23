@implementation EDAMPreferences

+ (id)structName
{
  return CFSTR("Preferences");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_114;
  if (!structFields_structFields_114)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("updateSequenceNum"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 0, 15, 1, 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:keyField:valueField:](FATField, "fieldWithIndex:type:optional:name:keyField:valueField:", 2, 13, 1, CFSTR("preferences"), v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_114;
    structFields_structFields_114 = v8;

    v2 = (void *)structFields_structFields_114;
  }
  return v2;
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setUpdateSequenceNum:(id)a3
{
  objc_storeStrong((id *)&self->_updateSequenceNum, a3);
}

- (NSDictionary)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
}

@end
