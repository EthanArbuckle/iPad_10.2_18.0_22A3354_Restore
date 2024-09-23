@implementation PARSafariSummarizationPrefetchRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARSafariSummarizationPrefetchRequest;
  v4 = a3;
  -[PARRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlString, CFSTR("urlString"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlVariants, CFSTR("urlVariants"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localeString, CFSTR("locale"));

}

- (PARSafariSummarizationPrefetchRequest)initWithCoder:(id)a3
{
  id v4;
  PARSafariSummarizationPrefetchRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *urlVariants;
  uint64_t v11;
  NSString *urlString;
  uint64_t v13;
  NSString *localeString;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PARSafariSummarizationPrefetchRequest;
  v5 = -[PARRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("urlVariants"));
    v9 = objc_claimAutoreleasedReturnValue();
    urlVariants = v5->_urlVariants;
    v5->_urlVariants = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlString"));
    v11 = objc_claimAutoreleasedReturnValue();
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v13 = objc_claimAutoreleasedReturnValue();
    localeString = v5->_localeString;
    v5->_localeString = (NSString *)v13;

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

- (NSArray)urlVariants
{
  return self->_urlVariants;
}

- (void)setUrlVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)localeString
{
  return self->_localeString;
}

- (void)setLocaleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeString, 0);
  objc_storeStrong((id *)&self->_urlVariants, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
