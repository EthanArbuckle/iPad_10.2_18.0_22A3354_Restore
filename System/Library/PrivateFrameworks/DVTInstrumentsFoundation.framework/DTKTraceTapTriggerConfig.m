@implementation DTKTraceTapTriggerConfig

+ (id)deviceSignPostConfig
{
  DTKTraceTapTriggerConfig *v2;
  void *v3;

  v2 = -[DTKTraceTapTriggerConfig initWithUUIDString:]([DTKTraceTapTriggerConfig alloc], "initWithUUIDString:", CFSTR("56594D66-845C-4205-B7D1-A8D7CF32362D"));
  -[DTKTraceTapTriggerConfig setKind:](v2, "setKind:", 3);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addClass:subclassID:", 33, 10);
  -[DTKTraceTapTriggerConfig setKdebugFilter:](v2, "setKdebugFilter:", v3);
  -[DTKTraceTapTriggerConfig addAction:](v2, "addAction:", 3);
  -[DTKTraceTapTriggerConfig addAction:](v2, "addAction:", 0);
  -[DTKTraceTapTriggerConfig addAction:](v2, "addAction:", 2);

  return v2;
}

- (DTKTraceTapTriggerConfig)init
{
  DTKTraceTapTriggerConfig *v2;
  uint64_t v3;
  NSMutableDictionary *dict;
  const __CFUUID *v5;
  __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTKTraceTapTriggerConfig;
  v2 = -[DTKTraceTapTriggerConfig init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

    v5 = CFUUIDCreate(0);
    v6 = (__CFString *)CFUUIDCreateString(0, v5);
    CFRelease(v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_dict, "setObject:forKeyedSubscript:", v6, CFSTR("uuid"));

  }
  return v2;
}

- (DTKTraceTapTriggerConfig)initWithPlist:(id)a3
{
  id v4;
  DTKTraceTapTriggerConfig *v5;
  uint64_t v6;
  NSMutableDictionary *dict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKTraceTapTriggerConfig;
  v5 = -[DTKTraceTapTriggerConfig init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    dict = v5->_dict;
    v5->_dict = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (DTKTraceTapTriggerConfig)initWithUUIDString:(id)a3
{
  id v4;
  DTKTraceTapTriggerConfig *v5;
  uint64_t v6;
  NSMutableDictionary *dict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKTraceTapTriggerConfig;
  v5 = -[DTKTraceTapTriggerConfig init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    dict = v5->_dict;
    v5->_dict = (NSMutableDictionary *)v6;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("uuid"));
  }

  return v5;
}

- (int)kind
{
  void *v2;
  int v3;
  int v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("tk"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");
  if ((v3 - 1) >= 3)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (void)setKind:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("tk"));

}

- (unint64_t)sampleInterval
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("si"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = 1000000;

  return v4;
}

- (void)setSampleInterval:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("si"));

}

- (unint64_t)eventLimitHint
{
  void *v2;
  unint64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("elh"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setEventLimitHint:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("elh"));

}

- (BOOL)hasThreadStateFilter
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("tsf"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setHasThreadStateFilter:(BOOL)a3
{
  NSMutableDictionary *dict;
  void *v5;
  id v6;

  dict = self->_dict;
  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](dict, "objectForKeyedSubscript:", CFSTR("tsf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v6, CFSTR("tsf"));

    }
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](dict, "removeObjectForKey:", CFSTR("tsf"));
  }
}

- (void)includeThreadState:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  -[DTKTraceTapTriggerConfig setHasThreadStateFilter:](self, "setHasThreadStateFilter:", 1);
  -[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("tsf"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTKTraceTapTriggerConfig.m"), 146, CFSTR("self.hasThreadStateFilter = YES is supposed to create an entry in the dictionary"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v3);
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) == 0)
    objc_msgSend(v8, "addObject:", v6);

}

- (void)enumerateThreadStatesToInclude:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  -[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("tsf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue"));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
  else
  {
    v4[2](v4, 1);
    v4[2](v4, 0x400000);
  }

}

- (BOOL)isAllProcesses
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("pf"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setIsAllProcesses:(BOOL)a3
{
  NSMutableDictionary *dict;
  void *v5;
  id v6;

  dict = self->_dict;
  if (a3)
  {
    -[NSMutableDictionary removeObjectForKey:](dict, "removeObjectForKey:", CFSTR("pf"));
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](dict, "objectForKeyedSubscript:", CFSTR("pf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v6, CFSTR("pf"));

    }
  }
}

- (void)includePID:(int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  -[DTKTraceTapTriggerConfig setIsAllProcesses:](self, "setIsAllProcesses:", 0);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("pf"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTKTraceTapTriggerConfig.m"), 188, CFSTR("self.isAllProcesses = NO is supposed to create an entry in the dictionary"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v3);
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) == 0)
    objc_msgSend(v8, "addObject:", v6);

}

