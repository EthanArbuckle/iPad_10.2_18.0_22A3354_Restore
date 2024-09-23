@implementation HTProcessTerminationSettings

+ (HTProcessTerminationSettings)sharedSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HTProcessTerminationSettings_sharedSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettings_onceToken != -1)
    dispatch_once(&sharedSettings_onceToken, block);
  return (HTProcessTerminationSettings *)(id)sharedSettings_sharedInstance;
}

void __46__HTProcessTerminationSettings_sharedSettings__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedSettings_sharedInstance;
  sharedSettings_sharedInstance = v0;

}

- (HTProcessTerminationSettings)init
{
  id v3;
  void *v4;
  HTProcessTerminationSettings *v5;

  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x24BE3F310]);
  v5 = -[HTProcessTerminationSettings initWithDefaults:](self, "initWithDefaults:", v4);

  return v5;
}

- (HTProcessTerminationSettings)initWithDefaults:(id)a3
{
  id v5;
  HTProcessTerminationSettings *v6;
  HTProcessTerminationSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HTProcessTerminationSettings;
  v6 = -[HTProcessTerminationSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaults, a3);

  return v7;
}

- (BOOL)isForceQuitDetectionEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", *MEMORY[0x24BE3F370]);
}

- (void)setForceQuitDetectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSUserDefaults *defaults;

  v3 = a3;
  if (-[HTProcessTerminationSettings isForceQuitDetectionEnabled](self, "isForceQuitDetectionEnabled") != a3)
  {
    defaults = self->_defaults;
    if (v3)
      -[NSUserDefaults setBool:forKey:](defaults, "setBool:forKey:", 1, *MEMORY[0x24BE3F370]);
    else
      -[NSUserDefaults removeObjectForKey:](defaults, "removeObjectForKey:", *MEMORY[0x24BE3F370]);
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
  }
}

- (int64_t)forceQuitDetectionThreshold
{
  return -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", *MEMORY[0x24BE3F378]);
}

- (void)setForceQuitDetectionThreshold:(int64_t)a3
{
  NSUserDefaults *defaults;

  if (-[HTProcessTerminationSettings forceQuitDetectionThreshold](self, "forceQuitDetectionThreshold") != a3)
  {
    defaults = self->_defaults;
    if (a3 == 3000)
      -[NSUserDefaults removeObjectForKey:](defaults, "removeObjectForKey:", *MEMORY[0x24BE3F378]);
    else
      -[NSUserDefaults setInteger:forKey:](defaults, "setInteger:forKey:", a3, *MEMORY[0x24BE3F378]);
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
  }
}

- (void)applySettings
{
  notify_post((const char *)*MEMORY[0x24BE3F318]);
}

- (BOOL)displayTerminationsInHUD
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", *MEMORY[0x24BE3F418]);
}

- (void)setDisplayTerminationsInHUD:(BOOL)a3
{
  _BOOL4 v3;
  NSUserDefaults *defaults;
  void *v6;
  void *v7;

  v3 = a3;
  if (-[HTProcessTerminationSettings displayTerminationsInHUD](self, "displayTerminationsInHUD") != a3)
  {
    defaults = self->_defaults;
    if (v3)
    {
      -[NSUserDefaults setBool:forKey:](defaults, "setBool:forKey:", 1, *MEMORY[0x24BE3F418]);
      -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", *MEMORY[0x24BE3F410]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        -[HTProcessTerminationSettings _setTracksCriticalProcesses:](self, "_setTracksCriticalProcesses:", 1);
      -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", *MEMORY[0x24BE3F428]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        -[HTProcessTerminationSettings _trackAllDefaultReasons](self, "_trackAllDefaultReasons");
    }
    else
    {
      -[NSUserDefaults removeObjectForKey:](defaults, "removeObjectForKey:", *MEMORY[0x24BE3F418]);
    }
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
  }
}

- (BOOL)tracksAllProcesses
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", *MEMORY[0x24BE3F408]);
}

- (void)setTracksAllProcesses:(BOOL)a3
{
  if (-[HTProcessTerminationSettings _setTracksAllProcesses:](self, "_setTracksAllProcesses:", a3))
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
}

- (BOOL)_setTracksAllProcesses:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[HTProcessTerminationSettings tracksAllProcesses](self, "tracksAllProcesses") ^ a3;
  if (v5)
    -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v3, *MEMORY[0x24BE3F408]);
  return v5;
}

- (BOOL)tracksCriticalProcesses
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", *MEMORY[0x24BE3F410]);
}

- (void)setTracksCriticalProcesses:(BOOL)a3
{
  if (-[HTProcessTerminationSettings _setTracksCriticalProcesses:](self, "_setTracksCriticalProcesses:", a3))
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
}

