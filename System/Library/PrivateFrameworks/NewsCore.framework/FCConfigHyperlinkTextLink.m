@implementation FCConfigHyperlinkTextLink

- (FCConfigHyperlinkTextLink)initWithConfigDictionary:(id)a3
{
  id v4;
  FCConfigHyperlinkTextLink *v5;
  uint64_t v6;
  NSString *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCConfigHyperlinkTextLink;
  v5 = -[FCConfigHyperlinkTextLink init](&v9, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("url"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v6;

    v5->_rangeStart = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("rangeStart"), -1);
    v5->_rangeLength = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("rangeLength"), -1);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (FCConfigHyperlinkTextLink)initWithURL:(id)a3 rangeStart:(int64_t)a4 rangeLength:(int64_t)a5
{
  id v9;
  FCConfigHyperlinkTextLink *v10;
  FCConfigHyperlinkTextLink *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCConfigHyperlinkTextLink;
  v10 = -[FCConfigHyperlinkTextLink init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_url, a3);
    v11->_rangeStart = a4;
    v11->_rangeLength = a5;
  }

  return v11;
}

- (NSString)url
{
  return self->_url;
}

- (int64_t)rangeStart
{
  return self->_rangeStart;
}

- (int64_t)rangeLength
{
  return self->_rangeLength;
}

@end