- (void)enumeratePIDsInFilter:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("pf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "intValue"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addAction:(int)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[3];
  _QWORD v16[3];
  void *v17;
  void *v18;
  unsigned int v19;

  v16[2] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      v4 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayWithObjects:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v15[0] = v5;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v15[1] = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 4:
      v9 = (void *)MEMORY[0x24BDD16E0];
      v7 = v18;
      v5 = v17;
      objc_msgSend(v9, "numberWithInt:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      v14[1] = v5;
      v14[2] = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[3] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
      goto LABEL_7;
    case 5:
      v11 = (void *)MEMORY[0x24BDD16E0];
      v5 = v17;
      objc_msgSend(v11, "numberWithInt:", 5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      v16[1] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      if (v6)
      {
        -[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("ta"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = (void *)objc_opt_new();
          -[NSMutableDictionary setObject:forKey:](self->_dict, "setObject:forKey:", v13, CFSTR("ta"));
        }
        objc_msgSend(v13, "addObject:", v6);

      }
      break;
    case 6:
      NSLog(CFSTR("DTKT_ACTION_MAX not a real action"), a2);
      break;
    default:
      return;
  }
}

- (void)enumerateActions:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("ta"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "count");
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v10, "objectAtIndex:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "intValue");
          switch((int)v14)
          {
            case 0:
            case 2:
            case 3:
              v4[2](v4, v14);
              break;
            case 1:
              if (v12 >= 3)
              {
                objc_msgSend(v10, "objectAtIndex:", 1);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "intValue");
                objc_msgSend(v10, "objectAtIndex:", 2);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "intValue");
                v4[2](v4, 1);

                goto LABEL_13;
              }
              break;
            case 4:
              if (v12 >= 4)
              {
                objc_msgSend(v10, "objectAtIndex:", 1);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "objectAtIndex:", 2);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "objectAtIndex:", 3);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "unsignedIntValue");
                v4[2](v4, 4);

LABEL_13:
              }
              break;
            case 5:
              if (v12 >= 2)
              {
                objc_msgSend(v10, "objectAtIndex:", 1);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v4[2](v4, 5);

              }
              break;
            default:
              break;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

}

- (NSString)pmiCounterName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("pmicn"));
}

- (void)setPmiCounterName:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", a3, CFSTR("pmicn"));
}

- (NSString)pmiEventMnemonic
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("pmiem"));
}

- (void)setPmiEventMnemonic:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", a3, CFSTR("pmiem"));
}

- (unint64_t)pmiEventThreshold
{
  void *v2;
  unint64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("pmiet"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setPmiEventThreshold:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("pmiet"));

}

- (NSArray)pmiDeviceIndices
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("pmidi"));
}

- (void)setPmiDeviceIndices:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", a3, CFSTR("pmidi"));
}

- (NSString)uuid
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("uuid"));
}

- (void)setUuid:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", a3, CFSTR("uuid"));
}

- (void)setKdebugFilter:(id)a3
{
  DTKPKDebugCodeSet *v4;
  void *v5;
  DTKPKDebugCodeSet *kdebugFilterSet;
  id v7;

  v4 = (DTKPKDebugCodeSet *)a3;
  -[DTKPKDebugCodeSet legacyXML](v4, "legacyXML");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v7, CFSTR("kdf"));
    -[DTKPKDebugCodeSet kdebugCodes](v4, "kdebugCodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v5, CFSTR("kdf2"));

  }
  kdebugFilterSet = self->_kdebugFilterSet;
  self->_kdebugFilterSet = v4;

}

- (DTKPKDebugCodeSet)kdebugFilter
{
  DTKPKDebugCodeSet *kdebugFilterSet;
  void *v4;
  DTKPKDebugCodeSet *v5;
  DTKPKDebugCodeSet *v6;

  kdebugFilterSet = self->_kdebugFilterSet;
  if (!kdebugFilterSet)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("kdf2"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[DTKPKDebugCodeSet initWithCodes:]([DTKPKDebugCodeSet alloc], "initWithCodes:", v4);
      v6 = self->_kdebugFilterSet;
      self->_kdebugFilterSet = v5;

    }
    kdebugFilterSet = self->_kdebugFilterSet;
  }
  return kdebugFilterSet;
}

- (unint64_t)callstackFrameDepth
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", CFSTR("csd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 128;

  return v4;
}

- (void)setCallstackFrameDepth:(unint64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("csd"));

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_dict, "removeObjectForKey:", CFSTR("csd"));
  }
}

- (id)plist
{
  return self->_dict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kdebugFilterSet, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

- (id)_GetTriggerDict
{
  return self->_dict;
}

- (void)_SetTriggerDict:(id)a3
{
  objc_storeStrong((id *)&self->_dict, a3);
}

@end
