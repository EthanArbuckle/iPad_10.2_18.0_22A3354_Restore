@implementation GEORequestCounterProactiveTileDownloadInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterProactiveTileDownloadInfo)initWithIdentifier:(id)a3 policies:(id)a4
{
  id v6;
  id v7;
  GEORequestCounterProactiveTileDownloadInfo *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSArray *policies;
  GEORequestCounterProactiveTileDownloadInfo *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEORequestCounterProactiveTileDownloadInfo;
  v8 = -[GEORequestCounterProactiveTileDownloadInfo init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    policies = v8->_policies;
    v8->_policies = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (GEORequestCounterProactiveTileDownloadInfo)initWithCoder:(id)a3
{
  id v4;
  GEORequestCounterProactiveTileDownloadInfo *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *policies;
  GEORequestCounterProactiveTileDownloadInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEORequestCounterProactiveTileDownloadInfo;
  v5 = -[GEORequestCounterProactiveTileDownloadInfo init](&v15, sel_init);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier")),
        v6 = objc_claimAutoreleasedReturnValue(),
        identifier = v5->_identifier,
        v5->_identifier = (NSString *)v6,
        identifier,
        v5->_identifier))
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("policies"));
    v11 = objc_claimAutoreleasedReturnValue();
    policies = v5->_policies;
    v5->_policies = (NSArray *)v11;

    v13 = v5;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_policies, CFSTR("policies"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)policies
{
  return self->_policies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
