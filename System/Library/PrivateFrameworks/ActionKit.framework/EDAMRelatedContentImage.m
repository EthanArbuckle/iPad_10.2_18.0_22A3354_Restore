@implementation EDAMRelatedContentImage

+ (id)structName
{
  return CFSTR("RelatedContentImage");
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
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2165;
  if (!structFields_structFields_2165)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 1, CFSTR("width"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("height"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 4, 1, CFSTR("pixelRatio"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 8, 1, CFSTR("fileSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)structFields_structFields_2165;
    structFields_structFields_2165 = v8;

    v2 = (void *)structFields_structFields_2165;
  }
  return v2;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setWidth:(id)a3
{
  objc_storeStrong((id *)&self->_width, a3);
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  objc_storeStrong((id *)&self->_height, a3);
}

- (NSNumber)pixelRatio
{
  return self->_pixelRatio;
}

- (void)setPixelRatio:(id)a3
{
  objc_storeStrong((id *)&self->_pixelRatio, a3);
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_fileSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_pixelRatio, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
