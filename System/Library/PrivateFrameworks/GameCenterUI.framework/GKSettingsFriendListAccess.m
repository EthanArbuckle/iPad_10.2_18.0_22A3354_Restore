@implementation GKSettingsFriendListAccess

- (GKSettingsFriendListAccess)init
{
  GKSettingsFriendListAccess *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  GKSettingsFriendListAccess *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKSettingsFriendListAccess;
  v2 = -[GKSettingsFriendListAccess init](&v9, sel_init);
  if (v2)
  {
    GKGameCenterUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSettingsFriendListAccess setTitle:](v2, "setTitle:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25268], "willEnterForeground");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_applicationWillEnterForeground_, v6, 0);

    -[GKSettingsFriendListAccess loadAllGames](v2, "loadAllGames");
    v7 = v2;
  }

  return v2;
}

- (void)loadAllGames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[GKSettingsFriendListAccess games](self, "games");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && !-[GKSettingsFriendListAccess isFriendListSharingRestricted](self, "isFriendListSharingRestricted"))
  {
    -[GKSettingsFriendListAccess setLoadingGames:](self, "setLoadingGames:", 1);
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0D25298];
    -[GKSettingsFriendListAccess localPlayer](self, "localPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxyForPlayer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "gameServicePrivate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__GKSettingsFriendListAccess_loadAllGames__block_invoke;
    v8[3] = &unk_1E59C4878;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "getFriendListAccessForAllGames:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __42__GKSettingsFriendListAccess_loadAllGames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__GKSettingsFriendListAccess_loadAllGames__block_invoke_2;
  v16[3] = &unk_1E59C4850;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setGameSettings:", v9);

  objc_msgSend(v5, "_gkValuesForKeyPath:", CFSTR("bundleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D252C0];
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __42__GKSettingsFriendListAccess_loadAllGames__block_invoke_3;
  v14[3] = &unk_1E59C4878;
  objc_copyWeak(&v15, v10);
  objc_msgSend(v13, "loadGamesWithBundleIDs:withCompletionHandler:", v12, v14);
  objc_destroyWeak(&v15);

}

void __42__GKSettingsFriendListAccess_loadAllGames__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bundleID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __42__GKSettingsFriendListAccess_loadAllGames__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setLoadingGames:", 0);
    objc_msgSend(v4, "setGames:", v5);
    objc_msgSend(v4, "reloadSpecifiers");
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKSettingsFriendListAccess;
  -[GKSettingsFriendListAccess dealloc](&v4, sel_dealloc);
}

- (void)applicationWillEnterForeground:(id)a3
{
  -[GKSettingsFriendListAccess reloadWithClearLocalCache:](self, "reloadWithClearLocalCache:", 1);
}

- (GKLocalPlayer)localPlayer
{
  GKLocalPlayer *localPlayer;

  localPlayer = self->_localPlayer;
  if (localPlayer)
    return localPlayer;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  return (GKLocalPlayer *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setGames:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *games;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3928];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

  games = self->_games;
  self->_games = v8;

}

- (id)loadFreshSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[GKSettingsFriendListAccess table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", 0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSettingsFriendListAccess globalFriendListAccessSpecifier](self, "globalFriendListAccessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  if (-[GKSettingsFriendListAccess loadingGames](self, "loadingGames"))
  {
    -[GKSettingsFriendListAccess loadingSpecifier](self, "loadingSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

  }
  if (!-[GKSettingsFriendListAccess isFriendListSharingRestricted](self, "isFriendListSharingRestricted"))
  {
    if (-[GKSettingsFriendListAccess globalFriendListAccess](self, "globalFriendListAccess"))
    {
      -[GKSettingsFriendListAccess games](self, "games");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        -[GKSettingsFriendListAccess individualBundleIDFriendListAccessSpecifier](self, "individualBundleIDFriendListAccessSpecifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v9);

      }
    }
  }
  return v4;
}

- (void)setLoadingGames:(BOOL)a3
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (a3)
  {
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, 600000023);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__GKSettingsFriendListAccess_setLoadingGames___block_invoke;
    v4[3] = &unk_1E59C48A0;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_loadingGames = 0;
  }
}

