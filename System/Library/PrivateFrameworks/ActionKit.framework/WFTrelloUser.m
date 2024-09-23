@implementation WFTrelloUser

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFTrelloUser;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("name");
  v7[1] = CFSTR("email");
  v8[0] = CFSTR("fullName");
  v8[1] = CFSTR("email");
  v7[2] = CFSTR("username");
  v7[3] = CFSTR("URL");
  v8[2] = CFSTR("username");
  v8[3] = CFSTR("url");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)username
{
  return self->_username;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end
