@implementation WFWordPressTerm

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("termId");
  v3[1] = CFSTR("name");
  v4[0] = CFSTR("term_id");
  v4[1] = CFSTR("name");
  v3[2] = CFSTR("taxonomy");
  v4[2] = CFSTR("taxonomy");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)termIdJSONTransformer
{
  return +[WFWordPressBlog blogIdJSONTransformer](WFWordPressBlog, "blogIdJSONTransformer");
}

- (NSNumber)termId
{
  return self->_termId;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)taxonomy
{
  return self->_taxonomy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taxonomy, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_termId, 0);
}

@end
