@implementation WFWordPressPostType

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFWordPressPostType;
  objc_msgSendSuper2(&v6, sel_allowedSecureCodingClassesByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("labels"));

  return v3;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("name");
  v3[1] = CFSTR("label");
  v4[0] = CFSTR("name");
  v4[1] = CFSTR("label");
  v3[2] = CFSTR("labels");
  v4[2] = CFSTR("labels");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->_name;
}

- (NSString)label
{
  return self->_label;
}

- (NSDictionary)labels
{
  return self->_labels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
