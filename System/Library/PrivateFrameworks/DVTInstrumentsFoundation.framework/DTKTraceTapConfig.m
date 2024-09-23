@implementation DTKTraceTapConfig

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("DTCoreProfileTapMessage"));
}

- (DTKTraceTapConfig)init
{
  DTKTraceTapConfig *v2;
  DTKTraceTapConfig *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DTKTraceTapConfig;
  v2 = -[DTTapConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_kdebugTriggerIndex = -1;
    -[DTTapConfig setBufferMode:](v2, "setBufferMode:", 0);
    -[DTTapConfig setPollingInterval:](v3, "setPollingInterval:", 500000000);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTTapConfig _setSerializableObject:forKey:](v3, "_setSerializableObject:forKey:", v4, CFSTR("tc"));

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DTKTraceTapConfig;
  v4 = -[DTTapConfig copyWithZone:](&v12, sel_copyWithZone_, a3);
  v4[20] = self->_kdebugTriggerIndex;
  v5 = objc_msgSend(self->_sessionHandler, "copy");
  v6 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v5;

  v7 = objc_msgSend(self->_stackshotHandler, "copy");
  v8 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v7;

  -[DTKTraceTapConfig providerOptions](self, "providerOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setProviderOptions:", v10);

  return v4;
}

- (void)setRecordingPriority:(unsigned __int8)a3
{
  uint64_t v3;
  id v5;

  v3 = a3;
  if (a3 != 10 && a3 != 100)
  {
    NSLog(CFSTR("Unsupported recording priority %d, defaulting to background priority"), a2, a3);
    v3 = 10;
  }
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v3);
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v5, CFSTR("rp"));

}

- (void)setCanUseRawKtraceFile:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("curkt"));

}

- (BOOL)canUseRawKtraceFile
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("curkt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unsigned)recordingPriority
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("rp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 10;

  return v4;
}

- (unint64_t)bufferSizeOverride
{
  void *v2;
  unint64_t v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("bso"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setBufferSizeOverride:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("bso"));

}

- (BOOL)bufferSizeOverrideClamping
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("bsoc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setBufferSizeOverrideClamping:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("bsoc"));

}

- (NSDictionary)providerOptions
{
  return (NSDictionary *)-[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("po"));
}

- (void)setProviderOptions:(id)a3
{
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", a3, CFSTR("po"));
}

- (unint64_t)collectionInterval
{
  void *v2;
  unint64_t v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("kco"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setCollectionInterval:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("kco"));

}

- (void)setSessionHandler:(id)a3
{
  void *v4;
  id sessionHandler;

  v4 = _Block_copy(a3);
  sessionHandler = self->_sessionHandler;
  self->_sessionHandler = v4;

}

- (void)enumerateTriggerConfigs:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("tc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "_SetTriggerDict:", v10);
        v4[2](v4, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (unint64_t)triggerConfigCount
{
  void *v2;
  unint64_t v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("tc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int)_addTriggerConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("tc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_GetTriggerDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = objc_msgSend(v5, "count") - 1;
  if (objc_msgSend(v4, "kind") == 3)
  {
    if (self->_kdebugTriggerIndex != -1)
      sub_222BC73C0();
    self->_kdebugTriggerIndex = v7;
  }

  return v7;
}

- (int)addTriggerConfig:(id)a3
{
  return MEMORY[0x24BEDD108](self, sel__addTriggerConfig_);
}

- (id)sessionHandler
{
  return self->_sessionHandler;
}

- (id)stackshotHandler
{
  return self->_stackshotHandler;
}

- (void)setStackshotHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unsigned)kdebugTriggerIndex
{
  return self->_kdebugTriggerIndex;
}

- (void)setKdebugTriggerIndex:(unsigned int)a3
{
  self->_kdebugTriggerIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stackshotHandler, 0);
  objc_storeStrong(&self->_sessionHandler, 0);
}

@end
