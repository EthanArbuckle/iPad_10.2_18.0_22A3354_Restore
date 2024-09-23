@implementation GKSettingsGlobalFriendListAccessCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[GKSettingsGlobalFriendListAccessCell setTag:](self, "setTag:", 6);
  -[GKSettingsGlobalFriendListAccessCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  -[PSTableCell setSpecifier:](self, "setSpecifier:", v4);
  -[GKSettingsGlobalFriendListAccessCell getSwitch](self, "getSwitch");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOn:", -[GKSettingsGlobalFriendListAccessCell globalFriendListAccess](self, "globalFriendListAccess"));
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", objc_msgSend(v8, "isFriendsSharingRestricted") ^ 1);

}

- (void)controlChanged:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;
  char v16;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "isOn");
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportEvent:type:", CFSTR("com.apple.GameKit.PlayerProfileDashboard"), *MEMORY[0x1E0D24EE0]);

  -[PSSwitchTableCell setLoading:](self, "setLoading:", 1);
  -[GKSettingsGlobalFriendListAccessCell getSwitch](self, "getSwitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8 = objc_msgSend(v7, "isOn");
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profileServicePrivate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__GKSettingsGlobalFriendListAccessCell_controlChanged___block_invoke;
  v12[3] = &unk_1E59C8AD8;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v13 = v11;
  v16 = v5;
  v15 = v8 ^ 1;
  objc_msgSend(v10, "setGlobalFriendListAccess:handler:", v8 ^ 1u, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __55__GKSettingsGlobalFriendListAccessCell_controlChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLoading:", 0);

  if (a2)
    v6 = *(_BYTE *)(a1 + 52) == 0;
  else
    v6 = *(_BYTE *)(a1 + 52) != 0;
  objc_msgSend(*(id *)(a1 + 32), "setOn:", v6);
  v7 = *(unsigned int *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGlobalFriendListAccess:", v7);

  v12 = objc_loadWeakRetained(v4);
  objc_msgSend(v12, "specifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performSetterWithValue:", v11);

}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)globalFriendListAccess
{
  void *v2;
  char v3;
  BOOL v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFriendsSharingRestricted");

  if ((v3 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "globalFriendListAccess") == 0;

  return v4;
}

- (PSSpecifier)specfier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_specfier);
}

- (void)setSpecfier:(id)a3
{
  objc_storeWeak((id *)&self->_specfier, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_specfier);
}

@end
