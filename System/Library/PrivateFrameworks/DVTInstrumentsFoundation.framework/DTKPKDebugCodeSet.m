@implementation DTKPKDebugCodeSet

- (DTKPKDebugCodeSet)init
{
  DTKPKDebugCodeSet *v2;
  uint64_t v3;
  NSMutableSet *kdebugCodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DTKPKDebugCodeSet;
  v2 = -[DTKPKDebugCodeSet init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    kdebugCodes = v2->_kdebugCodes;
    v2->_kdebugCodes = (NSMutableSet *)v3;

  }
  return v2;
}

- (DTKPKDebugCodeSet)initWithCodes:(id)a3
{
  id v4;
  DTKPKDebugCodeSet *v5;
  uint64_t v6;
  NSMutableSet *kdebugCodes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKPKDebugCodeSet;
  v5 = -[DTKPKDebugCodeSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    kdebugCodes = v5->_kdebugCodes;
    v5->_kdebugCodes = (NSMutableSet *)v6;

  }
  return v5;
}

- (DTKPKDebugCodeSet)initWithLegacyCodes:(id)a3
{
  DTKPKDebugCodeSet *v3;
  DTKPKDebugCodeSet *v4;

  v3 = -[DTKPKDebugCodeSet initWithCodes:](self, "initWithCodes:", a3);
  v4 = v3;
  if (v3)
    -[DTKPKDebugCodeSet convertLegacyCodes](v3, "convertLegacyCodes");
  return v4;
}

- (void)convertLegacyCodes
{
  void *v3;
  NSMutableSet *kdebugCodes;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_222B92550;
  v10 = sub_222B92560;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  kdebugCodes = self->_kdebugCodes;
  v11 = v3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_222B92568;
  v5[3] = &unk_24EB28628;
  v5[4] = &v6;
  -[NSMutableSet enumerateObjectsUsingBlock:](kdebugCodes, "enumerateObjectsUsingBlock:", v5);
  objc_storeStrong((id *)&self->_kdebugCodes, (id)v7[5]);
  _Block_object_dispose(&v6, 8);

}

- (id)description
{
  void *v3;
  NSMutableSet *kdebugCodes;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("KDebugCodeSet:"));
  kdebugCodes = self->_kdebugCodes;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B92658;
  v7[3] = &unk_24EB2AD80;
  v5 = v3;
  v8 = v5;
  -[NSMutableSet enumerateObjectsUsingBlock:](kdebugCodes, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (void)addCodeSet:(id)a3
{
  id v4;

  objc_msgSend(a3, "kdebugCodes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTKPKDebugCodeSet addCodes:](self, "addCodes:", v4);

}

- (void)addCodes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_222B927F8;
  v3[3] = &unk_24EB2AD80;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)addClass:(unsigned int)a3
{
  NSMutableSet *kdebugCodes;
  id v4;

  kdebugCodes = self->_kdebugCodes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a3 << 24) | 0xFFFFFC);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](kdebugCodes, "addObject:", v4);

}

- (void)addClass:(unsigned int)a3 subclassID:(unsigned int)a4
{
  NSMutableSet *kdebugCodes;
  id v5;

  kdebugCodes = self->_kdebugCodes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a3 << 24) | (a4 << 16) | 0xFFFC);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](kdebugCodes, "addObject:", v5);

}

- (void)addClass:(unsigned int)a3 subclassID:(unsigned int)a4 code:(unsigned int)a5
{
  NSMutableSet *kdebugCodes;
  id v6;

  kdebugCodes = self->_kdebugCodes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a3 << 24) | (a4 << 16) | (4 * (a5 & 0x3FFF)));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](kdebugCodes, "addObject:", v6);

}

- (BOOL)containsClass:(unsigned int)a3
{
  NSMutableSet *kdebugCodes;
  void *v5;
  char v6;
  NSMutableSet *v7;
  void *v8;

  kdebugCodes = self->_kdebugCodes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a3 << 24) | 0xFFFFFC);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](kdebugCodes, "containsObject:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = self->_kdebugCodes;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 4294967292);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSMutableSet containsObject:](v7, "containsObject:", v8);

  }
  return v6;
}

- (BOOL)containsClass:(unsigned int)a3 subclassID:(unsigned int)a4
{
  NSMutableSet *kdebugCodes;
  void *v8;
  char v9;
  NSMutableSet *v10;
  void *v11;
  NSMutableSet *v12;
  void *v13;
  NSMutableSet *v14;
  void *v15;

  kdebugCodes = self->_kdebugCodes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a4 << 16) & 0xFF0000 | (a3 << 24) | 0xFFFC);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](kdebugCodes, "containsObject:", v8) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = self->_kdebugCodes;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a3 << 24) | 0xFFFFFC);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](v10, "containsObject:", v11) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v12 = self->_kdebugCodes;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a4 << 16) | 0xFF00FFFC);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSMutableSet containsObject:](v12, "containsObject:", v13) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v14 = self->_kdebugCodes;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 4294967292);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSMutableSet containsObject:](v14, "containsObject:", v15);

      }
    }

  }
  return v9;
}

- (id)legacyXML
{
  void *v3;
  NSMutableSet *kdebugCodes;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("<events>"));
  kdebugCodes = self->_kdebugCodes;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B92B4C;
  v7[3] = &unk_24EB2AD80;
  v5 = v3;
  v8 = v5;
  -[NSMutableSet enumerateObjectsUsingBlock:](kdebugCodes, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(v5, "appendString:", CFSTR("</events>"));

  return v5;
}

- (char)createFilterMask:(BOOL)a3
{
  _BOOL4 v3;
  char *v5;
  void *v6;
  _QWORD v8[5];

  v3 = a3;
  v5 = (char *)malloc_type_calloc(0x2000uLL, 1uLL, 0x100004077774924uLL);
  -[DTKPKDebugCodeSet kdebugCodes](self, "kdebugCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_222B92CCC;
  v8[3] = &unk_24EB2ADA0;
  v8[4] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  if (v3)
    kperf_typefilter_invert();
  return v5;
}

- (kperf_kdebug_filter)createKperfFilter
{
  kperf_kdebug_filter *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (kperf_kdebug_filter *)kperf_kdebug_filter_create();
  -[DTKPKDebugCodeSet kdebugCodes](self, "kdebugCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B92DC8;
  v6[3] = &unk_24EB2ADA0;
  v6[4] = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  return v3;
}

+ (void)releaseFilterMask:(char *)a3
{
  if (a3)
    free(a3);
}

+ (void)releaseKperfFilter:(kperf_kdebug_filter *)a3
{
  JUMPOUT(0x227679800);
}

- (NSMutableSet)kdebugCodes
{
  return self->_kdebugCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kdebugCodes, 0);
}

@end
