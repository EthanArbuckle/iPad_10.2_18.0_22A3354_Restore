@implementation CLSettingsManagerInternal

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < objc_msgSend(a3, "count"))
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_1ECE24CF8 != -1)
    dispatch_once(&qword_1ECE24CF8, &unk_1E45FB5E0);
  return (id)qword_1ECE24CF0;
}

- (void)beginService
{
  -[CLSettingsManagerInternal setClients:](self, "setClients:", objc_msgSend(MEMORY[0x1E0C99E20], "set"));
  -[CLSettingsManagerInternal setSettingsDictionary:](self, "setSettingsDictionary:", 0);
}

- (void)endService
{
  -[CLSettingsManagerInternal setSettingsDictionary:](self, "setSettingsDictionary:", 0);
  -[CLSettingsManagerInternal setClients:](self, "setClients:", 0);
}

- (void)unregisterForUpdates:(id)a3
{
  -[NSMutableSet removeObject:](self->_clients, "removeObject:", a3);
}

- (id)syncgetSettingsAndRegisterForUpdates:(id)a3
{
  -[NSMutableSet addObject:](self->_clients, "addObject:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_settingsDictionary);
}

- (void)updateClientsWithDictionary:(id)a3
{
  NSMutableSet *clients;
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

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    __assert_rtn("-[CLSettingsManagerInternal updateClientsWithDictionary:]", "CLSettingsManagerInternal.m", 52, "![dictionary isKindOfClass:[NSMutableDictionary class]]");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  clients = self->_clients;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_enumerationMutation(clients);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didUpdateSettings:", a3);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5
{
  void *v7;
  NSMutableSet *clients;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary setValue:forKey:](self->_settingsDictionary, "setValue:forKey:", a3, a4);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_settingsDictionary);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  clients = self->_clients;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(clients);
        v13 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if (v13 != a5)
          objc_msgSend(v13, "didUpdateSettings:", v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v7;
}

- (NSMutableSet)clients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)settingsDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSettingsDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
