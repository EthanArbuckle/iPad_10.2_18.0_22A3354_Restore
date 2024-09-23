@implementation WFWordPressPost

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("postId");
  v3[1] = CFSTR("link");
  v4[0] = CFSTR("post_id");
  v4[1] = CFSTR("link");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)postIdJSONTransformer
{
  return +[WFWordPressBlog blogIdJSONTransformer](WFWordPressBlog, "blogIdJSONTransformer");
}

+ (id)linkJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BDD1970], "mtl_URLValueTransformer");
}

- (NSNumber)postId
{
  return self->_postId;
}

- (NSURL)link
{
  return self->_link;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_postId, 0);
}

@end
