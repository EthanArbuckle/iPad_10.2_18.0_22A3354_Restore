@implementation CSSiriPreferences

- (CSSiriPreferences)initWithInstanceContext:(id)a3
{
  id v4;
  CSSiriPreferences *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  AFInstanceContext *v8;
  AFInstanceContext *instanceContext;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSiriPreferences;
  v5 = -[CSSiriPreferences init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create(0, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    if (v4)
    {
      v8 = (AFInstanceContext *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CFE8D8], "defaultContext");
      v8 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v8;

  }
  return v5;
}

- (CSSiriPreferences)init
{
  return -[CSSiriPreferences initWithInstanceContext:](self, "initWithInstanceContext:", 0);
}

- (id)overrideAudioSessionActiveDelay
{
  void *v2;
  void *v3;
  id v4;

  _AFPreferencesValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (+[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType") == 3)
    v2 = &unk_1E68A1B48;
  else
    v2 = 0;
  _AFPreferencesValueForKeyWithContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

- (id)serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (+[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType") == 3)
    v2 = &unk_1E68A1B58;
  else
    v2 = 0;
  _AFPreferencesValueForKeyWithContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

- (id)serverAudioSessionActivationDelay
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (+[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType") == 3)
    v2 = &unk_1E68A1B68;
  else
    v2 = 0;
  _AFPreferencesValueForKeyWithContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

- (unint64_t)internalUserClassification
{
  void *v2;
  unint64_t v3;

  _AFBackedUpPreferencesValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if (v3 >= 3)
    return 0;
  else
    return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken_7326 != -1)
    dispatch_once(&sharedPreferences_onceToken_7326, &__block_literal_global_7327);
  return (id)sharedPreferences_sharedPreferences;
}

void __38__CSSiriPreferences_sharedPreferences__block_invoke()
{
  CSSiriPreferences *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [CSSiriPreferences alloc];
  objc_msgSend(MEMORY[0x1E0CFE8D8], "currentContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[CSSiriPreferences initWithInstanceContext:](v0, "initWithInstanceContext:", v3);
  v2 = (void *)sharedPreferences_sharedPreferences;
  sharedPreferences_sharedPreferences = v1;

}

@end
