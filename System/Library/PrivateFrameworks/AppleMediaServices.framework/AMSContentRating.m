@implementation AMSContentRating

- (AMSContentRating)initWithDictionary:(id)a3
{
  id v4;
  AMSContentRating *v5;
  uint64_t v6;
  NSString *contentRatingID;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *imageURL;
  uint64_t v18;
  NSString *kind;
  uint64_t v20;
  NSString *label;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *ratingDescription;
  uint64_t v26;
  NSNumber *value;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AMSContentRating;
  v5 = -[AMSContentRating init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentRatingID = v5->_contentRatingID;
    v5->_contentRatingID = (NSString *)v6;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.glyph.url"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.glyph.height"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.glyph.width"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{c}"), &stru_1E2548760);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{h}"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{f}"), CFSTR("png"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v16;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.kind"));
    v18 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v18;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.label"));
    v20 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v20;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.name"));
    v22 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v22;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.description"));
    v24 = objc_claimAutoreleasedReturnValue();
    ratingDescription = v5->_ratingDescription;
    v5->_ratingDescription = (NSString *)v24;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("attributes.value"));
    v26 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v26;

  }
  return v5;
}

+ (id)contentRatingWithDictionary:(id)a3
{
  id v3;
  AMSContentRating *v4;

  v3 = a3;
  v4 = -[AMSContentRating initWithDictionary:]([AMSContentRating alloc], "initWithDictionary:", v3);

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
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSContentRating kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("kind"));

  -[AMSContentRating label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("label"));

  -[AMSContentRating name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("name"));

  -[AMSContentRating imageURL](self, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("imageURL"));

  -[AMSContentRating contentRatingID](self, "contentRatingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("id"));

  -[AMSContentRating value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v9, CFSTR("value"));

  -[AMSContentRating ratingDescription](self, "ratingDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v10, CFSTR("description"));

  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)contentRatingID
{
  return self->_contentRatingID;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (NSNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_contentRatingID, 0);
}

@end