- (BOOL)_setTracksCriticalProcesses:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[HTProcessTerminationSettings tracksCriticalProcesses](self, "tracksCriticalProcesses") ^ a3;
  if (v5)
    -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", v3, *MEMORY[0x24BE3F410]);
  return v5;
}

- (NSArray)criticalProcessNames
{
  return (NSArray *)&unk_250E6A1D8;
}

- (NSArray)trackedProcessNames
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", *MEMORY[0x24BE3F420]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (void)setTrackedProcessNames:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  NSUserDefaults *defaults;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HTProcessTerminationSettings trackedProcessNames](self, "trackedProcessNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v10);

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(v10, "count");
    defaults = self->_defaults;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v9, *MEMORY[0x24BE3F420]);

    }
    else
    {
      -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", *MEMORY[0x24BE3F420]);
    }
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
  }

}

- (void)addTrackedProcessNamed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HTProcessTerminationSettings trackedProcessNames](self, "trackedProcessNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if ((objc_msgSend(v5, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", v6);
    -[HTProcessTerminationSettings setTrackedProcessNames:](self, "setTrackedProcessNames:", v5);
  }

}

- (void)removeTrackedProcessNamed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[HTProcessTerminationSettings trackedProcessNames](self, "trackedProcessNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  v6 = objc_msgSend(v7, "indexOfObject:", v4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "removeObjectAtIndex:", v6);
    -[HTProcessTerminationSettings setTrackedProcessNames:](self, "setTrackedProcessNames:", v7);
  }

}

- (unint64_t)trackedReasons
{
  void *v3;
  unint64_t v4;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", *MEMORY[0x24BE3F428]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  if (v4 == 1)
    return -[HTProcessTerminationSettings allReasonsValue](self, "allReasonsValue");
  else
    return v4;
}

- (void)setTrackedReasons:(unint64_t)a3
{
  if (-[HTProcessTerminationSettings _setTrackedReasons:propagatingSubReasons:](self, "_setTrackedReasons:propagatingSubReasons:", a3, 1))
  {
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
  }
}

- (BOOL)_setTrackedReasons:(unint64_t)a3 propagatingSubReasons:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;
  NSUserDefaults *defaults;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = -[HTProcessTerminationSettings trackedReasons](self, "trackedReasons");
  if (v7 != a3)
  {
    if (a3 == 1)
      v8 = 1;
    else
      v8 = -[HTProcessTerminationSettings allReasonsValue](self, "allReasonsValue") == a3 ? 1 : a3;
    defaults = self->_defaults;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v10, *MEMORY[0x24BE3F428]);

    if (v4)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[HTProcessTerminationSettings availableReasons](self, "availableReasons", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "unsignedLongLongValue");
            if (a3 == 1 || (v16 & a3) == v16)
              -[HTProcessTerminationSettings _trackAllSubReasonsForReason:](self, "_trackAllSubReasonsForReason:", v16);
            else
              -[HTProcessTerminationSettings _setTrackedSubReasons:forReason:](self, "_setTrackedSubReasons:forReason:", 0, v16);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }

    }
  }
  return v7 != a3;
}

- (unint64_t)allReasonsValue
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = allReasonsValue_allReasons;
  if (!allReasonsValue_allReasons)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[HTProcessTerminationSettings availableReasons](self, "availableReasons", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "unsignedLongLongValue");
          allReasonsValue_allReasons |= v8;
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    return allReasonsValue_allReasons;
  }
  return v2;
}

- (void)addTrackedReason:(unint64_t)a3
{
  if (-[HTProcessTerminationSettings _addTrackedReason:propagatingSubReasons:](self, "_addTrackedReason:propagatingSubReasons:", a3, 1))
  {
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
  }
}

- (BOOL)_addTrackedReason:(unint64_t)a3 propagatingSubReasons:(BOOL)a4
{
  return -[HTProcessTerminationSettings _setTrackedReasons:propagatingSubReasons:](self, "_setTrackedReasons:propagatingSubReasons:", -[HTProcessTerminationSettings trackedReasons](self, "trackedReasons") | a3, a4);
}

- (void)removeTrackedReason:(unint64_t)a3
{
  if (-[HTProcessTerminationSettings _removeTrackedReason:](self, "_removeTrackedReason:", a3))
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
}

- (BOOL)_removeTrackedReason:(unint64_t)a3
{
  return -[HTProcessTerminationSettings _removeTrackedReason:propagatingSubReasons:](self, "_removeTrackedReason:propagatingSubReasons:", a3, 1);
}

- (BOOL)_removeTrackedReason:(unint64_t)a3 propagatingSubReasons:(BOOL)a4
{
  return -[HTProcessTerminationSettings _setTrackedReasons:propagatingSubReasons:](self, "_setTrackedReasons:propagatingSubReasons:", -[HTProcessTerminationSettings trackedReasons](self, "trackedReasons") & ~a3, a4);
}

