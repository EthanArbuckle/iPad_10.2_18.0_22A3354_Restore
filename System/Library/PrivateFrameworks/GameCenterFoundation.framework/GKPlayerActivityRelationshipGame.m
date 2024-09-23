@implementation GKPlayerActivityRelationshipGame

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__GKPlayerActivityRelationshipGame_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_320 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_320, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_319;
}

void __59__GKPlayerActivityRelationshipGame_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipGame;
  objc_msgSendSuper2(&v6, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v7[0] = CFSTR("adamId");
  v3 = objc_opt_class();
  v7[1] = CFSTR("icon");
  v8[0] = v3;
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_319;
  secureCodedPropertyKeys_sSecureCodedKeys_319 = (uint64_t)v2;

}

- (GKPlayerActivityRelationshipGame)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivityRelationshipGame *v5;
  void *v6;
  GKPlayerActivityRelationshipIcon *v7;
  void *v8;
  GKPlayerActivityRelationshipIcon *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerActivityRelationshipGame;
  v5 = -[GKPlayerActivityRelationshipBase initWithDictionary:](&v11, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adam-id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipGame setAdamId:](v5, "setAdamId:", v6);

    v7 = [GKPlayerActivityRelationshipIcon alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GKPlayerActivityRelationshipIcon initWithDictionary:](v7, "initWithDictionary:", v8);
    -[GKPlayerActivityRelationshipGame setIcon:](v5, "setIcon:", v9);

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
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)GKPlayerActivityRelationshipGame;
  -[GKPlayerActivityRelationshipBase description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipGame adamId](self, "adamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipGame icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \nadamId: %@\nicon: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_adamId, a3);
}

- (GKPlayerActivityRelationshipIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
}

@end
