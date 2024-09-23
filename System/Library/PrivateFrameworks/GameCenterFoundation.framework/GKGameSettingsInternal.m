@implementation GKGameSettingsInternal

- (id)serverAllowFriendListAccessValue
{
  int64_t v2;

  v2 = -[GKGameSettingsInternal allowFriendListAccess](self, "allowFriendListAccess");
  if ((unint64_t)(v2 - 1) > 2)
    return 0;
  else
    return off_1E75B58A0[v2 - 1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAllowFriendListAccess:", -[GKGameSettingsInternal allowFriendListAccess](self, "allowFriendListAccess"));
  -[GKGameSettingsInternal bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleID:", v5);

  return v4;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_8 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_8, &__block_literal_global_37);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_8;
}

void __49__GKGameSettingsInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("bundleID");
  v2[1] = CFSTR("allowFriendListAccess");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_8;
  secureCodedPropertyKeys_sSecureCodedKeys_8 = v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKGameSettingsInternal;
  v4 = a3;
  -[GKInternalRepresentation encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[GKGameSettingsInternal bundleID](self, "bundleID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKGameSettingsInternal allowFriendListAccess](self, "allowFriendListAccess"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("allowFriendListAccess"));

}

- (GKGameSettingsInternal)initWithCoder:(id)a3
{
  id v4;
  GKGameSettingsInternal *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKGameSettingsInternal;
  v5 = -[GKInternalRepresentation initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSettingsInternal setBundleID:](v5, "setBundleID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowFriendListAccess"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSettingsInternal setAllowFriendListAccess:](v5, "setAllowFriendListAccess:", objc_msgSend(v7, "integerValue"));

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[GKGameSettingsInternal bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSettingsInternal allowFriendListAccessString](self, "allowFriendListAccessString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("                <%@: %p>\n                bundleID: %@\n                allowFriendListAccess: %@            "), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allowFriendListAccessString
{
  unint64_t v2;

  v2 = -[GKGameSettingsInternal allowFriendListAccess](self, "allowFriendListAccess");
  if (v2 > 3)
    return CFSTR("GKAllowFriendListAccessInvalid");
  else
    return off_1E75B58B8[v2];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (int64_t)allowFriendListAccess
{
  return self->_allowFriendListAccess;
}

- (void)setAllowFriendListAccess:(int64_t)a3
{
  self->_allowFriendListAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
