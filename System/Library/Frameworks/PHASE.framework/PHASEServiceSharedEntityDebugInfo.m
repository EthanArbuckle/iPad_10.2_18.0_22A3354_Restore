@implementation PHASEServiceSharedEntityDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[PHASEServiceSharedEntityDebugInfo sharedListener](self, "sharedListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[PHASEServiceSharedEntityDebugInfo sessionSharedRoots](self, "sessionSharedRoots");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionSharedRoots");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharedListener, CFSTR("sharedListener"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionSharedRoots, CFSTR("sessionSharedRoots"));

}

- (PHASEServiceSharedEntityDebugInfo)initWithCoder:(id)a3
{
  id v4;
  PHASEServiceSharedEntityDebugInfo *v5;
  uint64_t v6;
  PHASESharedListenerDebugInfo *sharedListener;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *sessionSharedRoots;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHASEServiceSharedEntityDebugInfo;
  v5 = -[PHASEServiceSharedEntityDebugInfo init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedListener"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharedListener = v5->_sharedListener;
    v5->_sharedListener = (PHASESharedListenerDebugInfo *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("sessionSharedRoots"));
    v13 = objc_claimAutoreleasedReturnValue();
    sessionSharedRoots = v5->_sessionSharedRoots;
    v5->_sessionSharedRoots = (NSDictionary *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<PHASEServiceSharedEntityDebugInfo:%p sharedListener=%@, sessionSharedRoots:"), self, self->_sharedListener);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_sessionSharedRoots;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_sessionSharedRoots, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\r%@ : %@"), v8, v9, (_QWORD)v12);

      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void)setSharedListener:(id)a3
{
  objc_storeStrong((id *)&self->_sharedListener, a3);
}

- (void)setSessionSharedRoots:(id)a3
{
  NSDictionary *v4;
  NSDictionary *sessionSharedRoots;
  id v6;

  v6 = a3;
  v4 = (NSDictionary *)objc_msgSend(v6, "copy");
  sessionSharedRoots = self->_sessionSharedRoots;
  self->_sessionSharedRoots = v4;

}

- (PHASESharedListenerDebugInfo)sharedListener
{
  return self->_sharedListener;
}

- (NSDictionary)sessionSharedRoots
{
  return self->_sessionSharedRoots;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionSharedRoots, 0);
  objc_storeStrong((id *)&self->_sharedListener, 0);
}

@end
