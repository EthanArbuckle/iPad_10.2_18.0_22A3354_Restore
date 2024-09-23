@implementation DTCADebugService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.graphics.coreanimation"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.graphics.coreanimation.immediate"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.graphics.coreanimation.deferred"), 1, a1);

}

- (DTCADebugService)initWithChannel:(id)a3
{
  DTCADebugService *v3;
  uint64_t v4;
  NSMutableDictionary *enabledSwitches;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DTCADebugService;
  v3 = -[DTGraphicsService initWithChannel:](&v7, sel_initWithChannel_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    enabledSwitches = v3->_enabledSwitches;
    v3->_enabledSwitches = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[DTCADebugService cleanupSwitches](self, "cleanupSwitches");
  v3.receiver = self;
  v3.super_class = (Class)DTCADebugService;
  -[DTGraphicsService dealloc](&v3, sel_dealloc);
}

- (void)cleanupSwitches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DTCADebugService enabledSwitches](self, "enabledSwitches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v10 = 0;
        if (-[DTCADebugService _switchNamed:toDebugOption:](self, "_switchNamed:toDebugOption:", v8, &v10))
          CARenderServerSetDebugOption();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[DTCADebugService enabledSwitches](self, "enabledSwitches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (id)availableStatistics
{
  NSMutableArray *v3;
  NSMutableArray *availableGlobalStatistics;
  NSDictionary *v5;
  NSDictionary *availableStatistics;

  if (!self->super._availableGlobalStatistics)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("FramesPerSecond"), 0);
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    availableGlobalStatistics = self->super._availableGlobalStatistics;
    self->super._availableGlobalStatistics = v3;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", self->super._availableGlobalStatistics, CFSTR("global"), 0);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    availableStatistics = self->super._availableStatistics;
    self->super._availableStatistics = v5;

  }
  return self->super._availableStatistics;
}

- (id)driverNames
{
  NSMutableArray *driverNames;
  NSMutableArray *v4;
  NSMutableArray *v5;

  driverNames = self->super._driverNames;
  if (!driverNames)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", XRVideoCardBuiltIn, 0);
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._driverNames;
    self->super._driverNames = v4;

    driverNames = self->super._driverNames;
  }
  return driverNames;
}

- (void)cleanup
{
  objc_super v3;

  -[DTCADebugService cleanupSwitches](self, "cleanupSwitches");
  v3.receiver = self;
  v3.super_class = (Class)DTCADebugService;
  -[DTGraphicsService cleanup](&v3, sel_cleanup);
}

- (BOOL)_switchNamed:(id)a3 toDebugOption:(unsigned int *)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  int v8;

  v5 = a3;
  if (!a4)
    sub_222BC73E8();
  v6 = v5;
  if ((objc_msgSend(v5, "isEqual:", CFSTR("flashUpdatedRegions")) & 1) != 0)
  {
    v7 = 0;
LABEL_6:
    LOBYTE(v8) = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "isEqual:", CFSTR("colorCopiedImages")) & 1) != 0)
  {
    v7 = 1;
    goto LABEL_6;
  }
  if ((objc_msgSend(v6, "isEqual:", CFSTR("colorBlendedLayers")) & 1) != 0)
  {
    LOBYTE(v8) = 1;
    v7 = 2;
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("colorMisalignedImages")) & 1) != 0)
  {
    LOBYTE(v8) = 1;
    v7 = 14;
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("colorImmediately")) & 1) != 0)
  {
    LOBYTE(v8) = 1;
    v7 = 3;
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("colorOpenGLFastPathBlue")) & 1) != 0)
  {
    LOBYTE(v8) = 1;
    v7 = 18;
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("colorOffscreenRenderedYellow")) & 1) != 0)
  {
    LOBYTE(v8) = 1;
    v7 = 17;
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("colorCached")) & 1) != 0)
  {
    LOBYTE(v8) = 1;
    v7 = 19;
  }
  else
  {
    v8 = objc_msgSend(v6, "isEqual:", CFSTR("colorFormats"));
    if (v8)
      v7 = 20;
    else
      v7 = 0;
  }
LABEL_7:
  *a4 = v7;

  return v8;
}

- (id)valueForSwitch:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  int v9;

  v4 = a3;
  v9 = 0;
  if (-[DTCADebugService _switchNamed:toDebugOption:](self, "_switchNamed:toDebugOption:", v4, &v9))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", CARenderServerGetDebugOption());
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DTCADebugService;
    -[DTGraphicsService valueForSwitch:](&v8, sel_valueForSwitch_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setValue:(id)a3 forSwitchName:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  int v11;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  if (-[DTCADebugService _switchNamed:toDebugOption:](self, "_switchNamed:toDebugOption:", v7, &v11))
  {
    v8 = objc_msgSend(v6, "BOOLValue");
    CARenderServerSetDebugOption();
    -[DTCADebugService enabledSwitches](self, "enabledSwitches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      objc_msgSend(v9, "setValue:forKey:", v6, v7);
    else
      objc_msgSend(v9, "removeObjectForKey:", v7);

  }
}

- (void)_collectData
{
  unsigned int v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  self->super._lastFPSCount = CARenderServerGetFrameCounter();
  if (MGGetBoolAnswer())
    v3 = 120;
  else
    v3 = 60;
  self->super._maxFPS = v3;
  while (self->super._doCollectData)
  {
    v4 = (void *)MEMORY[0x227679C5C]();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v6 = v5 - self->super._startTime;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (unint64_t)(v6 * 1000000.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTGraphicsService currentFramesPerSecond:](self, "currentFramesPerSecond:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("FramesPerSecond"));
    objc_msgSend(v10, "setObject:forKey:", XRVideoCardRunTimeStamp, v7);
    objc_msgSend(v10, "setObject:forKey:", XRVideoCardIdentifier, XRVideoCardBuiltIn);
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTXService channel](self, "channel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_222B8BBDC;
    v13[3] = &unk_24EB2A1F0;
    v13[4] = self;
    objc_msgSend(v12, "sendMessage:replyHandler:", v11, v13);

    objc_autoreleasePoolPop(v4);
    usleep(self->super._samplingRate);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->super._stopSamplingSemaphore);
}

- (NSMutableDictionary)enabledSwitches
{
  return self->_enabledSwitches;
}

- (void)setEnabledSwitches:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSwitches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSwitches, 0);
}

@end
