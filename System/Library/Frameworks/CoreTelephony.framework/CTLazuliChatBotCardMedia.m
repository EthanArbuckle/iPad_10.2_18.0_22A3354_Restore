@implementation CTLazuliChatBotCardMedia

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotCardMedia mediaUrl](self, "mediaUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mediaUrl = %@"), v4);

  -[CTLazuliChatBotCardMedia mediaContentType](self, "mediaContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mediaContentType = %@"), v5);

  -[CTLazuliChatBotCardMedia mediaFileSize](self, "mediaFileSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mediaFileSize = %@"), v6);

  -[CTLazuliChatBotCardMedia thumbnailUrl](self, "thumbnailUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", thumbnailUrl = %@"), v7);

  -[CTLazuliChatBotCardMedia thumbnailContentType](self, "thumbnailContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", thumbnailContentType = %@"), v8);

  -[CTLazuliChatBotCardMedia thumbnailFileSize](self, "thumbnailFileSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", thumbnailFileSize = %@"), v9);

  v10 = -[CTLazuliChatBotCardMedia height](self, "height");
  v13 = -[CTLazuliChatBotCardMedia height](self, "height");
  objc_msgSend(v3, "appendFormat:", CFSTR(", height = [%ld - %s]"), v10, print_CTLazuliChatBotCardMediaHeightType(&v13));
  -[CTLazuliChatBotCardMedia contentDescription](self, "contentDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", contentDescription = %@"), v11);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCardMedia:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  -[CTLazuliChatBotCardMedia mediaUrl](self, "mediaUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[CTLazuliChatBotCardMedia mediaContentType](self, "mediaContentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaContentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToString:", v8))
    {
      v12 = 0;
LABEL_47:

      goto LABEL_48;
    }
    -[CTLazuliChatBotCardMedia mediaFileSize](self, "mediaFileSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "longValue");
    objc_msgSend(v4, "mediaFileSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != objc_msgSend(v11, "longValue"))
    {
      v12 = 0;
LABEL_46:

      goto LABEL_47;
    }
    -[CTLazuliChatBotCardMedia thumbnailUrl](self, "thumbnailUrl");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 || (objc_msgSend(v4, "thumbnailUrl"), (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotCardMedia thumbnailUrl](self, "thumbnailUrl");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "thumbnailUrl");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v37, "isEqual:"))
      {
        v12 = 0;
LABEL_42:

LABEL_43:
        if (!v36)

        goto LABEL_46;
      }
      v32 = 1;
    }
    else
    {
      v30 = 0;
      v32 = 0;
    }
    -[CTLazuliChatBotCardMedia thumbnailContentType](self, "thumbnailContentType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 || (objc_msgSend(v4, "thumbnailContentType"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotCardMedia thumbnailContentType](self, "thumbnailContentType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "thumbnailContentType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v34, "isEqualToString:"))
      {
        v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v28 = 1;
    }
    else
    {
      v25 = 0;
      v28 = 0;
    }
    -[CTLazuliChatBotCardMedia thumbnailFileSize](self, "thumbnailFileSize");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 || (objc_msgSend(v4, "thumbnailFileSize"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotCardMedia thumbnailFileSize](self, "thumbnailFileSize");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v27, "longValue");
      objc_msgSend(v4, "thumbnailFileSize");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != objc_msgSend(v26, "longValue"))
      {

        v14 = v29;
        if (!v29)
          v14 = v23;

        v12 = 0;
        if ((v28 & 1) != 0)
          goto LABEL_38;
        goto LABEL_39;
      }
      v24 = 1;
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }
    v15 = -[CTLazuliChatBotCardMedia height](self, "height");
    if (v15 == objc_msgSend(v4, "height"))
    {
      -[CTLazuliChatBotCardMedia contentDescription](self, "contentDescription");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22 || (objc_msgSend(v4, "contentDescription"), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[CTLazuliChatBotCardMedia contentDescription](self, "contentDescription", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contentDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v21, "isEqualToString:", v16);

        v17 = (void *)v22;
        if (!v22)
          v17 = v20;
      }
      else
      {
        v17 = 0;
        v12 = 1;
      }

      if ((v24 & 1) == 0)
      {
LABEL_35:
        if (!v29)

        if (v28)
          goto LABEL_38;
LABEL_39:
        if (!v33)

        if (!v32)
          goto LABEL_43;
        goto LABEL_42;
      }
    }
    else
    {
      v12 = 0;
      if (!v24)
        goto LABEL_35;
    }

    goto LABEL_35;
  }
  v12 = 0;
