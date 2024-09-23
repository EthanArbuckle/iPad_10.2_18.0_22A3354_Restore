@implementation _LTTranslationFeedback

- (void)encodeWithCoder:(id)a3
{
  NSString *sourceContentAsJSON;
  id v5;

  sourceContentAsJSON = self->_sourceContentAsJSON;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceContentAsJSON, CFSTR("sourceContentAsJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetContentAsJSON, CFSTR("targetContentAsJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorsAsJSON, CFSTR("errorsAsJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_safariVersion, CFSTR("safariVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webpageURL, CFSTR("webpageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localePair, CFSTR("localePair"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));

}

- (_LTTranslationFeedback)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationFeedback *v5;
  uint64_t v6;
  NSString *sourceContentAsJSON;
  uint64_t v8;
  NSString *targetContentAsJSON;
  uint64_t v10;
  NSString *errorsAsJSON;
  uint64_t v12;
  NSString *safariVersion;
  uint64_t v14;
  NSURL *webpageURL;
  uint64_t v16;
  _LTLocalePair *localePair;
  uint64_t v18;
  NSString *sessionID;
  _LTTranslationFeedback *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_LTTranslationFeedback;
  v5 = -[_LTTranslationFeedback init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceContentAsJSON"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceContentAsJSON = v5->_sourceContentAsJSON;
    v5->_sourceContentAsJSON = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetContentAsJSON"));
    v8 = objc_claimAutoreleasedReturnValue();
    targetContentAsJSON = v5->_targetContentAsJSON;
    v5->_targetContentAsJSON = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorsAsJSON"));
    v10 = objc_claimAutoreleasedReturnValue();
    errorsAsJSON = v5->_errorsAsJSON;
    v5->_errorsAsJSON = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("safariVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    safariVersion = v5->_safariVersion;
    v5->_safariVersion = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webpageURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    webpageURL = v5->_webpageURL;
    v5->_webpageURL = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localePair"));
    v16 = objc_claimAutoreleasedReturnValue();
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v18 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v18;

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
    v20 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sourceContentAsJSON
{
  return self->_sourceContentAsJSON;
}

- (void)setSourceContentAsJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)targetContentAsJSON
{
  return self->_targetContentAsJSON;
}

- (void)setTargetContentAsJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)errorsAsJSON
{
  return self->_errorsAsJSON;
}

- (void)setErrorsAsJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)safariVersion
{
  return self->_safariVersion;
}

- (void)setSafariVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)webpageURL
{
  return self->_webpageURL;
}

- (void)setWebpageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_safariVersion, 0);
  objc_storeStrong((id *)&self->_errorsAsJSON, 0);
  objc_storeStrong((id *)&self->_targetContentAsJSON, 0);
  objc_storeStrong((id *)&self->_sourceContentAsJSON, 0);
}

@end
