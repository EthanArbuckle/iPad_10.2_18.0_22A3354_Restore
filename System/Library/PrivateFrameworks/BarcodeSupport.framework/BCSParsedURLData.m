@implementation BCSParsedURLData

- (BCSParsedURLData)initWithURL:(id)a3
{
  return -[BCSParsedURLData initWithURL:type:](self, "initWithURL:type:", a3, 1);
}

- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4
{
  return -[BCSParsedURLData initWithURL:type:extraPreviewText:](self, "initWithURL:type:extraPreviewText:", a3, a4, 0);
}

- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5
{
  return -[BCSParsedURLData initWithURL:type:extraPreviewText:preferredBundleID:](self, "initWithURL:type:extraPreviewText:preferredBundleID:", a3, a4, a5, 0);
}

- (BCSParsedURLData)initWithURL:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5 preferredBundleID:(id)a6
{
  id v11;
  id v12;
  id v13;
  BCSParsedURLData *v14;
  BCSParsedURLData *v15;
  uint64_t v16;
  NSString *extraPreviewText;
  NSString *v18;
  NSString *preferredBundleID;
  BCSParsedURLData *v20;
  objc_super v22;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BCSParsedURLData;
  v14 = -[BCSParsedURLData init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a3);
    v15->_type = a4;
    v16 = objc_msgSend(v12, "copy");
    extraPreviewText = v15->_extraPreviewText;
    v15->_extraPreviewText = (NSString *)v16;

    if (v13)
    {
      v18 = (NSString *)v13;
    }
    else
    {
      +[BCSAppRanker bundleIdentifierOfLastUsedAppForURL:](BCSAppRanker, "bundleIdentifierOfLastUsedAppForURL:", v15->_url);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    preferredBundleID = v15->_preferredBundleID;
    v15->_preferredBundleID = v18;

    v20 = v15;
  }

  return v15;
}

- (BCSParsedURLData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BCSParsedURLData *v9;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extraPreviewText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredBundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BCSParsedURLData initWithURL:type:extraPreviewText:preferredBundleID:](self, "initWithURL:type:extraPreviewText:preferredBundleID:", v5, objc_msgSend(v6, "integerValue"), v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extraPreviewText, CFSTR("extraPreviewText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredBundleID, CFSTR("preferredBundleID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)extraPreviewText
{
  return self->_extraPreviewText;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)preferredBundleID
{
  return self->_preferredBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBundleID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_extraPreviewText, 0);
}

@end
