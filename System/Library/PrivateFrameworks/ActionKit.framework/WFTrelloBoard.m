@implementation WFTrelloBoard

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
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFTrelloBoard;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("itemDescription");
  v7[1] = CFSTR("URL");
  v8[0] = CFSTR("desc");
  v8[1] = CFSTR("url");
  v7[2] = CFSTR("closed");
  v8[2] = CFSTR("closed");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

+ (id)closedJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BDD1970], "mtl_BOOLeanValueTransformer");
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)closed
{
  return self->_closed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
}

@end
