@implementation ATXBiomeSuggestedHomePageEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t pageType;
  id v5;

  pageType = self->_pageType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", pageType, CFSTR("ATXBiomeSuggestedHomePageEventPageType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("ATXBiomeSuggestedHomePageEventIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_action, CFSTR("ATXBiomeSuggestedHomePageEventAction"));

}

- (ATXBiomeSuggestedHomePageEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  ATXBiomeSuggestedHomePageEvent *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ATXBiomeSuggestedHomePageEventPageType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ATXBiomeSuggestedHomePageEventIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ATXBiomeSuggestedHomePageEventAction"));

  v8 = -[ATXBiomeSuggestedHomePageEvent initWithPageType:identifier:action:]([ATXBiomeSuggestedHomePageEvent alloc], "initWithPageType:identifier:action:", v5, v6, v7);
  return v8;
}

- (ATXBiomeSuggestedHomePageEvent)initWithPageType:(int64_t)a3 identifier:(id)a4 action:(int64_t)a5
{
  id v9;
  ATXBiomeSuggestedHomePageEvent *v10;
  ATXBiomeSuggestedHomePageEvent *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXBiomeSuggestedHomePageEvent;
  v10 = -[ATXBiomeSuggestedHomePageEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_pageType = a3;
    objc_storeStrong((id *)&v10->_identifier, a4);
    v11->_action = a5;
  }

  return v11;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;

  if (a4 == 1)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = a3;
    v9 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (!v9)
      v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)serialize
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v8;

  v3 = (void *)MEMORY[0x1A85A4F90](self, a2);
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  objc_autoreleasePoolPop(v3);
  v6 = 0;
  if (!v5)
    v6 = v4;

  return v6;
}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_pageType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
