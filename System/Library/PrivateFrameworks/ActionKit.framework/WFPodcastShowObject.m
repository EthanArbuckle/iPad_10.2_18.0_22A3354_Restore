@implementation WFPodcastShowObject

- (NSString)title
{
  return self->_title;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (NSURL)feedURL
{
  return self->_feedURL;
}

- (NSArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("title");
  v3[1] = CFSTR("uuid");
  v4[0] = CFSTR("title");
  v4[1] = CFSTR("uuid");
  v3[2] = CFSTR("storeId");
  v3[3] = CFSTR("feedURL");
  v4[2] = CFSTR("storeId");
  v4[3] = CFSTR("feedUrl");
  v3[4] = CFSTR("children");
  v4[4] = CFSTR("children");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)childrenJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BEC3A08], "arrayTransformerWithModelClass:", objc_opt_class());
}

@end
