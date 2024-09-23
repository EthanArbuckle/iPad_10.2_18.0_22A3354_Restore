@implementation ATXSuggestionSearchResult

- (void)setProactiveSuggestion:(id)a3
{
  ATXProactiveSuggestion *v5;
  ATXProactiveSuggestion *v6;

  v5 = (ATXProactiveSuggestion *)a3;
  if (self->_proactiveSuggestion != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_proactiveSuggestion, a3);
    v5 = v6;
  }

}

- (void)setBlendingModelUICacheUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_blendingModelUICacheUpdateUUID, a3);
}

- (void)setContextActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextActionIdentifier, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXSuggestionSearchResult;
  v4 = -[ATXSuggestionSearchResult copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[ATXSuggestionSearchResult proactiveSuggestion](self, "proactiveSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setProactiveSuggestion:", v6);

  -[ATXSuggestionSearchResult blendingModelUICacheUpdateUUID](self, "blendingModelUICacheUpdateUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setBlendingModelUICacheUpdateUUID:", v8);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSuggestionSearchResult)initWithCoder:(id)a3
{
  id v4;
  ATXSuggestionSearchResult *v5;
  uint64_t v6;
  ATXProactiveSuggestion *proactiveSuggestion;
  uint64_t v8;
  NSUUID *blendingModelUICacheUpdateUUID;
  uint64_t v10;
  ATXContextActionIdentifier *contextActionIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSuggestionSearchResult;
  v5 = -[ATXSuggestionSearchResult initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proactiveSuggestion"));
    v6 = objc_claimAutoreleasedReturnValue();
    proactiveSuggestion = v5->_proactiveSuggestion;
    v5->_proactiveSuggestion = (ATXProactiveSuggestion *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blendingCacheUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    blendingModelUICacheUpdateUUID = v5->_blendingModelUICacheUpdateUUID;
    v5->_blendingModelUICacheUpdateUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextActionIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    contextActionIdentifier = v5->_contextActionIdentifier;
    v5->_contextActionIdentifier = (ATXContextActionIdentifier *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ATXProactiveSuggestion *proactiveSuggestion;
  id v5;
  objc_super v6;

  proactiveSuggestion = self->_proactiveSuggestion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", proactiveSuggestion, CFSTR("proactiveSuggestion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blendingModelUICacheUpdateUUID, CFSTR("blendingCacheUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextActionIdentifier, CFSTR("contextActionIdentifier"));
  v6.receiver = self;
  v6.super_class = (Class)ATXSuggestionSearchResult;
  -[ATXSuggestionSearchResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (ATXProactiveSuggestion)proactiveSuggestion
{
  return self->_proactiveSuggestion;
}

- (NSUUID)blendingModelUICacheUpdateUUID
{
  return self->_blendingModelUICacheUpdateUUID;
}

- (ATXContextActionIdentifier)contextActionIdentifier
{
  return self->_contextActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextActionIdentifier, 0);
  objc_storeStrong((id *)&self->_blendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestion, 0);
}

@end
