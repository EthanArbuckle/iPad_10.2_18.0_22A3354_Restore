@implementation MADVITextLookupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVITextLookupRequest)initWithQueryTerm:(id)a3 domain:(id)a4 textContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  MADVITextLookupRequest *v11;
  uint64_t v12;
  NSString *queryTerm;
  uint64_t v14;
  NSString *hintDomain;
  uint64_t v16;
  NSString *surroundingText;
  NSArray *normalizedBoundingBoxes;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MADVITextLookupRequest;
  v11 = -[MADVITextLookupRequest init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    queryTerm = v11->_queryTerm;
    v11->_queryTerm = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    hintDomain = v11->_hintDomain;
    v11->_hintDomain = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    surroundingText = v11->_surroundingText;
    v11->_surroundingText = (NSString *)v16;

    normalizedBoundingBoxes = v11->_normalizedBoundingBoxes;
    v11->_normalizedBoundingBoxes = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v11;
}

- (MADVITextLookupRequest)initWithQueryTerm:(id)a3
{
  return -[MADVITextLookupRequest initWithQueryTerm:domain:textContext:](self, "initWithQueryTerm:domain:textContext:", a3, 0, 0);
}

- (MADVITextLookupRequest)initWithCoder:(id)a3
{
  id v4;
  MADVITextLookupRequest *v5;
  uint64_t v6;
  NSString *queryTerm;
  uint64_t v8;
  NSString *hintDomain;
  uint64_t v10;
  NSString *surroundingText;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *normalizedBoundingBoxes;
  uint64_t v17;
  NSNumber *queryID;
  uint64_t v19;
  NSNumber *uiScale;
  uint64_t v21;
  NSString *engagementSuggestionType;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MADVITextLookupRequest;
  v5 = -[MADRequest initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QueryTerm"));
    v6 = objc_claimAutoreleasedReturnValue();
    queryTerm = v5->_queryTerm;
    v5->_queryTerm = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HintDomain"));
    v8 = objc_claimAutoreleasedReturnValue();
    hintDomain = v5->_hintDomain;
    v5->_hintDomain = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SurroundingText"));
    v10 = objc_claimAutoreleasedReturnValue();
    surroundingText = v5->_surroundingText;
    v5->_surroundingText = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("NormalizedBoundingBoxes"));
    v15 = objc_claimAutoreleasedReturnValue();
    normalizedBoundingBoxes = v5->_normalizedBoundingBoxes;
    v5->_normalizedBoundingBoxes = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QueryID"));
    v17 = objc_claimAutoreleasedReturnValue();
    queryID = v5->_queryID;
    v5->_queryID = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIScale"));
    v19 = objc_claimAutoreleasedReturnValue();
    uiScale = v5->_uiScale;
    v5->_uiScale = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EngagementSuggestionType"));
    v21 = objc_claimAutoreleasedReturnValue();
    engagementSuggestionType = v5->_engagementSuggestionType;
    v5->_engagementSuggestionType = (NSString *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVITextLookupRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryTerm, CFSTR("QueryTerm"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_hintDomain, CFSTR("HintDomain"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_surroundingText, CFSTR("SurroundingText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_normalizedBoundingBoxes, CFSTR("NormalizedBoundingBoxes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryID, CFSTR("QueryID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uiScale, CFSTR("UIScale"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_engagementSuggestionType, CFSTR("EngagementSuggestionType"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("queryTerm: %@, "), self->_queryTerm);
  if (self->_hintDomain)
    objc_msgSend(v3, "appendFormat:", CFSTR("hintDomain: %@, "), self->_hintDomain);
  if (self->_surroundingText)
    objc_msgSend(v3, "appendFormat:", CFSTR("surroundingText: %@, "), self->_surroundingText);
  if (self->_normalizedBoundingBoxes)
    objc_msgSend(v3, "appendFormat:", CFSTR("normalizedBoundingBoxes: %@, "), self->_normalizedBoundingBoxes);
  if (self->_queryID)
    objc_msgSend(v3, "appendFormat:", CFSTR("queryID: %@, "), self->_queryID);
  if (self->_uiScale)
    objc_msgSend(v3, "appendFormat:", CFSTR("uiScale: %@, "), self->_uiScale);
  if (self->_engagementSuggestionType)
    objc_msgSend(v3, "appendFormat:", CFSTR("engagementSuggestionType: %@, "), self->_engagementSuggestionType);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (NSString)hintDomain
{
  return self->_hintDomain;
}

- (void)setHintDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)surroundingText
{
  return self->_surroundingText;
}

- (void)setSurroundingText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)normalizedBoundingBoxes
{
  return self->_normalizedBoundingBoxes;
}

- (void)setNormalizedBoundingBoxes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)queryTerm
{
  return self->_queryTerm;
}

- (NSNumber)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)uiScale
{
  return self->_uiScale;
}

- (void)setUiScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)engagementSuggestionType
{
  return self->_engagementSuggestionType;
}

- (void)setEngagementSuggestionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_uiScale, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
  objc_storeStrong((id *)&self->_queryTerm, 0);
  objc_storeStrong((id *)&self->_normalizedBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_surroundingText, 0);
  objc_storeStrong((id *)&self->_hintDomain, 0);
}

@end
