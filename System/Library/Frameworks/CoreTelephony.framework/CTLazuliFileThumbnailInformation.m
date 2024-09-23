@implementation CTLazuliFileThumbnailInformation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliFileThumbnailInformation fileSizeInBytes](self, "fileSizeInBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fileSizeInBytes = %@"), v4);

  -[CTLazuliFileThumbnailInformation untrustedContentType](self, "untrustedContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", untrustedContentType = %@"), v5);

  -[CTLazuliFileThumbnailInformation dataUrl](self, "dataUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataUrl = %@"), v6);

  -[CTLazuliFileThumbnailInformation validUntil](self, "validUntil");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", validUntil = %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliFileThumbnailInformation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  -[CTLazuliFileThumbnailInformation fileSizeInBytes](self, "fileSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longValue");
  objc_msgSend(v4, "fileSizeInBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v7, "longValue"))
  {
    -[CTLazuliFileThumbnailInformation untrustedContentType](self, "untrustedContentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "untrustedContentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9))
    {
      -[CTLazuliFileThumbnailInformation dataUrl](self, "dataUrl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataUrl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", v11))
      {
        -[CTLazuliFileThumbnailInformation validUntil](self, "validUntil");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "validUntil");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliFileThumbnailInformation *v4;
  CTLazuliFileThumbnailInformation *v5;
  BOOL v6;

  v4 = (CTLazuliFileThumbnailInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliFileThumbnailInformation isEqualToCTLazuliFileThumbnailInformation:](self, "isEqualToCTLazuliFileThumbnailInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliFileThumbnailInformation *v4;

  v4 = +[CTLazuliFileThumbnailInformation allocWithZone:](CTLazuliFileThumbnailInformation, "allocWithZone:", a3);
  -[CTLazuliFileThumbnailInformation setFileSizeInBytes:](v4, "setFileSizeInBytes:", self->_fileSizeInBytes);
  -[CTLazuliFileThumbnailInformation setUntrustedContentType:](v4, "setUntrustedContentType:", self->_untrustedContentType);
  -[CTLazuliFileThumbnailInformation setDataUrl:](v4, "setDataUrl:", self->_dataUrl);
  -[CTLazuliFileThumbnailInformation setValidUntil:](v4, "setValidUntil:", self->_validUntil);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileSizeInBytes, CFSTR("kFileSizeInBytesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_untrustedContentType, CFSTR("kUntrustedContentTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataUrl, CFSTR("kDataUrlKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_validUntil, CFSTR("kValidUntilKey"));

}

- (CTLazuliFileThumbnailInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliFileThumbnailInformation *v5;
  uint64_t v6;
  NSNumber *fileSizeInBytes;
  uint64_t v8;
  NSString *untrustedContentType;
  uint64_t v10;
  NSURL *dataUrl;
  uint64_t v12;
  NSString *validUntil;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliFileThumbnailInformation;
  v5 = -[CTLazuliFileThumbnailInformation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFileSizeInBytesKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileSizeInBytes = v5->_fileSizeInBytes;
    v5->_fileSizeInBytes = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUntrustedContentTypeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    untrustedContentType = v5->_untrustedContentType;
    v5->_untrustedContentType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDataUrlKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    dataUrl = v5->_dataUrl;
    v5->_dataUrl = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kValidUntilKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    validUntil = v5->_validUntil;
    v5->_validUntil = (NSString *)v12;

  }
  return v5;
}

- (CTLazuliFileThumbnailInformation)initWithReflection:(const void *)a3
{
  CTLazuliFileThumbnailInformation *v4;
  uint64_t v5;
  NSNumber *fileSizeInBytes;
  char *v7;
  uint64_t v8;
  NSString *untrustedContentType;
  void *v10;
  void *v11;
  char *v12;
  int v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  NSURL *dataUrl;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  NSString *validUntil;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CTLazuliFileThumbnailInformation;
  v4 = -[CTLazuliFileThumbnailInformation init](&v26, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)a3);
    v5 = objc_claimAutoreleasedReturnValue();
    fileSizeInBytes = v4->_fileSizeInBytes;
    v4->_fileSizeInBytes = (NSNumber *)v5;

    if (*((char *)a3 + 31) >= 0)
      v7 = (char *)a3 + 8;
    else
      v7 = (char *)*((_QWORD *)a3 + 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    untrustedContentType = v4->_untrustedContentType;
    v4->_untrustedContentType = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E98];
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (char *)*((_QWORD *)a3 + 4);
    v13 = *((char *)a3 + 55);
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v13 >= 0)
      v15 = (char *)a3 + 32;
    else
      v15 = v12;
    objc_msgSend(v11, "stringWithCString:encoding:", v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    dataUrl = v4->_dataUrl;
    v4->_dataUrl = (NSURL *)v17;

    v21 = (char *)*((_QWORD *)a3 + 7);
    v20 = (char *)a3 + 56;
    v19 = v21;
    if (v20[23] >= 0)
      v22 = v20;
    else
      v22 = v19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    validUntil = v4->_validUntil;
    v4->_validUntil = (NSString *)v23;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)fileSizeInBytes
{
  return self->_fileSizeInBytes;
}

- (void)setFileSizeInBytes:(id)a3
{
  objc_storeStrong((id *)&self->_fileSizeInBytes, a3);
}

- (NSString)untrustedContentType
{
  return self->_untrustedContentType;
}

- (void)setUntrustedContentType:(id)a3
{
  objc_storeStrong((id *)&self->_untrustedContentType, a3);
}

- (NSURL)dataUrl
{
  return self->_dataUrl;
}

- (void)setDataUrl:(id)a3
{
  objc_storeStrong((id *)&self->_dataUrl, a3);
}

- (NSString)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
  objc_storeStrong((id *)&self->_validUntil, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_dataUrl, 0);
  objc_storeStrong((id *)&self->_untrustedContentType, 0);
  objc_storeStrong((id *)&self->_fileSizeInBytes, 0);
}

@end
