@implementation GKAnonymousGuestPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAnonymousGuestPlayerInternal)initWithHostPlayerInternal:(id)a3 guestIdentifier:(id)a4
{
  id v7;
  id v8;
  GKAnonymousGuestPlayerInternal *v9;
  GKAnonymousGuestPlayerInternal *v10;
  uint64_t v11;
  NSString *guestIdentifier;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GKAnonymousGuestPlayerInternal;
  v9 = -[GKAnonymousGuestPlayerInternal init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hostPlayerInternal, a3);
    v11 = objc_msgSend(v8, "copy");
    guestIdentifier = v10->_guestIdentifier;
    v10->_guestIdentifier = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E0CB3940];
    +[GCFLocalizedStrings GUEST_DEFAULT_ALIAS_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "GUEST_DEFAULT_ALIAS_FORMAT");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alias");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerInternal setAlias:](v10, "setAlias:", v16);

  }
  return v10;
}

- (id)playerID
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKPlayerInternal playerID](self->_hostPlayerInternal, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%@"), v4, CFSTR("_"), self->_guestIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isGuestPlayer
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__GKAnonymousGuestPlayerInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_613 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_613, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_612;
}

void __57__GKAnonymousGuestPlayerInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
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
  v6.super_class = (Class)&OBJC_METACLASS___GKAnonymousGuestPlayerInternal;
  objc_msgSendSuper2(&v6, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v7[0] = CFSTR("guestIdentifier");
  v3 = objc_opt_class();
  v7[1] = CFSTR("hostPlayerInternal");
  v8[0] = v3;
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_612;
  secureCodedPropertyKeys_sSecureCodedKeys_612 = (uint64_t)v2;

}

- (GKPlayerInternal)hostPlayerInternal
{
  return self->_hostPlayerInternal;
}

- (void)setHostPlayerInternal:(id)a3
{
  objc_storeStrong((id *)&self->_hostPlayerInternal, a3);
}

- (id)guestIdentifier
{
  return self->_guestIdentifier;
}

- (void)setGuestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_guestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestIdentifier, 0);
  objc_storeStrong((id *)&self->_hostPlayerInternal, 0);
}

@end
