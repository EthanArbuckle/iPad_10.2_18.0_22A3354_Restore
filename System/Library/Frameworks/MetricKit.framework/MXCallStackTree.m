@implementation MXCallStackTree

- (MXCallStackTree)initWithThreadArray:(id)a3 aggregatedByProcess:(BOOL)a4
{
  id v7;
  MXCallStackTree *v8;
  MXCallStackTree *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXCallStackTree;
  v8 = -[MXCallStackTree init](&v11, sel_init);
  if (v8)
  {
    if (!objc_msgSend(v7, "count"))
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v8->_callStackThreads, a3);
    v8->_callStackPerThread = !a4;
  }
  v9 = v8;
LABEL_6:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *callStackThreads;
  id v5;

  callStackThreads = self->_callStackThreads;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", callStackThreads, CFSTR("callStacks"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_callStackPerThread, CFSTR("callStackPerThread"));

}

- (MXCallStackTree)initWithCoder:(id)a3
{
  id v4;
  MXCallStackTree *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *callStackThreads;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXCallStackTree;
  v5 = -[MXCallStackTree init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("callStacks"));
    v9 = objc_claimAutoreleasedReturnValue();
    callStackThreads = v5->_callStackThreads;
    v5->_callStackThreads = (NSArray *)v9;

    v5->_callStackPerThread = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("callStackPerThread"));
  }

  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  id v5;
  NSArray *callStackThreads;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_callStackPerThread);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("callStackPerThread"));

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  callStackThreads = self->_callStackThreads;
  if (callStackThreads)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = callStackThreads;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "toDictionary", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (!self->_callStackPerThread)
          {
            v14 = (void *)objc_msgSend(v12, "mutableCopy");
            objc_msgSend(v14, "removeObjectForKey:", CFSTR("threadAttributed"));

            v13 = v14;
          }
          objc_msgSend(v5, "addObject:", v13);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("callStacks"));
  }

  return v3;
}

- (NSData)JSONRepresentation
{
  void *v2;
  void *v3;
  id v5;

  -[MXCallStackTree toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSArray)callStackThreads
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)callStackPerThread
{
  return self->_callStackPerThread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callStackThreads, 0);
}

@end
