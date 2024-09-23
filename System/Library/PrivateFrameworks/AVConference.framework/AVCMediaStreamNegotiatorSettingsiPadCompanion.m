@implementation AVCMediaStreamNegotiatorSettingsiPadCompanion

- (AVCMediaStreamNegotiatorSettingsiPadCompanion)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  AVCMediaStreamNegotiatorSettingsiPadCompanion *v8;
  VCVideoRuleCollectionsScreenSecondary *v9;
  NSMutableSet *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  __CFString *v15;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AVCMediaStreamNegotiatorSettingsiPadCompanion;
  v8 = -[AVCMediaStreamNegotiatorSettings init](&v16, sel_init);
  if (!v8)
    return v8;
  v9 = +[VCVideoRuleCollectionsScreenSecondary sharedInstance](VCVideoRuleCollectionsScreenSecondary, "sharedInstance");
  v8->super._screenRuleCollections = &v9->super;
  if (v9)
  {
    v8->super._tilesPerFrame = +[VCVideoRuleCollectionsScreenSecondary tilesPerFrame](VCVideoRuleCollectionsScreenSecondary, "tilesPerFrame");
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8->super._hdrModesSupported = v10;
    if (v10)
    {
      -[NSMutableSet addObject:](v10, "addObject:", &unk_1E9EF55A0);
      if (v6 == 2)
      {
        v8->super._mediaStreamDirection = 2;
        if (+[AVCMediaStreamNegotiatorSettings hdrModeWithNegotiatorInitOptions:](AVCMediaStreamNegotiatorSettings, "hdrModeWithNegotiatorInitOptions:", a3) == 3)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v18 = v11;
              v19 = 2080;
              v20 = "-[AVCMediaStreamNegotiatorSettingsiPadCompanion initWithOptions:deviceRole:error:]";
              v21 = 1024;
              v22 = 369;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HDR10Reference mode enabled on answerer", buf, 0x1Cu);
            }
          }
          -[NSMutableSet addObject:](v8->super._hdrModesSupported, "addObject:", &unk_1E9EF55E8);
          v8->super._hdrModePixelFormats = (NSArray *)&unk_1E9EFA1D8;
          v13 = &unk_1E9EFA1D8;
        }
      }
      else if (v6 == 1)
      {
        v8->super._mediaStreamDirection = 1;
      }
      return v8;
    }
    v15 = CFSTR("no _hdrModesSupported ivar is created");
  }
  else
  {
    v15 = CFSTR("no _screenRuleCollections is created");
  }
  if (a5)
    *a5 = v15;

  return 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCMediaStreamNegotiatorSettingsiPadCompanion;
  -[AVCMediaStreamNegotiatorSettings dealloc](&v3, sel_dealloc);
}

- (int64_t)videoStreamMode
{
  return 1;
}

- (int64_t)captureSource
{
  return 1;
}

- (int)operatingMode
{
  return 8;
}

- (unint64_t)maxBandwidth
{
  return 40000000;
}

- (unsigned)featureListStringType
{
  return 3;
}

@end