LABEL_48:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotCardMedia *v4;
  CTLazuliChatBotCardMedia *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotCardMedia *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotCardMedia isEqualToCTLazuliChatBotCardMedia:](self, "isEqualToCTLazuliChatBotCardMedia:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotCardMedia *v4;

  v4 = +[CTLazuliChatBotCardMedia allocWithZone:](CTLazuliChatBotCardMedia, "allocWithZone:", a3);
  -[CTLazuliChatBotCardMedia setMediaUrl:](v4, "setMediaUrl:", self->_mediaUrl);
  -[CTLazuliChatBotCardMedia setMediaContentType:](v4, "setMediaContentType:", self->_mediaContentType);
  -[CTLazuliChatBotCardMedia setMediaFileSize:](v4, "setMediaFileSize:", self->_mediaFileSize);
  -[CTLazuliChatBotCardMedia setThumbnailUrl:](v4, "setThumbnailUrl:", self->_thumbnailUrl);
  -[CTLazuliChatBotCardMedia setThumbnailContentType:](v4, "setThumbnailContentType:", self->_thumbnailContentType);
  -[CTLazuliChatBotCardMedia setThumbnailFileSize:](v4, "setThumbnailFileSize:", self->_thumbnailFileSize);
  -[CTLazuliChatBotCardMedia setHeight:](v4, "setHeight:", self->_height);
  -[CTLazuliChatBotCardMedia setContentDescription:](v4, "setContentDescription:", self->_contentDescription);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaUrl, CFSTR("kMediaUrlKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaContentType, CFSTR("kMediaContentTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaFileSize, CFSTR("kMediaFileSizeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbnailUrl, CFSTR("kThumbnailUrlKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbnailContentType, CFSTR("kThumbnailContentTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbnailFileSize, CFSTR("kThumbnailFileSizeKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kHeightKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_contentDescription, CFSTR("kContentDescriptionKey"));
}

- (CTLazuliChatBotCardMedia)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotCardMedia *v5;
  uint64_t v6;
  NSURL *mediaUrl;
  uint64_t v8;
  NSString *mediaContentType;
  uint64_t v10;
  NSNumber *mediaFileSize;
  uint64_t v12;
  NSURL *thumbnailUrl;
  uint64_t v14;
  NSString *thumbnailContentType;
  uint64_t v16;
  NSNumber *thumbnailFileSize;
  void *v18;
  uint64_t v19;
  NSString *contentDescription;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CTLazuliChatBotCardMedia;
  v5 = -[CTLazuliChatBotCardMedia init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaUrlKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaUrl = v5->_mediaUrl;
    v5->_mediaUrl = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaContentTypeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    mediaContentType = v5->_mediaContentType;
    v5->_mediaContentType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaFileSizeKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    mediaFileSize = v5->_mediaFileSize;
    v5->_mediaFileSize = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kThumbnailUrlKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    thumbnailUrl = v5->_thumbnailUrl;
    v5->_thumbnailUrl = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kThumbnailContentTypeKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    thumbnailContentType = v5->_thumbnailContentType;
    v5->_thumbnailContentType = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kThumbnailFileSizeKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    thumbnailFileSize = v5->_thumbnailFileSize;
    v5->_thumbnailFileSize = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHeightKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_height = objc_msgSend(v18, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContentDescriptionKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    contentDescription = v5->_contentDescription;
    v5->_contentDescription = (NSString *)v19;

  }
  return v5;
}

- (CTLazuliChatBotCardMedia)initWithReflection:(const void *)a3
{
  CTLazuliChatBotCardMedia *v4;
  void *v5;
  void *v6;
  int v7;
  const void *v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  NSURL *mediaUrl;
  char *v14;
  uint64_t v15;
  NSString *mediaContentType;
  uint64_t v17;
  NSNumber *mediaFileSize;
  char *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  char *v24;
  void *v25;
  uint64_t v26;
  NSURL *thumbnailUrl;
  char *v28;
  uint64_t v29;
  NSString *thumbnailContentType;
  uint64_t v31;
  NSNumber *thumbnailFileSize;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  NSString *contentDescription;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CTLazuliChatBotCardMedia;
  v4 = -[CTLazuliChatBotCardMedia init](&v40, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *((char *)a3 + 23);
    v8 = *(const void **)a3;
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v7 >= 0)
      v10 = a3;
    else
      v10 = v8;
    objc_msgSend(v6, "stringWithCString:encoding:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    mediaUrl = v4->_mediaUrl;
    v4->_mediaUrl = (NSURL *)v12;

    if (*((char *)a3 + 47) >= 0)
      v14 = (char *)a3 + 24;
    else
      v14 = (char *)*((_QWORD *)a3 + 3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    mediaContentType = v4->_mediaContentType;
    v4->_mediaContentType = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 6));
    v17 = objc_claimAutoreleasedReturnValue();
    mediaFileSize = v4->_mediaFileSize;
    v4->_mediaFileSize = (NSNumber *)v17;

    if (*((_BYTE *)a3 + 80))
    {
      v19 = (char *)*((_QWORD *)a3 + 7);
      v20 = (void *)MEMORY[0x1E0C99E98];
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = *((char *)a3 + 79);
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
      if (v22 >= 0)
        v24 = (char *)a3 + 56;
      else
        v24 = v19;
      objc_msgSend(v21, "stringWithCString:encoding:", v24, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLWithString:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      thumbnailUrl = v4->_thumbnailUrl;
      v4->_thumbnailUrl = (NSURL *)v26;

    }
    else
    {
      v25 = v4->_thumbnailUrl;
      v4->_thumbnailUrl = 0;
    }

    if (*((_BYTE *)a3 + 112))
    {
      if (*((char *)a3 + 111) >= 0)
        v28 = (char *)a3 + 88;
      else
        v28 = (char *)*((_QWORD *)a3 + 11);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
      thumbnailContentType = v4->_thumbnailContentType;
      v4->_thumbnailContentType = (NSString *)v29;
    }
    else
    {
      thumbnailContentType = v4->_thumbnailContentType;
      v4->_thumbnailContentType = 0;
    }

    if (*((_BYTE *)a3 + 128))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 15));
      v31 = objc_claimAutoreleasedReturnValue();
      thumbnailFileSize = v4->_thumbnailFileSize;
      v4->_thumbnailFileSize = (NSNumber *)v31;
    }
    else
    {
      thumbnailFileSize = v4->_thumbnailFileSize;
      v4->_thumbnailFileSize = 0;
    }

    v4->_height = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3 + 34);
    if (*((_BYTE *)a3 + 168))
    {
      v35 = (char *)*((_QWORD *)a3 + 18);
      v34 = (char *)a3 + 144;
      v33 = v35;
      if (v34[23] >= 0)
        v36 = v34;
      else
        v36 = v33;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v36);
      v37 = objc_claimAutoreleasedReturnValue();
      contentDescription = v4->_contentDescription;
      v4->_contentDescription = (NSString *)v37;
    }
    else
    {
      contentDescription = v4->_contentDescription;
      v4->_contentDescription = 0;
    }

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)mediaUrl
{
  return self->_mediaUrl;
}

