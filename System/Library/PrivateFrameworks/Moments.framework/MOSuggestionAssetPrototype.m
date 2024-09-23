@implementation MOSuggestionAssetPrototype

- (id)init:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  MOSuggestionAssetPrototype *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetPrototype;
  v9 = -[MOSuggestionAssetPrototype init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetType, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *assetType;
  id v5;

  assetType = self->_assetType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assetType, CFSTR("MOSuggestionAssetPrototypeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("MOSuggestionAssetPrototypeIdentifier"));

}

- (MOSuggestionAssetPrototype)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetPrototype *v5;
  uint64_t v6;
  NSString *assetType;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOSuggestionAssetPrototype;
  v5 = -[MOSuggestionAssetPrototype init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MOSuggestionAssetPrototypeType"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MOSuggestionAssetPrototypeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

  }
  return v5;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end
