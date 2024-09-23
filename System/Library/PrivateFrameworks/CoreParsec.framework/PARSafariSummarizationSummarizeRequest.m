@implementation PARSafariSummarizationSummarizeRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARSafariSummarizationSummarizeRequest;
  v4 = a3;
  -[PARRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlString, CFSTR("urlString"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_localeString, CFSTR("locale"));

}

- (PARSafariSummarizationSummarizeRequest)initWithCoder:(id)a3
{
  id v4;
  PARSafariSummarizationSummarizeRequest *v5;
  uint64_t v6;
  NSString *urlString;
  uint64_t v8;
  NSString *localeString;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PARSafariSummarizationSummarizeRequest;
  v5 = -[PARRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlString"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v8 = objc_claimAutoreleasedReturnValue();
    localeString = v5->_localeString;
    v5->_localeString = (NSString *)v8;

  }
  return v5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (unsigned)nwActivityLabel
{
  return 3;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)localeString
{
  return self->_localeString;
}

- (void)setLocaleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeString, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
