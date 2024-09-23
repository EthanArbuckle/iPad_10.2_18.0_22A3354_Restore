@implementation EDAMAd

+ (id)structName
{
  return CFSTR("Ad");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[14];

  v19[13] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1695;
  if (!structFields_structFields_1695)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("id"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 6, 1, CFSTR("width"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 6, 1, CFSTR("height"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("advertiserName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("imageUrl"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("destinationUrl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[5] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 6, 1, CFSTR("displaySeconds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[6] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 4, 1, CFSTR("score"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[7] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 16, 1, CFSTR("image"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[8] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 11, 1, CFSTR("imageMime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[9] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 11, 1, CFSTR("html"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[10] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 4, 1, CFSTR("displayFrequency"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[11] = v11;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 2, 1, CFSTR("openInTrunk"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[12] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 13);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_1695;
    structFields_structFields_1695 = v13;

    v2 = (void *)structFields_structFields_1695;
  }
  return v2;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
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

- (NSString)advertiserName
{
  return self->_advertiserName;
}

- (void)setAdvertiserName:(id)a3
{
  objc_storeStrong((id *)&self->_advertiserName, a3);
}

- (NSString)imageUrl
{
  return self->_imageUrl;
}

- (void)setImageUrl:(id)a3
{
  objc_storeStrong((id *)&self->_imageUrl, a3);
}

- (NSString)destinationUrl
{
  return self->_destinationUrl;
}

- (void)setDestinationUrl:(id)a3
{
  objc_storeStrong((id *)&self->_destinationUrl, a3);
}

- (NSNumber)displaySeconds
{
  return self->_displaySeconds;
}

- (void)setDisplaySeconds:(id)a3
{
  objc_storeStrong((id *)&self->_displaySeconds, a3);
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)imageMime
{
  return self->_imageMime;
}

- (void)setImageMime:(id)a3
{
  objc_storeStrong((id *)&self->_imageMime, a3);
}

- (NSString)html
{
  return self->_html;
}

- (void)setHtml:(id)a3
{
  objc_storeStrong((id *)&self->_html, a3);
}

- (NSNumber)displayFrequency
{
  return self->_displayFrequency;
}

- (void)setDisplayFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_displayFrequency, a3);
}

- (NSNumber)openInTrunk
{
  return self->_openInTrunk;
}

- (void)setOpenInTrunk:(id)a3
{
  objc_storeStrong((id *)&self->_openInTrunk, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openInTrunk, 0);
  objc_storeStrong((id *)&self->_displayFrequency, 0);
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_imageMime, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_displaySeconds, 0);
  objc_storeStrong((id *)&self->_destinationUrl, 0);
  objc_storeStrong((id *)&self->_imageUrl, 0);
  objc_storeStrong((id *)&self->_advertiserName, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
