@implementation MODefaultSettingsManagerDelegate

- (void)onStateChange:(BOOL)a3 forSetting:(unint64_t)a4
{
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2422B0000, v6, OS_LOG_TYPE_DEFAULT, "MODefaultSettingsManagerDelegate onStateChange:%@ forSetting:%@", (uint8_t *)&v9, 0x16u);

  }
}

@end
