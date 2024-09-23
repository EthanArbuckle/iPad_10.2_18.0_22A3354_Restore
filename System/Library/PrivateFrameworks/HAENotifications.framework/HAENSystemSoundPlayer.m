@implementation HAENSystemSoundPlayer

+ (id)sharedInstance
{
  if (sharedInstance_once_3 != -1)
    dispatch_once(&sharedInstance_once_3, &__block_literal_global_5);
  return (id)sharedInstance_instance_3;
}

void __39__HAENSystemSoundPlayer_sharedInstance__block_invoke()
{
  HAENSystemSoundPlayer *v0;
  void *v1;

  v0 = objc_alloc_init(HAENSystemSoundPlayer);
  v1 = (void *)sharedInstance_instance_3;
  sharedInstance_instance_3 = (uint64_t)v0;

}

- (HAENSystemSoundPlayer)init
{
  HAENSystemSoundPlayer *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSDictionary *options;
  NSObject *v12;
  NSObject *v13;
  NSDictionary *v14;
  objc_super v16;
  uint8_t buf[4];
  NSDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)HAENSystemSoundPlayer;
  v2 = -[HAENSystemSoundPlayer init](&v16, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BDB6D38];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDB6D40];
    LODWORD(v8) = 1.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v6, v7, v9, *MEMORY[0x24BDB6D58], 0);
    v10 = objc_claimAutoreleasedReturnValue();
    options = v2->_options;
    v2->_options = (NSDictionary *)v10;

    v2->_turnOFFSound = 0;
    if (MGGetBoolAnswer())
    {
      CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio"));
      if (CFPreferencesGetAppBooleanValue(CFSTR("haen_soundoff"), CFSTR("com.apple.coreaudio"), 0))
      {
        v2->_turnOFFSound = 1;
        HAENotificationsLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2144B3000, v12, OS_LOG_TYPE_DEFAULT, "Setting HAEN Sounds off", buf, 2u);
        }

      }
    }
    HAENotificationsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v2->_options;
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_2144B3000, v13, OS_LOG_TYPE_INFO, "System Sound Options: %@", buf, 0xCu);
    }

  }
  return v2;
}

- (id)playSystemSoundWithEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_signpost_id_t v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  HAENotificationsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v11;
    _os_signpost_emit_with_name_impl(&dword_2144B3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HAENSSPlayed", "%@", (uint8_t *)&v13, 0xCu);

  }
  if (!self->_turnOFFSound)
    AudioServicesPlaySystemSoundWithOptions();

  return 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HAENSystemSoundPlayer;
  -[HAENSystemSoundPlayer dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
