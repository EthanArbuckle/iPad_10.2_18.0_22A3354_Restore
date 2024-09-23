@implementation MADownloadConfig

- (MADownloadConfig)init
{
  MADownloadConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADownloadConfig;
  result = -[MADownloadConfig init](&v3, sel_init);
  if (result)
    result->_discretionary = 1;
  return result;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADownloadConfig)initWithCoder:(id)a3
{
  id v4;
  MADownloadConfig *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADownloadConfig;
  v5 = -[MADownloadConfig init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discretionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_discretionary = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (MADownloadConfig)initWithPlist:(id)a3
{
  id v4;
  MADownloadConfig *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADownloadConfig;
  v5 = -[MADownloadConfig init](&v7, sel_init);
  if (v5)
    v5->_discretionary = getPlistNumberAsBool(v4, CFSTR("discretionary"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  _BOOL8 discretionary;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  discretionary = self->_discretionary;
  v5 = a3;
  objc_msgSend(v3, "numberWithBool:", discretionary);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("discretionary"));

}

- (id)encodeAsPlist
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_discretionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("discretionary"));

  return v3;
}

- (void)logConfig
{
  _BOOL4 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = -[MADownloadConfig discretionary](self, "discretionary");
  _MobileAssetLog(0, 6, (uint64_t)"-[MADownloadConfig logConfig]", CFSTR("The config is discretionary: %d"), v3, v4, v5, v6, v2);
}

- (id)summary
{
  void *v2;
  _BOOL4 v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[MADownloadConfig discretionary](self, "discretionary");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("discretionary:%@"), v4);
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

@end
