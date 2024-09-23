@implementation GKGameHighlightInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_308 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_308, &__block_literal_global_309_0);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_307;
}

void __50__GKGameHighlightInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("adamID");
  v10[0] = objc_opt_class();
  v9[1] = CFSTR("artwork");
  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getASCArtworkClass_softClass;
  v8 = getASCArtworkClass_softClass;
  if (!getASCArtworkClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getASCArtworkClass_block_invoke;
    v4[3] = &unk_1E75B3C18;
    v4[4] = &v5;
    __getASCArtworkClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v10[1] = objc_opt_class();
  v9[2] = CFSTR("title");
  v10[2] = objc_opt_class();
  v9[3] = CFSTR("subtitle");
  v10[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_307;
  secureCodedPropertyKeys_sSecureCodedKeys_307 = v2;

}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  self->_adamID = (NSNumber *)a3;
}

- (ASCArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
