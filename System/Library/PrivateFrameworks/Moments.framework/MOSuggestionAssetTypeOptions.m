@implementation MOSuggestionAssetTypeOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestedTypes, CFSTR("types"));
}

- (MOSuggestionAssetTypeOptions)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetTypeOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *requestedTypes;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetTypeOptions;
  v5 = -[MOSuggestionAssetTypeOptions init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("types"));
    v9 = objc_claimAutoreleasedReturnValue();
    requestedTypes = v5->_requestedTypes;
    v5->_requestedTypes = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)requestedTypes
{
  return self->_requestedTypes;
}

- (void)setRequestedTypes:(id)a3
{
  objc_storeStrong((id *)&self->_requestedTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedTypes, 0);
}

@end
