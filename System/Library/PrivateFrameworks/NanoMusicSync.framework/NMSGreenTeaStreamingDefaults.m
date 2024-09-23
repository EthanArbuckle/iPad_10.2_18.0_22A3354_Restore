@implementation NMSGreenTeaStreamingDefaults

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NMSGreenTeaStreamingDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___sharedInstance;
}

void __46__NMSGreenTeaStreamingDefaults_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;

}

- (NMSGreenTeaStreamingDefaults)init
{
  NMSGreenTeaStreamingDefaults *v2;
  uint64_t v3;
  NSUserDefaults *sharedDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NMSGreenTeaStreamingDefaults;
  v2 = -[NMSGreenTeaStreamingDefaults init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.NanoMusicSync"));
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (BOOL)greenTeaMusicIsMirroringStreamingSettings
{
  return -[NMSGreenTeaStreamingDefaults _BOOLForKey:](self, "_BOOLForKey:", CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored"));
}

- (void)setGreenTeaMusicIsMirroringStreamingSettings:(BOOL)a3
{
  -[NMSGreenTeaStreamingDefaults _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("GreenTeaMobileIpodCellularKeysAreMirrored"));
}

- (BOOL)greenTeaMusicAllowCellularForStreaming
{
  return -[NMSGreenTeaStreamingDefaults _BOOLForKey:](self, "_BOOLForKey:", CFSTR("GreenTeaMusicAllowsCellularData"));
}

- (void)setGreenTeaMusicAllowCellularForStreaming:(BOOL)a3
{
  -[NMSGreenTeaStreamingDefaults _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("GreenTeaMusicAllowsCellularData"));
}

- (BOOL)greenTeaMusicAllowCellularForHighQualityStreaming
{
  return -[NMSGreenTeaStreamingDefaults _BOOLForKey:](self, "_BOOLForKey:", CFSTR("GreenTeaMusicAllowsHighQualityStreamingOnCellular"));
}

- (void)setGreenTeaMusicAllowCellularForHighQualityStreaming:(BOOL)a3
{
  -[NMSGreenTeaStreamingDefaults _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("GreenTeaMusicAllowsHighQualityStreamingOnCellular"));
}

- (BOOL)greenTeaMusicAllowsDownloadsOverCellular
{
  return -[NMSGreenTeaStreamingDefaults _BOOLForKey:](self, "_BOOLForKey:", CFSTR("GreenTeaMusicAllowsDownloadsOverCellular"));
}

- (void)setGreenTeaMusicAllowsDownloadsOverCellular:(BOOL)a3
{
  -[NMSGreenTeaStreamingDefaults _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("GreenTeaMusicAllowsDownloadsOverCellular"));
}

- (BOOL)_BOOLForKey:(id)a3
{
  NMSGreenTeaStreamingDefaults *v3;
  NSUserDefaults *sharedDefaults;
  id v5;

  v3 = self;
  sharedDefaults = self->_sharedDefaults;
  v5 = a3;
  -[NSUserDefaults synchronize](sharedDefaults, "synchronize");
  LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](v3->_sharedDefaults, "BOOLForKey:", v5);

  return (char)v3;
}

- (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  -[NSUserDefaults setBool:forKey:](self->_sharedDefaults, "setBool:forKey:", a3, a4);
  -[NSUserDefaults synchronize](self->_sharedDefaults, "synchronize");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDefaults, 0);
}

@end