- (void)setMediaUrl:(id)a3
{
  objc_storeStrong((id *)&self->_mediaUrl, a3);
}

- (NSString)mediaContentType
{
  return self->_mediaContentType;
}

- (void)setMediaContentType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContentType, a3);
}

- (NSNumber)mediaFileSize
{
  return self->_mediaFileSize;
}

- (void)setMediaFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_mediaFileSize, a3);
}

- (NSURL)thumbnailUrl
{
  return self->_thumbnailUrl;
}

- (void)setThumbnailUrl:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailUrl, a3);
}

- (NSString)thumbnailContentType
{
  return self->_thumbnailContentType;
}

- (void)setThumbnailContentType:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailContentType, a3);
}

- (NSNumber)thumbnailFileSize
{
  return self->_thumbnailFileSize;
}

- (void)setThumbnailFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailFileSize, a3);
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setContentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_contentDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_thumbnailFileSize, 0);
  objc_storeStrong((id *)&self->_thumbnailContentType, 0);
  objc_storeStrong((id *)&self->_thumbnailUrl, 0);
  objc_storeStrong((id *)&self->_mediaFileSize, 0);
  objc_storeStrong((id *)&self->_mediaContentType, 0);
  objc_storeStrong((id *)&self->_mediaUrl, 0);
}

@end
