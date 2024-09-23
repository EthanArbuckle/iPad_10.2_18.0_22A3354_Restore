@implementation WFWordPressFile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("fileId");
  v3[1] = CFSTR("filename");
  v4[0] = CFSTR("id");
  v4[1] = CFSTR("file");
  v3[2] = CFSTR("url");
  v3[3] = CFSTR("type");
  v4[2] = CFSTR("url");
  v4[3] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fileIdJSONTransformer
{
  return +[WFWordPressBlog blogIdJSONTransformer](WFWordPressBlog, "blogIdJSONTransformer");
}

- (NSNumber)fileId
{
  return self->_fileId;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileId, 0);
}

@end
