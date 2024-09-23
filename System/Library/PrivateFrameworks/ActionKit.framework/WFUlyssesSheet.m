@implementation WFUlyssesSheet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFUlyssesSheet;
  objc_msgSendSuper2(&v7, sel_allowedSecureCodingClassesByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("notes"));

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("keywords"));

  return v3;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("identifier");
  v3[1] = CFSTR("title");
  v4[0] = CFSTR("identifier");
  v4[1] = CFSTR("title");
  v3[2] = CFSTR("text");
  v3[3] = CFSTR("keywords");
  v4[2] = CFSTR("text");
  v4[3] = CFSTR("keywords");
  v3[4] = CFSTR("notes");
  v4[4] = CFSTR("notes");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSArray)notes
{
  return self->_notes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
