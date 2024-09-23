@implementation DACLifecycleChangelist

- (id)_initWithLifecycleInfoArray:(id)a3
{
  id v5;
  DACLifecycleChangelist *v6;
  DACLifecycleChangelist *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DACLifecycleChangelist;
  v6 = -[DACLifecycleChangelist init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_infos, a3);

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __37__DACLifecycleChangelist_description__block_invoke;
  v10 = &unk_24ED13558;
  v4 = v3;
  v11 = v4;
  -[DACLifecycleChangelist enumerate:](self, "enumerate:", &v7);
  if (!objc_msgSend(v4, "length"))
    objc_msgSend(v4, "appendString:", CFSTR(" empty"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Changelist:%@"), v4, v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __37__DACLifecycleChangelist_description__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\t%@"), a2);
  return 1;
}

- (void)enumerate:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  NSArray *infos;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  if (self)
    infos = self->_infos;
  else
    infos = 0;
  v6 = infos;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v9)
        objc_enumerationMutation(v6);
      if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)))
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (id)lifecycleInfoForActivity:(id)a3
{
  id v4;
  NSArray *infos;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  infos = self->_infos;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__DACLifecycleChangelist_lifecycleInfoForActivity___block_invoke;
  v10[3] = &unk_24ED13580;
  v6 = v4;
  v11 = v6;
  v7 = -[NSArray indexOfObjectPassingTest:](infos, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_infos, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __51__DACLifecycleChangelist_lifecycleInfoForActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (unint64_t)count
{
  return -[NSArray count](self->_infos, "count");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *infos;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", 1, CFSTR("version"));
  if (self)
    infos = self->_infos;
  else
    infos = 0;
  objc_msgSend(v5, "encodeObject:forKey:", infos, CFSTR("infos"));

}

- (DACLifecycleChangelist)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  DACLifecycleChangelist *v8;
  DACLifecycleChangelist *v9;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) < 1)
    goto LABEL_5;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("infos"));
  v8 = (DACLifecycleChangelist *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {

    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = -[DACLifecycleChangelist _initWithLifecycleInfoArray:](self, "_initWithLifecycleInfoArray:", v8);
  self = v8;
LABEL_6:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infos, 0);
}

@end
