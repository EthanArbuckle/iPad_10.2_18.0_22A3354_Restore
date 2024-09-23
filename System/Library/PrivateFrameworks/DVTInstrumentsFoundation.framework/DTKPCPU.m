@implementation DTKPCPU

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    DTKPSetupLogging();
    v2 = objc_opt_new();
    v3 = (void *)qword_25576FB30;
    qword_25576FB30 = v2;

    v4 = dispatch_semaphore_create(1);
    v5 = (void *)qword_25576FB38;
    qword_25576FB38 = (uint64_t)v4;

  }
}

+ (id)localCPU:(id *)a3
{
  DTKPCPU *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  DTKPCPU *v12;

  if (CSTaskIsTranslated())
  {
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", a3, 4294966596, CFSTR("CPU Counters are not supported when running under Rosetta."));
    return 0;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_25576FB38, 0xFFFFFFFFFFFFFFFFLL);
  if (!qword_25576FB40)
  {
    v6 = kpep_db_create();
    v7 = v6;
    if ((_DWORD)v6 == 7)
    {
      if (!DTCoreIs64BitCapable())
      {
LABEL_12:
        v5 = 0;
        goto LABEL_13;
      }
    }
    else if (!(_DWORD)v6)
    {
      v8 = kpep_db_name();
      if (!(_DWORD)v8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", 0);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)qword_25576FB40;
        qword_25576FB40 = v10;

        v12 = [DTKPCPU alloc];
        v5 = -[DTKPCPU initWithName:database:](v12, "initWithName:database:", qword_25576FB40, 0);
        objc_msgSend((id)qword_25576FB30, "setObject:forKeyedSubscript:", v5, qword_25576FB40);
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error getting CPU database name local machine (%d)."), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", a3, 4294966596, v9);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating CPU database for local machine (%d)."), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", a3, 4294966596, v9);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend((id)qword_25576FB30, "objectForKeyedSubscript:");
  v5 = (DTKPCPU *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_25576FB38);
  return v5;
}

+ (id)cpuNamed:(id)a3 fromSerializedData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  DTKPCPU *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_25576FB38, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)qword_25576FB30, "objectForKeyedSubscript:", v7);
  v9 = (DTKPCPU *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = objc_retainAutorelease(v8);
    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    v11 = kpep_db_deserialize();
    if ((_DWORD)v11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating CPU database from serialized data for '%@' (%d)."), v7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", a5, 4294966596, v12);

      v9 = 0;
    }
    else
    {
      v9 = -[DTKPCPU initWithName:database:]([DTKPCPU alloc], "initWithName:database:", v7, 0);
      objc_msgSend((id)qword_25576FB30, "setObject:forKeyedSubscript:", v9, v7);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_25576FB38);

  return v9;
}

- (id)description
{
  _BOOL4 v3;
  NSString *name;
  uint64_t v6;

  v3 = -[NSString isEqualToString:](self->_lookupName, "isEqualToString:", self->_name);
  name = self->_name;
  if (v3)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ CPU with %ld events"), name, -[NSMutableArray count](self->_events, "count"), v6);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%@) CPU with %ld events"), name, self->_lookupName, -[NSMutableArray count](self->_events, "count"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (DTKPCPU)initWithName:(id)a3 database:(kpep_db *)a4
{
  id v6;
  DTKPCPU *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *lookupName;
  uint64_t v14;
  NSMutableArray *events;
  void *v16;
  uint64_t v17;
  NSString *name;
  size_t count;
  uint64_t v21;
  objc_super v22;
  _DWORD buf[3];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DTKPCPU;
  v7 = -[DTKPCPU init](&v22, sel_init);
  if (v7)
  {
    v8 = (void *)sDTKPLogClient;
    if (os_log_type_enabled((os_log_t)sDTKPLogClient, OS_LOG_TYPE_INFO))
    {
      v9 = objc_retainAutorelease(v6);
      v10 = v8;
      v11 = objc_msgSend(v9, "UTF8String");
      buf[0] = 136315138;
      *(_QWORD *)&buf[1] = v11;
      _os_log_impl(&dword_222B17000, v10, OS_LOG_TYPE_INFO, "DTKPCPU: Loading KPEP database for %s", (uint8_t *)buf, 0xCu);

    }
    if (!a4)
      sub_222BC7144();
    v12 = objc_msgSend(v6, "copy");
    lookupName = v7->_lookupName;
    v7->_lookupName = (NSString *)v12;

    v7->_kpepDB = a4;
    v14 = objc_opt_new();
    events = v7->_events;
    v7->_events = (NSMutableArray *)v14;

    v16 = (void *)objc_opt_new();
    v21 = 0;
    if (kpep_db_name())
    {
      v17 = -[NSString copy](v7->_lookupName, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v21);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    name = v7->_name;
    v7->_name = (NSString *)v17;

    count = 0;
    if (kpep_db_events_count())
    {
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", 0, 4294966496, CFSTR("Error fetching events count from counters database."));

      v7 = 0;
    }

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_kpepDB)
  {
    kpep_db_free();
    self->_kpepDB = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)DTKPCPU;
  -[DTKPCPU dealloc](&v3, sel_dealloc);
}

- (kpep_db)kpepDB
{
  return self->_kpepDB;
}

- (id)eventFromName:(id)a3
{
  id v4;
  NSMutableArray *events;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_222B73E6C;
  v16 = sub_222B73E7C;
  v17 = 0;
  events = self->_events;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_222B73E84;
  v9[3] = &unk_24EB2A310;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](events, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_fixupAlias:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CORE_ACTIVE_CYCLE")))
    return CFSTR("Cycles");
  else
    return 0;
}

- (id)eventFromNameOrAlias:(id)a3
{
  id v4;
  NSMutableArray *events;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_222B73E6C;
  v21 = sub_222B73E7C;
  v22 = 0;
  events = self->_events;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = sub_222B74070;
  v14 = &unk_24EB2A310;
  v6 = v4;
  v15 = v6;
  v16 = &v17;
  -[NSMutableArray enumerateObjectsUsingBlock:](events, "enumerateObjectsUsingBlock:", &v11);
  v7 = (void *)v18[5];
  if (!v7)
  {
    -[DTKPCPU _fixupAlias:](self, "_fixupAlias:", v6, v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[DTKPCPU eventFromNameOrAlias:](self, "eventFromNameOrAlias:", v9);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
    v7 = (void *)v18[5];
  }
  v8 = v7;
LABEL_5:

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)allAliasAndNameStrings
{
  void *v3;
  NSMutableArray *events;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  events = self->_events;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_222B74254;
  v10[3] = &unk_24EB2A338;
  v11 = v3;
  v5 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](events, "enumerateObjectsUsingBlock:", v10);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:selector:", CFSTR("self"), 1, sel_localizedCaseInsensitiveCompare_);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mnemonicToAliasMapping
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_events;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "alias", (_QWORD)v16);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v9, "alias");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v14);

          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lookupName, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
