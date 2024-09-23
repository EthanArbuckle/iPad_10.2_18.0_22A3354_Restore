@implementation GKPlayerActivityRelationshipPlayer

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__GKPlayerActivityRelationshipPlayer_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_261 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_261, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_260;
}

void __61__GKPlayerActivityRelationshipPlayer_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipPlayer;
  objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v6 = CFSTR("playerInternal");
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_260;
  secureCodedPropertyKeys_sSecureCodedKeys_260 = (uint64_t)v2;

}

- (GKPlayerActivityRelationshipPlayer)initWithDictionary:(id)a3
{
  GKPlayerActivityRelationshipPlayer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerActivityRelationshipPlayer;
  v3 = -[GKPlayerActivityRelationshipBase initWithDictionary:](&v11, sel_initWithDictionary_, a3);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[GKPlayerActivityRelationshipBase name](v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlias:", v5);

    -[GKPlayerActivityRelationshipBase identifier](v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlayerID:", v6);

    -[GKPlayerActivityRelationshipBase image](v3, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v12 = CFSTR("template");
      -[GKPlayerActivityRelationshipBase image](v3, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPhotos:", v9);

    }
    -[GKPlayerActivityRelationshipPlayer setPlayerInternal:](v3, "setPlayerInternal:", v4);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GKPlayerActivityRelationshipPlayer;
  -[GKPlayerActivityRelationshipBase description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerActivityRelationshipPlayer playerInternal](self, "playerInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \nplayer: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GKPlayerInternal)playerInternal
{
  return self->_playerInternal;
}

- (void)setPlayerInternal:(id)a3
{
  objc_storeStrong((id *)&self->_playerInternal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerInternal, 0);
}

@end
