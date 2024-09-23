@implementation AMSRatingSystem

- (AMSRatingSystem)initWithDictionary:(id)a3
{
  id v4;
  AMSRatingSystem *v5;
  uint64_t v6;
  NSString *ratingSystemID;
  uint64_t v8;
  NSString *kind;
  uint64_t v10;
  NSString *label;
  uint64_t v12;
  NSArray *types;
  void *v14;
  uint64_t v15;
  NSArray *contentRatings;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSRatingSystem;
  v5 = -[AMSRatingSystem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    ratingSystemID = v5->_ratingSystemID;
    v5->_ratingSystemID = (NSString *)v6;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.kind"));
    v8 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v8;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.label"));
    v10 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v10;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.types"));
    v12 = objc_claimAutoreleasedReturnValue();
    types = v5->_types;
    v5->_types = (NSArray *)v12;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("relationships.ratings.data"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_112);
    v15 = objc_claimAutoreleasedReturnValue();
    contentRatings = v5->_contentRatings;
    v5->_contentRatings = (NSArray *)v15;

  }
  return v5;
}

AMSContentRating *__38__AMSRatingSystem_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSContentRating contentRatingWithDictionary:](AMSContentRating, "contentRatingWithDictionary:", a2);
}

+ (id)ratingSystemWithDictionary:(id)a3
{
  id v3;
  AMSRatingSystem *v4;

  v3 = a3;
  v4 = -[AMSRatingSystem initWithDictionary:]([AMSRatingSystem alloc], "initWithDictionary:", v3);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSRatingSystem kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("kind"));

  -[AMSRatingSystem ratingSystemID](self, "ratingSystemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("id"));

  -[AMSRatingSystem label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("label"));

  -[AMSRatingSystem types](self, "types");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("types"));

  -[AMSRatingSystem contentRatings](self, "contentRatings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("contentRatings"));

  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)contentRatings
{
  return self->_contentRatings;
}

- (NSString)ratingSystemID
{
  return self->_ratingSystemID;
}

- (NSArray)types
{
  return self->_types;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_ratingSystemID, 0);
  objc_storeStrong((id *)&self->_contentRatings, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
