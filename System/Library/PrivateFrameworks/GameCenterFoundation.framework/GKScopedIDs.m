@implementation GKScopedIDs

+ (id)makePlayerIDtoScopedIDsDictFromScopedIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "playerID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_12 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_12, &__block_literal_global_49);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_12;
}

void __38__GKScopedIDs_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("createdPersistent");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("playerID");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("gameBundleID");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("gamePlayerID");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("teamPlayerID");
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_12;
  secureCodedPropertyKeys_sSecureCodedKeys_12 = v0;

}

- (GKScopedIDs)initWithPersistentPlayerID:(id)a3 gameBundleID:(id)a4 gamePlayerID:(id)a5 teamPlayerID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GKScopedIDs *v15;
  uint64_t v16;
  NSNumber *createdPersistent;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GKScopedIDs;
  v15 = -[GKScopedIDs init](&v19, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v16 = objc_claimAutoreleasedReturnValue();
    createdPersistent = v15->_createdPersistent;
    v15->_createdPersistent = (NSNumber *)v16;

    objc_storeStrong((id *)&v15->_playerID, a3);
    objc_storeStrong((id *)&v15->_gameBundleID, a4);
    objc_storeStrong((id *)&v15->_gamePlayerID, a5);
    objc_storeStrong((id *)&v15->_teamPlayerID, a6);
  }

  return v15;
}

- (GKScopedIDs)initWithNonpersistentPlayerID:(id)a3 gameBundleID:(id)a4 salt:(int)a5
{
  uint64_t v5;
  id v9;
  id v10;
  GKScopedIDs *v11;
  uint64_t v12;
  NSNumber *createdPersistent;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *gamePlayerID;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *teamPlayerID;
  objc_super v23;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GKScopedIDs;
  v11 = -[GKScopedIDs init](&v23, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    createdPersistent = v11->_createdPersistent;
    v11->_createdPersistent = (NSNumber *)v12;

    objc_storeStrong((id *)&v11->_playerID, a3);
    objc_storeStrong((id *)&v11->_gameBundleID, a4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A:%@:%@:%d"), v9, v10, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_gkSHA256HashData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_gkAsHexString");
    v16 = objc_claimAutoreleasedReturnValue();
    gamePlayerID = v11->_gamePlayerID;
    v11->_gamePlayerID = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("T:%@:%@:%d"), v9, v10, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_gkSHA256HashData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_gkAsHexString");
    v20 = objc_claimAutoreleasedReturnValue();
    teamPlayerID = v11->_teamPlayerID;
    v11->_teamPlayerID = (NSString *)v20;

  }
  return v11;
}

- (BOOL)arePersistent
{
  void *v2;
  char v3;

  -[GKScopedIDs createdPersistent](self, "createdPersistent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isForPlayerID:(id)a3 gameBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = a3;
  -[GKScopedIDs playerID](self, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if (v9)
  {
    -[GKScopedIDs gameBundleID](self, "gameBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)makePersistentWithPlayerID:(id)a3 gameBundleID:(id)a4 gamePlayerID:(id)a5 teamPlayerID:(id)a6
{
  GKScopedIDs *v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = 0;
  if (a3 && a4 && a5 && a6)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = a3;
    v6 = -[GKScopedIDs initWithPersistentPlayerID:gameBundleID:gamePlayerID:teamPlayerID:]([GKScopedIDs alloc], "initWithPersistentPlayerID:gameBundleID:gamePlayerID:teamPlayerID:", v13, v12, v11, v10);

  }
  return v6;
}

+ (id)makeNonpersistentWithPlayerID:(id)a3 gameBundleID:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  GKScopedIDs *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  GKScopedIDs *v11;

  v5 = (__CFString *)a4;
  v6 = (__CFString *)a3;
  v7 = [GKScopedIDs alloc];
  if (v6)
    v8 = v6;
  else
    v8 = CFSTR("UnknownID");
  if (v5)
    v9 = v5;
  else
    v9 = CFSTR("UnknownBundleID");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GKScopedIDs initWithNonpersistentPlayerID:gameBundleID:salt:](v7, "initWithNonpersistentPlayerID:gameBundleID:salt:", v8, v9, objc_msgSend(v10, "processIdentifier"));

  return v11;
}

+ (BOOL)availableForPlayerID:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("AnonymousID")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("AutoMatchID")) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UnknownID")) ^ 1;
  }

  return v5;
}

- (NSNumber)createdPersistent
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCreatedPersistent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)playerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)gameBundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)gamePlayerID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)teamPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamPlayerID, 0);
  objc_storeStrong((id *)&self->_gamePlayerID, 0);
  objc_storeStrong((id *)&self->_gameBundleID, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_createdPersistent, 0);
}

@end
