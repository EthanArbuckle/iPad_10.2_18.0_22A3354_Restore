@implementation ANVolumeController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ANVolumeController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (id)sharedController_controller;
}

void __38__ANVolumeController_sharedController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedController_controller;
  sharedController_controller = v0;

}

- (void)setVolumeWithOptions:(unint64_t)a3
{
  char v3;
  float v4;
  float v5;
  void *v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  -[ANVolumeController smartSiriVolume](self, "smartSiriVolume");
  if ((v3 & 1) != 0)
  {
    v5 = v4;
    if (v4 != -1.0)
    {
      objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v7 = v5;
      v8 = objc_msgSend(v6, "setVolumeTo:forCategory:", CFSTR("VoiceCommand"), v7);

      if (ANLogHandleVolumeController_once != -1)
        dispatch_once(&ANLogHandleVolumeController_once, &__block_literal_global_0);
      v9 = (id)ANLogHandleVolumeController_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(float *)&v10 = v5;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412802;
        v14 = &stru_24D370F00;
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_2156FF000, v9, OS_LOG_TYPE_DEFAULT, "%@Volume set to %@ = %@", (uint8_t *)&v13, 0x20u);

      }
    }
  }
}

- (float)smartSiriVolume
{
  return -1.0;
}

@end
