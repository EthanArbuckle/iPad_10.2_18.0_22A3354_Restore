@implementation SUUISettingsGroupController

- (void)attachSettingDescription:(id)a3
{
  id v4;
  NSMutableArray *settingDescriptions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  settingDescriptions = self->_settingDescriptions;
  v8 = v4;
  if (!settingDescriptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_settingDescriptions;
    self->_settingDescriptions = v6;

    v4 = v8;
    settingDescriptions = self->_settingDescriptions;
  }
  -[NSMutableArray addObject:](settingDescriptions, "addObject:", v4);
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_2572295B8))
    objc_msgSend(v8, "setController:", self);

}

- (void)_reloadSettingDescription:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "settingsGroupController:reloadSettingDescription:", self, v7);

  }
}

- (id)_viewForSettingDescription:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "settingsGroupController:viewForSettingDescription:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SUUISettingsGroupControllerDelegate)delegate
{
  return (SUUISettingsGroupControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)settingDescriptions
{
  return self->_settingDescriptions;
}

- (void)setSettingDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_settingDescriptions, a3);
}

- (SUUISettingsGroupDescription)settingsGroupDescription
{
  return self->_settingsGroupDescription;
}

- (void)setSettingsGroupDescription:(id)a3
{
  objc_storeStrong((id *)&self->_settingsGroupDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsGroupDescription, 0);
  objc_storeStrong((id *)&self->_settingDescriptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
