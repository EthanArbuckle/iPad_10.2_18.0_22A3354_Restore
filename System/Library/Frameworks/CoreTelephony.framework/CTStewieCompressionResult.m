@implementation CTStewieCompressionResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const char *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieCompressionResult compressedData](self, "compressedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTStewieCompressionResult compressedData](self, "compressedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", compressedData length=%lu"), objc_msgSend(v5, "length"));

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(", compressedData=nil"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", codecId=%lu"), -[CTStewieCompressionResult codecId](self, "codecId"));
  v6 = -[CTStewieCompressionResult isPreferredCodec](self, "isPreferredCodec");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isPreferredCodec=%s"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CTStewieCompressionResult *v7;
  CTStewieCompressionResult *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  int64_t v12;
  _BOOL4 v13;

  v7 = (CTStewieCompressionResult *)a3;
  if (v7 == self)
  {
    LOBYTE(v11) = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v11) = 0;
    goto LABEL_19;
  }
  v8 = v7;
  -[CTStewieCompressionResult compressedData](self, "compressedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[CTStewieCompressionResult compressedData](v8, "compressedData"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTStewieCompressionResult compressedData](self, "compressedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTStewieCompressionResult compressedData](v8, "compressedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqual:", v5))
    {
      LOBYTE(v11) = 0;
      goto LABEL_15;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  v12 = -[CTStewieCompressionResult codecId](self, "codecId");
  if (v12 == -[CTStewieCompressionResult codecId](v8, "codecId"))
  {
    v13 = -[CTStewieCompressionResult isPreferredCodec](self, "isPreferredCodec");
    v11 = v13 ^ -[CTStewieCompressionResult isPreferredCodec](v8, "isPreferredCodec") ^ 1;
    if ((v10 & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  LOBYTE(v11) = 0;
  if (v10)
  {
LABEL_15:

  }
LABEL_16:
  if (!v9)

LABEL_19:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieCompressionResult compressedData](self, "compressedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setCompressedData:", v7);

  objc_msgSend(v5, "setCodecId:", -[CTStewieCompressionResult codecId](self, "codecId"));
  objc_msgSend(v5, "setIsPreferredCodec:", -[CTStewieCompressionResult isPreferredCodec](self, "isPreferredCodec"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTStewieCompressionResult compressedData](self, "compressedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("compressedData"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieCompressionResult codecId](self, "codecId"), CFSTR("codecId"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieCompressionResult isPreferredCodec](self, "isPreferredCodec"), CFSTR("isPreferredCodec"));

}

- (CTStewieCompressionResult)initWithCoder:(id)a3
{
  id v4;
  CTStewieCompressionResult *v5;
  uint64_t v6;
  NSData *compressedData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieCompressionResult;
  v5 = -[CTStewieCompressionResult init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compressedData"));
    v6 = objc_claimAutoreleasedReturnValue();
    compressedData = v5->_compressedData;
    v5->_compressedData = (NSData *)v6;

    v5->_codecId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codecId"));
    v5->_isPreferredCodec = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPreferredCodec"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)compressedData
{
  return self->_compressedData;
}

- (void)setCompressedData:(id)a3
{
  objc_storeStrong((id *)&self->_compressedData, a3);
}

- (int64_t)codecId
{
  return self->_codecId;
}

- (void)setCodecId:(int64_t)a3
{
  self->_codecId = a3;
}

- (BOOL)isPreferredCodec
{
  return self->_isPreferredCodec;
}

- (void)setIsPreferredCodec:(BOOL)a3
{
  self->_isPreferredCodec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressedData, 0);
}

@end
