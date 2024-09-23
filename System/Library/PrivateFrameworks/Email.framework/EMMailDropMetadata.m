@implementation EMMailDropMetadata

+ (id)mailDropMetadata
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMailDropMetadata)initWithCoder:(id)a3
{
  id v4;
  EMMailDropMetadata *v5;
  uint64_t v6;
  NSString *fileName;
  uint64_t v8;
  NSString *mimeType;
  uint64_t v10;
  NSURL *directUrl;
  uint64_t v12;
  NSURL *wrappedUrl;
  uint64_t v14;
  NSDate *expiration;
  uint64_t v16;
  NSString *UUID;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EMMailDropMetadata;
  v5 = -[EMMailDropMetadata init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_fileName"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v6;

    v5->_fileSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_fileSize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mimeType"));
    v8 = objc_claimAutoreleasedReturnValue();
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v8;

    v5->_autoArchive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_autoArchive"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_directUrl"));
    v10 = objc_claimAutoreleasedReturnValue();
    directUrl = v5->_directUrl;
    v5->_directUrl = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_wrappedUrl"));
    v12 = objc_claimAutoreleasedReturnValue();
    wrappedUrl = v5->_wrappedUrl;
    v5->_wrappedUrl = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_expiration"));
    v14 = objc_claimAutoreleasedReturnValue();
    expiration = v5->_expiration;
    v5->_expiration = (NSDate *)v14;

    v5->_flags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_flags"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_UUID"));
    v16 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v16;

    v5->_isInvalid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_isInvalid"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EMMailDropMetadata fileName](self, "fileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_fileName"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[EMMailDropMetadata fileSize](self, "fileSize"), CFSTR("EFPropertyKey_fileSize"));
  -[EMMailDropMetadata mimeType](self, "mimeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_mimeType"));

  objc_msgSend(v8, "encodeBool:forKey:", -[EMMailDropMetadata autoArchive](self, "autoArchive"), CFSTR("EFPropertyKey_autoArchive"));
  -[EMMailDropMetadata directUrl](self, "directUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_directUrl"));

  -[EMMailDropMetadata wrappedUrl](self, "wrappedUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_wrappedUrl"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_expiration, CFSTR("EFPropertyKey_expiration"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[EMMailDropMetadata flags](self, "flags"), CFSTR("EFPropertyKey_flags"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_UUID, CFSTR("EFPropertyKey_UUID"));
  objc_msgSend(v8, "encodeBool:forKey:", -[EMMailDropMetadata isInvalid](self, "isInvalid"), CFSTR("EFPropertyKey_isInvalid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  EMMailDropMetadata *v4;
  uint64_t v5;
  NSString *UUID;
  uint64_t v7;
  NSString *fileName;
  uint64_t v9;
  NSString *mimeType;

  v4 = objc_alloc_init(EMMailDropMetadata);
  v5 = -[NSString copy](self->_UUID, "copy");
  UUID = v4->_UUID;
  v4->_UUID = (NSString *)v5;

  v4->_autoArchive = self->_autoArchive;
  objc_storeStrong((id *)&v4->_directUrl, self->_directUrl);
  objc_storeStrong((id *)&v4->_expiration, self->_expiration);
  v4->_flags = self->_flags;
  v7 = -[NSString copy](self->_fileName, "copy");
  fileName = v4->_fileName;
  v4->_fileName = (NSString *)v7;

  v4->_fileSize = self->_fileSize;
  v9 = -[NSString copy](self->_mimeType, "copy");
  mimeType = v4->_mimeType;
  v4->_mimeType = (NSString *)v9;

  v4->_isInvalid = self->_isInvalid;
  objc_storeStrong((id *)&v4->_wrappedUrl, self->_wrappedUrl);
  return v4;
}

- (id)description
{
  void *v3;
  const char *v4;
  NSString *UUID;
  unint64_t flags;
  NSString *mimeType;
  NSURL *directUrl;
  NSDate *expiration;
  NSURL *wrappedUrl;
  void *v11;
  void *v12;
  __int128 v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14 = *(_OWORD *)&self->_fileName;
  if (self->_autoArchive)
    v4 = "YES";
  else
    v4 = "NO";
  flags = self->_flags;
  UUID = self->_UUID;
  mimeType = self->_mimeType;
  directUrl = self->_directUrl;
  wrappedUrl = self->_wrappedUrl;
  expiration = self->_expiration;
  -[EMMailDropMetadata isBanner](self, "isBanner");
  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nPtr:[%p]\nName:[%@]\nSize:[%lu]\nMIME:[%@]\nAuto-archive:[%s]\nExpiration:[%@]\nUUID:[%@]\nMDType:[%lu]\nURL:[%@]\nWrapped URL:[%@]\nisBanner:[%@]\n--------------"), self, v14, mimeType, v4, expiration, UUID, flags, directUrl, wrappedUrl, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *UUID;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  UUID = self->_UUID;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(UUID) = -[NSString isEqualToString:](UUID, "isEqualToString:", v6);

  if ((UUID & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[EMMailDropMetadata directUrlString](self, "directUrlString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "directUrlString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  return v7;
}

- (id)directUrlString
{
  return -[NSURL absoluteString](self->_directUrl, "absoluteString");
}

- (id)wrappedUrlString
{
  return -[NSURL absoluteString](self->_wrappedUrl, "absoluteString");
}

- (BOOL)isBanner
{
  return self->_flags & 1;
}

- (BOOL)isPhotoArchive
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate laterDate:](self->_expiration, "laterDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == v3;

  return (char)self;
}

- (BOOL)isBannerWithMultiple
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (void)merge:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  if (v4)
  {
    v22 = v4;
    objc_msgSend(v4, "fileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(v22, "fileName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ef_sanitizedFileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailDropMetadata setFileName:](self, "setFileName:", v8);

    }
    if (objc_msgSend(v22, "fileSize"))
      -[EMMailDropMetadata setFileSize:](self, "setFileSize:", objc_msgSend(v22, "fileSize"));
    objc_msgSend(v22, "mimeType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_msgSend(v22, "mimeType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailDropMetadata setMimeType:](self, "setMimeType:", v11);

    }
    if (objc_msgSend(v22, "autoArchive"))
      -[EMMailDropMetadata setAutoArchive:](self, "setAutoArchive:", objc_msgSend(v22, "autoArchive"));
    objc_msgSend(v22, "directUrlString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      objc_msgSend(v22, "directUrl");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailDropMetadata setDirectUrl:](self, "setDirectUrl:", v14);

    }
    objc_msgSend(v22, "wrappedUrlString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      objc_msgSend(v22, "wrappedUrl");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailDropMetadata setWrappedUrl:](self, "setWrappedUrl:", v17);

    }
    objc_msgSend(v22, "expiration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v22, "expiration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailDropMetadata setExpiration:](self, "setExpiration:", v19);

    }
    -[EMMailDropMetadata setFlags:](self, "setFlags:", -[EMMailDropMetadata flags](self, "flags") | objc_msgSend(v22, "flags"));
    objc_msgSend(v22, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v22;
    if (v20)
    {
      objc_msgSend(v22, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailDropMetadata setUUID:](self, "setUUID:", v21);

      v4 = v22;
    }
  }

}

- (NSString)UUID
{
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
  NSString *v13;
  NSString *UUID;
  NSString *v15;

  if (!self->_UUID)
  {
    if (self->_directUrl)
    {
      -[EMMailDropMetadata directUrlString](self, "directUrlString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dataUsingEncoding:", 4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "ef_md5Digest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ef_hexString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v6, "length") >= 0x20)
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "substringWithRange:", 0, 8);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "substringWithRange:", 8, 4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "substringWithRange:", 12, 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "substringWithRange:", 16, 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "substringWithRange:", 20, 12);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@"), v8, v9, v10, v11, v12);
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        UUID = self->_UUID;
        self->_UUID = v13;

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_UUID;
      self->_UUID = v15;
    }

  }
  return self->_UUID;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)autoArchive
{
  return self->_autoArchive;
}

- (void)setAutoArchive:(BOOL)a3
{
  self->_autoArchive = a3;
}

- (NSURL)directUrl
{
  return self->_directUrl;
}

- (void)setDirectUrl:(id)a3
{
  objc_storeStrong((id *)&self->_directUrl, a3);
}

- (NSURL)wrappedUrl
{
  return self->_wrappedUrl;
}

- (void)setWrappedUrl:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedUrl, a3);
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_expiration, a3);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_wrappedUrl, 0);
  objc_storeStrong((id *)&self->_directUrl, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
