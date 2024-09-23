@implementation HMCameraClipVideoAssetContext

- (HMCameraClipVideoAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ is unavailable"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (HMCameraClipVideoAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5 hlsPlaylist:(id)a6
{
  id v10;
  HMCameraClipVideoAssetContext *v11;
  uint64_t v12;
  NSData *hlsPlaylist;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMCameraClipVideoAssetContext;
  v11 = -[HMCameraClipAssetContext initWithURL:expirationDate:requiredHTTPHeaders:](&v15, sel_initWithURL_expirationDate_requiredHTTPHeaders_, a3, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    hlsPlaylist = v11->_hlsPlaylist;
    v11->_hlsPlaylist = (NSData *)v12;

  }
  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMCameraClipAssetContext url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipAssetContext expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipAssetContext requiredHTTPHeaders](self, "requiredHTTPHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipVideoAssetContext hlsPlaylist](self, "hlsPlaylist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ url: %@ expirationDate: %@ requiredHTTPHeaders: %@ hlsPlaylist: %lu bytes>"), v4, v5, v6, v7, objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HMCameraClipVideoAssetContext *v4;
  HMCameraClipVideoAssetContext *v5;
  HMCameraClipVideoAssetContext *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = (HMCameraClipVideoAssetContext *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (v11.receiver = self,
          v11.super_class = (Class)HMCameraClipVideoAssetContext,
          -[HMCameraClipAssetContext isEqual:](&v11, sel_isEqual_, v6)))
    {
      -[HMCameraClipVideoAssetContext hlsPlaylist](self, "hlsPlaylist");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCameraClipVideoAssetContext hlsPlaylist](v6, "hlsPlaylist");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToData:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipVideoAssetContext;
  v3 = -[HMCameraClipAssetContext hash](&v7, sel_hash);
  -[HMCameraClipVideoAssetContext hlsPlaylist](self, "hlsPlaylist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (HMCameraClipVideoAssetContext)initWithCoder:(id)a3
{
  id v4;
  HMCameraClipAssetContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMCameraClipVideoAssetContext *v10;

  v4 = a3;
  v5 = -[HMCameraClipAssetContext initWithCoder:]([HMCameraClipAssetContext alloc], "initWithCoder:", v4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCCV.hp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMCameraClipAssetContext url](v5, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraClipAssetContext expirationDate](v5, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraClipAssetContext requiredHTTPHeaders](v5, "requiredHTTPHeaders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMCameraClipVideoAssetContext initWithURL:expirationDate:requiredHTTPHeaders:hlsPlaylist:](self, "initWithURL:expirationDate:requiredHTTPHeaders:hlsPlaylist:", v7, v8, v9, v6);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMCameraClipVideoAssetContext;
  v4 = a3;
  -[HMCameraClipAssetContext encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMCameraClipVideoAssetContext hlsPlaylist](self, "hlsPlaylist", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMCCV.hp"));

}

- (NSData)hlsPlaylist
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hlsPlaylist, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
