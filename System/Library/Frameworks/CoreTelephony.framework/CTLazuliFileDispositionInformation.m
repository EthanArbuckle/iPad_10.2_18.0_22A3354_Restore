@implementation CTLazuliFileDispositionInformation

- (CTLazuliFileDispositionInformation)init
{
  CTLazuliFileDispositionInformation *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTLazuliFileDispositionInformation;
  v2 = -[CTLazuliFileDispositionInformation init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTLazuliFileDispositionInformation setFileSizeInBytes:](v2, "setFileSizeInBytes:", v3);

    -[CTLazuliFileDispositionInformation setOriginalFileName:](v2, "setOriginalFileName:", &stru_1E1536FB8);
    -[CTLazuliFileDispositionInformation setUntrustedContentType:](v2, "setUntrustedContentType:", &stru_1E1536FB8);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E1536FB8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTLazuliFileDispositionInformation setDataUrl:](v2, "setDataUrl:", v4);

    -[CTLazuliFileDispositionInformation setValidUntil:](v2, "setValidUntil:", &stru_1E1536FB8);
    -[CTLazuliFileDispositionInformation setDisposition:](v2, "setDisposition:", -1);
    -[CTLazuliFileDispositionInformation setPlayingLengthInSeconds:](v2, "setPlayingLengthInSeconds:", 0);
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  int64_t v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliFileDispositionInformation fileSizeInBytes](self, "fileSizeInBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fileSizeInBytes = %@"), v4);

  -[CTLazuliFileDispositionInformation originalFileName](self, "originalFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", originalFileName = %@"), v5);

  -[CTLazuliFileDispositionInformation untrustedContentType](self, "untrustedContentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", untrustedContentType = %@"), v6);

  -[CTLazuliFileDispositionInformation dataUrl](self, "dataUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataUrl = %@"), v7);

  -[CTLazuliFileDispositionInformation validUntil](self, "validUntil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", validUntil = %@"), v8);

  v9 = -[CTLazuliFileDispositionInformation disposition](self, "disposition");
  v12 = -[CTLazuliFileDispositionInformation disposition](self, "disposition");
  objc_msgSend(v3, "appendFormat:", CFSTR(", disposition = [%ld - %s]"), v9, print_CTLazuliFileDispositionType(&v12));
  -[CTLazuliFileDispositionInformation playingLengthInSeconds](self, "playingLengthInSeconds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", playingLengthInSeconds = %@"), v10);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliFileDispositionInformation:(id)a3
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
  int64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  -[CTLazuliFileDispositionInformation fileSizeInBytes](self, "fileSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longValue");
  objc_msgSend(v4, "fileSizeInBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v7, "longValue"))
  {
    -[CTLazuliFileDispositionInformation originalFileName](self, "originalFileName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalFileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v9))
    {
      v16 = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[CTLazuliFileDispositionInformation untrustedContentType](self, "untrustedContentType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "untrustedContentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", v11))
    {
      v16 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[CTLazuliFileDispositionInformation dataUrl](self, "dataUrl");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataUrl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "isEqual:", v12))
    {
      v16 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[CTLazuliFileDispositionInformation validUntil](self, "validUntil");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "validUntil");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "isEqualToString:")
      || (v13 = -[CTLazuliFileDispositionInformation disposition](self, "disposition"),
          v13 != objc_msgSend(v4, "disposition")))
    {
      v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    -[CTLazuliFileDispositionInformation playingLengthInSeconds](self, "playingLengthInSeconds");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22 || (objc_msgSend(v4, "playingLengthInSeconds"), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliFileDispositionInformation playingLengthInSeconds](self, "playingLengthInSeconds", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v21, "longValue");
      objc_msgSend(v4, "playingLengthInSeconds");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14 == objc_msgSend(v15, "longValue");

      v17 = (void *)v22;
      if (v22)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v20 = 0;
      v16 = 1;
    }
    v17 = v20;
    goto LABEL_18;
  }
  v16 = 0;
LABEL_23:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliFileDispositionInformation *v4;
  CTLazuliFileDispositionInformation *v5;
  BOOL v6;

  v4 = (CTLazuliFileDispositionInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliFileDispositionInformation isEqualToCTLazuliFileDispositionInformation:](self, "isEqualToCTLazuliFileDispositionInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliFileDispositionInformation *v4;

  v4 = +[CTLazuliFileDispositionInformation allocWithZone:](CTLazuliFileDispositionInformation, "allocWithZone:", a3);
  -[CTLazuliFileDispositionInformation setFileSizeInBytes:](v4, "setFileSizeInBytes:", self->_fileSizeInBytes);
  -[CTLazuliFileDispositionInformation setOriginalFileName:](v4, "setOriginalFileName:", self->_originalFileName);
  -[CTLazuliFileDispositionInformation setUntrustedContentType:](v4, "setUntrustedContentType:", self->_untrustedContentType);
  -[CTLazuliFileDispositionInformation setDataUrl:](v4, "setDataUrl:", self->_dataUrl);
  -[CTLazuliFileDispositionInformation setValidUntil:](v4, "setValidUntil:", self->_validUntil);
  -[CTLazuliFileDispositionInformation setDisposition:](v4, "setDisposition:", self->_disposition);
  -[CTLazuliFileDispositionInformation setPlayingLengthInSeconds:](v4, "setPlayingLengthInSeconds:", self->_playingLengthInSeconds);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileSizeInBytes, CFSTR("kFileSizeInBytesKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalFileName, CFSTR("kOriginalFileNameKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedContentType, CFSTR("kUntrustedContentTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataUrl, CFSTR("kDataUrlKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validUntil, CFSTR("kValidUntilKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_disposition);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kDispositionKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_playingLengthInSeconds, CFSTR("kPlayingLengthInSecondsKey"));
}

- (CTLazuliFileDispositionInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliFileDispositionInformation *v5;
  uint64_t v6;
  NSNumber *fileSizeInBytes;
  uint64_t v8;
  NSString *originalFileName;
  uint64_t v10;
  NSString *untrustedContentType;
  uint64_t v12;
  NSURL *dataUrl;
  uint64_t v14;
  NSString *validUntil;
  void *v16;
  uint64_t v17;
  NSNumber *playingLengthInSeconds;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CTLazuliFileDispositionInformation;
  v5 = -[CTLazuliFileDispositionInformation init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFileSizeInBytesKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileSizeInBytes = v5->_fileSizeInBytes;
    v5->_fileSizeInBytes = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOriginalFileNameKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    originalFileName = v5->_originalFileName;
    v5->_originalFileName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUntrustedContentTypeKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    untrustedContentType = v5->_untrustedContentType;
    v5->_untrustedContentType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDataUrlKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    dataUrl = v5->_dataUrl;
    v5->_dataUrl = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kValidUntilKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    validUntil = v5->_validUntil;
    v5->_validUntil = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDispositionKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disposition = objc_msgSend(v16, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPlayingLengthInSecondsKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    playingLengthInSeconds = v5->_playingLengthInSeconds;
    v5->_playingLengthInSeconds = (NSNumber *)v17;

  }
  return v5;
}

- (CTLazuliFileDispositionInformation)initWithReflection:(const void *)a3
{
  CTLazuliFileDispositionInformation *v4;
  uint64_t v5;
  NSNumber *fileSizeInBytes;
  char *v7;
  uint64_t v8;
  NSString *originalFileName;
  char *v10;
  uint64_t v11;
  NSString *untrustedContentType;
  void *v13;
  void *v14;
  char *v15;
  int v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  NSURL *dataUrl;
  char *v22;
  uint64_t v23;
  NSString *validUntil;
  uint64_t v25;
  NSNumber *playingLengthInSeconds;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CTLazuliFileDispositionInformation;
  v4 = -[CTLazuliFileDispositionInformation init](&v28, sel_init);
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
    originalFileName = v4->_originalFileName;
    v4->_originalFileName = (NSString *)v8;

    if (*((char *)a3 + 55) >= 0)
      v10 = (char *)a3 + 32;
    else
      v10 = (char *)*((_QWORD *)a3 + 4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    untrustedContentType = v4->_untrustedContentType;
    v4->_untrustedContentType = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E0C99E98];
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (char *)*((_QWORD *)a3 + 7);
    v16 = *((char *)a3 + 79);
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v16 >= 0)
      v18 = (char *)a3 + 56;
    else
      v18 = v15;
    objc_msgSend(v14, "stringWithCString:encoding:", v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLWithString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    dataUrl = v4->_dataUrl;
    v4->_dataUrl = (NSURL *)v20;

    if (*((char *)a3 + 103) >= 0)
      v22 = (char *)a3 + 80;
    else
      v22 = (char *)*((_QWORD *)a3 + 10);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    validUntil = v4->_validUntil;
    v4->_validUntil = (NSString *)v23;

    v4->_disposition = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 26);
    if (*((_BYTE *)a3 + 120))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 14));
      v25 = objc_claimAutoreleasedReturnValue();
      playingLengthInSeconds = v4->_playingLengthInSeconds;
      v4->_playingLengthInSeconds = (NSNumber *)v25;
    }
    else
    {
      playingLengthInSeconds = v4->_playingLengthInSeconds;
      v4->_playingLengthInSeconds = 0;
    }

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

- (NSString)originalFileName
{
  return self->_originalFileName;
}

- (void)setOriginalFileName:(id)a3
{
  objc_storeStrong((id *)&self->_originalFileName, a3);
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

- (int64_t)disposition
{
  return self->_disposition;
}

- (void)setDisposition:(int64_t)a3
{
  self->_disposition = a3;
}

- (NSNumber)playingLengthInSeconds
{
  return self->_playingLengthInSeconds;
}

- (void)setPlayingLengthInSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_playingLengthInSeconds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingLengthInSeconds, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_dataUrl, 0);
  objc_storeStrong((id *)&self->_untrustedContentType, 0);
  objc_storeStrong((id *)&self->_originalFileName, 0);
  objc_storeStrong((id *)&self->_fileSizeInBytes, 0);
}

@end
