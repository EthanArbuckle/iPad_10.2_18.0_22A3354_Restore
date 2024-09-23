@implementation WFTrelloObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("name");
  v3[1] = CFSTR("identifier");
  v4[0] = CFSTR("name");
  v4[1] = CFSTR("id");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
