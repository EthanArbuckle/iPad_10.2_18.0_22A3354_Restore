@implementation HUHomeEnergyWrapper

+ (void)setupGridForecastSnapshotsFor:(id)a3
{
  id v3;
  NSObject *v4;
  HUHomeEnergyManagerHelper *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[HUHomeEnergyWrapper setupGridForecastSnapshotsFor:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  if (v3)
  {
    v5 = -[HUHomeEnergyManagerHelper initWithHome:]([HUHomeEnergyManagerHelper alloc], "initWithHome:", v3);
    -[HUHomeEnergyManagerHelper initializeGridForecastSnapshots](v5, "initializeGridForecastSnapshots");

  }
}

@end
