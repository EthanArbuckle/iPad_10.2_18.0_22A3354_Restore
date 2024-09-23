@implementation GKSettingsFriendListAccessCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)GKSettingsFriendListAccessCell;
  -[PSSwitchTableCell layoutSubviews](&v29, sel_layoutSubviews);
  -[GKSettingsFriendListAccessCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = (v4 + -29.0) * 0.5;
  -[GKSettingsFriendListAccessCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", 16.0, v5, 29.0, 29.0);

  -[GKSettingsFriendListAccessCell getSwitch](self, "getSwitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  -[GKSettingsFriendListAccessCell imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;

  -[GKSettingsFriendListAccessCell textLabel](self, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;

  v20 = v12 + v14 + 16.0;
  v21 = v9 - v20 + -16.0;
  -[GKSettingsFriendListAccessCell textLabel](self, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v20, v17, v21, v19);

  -[GKSettingsFriendListAccessCell detailTextLabel](self, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;

  -[GKSettingsFriendListAccessCell detailTextLabel](self, "detailTextLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v20, v25, v21, v27);

  -[GKSettingsFriendListAccessCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 60.0, 0.0, 0.0);
}

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id *(*v26)(id *, uint64_t);
  void *v27;
  id v28;
  GKSettingsFriendListAccessCell *v29;

  v4 = a3;
  -[GKSettingsFriendListAccessCell setTag:](self, "setTag:", 6);
  objc_msgSend(v4, "propertyForKey:", CFSTR("specifier.GKGame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSettingsFriendListAccessCell setCurrentGame:](self, "setCurrentGame:", v5);
  objc_msgSend(v4, "propertyForKey:", CFSTR("specifier.GKGameSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSettingsFriendListAccessCell setCurrentGameSettings:](self, "setCurrentGameSettings:", v6);
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __67__GKSettingsFriendListAccessCell_refreshCellContentsWithSpecifier___block_invoke;
  v27 = &unk_1E59C8AB0;
  v7 = v4;
  v28 = v7;
  v29 = self;
  v8 = (id)objc_msgSend(v5, "loadIconForStyle:withCompletionHandler:", 10, &v24);
  -[GKSettingsFriendListAccessCell detailTextLabel](self, "detailTextLabel", v24, v25, v26, v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v10);

  -[GKSettingsFriendListAccessCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v5, "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "compatiblePlatforms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D252C8], "currentPlatformServerString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "containsObject:", v15);

  if ((v16 & 1) == 0)
  {
    -[GKSettingsFriendListAccessCell detailTextLabel](self, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D252C0];
    objc_msgSend(v14, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "platformDisplayString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v21);

  }
  -[GKSettingsFriendListAccessCell getSwitch](self, "getSwitch");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSettingsFriendListAccessCell currentGameSettings](self, "currentGameSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setOn:", objc_msgSend(v23, "allowFriendListAccess") == 2);

}

id *__67__GKSettingsFriendListAccessCell_refreshCellContentsWithSpecifier___block_invoke(id *result, uint64_t a2)
{
  id *v2;
  id v3;
  objc_super v4;

  if (a2)
  {
    v2 = result;
    objc_msgSend(result[4], "setProperty:forKey:", a2, *MEMORY[0x1E0D80870]);
    v3 = v2[4];
    v4.receiver = v2[5];
    v4.super_class = (Class)GKSettingsFriendListAccessCell;
    return (id *)objc_msgSendSuper2(&v4, sel_refreshCellContentsWithSpecifier_, v3);
  }
  return result;
}

- (void)controlChanged:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  char v19;

  v4 = objc_msgSend(a3, "isOn");
  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D24EE8];
  -[GKSettingsFriendListAccessCell currentGameSettings](self, "currentGameSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:type:bundleID:", CFSTR("com.apple.GameKit.PlayerProfileDashboard"), v6, v8);

  v9 = CFSTR("denied");
  if (v4)
    v9 = CFSTR("allowed");
  v10 = v9;
  -[GKSettingsFriendListAccessCell getSwitch](self, "getSwitch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "gameServicePrivate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSettingsFriendListAccessCell currentGameSettings](self, "currentGameSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__GKSettingsFriendListAccessCell_controlChanged___block_invoke;
  v17[3] = &unk_1E59C75F0;
  v18 = v11;
  v19 = v4;
  v16 = v11;
  objc_msgSend(v13, "submitFriendListAccess:value:handler:", v15, v10, v17);

}

uint64_t __49__GKSettingsFriendListAccessCell_controlChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;

  if (a2)
    v2 = *(_BYTE *)(a1 + 40) == 0;
  else
    v2 = *(_BYTE *)(a1 + 40) != 0;
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", v2);
}

- (BOOL)canReload
{
  return 1;
}

- (GKGame)currentGame
{
  return self->_currentGame;
}

- (void)setCurrentGame:(id)a3
{
  objc_storeStrong((id *)&self->_currentGame, a3);
}

- (GKGameSettingsInternal)currentGameSettings
{
  return self->_currentGameSettings;
}

- (void)setCurrentGameSettings:(id)a3
{
  objc_storeStrong((id *)&self->_currentGameSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGameSettings, 0);
  objc_storeStrong((id *)&self->_currentGame, 0);
}

@end
