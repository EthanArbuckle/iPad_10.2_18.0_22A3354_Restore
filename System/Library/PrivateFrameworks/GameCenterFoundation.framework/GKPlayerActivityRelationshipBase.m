@implementation GKPlayerActivityRelationshipBase

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_232 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_232, &__block_literal_global_233_0);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_231;
}

void __59__GKPlayerActivityRelationshipBase_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("name");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("image");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("identifier");
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_231;
  secureCodedPropertyKeys_sSecureCodedKeys_231 = v0;

}

- (GKPlayerActivityRelationshipBase)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivityRelationshipBase *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKPlayerActivityRelationshipBase;
  v5 = -[GKPlayerActivityRelationshipBase init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipBase setName:](v5, "setName:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipBase setImage:](v5, "setImage:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipBase setIdentifier:](v5, "setIdentifier:", v8);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKPlayerActivityRelationshipBase identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipBase name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipBase image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("id: %@\nname: %@ \nimage: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
