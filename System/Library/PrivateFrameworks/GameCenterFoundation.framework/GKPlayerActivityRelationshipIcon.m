@implementation GKPlayerActivityRelationshipIcon

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__GKPlayerActivityRelationshipIcon_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_284 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_284, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_283;
}

void __59__GKPlayerActivityRelationshipIcon_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKPlayerActivityRelationshipIcon;
  objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v6[0] = CFSTR("url");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("platform");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("width");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("height");
  v7[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_283;
  secureCodedPropertyKeys_sSecureCodedKeys_283 = (uint64_t)v2;

}

- (GKPlayerActivityRelationshipIcon)initWithDictionary:(id)a3
{
  id v4;
  GKPlayerActivityRelationshipIcon *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKPlayerActivityRelationshipIcon;
  v5 = -[GKPlayerActivityRelationshipIcon init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipIcon setUrl:](v5, "setUrl:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipIcon setPlatform:](v5, "setPlatform:", +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:](GKGameDescriptor, "gamePlatformFromServerGameDescriptorString:", v7));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("width"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipIcon setWidth:](v5, "setWidth:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerActivityRelationshipIcon setHeight:](v5, "setHeight:", v9);

  }
  return v5;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setWidth:(id)a3
{
  self->_width = (NSNumber *)a3;
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  self->_height = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