- (void)trackAllReasons
{
  if (-[HTProcessTerminationSettings _trackAllReasons](self, "_trackAllReasons"))
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
}

- (BOOL)_trackAllReasons
{
  return -[HTProcessTerminationSettings _setTrackedReasons:propagatingSubReasons:](self, "_setTrackedReasons:propagatingSubReasons:", 1, 1);
}

- (BOOL)_trackAllDefaultReasons
{
  BOOL v3;
  BOOL v4;

  v3 = -[HTProcessTerminationSettings _setTrackedReasons:propagatingSubReasons:](self, "_setTrackedReasons:propagatingSubReasons:", 1, 1);
  v4 = -[HTProcessTerminationSettings _removeTrackedSubReason:forReason:](self, "_removeTrackedSubReason:forReason:", 1024, 2);
  return -[HTProcessTerminationSettings _removeTrackedSubReason:forReason:](self, "_removeTrackedSubReason:forReason:", 0x8000, 2)|| v4|| v3;
}

- (id)availableSubReasonsForReason:(unint64_t)a3
{
  return HTTerminationAllAvailableSubReasonsForReason(a3);
}

- (unint64_t)allSubReasonsValueForReason:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HTProcessTerminationSettings availableSubReasonsForReason:](self, "availableSubReasonsForReason:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedLongLongValue");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)trackedSubReasonsForReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%llu"), *MEMORY[0x24BE3F428], a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  if (v7 == 1)
    v7 = -[HTProcessTerminationSettings allSubReasonsValueForReason:](self, "allSubReasonsValueForReason:", a3);

  return v7;
}

- (void)setTrackedSubReasons:(unint64_t)a3 forReason:(unint64_t)a4
{
  if (-[HTProcessTerminationSettings _setTrackedSubReasons:forReason:](self, "_setTrackedSubReasons:forReason:", a3, a4))
  {
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
  }
}

- (BOOL)_setTrackedSubReasons:(unint64_t)a3 forReason:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v11;
  NSUserDefaults *defaults;
  void *v13;
  unint64_t v14;
  unint64_t v15;

  if (-[HTProcessTerminationSettings trackedSubReasonsForReason:](self, "trackedSubReasonsForReason:", a4) == a3)
    return 0;
  -[HTProcessTerminationSettings availableSubReasonsForReason:](self, "availableSubReasonsForReason:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    return 0;
  if (a3 == 1)
  {
    v9 = 1;
  }
  else if (-[HTProcessTerminationSettings allSubReasonsValueForReason:](self, "allSubReasonsValueForReason:", a4) == a3)
  {
    v9 = 1;
  }
  else
  {
    v9 = a3;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%llu"), *MEMORY[0x24BE3F428], a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  defaults = self->_defaults;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v13, v11);

  v14 = -[HTProcessTerminationSettings trackedReasons](self, "trackedReasons");
  v15 = v14 & a4;
  if (a3)
  {
    if (v14 != 1 && !v15)
      -[HTProcessTerminationSettings _addTrackedReason:propagatingSubReasons:](self, "_addTrackedReason:propagatingSubReasons:", a4, 0);
  }
  else if (v14 == 1 || v15 == a4)
  {
    -[HTProcessTerminationSettings _removeTrackedReason:propagatingSubReasons:](self, "_removeTrackedReason:propagatingSubReasons:", a4, 0);
  }

  return 1;
}

- (void)addTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4
{
  -[HTProcessTerminationSettings setTrackedSubReasons:forReason:](self, "setTrackedSubReasons:forReason:", -[HTProcessTerminationSettings trackedSubReasonsForReason:](self, "trackedSubReasonsForReason:", a4) | a3, a4);
}

- (void)removeTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4
{
  if (-[HTProcessTerminationSettings _removeTrackedSubReason:forReason:](self, "_removeTrackedSubReason:forReason:", a3, a4))
  {
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
  }
}

- (BOOL)_removeTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4
{
  return -[HTProcessTerminationSettings _setTrackedSubReasons:forReason:](self, "_setTrackedSubReasons:forReason:", -[HTProcessTerminationSettings trackedSubReasonsForReason:](self, "trackedSubReasonsForReason:", a4) & ~a3, a4);
}

- (void)trackAllSubReasonsForReason:(unint64_t)a3
{
  if (-[HTProcessTerminationSettings _trackAllSubReasonsForReason:](self, "_trackAllSubReasonsForReason:", a3))
    -[HTProcessTerminationSettings applySettings](self, "applySettings");
}

- (BOOL)_trackAllSubReasonsForReason:(unint64_t)a3
{
  return -[HTProcessTerminationSettings _setTrackedSubReasons:forReason:](self, "_setTrackedSubReasons:forReason:", 1, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