void __46__GKSettingsFriendListAccess_setLoadingGames___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((_QWORD *)WeakRetained + 174))
  {
    WeakRetained[1376] = 1;
    v3 = WeakRetained;
    v2 = (id)objc_msgSend(WeakRetained, "loadFreshSpecifiers");
    objc_msgSend(v3, "reloadSpecifiers");
    WeakRetained = v3;
  }

}

- (id)specifiers
{
  objc_class *v3;
  uint64_t v4;
  void *v5;

  -[GKSettingsFriendListAccess loadFreshSpecifiers](self, "loadFreshSpecifiers");
  v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v4 = (int)*MEMORY[0x1E0D80590];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v3;

  return *(id *)((char *)&self->super.super.super.super.super.isa + v4);
}

- (id)globalFriendListAccessSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v5, *MEMORY[0x1E0D80848]);
  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E59EB978, self, sel_setGlobalFriendListAccess_withSpecifier_, 0, 0, 6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  if (-[GKSettingsFriendListAccess isFriendListSharingRestricted](self, "isFriendListSharingRestricted"))
    objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

- (BOOL)globalFriendListAccess
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[GKSettingsFriendListAccess isFriendListSharingRestricted](self, "isFriendListSharingRestricted"))
    return 0;
  -[GKSettingsFriendListAccess localPlayer](self, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "globalFriendListAccess") == 0;

  return v3;
}

- (void)reloadWithClearLocalCache:(BOOL)a3
{
  id v4;

  if (a3)
    -[GKSettingsFriendListAccess setGames:](self, "setGames:", 0);
  -[GKSettingsFriendListAccess loadAllGames](self, "loadAllGames");
  v4 = -[GKSettingsFriendListAccess loadFreshSpecifiers](self, "loadFreshSpecifiers");
  -[GKSettingsFriendListAccess reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)setGlobalFriendListAccess:(__CFBoolean *)a3 withSpecifier:(id)a4
{
  -[GKSettingsFriendListAccess reloadWithClearLocalCache:](self, "reloadWithClearLocalCache:", *MEMORY[0x1E0C9AE50] == (_QWORD)a3, a4);
}

- (id)loadingSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  return v2;
}

- (id)individualBundleIDFriendListAccessSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x1E0D80848]);
  objc_msgSend(v3, "addObject:", v4);
  -[GKSettingsFriendListAccess games](self, "games");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__GKSettingsFriendListAccess_individualBundleIDFriendListAccessSpecifier__block_invoke;
  v12[3] = &unk_1E59C48C8;
  v12[4] = self;
  v8 = v3;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __73__GKSettingsFriendListAccess_individualBundleIDFriendListAccessSpecifier__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D804E8];
  v4 = a2;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, 0, 0, 0, 0, 6, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v9, "setProperty:forKey:", v4, CFSTR("specifier.GKGame"));
  objc_msgSend(*(id *)(a1 + 32), "gameSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v8, CFSTR("specifier.GKGameSettings"));

  objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

- (BOOL)isFriendListSharingRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFriendsSharingRestricted");

  return v3;
}

- (PSSpecifier)globalAccessSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_globalAccessSpecifier);
}

- (void)setGlobalAccessSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_globalAccessSpecifier, a3);
}

- (NSArray)games
{
  return self->_games;
}

- (NSDictionary)gameSettings
{
  return self->_gameSettings;
}

- (void)setGameSettings:(id)a3
{
  objc_storeStrong((id *)&self->_gameSettings, a3);
}

- (void)setLocalPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_localPlayer, a3);
}

- (BOOL)loadingGames
{
  return self->_loadingGames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPlayer, 0);
  objc_storeStrong((id *)&self->_gameSettings, 0);
  objc_storeStrong((id *)&self->_games, 0);
  objc_destroyWeak((id *)&self->_globalAccessSpecifier);
}

@end
