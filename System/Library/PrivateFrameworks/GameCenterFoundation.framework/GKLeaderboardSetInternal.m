@implementation GKLeaderboardSetInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_241 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_241, &__block_literal_global_242);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_240;
}

void __51__GKLeaderboardSetInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("identifier"), CFSTR("groupIdentifier"), CFSTR("title"), CFSTR("leaderboardIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v10[4] = CFSTR("icons");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_240;
  secureCodedPropertyKeys_sSecureCodedKeys_240 = v8;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKLeaderboardSetInternal identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKLeaderboardSetInternal identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSDictionary)leaderboardIdentifiers
{
  return self->_leaderboardIdentifiers;
}

- (void)setLeaderboardIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardIdentifiers, a3);
}

- (NSDictionary)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_storeStrong((id *)&self->_icons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_leaderboardIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
