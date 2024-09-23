@implementation EDAMRelatedContent

+ (id)structName
{
  return CFSTR("RelatedContent");
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[18];

  v24[16] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_2191;
  if (!structFields_structFields_2191)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("contentId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("title"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("url"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("sourceId"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("sourceUrl"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("sourceFaviconUrl"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 11, 1, CFSTR("sourceName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[6] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 10, 1, CFSTR("date"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[7] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 11, 1, CFSTR("teaser"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v24[8] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 10, 15, 1, CFSTR("thumbnails"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[9] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 8, 1, CFSTR("contentType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[10] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 8, 1, CFSTR("accessType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[11] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 11, 1, CFSTR("visibleUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[12] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 11, 1, CFSTR("clipUrl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[13] = v9;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 15, 12, 1, CFSTR("contact"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[14] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:valueField:](FATField, "fieldWithIndex:type:optional:name:valueField:", 16, 15, 1, CFSTR("authors"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[15] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 16);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_2191;
    structFields_structFields_2191 = v13;

    v2 = (void *)structFields_structFields_2191;
  }
  return v2;
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (void)setSourceId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceId, a3);
}

- (NSString)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setSourceUrl:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUrl, a3);
}

- (NSString)sourceFaviconUrl
{
  return self->_sourceFaviconUrl;
}

- (void)setSourceFaviconUrl:(id)a3
{
  objc_storeStrong((id *)&self->_sourceFaviconUrl, a3);
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceName, a3);
}

- (NSNumber)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)teaser
{
  return self->_teaser;
}

- (void)setTeaser:(id)a3
{
  objc_storeStrong((id *)&self->_teaser, a3);
}

- (NSArray)thumbnails
{
  return self->_thumbnails;
}

- (void)setThumbnails:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnails, a3);
}

- (NSNumber)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSNumber)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(id)a3
{
  objc_storeStrong((id *)&self->_accessType, a3);
}

- (NSString)visibleUrl
{
  return self->_visibleUrl;
}

- (void)setVisibleUrl:(id)a3
{
  objc_storeStrong((id *)&self->_visibleUrl, a3);
}

- (NSString)clipUrl
{
  return self->_clipUrl;
}

- (void)setClipUrl:(id)a3
{
  objc_storeStrong((id *)&self->_clipUrl, a3);
}

- (EDAMContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSArray)authors
{
  return self->_authors;
}

- (void)setAuthors:(id)a3
{
  objc_storeStrong((id *)&self->_authors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_clipUrl, 0);
  objc_storeStrong((id *)&self->_visibleUrl, 0);
  objc_storeStrong((id *)&self->_accessType, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_thumbnails, 0);
  objc_storeStrong((id *)&self->_teaser, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceFaviconUrl, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
}

@end
