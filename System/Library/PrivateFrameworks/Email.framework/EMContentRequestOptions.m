@implementation EMContentRequestOptions

+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4
{
  +[EMContentRequestOptions optionsWithRequestedRepresentationType:networkUsage:includeSuggestions:](EMContentRequestOptions, "optionsWithRequestedRepresentationType:networkUsage:includeSuggestions:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4 includeSuggestionItems:(BOOL)a5
{
  uint64_t v5;

  if (a5)
    v5 = 2;
  else
    v5 = 0;
  +[EMContentRequestOptions optionsWithRequestedRepresentationType:networkUsage:includeSuggestions:](EMContentRequestOptions, "optionsWithRequestedRepresentationType:networkUsage:includeSuggestions:", a3, a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)optionsWithRequestedRepresentationType:(id)a3 networkUsage:(int64_t)a4 includeSuggestions:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  int64_t v16;

  v8 = a3;
  v9 = objc_alloc((Class)a1);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__EMContentRequestOptions_optionsWithRequestedRepresentationType_networkUsage_includeSuggestions___block_invoke;
  v13[3] = &unk_1E70F27D8;
  v10 = v8;
  v14 = v10;
  v15 = a4;
  v16 = a5;
  v11 = (void *)objc_msgSend(v9, "initWithBuilder:", v13);

  return v11;
}

void __98__EMContentRequestOptions_optionsWithRequestedRepresentationType_networkUsage_includeSuggestions___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRequestedRepresentation:", a1[4]);
  objc_msgSend(v3, "setNetworkUsage:", a1[5]);
  objc_msgSend(v3, "setIncludeSuggestionItems:", a1[6]);

}

- (EMContentRequestOptions)initWithBuilder:(id)a3
{
  void (**v4)(id, EMContentRequestOptions *);
  EMContentRequestOptions *v5;
  objc_super v7;

  v4 = (void (**)(id, EMContentRequestOptions *))a3;
  v7.receiver = self;
  v7.super_class = (Class)EMContentRequestOptions;
  v5 = -[EMContentRequestOptions init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (EMContentRequestOptions)init
{
  return -[EMContentRequestOptions initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_6);
}

void __31__EMContentRequestOptions_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setRequestedRepresentation:", CFSTR("raw"));
  objc_msgSend(v2, "setNetworkUsage:", 0);
  objc_msgSend(v2, "setIncludeSuggestionItems:", 0);

}

- (id)copyWithBuilder:(id)a3
{
  void (**v4)(id, void *);
  void *v5;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[EMContentRequestOptions copy](self, "copy");
  v4[2](v4, v5);

  return v5;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[EMContentRequestOptions requestedRepresentation](self, "requestedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> requestedRepresentation=%@, networkUsage=%ld"), v4, self, v5, -[EMContentRequestOptions networkUsage](self, "networkUsage"));

  return v6;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[EMContentRequestOptions requestedRepresentation](self, "requestedRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EMContentRequestOptions networkUsage](self, "networkUsage");
  v7 = -[EMContentRequestOptions requestAllHeaders](self, "requestAllHeaders");
  -[EMContentRequestOptions requestedHeaderKeys](self, "requestedHeaderKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> requestedRepresentation=%@, networkUsage=%d, requestAllHeaders=%{BOOL}d, requestedHeaders=%@, includeCachedMetadataJSON=%{BOOL}d, maximumNumberOfOriginalContentMessagesToRequest=%lu"), v4, self, v5, v6, v7, v8, -[EMContentRequestOptions includeCachedMetadataJSON](self, "includeCachedMetadataJSON"), -[EMContentRequestOptions maximumNumberOfOriginalContentMessagesToRequest](self, "maximumNumberOfOriginalContentMessagesToRequest"));

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMContentRequestOptions)initWithCoder:(id)a3
{
  id v4;
  EMContentRequestOptions *v5;
  uint64_t v6;
  NSString *requestedRepresentation;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *requestedHeaderKeys;

  v4 = a3;
  v5 = -[EMContentRequestOptions init](self, "init");
  if (v5)
  {
    v5->_networkUsage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_networkUsage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_requestedRepresentation"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestedRepresentation = v5->_requestedRepresentation;
    v5->_requestedRepresentation = (NSString *)v6;

    v5->_includeSuggestionItems = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_includeSuggestionItems"));
    v5->_requestAllHeaders = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_requestAllHeaders"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("EFPropertyKey_requestedHeaderKeys"));
    v11 = objc_claimAutoreleasedReturnValue();
    requestedHeaderKeys = v5->_requestedHeaderKeys;
    v5->_requestedHeaderKeys = (NSArray *)v11;

    v5->_includeCachedMetadataJSON = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_includeCachedMetadataJSON"));
    v5->_maximumNumberOfOriginalContentMessagesToRequest = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_maximumNumberOfOriginalContentMessagesToRequest"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMContentRequestOptions networkUsage](self, "networkUsage"), CFSTR("EFPropertyKey_networkUsage"));
  -[EMContentRequestOptions requestedRepresentation](self, "requestedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_requestedRepresentation"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[EMContentRequestOptions includeSuggestionItems](self, "includeSuggestionItems"), CFSTR("EFPropertyKey_includeSuggestionItems"));
  objc_msgSend(v6, "encodeBool:forKey:", -[EMContentRequestOptions requestAllHeaders](self, "requestAllHeaders"), CFSTR("EFPropertyKey_requestAllHeaders"));
  -[EMContentRequestOptions requestedHeaderKeys](self, "requestedHeaderKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_requestedHeaderKeys"));

  objc_msgSend(v6, "encodeBool:forKey:", -[EMContentRequestOptions includeCachedMetadataJSON](self, "includeCachedMetadataJSON"), CFSTR("EFPropertyKey_includeCachedMetadataJSON"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMContentRequestOptions maximumNumberOfOriginalContentMessagesToRequest](self, "maximumNumberOfOriginalContentMessagesToRequest"), CFSTR("EFPropertyKey_maximumNumberOfOriginalContentMessagesToRequest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD v6[5];

  v4 = objc_alloc((Class)objc_opt_class());
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__EMContentRequestOptions_copyWithZone___block_invoke;
  v6[3] = &unk_1E70F2820;
  v6[4] = self;
  return (id)objc_msgSend(v4, "initWithBuilder:", v6);
}

void __40__EMContentRequestOptions_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setIncludeSuggestionItems:", objc_msgSend(*(id *)(a1 + 32), "includeSuggestionItems"));
  objc_msgSend(*(id *)(a1 + 32), "requestedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestedRepresentation:", v3);

  objc_msgSend(v5, "setNetworkUsage:", objc_msgSend(*(id *)(a1 + 32), "networkUsage"));
  objc_msgSend(v5, "setRequestAllHeaders:", objc_msgSend(*(id *)(a1 + 32), "requestAllHeaders"));
  objc_msgSend(*(id *)(a1 + 32), "requestedHeaderKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestedHeaderKeys:", v4);

  objc_msgSend(v5, "setIncludeCachedMetadataJSON:", objc_msgSend(*(id *)(a1 + 32), "includeCachedMetadataJSON"));
  objc_msgSend(v5, "setMaximumNumberOfOriginalContentMessagesToRequest:", objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfOriginalContentMessagesToRequest"));

}

- (NSString)requestedRepresentation
{
  return self->_requestedRepresentation;
}

- (void)setRequestedRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)networkUsage
{
  return self->_networkUsage;
}

- (void)setNetworkUsage:(int64_t)a3
{
  self->_networkUsage = a3;
}

- (int64_t)includeSuggestionItems
{
  return self->_includeSuggestionItems;
}

- (void)setIncludeSuggestionItems:(int64_t)a3
{
  self->_includeSuggestionItems = a3;
}

- (BOOL)includeCachedMetadataJSON
{
  return self->_includeCachedMetadataJSON;
}

- (void)setIncludeCachedMetadataJSON:(BOOL)a3
{
  self->_includeCachedMetadataJSON = a3;
}

- (BOOL)requestAllHeaders
{
  return self->_requestAllHeaders;
}

- (void)setRequestAllHeaders:(BOOL)a3
{
  self->_requestAllHeaders = a3;
}

- (NSArray)requestedHeaderKeys
{
  return self->_requestedHeaderKeys;
}

- (void)setRequestedHeaderKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)maximumNumberOfOriginalContentMessagesToRequest
{
  return self->_maximumNumberOfOriginalContentMessagesToRequest;
}

- (void)setMaximumNumberOfOriginalContentMessagesToRequest:(unint64_t)a3
{
  self->_maximumNumberOfOriginalContentMessagesToRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedHeaderKeys, 0);
  objc_storeStrong((id *)&self->_requestedRepresentation, 0);
}

@end
