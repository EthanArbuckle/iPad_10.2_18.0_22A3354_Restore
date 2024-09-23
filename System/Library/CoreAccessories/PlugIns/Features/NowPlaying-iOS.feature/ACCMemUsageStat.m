@implementation ACCMemUsageStat

- (ACCMemUsageStat)init
{
  return -[ACCMemUsageStat initWithName:](self, "initWithName:", 0);
}

- (ACCMemUsageStat)initWithName:(id)a3
{
  id v5;
  ACCMemUsageStat *v6;
  ACCMemUsageStat *v7;
  ACCMemUsageStatInfo *v8;
  ACCMemUsageStatInfo *statInfo;
  NSMutableDictionary *v10;
  NSMutableDictionary *markList;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACCMemUsageStat;
  v6 = -[ACCMemUsageStat init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = -[ACCMemUsageStatInfo initWithName:]([ACCMemUsageStatInfo alloc], "initWithName:", &stru_24DC89FD0);
    statInfo = v7->_statInfo;
    v7->_statInfo = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    markList = v7->_markList;
    v7->_markList = v10;

    -[ACCMemUsageStat update](v7, "update");
  }

  return v7;
}

- (id)description
{
  const __CFString *name;

  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = &stru_24DC89FD0;
  return (id)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("ACCMemUsageStat:%@ \nstatinfo: \n%@ markList: %lu entries \n"), name, self->_statInfo, -[NSMutableDictionary count](self->_markList, "count"));
}

- (BOOL)update
{
  _BOOL4 MemoryUse;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = 0;
  v14 = 0;
  MemoryUse = getMemoryUse(&v16, &v15, &v14);
  if (MemoryUse)
  {
    -[ACCMemUsageStatInfo updateResident:virtualValue:physFootprintValue:](self->_statInfo, "updateResident:virtualValue:physFootprintValue:", v16, v15, v14);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMutableDictionary allValues](self->_markList, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "updateResident:virtualValue:physFootprintValue:", v16, v15, v14);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
      }
      while (v6);
    }

  }
  return MemoryUse;
}

- (void)mark:(id)a3
{
  ACCMemUsageStatInfo *v4;
  ACCMemUsageStatInfo *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKey:](self->_markList, "objectForKey:");
  v4 = (ACCMemUsageStatInfo *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = [ACCMemUsageStatInfo alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-mark-%@"), self->_name, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ACCMemUsageStatInfo initWithName:andInfo:](v5, "initWithName:andInfo:", v6, self->_statInfo);

    -[NSMutableDictionary setObject:forKey:](self->_markList, "setObject:forKey:", v4, v7);
  }

}

- (id)getMark:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_markList, "objectForKey:", a3);
}

- (void)removeMark:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_markList, "removeObjectForKey:", a3);
}

- (double)timeIntervalSinceStart
{
  double result;

  -[ACCMemUsageStatInfo timeIntervalSinceStart](self->_statInfo, "timeIntervalSinceStart");
  return result;
}

- (double)timeIntervalSinceLastUpdate
{
  double result;

  -[ACCMemUsageStatInfo timeIntervalSinceLastUpdate](self->_statInfo, "timeIntervalSinceLastUpdate");
  return result;
}

- (double)timeIntervalSinceMark:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[NSMutableDictionary objectForKey:](self->_markList, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

  }
  else
  {
    v7 = -1.0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (ACCMemUsageStatInfo)statInfo
{
  return self->_statInfo;
}

- (NSMutableDictionary)markList
{
  return self->_markList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markList, 0);
  objc_storeStrong((id *)&self->_statInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
